from pathlib import Path
import hashlib,json,shutil
R=Path(__file__).resolve().parents[4];B=R/'experiments/shim-c-v2';old=B/'stage3-byte-fp-front-v21';H=B/'stage3-byte-fp-front-v22';sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest();prior=old/'experimental-inputs02.json';watch=json.loads(prior.read_text())['files'];assert all(sha(Path(p))==s for p,s in watch.items())
P=Path(__file__).parent
proofs=[(P/'read-inverse09/digits.mlw',P/'read-inverse09/digits-root01',11),(P/'read-inverse09/readinverse.mlw',P/'read-inverse09/memory-root01',12),(P/'read-inverse-trigger10/readtriggers.mlw',P/'read-inverse-trigger10/body-root01',1)]
for source,run,count in proofs:
 d=json.loads((run/'result.json').read_text());assert d['exit']==0 and d['inputs_unchanged'] and d['body_source_sha256']==sha(source)
 assert len(d['verdicts'])==count and all(v.startswith('Valid ') for v in d['verdicts'])
H.mkdir();shutil.copytree(old/'wp-share',H/'wp-share')
for source,run,count in proofs:shutil.copyfile(source,H/'wp-share/why3'/source.name)
for n in ['bytefloat.driver','z3-codec.drv','cvc5-codec02.drv','cvc5-supported.py','sliced-z3-adapter.py','why3-02.conf','run-qualification02.py']:
 p=H/n;s=(old/n).read_text().replace(str(old),str(H));p.write_text(s);p.chmod((old/n).stat().st_mode)
with (H/'wp-share/membytes_le.driver').open('a') as f:f.write('\nwhy3.import += "readtriggers.ReadInverseTrigger32";\n')
for n in ['z3-codec.drv','cvc5-codec02.drv']:
 with (H/n).open('a') as f:f.write('\ntheory readtriggers.ReadInverseTrigger32\n meta "instantiate:auto" prop checked_read_inverse_trigger\nend\n')
# Fresh observer-enabled runner; underlying v19 binary and observer are unchanged.
s=(B/'stage3-byte-fp-front-v19/run-observer01.py').read_text().replace('str(H/".build/observer-new/observer.cmxs")','str(B/"stage3-byte-fp-front-v19/.build/observer-new/observer.cmxs")').replace('sha(H/".build/observer-new/observer.cmxs")','sha(B/"stage3-byte-fp-front-v19/.build/observer-new/observer.cmxs")').replace('"-wp-par","1"','"-wp-par","4"')
(H/'run-observer03.py').write_text(s)
(H/'qualification01').mkdir()
for p in (old/'qualification01').glob('*.c'):shutil.copyfile(p,H/'qualification01'/p.name)
watch[str(prior)]=sha(prior);watch[str(Path(__file__).resolve())]=sha(Path(__file__))
for source,run,count in proofs:
 watch[str(source)]=sha(source)
 for p in run.iterdir():
  if p.is_file():watch[str(p)]=sha(p)
watch[str(B/'stage3-byte-fp-front-v19/.build/observer-new/observer.cmxs')]=sha(B/'stage3-byte-fp-front-v19/.build/observer-new/observer.cmxs')
for p in H.rglob('*'):
 if p.is_file():watch[str(p)]=sha(p)
(H/'experimental-inputs02.json').write_text(json.dumps({'qualification':False,'previous_snapshot_sha256':sha(prior),'change':'Add body-proved inverse byte decomposition for actual read_uint32 terms through the membytes driver library. Arithmetic 11, memory 12, and trigger 1 body obligations all freshly verified. No new assumptions or native frontend change. UNQUALIFIED; control and strict known-case replay required.','files':watch},indent=2)+'\n');print(len(watch),'UNQUALIFIED22')
