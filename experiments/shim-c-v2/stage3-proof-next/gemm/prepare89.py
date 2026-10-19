from pathlib import Path
import sys,json,hashlib,subprocess,tempfile,difflib,re
H=Path(__file__).resolve().parent;R=H.parents[3];sys.path.insert(0,str(R/'tools'));import shim_c_campaign_closure as checker
old=H/'candidate88';new=H/'candidate89';new.mkdir();sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest();m=json.loads((old/'frozen.json').read_text());t=Path(tempfile.mkdtemp(prefix='gemm-fix-',dir='/tmp'));plain={}
for n,v in m['files'].items():plain[n]=(R/v['path']).read_text();(t/n).write_text(plain[n])
subprocess.run(['patch','--batch','--fuzz=0','-p1','-i',str(old/'proof.patch')],cwd=t,capture_output=True,check=True)
p=t/'neon.c';s=p.read_text();assert s.startswith('/*@ \\wp::strategy NextFrame88Leaf:');s=s[s.index('*/')+2:].lstrip('\n')
head='/*@ \\wp::strategy NextFrame89Leaf: \\prover("z3",10), \\prover("cvc5",10);\n \\wp::strategy NextFrame89Instance:\n   \\tactic("Wp.instance",\\incontext(linked(M)),\\incontext(T),\\select(T),\\param("P1",M),\\children(NextFrame89Leaf)), NextFrame89Leaf;\n \\wp::strategy NextFrame89Linked:\n   \\tactic("Wp.lemma",\\goal(G),\\select(G),\\param("lemma","L_tmp_1_11666_linked"),\\children(NextFrame89Instance)), NextFrame89Leaf;\n \\wp::strategy NextFrame89Havoc: \\tactic("Wp.havoc",\\ingoal(memcpy(M,A,U,A,N)[P]),\\children(NextFrame89Linked)), NextFrame89Linked;\n \\wp::strategy NextFrame89Read: \\tactic("Wp.unfold",\\ingoal(L_next_read(M,A,Q)),\\children(NextFrame89Havoc)), NextFrame89Havoc;\n \\wp::proof NextFrame89Read: next_w_frame_0;\n*/\n'
p.write_text(head+s)

d=[]
for n in m['files']:
 for x in difflib.unified_diff(plain[n].splitlines(True),(t/n).read_text().splitlines(True),fromfile='a/'+n,tofile='b/'+n):d.append(x if x.endswith('\n') else x+'\n\\ No newline at end of file\n')
(new/'proof.patch').write_text(''.join(d));m['proof_patches']=[str((new/'proof.patch').relative_to(R))];m['stage3']['proof_sha256']=sha(new/'proof.patch');m['proof_next'].update(previous_candidate_sha256=sha(old/'frozen.json'),revision='Try checked instantiation of the existing generated MemTyped local-allocation linked lemma at the actual initial allocation map, after the real last-copy havoc. No new model facts or requires; all original entry/invariant and Assigned/Unassigned debts remain mandatory.');(new/'frozen.json').write_text(json.dumps(m,indent=2)+'\n');_,g=checker.prepare(new,sha(new/'frozen.json'),'diagnostic01');(new/'source-guard.json').write_text(json.dumps(g,indent=2)+'\n')
