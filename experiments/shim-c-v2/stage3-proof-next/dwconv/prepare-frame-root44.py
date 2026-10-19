from pathlib import Path
import json,sys,hashlib,shutil,difflib,re
D=Path(__file__).resolve().parent;R=D.parents[3];sys.path.insert(0,str(R/'tools'));import shim_c_campaign_closure as checker
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest();old=D/'frame-root42';case=D/'frame-root44';case.mkdir();data=json.loads((old/'frozen.json').read_text());g=json.loads((old/'source-guard.json').read_text());work=case/'.build/edit';shutil.copytree(g['annotated'],work)
p=work/'rvv.c';s=p.read_text()
marker=r'\wp::strategy Dw42Branches:'
assert s.count(marker)==1
extra=r'''\wp::strategy Dw44SepFilter:
 \tactic("Wp.filter", \children(Dw31Solve)), Dw31Solve;
    \wp::strategy Dw44Branches:
 \tactic("Wp.cut", \incontext(T: !separated(A,N,B,M)), \select(T),
   \param("clause",separated(A,N,B,M)), \children(Dw44SepFilter)), Dw44SepFilter;
    '''
s=s.replace(marker,extra+marker)
assert s.count(r'\children(Dw42Branches)')==1
p.write_text(s.replace(r'\children(Dw42Branches)',r'\children(Dw44Branches)'))
plain=Path(g['plain']);pieces=[]
for n in data['files']:
 a=(plain/n).read_text();b=(work/n).read_text()
 if a!=b:
  for line in difflib.unified_diff(a.splitlines(True),b.splitlines(True),fromfile='a/'+n,tofile='b/'+n):pieces.append(line if line.endswith('\n') else line+'\n\\ No newline at end of file\n')
(case/'proof.patch').write_text(''.join(pieces));data.update(proof_patches=[str((case/'proof.patch').relative_to(R))],previous_version=str(old.relative_to(R)),proof_stage='DW44 cuts the positive separated proposition only in the assigned havoc branch, proving that clause as a mandatory child before using it; ordinary relevance filter acts on the pure address child. No new assumptions or skipped children. Original base debt retained.')
(case/'frozen.json').write_text(json.dumps(data,indent=2)+'\n');_,guard=checker.prepare(case,sha(case/'frozen.json'),'guard44');(case/'source-guard.json').write_text(json.dumps(guard,indent=2)+'\n');(case/'freeze.json').write_text(json.dumps({'frozen_sha256':sha(case/'frozen.json'),'proof_sha256':sha(case/'proof.patch')},indent=2)+'\n')
print(guard['passed'])
