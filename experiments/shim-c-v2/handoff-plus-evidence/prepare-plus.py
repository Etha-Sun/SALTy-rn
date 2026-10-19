"""Build a new relocated plus overlay without touching historical/front inputs."""
from pathlib import Path
import hashlib,json,shutil
HERE=Path(__file__).resolve().parent
CAMPAIGN=HERE.parent
ROOT=CAMPAIGN.parents[1]
FRONT=CAMPAIGN/'handoff-model-front'
DEST=CAMPAIGN/'handoff-model-plus'
def sha(p):return hashlib.sha256(p.read_bytes()).hexdigest()
def key(p):return str(p.relative_to(ROOT)) if p.is_relative_to(ROOT) else str(p)
oldlock=json.loads((FRONT/'float_model_lock.json').read_text())
for name,digest in oldlock['files'].items():
 p=Path(name) if Path(name).is_absolute() else ROOT/name
 assert sha(p)==digest,name
DEST.mkdir(exist_ok=False)
shutil.copytree(FRONT/'wp-share',DEST/'wp-share')
shutil.copyfile(CAMPAIGN/'model-plus/cint.mlw',DEST/'wp-share/why3/frama_c_wp/cint.mlw')
wrapper=(CAMPAIGN/'model-plus/frama-c.py').read_text().replace("here.parent/'toolchain-build/.build/install'","here.parent/'environment-recovery-local/.build/install'").replace("here/'libc'","here.parent/'model-plus/libc'")
(DEST/'frama-c.py').write_text(wrapper);(DEST/'frama-c.py').chmod(0o755)
# Reuse frozen front solver config/drivers, IEEE and FMA dependencies.
files=dict(oldlock['files'])
for p in [Path(__file__).resolve(),FRONT/'float_model_lock.json',DEST/'frama-c.py',CAMPAIGN/'model-plus/frama-c.py',CAMPAIGN/'model-plus/cint.mlw',CAMPAIGN/'model-plus/libc/math.h',CAMPAIGN/'model-plus/controls.c',*(p for p in (DEST/'wp-share').rglob('*') if p.is_file())]:files[key(p)]=sha(p)
lock=dict(version='native-ieee-relocated-plus-local-01',qualification='pending independent controls and Cint replay',loadpaths=[],share=key(DEST/'wp-share'),why3_config=key(FRONT/'why3.conf'),provers=['z3','cvc5'],files=files,previous_lock='experiments/shim-c-v2/model-plus/float_model_lock.json')
(DEST/'float_model_lock.json').write_text(json.dumps(lock,indent=2)+'\n')
print(json.dumps({'lock':key(DEST/'float_model_lock.json'),'sha256':sha(DEST/'float_model_lock.json')}))
