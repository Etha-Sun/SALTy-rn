"""Trusted, fixed-command proof gateway. No model-controlled shell or WP options.

Landlock confines writes and allows reads only from repository/toolchain roots;
seccomp permits only Unix sockets and denies path truncate. The model sees only
read_file/write_proof/start_verify/poll/cancel, with narrower task-file reads.
Results are candidate evidence, never automatic admission or merge decisions.
"""
import ctypes
import errno
import hashlib
import json
import os
from pathlib import Path
import platform
import re
import runpy
import signal
import subprocess
import sys
import tempfile
import threading
import time


def digest(path):
    return hashlib.sha256(Path(path).read_bytes()).hexdigest()


def dump(path, value):
    Path(path).write_text(json.dumps(value, indent=2) + "\n")


def confined(root, name):
    root = Path(root).resolve()
    if not isinstance(name, str) or not Path(name).parts:
        raise ValueError("A nonempty relative task path is required")
    candidate = root / name
    if Path(name).is_absolute() or ".." in Path(name).parts:
        raise ValueError("Relative, non-traversing task paths only")
    current = root
    for part in Path(name).parts:
        current /= part
        if current.is_symlink():
            raise ValueError("Symlinks are not worker inputs")
    if not candidate.resolve().is_relative_to(root):
        raise ValueError("Path outside task")
    return candidate


def sandbox(writable, readonly=()):
    """Fail closed unless Linux x86_64 Landlock and seccomp both install."""
    if platform.system() != "Linux" or platform.machine() != "x86_64":
        raise RuntimeError("Unsupported sandbox platform")
    libc = ctypes.CDLL(None, use_errno=True)

    def checked(result, label):
        if result < 0:
            raise OSError(ctypes.get_errno(), label)
        return result

    abi = checked(libc.syscall(444, 0, 0, 1), "Landlock ABI")
    # ABI1 handles write-open, removals and all creations. Later truncate rights
    # are also handled when available; seccomp covers path truncate on ABI1/2.
    rights = sum(1 << bit for bit in range(13))
    if abi >= 2:
        rights |= 1 << 13
    if abi >= 3:
        rights |= 1 << 14

    class Ruleset(ctypes.Structure):
        _fields_ = [("handled_access_fs", ctypes.c_uint64)]

    class Rule(ctypes.Structure):
        _pack_ = 1
        _fields_ = [("allowed_access", ctypes.c_uint64), ("parent_fd", ctypes.c_int)]

    rules = Ruleset(rights)
    fd = checked(libc.syscall(444, ctypes.byref(rules), ctypes.sizeof(rules), 0), "Landlock create")
    try:
        read_rights = (1 << 0) | (1 << 2) | (1 << 3)
        for path in readonly:
            path = Path(path).resolve()
            if not path.exists():
                continue
            parent = os.open(path, os.O_PATH | os.O_CLOEXEC)
            try:
                rule = Rule(read_rights if path.is_dir() else read_rights & ~(1 << 3), parent)
                checked(libc.syscall(445, fd, 1, ctypes.byref(rule), 0), "Landlock read rule")
            finally:
                os.close(parent)
        for path in writable:
            parent = os.open(path, os.O_PATH | os.O_CLOEXEC)
            try:
                rule = Rule(rights, parent)
                checked(libc.syscall(445, fd, 1, ctypes.byref(rule), 0), "Landlock rule")
            finally:
                os.close(parent)
        parent = os.open("/dev/null", os.O_PATH | os.O_CLOEXEC)
        try:
            rule = Rule((1 << 1) | (1 << 2), parent)
            checked(libc.syscall(445, fd, 1, ctypes.byref(rule), 0), "Landlock null")
        finally:
            os.close(parent)
        checked(libc.prctl(38, 1, 0, 0, 0), "no_new_privs")
        checked(libc.syscall(446, fd, 0), "Landlock restrict")
    finally:
        os.close(fd)

    class Filter(ctypes.Structure):
        _fields_ = [("code", ctypes.c_ushort), ("jt", ctypes.c_ubyte),
                    ("jf", ctypes.c_ubyte), ("k", ctypes.c_uint)]

    class Program(ctypes.Structure):
        _fields_ = [("len", ctypes.c_ushort), ("filter", ctypes.POINTER(Filter))]

    # Reject other audit architectures and x32 syscall variants as well.
    instructions = [
        (0x20, 0, 0, 4), (0x15, 1, 0, 0xC000003E), (0x06, 0, 0, 0x80000000),
        (0x20, 0, 0, 0), (0x35, 0, 1, 0x40000000), (0x06, 0, 0, 0x00050000 | errno.EPERM),
        (0x15, 0, 1, 76), (0x06, 0, 0, 0x00050000 | errno.EPERM),
        (0x15, 0, 3, 41), (0x20, 0, 0, 16),
        (0x15, 1, 0, 1), (0x06, 0, 0, 0x00050000 | errno.EPERM),
        (0x06, 0, 0, 0x7FFF0000),
    ]
    filters = (Filter * len(instructions))(*(Filter(*i) for i in instructions))
    program = Program(len(filters), filters)
    checked(libc.prctl(22, 2, ctypes.byref(program), 0, 0), "seccomp")
    return {"landlock_abi": abi, "writes": [str(p) for p in writable],
            "sockets": "AF_UNIX only", "readonly": [str(p) for p in readonly]}


