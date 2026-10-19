from pathlib import Path
import hashlib,json,shutil
P=Path(__file__).resolve().parent;R=P.parents[3];B=R/'experiments/shim-c-v2';old=B/'stage3-byte-fp-front-v31';H=B/'stage3-byte-fp-front-v32';sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest();prior=old/'experimental-inputs02.json';watch=dict(json.loads(prior.read_text())['files']);assert all(sha(Path(p))==s for p,s in watch.items())
D=P/'index-store17-modular';d=json.loads((D/'root01/result.json').read_text());assert d['complete'] and d['valid']==d['total_solver_leaves']==4 and not d['after_mismatches'] and not d['forbidden_assumption_leaks']
for p,s in json.loads((D/'inputs.json').read_text()).items():assert sha(Path(p))==s;watch[p]=s
H.mkdir();shutil.copytree(old/'wp-share',H/'wp-share');shutil.copyfile(D/'indexstore.mlw',H/'wp-share/why3/indexstore.mlw')
for n in ['bytefloat.driver','z3-codec.drv','cvc5-codec02.drv','cvc5-supported.py','sliced-z3-adapter.py','why3-02.conf','run-qualification02.py','run-observer03.py','run-known-helper.py','run-known-selected.py']:
 p=H/n;s=(old/n).read_text().replace(str(old),str(H));p.write_text(s);p.chmod((old/n).stat().st_mode)
with (H/'wp-share/membytes_le.driver').open('a') as f:f.write('\nwhy3.import += "indexstore.IndexStoreTrigger32";\n')
for n in ['z3-codec.drv','cvc5-codec02.drv']:
 with (H/n).open('a') as f:f.write('\ntheory indexstore.IndexStoreTrigger32\n meta "instantiate:auto" prop checked_index_load32_trigger\nend\n')
(H/'qualification01').mkdir()
for p in (old/'qualification01').glob('*.c'):shutil.copyfile(p,H/'qualification01'/p.name)
for p in D.rglob('*'):
 if p.is_file() and '.build' not in p.parts:watch[str(p)]=sha(p)
watch[str(prior)]=sha(prior);watch[str(Path(__file__).resolve())]=sha(Path(__file__))
for p in H.rglob('*'):
 if p.is_file():watch[str(p)]=sha(p)
(H/'experimental-inputs02.json').write_text(json.dumps({'qualification':False,'previous_snapshot_sha256':sha(prior),'change':'Add indexed-store composition body+trigger 4/4. Modular body proof retains IEEE Float32 and leaves codec symbols uninterpreted, using only previously native-body-proved store/read/frame contracts; it does not replace native codec verification. Runtime model drivers unchanged native IEEE/BV interpretation. No axioms/requires/goal rewriting. Actual trigger matching and full qualification remain mandatory.','files':watch},indent=2)+'\n');print(len(watch),'UNQUALIFIED32')
