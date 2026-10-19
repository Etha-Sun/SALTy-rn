from pathlib import Path
import hashlib,json,shutil
P=Path(__file__).resolve().parent;R=P.parents[3];B=R/'experiments/shim-c-v2';old=B/'stage3-byte-fp-front-v30';H=B/'stage3-byte-fp-front-v31';sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest();prior=old/'experimental-inputs02.json';watch=dict(json.loads(prior.read_text())['files']);assert all(sha(Path(p))==s for p,s in watch.items())
checks=[('copy-separated14/root-main01',15),('copy-separated14/root-recursive01',2),('copy-frame-trigger16-r2/root01',1)]
for name,n in checks:
 d=json.loads((P/name/'result.json').read_text());assert d['complete'] and d['valid']==d['total_solver_leaves']==n and not d['after_mismatches'] and not d['forbidden_assumption_leaks']
d=json.loads((P/'sequence-query-clean15/root01/result.json').read_text());assert d['complete'] and len(d['results'])==3 and not d['after_mismatches']
d=json.loads((P/'index-successor15/body-root01/result.json').read_text());assert d['exit']==0 and d['inputs_unchanged'] and len(d['verdicts'])==2 and all(x.startswith('Valid ') for x in d['verdicts'])
for folder in ['copy-separated14','copy-frame-trigger16-r2']:
 for p,s in json.loads((P/folder/'inputs.json').read_text()).items():assert sha(Path(p))==s;watch[p]=s
for p,s in json.loads((P/'sequence-query-clean15/seal.json').read_text()).items():assert sha(Path(p))==s;watch[p]=s
H.mkdir();shutil.copytree(old/'wp-share',H/'wp-share')
for folder,name in [('copy-separated14','frame.mlw'),('copy-frame-trigger16-r2','copyframetrigger.mlw'),('index-successor15','successor.mlw')]:shutil.copyfile(P/folder/name,H/'wp-share/why3'/name)
for n in ['bytefloat.driver','z3-codec.drv','cvc5-codec02.drv','cvc5-supported.py','sliced-z3-adapter.py','why3-02.conf','run-qualification02.py','run-observer03.py','run-known-helper.py']:
 p=H/n;s=(old/n).read_text().replace(str(old),str(H));p.write_text(s);p.chmod((old/n).stat().st_mode)
with (H/'wp-share/membytes_le.driver').open('a') as f:f.write('\nwhy3.import += "copyframetrigger.CopyFrameTrigger32";\nwhy3.import += "successor.CheckedSuccessor64";\n')
for n in ['z3-codec.drv','cvc5-codec02.drv']:
 with (H/n).open('a') as f:f.write('\ntheory copyframetrigger.CopyFrameTrigger32\n meta "instantiate:auto" prop checked_memcpy_frame32_trigger\nend\ntheory successor.CheckedSuccessor64\n meta "instantiate:auto" prop checked_u64_successor_trigger\nend\n')
(H/'qualification01').mkdir()
for p in (old/'qualification01').glob('*.c'):shutil.copyfile(p,H/'qualification01'/p.name)
for folder in ['copy-separated14','copy-separated14-sequence-clean','sequence-query-clean15','copy-frame-trigger16-r2','index-successor15']:
 for p in (P/folder).rglob('*'):
  if p.is_file() and '.build' not in p.parts:watch[str(p)]=sha(p)
watch[str(prior)]=sha(prior);watch[str(Path(__file__).resolve())]=sha(Path(__file__))
for p in H.rglob('*'):
 if p.is_file():watch[str(p)]=sha(p)
(H/'experimental-inputs02.json').write_text(json.dumps({'qualification':False,'previous_snapshot_sha256':sha(prior),'change':'Body-proved generic separated memcpy frame, including same-block disjoint regions, 20/20 full dependencies and 1/1 trigger; 2/2 unsigned successor arithmetic bodies. Independent proof driver removes official same-conclusion copy frame assumptions. No new requires/axioms/goal rewrite/native changes. Qualification still mandatory.','files':watch},indent=2)+'\n');print(len(watch),'UNQUALIFIED31')
