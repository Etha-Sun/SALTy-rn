from pathlib import Path
import json,hashlib,os
HERE=Path(__file__).resolve().parent;ROOT=HERE.parents[2]
base=HERE.parent/'handoff-model-plus';old_install=HERE.parent/'environment-recovery-local/.build/install';install=HERE/'.build/install'
assert (install/'bin/frama-c').is_file()
assert not (HERE/'float_model_lock.json').exists()
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
lock=json.loads((base/'float_model_lock.json').read_text())
for n,h in lock['files'].items():
 p=Path(n) if Path(n).is_absolute() else ROOT/n
 assert sha(p)==h,n
wrapper=(base/'frama-c.py').read_text().replace("install=here.parent/'environment-recovery-local/.build/install'","install=here/'.build/install'")
(HERE/'frama-c.py').write_text(wrapper);(HERE/'frama-c.py').chmod(0o755)
files={}
for n,h in lock['files'].items():
 p=Path(n) if Path(n).is_absolute() else ROOT/n
 if not p.is_relative_to(old_install):files[n]=h
for p in sorted(install.rglob('*')):
 if p.is_file():files[str(p.relative_to(ROOT))]=sha(p)
for n in ['frama-c.py','logical-not.patch','source-provenance.json']:
 p=HERE/n;files[str(p.relative_to(ROOT))]=sha(p)
lock.update(version='stage3-logical-not-01',qualification='pending independent positive/negative controls and full known-case replay',previous_lock=str((base/'float_model_lock.json').relative_to(ROOT)),files=files)
(HERE/'float_model_lock.json').write_text(json.dumps(lock,indent=2)+'\n')
(HERE/'freeze.json').write_text(json.dumps({'model_lock_sha256':sha(HERE/'float_model_lock.json'),'base_model_lock_sha256':sha(base/'float_model_lock.json'),'changed_frontend':'CodeSemantics.exp_unop logical negation only','runtime_files':len(files)},indent=2)+'\n')
print('froze',len(files),'files')
