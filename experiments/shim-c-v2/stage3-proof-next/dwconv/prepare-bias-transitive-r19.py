from pathlib import Path
import json,sys,hashlib,shutil,difflib
D=Path(__file__).resolve().parent;R=D.parents[3];sys.path.insert(0,str(R/'tools'));import shim_c_campaign_closure as checker
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest();old=D/'bias-projection-r18';case=D/'bias-transitive-r19';case.mkdir();data=json.loads((old/'frozen.json').read_text());g=json.loads((old/'source-guard.json').read_text());work=case/'.build/edit';shutil.copytree(g['annotated'],work)
p=work/'fp_memory_m4.c';s=p.read_text();needle='static void next_m4_project(const vfloat32m4_t *p) {}';assert s.count(needle)==1;s=s.replace(needle,needle+r"""
 /@ assigns \nothing;
    ensures next_m4_transitive0: \forall float x;
      next_m4_bias0(v,x) && ext_same(y,next_m4_lane0(v)) ==> ext_same(y,x); @/
 static void next_m4_transitive(vfloat32m4_t v,float y) {}
""");p.write_text(s)
p=work/'rvv.c';s=p.read_text();needle='      /*@ ghost next_m4_project(&vacc); */';assert s.count(needle)==1;s=s.replace(needle,needle+'\n      /*@ ghost next_m4_transitive(vacc,vacc.lane[0]); */');p.write_text(s)
plain=Path(g['plain']);pieces=[]
for n in data['files']:
 a=(plain/n).read_text();b=(work/n).read_text()
 if a!=b:
  for line in difflib.unified_diff(a.splitlines(True),b.splitlines(True),fromfile='a/'+n,tofile='b/'+n):pieces.append(line if line.endswith('\n') else line+'\n\\ No newline at end of file\n')
(case/'proof.patch').write_text(''.join(pieces));data.update(proof_patches=[str((case/'proof.patch').relative_to(R))],previous_version=str(old.relative_to(R)),proof_stage='r19 body-proved by-value predicate transitivity, universally quantified float source to instantiate original prestate without postheap snapshot. No requires or extra cuts.')
(case/'frozen.json').write_text(json.dumps(data,indent=2)+'\n');_,guard=checker.prepare(case,sha(case/'frozen.json'),'guard19');(case/'source-guard.json').write_text(json.dumps(guard,indent=2)+'\n');(case/'freeze.json').write_text(json.dumps({'frozen_sha256':sha(case/'frozen.json'),'proof_sha256':sha(case/'proof.patch')},indent=2)+'\n')
print(guard['passed'])
