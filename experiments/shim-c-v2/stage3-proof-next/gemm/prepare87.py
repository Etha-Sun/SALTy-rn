from pathlib import Path
import sys,json,hashlib,subprocess,tempfile,difflib,re
H=Path(__file__).resolve().parent;R=H.parents[3];sys.path.insert(0,str(R/'tools'));import shim_c_campaign_closure as checker
old=H/'candidate86';new=H/'candidate87';new.mkdir();sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest();m=json.loads((old/'frozen.json').read_text());t=Path(tempfile.mkdtemp(prefix='gemm-fix-',dir='/tmp'));plain={}
for n,v in m['files'].items():plain[n]=(R/v['path']).read_text();(t/n).write_text(plain[n])
subprocess.run(['patch','--batch','--fuzz=0','-p1','-i',str(old/'proof.patch')],cwd=t,capture_output=True,check=True)
p=t/'neon.c';s=p.read_text();pat=r'(\\wp::proof NextWeightFrameHavoc:\s*)([^;]+);';m0=re.search(pat,s);assert m0
xs=[x.strip() for x in m0[2].split(',')];assert 'next_w_frame_0' in xs;xs.remove('next_w_frame_0');s=s[:m0.start()]+m0[1]+','.join(xs)+';'+s[m0.end():]
parts=[r'/*@ \wp::strategy NextFrame87Leaf: \prover("z3",5), \prover("cvc5",5);'];prev='NextFrame87Leaf'
for depth in range(1,11):
 name=f'NextFrame87H{depth}';parts.append(r' \wp::strategy '+name+r': NextFrame87Leaf, \tactic("Wp.havoc",\ingoal(memcpy(M,A,U,A,N)[P]),\children('+prev+r'));');prev=name
parts.append(r' \wp::strategy NextFrame87ReadFirst: \tactic("Wp.unfold",\ingoal(L_next_read(M,A,Q)),\children('+prev+r')), '+prev+';');parts.append(r' \wp::proof NextFrame87ReadFirst: next_w_frame_0; */');p.write_text('\n'.join(parts)+'\n'+s)

d=[]
for n in m['files']:
 for x in difflib.unified_diff(plain[n].splitlines(True),(t/n).read_text().splitlines(True),fromfile='a/'+n,tofile='b/'+n):d.append(x if x.endswith('\n') else x+'\n\\ No newline at end of file\n')
(new/'proof.patch').write_text(''.join(d));m['proof_patches']=[str((new/'proof.patch').relative_to(R))];m['stage3']['proof_sha256']=sha(new/'proof.patch');m['proof_next'].update(previous_candidate_sha256=sha(old/'frozen.json'),revision='Checked next_read expansion and finite ten-level havoc decomposition for the first weight frame; all branches retained. Existing entry/invariant dependencies remain mandatory. No new requires or implementation changes.');(new/'frozen.json').write_text(json.dumps(m,indent=2)+'\n');_,g=checker.prepare(new,sha(new/'frozen.json'),'diagnostic01');(new/'source-guard.json').write_text(json.dumps(g,indent=2)+'\n')
