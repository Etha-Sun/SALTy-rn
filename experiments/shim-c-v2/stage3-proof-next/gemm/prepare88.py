from pathlib import Path
import sys,json,hashlib,subprocess,tempfile,difflib,re
H=Path(__file__).resolve().parent;R=H.parents[3];sys.path.insert(0,str(R/'tools'));import shim_c_campaign_closure as checker
old=H/'candidate87';new=H/'candidate88';new.mkdir();sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest();m=json.loads((old/'frozen.json').read_text());t=Path(tempfile.mkdtemp(prefix='gemm-fix-',dir='/tmp'));plain={}
for n,v in m['files'].items():plain[n]=(R/v['path']).read_text();(t/n).write_text(plain[n])
subprocess.run(['patch','--batch','--fuzz=0','-p1','-i',str(old/'proof.patch')],cwd=t,capture_output=True,check=True)
p=t/'neon.c';s=p.read_text();assert s.startswith('/*@ \\wp::strategy NextFrame87Leaf:');s=s[s.index('*/')+2:].lstrip('\n')
head=r'''/*@ \wp::strategy NextFrame88Leaf: \prover("z3",15), \prover("cvc5",15);
 \wp::strategy NextFrame88Havoc: \tactic("Wp.havoc",\ingoal(memcpy(M,A,U,A,N)[P]),\children(NextFrame88Leaf)), NextFrame88Leaf;
 \wp::strategy NextFrame88Read: \tactic("Wp.unfold",\ingoal(L_next_read(M,A,Q)),\children(NextFrame88Havoc)), NextFrame88Havoc;
 \wp::proof NextFrame88Read: next_w_frame_0;
*/
'''
p.write_text(head+s)

d=[]
for n in m['files']:
 for x in difflib.unified_diff(plain[n].splitlines(True),(t/n).read_text().splitlines(True),fromfile='a/'+n,tofile='b/'+n):d.append(x if x.endswith('\n') else x+'\n\\ No newline at end of file\n')
(new/'proof.patch').write_text(''.join(d));m['proof_patches']=[str((new/'proof.patch').relative_to(R))];m['stage3']['proof_sha256']=sha(new/'proof.patch');m['proof_next'].update(previous_candidate_sha256=sha(old/'frozen.json'),revision='Checked next_read expansion and one actual tmp copy. Full VC inspection finds the second stage3_read_w invariant on the post-loop-havoc map; earlier first-invariant-only diagnosis was incomplete. All havoc branches and existing entry/invariant dependencies remain mandatory. No new requires or implementation changes.');(new/'frozen.json').write_text(json.dumps(m,indent=2)+'\n');_,g=checker.prepare(new,sha(new/'frozen.json'),'diagnostic01');(new/'source-guard.json').write_text(json.dumps(g,indent=2)+'\n')
