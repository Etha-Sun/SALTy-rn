from pathlib import Path
import hashlib,json,shutil
P=Path(__file__).resolve().parent;R=P.parents[3];B=R/'experiments/shim-c-v2';old=B/'stage3-byte-fp-front-v33';H=B/'stage3-byte-fp-front-v34';sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest();prior=old/'experimental-inputs02.json';watch=dict(json.loads(prior.read_text())['files']);assert all(sha(Path(p))==s for p,s in watch.items())
H.mkdir();shutil.copytree(old/'wp-share',H/'wp-share')
for n in ['bytefloat.driver','z3-codec.drv','cvc5-codec02.drv','cvc5-supported.py','sliced-z3-adapter.py','why3-02.conf','run-qualification02.py','run-observer03.py','run-known-helper.py','run-known-selected.py']:
 p=H/n;s=(old/n).read_text().replace(str(old),str(H));p.write_text(s);p.chmod((old/n).stat().st_mode)
p=H/'sliced-z3-adapter.py';s=p.read_text();s=s.replace('def slice_task(text,expanded=False):','def slice_task(text,expanded=False,no_auto=False):');s=s.replace("        if heads[i]=='assert' and i!=goal and not keep:","        if no_auto and name=='auto_instance':keep=False\n        if heads[i]=='assert' and i!=goal and not keep:");s=s.replace('variants=[slice_task(text),slice_task(text,True)]','variants=[slice_task(text),slice_task(text,True),slice_task(text,True,True)]');s=s.replace("zip(['sliced','expanded'],variants)","zip(['sliced','expanded','no-auto'],variants)");s=s.replace("min(5 if kind=='sliced' else 10,remaining)","min({'sliced':5,'expanded':10,'no-auto':2}[kind],remaining)");p.write_text(s)
(H/'qualification01').mkdir()
for p in (old/'qualification01').glob('*.c'):shutil.copyfile(p,H/'qualification01'/p.name)
watch[str(prior)]=sha(prior);watch[str(Path(__file__).resolve())]=sha(Path(__file__))
for p in H.rglob('*'):
 if p.is_file():watch[str(p)]=sha(p)
(H/'experimental-inputs02.json').write_text(json.dumps({'qualification':False,'previous_snapshot_sha256':sha(prior),'change':'Solver-only third stronger subset drops all complete auto_instance assertions from expanded task, same exact goal. First two searches unchanged. Additional two-second search before original fallback. No new assumptions, no model/codec/native-driver change. v33 codec retained one real valid_dest debt; its exact expanded task proved UNSAT in 0.993s after dropping auto_instance assertions. All semantic controls and strict known-case replay required anew.','files':watch},indent=2)+'\n');print(len(watch),'UNQUALIFIED34')
