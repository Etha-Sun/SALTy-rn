from pathlib import Path
import hashlib,json,shutil
R=Path(__file__).resolve().parents[4];B=R/'experiments/shim-c-v2';old=B/'stage3-byte-fp-front-v19';H=B/'stage3-byte-fp-front-v20';sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest();prior=old/'experimental-inputs02.json';watch=json.loads(prior.read_text())['files'];assert all(sha(Path(p))==s for p,s in watch.items())
source=Path(__file__).parent/'word-byte-read07-direct/wordbytes.mlw';proof=json.loads((source.parent/'root01-result.json').read_text());assert proof['exit']==0 and proof['inputs_unchanged'] and proof['source_sha256']==sha(source)
H.mkdir();shutil.copytree(old/'wp-share',H/'wp-share');shutil.copyfile(source,H/'wp-share/why3/wordbytes.mlw')
for n in ['bytefloat.driver','z3-codec.drv','cvc5-codec02.drv','cvc5-supported.py','sliced-z3-adapter.py','why3-02.conf','run-qualification02.py']:
 p=H/n;s=(old/n).read_text().replace(str(old),str(H));p.write_text(s);p.chmod((old/n).stat().st_mode)
with (H/'bytefloat.driver').open('a') as f:f.write('\nwhy3.import += "wordbytes.WordBytes32";\n')
(H/'qualification01').mkdir()
for p in (old/'qualification01').glob('*.c'):shutil.copyfile(p,H/'qualification01'/p.name)
watch[str(prior)]=sha(prior);watch[str(Path(__file__).resolve())]=sha(Path(__file__))
for p in source.parent.iterdir():
 if p.is_file():watch[str(p)]=sha(p)
for p in H.rglob('*'):
 if p.is_file():watch[str(p)]=sha(p)
(H/'experimental-inputs02.json').write_text(json.dumps({'qualification':False,'previous_snapshot_sha256':sha(prior),'change':'Import exactly four body-proved all-integer ComputerDivision word-byte equations. Native frontend remains fresh v19. No assumed codec law, domain change or kernel use.','files':watch},indent=2)+'\n');print(len(watch),'UNQUALIFIED20')
