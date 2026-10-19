from pathlib import Path
import sys,json,hashlib,subprocess,tempfile,difflib
H=Path(__file__).resolve().parent;R=H.parents[3];sys.path.insert(0,str(R/'tools'));import shim_c_campaign_closure as checker
old=H/'candidate23';new=H/'candidate32';new.mkdir();sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest();m=json.loads((old/'frozen.json').read_text());t=Path(tempfile.mkdtemp(prefix='gemm-fix-',dir='/tmp'));plain={}
for n,v in m['files'].items():plain[n]=(R/v['path']).read_text();(t/n).write_text(plain[n])
subprocess.run(['patch','--batch','--fuzz=0','-p1','-i',str(old/'proof.patch')],cwd=t,capture_output=True,check=True)
p=t/'fp_primitives.h';s=p.read_text()
strategy=r"""/*@ \wp::strategy NextFrameClearLeaf: \prover("z3",30), \prover("cvc5",30);
    \wp::strategy NextFrameClearOne:
      \tactic("Wp.clear", \when(next_vec4_acc(_,_,_,_,_,_,_)), \children(NextFrameClearLeaf));
    \wp::proof NextFrameClearOne: next_acc_frame_chain_0; */
"""
assert s.count('#endif')==1;p.write_text(s.replace('#endif',strategy+'#endif'))

d=[]
for n in m['files']:
 for x in difflib.unified_diff(plain[n].splitlines(True),(t/n).read_text().splitlines(True),fromfile='a/'+n,tofile='b/'+n):d.append(x if x.endswith('\n') else x+'\n\\ No newline at end of file\n')
(new/'proof.patch').write_text(''.join(d));m['proof_patches']=[str((new/'proof.patch').relative_to(R))];m['stage3']['proof_sha256']=sha(new/'proof.patch');m['proof_next'].update(previous_candidate_sha256=sha(old/'frozen.json'),revision='Independent checked Wp.clear nonrecursive single next_vec4_acc hypothesis-removal strategy on first real kernel frame; removes hypotheses only, retains all proof obligations and original contracts. Raw verdict authoritative, including tactical result recording limitations.');(new/'frozen.json').write_text(json.dumps(m,indent=2)+'\n');_,g=checker.prepare(new,sha(new/'frozen.json'),'diagnostic01');(new/'source-guard.json').write_text(json.dumps(g,indent=2)+'\n')
