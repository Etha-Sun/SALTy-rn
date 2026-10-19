from pathlib import Path
import json,hashlib,shutil
R=Path(__file__).resolve().parents[4];B=R/'experiments/shim-c-v2';old=B/'stage3-byte-fp-front-v34';H=B/'stage3-byte-fp-front-v35';sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest();prior=old/'experimental-inputs02.json';watch=dict(json.loads(prior.read_text())['files']);assert all(sha(Path(p))==s for p,s in watch.items());build=json.loads((H/'build-result.json').read_text());assert build['status']=='compiled-unqualified';assert all(r['exit']==0 for r in build['commands']);assert json.loads((H/'observer-build01.json').read_text())['exit']==0;assert not (H/'experimental-inputs02.json').exists()
shutil.copytree(old/'wp-share',H/'wp-share')
for n in ['bytefloat.driver','z3-codec.drv','cvc5-codec02.drv','cvc5-supported.py','sliced-z3-adapter.py','why3-02.conf','run-qualification02.py','run-observer03.py','run-known-helper.py','run-known-selected.py']:
 p=H/n;s=(old/n).read_text().replace(str(old),str(H))
 s=s.replace('stage3-byte-fp-front-v19/.build','stage3-byte-fp-front-v35/.build')
 p.write_text(s);p.chmod((old/n).stat().st_mode)
(H/'qualification01').mkdir()
for p in (old/'qualification01').glob('*.c'):shutil.copyfile(p,H/'qualification01'/p.name)
shutil.copyfile(B/'stage3-proof-next/spmm/address-proof-root12/controls.c',H/'qualification01/address.c')
audit=json.loads((H/'source-audit.json').read_text())
for n,s in audit['source_after'].items():
 p=H/'.build/source'/n;assert sha(p)==s;watch[str(p)]=s
for p in (H/'.build/install').rglob('*'):
 if p.is_file():watch[str(p)]=sha(p)
for p in (H/'.build/observer-new').rglob('*'):
 if p.is_file():watch[str(p)]=sha(p)
for p in H.rglob('*'):
 if p.is_file() and '.build' not in p.parts:watch[str(p)]=sha(p)
watch[str(prior)]=sha(prior);watch[str(Path(__file__).resolve())]=sha(Path(__file__))
(H/'experimental-inputs02.json').write_text(json.dumps({'qualification':False,'previous_snapshot_sha256':sha(prior),'change':'Independent native35 removes the two admitted pointer-width generation paths. Native IEEE codec and all body-proved support retained; new binary and all source/support inputs locked. No inheritance of old Byte acceptance; all semantic/address controls, VC audit and strict known case required.','files':watch},indent=2)+'\n');print('UNQUALIFIED35',len(watch),sha(H/'experimental-inputs02.json'))
