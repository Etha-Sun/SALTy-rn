#!/usr/bin/env python3
"""Render current implementation plus comment-only proof annotations privately."""
from pathlib import Path
import argparse,json,hashlib,subprocess,tempfile,os,re,time
C=Path(__file__).resolve().parents[1]
ARGS=['channels','output_width','input','weights','output','input_stride','output_increment','input_offset','input_pixel_stride','zero']
FS=['channels','width','input','weights','out','input_stride','out_increment','offset','pixel_stride','zero_ptr']
STATIC=[(a,f)for a,f in zip(ARGS,FS)if a not in ['output_width','input','output','input_offset']]
def spatial(isa,pixel,k):return 'dw_data(F) * dw_ptr_data(P) * dw_output(W,dw_'+isa+'_progress(F,P,D,'+pixel+','+k+',lo,hi,O))'
def constvectors():return ' * '.join('store(&('+v+'.s'+str(i)+'),float,dw_get(F,&(params->scalar.'+f+')))'for v,f in [('vmin','min'),('vmax','max')]for i in range(4))
def common():
 return [a+'==dw_'+f+'(D)'for a,f in STATIC]+['params==params@pre','params!=0','channels>0','dw_width(D)>0','dw_valid(F,P,W,D)','dw_distinct(W)','sizeof(float)==4','sizeof(float*)==8']+['dw_present(F,&(params->scalar.'+f+'))'for f in ['min','max']]+['dw_same(lo,dw_get(F,&(params->scalar.min)))','dw_same(hi,dw_get(F,&(params->scalar.max)))']
def outer(isa,body=False):
 p='(dw_width(D)-output_width)';pure=common()+[('0<output_width'if body else'0<=output_width'),'output_width<=dw_width(D)','input==dw_table(D,'+p+')','input_offset==dw_offset_at(D,'+p+')','output==dw_output_at(D,'+p+')']
 if body:pure+=['dw_ptr_present(P,pointer_offset(input,'+str(i)+',float*))'for i in range(3)]+['dw_ptr_get(P,pointer_offset(input,'+str(i)+',float*))!=0'for i in range(3)]
 heap=spatial(isa,p,'0')+(' * '+constvectors()if isa=='neon'else'')
 return '/*@ '+('Assert'if body else'Inv Assert')+' '+' && '.join(pure)+' && '+heap+' */'
def inner(isa,body=False,tail=None):
 p='(dw_width(D)-output_width)';k='(channels-c)'
 pure=common()+['0<output_width','output_width<=dw_width(D)','input==dw_table(D,'+p+'+1)','input_offset==dw_offset_at(D,'+p+')','0<=c','c<=channels',('('+k+')%4==0'if isa=='neon'or body else'dw_aligned_cursor(channels,c)'),'output==dw_output_at(D,'+p+')+4*'+k,'w==pointer_offset(weights,4*'+k+',float)']
 pure+=['i'+str(t)+'==dw_input_row(P,D,'+p+','+str(t)+')+4*'+k for t in range(3)]
 if body:
  lim='4'if isa=='neon'else'vl'
  pure+=['c>=4'if isa=='neon'and tail is None else'c>0']
  pure+=['dw_window(F,i'+str(t)+','+lim+')'for t in range(3)]
  pure+=['dw_window(F,pointer_offset(w,'+str(4*t)+',float),'+lim+')'for t in range(4)]
  if isa=='rvv':pure+=['vl==dw_take(c)','1<=vl','vl<=4','dw_write_window(W,output,vl)']
  elif tail is None:pure+=['dw_write_window(W,output,4)']
 heap=spatial(isa,p,k)+(' * '+constvectors()if isa=='neon'else'')
 if tail:
  branches=[]
  for c in [1,2,3]:
   extra=['c=='+str(c),'dw_write_window(W,output,1)']
   if c>=2:extra+=['dw_write_window(W,output,2)']
   if c==3:extra+=['dw_write_window(W,pointer_offset(output,2,float),1)']
   branches.append('('+' && '.join(pure+extra)+' && '+heap+')')
  return '/*@ Assert '+' || '.join(branches)+' */'
 return '/*@ '+('Assert'if body else'Inv Assert')+' '+' && '.join(pure)+' && '+heap+' */'
