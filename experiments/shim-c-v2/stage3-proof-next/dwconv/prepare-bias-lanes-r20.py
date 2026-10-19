from pathlib import Path
import json,sys,hashlib,shutil,difflib
D=Path(__file__).resolve().parent;R=D.parents[3];sys.path.insert(0,str(R/'tools'));import shim_c_campaign_closure as checker
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest();old=D/'bias-transitive-r19';case=D/'bias-lanes-r20';case.mkdir();data=json.loads((old/'frozen.json').read_text());g=json.loads((old/'source-guard.json').read_text());work=case/'.build/edit';shutil.copytree(g['annotated'],work)
p=work/'fp_memory_m4.c';s=p.read_text();needle=' logic float next_m4_lane0';s=s.replace(needle,' logic float next_m4_lane(vfloat32m4_t v,integer j) = v.lane[j];\n predicate next_m4_bias(vfloat32m4_t v,integer j,float x) = ext_same(next_m4_lane(v,j),x);\n'+needle,1)
needle='static void next_m4_project(const vfloat32m4_t *p) {}';assert s.count(needle)==1;s=s.replace(needle,needle+r"""
 /@ assigns \nothing;
    ensures next_m4_project_all: \forall integer j; \forall float x;
      0<=j<16 && next_m4_bias(*p,j,x) ==> ext_same(p->lane[j],x); @/
 static void next_m4_project_lanes(const vfloat32m4_t *p) {}
""")
needle='ensures next_m4_loaded0:';assert s.count(needle)==1;s=s.replace(needle,r'ensures next_m4_loaded_all: \forall integer j; 0<=j<vl ==> next_m4_bias(\result,j,p[j]); '+needle);p.write_text(s)
p=work/'rvv.c';s=p.read_text();needle='      /*@ assert next_bias_local:';assert s.count(needle)==1;s=s.replace(needle,r"""      /*@ ghost next_m4_project_lanes(&vacc); */
      /*@ assert next_prestate_loaded_all: \forall integer j; 0<=j<vl ==> ext_same(vacc.lane[j],\at(w[j],next_bias_before_load)); */
"""+needle);p.write_text(s)
plain=Path(g['plain']);pieces=[]
for n in data['files']:
 a=(plain/n).read_text();b=(work/n).read_text()
 if a!=b:
  for line in difflib.unified_diff(a.splitlines(True),b.splitlines(True),fromfile='a/'+n,tofile='b/'+n):pieces.append(line if line.endswith('\n') else line+'\n\\ No newline at end of file\n')
(case/'proof.patch').write_text(''.join(pieces));data.update(proof_patches=[str((case/'proof.patch').relative_to(R))],previous_version=str(old.relative_to(R)),proof_stage='r20 generalize proven physical projection and value transitivity to all valid lane indices, body checked helper and strengthened actual loader ensures. Preserve original postheap local and normalized goals; weight frame remains separate debt.')
(case/'frozen.json').write_text(json.dumps(data,indent=2)+'\n');_,guard=checker.prepare(case,sha(case/'frozen.json'),'guard20');(case/'source-guard.json').write_text(json.dumps(guard,indent=2)+'\n');(case/'freeze.json').write_text(json.dumps({'frozen_sha256':sha(case/'frozen.json'),'proof_sha256':sha(case/'proof.patch')},indent=2)+'\n')
print(guard['passed'])