class Gateway:
    def __init__(self, task_root, semaphore=None):
        self.root = Path(task_root).resolve()
        self.manifest = self.root / "task.json"
        self.manifest_hash = digest(self.manifest)
        self.config = json.loads(self.manifest.read_text())
        self.repo = Path(self.config["repo_root"]).resolve()
        if not self.root.is_relative_to(self.repo):
            raise ValueError("Task must be inside repository")
        self.semaphore = semaphore or threading.BoundedSemaphore(1)
        self.active = {}
        self.lock = threading.Lock()
        (self.root / "draft").mkdir(exist_ok=True)
        (self.root / "attempts").mkdir(exist_ok=True)

    def read_file(self, path, offset=0, limit=16000):
        if not isinstance(offset, int) or not isinstance(limit, int) or offset < 0 or not 0 < limit <= 32000:
            raise ValueError("Invalid read bounds")
        source = confined(self.root, path)
        if path != "README.zh-CN.md" and Path(path).parts[0] not in {"inputs", "docs", "draft", "attempts"}:
            raise ValueError("Only curated inputs, docs, proof and attempt evidence are readable")
        if not source.is_file() or source.stat().st_size > 16 * 1024 * 1024:
            raise ValueError("Not a bounded text file")
        return source.read_text()[offset:offset + limit]

    def write_proof(self, text):
        if not isinstance(text, str) or len(text.encode()) > self.config.get("max_proof_bytes", 2 * 1024 * 1024):
            raise ValueError("Proof exceeds size limit")
        path = confined(self.root, "draft/proof.patch")
        with tempfile.NamedTemporaryFile(mode="w", dir=path.parent, delete=False) as temporary:
            temporary.write(text)
        os.replace(temporary.name, path)
        return {"sha256": digest(path), "bytes": path.stat().st_size}

    def _pins(self):
        if digest(self.manifest) != self.manifest_hash:
            raise RuntimeError("Task policy changed")
        case = confined(self.repo, self.config["case"])
        if digest(case / "frozen.json") != self.config["frozen_sha256"]:
            raise RuntimeError("Frozen manifest changed")
        data = json.loads((case / "frozen.json").read_text())
        for item in data["files"].values():
            if digest(confined(self.repo, item["path"])) != item["sha256"]:
                raise RuntimeError("Frozen input changed")
        tools = dict(self.config["tool_hashes"])
        tools[self.config["runner"]] = self.config["runner_sha256"]
        for name, expected in tools.items():
            if Path(name).is_absolute():
                name = str(Path(name).relative_to(self.repo))
            if digest(confined(self.repo, name)) != expected:
                raise RuntimeError("Trusted checker changed: " + name)
        return data

    def start_verify(self, mode="focus"):
        if mode not in {"focus", "full"}:
            raise ValueError("Only fixed focus or full verification is supported")
        if mode == "focus" and not (self.config.get("diagnostic_functions") or self.config.get("diagnostic_properties")):
            raise ValueError("No trusted diagnostic scope configured")
        with self.lock:
            self._pins()
            acquired = self.semaphore.acquire(blocking=False)
            try:
                proof = confined(self.root, "draft/proof.patch").read_bytes()
                number = 1
                while (self.root / "attempts" / ("%04d" % number)).exists():
                    number += 1
                attempt_id = "%04d" % number
                attempt = self.root / "attempts" / attempt_id
                attempt.mkdir()
                (attempt / "tmp").mkdir()
                (attempt / "logs").mkdir()
                (attempt / "proof.patch").write_bytes(proof)
                frozen = self._pins()
                frozen["proof_patches"] = [str((attempt / "proof.patch").relative_to(self.repo))]
                dump(attempt / "frozen.json", frozen)
                launch = dict(self.config, mode=mode, task_manifest_sha256=self.manifest_hash,
                              attempt=str(attempt), attempt_frozen_sha256=digest(attempt / "frozen.json"),
                              proof_sha256=digest(attempt / "proof.patch"))
                dump(attempt / "launch.json", launch)
                self.active[attempt_id] = {"process": None, "started": None, "released": not acquired}
                if acquired:
                    self._launch(attempt_id)
                return {"attempt": attempt_id, "state": "running" if acquired else "queued"}
            except Exception:
                if acquired:
                    self.semaphore.release()
                raise

    def _launch(self, attempt_id):
        self._pins()
        attempt = self.root / "attempts" / attempt_id
        env = {"PATH": "/home/ycsun/verus-x86-linux:" + os.defpath,
               "HOME": str(attempt / "tmp"), "TMPDIR": str(attempt / "tmp"),
               "LANG": "C.UTF-8", "PYTHONDONTWRITEBYTECODE": "1"}
        with (attempt / "supervisor.log").open("w") as out:
            process = subprocess.Popen([sys.executable, str(Path(__file__).resolve()), "--child",
                                        str(attempt / "launch.json")], cwd=self.repo, env=env,
                                       stdout=out, stderr=subprocess.STDOUT, start_new_session=True)
        self.active[attempt_id].update(process=process, started=time.monotonic(), released=False)
        watchdog = threading.Timer(self.config["wall_seconds"] + 1, self.poll, args=(attempt_id,))
        watchdog.daemon = True
        watchdog.start()

    def _stop(self, item):
        if item["process"] is None:
            return
        try:
            os.killpg(item["process"].pid, signal.SIGKILL)
        except ProcessLookupError:
            pass
        item["process"].wait(timeout=10)

    def poll(self, attempt_id):
        if not re.fullmatch(r"[0-9]{4}", attempt_id):
            raise ValueError("Invalid attempt id")
        with self.lock:
            item = self.active.get(attempt_id)
            status = confined(self.root, "attempts/" + attempt_id + "/status.json")
            if item and item["process"] is None and not status.exists():
                if not self.semaphore.acquire(blocking=False):
                    return {"attempt": attempt_id, "state": "queued"}
                try:
                    self._launch(attempt_id)
                except Exception:
                    self.semaphore.release()
                    raise
            if item and item["process"] is not None and item["process"].poll() is None:
                if time.monotonic() - item["started"] > self.config["wall_seconds"]:
                    self._stop(item)
                    dump(self.root / "attempts" / attempt_id / "status.json", {"state": "timeout"})
                else:
                    return {"attempt": attempt_id, "state": "running"}
            if item and not item["released"]:
                self.semaphore.release()
                item["released"] = True
            if status.exists():
                return dict(json.loads(status.read_text()), attempt=attempt_id)
            return {"attempt": attempt_id, "state": "failed", "reason": "No completed child status",
                    "exit": item["process"].returncode if item and item["process"] else None}

    def cancel(self, attempt_id):
        if attempt_id not in self.active:
            raise ValueError("Unknown active attempt")
        with self.lock:
            item = self.active[attempt_id]
            status = self.root / "attempts" / attempt_id / "status.json"
            if item["process"] is not None and item["process"].poll() is not None and status.exists():
                if not item["released"]:
                    self.semaphore.release()
                    item["released"] = True
                return dict(json.loads(status.read_text()), attempt=attempt_id)
            if item["process"] is None and status.exists():
                return dict(json.loads(status.read_text()), attempt=attempt_id)
            self._stop(item)
            if not item["released"]:
                self.semaphore.release()
                item["released"] = True
            dump(status, {"state": "cancelled"})
        return self.poll(attempt_id)


