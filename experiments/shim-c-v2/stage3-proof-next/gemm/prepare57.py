from pathlib import Path
import sys,json,hashlib,subprocess,tempfile,difflib
H=Path(__file__).resolve().parent;R=H.parents[3];sys.path.insert(0,str(R/'tools'));import shim_c_campaign_closure as checker
old=H/'candidate56';new=H/'candidate57';new.mkdir();sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest();m=json.loads((old/'frozen.json').read_text());t=Path(tempfile.mkdtemp(prefix='gemm-fix-',dir='/tmp'));plain={}
for n,v in m['files'].items():plain[n]=(R/v['path']).read_text();(t/n).write_text(plain[n])
subprocess.run(['patch','--batch','--fuzz=0','-p1','-i',str(old/'proof.patch')],cwd=t,capture_output=True,check=True)
p=t/'neon.c';s=p.read_text();needle='\\wp::proof NextStepUnfold: next_fma_pre_r0;';assert s.count(needle)==1;s=s.replace(needle,'\\wp::proof NextStepUnfold: next_fma_pre_r0,next_fma_pre_r1,next_fma_pre_r2,next_fma_pre_r3;')
pre='';post=''
for j in range(1,4):
 ra='next_read{Stage3Block}(A0,(KC-k)/4)';rw=f'next_read{{Stage3Block}}(W0,((NC-nc)/8)*(8+8*(KC/4))+8+8*((KC-k)/4)+{j})';rc=f'stage3_gacc{{Stage3Block}}(A0,W0,0,(NC-nc)/8,{j},(KC-k)/4,KC/4)';rr=f'stage3_gacc{{Stage3Block}}(A0,W0,0,(NC-nc)/8,{j},(KC-k)/4+1,KC/4)'
 pre+=f'      /*@ assert next_fma_pre_a{j}: ext_same(va0c0.lane[{j}],{ra}); */\n      /*@ assert next_fma_pre_w{j}: ext_same(vb0123c0.lane[{j}],{rw}); */\n      /*@ assert next_fma_pre_c{j}: ext_same(vacc0x0.lane[{j}],{rc}); */\n      /*@ assert next_fma_pre_r{j}: ext_same({rr},shim_fma32({ra},{rw},{rc})); */\n'
 actual=f'vacc0x0.lane[{j}],va0c0.lane[{j}],vb0123c0.lane[{j}],next_acc_scalar{j}'
 post+=f'      /*@ ghost next_fma_result({actual}); */\n      /*@ assert next_fma_result_ground_{j}: next_fma_result_relation({actual},{ra},{rw},{rc},{rr}); */\n'
needle='      vacc0x0 = vfmaq_f32(vacc0x0, va0c0, vb0123c0);';assert s.count(needle)==1;s=s.replace(needle,pre+needle)
needle='      /*@ assert next_acc_after_0_fixed_0:';assert s.count(needle)==1;s=s.replace(needle,post+needle);p.write_text(s)

d=[]
for n in m['files']:
 for x in difflib.unified_diff(plain[n].splitlines(True),(t/n).read_text().splitlines(True),fromfile='a/'+n,tofile='b/'+n):d.append(x if x.endswith('\n') else x+'\n\\ No newline at end of file\n')
(new/'proof.patch').write_text(''.join(d));m['proof_patches']=[str((new/'proof.patch').relative_to(R))];m['stage3']['proof_sha256']=sha(new/'proof.patch');m['proof_next'].update(previous_candidate_sha256=sha(old/'frozen.json'),revision='Extend checked first-FMA lane0 proof to lanes1..3 using existing scalar snapshots. Each lane has four mandatory antecedents and one result-instance cut; all four reference-step goals retain the checked unfolding tactic. No new snapshot, helper contract or actual arithmetic.');(new/'frozen.json').write_text(json.dumps(m,indent=2)+'\n');_,g=checker.prepare(new,sha(new/'frozen.json'),'diagnostic01');(new/'source-guard.json').write_text(json.dumps(g,indent=2)+'\n')
