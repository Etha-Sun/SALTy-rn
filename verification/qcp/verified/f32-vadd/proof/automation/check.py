"""Check a shared memory tactic against existing, unchanged VADD obligations."""
from pathlib import Path
import hashlib
import json
import re
import shutil
import subprocess
import tempfile
import time

HERE = Path(__file__).resolve().parent
PROOF = HERE.parent
CASE = PROOF.parent
baseline = json.loads((PROOF / 'status.json').read_text())
assert baseline['passed'] and baseline['scope'] == 'full'
old = Path(baseline['run_directory'])
manifest = json.loads((PROOF / 'manifest.json').read_text())
assert baseline['freshly_compiled_local_modules'] == len(manifest['modules'])
for item in manifest['modules']:
    assert (PROOF / item['path']).read_bytes() == (old / item['path']).read_bytes()
run = Path(tempfile.mkdtemp(prefix='memory-auto-', dir=CASE / '.build'))
shutil.copyfile(HERE / 'FloatMemory.v', run / 'FloatMemory.v')
command = next(record['command'] for record in baseline['records']
               if record['command'][:2] == ['qcp-env', 'coqc'])
flags = command[2:-1]
flags += ['-Q', str(run), 'MemoryAuto']
records = []


def compile(path):
    started = time.monotonic()
    command = ['qcp-env', 'coqc', *flags, str(path)]
    with (run / (path.stem + '.log')).open('w') as log:
        result = subprocess.run(command, cwd=run, stdout=log, stderr=log, timeout=240)
    records.append({'file': path.name, 'exit_code': result.returncode,
                    'seconds': time.monotonic() - started})
    print(path.name, result.returncode, flush=True)
    if result.returncode:
        raise RuntimeError((run / (path.stem + '.log')).read_text()[-3000:])


compile(run / 'FloatMemory.v')
shutil.copyfile(HERE / 'GenericChecks.v', run / 'GenericChecks.v')
compile(run / 'GenericChecks.v')
counts = {}
goal_source = (PROOF / 'coq/ByValue/neon_unit_goal.v').read_text()
for group in ['store', 'copy', 'load']:
    name = {'store': 'neon_store_calls.v', 'copy': 'neon_copy_checked.v', 'load': 'neon_load_calls.v'}[group]
    source = (PROOF / 'coq/ByValue' / name).read_text()
    goals = re.findall(r'Lemma proof_of_(\w+)\s*:', source)
    text = ('From ByValue Require Import neon_unit_goal.\n'
            'From MemoryAuto Require Import FloatMemory.\n'
            'Import Snaive_C_Rules64.\nLocal Open Scope Z_scope.\nLocal Open Scope sac.\nModule Checked.\n')
    for goal in goals:
        auxiliary = ', ' + goal + '_aux' if re.search(r'^Definition ' + goal + r'_aux\b', goal_source, re.M) else ''
        text += f'Lemma proof_of_{goal} : {goal}.\nProof. unfold {goal}{auxiliary}; float_memory. Qed.\n'
    text += 'End Checked.\n'
    path = run / (group + '.v')
    path.write_text(text)
    compile(path)
    counts[group] = len(goals)
status = {'passed': True, 'checked_unchanged_vcs': counts,
          'generic_checks': 'arbitrary operation/frame; insufficient bounds and invented initialized value rejected',
          'total': sum(counts.values()), 'baseline': str(old), 'run_directory': str(run),
          'tactic_sha256': hashlib.sha256((HERE / 'FloatMemory.v').read_bytes()).hexdigest(),
          'records': records,
          'scope': 'f32 scalar-field layout; registered write widths 1/2/4, read width 4, one-cell tail; no kernel names in tactic.'}
(HERE / 'status.json').write_text(json.dumps(status, indent=2) + '\n')
print(json.dumps(status), flush=True)
