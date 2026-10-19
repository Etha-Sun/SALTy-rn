from pathlib import Path
import json,sys,hashlib,shutil,difflib
D=Path(__file__).resolve().parent;R=D.parents[3];sys.path.insert(0,str(R/'tools'));import shim_c_campaign_closure as checker
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest();old=D/'r6';case=D/'bias-r8';case.mkdir();data=json.loads((old/'frozen.json').read_text());g=json.loads((old/'source-guard.json').read_text());work=case/'.build/edit';shutil.copytree(g['annotated'],work)
p=work/'rvv.c';s=p.read_text();needle='      vfloat32m4_t vacc = __riscv_vle32_v_f32m4(w, vl); w += 4;';assert s.count(needle)==1;s=s.replace(needle,r'''      /*@ assert next_bias_address: w==W0+16*((CH-c)/4); */
      vfloat32m4_t vacc = __riscv_vle32_v_f32m4(w, vl);
      /*@ assert next_bias_local: \forall integer j;0<=j<vl ==> ext_same(vacc.lane[j],w[j]); */
      /*@ assert next_bias_normalized: \forall integer j;0<=j<vl ==> ext_same(vacc.lane[j],W0[16*((CH-c)/4)+j]); */
      w += 4;''');p.write_text(s)
plain=Path(g['plain']);pieces=[]
for n in data['files']:
 a=(plain/n).read_text();b=(work/n).read_text()
 if a!=b:
  for line in difflib.unified_diff(a.splitlines(True),b.splitlines(True),fromfile='a/'+n,tofile='b/'+n):pieces.append(line if line.endswith('\n') else line+'\n\\ No newline at end of file\n')
(case/'proof.patch').write_text(''.join(pieces));data.update(proof_patches=[str((case/'proof.patch').relative_to(R))],previous_version=str(old.relative_to(R)),proof_stage='Bias r8 from r6: isolate pointer normalization and actual aggregate-load local relation before w increment; three separately checked assertions, no additional helpers or assumptions')
(case/'frozen.json').write_text(json.dumps(data,indent=2)+'\n');_,guard=checker.prepare(case,sha(case/'frozen.json'),'guard08');(case/'source-guard.json').write_text(json.dumps(guard,indent=2)+'\n');(case/'freeze.json').write_text(json.dumps({'frozen_sha256':sha(case/'frozen.json'),'proof_sha256':sha(case/'proof.patch')},indent=2)+'\n')
(case/'DIAGNOSIS.json').write_text(json.dumps({'actual_goal_source':str(D/'r7/logs/bias-print01.log'),'actual_goal_sha256':sha(D/'r7/logs/bias-print01.log'),'observation':'Call has Load_S6(vacc,Mf32_0)=return and lane relation to pre-return Mf32_68. Return effect copies 16 float cells into vacc. Target uses post-return Mf32_0 at weights plus pointer arithmetic. Need instantiate aggregate load, disjoint-copy frame, and address normalization in large context. This is not evidence of missing Typed semantics; GEMM small real-load/struct-copy control passed.','change':'Separate address normalization before call and local loader relation immediately after return, prior to w increment. No downstream eight-value cut stack.','status':'prepared; root solver required'},indent=2)+'\n');print(guard['passed'])
