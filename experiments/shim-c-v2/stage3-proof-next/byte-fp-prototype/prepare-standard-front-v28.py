"""Freeze an independent UNQUALIFIED standard replay; never upgrades prior locks."""
from pathlib import Path
import json,hashlib,shutil
R=Path(__file__).resolve().parents[4];B=R/'experiments/shim-c-v2';H=B/'stage3-byte-fp-front-v28';old=B/'stage3-bitwised-front-v2';sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
assert not (H/'float_model_lock.json').exists()
snapshot=H/'experimental-inputs02.json';files=json.loads(snapshot.read_text())['files'];assert all(sha(Path(p))==s for p,s in files.items())
s=(old/'frama-c.py').read_text().replace("install=here/'.build/install'","install=here.parent/'stage3-byte-fp-front-v19/.build/install'")
a=s.index("if '-wp-model'");b=s.index('args,drivers=',a);s=s[:a]+s[b:]
s=s.replace("args,drivers=[],[str(here.parent/'model-fma/fma.driver')]","args,drivers=['-warn-special-float','none'],[str(here/'bytefloat.driver'),str(here.parent/'model-fma/fma.driver')]")
(H/'frama-c.py').write_text(s);(H/'frama-c.py').chmod(0o755)
# Retain all provenance, fresh body proof evidence and binaries from the full experimental snapshot.
files[str(snapshot)]=sha(snapshot);files[str(H/'frama-c.py')]=sha(H/'frama-c.py');files[str(Path(__file__).resolve())]=sha(Path(__file__))
base=json.loads((old/'float_model_lock.json').read_text())
for n,v in base['files'].items():
 p=Path(n) if Path(n).is_absolute() else R/n
 assert sha(p)==v,n
 files[str(p)]=v
lock={'version':'stage3-byte-ieee-v28-standard-candidate','qualification':'UNQUALIFIED: pending all positive codec obligations, body dependency review, fresh positive/negative controls, observer consistency and strict known-case replay','loadpaths':[],'share':str((H/'wp-share').relative_to(R)),'why3_config':str((H/'why3-02.conf').relative_to(R)),'provers':['z3','cvc5'],'previous_lock':str((old/'float_model_lock.json').relative_to(R)),'experimental_snapshot_sha256':sha(snapshot),'files':files}
(H/'float_model_lock.json').write_text(json.dumps(lock,indent=2)+'\n')
case=H/'replay/f32-vadd';case.mkdir(parents=True);source=case/'frozen-inputs';source.mkdir();oldfreeze=old/'replay/f32-vadd-r2/frozen.json';d=json.loads(oldfreeze.read_text());identical={}
for n,v in d['files'].items():
 if n=='float_model_lock.json':continue
 p=R/v['path'];assert sha(p)==v['sha256'],n
 if n=='model_runner.py':
  assert v['path']=='tools/shim_c_campaign_v7.py';q=p
 else:
  q=source/n;shutil.copyfile(p,q);v['path']=str(q.relative_to(R))
 identical[n]={'sha256':sha(q),'same_bytes':True}
d['files']['float_model_lock.json']={'path':str((H/'float_model_lock.json').relative_to(R)),'sha256':sha(H/'float_model_lock.json')}
assert len(d['proof_patches'])==1;p=R/d['proof_patches'][0];q=case/'proof.patch';shutil.copyfile(p,q);identical['proof.patch']={'previous':d['proof_patches'][0],'sha256':sha(q),'same_bytes':True};d['proof_patches']=[str(q.relative_to(R))]
d.update(model='Bytes+float',wp_model_variant='Bytes+float',wp_share=lock['share'],wp_why3_config=lock['why3_config'],wp_budget=1800,previous_version=str(oldfreeze.parent.relative_to(R)),tool_revision={'base_frozen_sha256':sha(oldfreeze),'source_change':'Independent repaired IEEE byte model with real-body codec lemmas and pinned subset adapters; UNQUALIFIED pending controls and full standard replay','qualification':'pending'})
(case/'frozen.json').write_text(json.dumps(d,indent=2)+'\n');(case/'freeze-sha256.txt').write_text(sha(case/'frozen.json')+'\n');(case/'byte-identical-inputs.json').write_text(json.dumps(identical,indent=2)+'\n')
(H/'standard-freeze.json').write_text(json.dumps({'qualified':False,'new_lock_sha256':sha(H/'float_model_lock.json'),'frozen_sha256':sha(case/'frozen.json'),'locked_files':len(files),'scope':'Environment qualification only; no kernel adoption'},indent=2)+'\n');print('prepared UNQUALIFIED',len(files),sha(case/'frozen.json'),flush=True)
