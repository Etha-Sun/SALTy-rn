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
 assert side=='rvv','NEON annotation renderer not ready; never fabricate a pass'
 raw=(C/'impl/testRVV.c').read_text();ann=raw;edits=[];bindings=[]
 for name,args,end in calls(raw):
  b=[]
  if name in ['dw_read_scalar','__riscv_vle32_v_f32m2']:b=['F=F']
  if name=='__riscv_vfmacc_vf_f32m2':
   for formal,val,prefix in [('p_c',args[0],'c'),('p_a',args[2],'a')]:b+=[formal+'=&'+val]+[prefix+str(i)+'='+val+'.s'+str(i)for i in range(8)]
  if name in ['__riscv_vfslide1up_vf_f32m2','__riscv_vfslide1down_vf_f32m2']:
   val=args[0];b=['p_a=&'+val]+['a'+str(i)+'='+val+'.s'+str(i)for i in range(8)]
  if name in ['dw_chw_propagating_max','dw_chw_propagating_min']:
   val=args[0];b=['a=&'+val,'A=dw_fp8('+','.join(val+'.s'+str(i)for i in range(8))+')']
  if name=='__riscv_vse32_v_f32m2':
   val=args[1];b=['W=W','v=&'+val]+['a'+str(i)+'='+val+'.s'+str(i)for i in range(8)]
  if b:edits.append((end,' /*@ where '+','.join(b)+' */'));bindings.append(dict(name=name,args=args,where=b))
 constants=['0<H','0<N','H<=18446744073709551615','4*N<=18446744073709551615','input_width%4==0','input_height==H','input_width==4*N','input==Input','zero==Zero','weights==Weights','output==Output','params==Params','padding_top==1','dw_inputs(F,Input,Zero,Weights,Params,H,N)','dw_present(F,&(params->scalar.min))','dw_present(F,&(params->scalar.max))','dw_same(dw_get(F,&(params->scalar.min)),Lo)','dw_same(dw_get(F,&(params->scalar.max)),Hi)','W==dw_addresses(Output,H,N)','dw_distinct(W)','dw_footprint(Output,H*N)']
 r='dw_rvv_results(F,Input,Zero,Weights,H,N,Lo,Hi)'
 pre=' && '.join(constants)+' && dw_data(F) * dw_output(W,O)'
 contract='/*@ With (F:DwROMap) (O:DwOutput) (W:list Z) (H:Z) (N:Z) (Input:Z) (Zero:Z) (Weights:Z) (Output:Z) (Params:Z) (Lo:fp32) (Hi:fp32) Require '+pre+' Ensure dw_data(F) * dw_output(W,dw_progress('+r+',O,Output,H,N,H,0)) */\n'
 pos=raw.index('{',raw.index('XNN_OOB_READS'));edits.append((pos,contract))
 outer=' && '.join(constants+['0<=output_height','output_height<=H','dw_outer_pointers(Input,Zero,Output,H,N,output_height,i0,i1,i2,i3,i4,o0,o1,o2)'])+' && dw_data(F) * dw_output(W,dw_progress('+r+',O,Output,H,N,H-output_height,0))'
 edits.append((raw.rindex('while (output_height != 0)'), '/*@ Inv Assert '+outer+' */ '))
 x='N-w';y='H-output_height';inner=constants+['0<output_height','output_height<=H','0<=w','w<=N','orig_i3==dw_row_base(Input,Zero,H,N,'+y+'+2)','orig_i4==dw_row_base(Input,Zero,H,N,'+y+'+3)']
 for j in range(5):
  row=y+'-'+str(1-j)if j<1 else y+'+'+str(j-1)
  bp='dw_row_base(Input,Zero,H,N,'+row+')';inner+=['i'+str(j)+'=='+bp+'+4*('+x+')','dw_same(prev_i'+str(j)+',dw_prev(F,'+bp+','+x+'))']
 for j in range(3):inner+=['o'+str(j)+'==Output+4*(dw_store_row(H,'+y+','+str(j)+')*N+'+x+')']
 inv=' && '.join(inner)+' && dw_data(F) * dw_output(W,dw_progress('+r+',O,Output,H,N,'+y+','+x+'))'
 edits.append((raw.index('    while (w > 0)'),'    /*@ Inv Assert '+inv+' */\n'))
 for p,t in sorted(edits,reverse=True):ann=ann[:p]+t+ann[p:]
 assert toks(raw)==toks(ann)
 prefix='#define DWCHW_FORMAL 1\n#include "'+str(C/'shim/rvv_kernel_frontend.h')+'"\n#include "'+str(C/'shim/progress_model.h')+'"\n#define XNN_OOB_READS\n#define XNN_UNPREDICTABLE(x) (x)\n#define XNN_LIKELY(x) (x)\n#define XNN_UNLIKELY(x) (x)\n'
 return raw,ann,prefix,dict(contract=contract,outer=outer,inner=inv,bindings=bindings)

