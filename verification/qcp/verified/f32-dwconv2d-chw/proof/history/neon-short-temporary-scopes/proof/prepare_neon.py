#!/usr/bin/env python3
from pathlib import Path
import argparse,hashlib,json,os,re,subprocess,tempfile,time
P=Path(__file__).resolve().parent;C=P.parent;R=next(p for p in C.parents if(p/'.git').exists());sha=lambda p:hashlib.sha256(Path(p).read_bytes()).hexdigest()
def toks(s):return re.findall(r'\w+|[^\s]',re.sub(r'/\*.*?\*/|//[^\n]*','',s,flags=re.S))
def splitargs(s):
 depth=0;start=0;out=[]
 for i,ch in enumerate(s):
  if ch in '([':depth+=1
  elif ch in ')]':depth-=1
  elif ch==','and depth==0:out.append(s[start:i].strip());start=i+1
 out.append(s[start:].strip());return out

def calls(s):
 out=[]
 for m in re.finditer(r'\b(__riscv_\w+|dw_chw_propagating_\w+|dw_read_scalar|assert)\s*\(',s):
  a=m.end();i=a;dep=1
  while dep:
   if s[i]=='(':dep+=1
   elif s[i]==')':dep-=1
   i+=1
  out.append((m[1],splitargs(s[a:i-1]),i))
 return out


def construct(side):
 assert side=='neon'
 raw=(C/'impl/testNEON.c').read_text();edits=[];bindings=[]
 names=['dw_read_scalar','assert','vget_low_f32','vget_high_f32','vdupq_lane_f32','vextq_f32','vfmaq_lane_f32','vmaxq_f32','vminq_f32','vandq_u32','vreinterpretq_u32_f32','vreinterpretq_f32_u32','vst1q_f32','vst1_f32','vst1_lane_f32','vld1q_u32','vld1q_f32','vld1_f32','round_up_po2','doz']
 for m in re.finditer(r'\b('+'|'.join(names)+r')\s*\(',raw):
  a=m.end();e=a;dep=1
  while dep:
   if raw[e]=='(':dep+=1
   elif raw[e]==')':dep-=1
   e+=1
  args=splitargs(raw[a:e-1]);name=m[1];b=[]
  if name in ['dw_read_scalar','vld1q_f32','vld1_f32']:b=['F=F']
  shape=[]
  if name in ['vget_low_f32','vget_high_f32','vreinterpretq_u32_f32','vreinterpretq_f32_u32']:shape=[('p_a',args[0],'a',4)]
  if name=='vdupq_lane_f32':shape=[('p_a',args[0],'a',2)]
  if name in ['vextq_f32','vmaxq_f32','vminq_f32','vandq_u32']:shape=[('p_a',args[0],'a',4),('p_b',args[1],'b',4)]
  if name=='vfmaq_lane_f32':shape=[('p_c',args[0],'c',4),('p_a',args[1],'a',4),('p_b',args[2],'b',2)]
  for formal,val,prefix,n in shape:b+=[formal+'=&'+val]+[prefix+str(i)+'='+val+'.s'+str(i)for i in range(n)]
  if name in ['vst1q_f32','vst1_f32','vst1_lane_f32']:
   val=args[1];n=4 if name=='vst1q_f32'else 2;b=['W=W','v=&'+val]+['a'+str(i)+'='+val+'.s'+str(i)for i in range(n)]
  if name=='vld1q_u32':b=['base=mask_table','index=unsigned_last_nbits(3 - (((input_width >> 2) - 1) & 3),64)']
  if b:edits.append((e,' /*@ where '+','.join(b)+' */'));bindings.append(dict(name=name,args=args,where=b))
 constants=['0<H','0<N','H<=18446744073709551615','4*N<=18446744073709551615','input_width%4==0','input_height==H','input_width==4*N','input==Input','zero==Zero','weights==Weights','output==Output','params==Params','padding_top==1','dw_inputs(F,Input,Zero,Weights,Params,H,N)','dw_present(F,&(params->scalar.min))','dw_present(F,&(params->scalar.max))','dw_same(dw_get(F,&(params->scalar.min)),Lo)','dw_same(dw_get(F,&(params->scalar.max)),Hi)','W==dw_addresses(Output,H,N)','dw_distinct(W)','dw_footprint(Output,H*N)']
 r='dw_neon_results(F,Input,Zero,Weights,H,N,Lo,Hi)'
 contract='/*@ With (F:DwROMap) (O:DwOutput) (W:list Z) (H:Z) (N:Z) (Input:Z) (Zero:Z) (Weights:Z) (Output:Z) (Params:Z) (Lo:fp32) (Hi:fp32) Require '+' && '.join(constants)+' && dw_data(F) * dw_output(W,O) Ensure dw_data(F) * dw_output(W,dw_progress('+r+',O,Output,H,N,H,0)) */\n'
 edits.append((raw.index('{',raw.index('XNN_OOB_READS')),contract))
 stable=[]
 for v,n,expr,ty in [('vmax',4,lambda i:'Hi','float'),('vmin',4,lambda i:'Lo','float'),('vw0123',4,lambda i:'dw_get(F,Weights+4*'+str(i)+')','float'),('vw4567',4,lambda i:'dw_get(F,Weights+4*'+str(i+4)+')','float'),('vw89',2,lambda i:'dw_get(F,Weights+4*'+str(i+8)+')','float'),('vmask',4,lambda i:'dw_mask7_word(dw_mask_index(N),'+str(i)+')','unsigned int')]:
  stable +=['store(&('+v+'.s'+str(i)+'),'+ty+','+expr(i)+')'for i in range(n)]
 stable +=['IntArray::full(mask_table,7,dw_mask7_values)']
 constants+=['input_decrement==((4*N+15)/16)*16']
 outer=' && '.join(constants+['0<=output_height','output_height<=H','dw_outer_pointers(Input,Zero,Output,H,N,output_height,i0,i1,i2,i3,i4,o0,o1,o2)'])+' && '+' * '.join(['dw_data(F)','dw_output(W,dw_progress('+r+',O,Output,H,N,H-output_height,0))',*stable])
 edits.append((raw.rindex('while (output_height != 0)'), '/*@ Inv Assert '+outer+' */ '))
 x='(input_width-w)/4';y='H-output_height';inner=constants+['0<output_height','output_height<=H','4<=w','w<=input_width','w%4==0','('+x+')%4==0'];vectors=[]
 for j in range(5):
  row=y+'-'+str(1-j)if j<1 else y+'+'+str(j-1);bp='dw_row_base(Input,Zero,H,N,'+row+')';inner+=['i'+str(j)+'=='+bp+'+4*('+x+'+4)']
  vectors+=['store(&(vi'+str(j)+'x0123.s'+str(i)+'),float,dw_previous4(F,'+bp+','+x+','+str(i)+'))'for i in range(4)]
  vectors+=['store(&(vi'+str(j)+'x4567.s'+str(i)+'),float,dw_get(F,'+bp+'+4*('+x+'+'+str(i)+')))'for i in range(4)]
 for j in range(3):inner+=['o'+str(j)+'==Output+4*(dw_store_row(H,'+y+','+str(j)+')*N+'+x+')']
 inv=' && '.join(inner)+' && '+' * '.join(['dw_data(F)','dw_output(W,dw_progress('+r+',O,Output,H,N,'+y+','+x+'))',*stable,*vectors])
 edits.append((raw.index('    for (; w >'),'    /*@ Inv Assert '+inv+' */\n'))
 ann=raw
 for pos,t in sorted(edits,reverse=True):ann=ann[:pos]+t+ann[pos:]
 ann=ann.replace('*/\\n','*/\n')
 assert toks(raw)==toks(ann)
 prefix='#define DWCHW_FORMAL 1\n#include "'+str(C/'shim/neon_kernel_frontend.h')+'"\n#include "'+str(C/'shim/neon_progress_model.h')+'"\n'
 return raw,ann,prefix,dict(contract=contract,outer=outer,inner=inv,bindings=bindings)

