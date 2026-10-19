"""Bounded body checks; no model qualification or kernel acceptance."""
from pathlib import Path
import hashlib, json, os, re, signal, subprocess, sys, time

HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[4]
BASE = ROOT / 'experiments/shim-c-v2'
FRONT = BASE / 'stage3-byte-fp-front-v21'
run, source = sys.argv[1:3]
assert re.fullmatch(r'[a-zA-Z0-9_-]+', run)
assert source == 'readtriggers.mlw'
out = HERE / run
out.mkdir(exist_ok=False)
sha = lambda p: hashlib.sha256(Path(p).read_bytes()).hexdigest()
lock = FRONT / 'experimental-inputs02.json'
watch = dict(json.loads(lock.read_text())['files'])
for p in (lock, HERE.parent / 'read-inverse09/digits.mlw', HERE.parent / 'read-inverse09/readinverse.mlw', HERE / 'readtriggers.mlw', Path(__file__)):
    watch[str(p)] = sha(p)
assert all(sha(p) == h for p, h in watch.items())
(out / 'inputs.json').write_text(json.dumps(watch, indent=2) + '\n')
cmd = [str(BASE / 'environment-recovery-local/.build/opam/shim-local/bin/why3'),
       'prove', '-L', str(FRONT / 'wp-share/why3'), '-L', str(HERE), '-L', str(HERE.parent / 'read-inverse09'),
       '-a', 'split_vc', '-C', str(FRONT / 'why3-02.conf'),
       '-P', 'CVC5,1.2.1', '-t', '30', '-m', '2048', str(HERE / source)]
record = {'command': cmd, 'inputs_sha256': sha(out / 'inputs.json'),
          'body_source_sha256': sha(HERE / source), 'budget_seconds': 600,
          'model_qualified': False, 'whole_kernel_accepted': False}
(out / 'command.json').write_text(json.dumps(record, indent=2) + '\n')
start = time.monotonic()
with (out / 'run.log').open('x') as log:
    proc = subprocess.Popen(cmd, cwd=ROOT, stdout=log, stderr=subprocess.STDOUT,
                            start_new_session=True)
    try:
        code = proc.wait(timeout=600)
    except subprocess.TimeoutExpired:
        os.killpg(proc.pid, signal.SIGKILL)
        proc.wait()
        code = 124
text = (out / 'run.log').read_text()
verdicts = re.findall(r'Prover result is:\s*([^\n]+)', text)
record.update(exit=code, seconds=time.monotonic()-start, verdicts=verdicts,
              inputs_unchanged=all(sha(p) == h for p, h in watch.items()),
              log_sha256=sha(out / 'run.log'))
(out / 'result.json').write_text(json.dumps(record, indent=2) + '\n')
print(source, code, len(verdicts), record['inputs_unchanged'], flush=True)
