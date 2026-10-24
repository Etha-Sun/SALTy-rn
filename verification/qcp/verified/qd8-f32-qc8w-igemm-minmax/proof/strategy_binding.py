#!/usr/bin/env python3
"""Generate strategy obligations and bind their exact bytes to checked sources."""
from pathlib import Path
import argparse, hashlib, json, re, signal, subprocess, time, os

ROOT = Path(__file__).resolve().parents[1]
p = argparse.ArgumentParser()
p.add_argument('--run', required=True)
p.add_argument('--strategy', choices=['copy','indirection'], default='copy')
p.add_argument('--jobs', type=int, default=32)
a = p.parse_args()
assert a.jobs == 32 and re.fullmatch(r'[A-Za-z0-9_-]+', a.run)
out = ROOT / '.build' / a.run / ('strategy-'+a.strategy)
out.mkdir(parents=True, exist_ok=False)
sha = lambda f: hashlib.sha256(f.read_bytes()).hexdigest()
tool = Path('/tmp/qcp214-src/linux-binary/StrategyCheck')
checked = ROOT / ('proof/coq/'+('Qd8API' if a.strategy=='copy' else 'Qd8Indirect')+'/'+a.strategy+'_strategy_goal.v')
files = [f for f in (ROOT / 'shim').rglob('*') if f.is_file()]
files += [checked, Path(__file__)]
inputs = {str(f.relative_to(ROOT)): sha(f) for f in files}
cmd = ['/usr/bin/prlimit', '--as=17179869184', '--cpu=7200', '--',
       str(tool), '--input-file', str(ROOT / ('shim/'+a.strategy+'.strategies')),
       '--coq-output-dir', str(out), '--coq-logic-path', ('Qd8API' if a.strategy=='copy' else 'Qd8Indirect'),
       '--arch=64', '--endian=little', '--no-float-finite-vc', '--no-exec-info']
start = time.monotonic()
with (out / 'generation.log').open('w') as log:
    proc = subprocess.Popen(cmd, stdout=log, stderr=subprocess.STDOUT,
                            cwd=out, start_new_session=True)
    try:
        code = proc.wait(timeout=7200)
    except subprocess.TimeoutExpired:
        os.killpg(proc.pid, signal.SIGKILL)
        proc.wait()
        code = 124
generated = out / (a.strategy+'_strategy_goal.v')
same = generated.exists() and generated.read_bytes() == checked.read_bytes()
fields = re.findall(r'^\s*Axiom\s+(\w+)', generated.read_text(), re.M) if generated.exists() else []
unchanged = all(sha(ROOT / f) == h for f, h in inputs.items())
result = {'passed': code == 0 and same and unchanged and len(fields) == (12 if a.strategy=='copy' else 3),
          'exit': code, 'configured_jobs': 32, 'ready_tasks': 1,
          'seconds': time.monotonic() - start, 'command': cmd,
          'tool': {'path': str(tool), 'sha256': sha(tool)},
          'input_hashes': inputs, 'inputs_unchanged': unchanged,
          'strategy_fields': fields, 'exact_goal_match': same,
          'goal_sha256': sha(generated) if generated.exists() else None,
          'checked_goal_sha256': sha(checked),
          'scope': 'Exact generated strategy binding; all field proofs compiled by full admission'}
(out / 'result.json').write_text(json.dumps(result, indent=2) + '\n')
print({k: v for k, v in result.items() if k not in ('input_hashes', 'command')})
raise SystemExit(not result['passed'])
