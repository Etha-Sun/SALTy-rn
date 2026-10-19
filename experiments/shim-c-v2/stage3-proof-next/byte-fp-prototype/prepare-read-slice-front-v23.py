from pathlib import Path
import hashlib,json,shutil
R=Path(__file__).resolve().parents[4];B=R/'experiments/shim-c-v2';old=B/'stage3-byte-fp-front-v22';H=B/'stage3-byte-fp-front-v23';sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest();prior=old/'experimental-inputs02.json';watch=json.loads(prior.read_text())['files'];assert all(sha(Path(p))==s for p,s in watch.items())
H.mkdir();shutil.copytree(old/'wp-share',H/'wp-share')
for n in ['bytefloat.driver','z3-codec.drv','cvc5-codec02.drv','cvc5-supported.py','sliced-z3-adapter.py','why3-02.conf','run-qualification02.py','run-observer03.py']:
 p=H/n;s=(old/n).read_text().replace(str(old),str(H));p.write_text(s);p.chmod((old/n).stat().st_mode)
p=H/'sliced-z3-adapter.py';s=p.read_text();needle='"is_uint64\'def"}';assert s.count(needle)==1;s=s.replace(needle,'"is_uint64\'def","shift_uint32\'def","Div_mod","cmod_remainder"}');p.write_text(s)
(H/'qualification01').mkdir()
for p in (old/'qualification01').glob('*.c'):shutil.copyfile(p,H/'qualification01'/p.name)
watch[str(prior)]=sha(prior);watch[str(Path(__file__).resolve())]=sha(Path(__file__))
for p in H.rglob('*'):
 if p.is_file():watch[str(p)]=sha(p)
(H/'experimental-inputs02.json').write_text(json.dumps({'qualification':False,'previous_snapshot_sha256':sha(prior),'change':'Retain three existing original-SMT assumptions in the optional stronger subset: shift_uint32 definition and ComputerDivision quotient/remainder constraints. No new assertion, goal rewriting, native binary change or solver output modification. Full qualification remains outstanding.','files':watch},indent=2)+'\n');print(len(watch),'UNQUALIFIED23')
