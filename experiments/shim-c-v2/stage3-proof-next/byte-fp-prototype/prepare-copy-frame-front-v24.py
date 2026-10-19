from pathlib import Path
import hashlib,json,shutil
R=Path(__file__).resolve().parents[4];B=R/'experiments/shim-c-v2';old=B/'stage3-byte-fp-front-v23';H=B/'stage3-byte-fp-front-v24';sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest();prior=old/'experimental-inputs02.json';watch=json.loads(prior.read_text())['files'];assert all(sha(Path(p))==s for p,s in watch.items())
source=Path(__file__).parent/'copy-frame11/copyframe.mlw';run=source.parent/'body-root01';d=json.loads((run/'result.json').read_text());assert d['exit']==0 and d['inputs_unchanged'] and d['body_source_sha256']==sha(source);assert len(d['verdicts'])==3 and all(v.startswith('Valid ') for v in d['verdicts'])
H.mkdir();shutil.copytree(old/'wp-share',H/'wp-share');shutil.copyfile(source,H/'wp-share/why3/copyframe.mlw')
for n in ['bytefloat.driver','z3-codec.drv','cvc5-codec02.drv','cvc5-supported.py','sliced-z3-adapter.py','why3-02.conf','run-qualification02.py','run-observer03.py']:
 p=H/n;s=(old/n).read_text().replace(str(old),str(H));p.write_text(s);p.chmod((old/n).stat().st_mode)
with (H/'wp-share/membytes_le.driver').open('a') as f:f.write('\nwhy3.import += "copyframe.CopyFrame";\n')
for n in ['z3-codec.drv','cvc5-codec02.drv']:
 with (H/n).open('a') as f:f.write('\ntheory copyframe.CopyFrame\n'+''.join(' meta "instantiate:auto" prop checked_copy_other_block_'+kind+'\n' for kind in ['uint32','uint8','sint8'])+'end\n')
p=H/'sliced-z3-adapter.py';s=p.read_text();needle='"cmod_remainder"}';assert s.count(needle)==1;s=s.replace(needle,'"cmod_remainder","global\'def"}');p.write_text(s)
(H/'qualification01').mkdir()
for p in (old/'qualification01').glob('*.c'):shutil.copyfile(p,H/'qualification01'/p.name)
watch[str(prior)]=sha(prior);watch[str(Path(__file__).resolve())]=sha(Path(__file__));watch[str(source)]=sha(source)
for p in run.iterdir():
 if p.is_file():watch[str(p)]=sha(p)
for p in H.rglob('*'):
 if p.is_file():watch[str(p)]=sha(p)
(H/'experimental-inputs02.json').write_text(json.dumps({'qualification':False,'previous_snapshot_sha256':sha(prior),'change':'Three real-body other-object memcpy read-frame theorems (uint32/uint8/sint8), no requires. Retain existing global-address definition in optional stronger subset. No new memory/NaN assumptions or native binary changes. Qualification still pending.','files':watch},indent=2)+'\n');print(len(watch),'UNQUALIFIED24')
