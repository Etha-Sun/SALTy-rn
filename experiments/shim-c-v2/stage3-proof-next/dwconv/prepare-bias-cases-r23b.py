from pathlib import Path
import json,sys,hashlib,shutil,difflib
D=Path(__file__).resolve().parent;R=D.parents[3];sys.path.insert(0,str(R/'tools'));import shim_c_campaign_closure as checker
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest();old=D/'bias-fixed-lanes-r21';case=D/'bias-cases-r23b';case.mkdir();data=json.loads((old/'frozen.json').read_text());g=json.loads((old/'source-guard.json').read_text());work=case/'.build/edit';shutil.copytree(g['annotated'],work)
p=work/'rvv.c';s=p.read_text();needle='      /*@ assert next_prestate_loaded_all:';assert s.count(needle)==1;extra=r"""      /*@ ghost
        size_t next_lane_index = 0;
        /@ loop invariant next_lane_bound: 0<=next_lane_index<=vl;
           loop invariant next_lane_prefix: \forall integer j; 0<=j<next_lane_index ==> ext_same(vacc.lane[j],\at(w[j],next_bias_before_load));
           loop assigns next_lane_index;
           loop variant vl-next_lane_index; @/
        while (next_lane_index < vl) {
          if (next_lane_index == 0) {
            /@ assert next_case0: \let integer j=next_lane_index; ext_same(vacc.lane[j],\at(w[j],next_bias_before_load)); @/
          } else if (next_lane_index == 1) {
            /@ assert next_case1: \let integer j=next_lane_index; ext_same(vacc.lane[j],\at(w[j],next_bias_before_load)); @/
          } else if (next_lane_index == 2) {
            /@ assert next_case2: \let integer j=next_lane_index; ext_same(vacc.lane[j],\at(w[j],next_bias_before_load)); @/
          } else {
            /@ assert next_case3_index: next_lane_index==3; @/
            /@ assert next_case3: \let integer j=next_lane_index; ext_same(vacc.lane[j],\at(w[j],next_bias_before_load)); @/
          }
          ++next_lane_index;
        }
      */
""";s=s.replace(needle,extra+needle);p.write_text(s)
plain=Path(g['plain']);pieces=[]
for n in data['files']:
 a=(plain/n).read_text();b=(work/n).read_text()
 if a!=b:
  for line in difflib.unified_diff(a.splitlines(True),b.splitlines(True),fromfile='a/'+n,tofile='b/'+n):pieces.append(line if line.endswith('\n') else line+'\n\\ No newline at end of file\n')
(case/'proof.patch').write_text(''.join(pieces));data.update(proof_patches=[str((case/'proof.patch').relative_to(R))],previous_version=str(old.relative_to(R)),proof_stage='r23 body-proved ghost finite-lane induction with explicit 0,1,2,3 branches, retaining all fixed-lane and quantified goals. No new requires, validity or separation assumptions.')
(case/'frozen.json').write_text(json.dumps(data,indent=2)+'\n');_,guard=checker.prepare(case,sha(case/'frozen.json'),'guard23');(case/'source-guard.json').write_text(json.dumps(guard,indent=2)+'\n');(case/'freeze.json').write_text(json.dumps({'frozen_sha256':sha(case/'frozen.json'),'proof_sha256':sha(case/'proof.patch')},indent=2)+'\n')
print(guard['passed'])
