from pathlib import Path
import json,hashlib,shutil
R=Path(__file__).resolve().parents[4];B=R/'experiments/shim-c-v2';old=B/'stage3-byte-fp-front-v18';H=B/'stage3-byte-fp-front-v19';sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest();prior=old/'experimental-inputs02.json';watch=dict(json.loads(prior.read_text())['files']);assert all(sha(Path(p))==s for p,s in watch.items());build=json.loads((H/'build-result.json').read_text());assert build['status']=='compiled-unqualified';assert all(r['exit']==0 for r in build['commands']);assert not (H/'experimental-inputs02.json').exists()
shutil.copytree(old/'wp-share',H/'wp-share')
for n in ['bytefloat.driver','z3-codec.drv','cvc5-codec02.drv','cvc5-supported.py','sliced-z3-adapter.py','why3-02.conf','run-qualification02.py']:
 p=H/n;s=(old/n).read_text().replace(str(old),str(H))
 if n=='run-qualification02.py':s=s.replace('stage3-byte-fp-front-v1/.build','stage3-byte-fp-front-v19/.build').replace('"z3,cvc5"','"tip,z3,cvc5"')
 p.write_text(s);p.chmod((old/n).stat().st_mode)
(H/'qualification01').mkdir()
for p in (old/'qualification01').glob('*.c'):shutil.copyfile(p,H/'qualification01'/p.name)
shutil.copyfile(B/'stage3-bitwised-front-v2/controls.c',H/'qualification01/highbits.c')
audit=json.loads((H/'source-audit.json').read_text())
for n,s in audit['source_after'].items():
 p=H/'.build/source'/n;assert sha(p)==s;watch[str(p)]=s
for p in (H/'.build/install').rglob('*'):
 if p.is_file():watch[str(p)]=sha(p)
for p in H.rglob('*'):
 if p.is_file() and '.build' not in p.parts:watch[str(p)]=sha(p)
watch[str(prior)]=sha(prior);watch[str(Path(__file__).resolve())]=sha(Path(__file__))
(H/'experimental-inputs02.json').write_text(json.dumps({'qualification':False,'previous_snapshot_sha256':sha(prior),'change':'Fresh independently built combination of native-byte-codec frontend and previously audited arbitrary-precision bitwised/Qed-recording fixes. Complete source_after, installed binaries and all support inputs locked. All controls need fresh runs.','files':watch},indent=2)+'\n');print('UNQUALIFIED19',len(watch),sha(H/'experimental-inputs02.json'))
