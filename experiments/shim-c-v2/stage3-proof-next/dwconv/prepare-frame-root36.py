from pathlib import Path
import json,sys,hashlib,shutil,difflib,re
D=Path(__file__).resolve().parent;R=D.parents[3];sys.path.insert(0,str(R/'tools'));import shim_c_campaign_closure as checker
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest();old=D/'frame-root35';case=D/'frame-root36';case.mkdir();data=json.loads((old/'frozen.json').read_text());g=json.loads((old/'source-guard.json').read_text());work=case/'.build/edit';shutil.copytree(g['annotated'],work)
p=work/'rvv.c';s=p.read_text();binding=r'/*@ \wp::proof Dw31CopyHavoc: '+','.join(f'dw34_lane{j}_frame' for j in range(4))+'; */';assert s.count(binding)==1;s=s.replace(binding,'')
head=r'''/*@ \wp::strategy Dw36Leaf: \prover("z3",10), \prover("cvc5",10);
 \wp::strategy Dw36Instance:
 \tactic("Wp.instance",
   \goal(P_ext_same(M[shift_float32(A,Q)],N[shift_float32(A,Q)])),
   \incontext(T: \forall integer J; 0<=J<V ==> P_ext_same(M[shift_float32(A,J+C)],N[shift_float32(A,J+C)])),
   \select(T), \param("P1",Q-C), \children(Dw36Leaf)), Dw36Leaf;
 \wp::proof Dw36Instance: dw34_lane0_frame,dw34_lane1_frame,dw34_lane2_frame,dw34_lane3_frame;
*/
'''
p.write_text(head+s)
plain=Path(g['plain']);pieces=[]
for n in data['files']:
 a=(plain/n).read_text();b=(work/n).read_text()
 if a!=b:
  for line in difflib.unified_diff(a.splitlines(True),b.splitlines(True),fromfile='a/'+n,tofile='b/'+n):pieces.append(line if line.endswith('\n') else line+'\n\\ No newline at end of file\n')
(case/'proof.patch').write_text(''.join(pieces));data.update(proof_patches=[str((case/'proof.patch').relative_to(R))],previous_version=str(old.relative_to(R)),proof_stage='DW36 checked instantiation of the existing quantified copy-frame assertion at each actual lane. Keeps that older copy-frame and distinct-base obligation explicitly pending; new cuts are not independent closure. No C or public contract change.')
(case/'frozen.json').write_text(json.dumps(data,indent=2)+'\n');_,guard=checker.prepare(case,sha(case/'frozen.json'),'guard36');(case/'source-guard.json').write_text(json.dumps(guard,indent=2)+'\n');(case/'freeze.json').write_text(json.dumps({'frozen_sha256':sha(case/'frozen.json'),'proof_sha256':sha(case/'proof.patch')},indent=2)+'\n')
print(guard['passed'])
