from pathlib import Path
import json,sys,hashlib,shutil,difflib
D=Path(__file__).resolve().parent;R=D.parents[3];sys.path.insert(0,str(R/'tools'));import shim_c_campaign_closure as checker
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest();old=D/'bias-projection-r17';case=D/'bias-projection-r18';case.mkdir();data=json.loads((old/'frozen.json').read_text());g=json.loads((old/'source-guard.json').read_text());work=case/'.build/edit';shutil.copytree(g['annotated'],work)
p=work/'fp_memory_m4.c';s=p.read_text();needle=r'ensures next_m4_projection0: \valid_read(p) ==> ext_same(p->lane[0],next_m4_lane0(*p));';assert s.count(needle)==1;s=s.replace(needle,r'ensures next_m4_projection0: ext_same(p->lane[0],next_m4_lane0(*p));');p.write_text(s)
p=work/'rvv.c';s=p.read_text();needle=r'      /*@ assert next_projection_valid: \valid_read(&vacc); */';assert s.count(needle)==1;s=s.replace(needle+'\n','');p.write_text(s)
plain=Path(g['plain']);pieces=[]
for n in data['files']:
 a=(plain/n).read_text();b=(work/n).read_text()
 if a!=b:
  for line in difflib.unified_diff(a.splitlines(True),b.splitlines(True),fromfile='a/'+n,tofile='b/'+n):pieces.append(line if line.endswith('\n') else line+'\n\\ No newline at end of file\n')
(case/'proof.patch').write_text(''.join(pieces));data.update(proof_patches=[str((case/'proof.patch').relative_to(R))],previous_version=str(old.relative_to(R)),proof_stage='Bias projection r18: strengthen actual ghost projection helper to unconditional logical field/aggregate identity, remove caller valid cut, preserve real load and prestate/local/normalized goals; helper must prove before caller use')
(case/'frozen.json').write_text(json.dumps(data,indent=2)+'\n');_,guard=checker.prepare(case,sha(case/'frozen.json'),'guard18');(case/'source-guard.json').write_text(json.dumps(guard,indent=2)+'\n');(case/'freeze.json').write_text(json.dumps({'frozen_sha256':sha(case/'frozen.json'),'proof_sha256':sha(case/'proof.patch')},indent=2)+'\n')
print(guard['passed'])
