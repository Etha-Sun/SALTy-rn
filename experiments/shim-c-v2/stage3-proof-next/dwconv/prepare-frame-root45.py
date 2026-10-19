from pathlib import Path
import json,sys,hashlib,shutil,difflib,re
D=Path(__file__).resolve().parent;R=D.parents[3];sys.path.insert(0,str(R/'tools'));import shim_c_campaign_closure as checker
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest();old=D/'frame-root44';case=D/'frame-root45';case.mkdir();data=json.loads((old/'frozen.json').read_text());g=json.loads((old/'source-guard.json').read_text());work=case/'.build/edit';shutil.copytree(g['annotated'],work)
needle=r'\base_addr(p)!=\base_addr(q) ==> \separated(p+(0..n-1),q); @/'
found=[]
for path in work.iterdir():
 if path.is_file() and path.suffix in ['.h','.c'] and needle in path.read_text():found.append(path)
assert len(found)==1,found
p=found[0];s=p.read_text();assert s.count(needle)==1
s=s.replace(needle,r'''\base_addr(p)!=\base_addr(q) ==> \separated(p+(0..n-1),q);
    ensures dw45_point_separated: \base_addr(p)!=\base_addr(q) ==>
      (\forall integer j; \separated(p+j,q)); @/''');p.write_text(s)
p=work/'rvv.c';s=p.read_text();marker=r'\wp::strategy Dw44Branches:';assert s.count(marker)==1
extra=r'''\wp::strategy Dw45SepInstance:
 \tactic("Wp.instance", \goal(separated(shift_float32(A,E),1,B,K)),
   \incontext(T: \forall integer J; separated(shift_float32(A,J+C),1,B,K)),
   \select(T), \param("P1",E-C), \children(Dw31Solve)),
 \tactic("Wp.instance", \goal(separated(shift_float32(A,E),1,B,K)),
   \incontext(T: \forall integer J; separated(shift_float32(A,J),1,B,K)),
   \select(T), \param("P1",E), \children(Dw31Solve)), Dw44SepFilter;
    '''
assert s.count(r'\children(Dw44SepFilter)')==1
s=s.replace(r'\children(Dw44SepFilter)',r'\children(Dw45SepInstance)')
p.write_text(s.replace(marker,extra+marker))
plain=Path(g['plain']);pieces=[]
for n in data['files']:
 a=(plain/n).read_text();b=(work/n).read_text()
 if a!=b:
  for line in difflib.unified_diff(a.splitlines(True),b.splitlines(True),fromfile='a/'+n,tofile='b/'+n):pieces.append(line if line.endswith('\n') else line+'\n\\ No newline at end of file\n')
(case/'proof.patch').write_text(''.join(pieces));data.update(proof_patches=[str((case/'proof.patch').relative_to(R))],previous_version=str(old.relative_to(R)),proof_stage='DW45 strengthens the existing real-body disjoint ghost helper with a conditional pointwise separation postcondition and instantiates it by checked Wp.instance in the retained mandatory separation cut. No new requires or axioms; full helper body and caller branches must pass.')
(case/'frozen.json').write_text(json.dumps(data,indent=2)+'\n');_,guard=checker.prepare(case,sha(case/'frozen.json'),'guard45');(case/'source-guard.json').write_text(json.dumps(guard,indent=2)+'\n');(case/'freeze.json').write_text(json.dumps({'frozen_sha256':sha(case/'frozen.json'),'proof_sha256':sha(case/'proof.patch')},indent=2)+'\n')
print(guard['passed'])
