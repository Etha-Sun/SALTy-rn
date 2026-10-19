from pathlib import Path
import json,sys,hashlib,shutil,difflib,re
D=Path(__file__).resolve().parent;R=D.parents[3];sys.path.insert(0,str(R/'tools'));import shim_c_campaign_closure as checker
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest();old=D/'frame-root43';case=D/'frame-root46';case.mkdir();data=json.loads((old/'frozen.json').read_text());g=json.loads((old/'source-guard.json').read_text());work=case/'.build/edit';shutil.copytree(g['annotated'],work)
p=work/'rvv.c';s=p.read_text()
marker=r'\wp::strategy Dw31CopyHavoc:'
assert s.count(marker)==1
extra=r'''\wp::strategy Dw46UnfoldWeight:
 \tactic("Wp.unfold",\incontext(T:valid_rd(M,shift_float32(A,K),1)),
   \select(shift_float32(A,K)),\children(Dw31Solve)), Dw31Solve;
    \wp::proof Dw46UnfoldWeight: dw43_weight_pre_positive;
    '''
p.write_text(s.replace(marker,extra+marker))
plain=Path(g['plain']);pieces=[]
for n in data['files']:
 a=(plain/n).read_text();b=(work/n).read_text()
 if a!=b:
  for line in difflib.unified_diff(a.splitlines(True),b.splitlines(True),fromfile='a/'+n,tofile='b/'+n):pieces.append(line if line.endswith('\n') else line+'\n\\ No newline at end of file\n')
(case/'proof.patch').write_text(''.join(pieces));data.update(proof_patches=[str((case/'proof.patch').relative_to(R))],previous_version=str(old.relative_to(R)),proof_stage='DW46 checked unfolding of the existing dynamic shift_float32 definition in the one-element pre-validity hypothesis; no new assertion, axiom, requires, or model change. Direct validity and original base debts remain mandatory.')
(case/'frozen.json').write_text(json.dumps(data,indent=2)+'\n');_,guard=checker.prepare(case,sha(case/'frozen.json'),'guard46');(case/'source-guard.json').write_text(json.dumps(guard,indent=2)+'\n');(case/'freeze.json').write_text(json.dumps({'frozen_sha256':sha(case/'frozen.json'),'proof_sha256':sha(case/'proof.patch')},indent=2)+'\n')
print(guard['passed'])
