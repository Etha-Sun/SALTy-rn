from pathlib import Path
import json,sys,hashlib,shutil,difflib,re
D=Path(__file__).resolve().parent;R=D.parents[3];sys.path.insert(0,str(R/'tools'));import shim_c_campaign_closure as checker
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest();old=D/'frame-root36';case=D/'frame-root37';case.mkdir();data=json.loads((old/'frozen.json').read_text());g=json.loads((old/'source-guard.json').read_text());work=case/'.build/edit';shutil.copytree(g['annotated'],work)
p=work/'rvv.c';s=p.read_text();marker=r'\wp::proof Dw36Instance:';assert s.count(marker)==1;s=s.replace(marker,r'\wp::proof Dw37Instance:')
head=r'''/*@ \wp::strategy Dw37Instance:
 \tactic("Wp.instance",
   \goal(P_ext_same(M[shift_float32(A,Q)],N[shift_float32(A,Q)])),
   \incontext(T: \forall integer J; 0<=J<=V ==> P_ext_same(M[shift_float32(A,J+C)],N[shift_float32(A,J+C)])),
   \select(T), \param("P1",Q-C), \children(Dw36Leaf)), Dw36Instance;
*/
'''
p.write_text(head+s)
plain=Path(g['plain']);pieces=[]
for n in data['files']:
 a=(plain/n).read_text();b=(work/n).read_text()
 if a!=b:
  for line in difflib.unified_diff(a.splitlines(True),b.splitlines(True),fromfile='a/'+n,tofile='b/'+n):pieces.append(line if line.endswith('\n') else line+'\n\\ No newline at end of file\n')
(case/'proof.patch').write_text(''.join(pieces));data.update(proof_patches=[str((case/'proof.patch').relative_to(R))],previous_version=str(old.relative_to(R)),proof_stage='DW37 handles the inclusive upper-bound normal form produced at lane3 by checked instantiation. All original copy-frame/distinct-base and helper/callsite debts retained; no new assumptions, C or public contract change.')
(case/'frozen.json').write_text(json.dumps(data,indent=2)+'\n');_,guard=checker.prepare(case,sha(case/'frozen.json'),'guard37');(case/'source-guard.json').write_text(json.dumps(guard,indent=2)+'\n');(case/'freeze.json').write_text(json.dumps({'frozen_sha256':sha(case/'frozen.json'),'proof_sha256':sha(case/'proof.patch')},indent=2)+'\n')
print(guard['passed'])
