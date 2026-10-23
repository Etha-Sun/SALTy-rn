#!/usr/bin/env python3
"""Only insert checked annotations into a recognized original kernel shape."""
from pathlib import Path
import argparse,json,re,hashlib,subprocess,tempfile,time
HERE=Path(__file__).resolve().parent;CASE=HERE.parent;ROOT=next(p for p in CASE.parents if (p/'.git').exists());BASE=ROOT/'verification/qcp/verified/f32-vadd'
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
def tokens(s):return re.findall(r'\w+|[^\w\s]',re.sub(r'/\*.*?\*/|//[^\n]*','',s,flags=re.S))
def kernel_text(isa):
 name='testNEON.c' if isa=='neon' else 'testRVV.c';raw=(CASE/'impl'/name).read_text();orig=json.loads((HERE/'originals.json').read_text())['files'][isa];assert sha(CASE/'impl'/name)==orig['sha256'];public=(CASE/'spec.c').read_text();at=public.index('void test_'+isa+'(');start=public.index('/*@',at);contract=public[start:public.index('*/',start)+2];patches=[{'before':'\n{','text':contract}];where={}
 if isa=='neon':
  inv='''/*@ Inv Assert exists (k:Z),
 fp32_length(A) == batch@pre/4+3 &&
 0 <= k && k*4+batch == batch@pre && batch % 4 == 0 &&
 0 <= batch && batch <= batch@pre && k <= batch@pre/4 &&
 (batch == 0 || (batch == 4 && batch/4 == 1) ||
 (batch == 8 && batch/4 == 2) || (batch == 12 && batch/4 == 3) ||
 (16 <= batch && 4 <= batch/4)) && params == params@pre &&
 input == input@pre+k && output == output@pre+k && input != 0 && output != 0 &&
 FloatArray::full(input@pre,k,fp32_slice(0,k,A)) *
 FloatArray::full(input,batch/4+3,fp32_slice(k,batch@pre/4+3,A)) *
 store(&(vmagic_number.s0),float,fp32_of_bits(1258291200)) *
 store(&(vmagic_number.s1),float,fp32_of_bits(1258291200)) *
 store(&(vmagic_number.s2),float,fp32_of_bits(1258291200)) *
 store(&(vmagic_number.s3),float,fp32_of_bits(1258291200)) *
 FloatArray::full(output@pre,k,rndne_values(k,A)) * FloatArray::undef_full(output,batch/4) */'''
  patches.append({'before':'  for (;','text':inv})
  where['vreinterpretq_f32_u32(vmovq_n_u32(UINT32_C(0x4B000000)))']='a=0'
  for suffix in ['0123','']:
   vx='vx'+suffix;ab='vabsx'+suffix;mask='vrndmask'+suffix;rnd='vrndabsx'+suffix;vy='vy'+suffix
   where[f'vabsq_f32({vx})']=f'a=&{vx}'
   where[f'vcaltq_f32(vmagic_number, {vx})']=f'a=&vmagic_number,b=&{vx}'
   where[f'vaddq_f32({ab}, vmagic_number)']=f'a=&{ab},b=&vmagic_number'
   where[f'vorrq_u32({mask}, vmovq_n_u32(UINT32_C(0x80000000)))']=f'a=&{mask},b=0'
   where[f'vsubq_f32({rnd}, vmagic_number)']=f'a=&{rnd},b=&vmagic_number'
   where[f'vbslq_f32({mask}, {vx}, {rnd})']=f'mask=&{mask},a=&{vx},b=&{rnd}'
  for call,ann in [('vst1q_f32(output, vy0123)','a=&vy0123'),('vget_low_f32(vy)','a=&vy'),('vget_high_f32(vy)','a=&vy'),('vst1_f32(output, vy_lo)','a=&vy_lo'),('vst1_lane_f32(output, vy_lo, 0)','a=&vy_lo')]:where[call]=ann
 else:
  N='(batch@pre/4)';k=f'({N}-n)';end=f'({k}+vl)';off=lambda p,i:f'pointer_offset({p},{i},float)';seg=lambda p,l,h,x:f'FloatArray::seg({p},{l},{h},{x})';full=lambda p,n,x:f'FloatArray::full({p},{n},{x})';sl=lambda l,h,x:f'rvv_slice({l},{h},{x})';a,o='input@pre','output@pre'
  pure=f'batch == batch@pre && batch % 4 == 0 && params == params@pre && 0 < {N} && {N} <= 4611686018427387903 && 0 <= n && n <= {N} && rvv_length(A) == {N}+3 && input == {off(a,k)} && output == {off(o,k)}'
  initial=f'/*@ Assert batch == batch@pre && batch % 4 == 0 && params == params@pre && 0 < {N} && {N} <= 4611686018427387903 && input == input@pre && output == output@pre && n == {N} && rvv_length(A) == {N}+3 && {full(a,N+"+3","A")} * FloatArray::undef_full(output,{N}) */'
  resources=f'{full(a,N+"+3","A")} * {seg(o,"0",k,f"rndne_rvv_values({k},A)")} * FloatArray::undef_seg({o},{k},{N})'
  patches.append({'before':'  while (n > 0)','text':initial+'\n/*@ Inv Assert '+pure+' && '+resources+' */'})
  chunks=[seg(a,'0',k,sl('0',k,'A')),full('input','vl',sl(k,end,'A')),seg(a,end,N+'+3',sl(end,N+'+3','A')),seg(o,'0',k,f'rndne_rvv_values({k},A)'),'FloatArray::undef_full(output,vl)',f'FloatArray::undef_seg({o},{end},{N})']
  cut='/*@ Assert '+pure+' && 0 < n && 0 < vl && vl <= 32 && vl <= n && vl == vadd_vl(n) &&\n '+' *\n '.join(chunks)+' */';patches.append({'before':'    vfloat32m8_t vx =','text':cut})
  chunk=f'rvv_slice({k},{end},A)';xs=[f'rvv_read_value({i},vl,{chunk})' for i in range(32)]
  vals={'vx':xs};calls=[('__riscv_vfabs_v_f32m8(vx, vl)','a','x','vx','vabsx','rndne_active___riscv_vfabs_v_f32m8'),('__riscv_vmfgt_vf_f32m8_b4(vabsx, 8388608.0f, vl)','a','x','vabsx','cmp','rndne_active___riscv_vmfgt_vf_f32m8_b4'),('__riscv_vfadd_vf_f32m8(vabsx, 8388608.0f, vl)','a','x','vabsx','vrndabsx_add','rndne_active___riscv_vfadd_vf_f32m8'),('__riscv_vfsub_vf_f32m8(vrndabsx, 8388608.0f, vl)','a','x','vrndabsx_add','vrndabsx_sub','rndne_active___riscv_vfsub_vf_f32m8')]
  assigns=lambda p,vs:','.join(f'{p}{i}={x}' for i,x in enumerate(vs))
  where['__riscv_vle32_v_f32m8(input, vl)']='L='+chunk
  for call,arg,prefix,inp,out,model in calls:
   addr='vrndabsx' if inp=='vrndabsx_add' else inp;where[call]=arg+'=&'+addr+','+assigns(prefix,vals[inp]);extra=',8388608.0f' if 'vfabs' not in call else '';vals[out]=[f'{model}({i},vl,{x}{extra})' for i,x in enumerate(vals[inp])]
  calls2=[('__riscv_vfsgnj_vv_f32m8(vrndabsx, vx, vl)',['vrndabsx_sub','vx'],['vrndabsx','vx'],['x','y'],'vrnd_signed','rndne_active___riscv_vfsgnj_vv_f32m8'),('__riscv_vmerge_vvm_f32m8(vrnd_signed, vx, cmp, vl)',['vrnd_signed','vx','cmp'],['vrnd_signed','vx','cmp'],['x','y','m'],'vy_merged','rndne_active___riscv_vmerge_vvm_f32m8')]
  for call,ins,addrs,prefs,out,model in calls2:
   where[call]=','.join(f'{arg}=&{addr}' for arg,addr in zip(['a','b','mask'],addrs))+','+','.join(assigns(pref,vals[v]) for pref,v in zip(prefs,ins));vals[out]=[f'{model}({i},vl,'+','.join(vals[v][i] for v in ins)+')' for i in range(32)]
  where['__riscv_vmfne_vv_f32m8_b4(vx, vx, vl)']=assigns('x',xs);vals['is_nan']=[f'rndne_active_self_ne({i},vl,{x})' for i,x in enumerate(xs)]
  where['__riscv_vreinterpret_v_f32m8_u32m8(vx)']='a=&vx,'+assigns('x',xs);vals['vx_u32']=[f'bits_of_fp32({x})' for x in xs]
  where['__riscv_vor_vx_u32m8(vx_u32, UINT32_C(0x00400000), vl)']='a=&vx_u32,'+assigns('x',vals['vx_u32']);vals['vx_quiet']=[f'rndne_active___riscv_vor_vx_u32m8({i},vl,{x},4194304)' for i,x in enumerate(vals['vx_u32'])]
  where['__riscv_vreinterpret_v_u32m8_f32m8(vx_quiet)']='a=&vx_quiet,'+assigns('x',vals['vx_quiet']);vals['vx_qnan']=[f'fp32_of_bits({x})' for x in vals['vx_quiet']]
  where['__riscv_vmerge_vvm_f32m8(vy, vx_qnan, is_nan, vl)']='a=&vy,b=&vx_qnan,mask=&is_nan,'+assigns('x',vals['vy_merged'])+','+assigns('y',vals['vx_qnan'])+','+assigns('m',vals['is_nan']);ys=[f'rndne_active___riscv_vmerge_vvm_f32m8({i},vl,{vals["vy_merged"][i]},{vals["vx_qnan"][i]},{vals["is_nan"][i]})' for i in range(32)]
  where['__riscv_vse32_v_f32m8(output, vy, vl)']='a=&vy,L=rvv_pack32('+','.join(ys)+'),'+assigns('x',ys)
 text=raw
 for p in patches:
  anchor=p['before'];assert text.count(anchor)==1,anchor;text=text.replace(anchor,p['text']+'\n'+anchor,1)
 for call,ann in where.items():assert text.count(call)==1,call;text=text.replace(call,call+' /*@ where '+ann+' */',1)
 assert tokens(text)==tokens(raw),'executable C changed'
 return raw,text,{'patches':patches,'where':where}
