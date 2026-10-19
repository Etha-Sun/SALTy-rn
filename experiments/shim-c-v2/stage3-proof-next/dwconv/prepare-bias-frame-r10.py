from pathlib import Path
import json,sys,hashlib,shutil,difflib
D=Path(__file__).resolve().parent;R=D.parents[3];sys.path.insert(0,str(R/'tools'));import shim_c_campaign_closure as checker
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest();old=D/'bias-r8';case=D/'bias-frame-r10';case.mkdir();data=json.loads((old/'frozen.json').read_text());g=json.loads((old/'source-guard.json').read_text());work=case/'.build/edit';shutil.copytree(g['annotated'],work)
p=work/'rvv.c';s=p.read_text();needle='      vfloat32m4_t vacc = __riscv_vle32_v_f32m4(w, vl);';assert s.count(needle)==1;s=s.replace(needle,r'''      /*@ ghost next_bias_pre: ; */
      vfloat32m4_t vacc = __riscv_vle32_v_f32m4(w, vl);
      /*@ assert next_bias_disjoint: \separated(&vacc,w+(0..vl-1)); */
      /*@ assert next_bias_loaded_pre: \forall integer j;0<=j<vl ==> ext_same(vacc.lane[j],\at(w[j],next_bias_pre)); */
      /*@ assert next_bias_weight_frame: \forall integer j;0<=j<vl ==> ext_same(w[j],\at(w[j],next_bias_pre)); */''');p.write_text(s)
plain=Path(g['plain']);pieces=[]
for n in data['files']:
 a=(plain/n).read_text();b=(work/n).read_text()
 if a!=b:
  for line in difflib.unified_diff(a.splitlines(True),b.splitlines(True),fromfile='a/'+n,tofile='b/'+n):pieces.append(line if line.endswith('\n') else line+'\n\\ No newline at end of file\n')
(case/'proof.patch').write_text(''.join(pieces));data.update(proof_patches=[str((case/'proof.patch').relative_to(R))],previous_version=str(old.relative_to(R)),proof_stage='Bias frame r10 from r8: isolate real aggregate return disjointness, loaded pre-state lane, weight frame; original local/normalized cuts retained, each assert verified separately; no added contracts')
(case/'frozen.json').write_text(json.dumps(data,indent=2)+'\n');_,guard=checker.prepare(case,sha(case/'frozen.json'),'guard10');(case/'source-guard.json').write_text(json.dumps(guard,indent=2)+'\n');(case/'freeze.json').write_text(json.dumps({'frozen_sha256':sha(case/'frozen.json'),'proof_sha256':sha(case/'proof.patch')},indent=2)+'\n')
print(guard['passed'])
