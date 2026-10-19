from pathlib import Path
import json,hashlib,shutil
H=Path(__file__).resolve().parent;R=H.parents[2];B=H.parent;old=B/'stage3-unary-front';sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
assert not (H/'float_model_lock.json').exists()
base=json.loads((old/'float_model_lock.json').read_text())
for n,v in base['files'].items():assert sha(Path(n) if Path(n).is_absolute() else R/n)==v,n
(H/'frama-c.py').write_bytes((old/'frama-c.py').read_bytes());(H/'frama-c.py').chmod(0o755)
files={n:v for n,v in base['files'].items() if not (Path(n) if Path(n).is_absolute() else R/n).is_relative_to(old/'.build/install')}
for p in sorted((H/'.build/install').rglob('*')):
 if p.is_file():files[str(p.relative_to(R))]=sha(p)
for n in ['frama-c.py','bitwised.patch','qed-record.patch','source-audit.json']:
 files[str((H/n).relative_to(R))]=sha(H/n)
lock=base|{'version':'stage3-bitwised-qed-record-v2','qualification':'pending native regression controls and full f32-vadd replay; highbit/QD8 local evidence is separate','previous_lock':str((old/'float_model_lock.json').relative_to(R)),'files':files}
(H/'float_model_lock.json').write_text(json.dumps(lock,indent=2)+'\n')
case=H/'replay/f32-vadd';case.mkdir(parents=True);source=case/'frozen-inputs';source.mkdir();oldfreeze=old/'replay/f32-vadd/frozen.json';d=json.loads(oldfreeze.read_text());identical={}
for n,v in d['files'].items():
 if n=='float_model_lock.json':continue
 p=R/v['path'];assert sha(p)==v['sha256'],n;q=source/n;shutil.copyfile(p,q);assert sha(q)==v['sha256'];identical[n]={'previous':v['path'],'sha256':sha(q)};v['path']=str(q.relative_to(R))
d['files']['float_model_lock.json']={'path':str((H/'float_model_lock.json').relative_to(R)),'sha256':sha(H/'float_model_lock.json')}
assert len(d['proof_patches'])==1;p=R/d['proof_patches'][0];q=case/'proof.patch';shutil.copyfile(p,q);identical['proof.patch']={'previous':d['proof_patches'][0],'sha256':sha(q)};d['proof_patches']=[str(q.relative_to(R))]
d.update(previous_version=str(oldfreeze.parent.relative_to(R)),tool_revision={'base_frozen_sha256':sha(oldfreeze),'source_change':'TacBitwised arbitrary-precision mask and Wpo.resolve explicit Qed recording for trivial goals','qualification':'pending root regression controls and full v7 checker replay'})
(case/'frozen.json').write_text(json.dumps(d,indent=2)+'\n');(case/'freeze-sha256.txt').write_text(sha(case/'frozen.json')+'\n');(case/'byte-identical-inputs.json').write_text(json.dumps(identical,indent=2)+'\n')
ctrl=H/'regression-sources';ctrl.mkdir();provenance={}
for n,p in [('unary.c',old/'controls-v3.c'),('ieee.c',B/'model-front/semantic.c'),('fma.c',B/'model-plus/controls.c')]:
 shutil.copyfile(p,ctrl/n);provenance[n]={'source':str(p.relative_to(R)),'sha256':sha(p)}
(ctrl/'provenance.json').write_text(json.dumps(provenance,indent=2)+'\n')
(H/'standard-freeze.json').write_text(json.dumps({'base_lock_sha256':sha(old/'float_model_lock.json'),'new_lock_sha256':sha(H/'float_model_lock.json'),'frozen_sha256':sha(case/'frozen.json'),'locked_files':len(files),'qualification':'pending'},indent=2)+'\n')
print('prepared',len(files),sha(case/'frozen.json'),flush=True)
