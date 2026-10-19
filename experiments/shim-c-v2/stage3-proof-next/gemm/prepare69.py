from pathlib import Path
import sys,json,hashlib,subprocess,tempfile,difflib
H=Path(__file__).resolve().parent;R=H.parents[3];sys.path.insert(0,str(R/'tools'));import shim_c_campaign_closure as checker
old=H/'candidate68';new=H/'candidate69';new.mkdir();sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest();m=json.loads((old/'frozen.json').read_text());t=Path(tempfile.mkdtemp(prefix='gemm-fix-',dir='/tmp'));plain={}
for n,v in m['files'].items():plain[n]=(R/v['path']).read_text();(t/n).write_text(plain[n])
subprocess.run(['patch','--batch','--fuzz=0','-p1','-i',str(old/'proof.patch')],cwd=t,capture_output=True,check=True)
p=t/'neon.c';s=p.read_text()
for j in range(4):
 old=f'/*@ ghost float next_high_bias_word{j}=W0[((NC-nc)/8)*(8+8*(KC/4))+{4+j}]; */'
 new=f'/*@ ghost float next_high_bias_word{j}=w[{4+j}]; */'
 seed=f'/*@ assert next_high_bias_seed_{j}: ext_same(next_high_bias_word{j},stage3_gacc{{Stage3Block}}(A0,W0,0,(NC-nc)/8,{4+j},0,KC/4)); */'
 assert s.count(old)==s.count(seed)==1
 s=s.replace(seed,'')
 s=s.replace(old,new+'\n    '+seed)
strategy=r"""    \wp::strategy NextBiasZeroUnfold: \tactic("Wp.unfold",\ingoal(L_stage3_gacc(M,A,W,R,B,J,0,K)),\children(NextStepLeaf)), NextStepLeaf;
    \wp::proof NextBiasZeroUnfold: next_high_bias_seed_0,next_high_bias_seed_1,next_high_bias_seed_2,next_high_bias_seed_3;
"""
anchor='*/\n/*\nstruct xnn_f32_minmax_params'
assert s.count(anchor)==1
s=s.replace(anchor,strategy+anchor)
p.write_text(s)

d=[]
for n in m['files']:
 for x in difflib.unified_diff(plain[n].splitlines(True),(t/n).read_text().splitlines(True),fromfile='a/'+n,tofile='b/'+n):d.append(x if x.endswith('\n') else x+'\n\\ No newline at end of file\n')
(new/'proof.patch').write_text(''.join(d));m['proof_patches']=[str((new/'proof.patch').relative_to(R))];m['stage3']['proof_sha256']=sha(new/'proof.patch');m['proof_next'].update(previous_candidate_sha256=sha(old/'frozen.json'),revision='Capture high bias directly from current w; move all four seed obligations before real aggregate loads and unfold zero-step gacc. Retain all weight/frame/join/ref obligations. All new cut/RTE/assigns remain mandatory; no frozen C/spec/model change.');(new/'frozen.json').write_text(json.dumps(m,indent=2)+'\n');_,g=checker.prepare(new,sha(new/'frozen.json'),'diagnostic01');(new/'source-guard.json').write_text(json.dumps(g,indent=2)+'\n')
