from pathlib import Path
import hashlib,json,shutil
R=Path(__file__).resolve().parents[4];B=R/'experiments/shim-c-v2';old=B/'stage3-byte-fp-front-v25';H=B/'stage3-byte-fp-front-v27';sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest();prior=old/'experimental-inputs02.json';watch=json.loads(prior.read_text())['files'];assert all(sha(Path(p))==s for p,s in watch.items())
source=Path(__file__).parent/'read-signed-join13/readsignedjoin.mlw';run=source.parent/'body-root01';d=json.loads((run/'result.json').read_text());assert d['exit']==0 and d['inputs_unchanged'] and d['body_source_sha256']==sha(source);assert len(d['verdicts'])==5 and all(v.startswith('Valid ') for v in d['verdicts'])
H.mkdir();shutil.copytree(old/'wp-share',H/'wp-share');shutil.copyfile(source,H/'wp-share/why3/readsignedjoin.mlw')
for n in ['bytefloat.driver','z3-codec.drv','cvc5-codec02.drv','cvc5-supported.py','sliced-z3-adapter.py','why3-02.conf','run-qualification02.py','run-observer03.py']:
 p=H/n;s=(old/n).read_text().replace(str(old),str(H));p.write_text(s);p.chmod((old/n).stat().st_mode)
with (H/'wp-share/membytes_le.driver').open('a') as f:f.write('\nwhy3.import += "readsignedjoin.ReadSignedJoin32";\n')
for n in ['z3-codec.drv','cvc5-codec02.drv']:
 with (H/n).open('a') as f:f.write('\ntheory readsignedjoin.ReadSignedJoin32\n meta "instantiate:auto" prop checked_signed_join_trigger\nend\n')
(H/'qualification01').mkdir()
for p in (old/'qualification01').glob('*.c'):shutil.copyfile(p,H/'qualification01'/p.name)
watch[str(prior)]=sha(prior);watch[str(Path(__file__).resolve())]=sha(Path(__file__));watch[str(source)]=sha(source)
for p in run.iterdir():
 if p.is_file():watch[str(p)]=sha(p)
for p in H.rglob('*'):
 if p.is_file():watch[str(p)]=sha(p)
(H/'experimental-inputs02.json').write_text(json.dumps({'qualification':False,'previous_snapshot_sha256':sha(prior),'change':'Body-proved signed-byte to word decomposition with explicit read trigger, no requires. Five body VCs valid. Uses signed-byte observations actually produced by memcpy contracts; v26 unsigned expansion is not imported. No new assumptions, native binary changes or goal rewriting. Qualification still pending.','files':watch},indent=2)+'\n');print(len(watch),'UNQUALIFIED27')
