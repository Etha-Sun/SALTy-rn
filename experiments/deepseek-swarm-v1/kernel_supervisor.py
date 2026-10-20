"""One process per kernel; total wall budget includes API, queueing and WP."""
import argparse
import ctypes
import fcntl
import hashlib
import json
import os
from pathlib import Path
import signal
import subprocess
import sys
import threading
import time

HERE = Path(__file__).resolve().parent


def dump(path, value):
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(json.dumps(value, indent=2) + "\n")


def sha(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


class FileSlots:
    """Process-owned solver slot; kernel closes flock on every exit/signal."""
    def __init__(self, directory, count):
        self.directory, self.count, self.held = Path(directory), count, None
        self.directory.mkdir(parents=True, exist_ok=True)
        self.lock = threading.Lock()

    def acquire(self, blocking=False):
        if blocking:
            raise ValueError("Only nonblocking solver slots are supported")
        with self.lock:
            if self.held is not None:
                return False
            for index in range(self.count):
                handle = (self.directory / str(index)).open("a")
                try:
                    fcntl.flock(handle, fcntl.LOCK_EX | fcntl.LOCK_NB)
                    self.held = handle
                    return True
                except BlockingIOError:
                    handle.close()
            return False

    def release(self):
        with self.lock:
            if self.held is None:
                raise RuntimeError("Solver slot not held")
            self.held.close()
            self.held = None


def processes():
    """PID -> (parent, starttime); starttime prevents signaling a reused PID."""
    result = {}
    for entry in Path("/proc").iterdir():
        if not entry.name.isdigit():
            continue
        try:
            fields = (entry / "stat").read_text().rsplit(")", 1)[1].split()
            result[int(entry.name)] = (int(fields[1]), int(fields[19]))
        except (OSError, ValueError, IndexError):
            pass
    return result


def signal_pid(pid, started, signum):
    try:
        fields = (Path("/proc") / str(pid) / "stat").read_text().rsplit(")", 1)[1].split()
        if int(fields[19]) == started:
            os.kill(pid, signum)
    except (ProcessLookupError, FileNotFoundError):
        pass


def descendants(root_pid, known):
    table = processes()
    changed = True
    while changed:
        changed = False
        for pid, (parent, started) in table.items():
            parent_live = parent in known and table.get(parent, (None, None))[1] == known[parent]
            if (pid == root_pid or parent_live) and pid not in known:
                known[pid] = started
                changed = True
    return known


def freeze_tree(root_pid, known):
    descendants(root_pid, known)
    while True:
        previous = set(known)
        for pid, started in list(known.items()):
            signal_pid(pid, started, signal.SIGSTOP)
        descendants(root_pid, known)
        if set(known) == previous:
            break


def begin_termination(process, known):
    """Freeze descendants across sessions; resume only the agent for cleanup."""
    freeze_tree(process.pid, known)
    for pid, started in known.items():
        signal_pid(pid, started, signal.SIGTERM)
    if process.pid in known:
        signal_pid(process.pid, known[process.pid], signal.SIGCONT)


def supervise(tasks, run, command, workers=16, seconds=3600, stop=None, grace=2):
    """command(task) returns a trusted argv, never supplied by a proof worker."""
    stop = stop or threading.Event()
    waiting, active, results, cleaning = list(tasks), {}, [], {}
    while waiting or active:
        while waiting and len(active) < workers and not stop.is_set():
            task = waiting.pop(0)
            started = time.monotonic()  # Covers process startup and source seeding.
            with (run / (task.name + "-supervisor.log")).open("w") as out:
                env = {k: v for k, v in os.environ.items() if k != "DEEPSEEK_API_KEY"}
                process = subprocess.Popen(command(task), env=env, stdout=out,
                                           stderr=subprocess.STDOUT, start_new_session=True)
            active[task.name] = (task, process, started, {})
            dump(run / "agents" / (task.name + ".json"),
                 {"state": "running", "pid": process.pid, "seconds_budget": seconds, "admitted": False})
        for name, (task, process, started, known) in list(active.items()):
            descendants(process.pid, known)
            expired = time.monotonic() - started >= seconds
            if name not in cleaning and (expired or stop.is_set() or process.poll() is not None):
                state = "admin-timeout" if expired else "admin-stopped" if stop.is_set() else "worker-finished"
                # Cleanup also runs after a normally exiting worker, so a new
                # session started by Gateway cannot outlive its owning agent.
                begin_termination(process, known)
                cleaning[name] = (state, time.monotonic() + grace)
            if name in cleaning and (process.poll() is not None or time.monotonic() >= cleaning[name][1]):
                for pid, born in known.items():
                    signal_pid(pid, born, signal.SIGKILL)
                process.wait(timeout=5)
                state = cleaning.pop(name)[0]
                record = {"task": name, "state": state, "seconds": round(time.monotonic() - started, 3),
                          "exit": process.returncode, "proof_failure": False, "admitted": False,
                          "tracked_pids": sorted(known)}
                dump(run / "agents" / (name + ".json"), record)
                dump(run / name / "admin-result.json", record)
                results.append(record)
                del active[name]
        if stop.is_set():
            for task in waiting:
                record = {"task": task.name, "state": "not-started", "admitted": False}
                dump(run / "agents" / (task.name + ".json"), record)
                results.append(record)
            waiting.clear()
        # Grace periods are concurrent: one slow cleanup never gives other
        # agents an extra two seconds of API or proof execution.
        time.sleep(.025)
    dump(run / "finished.json", {"results": results, "admitted": False})
    return results


def run_agent(task, run, stop):
    config = json.loads((run / "parameters.json").read_text())
    key = ""
    try:
        for name, expected in config["runtime_sha256"].items():
            if sha(Path(__file__).resolve().parent / name) != expected:
                raise RuntimeError("Frozen runtime changed: " + name)
        if sha(task / "task.json") != config["task_hashes"][task.name]:
            raise RuntimeError("Task manifest changed after launch freeze")
        key_file = Path(config["key_file"])
        if key_file.stat().st_mode & 0o077:
            raise RuntimeError("API credential must have mode600")
        key = key_file.read_text().strip()
        if not key:
            raise RuntimeError("Empty API credential")
        import run_swarm
        args = argparse.Namespace(**config)
        result = run_swarm.worker(task, key, args, FileSlots(run / "wp-slots", config["wp_jobs"]), stop, run)
        dump(run / task.name / "worker-result.json", result)
    except Exception as error:
        dump(run / task.name / "worker-result.json", {"state": "error", "admitted": False,
             "error": str(error).replace(key, "[REDACTED]") if key else str(error)})


def child(task, run):
    # Keep each agent alive as its own subreaper until its worker thread and all
    # tool descendants are cleaned up. Even a setsid/double-fork tool is adopted
    # here rather than escaping after an intermediate process exits.
    if ctypes.CDLL(None, use_errno=True).prctl(36, 1, 0, 0, 0) != 0:
        raise RuntimeError("Linux child subreaper unavailable")
    stop = threading.Event()
    for sig in (signal.SIGTERM, signal.SIGINT):
        signal.signal(sig, lambda *_: stop.set())
    thread = threading.Thread(target=run_agent, args=(task, run, stop), daemon=True)
    thread.start()
    while thread.is_alive() and not stop.wait(.05):
        pass
    table = processes()
    known = {pid: started for pid, (parent, started) in table.items() if parent == os.getpid()}
    freeze_tree(-1, known)
    for pid, started in known.items():
        signal_pid(pid, started, signal.SIGKILL)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--run", required=True)
    parser.add_argument("--tasks", nargs="*")
    parser.add_argument("--workers", type=int, default=16)
    parser.add_argument("--agent-seconds", type=float, default=3600)
    parser.add_argument("--wp-jobs", type=int, default=8)
    parser.add_argument("--max-turns", type=int, default=128)
    parser.add_argument("--max-verifications", type=int, default=16)
    parser.add_argument("--max-tokens", type=int, default=262144)
    args = parser.parse_args()
    if not (1 <= args.workers <= 16 and 1 <= args.wp_jobs <= 8 and 0 < args.agent_seconds <= 7200
            and 1 <= args.max_turns <= 10000 and 1 <= args.max_verifications <= 64 and 1 <= args.max_tokens <= 393216):
        parser.error("Invalid bounded swarm budget")
    from gateway import confined
    tasks = [confined(HERE / "kernel-tasks", n) for n in args.tasks] if args.tasks else sorted(
        p for p in (HERE / "kernel-tasks").iterdir() if (p / "task.json").is_file())
    if not tasks or len(set(tasks)) != len(tasks) or any(not (t / "task.json").is_file() for t in tasks):
        parser.error("Distinct prepared kernel tasks are required")
    run = confined(HERE / "runs", args.run)
    run.mkdir(parents=True)
    runtime = run / "runtime"
    runtime.mkdir()
    hashes = {}
    for name in ("kernel_supervisor.py", "run_swarm.py", "gateway.py"):
        source = HERE / name
        (runtime / name).write_bytes(source.read_bytes())
        hashes[name] = sha(source)
    for task in tasks:
        (runtime / (task.name + "-task.json")).write_bytes((task / "task.json").read_bytes())
    config = dict(vars(args), task_hashes={t.name: sha(t / "task.json") for t in tasks},
                  runtime_sha256=hashes, key_file=str(Path.home() / ".config/deepseek/api-key"),
                  wp_par=16, admitted=False, supervisor_pid=os.getpid())
    dump(run / "parameters.json", config)
    stop = threading.Event()
    for sig in (signal.SIGINT, signal.SIGTERM):
        signal.signal(sig, lambda *_: stop.set())
    command = lambda task: [sys.executable, str(runtime / "kernel_supervisor.py"), "--child", str(task), str(run)]
    supervise(tasks, run, command, args.workers, args.agent_seconds, stop)


if __name__ == "__main__":
    if len(sys.argv) == 4 and sys.argv[1] == "--child":
        child(Path(sys.argv[2]), Path(sys.argv[3]))
    else:
        main()
