from pathlib import Path
import sys,json,hashlib,shutil,difflib
C=Path(__file__).resolve().parent;R=C.parents[4];sys.path.insert(0,str(R/'tools'));import shim_c_campaign_closure as checker
old=C.parent/'root37';m=json.loads((old/'frozen.json').read_text());g=json.loads((old/'source-guard.json').read_text());work=C/'.build/edit';shutil.copytree(g['annotated'],work)
p=work/'rvv.c';s=p.read_text();a=s.index('/*@ \\wp::strategy Root34Leaf:');z=s.index('*/',a)+2;s=s[:a]+'/*@ \\wp::strategy Root34Leaf: \\prover("z3",15), \\prover("cvc5",15);\n    \\wp::strategy Root38Channel: \\tactic("Wp.TacRewrite.Left",\\goal(shift_uint32(B,X-K)==shift_uint32(B,Y-K)),\\incontext(T:X==Y),\\select(T),\\children(Root34Leaf)), Root34Leaf;\n    \\wp::strategy Root38Base: \\tactic("Wp.TacRewrite.Left",\\goal(shift_uint32(A,N)==shift_uint32(B,M)),\\incontext(T:A==B),\\select(T),\\children(Root38Channel)), Root38Channel;\n    \\wp::strategy Root37Rewrite: \\tactic("Wp.TacRewrite.Left",\\goal(R==shift_uint32(B,N)),\\incontext(T:R==shift_uint32(A,M)),\\select(T),\\children(Root38Base)), Root38Base;\n    \\wp::strategy Root35Filter: \\tactic("Wp.filter",\\children(Root37Rewrite)), Root37Rewrite;\n    \\wp::strategy Root34Split: \\tactic("Wp.split",\\children(Root35Filter)), Root34Leaf;\n    \\wp::proof Root34Split: root32_before_merges;\n*/'+s[z:];p.write_text(s)
plain=Path(g['plain']);patch=[]
for n in m['files']:
 if (plain/n).read_bytes()!=(work/n).read_bytes():
  for l in difflib.unified_diff((plain/n).read_text().splitlines(True),(work/n).read_text().splitlines(True),fromfile='a/'+n,tofile='b/'+n):patch.append(l if l.endswith('\n') else l+'\n\\ No newline at end of file\n')
(C/'proof.patch').write_text(''.join(patch));sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
m.update(proof_patches=[str((C/'proof.patch').relative_to(R))],proof_sha256=sha(C/'proof.patch'),previous_version=str(old.relative_to(R)),proof_stage='root38 follows the checked cursor rewrite with exact base and channel frame equality substitutions. Goal becomes reflexive using existing proved cuts; no new C, assertion, helper, contract or premise.')
(C/'frozen.json').write_text(json.dumps(m,indent=2)+'\n');_,guard=checker.prepare(C,sha(C/'frozen.json'),'guard01');(C/'source-guard.json').write_text(json.dumps(guard,indent=2)+'\n');print(guard['passed'])