def tail_after_two():
 p='(dw_width(D)-output_width)';k='(channels-c)'
 pure=common()+['0<output_width','output_width<=dw_width(D)','input==dw_table(D,'+p+'+1)','input_offset==dw_offset_at(D,'+p+')','0<=c','c<=channels','('+k+')%4==0','output==dw_output_at(D,'+p+')+4*('+k+'+2)','w==pointer_offset(weights,4*'+k+'+16,float)']
 pure+=['i'+str(t)+'==dw_input_row(P,D,'+p+','+str(t)+')+4*'+k for t in range(3)]
 dead=['vacc0123p0','vi0x0123','vk0x0123','vi1x0123','vk1x0123','vacc0123p1','vi2x0123','vk2x0123','vacc0123']
 heap=spatial('neon',p,k+'+2')+' * '+constvectors()+' * '+' * '.join('UndefStructPredfloat32x4_t(&('+v+'))'for v in dead)
 heap+=' * '+' * '.join('store(&(vacc01.s'+str(i)+'),float,dw_neon_value(F,P,D,'+p+','+k+'+'+str(i+2)+',lo,hi))'for i in range(2))
 cases=[]
 for c in[2,3]:cases.append('('+' && '.join(pure+['c=='+str(c)]+(['dw_write_window(W,output,1)']if c==3 else[]))+' && '+heap+')')
 return '/*@ Assert '+' || '.join(cases)+' */'
def render(isa):
 source=C/'impl'/('testNEON.c'if isa=='neon'else'testRVV.c');t=source.read_text();contract=json.loads((C/'proof/c/contracts.json').read_text())[isa]
 anchor=' XNN_OOB_READS\n{';assert t.count(anchor)==1;t=t.replace(anchor,' XNN_OOB_READS\n'+contract+'\n{',1)
 t=t.replace('  while (output_width != 0) {','  '+outer(isa)+'\n  while (output_width != 0) {\n    '+outer(isa,True),1)
 if isa=='neon':t=t.replace('    for (; c >= 4; c -= 4) {','    '+inner(isa)+'\n    for (; c >= 4; c -= 4) {\n      '+inner(isa,True),1);t=t.replace('    if XNN_UNLIKELY(c != 0) {','    if XNN_UNLIKELY(c != 0) {\n      '+inner(isa,True,tail=True),1)
 else:t=t.replace('    while (c > 0) {','    '+inner(isa)+'\n    while (c > 0) {',1)
 # The cuts are proof obligations, not new public preconditions. All C tokens remain.
 pure=[a+'==dw_'+f+'(D)'for a,f in zip(ARGS,FS)]+['params==params@pre','params!=0','channels>0','output_width>0','dw_valid(F,P,W,D)','dw_distinct(W)','sizeof(float)==4','sizeof(float*)==8']+['dw_present(F,&(params->scalar.'+f+'))'for f in ['min','max']]+['dw_same(lo,dw_get(F,&(params->scalar.min)))','dw_same(hi,dw_get(F,&(params->scalar.max)))']
 entry='/*@ Assert '+' && '.join(pure)+' && dw_data(F) * dw_ptr_data(P) * dw_output(W,O) */'
 t=t.replace('  assert(channels != 0);','  '+entry+'\n  assert(channels != 0);',1)
 if isa=='rvv':
  # Expose the precise legal VSETVL conclusion. Retain every preexisting owner.
  base=inner(isa,True)
  anchor='size_t vl = __riscv_vsetvl_e32m4(c < 4 ? c : 4);';assert t.count(anchor)==1;t=t.replace(anchor,anchor+'\n      '+base,1)
 # QCP's by-value transport leaves an unused address ghost when a formal
 # parameter name shadows the live scalar channel counter c. The actual
 # argument field cells remain the transported caller values; this ghost is
 # audited absent from generated obligations before any component credit.
 if isa=='neon':
  t=t.replace('vfmaq_f32(vacc0123p0, vi0x0123, vk0x0123);','vfmaq_f32(vacc0123p0, vi0x0123, vk0x0123) /*@ where a=0,b=0,c=0 */;')
  t=t.replace('vfmaq_f32(vacc0123p0, vi2x0123, vk2x0123);','vfmaq_f32(vacc0123p0, vi2x0123, vk2x0123) /*@ where a=0,b=0,c=0 */;')
 if isa=='neon':
  for name in ['vmulq_f32','vaddq_f32','vmaxq_f32','vminq_f32']:
   t=re.sub(r'('+name+r'\([^;\n]+\))\s*;',r'\1 /*@ where a=0,b=0 */;',t)
  for name in ['vget_low_f32','vget_high_f32']:
   t=re.sub(r'('+name+r'\([^;\n]+\))\s*;',r'\1 /*@ where a=0 */;',t)
 t=t.replace('vacc01 = vget_high_f32(vacc0123) /*@ where a=0 */;', 'vacc01 = vget_high_f32(vacc0123) /*@ where a=0 */;\n        '+tail_after_two())
 return '#include "'+str(C/'shim/program.h')+'"\n#include "'+str(C/'shim/output_rules.h')+'"\n'+t

