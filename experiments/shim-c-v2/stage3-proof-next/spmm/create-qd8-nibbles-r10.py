"""Prepare only: no solver, and never modify a prior candidate."""
from pathlib import Path
import difflib
import hashlib
import json
import shutil
import subprocess
import sys

R = Path('/srv/home/yuechunsun/tools/lean/build/shim-c')
H = Path(__file__).resolve().parent
O = H / 'qd8-nibbles-r9'
N = H / 'qd8-nibbles-r10'
sha = lambda p: hashlib.sha256(p.read_bytes()).hexdigest()
N.mkdir()
d = json.loads((O / 'frozen.json').read_text())
plain, edit = N / '.build/plain', N / '.build/edit'
plain.mkdir(parents=True)
for name, info in d['files'].items():
    shutil.copyfile(R / info['path'], plain / name)
shutil.copytree(plain, edit)
for patch in d['proof_patches']:
    result = subprocess.run(['patch', '-p1', '-i', str(R / patch)],
                            cwd=edit, capture_output=True, text=True)
    assert result.returncode == 0, result.stdout + result.stderr
p = edit / 'quantized.c'
old = p.read_text()
definition = '/*@ predicate qd8_shift_same(integer x, integer y) = x == y; */\n'
assert old.startswith(definition)
helper = r"""/*@ ghost
/@ terminates \true; assigns \nothing;
    ensures qd8_mask8_identity: \forall integer u; 0<=u<=255 ==> qd8_shift_same(255 & u, u);
@/
static void qd8_mask8_identity(void) { }
*/
/*@ \wp::strategy Qd8MaskLeaf: \prover("z3",10), \prover("cvc5",10);
    \wp::strategy Qd8MaskBits: \tactic("Wp.bitwised",\ingoal(A==B),\param("Wp.bitwised.range",8),\children(Qd8MaskLeaf)), Qd8MaskLeaf;
    \wp::strategy Qd8MaskUnfold: \tactic("Wp.unfold",\ingoal(A),\children(Qd8MaskBits)), Qd8MaskLeaf;
    \wp::proof Qd8MaskUnfold: qd8_mask8_identity;
*/
"""
new = definition + helper + old[len(definition):]
needle='static void qd8_and8_cast(void) {\n'
assert new.count(needle)==1
new=new.replace(needle,needle+'  qd8_mask8_identity();\n')
p.write_text(new)
parts = []
for q in sorted(edit.iterdir()):
    if not q.is_file():
        continue
    for line in difflib.unified_diff((plain / q.name).read_text().splitlines(True),
                                     q.read_text().splitlines(True),
                                     fromfile='a/' + q.name, tofile='b/' + q.name):
        parts.append(line if line.endswith('\n') else line + '\n\\ No newline at end of file\n')
(N / 'proof.patch').write_text(''.join(parts))
d.update(name=N.name, previous_version=str(O.relative_to(R)),
         proof_patches=[str((N / 'proof.patch').relative_to(R))],
         proof_sha256=sha(N / 'proof.patch'),
         stage3_revision='Actual no-requires unsigned mask helper with checked unfold/8-bit tactic; actual ghost call provides mask equality before signed-cast congruence.')
d['stage3']['proof_sha256'] = sha(N / 'proof.patch')
d['stage3']['previous_candidate_frozen_sha256'] = sha(O / 'frozen.json')
(N / 'frozen.json').write_text(json.dumps(d, indent=2) + '\n')
(N / 'freeze-sha256.txt').write_text(sha(N / 'frozen.json') + '\n')
(N / 'REVIEW.diff').write_text(''.join(difflib.unified_diff(
    old.splitlines(True), new.splitlines(True), fromfile='r9/quantized.c', tofile='r10/quantized.c')))
shutil.copyfile(O / 'run.py', N / 'run.py')
cfg = json.loads((O / 'execution-config.json').read_text())
inputs = {}
for path, digest in cfg['inputs'].items():
    src = Path(path)
    if src.is_relative_to(O):
        dst = N / src.relative_to(O)
        assert dst.is_file(), dst
        inputs[str(dst)] = sha(dst)
    else:
        assert sha(src) == digest, src
        inputs[path] = digest
inputs[str(Path(__file__).resolve())] = sha(Path(__file__).resolve())
cfg['inputs'] = inputs
cfg['scope'] = 'r10 selected diagnostics; all twenty added assertions must be checked, bits_i8 bridge remains unresolved.'
(N / 'execution-config.json').write_text(json.dumps(cfg, indent=2) + '\n')
sys.path.insert(0, str(R / 'tools'))
import shim_c_campaign_closure as checker
_, guard = checker.prepare(N, sha(N / 'frozen.json'), 'guard01')
(N / 'source-guard.json').write_text(json.dumps(guard, indent=2) + '\n')
assert guard['passed'], guard
commands = [f'python3 {N.relative_to(R)}/run.py {N.name} and-helper-root01 fct:qd8_mask8_identity,qd8_and8_cast 300',
            f'python3 {N.relative_to(R)}/run.py {N.name} and-callee-root01 fct:qd8_mask8_identity,qd8_and8_cast,__riscv_vand_vx_i8m2 300']
(N / 'commands.txt').write_text('\n'.join(commands) + '\n')
(N / 'STATUS.json').write_text(json.dumps(dict(
    prepared=True, solver_executed=False, new_assertions=0,
    new_assertion_names=[f'qd8_shift8_exact_{k}' for k in range(8)] +
                        [f'qd8_shift8_{kind}_{k}' for k in range(2, 8) for kind in ('nested', 'double')],
    strict_kernel_complete=False,
    note='Check every new assertion plus original helper posts/cases and real vsll body. No improvement claimed before raw results.'), indent=2) + '\n')
print('guard passed; checked 8-bit mask helper added; no solver started')
print('\n'.join(commands))