def main():
 ap=argparse.ArgumentParser();ap.add_argument('--side',choices=['rvv'],default='rvv');ap.add_argument('--timeout',type=int,default=21600);a=ap.parse_args();q=json.loads((R/'.build/memory/quota/state.json').read_text());assert not q['wind_down_requested'];raw,ann,prefix,metadata=construct(a.side);run=Path(tempfile.mkdtemp(prefix=a.side+'-kernel-',dir=C/'.build'));env={**os.environ,'PATH':str(R/'.build/simple-kernels-bootstrap/bin')+':/tmp/qcp-coq820-install/bin:'+os.environ['PATH']};stem=a.side+'_unit'
 for label,source in [('original',raw),(stem,ann)]:
  f=run/(label+'.input.c');f.write_text(prefix+source);cmd=['gcc','-E','-P','-CC','-nostdinc','-I',str(C/'shim'),str(f),'-o',str(run/(label+'.c'))];t=subprocess.run(cmd,capture_output=True,text=True);(run/(label+'-cpp.log')).write_text(t.stdout+t.stderr);assert t.returncode==0,t.stderr
 assert toks((run/'original.c').read_text())==toks((run/(stem+'.c')).read_text())
 (run/'annotations.json').write_text(json.dumps(metadata,indent=2)+'\n');wd=run/'work';wd.mkdir();cmd=['prlimit','--as=34359738368:34359738368','--','stdbuf','-oL','-eL','qcp','--arch=64','--endian=little','--no-exec-info','--strategy-application-limit=4096','--input-file='+str(run/(stem+'.c')),'--coq-output-dir='+str(run),'--coq-logic-path=DwChw','-slp',str(C/'shim'),'DwChw','-slp',str(P/'c'),'DwChw'];start=time.monotonic();state=dict(generation_passed=False,whole_kernel_verified=False,run_directory=str(run),command=cmd,timeout_seconds=a.timeout,memory_GiB=32,raw_c_sha256=sha(C/'impl/testRVV.c'),annotation_sha256=sha(run/'annotations.json'),cpp_sha256=sha(run/(stem+'.c')),same_raw_tokens=True,same_frontend_cpp_tokens=True);(run/'started.json').write_text(json.dumps(state,indent=2)+'\n');(C/'.build/rvv-main-current.json').write_text(json.dumps({'run':str(run)})+'\n')
 with(run/'qcp.log').open('w')as f:
  try:code=subprocess.run(cmd,cwd=wd,env=env,stdout=f,stderr=f,timeout=a.timeout).returncode
  except subprocess.TimeoutExpired:code=124
 goal=run/(stem+'_goal.v');s=goal.read_text()if goal.exists()else'';state.update(generation_passed=code==0,exit_code=code,seconds=time.monotonic()-start,goal_sha256=sha(goal)if goal.exists()else None,generated_c_vcs=len(re.findall(r'^Axiom proof_of_',s,re.M)));(run/'status.json').write_text(json.dumps(state,indent=2)+'\n');target=P/'rvv-generation-status.json'
 if target.exists():(P/'history'/('rvv-generation-before-'+sha(target)+'.json')).write_bytes(target.read_bytes())
 target.write_bytes((run/'status.json').read_bytes());print(json.dumps(state,indent=2));return code!=0
if __name__=='__main__':raise SystemExit(main())
