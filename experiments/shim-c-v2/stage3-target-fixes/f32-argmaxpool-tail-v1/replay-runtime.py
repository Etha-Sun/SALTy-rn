"""Replay native ASan evidence from tracked sources, without a Frama-C install.

This checks finite executions only. It never reports a whole-kernel proof.
"""
from pathlib import Path
import hashlib
import json
import os
import shutil
import subprocess
import sys
import time

C = Path(__file__).resolve().parent
R = C.parents[3]
name = sys.argv[1]
assert name and all(x.isalnum() or x in '-_' for x in name)
D = C / 'runtime-replays' / name
D.mkdir(parents=True, exist_ok=False)
sha = lambda p: hashlib.sha256(p.read_bytes()).hexdigest()
manifest = json.loads((C / 'frozen.json').read_text())
target = json.loads((C / 'target-inputs.json').read_text())
old_evidence = R / 'experiments/shim-c-v2/stage3-proof-next/root-review/argmax-tail-runtime01'
original_driver = old_evidence / 'main.c'
matrix = C / 'runtime-root01/matrix.c'
assert sha(original_driver) == json.loads((old_evidence / 'inputs.json').read_text())['driver_sha256']
assert sha(matrix) == json.loads((C / 'runtime-root01/result.json').read_text())['matrix_sha256']
watch = {R / v['path']: v['sha256'] for v in manifest['files'].values()}
watch.update({R / v['path']: v['sha256'] for v in target['original'].values()})
watch.update({C / 'frozen.json': sha(C / 'frozen.json'), C / 'target-inputs.json': sha(C / 'target-inputs.json'), original_driver: sha(original_driver), matrix: sha(matrix), Path(__file__).resolve(): sha(Path(__file__))})
assert all(sha(p) == s for p, s in watch.items())
commands, runs = [], []
started = time.monotonic()

def invoke(label, command, timeout=120):
    commands.append({'label': label, 'command': command, 'cwd': str(R)})
    (D / 'commands.json').write_text(json.dumps(commands, indent=2) + '\n')
    t = time.monotonic()
    try:
        p = subprocess.run(command, cwd=R, stdout=subprocess.PIPE, stderr=subprocess.PIPE,
                           timeout=timeout, env=os.environ | {'ASAN_OPTIONS': 'detect_leaks=0' if label.startswith('original-') else 'detect_leaks=1'})
        code, out, err = p.returncode, p.stdout, p.stderr
    except subprocess.TimeoutExpired as e:
        code, out, err = 124, e.stdout or b'', e.stderr or b''
    (D / (label + '.stdout')).write_bytes(out)
    (D / (label + '.stderr')).write_bytes(err)
    row = {'label': label, 'exit': code, 'seconds': round(time.monotonic() - t, 3),
           'stdout_sha256': sha(D / (label + '.stdout')), 'stderr_sha256': sha(D / (label + '.stderr'))}
    runs.append(row)
    return code, out, err

binaries = {}
compiler = shutil.which('gcc')
assert compiler, 'gcc with ASan/UBSan support is required for this native replay'
for kind, template in [('original', original_driver), ('repaired', matrix)]:
    plain = D / '.build' / kind
    plain.mkdir(parents=True)
    entries = dict(manifest['files'])
    if kind == 'original':
        entries.update(target['original'])
    for filename, v in entries.items():
        source = R / v['path']
        assert sha(source) == v['sha256']
        shutil.copyfile(source, plain / filename)
    source = D / (kind + '.c')
    first, rest = template.read_text().split('\n', 1)
    assert first.startswith('#include ') and first.endswith('/unit.c"')
    source.write_text('#include ' + json.dumps(str((plain / 'unit.c').resolve())) + '\n' + rest)
    binary = plain / 'replay'
    command = [compiler, '-std=c11', '-O0', '-g', '-fno-omit-frame-pointer', '-fsanitize=address,undefined', str(source.resolve()), '-lm', '-o', str(binary.resolve())]
    code, _, _ = invoke('compile-' + kind, command)
    if code:
        break
    binaries[kind] = binary.resolve()

accepted = False
if len(binaries) == 2:
    a = invoke('original-rvv-exact', [str(binaries['original']), '1'])
    b = invoke('original-neon-exact', [str(binaries['original']), '2'])
    c = invoke('original-equivalent-exact', [str(binaries['original'])])
    d = invoke('original-equivalent-padded', [str(binaries['original']), '0', 'pad'])
    e = invoke('repaired-matrix', [str(binaries['repaired'])])
    overflow = lambda x: x[0] != 0 and b'heap-buffer-overflow' in x[2] and b'vld1q_u32' in x[2]
    accepted = a[0] == d[0] == e[0] == 0 and overflow(b) and overflow(c) and b'equivalent=1' in d[1] and b'2100 exact-index-extent cases passed' in e[1] and not e[2]
unchanged = all(sha(p) == s for p, s in watch.items())
result = {
    'scope': 'Native finite replay of the declared C/shim model. Not formal verification or an ISA proof.',
    'replay_accepted': accepted and unchanged,
    'whole_kernel_proof': False,
    'inputs_unchanged': unchanged,
    'seconds': round(time.monotonic() - started, 3),
    'compiler_version': subprocess.check_output([compiler, '--version'], text=True).splitlines()[0],
    'watched_sha256': {str(p.relative_to(R)): s for p, s in watch.items()},
    'runs': runs,
}
(D / 'result.json').write_text(json.dumps(result, indent=2) + '\n')
print(json.dumps({k: result[k] for k in ['replay_accepted', 'whole_kernel_proof', 'inputs_unchanged', 'seconds']}))
sys.exit(0 if result['replay_accepted'] else 1)
