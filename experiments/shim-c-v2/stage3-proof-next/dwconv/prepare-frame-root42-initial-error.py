from pathlib import Path
import json,sys,hashlib,shutil,difflib,re
D=Path(__file__).resolve().parent;R=D.parents[3];sys.path.insert(0,str(R/'tools'));import shim_c_campaign_closure as checker
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest();old=D/'frame-root37';case=D/'frame-root42';case.mkdir();data=json.loads((old/'frozen.json').read_text());g=json.loads((old/'source-guard.json').read_text());work=case/'.build/edit';shutil.copytree(g['annotated'],work)
p=work/'rvv.c';s=p.read_text()
marker=r'\wp::strategy Dw31CopyHavoc:'
assert s.count(marker)==1
extra=r"""\wp::strategy Dw42Branches:
 \tactic("Wp.filter", \incontext(T: !separated(A,N,B,M)), \select(T),
   \param("anti",\true), \children(Dw31Solve)),
 \tactic("Wp.filter", \children(Dw31Solve)), Dw31Solve;
    """
s=s.replace(marker,extra+marker)
old=r'\wp::strategy Dw31CopyHavoc: \tactic("Wp.havoc",\ingoal(memcpy(M,A,U,A,N)[P]),\children(Dw31Solve)), Dw31Solve;'
new=old.replace('\\children(Dw31Solve)','\\children(Dw42Branches)')
assert s.count(old)==1 and old!=new
p.write_text(s.replace(old,new))
plain=Path(g['plain']);pieces=[]
for n in data['files']:
 a=(plain/n).read_text();b=(work/n).read_text()
 if a!=b:
  for line in difflib.unified_diff(a.splitlines(True),b.splitlines(True),fromfile='a/'+n,tofile='b/'+n):pieces.append(line if line.endswith('\n') else line+'\n\\ No newline at end of file\n')
(case/'proof.patch').write_text(''.join(pieces));data.update(proof_patches=[str((case/'proof.patch').relative_to(R))],previous_version=str(old.relative_to(R)),proof_stage='DW42 applies original checked Wp.filter in absurd mode only to the inner havoc branch carrying not-separated; other branch uses ordinary checked relevance filter. No new assertions, hypotheses, model changes or omitted branches. Original base/frame obligations retained.')
(case/'frozen.json').write_text(json.dumps(data,indent=2)+'\n');_,guard=checker.prepare(case,sha(case/'frozen.json'),'guard42');(case/'source-guard.json').write_text(json.dumps(guard,indent=2)+'\n');(case/'freeze.json').write_text(json.dumps({'frozen_sha256':sha(case/'frozen.json'),'proof_sha256':sha(case/'proof.patch')},indent=2)+'\n')
print(guard['passed'])