def child(launch_path):
    config = json.loads(Path(launch_path).read_text())
    attempt, repo = Path(config["attempt"]), Path(config["repo_root"])
    status = attempt / "status.json"
    prepare = True
    try:
        readonly = [repo, "/usr", "/lib", "/lib64", "/bin", "/nix",
                    "/etc/ld.so.cache", "/etc/ld.so.conf", "/etc/ld.so.conf.d", "/etc/localtime",
                    "/etc/passwd", "/etc/group", "/etc/nsswitch.conf",
                    "/dev/urandom", "/dev/random", "/dev/zero", "/proc/cpuinfo", "/proc/meminfo",
                    "/home/ycsun/anaconda3", "/home/ycsun/verus-x86-linux"]
        readonly += config.get("readonly_toolchain_roots", [])
        dump(attempt / "sandbox.json", sandbox([attempt], readonly))
        # v15 overrides resources inside its invoke(). Wrap the original system
        # runner so only parallelism changes after that override, including its
        # impossible-goal and global-lemma checks. All other arguments stay fixed.
        original = subprocess.run

        def fixed_run(command, *args, **kwargs):
            command = list(command)
            if "-wp" in command:
                command[command.index("-wp-par") + 1] = str(config.get("wp_par", 16))
                report = Path(command[command.index("-wp-report-json") + 1]).name
                if config["mode"] == "focus" and report == "verify01.json":
                    # Controls and @lemma runs never receive narrowed scope.
                    for flag in ("-wp-fct", "-wp-skip-fct", "-wp-prop"):
                        if flag in command:
                            at = command.index(flag)
                            del command[at:at + 2]
                    if config.get("diagnostic_functions"):
                        command += ["-wp-fct", ",".join(config["diagnostic_functions"])]
                    if config.get("diagnostic_properties"):
                        command += ["-wp-prop", ",".join(config["diagnostic_properties"])]
                    if config.get("diagnostic_inline_calls") and "-inline-calls" not in command:
                        calls = ",".join(config["diagnostic_inline_calls"])
                        command += ["-inline-calls", calls, "-inline-stmt-contracts", "-remove-inlined", calls]
                with (attempt / "actual-commands.jsonl").open("a") as log:
                    log.write(json.dumps(command) + "\n")
            result = original(command, *args, **kwargs)
            if "-wp" in command:
                report_path = Path(command[command.index("-wp-report-json") + 1])
                if report_path.name == "verify01.json" and report_path.exists():
                    # Capture before the pinned runner appends global-lemma rows.
                    (attempt / "main-report.json").write_bytes(report_path.read_bytes())
            return result

        subprocess.run = fixed_run
        base = [str(repo / config["runner"]), str(attempt), "--frozen-sha256",
                config["attempt_frozen_sha256"], "--framac", config["framac"],
                "--prover-bin", config["prover_bin"]]
        sys.path.insert(0, str(Path(base[0]).parent))
        for name, prepare in [("guard01", True), ("verify01", False)]:
            # The resource runner monkeypatches the shared subprocess module.
            # Reset between phases to avoid nesting the first phase's closure.
            subprocess.run = fixed_run
            sys.argv = base + ["--name", name] + (["--prepare"] if prepare else [])
            try:
                runpy.run_path(base[0], run_name="__main__")
                code = 0
            except SystemExit as exit_result:
                code = exit_result.code or 0
            if code and (prepare or config["mode"] == "full"):
                dump(status, {"state": "guard_rejected" if prepare else "incomplete", "exit": code})
                return
            guard = attempt / ".build" / name / "guard.json"
            if not guard.exists() or not json.loads(guard.read_text()).get("passed"):
                raise RuntimeError("Missing successful source guard")
        summary = json.loads((attempt / "logs/verify01-summary.json").read_text())
        focus = config["mode"] == "focus"
        rows = json.loads((attempt / "logs/verify01.json").read_text())
        main_rows = json.loads((attempt / "main-report.json").read_text())
        accepted = bool(summary.get("model_control", {}).get("accepted"))
        valid = bool(summary.get("unchanged") and summary.get("model_inputs_unchanged") and accepted)
        functions = config.get("diagnostic_functions", []) if focus else []
        properties = config.get("diagnostic_properties", []) if focus else []
        missing_functions = [f for f in functions if not any(r.get("function") == f for r in main_rows)]
        missing_properties = [p for p in properties if not any(p in r.get("property", "") or p in r.get("goal", "") for r in main_rows)]
        diagnostic_passed = (valid and bool(main_rows) and not missing_functions and not missing_properties
                             and all(r.get("passed") for r in rows))
        dump(status, {"state": ("diagnostic_passed" if diagnostic_passed else "incomplete") if focus
                      else ("complete" if summary.get("complete") else "incomplete"),
                      "scope": "diagnostic" if focus else "full", "complete_kernel": bool(not focus and summary.get("complete")),
                      "obligations": {"passed": sum(bool(r.get("passed")) for r in rows), "total": len(rows)},
                      "main_obligations": {"passed": sum(bool(r.get("passed")) for r in main_rows), "total": len(main_rows)},
                      "missing_diagnostic_functions": missing_functions, "missing_diagnostic_properties": missing_properties,
                      "summary": "logs/verify01-summary.json", "admitted": False})
    except BaseException as error:
        dump(status, {"state": "guard_rejected" if prepare else "failed",
                      "reason": type(error).__name__ + ": " + str(error)})


if __name__ == "__main__":
    if len(sys.argv) == 3 and sys.argv[1] == "--child":
        child(sys.argv[2])
    else:
        raise SystemExit("Gateway is imported by the trusted supervisor; no shell interface")
