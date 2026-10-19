from pathlib import Path
import sys,json,hashlib,subprocess,tempfile,difflib
H=Path(__file__).resolve().parent;R=H.parents[3];sys.path.insert(0,str(R/'tools'));import shim_c_campaign_closure as checker
old=H/'candidate67';new=H/'candidate68';new.mkdir();sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest();m=json.loads((old/'frozen.json').read_text());t=Path(tempfile.mkdtemp(prefix='gemm-fix-',dir='/tmp'));plain={}
for n,v in m['files'].items():plain[n]=(R/v['path']).read_text();(t/n).write_text(plain[n])
subprocess.run(['patch','--batch','--fuzz=0','-p1','-i',str(old/'proof.patch')],cwd=t,capture_output=True,check=True)
p=t/'neon.c';s=p.read_text()
label='    //@ ghost Stage3Block: ;';assert s.count(label)==1
snap=''.join(f'\n    /*@ ghost float next_high_bias_word{j}=W0[((NC-nc)/8)*(8+8*(KC/4))+{4+j}]; */' for j in range(4));s=s.replace(label,label+snap)
needle='    float32x4_t vacc0x1 = vld1q_f32(w);';assert s.count(needle)==1
cuts=''.join(f'    /*@ assert next_high_bias_weight_{j}: ext_same(w[{j}],next_high_bias_word{j}); */\n' for j in range(4));s=s.replace(needle,cuts+needle)
for j in range(4):
 needle=f'/*@ assert next_high_bias_ref_{j}:';assert s.count(needle)==1
 ref=f'stage3_gacc{{Stage3Block}}(A0,W0,0,(NC-nc)/8,{4+j},0,KC/4)'
 args=f'vacc0x1.lane[{j}],next_high_bias_word{j},next_high_bias_word{j}'
 cuts=f'/*@ assert next_high_bias_frame_{j}: ext_same(vacc0x1.lane[{j}],next_high_bias_word{j}); */\n      '
 cuts+=f'/*@ assert next_high_bias_seed_{j}: ext_same(next_high_bias_word{j},{ref}); */\n      '
 cuts+=f'/*@ ghost next_splat_transport({args}); */\n      '
 cuts+=f'/*@ assert next_high_bias_join_{j}: next_splat_join({args},{ref}); */\n      '
 s=s.replace(needle,cuts+needle)
p.write_text(s)

d=[]
for n in m['files']:
 for x in difflib.unified_diff(plain[n].splitlines(True),(t/n).read_text().splitlines(True),fromfile='a/'+n,tofile='b/'+n):d.append(x if x.endswith('\n') else x+'\n\\ No newline at end of file\n')
(new/'proof.patch').write_text(''.join(d));m['proof_patches']=[str((new/'proof.patch').relative_to(R))];m['stage3']['proof_sha256']=sha(new/'proof.patch');m['proof_next'].update(previous_candidate_sha256=sha(old/'frozen.json'),revision='Capture high bias source scalars at Stage3Block; prove post-first-load weight, high-result frame, zero-step seed and transport at loop entry. All new cut/RTE/assigns remain mandatory; no frozen C/spec/model change.');(new/'frozen.json').write_text(json.dumps(m,indent=2)+'\n');_,g=checker.prepare(new,sha(new/'frozen.json'),'diagnostic01');(new/'source-guard.json').write_text(json.dumps(g,indent=2)+'\n')
