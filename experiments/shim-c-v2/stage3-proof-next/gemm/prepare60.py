from pathlib import Path
import sys,json,hashlib,subprocess,tempfile,difflib
H=Path(__file__).resolve().parent;R=H.parents[3];sys.path.insert(0,str(R/'tools'));import shim_c_campaign_closure as checker
old=H/'candidate59';new=H/'candidate60';new.mkdir();sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest();m=json.loads((old/'frozen.json').read_text());t=Path(tempfile.mkdtemp(prefix='gemm-fix-',dir='/tmp'));plain={}
for n,v in m['files'].items():plain[n]=(R/v['path']).read_text();(t/n).write_text(plain[n])
subprocess.run(['patch','--batch','--fuzz=0','-p1','-i',str(old/'proof.patch')],cwd=t,capture_output=True,check=True)
p=t/'neon.c';s=p.read_text()
needle='\\wp::proof NextStepUnfold: next_fma_pre_r0,next_fma_pre_r1,next_fma_pre_r2,next_fma_pre_r3;';assert s.count(needle)==1
strategy='\\wp::strategy NextSecondUnfold: \\tactic("Wp.unfold",\\ingoal(L_stage3_gacc(M,A,W,R,B,J,2+T,K)),\\children(NextStepLeaf)), NextStepLeaf;\n    \\wp::proof NextSecondUnfold: '+','.join('next_fma_second_pre_r'+str(j) for j in range(4))+';'
s=s.replace(needle,needle+'\n    '+strategy)
pre='';post=''
for j in range(4):
 ra='next_read{Stage3Block}(A0,(KC-k)/4+1)'
 rw=f'next_read{{Stage3Block}}(W0,((NC-nc)/8)*(8+8*(KC/4))+8+8*((KC-k)/4+1)+{j})'
 rc=f'stage3_gacc{{Stage3Block}}(A0,W0,0,(NC-nc)/8,{j},(KC-k)/4+1,KC/4)'
 rr=f'stage3_gacc{{Stage3Block}}(A0,W0,0,(NC-nc)/8,{j},(KC-k)/4+2,KC/4)'
 pre+=f'      /*@ ghost float next_second_acc{j} = vacc0x0.lane[{j}]; */\n'
 pre+=f'      /*@ assert next_fma_second_pre_a{j}: ext_same(va0c1.lane[{j}],{ra}); */\n'
 pre+=f'      /*@ assert next_fma_second_pre_w{j}: ext_same(vb0123c1.lane[{j}],{rw}); */\n'
 pre+=f'      /*@ assert next_fma_second_pre_c{j}: ext_same(vacc0x0.lane[{j}],{rc}); */\n'
 pre+=f'      /*@ assert next_fma_second_pre_r{j}: ext_same({rr},shim_fma32({ra},{rw},{rc})); */\n'
 actual=f'vacc0x0.lane[{j}],va0c1.lane[{j}],vb0123c1.lane[{j}],next_second_acc{j}'
 post+=f'      /*@ ghost next_fma_result({actual}); */\n'
 post+=f'      /*@ assert next_fma_second_ground_{j}: next_fma_result_relation({actual},{ra},{rw},{rc},{rr}); */\n'
needle='      vacc0x0 = vfmaq_f32(vacc0x0, va0c1, vb0123c1);';assert s.count(needle)==1;s=s.replace(needle,pre+needle+'\n'+post.rstrip());p.write_text(s)

d=[]
for n in m['files']:
 for x in difflib.unified_diff(plain[n].splitlines(True),(t/n).read_text().splitlines(True),fromfile='a/'+n,tofile='b/'+n):d.append(x if x.endswith('\n') else x+'\n\\ No newline at end of file\n')
(new/'proof.patch').write_text(''.join(d));m['proof_patches']=[str((new/'proof.patch').relative_to(R))];m['stage3']['proof_sha256']=sha(new/'proof.patch');m['proof_next'].update(previous_candidate_sha256=sha(old/'frozen.json'),revision='Extend first-step scheme to second FMA with four actual-current scalar snapshots, sixteen antecedent cuts and four ground instances. Dedicated recursive unfold strategy matches t+2. All new ghost/frame obligations must be inventoried and proved; frozen C/spec/model unchanged.');(new/'frozen.json').write_text(json.dumps(m,indent=2)+'\n');_,g=checker.prepare(new,sha(new/'frozen.json'),'diagnostic01');(new/'source-guard.json').write_text(json.dumps(g,indent=2)+'\n')
