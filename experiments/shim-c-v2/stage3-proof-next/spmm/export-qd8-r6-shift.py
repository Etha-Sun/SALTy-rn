"""Diagnostic export only by default; mode smt invokes ONE 1-second prover.

Root runs this. It creates an isolated annotated copy and records all changes.
"""
from pathlib import Path
import hashlib, json, os, re, shutil, subprocess, sys

H = Path(__file__).resolve().parent
C = H / 'qd8-nibbles-r6'
mode = sys.argv[1]
assert mode in ('default', 'noqed', 'smt')
out = C / ('shift-export-' + mode + '-root01')
out.mkdir()
record = json.loads((C / 'shift-helper-root01/command.json').read_text())
original = Path(record['cwd'])
a = out / 'annotated'
shutil.copytree(original, a)
sha = lambda p: hashlib.sha256(p.read_bytes()).hexdigest()
before = {str(p): sha(p) for p in original.iterdir() if p.is_file()}
stripped = []
for p in a.iterdir():
    if p.suffix not in ('.c', '.h'):
        continue
    s = p.read_text()
    t = re.sub(r'/\*@.*?\*/', lambda m: '' if '\\wp::' in m[0] else m[0], s, flags=re.S)
    if t != s:
        p.write_text(t)
        stripped.append(p.name)
cmd = [v.replace(str(original), str(a)) for v in record['command']]
for flag in ('-wp-msg-key', '-wp-prover', '-wp-report-json', '-wp-session', '-wp-debug'):
    i = cmd.index(flag)
    del cmd[i:i+2]
cmd.remove('-wp-strategy-engine')
cmd += ['-wp-no-strategy-engine', '-wp-prop', 'qd8_shift8_exact_2',
        '-wp-print', '-wp-out', str(out / 'wp'),
        '-wp-session', str(out / 'session'), '-wp-report-json', str(out / 'raw.json')]
if mode != 'default':
    cmd += ['-wp-no-qed', '-wp-no-clean']
if mode == 'smt':
    cmd[cmd.index('-wp-timeout') + 1] = '1'
    cmd += ['-wp-prover', 'z3', '-wp-debug', '1', '-wp-msg-key', 'prover:pp_task,print-generated']
else:
    cmd += ['-wp-prover', 'none']
e = dict(os.environ, WP_OBSERVER_JSONL=str(out / 'events.jsonl'))
(out / 'command.json').write_text(json.dumps(dict(command=cmd, cwd=str(a),
    mode=mode, stripped_strategy_comments_in=stripped,
    original_inputs=before, solver_seconds=1 if mode=='smt' else 0), indent=2)+'\n')
with (out / 'run.log').open('x') as log:
    result = subprocess.run(cmd, cwd=a, env=e, stdout=log, stderr=subprocess.STDOUT, timeout=90)
after = {p: sha(Path(p)) for p in before}
(out / 'result.json').write_text(json.dumps(dict(exit=result.returncode,
    original_inputs_unchanged=before==after, solver_executed=mode=='smt'), indent=2)+'\n')
print(out, result.returncode, 'original inputs unchanged:', before==after)
