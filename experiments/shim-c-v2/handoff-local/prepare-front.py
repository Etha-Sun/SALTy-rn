"""Create a relocated front overlay once the isolated compiler build is finished.

This freezes new paths/binaries, not a qualification or a proof result.
Never run the historical overlay builders in place to relocate their locks.
"""
from pathlib import Path
import hashlib
import json
import shutil

HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]
CAMPAIGN = HERE.parent
INSTALL = CAMPAIGN / 'environment-recovery-local/.build/install'
SWITCH = CAMPAIGN / 'environment-recovery-local/.build/opam/shim-local'
SOLVERS = CAMPAIGN / 'handoff-solvers/.build/bin'
DEST = CAMPAIGN / 'handoff-model-front'

def sha(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()

def key(path):
    return str(path.relative_to(ROOT)) if path.is_relative_to(ROOT) else str(path)

# Fail before creating a partial overlay if the toolchain is not installed.
assert (INSTALL / 'bin/frama-c').is_file()
upstream = INSTALL / 'share/frama-c/share/wp'
assert (upstream / 'why3/frama_c_wp/cfloat.mlw').is_file()
for solver in ('z3', 'cvc5'):
    assert (SOLVERS / solver).is_file()
assert (SWITCH / 'share/why3/drivers/z3_471.drv').is_file()
DEST.mkdir(exist_ok=False)
share = DEST / 'wp-share'
shutil.copytree(upstream, share)
shutil.copyfile(CAMPAIGN / 'model-front/cfloat.mlw', share / 'why3/frama_c_wp/cfloat.mlw')
shutil.copyfile(CAMPAIGN / 'model-fma/Fma.mlw', share / 'why3/frama_c_wp/fma.mlw')

# Only relocate the historical wrapper's compiler path; its IEEE, libc, and
# explicit Bytes rejection behavior remains unchanged.
wrapper = (CAMPAIGN / 'model-front/frama-c.py').read_text()
wrapper = wrapper.replace("here.parent/'toolchain-build/.build/install'",
                          "here.parent/'environment-recovery-local/.build/install'")
(DEST / 'frama-c.py').write_text(wrapper)
(DEST / 'frama-c.py').chmod(0o755)
config = '[main]\nmagic = 14\n'
for name, version, driver, flags in (
        ('z3', '4.12.5', 'z3_471.drv', '-smt2 -T:%t %f'),
        ('cvc5', '1.2.1', 'cvc5.drv', '--lang=smt2 --tlimit-per=%t000 %f')):
    old = (CAMPAIGN / 'model-front' / (name + '.drv')).read_text()
    body = old[old.index('\n'):]
    (DEST / (name + '.drv')).write_text(
        'import "' + str(SWITCH / 'share/why3/drivers' / driver) + '"' + body)
    config += ('\n[prover]\nname = "' + ('Z3' if name == 'z3' else 'CVC5') +
               '"\nversion = "' + version + '"\ncommand = "' + str(SOLVERS / name) +
               ' ' + flags + '"\ndriver = "' + str(DEST / (name + '.drv')) + '"\n')
(DEST / 'why3.conf').write_text(config)
inputs = [Path(__file__).resolve(), DEST / 'frama-c.py', DEST / 'why3.conf',
          DEST / 'z3.drv', DEST / 'cvc5.drv',
          CAMPAIGN / 'model-fma/fma.driver', CAMPAIGN / 'model-fma/libc/math.h',
          CAMPAIGN / 'model-front/cfloat.mlw', CAMPAIGN / 'model-fma/Fma.mlw',
          SOLVERS / 'z3', SOLVERS / 'cvc5']
for directory in (INSTALL, SWITCH / 'bin', SWITCH / 'lib', SWITCH / 'share', share):
    inputs.extend(p for p in directory.rglob('*') if p.is_file())
lock = dict(version='native-ieee-relocated-front-local-01',
            qualification='pending fresh semantic controls and case replay',
            loadpaths=[], share=key(share), why3_config=key(DEST / 'why3.conf'),
            provers=['z3', 'cvc5'], files={key(p): sha(p) for p in sorted(set(inputs))},
            previous_lock='experiments/shim-c-v2/model-front/float_model_lock.json')
(DEST / 'float_model_lock.json').write_text(json.dumps(lock, indent=2) + '\n')
print(json.dumps({'lock': key(DEST / 'float_model_lock.json'),
                  'sha256': sha(DEST / 'float_model_lock.json'),
                  'qualification': lock['qualification']}))
