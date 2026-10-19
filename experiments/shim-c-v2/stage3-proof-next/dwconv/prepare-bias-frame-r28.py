from pathlib import Path
import json,sys,hashlib,shutil,difflib
D=Path(__file__).resolve().parent;R=D.parents[3];sys.path.insert(0,str(R/'tools'));import shim_c_campaign_closure as checker
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest();old=D/'bias-lane-range-r27';case=D/'bias-frame-r28';case.mkdir();data=json.loads((old/'frozen.json').read_text());g=json.loads((old/'source-guard.json').read_text());work=case/'.build/edit';shutil.copytree(g['annotated'],work)
p=work/'fp_memory_m4.c';s=p.read_text();needle='static void next_m4_project(const vfloat32m4_t *p) {}';assert s.count(needle)==1;s=s.replace(needle,needle+r"""
 /@ assigns \nothing;
    ensures next_weight_block_separated:
      \base_addr(p)!=\base_addr(q) ==> \separated(p+(0..n-1),q); @/
 static void next_dw_disjoint(const float *p,const vfloat32m4_t *q,size_t n) {}
""");p.write_text(s)
p=work/'rvv.c';s=p.read_text();needle='      /*@ assert next_bias_local:';assert s.count(needle)==1;extra=r"""      /*@ assert next_weight_distinct_base: \base_addr(w)!=\base_addr(&vacc); */
      /*@ ghost next_dw_disjoint(w,&vacc,vl); */
      /*@ assert next_weight_copy_frame: \forall integer j;0<=j<vl ==> ext_same(w[j],\at(w[j],next_bias_before_load)); */
""";s=s.replace(needle,extra+needle);p.write_text(s)
plain=Path(g['plain']);pieces=[]
for n in data['files']:
 a=(plain/n).read_text();b=(work/n).read_text()
 if a!=b:
  for line in difflib.unified_diff(a.splitlines(True),b.splitlines(True),fromfile='a/'+n,tofile='b/'+n):pieces.append(line if line.endswith('\n') else line+'\n\\ No newline at end of file\n')
(case/'proof.patch').write_text(''.join(pieces));data.update(proof_patches=[str((case/'proof.patch').relative_to(R))],previous_version=str(old.relative_to(R)),proof_stage='r28 isolate source/local base separation, actual no-requires body helper derives interval separation conditionally, retain explicit real-copy weight frame and all original output goals. Every new cut remains a proof debt.')
(case/'frozen.json').write_text(json.dumps(data,indent=2)+'\n');_,guard=checker.prepare(case,sha(case/'frozen.json'),'guard28');(case/'source-guard.json').write_text(json.dumps(guard,indent=2)+'\n');(case/'freeze.json').write_text(json.dumps({'frozen_sha256':sha(case/'frozen.json'),'proof_sha256':sha(case/'proof.patch')},indent=2)+'\n')
print(guard['passed'])
