from pathlib import Path
import sys,json,hashlib,subprocess,tempfile,difflib
H=Path(__file__).resolve().parent;R=H.parents[3];sys.path.insert(0,str(R/'tools'));import shim_c_campaign_closure as checker
old=H/'candidate76';new=H/'candidate77';new.mkdir();sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest();m=json.loads((old/'frozen.json').read_text());t=Path(tempfile.mkdtemp(prefix='gemm-fix-',dir='/tmp'));plain={}
for n,v in m['files'].items():plain[n]=(R/v['path']).read_text();(t/n).write_text(plain[n])
subprocess.run(['patch','--batch','--fuzz=0','-p1','-i',str(old/'proof.patch')],cwd=t,capture_output=True,check=True)
p=t/'neon.c';s=p.read_text();s=r'''/*@ \wp::strategy NextFmaGroundLeaf: \prover("z3",10), \prover("cvc5",15);
    \wp::strategy NextFmaGroundUnfold: \tactic("Wp.unfold",\when(P_next_fma_result_relation(R,X,Y,Z,U,V,W,P)),\goal(P_ext_same(R,P)),\children(NextFmaGroundLeaf)), NextFmaGroundLeaf;
    \wp::proof NextFmaGroundUnfold: next_high_after1_0,next_high_after1_1,next_high_after1_2,next_high_after1_3;
*/
'''+s;p.write_text(s)

d=[]
for n in m['files']:
 for x in difflib.unified_diff(plain[n].splitlines(True),(t/n).read_text().splitlines(True),fromfile='a/'+n,tofile='b/'+n):d.append(x if x.endswith('\n') else x+'\n\\ No newline at end of file\n')
(new/'proof.patch').write_text(''.join(d));m['proof_patches']=[str((new/'proof.patch').relative_to(R))];m['stage3']['proof_sha256']=sha(new/'proof.patch');m['proof_next'].update(previous_candidate_sha256=sha(old/'frozen.json'),revision='Only checked Wp.unfold strategy targeting the existing ground FMA-result relation whose endpoints match the exact result goal; no new VC premise, assertion, helper or implementation change. Original FMA operation and all body obligations retained.');(new/'frozen.json').write_text(json.dumps(m,indent=2)+'\n');_,g=checker.prepare(new,sha(new/'frozen.json'),'diagnostic01');(new/'source-guard.json').write_text(json.dumps(g,indent=2)+'\n')