def main():
 ap=argparse.ArgumentParser();ap.add_argument('--isa',choices=['neon','rvv'],required=True);ap.add_argument('--timeout',type=int,default=1800);args=ap.parse_args();assert 0<args.timeout<=14400
 run=Path(tempfile.mkdtemp(prefix=args.isa+'-kernel-',dir=CASE/'.build'));raw,text,annotations=kernel_text(args.isa);(HERE/'c'/(args.isa+'.annotations.json')).write_text(json.dumps(annotations,indent=2)+'\n');records=[];stem=args.isa+'_unit';header='#include "'+str(CASE/'shim'/(args.isa+'_frontend.h'))+'"\n/*@ Extern Coq (fp32_of_real : real -> fp32) */\n'+('/*@ include strategies "rndne_rvv.strategies" */\n' if args.isa=='rvv' else '')
 def execute(cmd,label,timeout):
  cmd=list(map(str,cmd));log=run/(label+'.log');start=time.monotonic()
  try:
   with log.open('w') as out:r=subprocess.run(['prlimit','--as='+str(16*1024**3),'--']+cmd,cwd=run,stdout=out,stderr=out,timeout=timeout)
   ec=r.returncode
  except subprocess.TimeoutExpired:ec=124
  records.append({'command':cmd,'label':label,'exit_code':ec,'seconds':time.monotonic()-start,'log_sha256':sha(log)});return ec
 s={'generation_passed':False,'whole_kernel_verified':False,'run_directory':str(run),'records':records}
 try:
  for nm,body in [('raw',raw),(stem,text)]:
   (run/(nm+'.raw.c')).write_text(header+body);assert execute(['gcc','-E','-P','-CC','-nostdinc',run/(nm+'.raw.c'),'-o',run/(nm+'.c')],nm+'-cpp',60)==0
  assert tokens((run/'raw.c').read_text())==tokens((run/(stem+'.c')).read_text())
  cmd=['qcp','--arch=64','--endian=little','--no-float-finite-vc','--no-exec-info','--strategy-application-limit=1024','--input-file='+str(run/(stem+'.c')),'--coq-output-dir='+str(run),'--coq-logic-path=Rndne','-slp',str(CASE/'shim'),'Rndne','-slp',str(HERE/'c'),'Rndne']
  for d in sorted((BASE/'proof/c').iterdir()):
   if d.is_dir():cmd+=['-slp',str(d),d.name]
  ec=execute(cmd,'qcp',args.timeout);s['exit_code']=ec;assert ec==0,'actual QCP failed'
  goal=run/(stem+'_goal.v');fs=re.findall(r'^Axiom proof_of_(\w+)\s*:',goal.read_text(),re.M);assert fs;s.update(generation_passed=True,generated_c_vcs=len(fs),fields=fs,goal_sha256=sha(goal),c_sha256=sha(run/(stem+'.c')),original_tokens_preserved=True,same_frontend_cpp_tokens_preserved=True)
 except Exception as e:s['error']=str(e)
 (run/'generation-status.json').write_text(json.dumps(s,indent=2)+'\n');(HERE/(args.isa+'-generation-status.json')).write_text(json.dumps(s,indent=2)+'\n');print(run,flush=True);raise SystemExit(0 if s['generation_passed'] else 1)
if __name__=='__main__':main()
