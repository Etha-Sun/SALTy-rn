from pathlib import Path
import hashlib,json,shutil
R=Path(__file__).resolve().parents[4];B=R/'experiments/shim-c-v2';old=B/'stage3-byte-fp-front-v20';H=B/'stage3-byte-fp-front-v21';sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest();prior=old/'experimental-inputs02.json';watch=json.loads(prior.read_text())['files'];assert all(sha(Path(p))==s for p,s in watch.items())
source=Path(__file__).parent/'word-byte-trigger08/wordtriggers.mlw'
for j in range(4):
 p=source.parent/('root01-'+str(j)+'-result.json');d=json.loads(p.read_text());assert d['exit']==0 and d['inputs_unchanged'] and d['source_sha256']==sha(source);assert 'Prover result is: Valid' in (source.parent/('root01-'+str(j)+'.log')).read_text()
H.mkdir();shutil.copytree(old/'wp-share',H/'wp-share');shutil.copyfile(source,H/'wp-share/why3/wordtriggers.mlw')
for n in ['bytefloat.driver','z3-codec.drv','cvc5-codec02.drv','cvc5-supported.py','sliced-z3-adapter.py','why3-02.conf','run-qualification02.py']:
 p=H/n;s=(old/n).read_text().replace(str(old),str(H));p.write_text(s);p.chmod((old/n).stat().st_mode)
with (H/'bytefloat.driver').open('a') as f:f.write('\nwhy3.import += "wordtriggers.WordByteTriggers";\n')
for n in ['z3-codec.drv','cvc5-codec02.drv']:
 with (H/n).open('a') as f:
  if n.startswith('cvc5'):f.write('\ntransformation "instantiate_predicate"\n')
  f.write('\ntheory wordtriggers.WordByteTriggers\n'+''.join(' meta "instantiate:auto" prop checked_word_byte'+str(j)+'_trigger\n' for j in range(4))+'end\n')
(H/'qualification01').mkdir()
for p in (old/'qualification01').glob('*.c'):shutil.copyfile(p,H/'qualification01'/p.name)
watch[str(prior)]=sha(prior);watch[str(Path(__file__).resolve())]=sha(Path(__file__))
for p in source.parent.iterdir():
 if p.is_file():watch[str(p)]=sha(p)
for p in H.rglob('*'):
 if p.is_file():watch[str(p)]=sha(p)
(H/'experimental-inputs02.json').write_text(json.dumps({'qualification':False,'previous_snapshot_sha256':sha(prior),'change':'Instantiate four exactly body-proved word-byte equations using write-trigger versions independently proved by Why3 rewrite. No new memory assumption. Native frontend v19 unchanged; no kernel use.','files':watch},indent=2)+'\n');print(len(watch),'UNQUALIFIED21')