def main():
 ap=argparse.ArgumentParser();ap.add_argument('--isa',choices=['neon','rvv'],required=True);ap.add_argument('--timeout',type=int,default=21600);a=ap.parse_args();r=Path(tempfile.mkdtemp(prefix=a.isa+'-kernel-',dir=C/'.build'));(r/'generated').mkdir();src=r/(a.isa+'_unit.c');src.write_text(render(a.isa));env=os.environ.copy();R=next(p for p in C.parents if(p/'.git').exists());env['PATH']=str(R/'.build/simple-kernels-bootstrap/bin')+':/tmp/qcp-coq820-install/bin:'+env['PATH'];records=[];status=dict(passed=False,whole_kernel_verified=False,isa=a.isa,run_directory=str(r),records=records);paths=[Path(__file__),C/'spec.c',C/'proof/c/contracts.json',C/'impl/testNEON.c',C/'impl/testRVV.c',*sorted((C/'shim').glob('*.h')),*sorted((C/'proof/c').glob('*.strategies'))];identity={str(x.relative_to(C)):hashlib.sha256(x.read_bytes()).hexdigest()for x in paths};status['input_sha256']=identity;sn=r/'input-source-snapshot';sn.mkdir();[( (sn/x.relative_to(C)).parent.mkdir(parents=True,exist_ok=True),(sn/x.relative_to(C)).write_bytes(x.read_bytes()))for x in paths]
 for label,cmd in [('cpp',['gcc','-E','-P','-CC','-nostdinc',str(src),'-o',str(r/(a.isa+'_unit.i'))]),('qcp',['qcp','--arch=64','--endian=little','--no-float-finite-vc','--no-exec-info','--strategy-application-limit=8192','--input-file='+str(r/(a.isa+'_unit.i')),'--coq-output-dir='+str(r/'generated'),'--coq-logic-path=Dwconv','-slp',str(C/'shim'),'Dwconv','-slp',str(C/'proof/c'),'Dwconv'])]:
  start=time.monotonic();log=r/(label+'.log')
  try:
   with log.open('w')as f:p=subprocess.run(['prlimit','--as=34359738368','--',*cmd],cwd=r,env=env,stdout=f,stderr=f,timeout=a.timeout)
   ec=p.returncode
  except subprocess.TimeoutExpired:ec=124
  records.append(dict(label=label,command=cmd,exit_code=ec,seconds=time.monotonic()-start,log_sha256=hashlib.sha256(log.read_bytes()).hexdigest()));(r/'status.json').write_text(json.dumps(status,indent=2)+'\n');print(r,label,ec,flush=True)
  if ec:print(log.read_text()[-5000:]);break
 else:
  g=r/'generated'/(a.isa+'_unit_goal.v');assert all(hashlib.sha256((C/x).read_bytes()).hexdigest()==h for x,h in identity.items()),'C construction input drift';status.update(passed=True,goal_sha256=hashlib.sha256(g.read_bytes()).hexdigest(),actual_c_vcs=len(re.findall(r'^Axiom proof_of_',g.read_text(),re.M)))
 (r/'status.json').write_text(json.dumps(status,indent=2)+'\n');out=C/'proof'/(a.isa+'-generation-status.json')
 if out.exists():(C/'proof/history'/(a.isa+'-generation-'+hashlib.sha256(out.read_bytes()).hexdigest()+'.json')).write_bytes(out.read_bytes())
 out.write_bytes((r/'status.json').read_bytes());raise SystemExit(0 if status['passed']else 1)
if __name__=='__main__':main()