def main():
 ap=argparse.ArgumentParser();ap.add_argument('--side',choices=['neon'],default='neon');ap.add_argument('--timeout',type=int,default=21600);a=ap.parse_args();q=json.loads((R/'.build/memory/quota/state.json').read_text());assert not q['wind_down_requested'];raw,ann,prefix,metadata=construct(a.side);run=Path(tempfile.mkdtemp(prefix=a.side+'-kernel-',dir=C/'.build'));env={**os.environ,'PATH':str(R/'.build/simple-kernels-bootstrap/bin')+':/tmp/qcp-coq820-install/bin:'+os.environ['PATH']};stem=a.side+'_unit'
 for label,source in [('original',raw),(stem,ann)]:
  f=run/(label+'.input.c');f.write_text(prefix+source);cmd=['gcc','-E','-P','-CC','-nostdinc','-I',str(C/'shim'),str(f),'-o',str(run/(label+'.c'))];t=subprocess.run(cmd,capture_output=True,text=True);(run/(label+'-cpp.log')).write_text(t.stdout+t.stderr);assert t.returncode==0,t.stderr
 assert toks((run/'original.c').read_text())==toks((run/(stem+'.c')).read_text())
 (run/'annotations.json').write_text(json.dumps(metadata,indent=2)+'\n');wd=run/'work';wd.mkdir();cmd=['prlimit','--as=34359738368:34359738368','--','stdbuf','-oL','-eL','qcp','--arch=64','--endian=little','--no-exec-info','--strategy-application-limit=4096','--input-file='+str(run/(stem+'.c')),'--coq-output-dir='+str(run),'--coq-logic-path=DwChw','-slp',str(C/'shim'),'DwChw','-slp',str(P/'c'),'DwChw'];start=time.monotonic();state=dict(generation_passed=False,whole_kernel_verified=False,run_directory=str(run),command=cmd,timeout_seconds=a.timeout,memory_GiB=32,raw_c_sha256=sha(C/'impl/testNEON.c'),annotation_sha256=sha(run/'annotations.json'),cpp_sha256=sha(run/(stem+'.c')),same_raw_tokens=True,same_frontend_cpp_tokens=True);(run/'started.json').write_text(json.dumps(state,indent=2)+'\n');(C/'.build/neon-main-current.json').write_text(json.dumps({'run':str(run)})+'\n')
 with(run/'qcp.log').open('w')as f:
  try:code=subprocess.run(cmd,cwd=wd,env=env,stdout=f,stderr=f,timeout=a.timeout).returncode
  except subprocess.TimeoutExpired:code=124
 goal=run/(stem+'_goal.v');s=goal.read_text()if goal.exists()else'';state.update(generation_passed=code==0,exit_code=code,seconds=time.monotonic()-start,goal_sha256=sha(goal)if goal.exists()else None,generated_c_vcs=len(re.findall(r'^Axiom proof_of_',s,re.M)));(run/'status.json').write_text(json.dumps(state,indent=2)+'\n');target=P/'neon-generation-status.json'
 if target.exists():(P/'history'/('neon-generation-before-'+sha(target)+'.json')).write_bytes(target.read_bytes())
 target.write_bytes((run/'status.json').read_bytes());print(json.dumps(state,indent=2));return code!=0
if __name__=='__main__':raise SystemExit(main())
