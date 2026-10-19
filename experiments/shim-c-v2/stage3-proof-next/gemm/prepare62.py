from pathlib import Path
import sys,json,hashlib,subprocess,tempfile,difflib
H=Path(__file__).resolve().parent;R=H.parents[3];sys.path.insert(0,str(R/'tools'));import shim_c_campaign_closure as checker
old=H/'candidate61';new=H/'candidate62';new.mkdir();sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest();m=json.loads((old/'frozen.json').read_text());t=Path(tempfile.mkdtemp(prefix='gemm-fix-',dir='/tmp'));plain={}
for n,v in m['files'].items():plain[n]=(R/v['path']).read_text();(t/n).write_text(plain[n])
subprocess.run(['patch','--batch','--fuzz=0','-p1','-i',str(old/'proof.patch')],cwd=t,capture_output=True,check=True)
import re
p=t/'neon.c';s=p.read_text()
pat=r'(?m)^([ \t]*)loop invariant stage3_acc_neon_0_1: \\forall integer j; 0<=j<4 ==> (.*);$'
mh=re.search(pat,s);assert mh
rep='\n'.join(mh[1]+'loop invariant next_high_inv_'+str(j)+': '+re.sub(r'\bj\b',str(j),mh[2])+';' for j in range(4))
s=s[:mh.start()]+rep+s[mh.end():]
for strategy,step in [('NextStepUnfold',0),('NextSecondUnfold',1)]:
 pat=r'(\\wp::proof '+strategy+r':\s*)([^;]+);'
 ms=re.search(pat,s);assert ms
 extra=','.join(f'next_high_pre_r{step}_{j}' for j in range(4))
 s=s[:ms.start()]+ms[1]+ms[2]+','+extra+';'+s[ms.end():]
pat=r'(?m)^([ \t]*)const float32x2_t va0 = vld1_f32\(a0\);([^\n]*)$'
ml=re.search(pat,s);assert ml
before=''.join(f'      /*@ ghost float next_high_old0_{j} = vacc0x1.lane[{j}]; */\n' for j in range(4))
after=''.join(f'\n      /*@ assert next_high_first_frame_{j}: ext_same(vacc0x1.lane[{j}],next_high_old0_{j}); */' for j in range(4))
s=s[:ml.start()]+before+ml[0]+after+s[ml.end():]
for step in range(2):
 pre='';post=''
 if step==0:
  pre+=''.join(f'      /*@ assert next_high_full_frame_{j}: ext_same(vacc0x1.lane[{j}],next_high_old0_{j}); */\n' for j in range(4))
 else:
  pre+=''.join(f'      /*@ ghost float next_high_old1_{j} = vacc0x1.lane[{j}]; */\n' for j in range(4))
 for j in range(4):
  lane=j+4
  time=f'(KC-k)/4+{step}'
  idx=f'((NC-nc)/8)*(8+8*(KC/4))+8+8*({time})+{lane}'
  ra=f'next_read{{Stage3Block}}(A0,{time})'
  rw=f'next_read{{Stage3Block}}(W0,{idx})'
  rc=f'stage3_gacc{{Stage3Block}}(A0,W0,0,(NC-nc)/8,{lane},{time},KC/4)'
  rr=f'stage3_gacc{{Stage3Block}}(A0,W0,0,(NC-nc)/8,{lane},(KC-k)/4+{step+1},KC/4)'
  pre+=f'      /*@ assert next_high_bound{step}_{j}: 0<={idx}<((NC+7)/8)*(8+8*(KC/4)); */\n'
  pre+=f'      /*@ assert next_high_pre_a{step}_{j}: ext_same(va0c{step}.lane[{j}],{ra}); */\n'
  pre+=f'      /*@ assert next_high_pre_w{step}_{j}: ext_same(vb4567c{step}.lane[{j}],{rw}); */\n'
  pre+=f'      /*@ assert next_high_pre_c{step}_{j}: ext_same(vacc0x1.lane[{j}],{rc}); */\n'
  pre+=f'      /*@ assert next_high_pre_r{step}_{j}: ext_same({rr},shim_fma32({ra},{rw},{rc})); */\n'
  actual=f'vacc0x1.lane[{j}],va0c{step}.lane[{j}],vb4567c{step}.lane[{j}],next_high_old{step}_{j}'
  post+=f'      /*@ ghost next_fma_result({actual}); */\n'
  post+=f'      /*@ assert next_high_result{step}_{j}: next_fma_result_relation({actual},{ra},{rw},{rc},{rr}); */\n'
  post+=f'      /*@ assert next_high_after{step}_{j}: ext_same(vacc0x1.lane[{j}],{rr}); */\n'
 needle=f'      vacc0x1 = vfmaq_f32(vacc0x1, va0c{step}, vb4567c{step});'
 assert s.count(needle)==1
 s=s.replace(needle,pre+needle+'\n'+post.rstrip())
pat=r'(?m)^[ \t]*/\*@ assert next_acc_frame_fixed_3:[^\n]*\*/$'
me=re.search(pat,s);assert me
end=''.join(f'\n      /*@ assert next_high_final_frame_{j}: ext_same(vacc0x1.lane[{j}],stage3_gacc{{Stage3Block}}(A0,W0,0,(NC-nc)/8,{j+4},(KC-k)/4+2,KC/4)); */' for j in range(4))
s=s[:me.end()]+end+s[me.end():]
p.write_text(s)

d=[]
for n in m['files']:
 for x in difflib.unified_diff(plain[n].splitlines(True),(t/n).read_text().splitlines(True),fromfile='a/'+n,tofile='b/'+n):d.append(x if x.endswith('\n') else x+'\n\\ No newline at end of file\n')
(new/'proof.patch').write_text(''.join(d));m['proof_patches']=[str((new/'proof.patch').relative_to(R))];m['stage3']['proof_sha256']=sha(new/'proof.patch');m['proof_next'].update(previous_candidate_sha256=sha(old/'frozen.json'),revision='Extend row0 high four lanes through two real FMA calls with scalar loop relations, frames, inputs and result-helper instantiations. Existing low-lane debts retained. No frozen C/spec/model change.');(new/'frozen.json').write_text(json.dumps(m,indent=2)+'\n');_,g=checker.prepare(new,sha(new/'frozen.json'),'diagnostic01');(new/'source-guard.json').write_text(json.dumps(g,indent=2)+'\n')
