from pathlib import Path
import json,sys,hashlib,shutil,difflib
D=Path(__file__).resolve().parent;R=D.parents[3];sys.path.insert(0,str(R/'tools'));import shim_c_campaign_closure as checker
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest();old=D/'bias-prestate-r13';case=D/'bias-projection-r17';case.mkdir();data=json.loads((old/'frozen.json').read_text());g=json.loads((old/'source-guard.json').read_text());work=case/'.build/edit';shutil.copytree(g['annotated'],work)
p=work/'fp_memory_m4.c';s=p.read_text();needle='#include "fp_primitives.h"';assert s.count(needle)==1
s=s.replace(needle,needle+r'''
/*@
 logic float next_m4_lane0(vfloat32m4_t v) = v.lane[0];
 predicate next_m4_bias0(vfloat32m4_t v,float x) = ext_same(next_m4_lane0(v),x);
*/
/*@ ghost
 /@ assigns \nothing;
    ensures next_m4_projection0: \valid_read(p) ==> ext_same(p->lane[0],next_m4_lane0(*p)); @/
 static void next_m4_project(const vfloat32m4_t *p) {}
*/
''')
needle=r'ensures \forall integer j; 0<=j<vl ==> (ext_same(\result.lane[j],p[j])); */';assert s.count(needle)==1
s=s.replace(needle,needle[:-2]+r' ensures next_m4_loaded0: 0<vl ==> next_m4_bias0(\result,p[0]); */');p.write_text(s)
p=work/'rvv.c';s=p.read_text();needle='      /*@ assert next_prestate_loaded0:';assert s.count(needle)==1
s=s.replace(needle,r'''      /*@ assert next_predicate_loaded0: next_m4_bias0(vacc,\at(w[0],next_bias_before_load)); */
      /*@ assert next_projection_valid: \valid_read(&vacc); */
      /*@ ghost next_m4_project(&vacc); */
'''+needle);p.write_text(s)
plain=Path(g['plain']);pieces=[]
for n in data['files']:
 a=(plain/n).read_text();b=(work/n).read_text()
 if a!=b:
  for line in difflib.unified_diff(a.splitlines(True),b.splitlines(True),fromfile='a/'+n,tofile='b/'+n):pieces.append(line if line.endswith('\n') else line+'\n\\ No newline at end of file\n')
(case/'proof.patch').write_text(''.join(pieces));data.update(proof_patches=[str((case/'proof.patch').relative_to(R))],previous_version=str(old.relative_to(R)),proof_stage='Projection r17 from r13: body-proved conditional-valid projection helper and real-loader intermediate ensures, all new obligations mandatory, no added requires')
(case/'frozen.json').write_text(json.dumps(data,indent=2)+'\n');_,guard=checker.prepare(case,sha(case/'frozen.json'),'guard17');(case/'source-guard.json').write_text(json.dumps(guard,indent=2)+'\n');(case/'freeze.json').write_text(json.dumps({'frozen_sha256':sha(case/'frozen.json'),'proof_sha256':sha(case/'proof.patch')},indent=2)+'\n')
print(guard['passed'])
