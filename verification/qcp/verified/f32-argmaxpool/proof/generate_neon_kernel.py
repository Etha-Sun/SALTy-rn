#!/usr/bin/env python3
"""Comment-only constructor for the actual repaired NEON argmax kernel.

The old value of vidx8 is forgotten only at the pass boundary, after its last
use in vidx0=vaddq_u32(vidx8,v1). Four undefined cells remain owned.
"""
from pathlib import Path
import argparse,hashlib,json,os,re,subprocess,tempfile,time
import generate_kernels as G
C=G.C;R=G.R;PIX=G.PIX;GROUP=G.GROUP;DONE=G.DONE;sha=G.sha
def fields(v,value):return ' * '.join(f'store(&({v}.s{j}),unsigned int,{value})'for j in range(4))
def vecs():return fields('v1','1')+' * '+fields('vidx0','app_index_base_at('+GROUP+')')
def current(which,group=GROUP,done='0'):
 return 'app_neon_partial_'+which+'(F,P,D,'+PIX+','+group+','+done+',O,I)'
def heap(group=GROUP,done='0',v0=True,v8=False):
 h='ap_data(F) * ap_ptr_data(P) * ap_output(W,'+current('output',group,done)+') * ap_index(WI,'+current('index',group,done)+') * '+fields('v1','1')
 if v0:h+=' * '+fields('vidx0','app_index_base_at('+group+')')
 if v8:h+=' * UndefStructPreduint32x4_t(&(vidx8))'
 return h
def state():return G.common()+G.coords()+['0<=k','k<=pooling_elements','k==app_remaining(pooling_elements,'+GROUP+')']
def pass_state():return state()+['ab==app_previous_cursor('+GROUP+',output,0)','ib==app_previous_cursor('+GROUP+',index,0)']
def row_cut(count,before=False):
 p=pass_state()+['0<k','id==app_read_cursor(input,pooling_elements,'+GROUP+','+str(count)+')']
 p+=['i'+str(j)+'=='+G.row_pointer(j)for j in range(count)]
 if before:
  if count:p+=['i'+str(count)+'==i0']
  p+=['id!=0','ap_ptr_present(P,id)']
 return G.cut(p,heap(v8=True))
def channel(inv=True,tail=False,body=False):
 p=state()+['0<k','0<=c','c<=channels','(channels-c)%4==0','id==app_table_cursor(input,pooling_elements,('+GROUP+'+1))','o==app_output_cursor(output,'+DONE+')','i==app_output_cursor(index,'+DONE+')','ab==app_previous_cursor('+GROUP+',output,'+DONE+')','ib==app_previous_cursor('+GROUP+',index,'+DONE+')']
 p+=['i'+str(j)+'=='+G.row_cursor(j,DONE)for j in range(9)]
 if tail:
  p+=['0<c','c<4','ap_write_window(W,o,c)','ap_write_window(WI,i,c)']
  p+=['ap_window(F,i'+str(j)+',4)'for j in range(9)]
 elif body:
  p+=['4<=c','ap_write_window(W,o,4)','ap_write_window(WI,i,4)']
  p+=['ap_window(F,i'+str(j)+',4)'for j in range(9)]
 base=heap(done=DONE)
 branches=[]
 for cond,extra in [(DONE+'==0','UndefStructPreduint32x4_t(&(vidx8))'),('0<'+DONE,fields('vidx8','ap_u32(9*'+GROUP+'+8)'))]:
  branches.append('('+' && '.join(p+[cond])+' && '+base+' * '+extra+')')
 return '/*@ '+('Inv Assert 'if inv else'Assert ')+' || '.join(branches)+' */'
def render():
 t=(C/'impl/testNEON.c').read_text();anchor=' XNN_OOB_READS\n{';assert t.count(anchor)==1;t=t.replace(anchor,' XNN_OOB_READS\n'+G.contract('neon')+'\n{',1)
 entry=G.common()+[a+'==app_'+f+'(D)'for a,f in zip(G.PARAMS,G.FIELDS)]+['0<output_pixels']
 t=t.replace('  assert(output_pixels != 0);','  '+G.cut(entry,'ap_data(F) * ap_ptr_data(P) * ap_output(W,O) * ap_index(WI,I)')+'\n  assert(output_pixels != 0);',1)
 loop='    for (; k > 0; k = k > 9 ? k - 9 : 0) {'
 t=t.replace(loop,'    '+G.cut(pass_state()+['id==app_table_cursor(input,pooling_elements,'+GROUP+')'],heap(v8=True),True)+'\n'+loop,1)
 t=t.replace('      const float* i0 = ap_read_table(id);','      '+row_cut(0,True)+'\n      const float* i0 = ap_read_table(id);',1)
 for j in range(1,9):
  a=f'        i{j} = ap_read_table(id);';assert t.count(a)==1;t=t.replace(a,'        '+row_cut(j,True)+'\n'+a,1)
 a='      i0 = (const float*) ((uintptr_t) i0 + input_offset);';t=t.replace(a,'      '+row_cut(9)+'\n'+a,1)
 a='      for (; c >= 4; c -= 4) {';t=t.replace(a,'      '+channel()+'\n'+a+'\n        '+channel(False,False,True),1)
 a='      if (c != 0) {';t=t.replace(a,a+'\n        '+channel(False,True),1)
 p=G.common()+['0<=output_pixels','output_pixels<=app_pixels(D)','input==app_table(D,'+PIX+')','input_offset==app_offset_at(D,'+PIX+')','output==app_output_at(D,'+PIX+')','index==app_index_at(D,'+PIX+')']
 t=t.replace('  } while (output_pixels != 0);','  } '+G.cut(p,heap('0','0',False),True)+' while (output_pixels != 0);',1)
 def load(m):
  arg=m.group(2);suffix='index'if m.group(1).endswith('u32')else'output'
  binding='(output_map) W='+('WI'if suffix=='index'else'W')+',O='+current(suffix,done=DONE)if arg in ['ab','ib']else'(readonly_map) F=F'
  return m[0]+' /*@ where '+binding+' */'
 t=re.sub(r'\b(vld1q_(?:f32|u32))\((\w+)\)',load,t)
 # The two scalar previous readers are actual checked ordinary C functions.
 for name,which,w in [('ap_read_previous_float','output','W'),('ap_read_previous_uint','index','WI')]:
  def previous(m):
   lane=re.search(r'\+\s*([12])',m[1]);j=lane[1]if lane else'0'
   value='app_previous_'+('float'if which=='output'else'index')+'_value(F,P,D,'+PIX+','+GROUP+','+DONE+'+'+j+')'
   return m[1]+' /*@ where W='+w+',O='+current(which,done=DONE)+',v='+value+' */;'
  t=re.sub('('+name+r'\([^;\n]+\))\s*;',previous,t)
 for name,bind in [('vcgtq_f32','a=0,b=0'),('vaddq_u32','a=0,b=0'),('vbslq_f32','m=0,a=0,b=0'),('vbslq_u32','m=0,a=0,b=0'),('vget_low_f32','a=0'),('vget_high_f32','a=0'),('vget_low_u32','a=0'),('vget_high_u32','a=0'),('vsetq_lane_f32','a=0'),('vsetq_lane_u32','a=0')]:
  t=re.sub('('+name+r'\([^;\n]+\))\s*;',lambda m:m[1]+' /*@ where '+bind+' */;',t)
 assert G.tokens(t)==G.tokens((C/'impl/testNEON.c').read_text())
 return '#include "'+str(C/'shim/neon_kernel_frontend.h')+'"\n'+t
def main():
 ap=argparse.ArgumentParser();ap.add_argument('--timeout',type=int,default=21600);a=ap.parse_args();run=Path(tempfile.mkdtemp(prefix='neon-kernel-',dir=C/'.build'));gen=run/'generated';gen.mkdir();records=[]
 paths=[Path(__file__),C/'proof/generate_kernels.py',C/'spec.c',C/'impl/testNEON.c',*sorted((C/'shim').glob('*.h'))];inputs={str(p.relative_to(C)):sha(p)for p in paths}
 s=dict(passed=False,whole_kernel_verified=False,scope='actual_C_kernel_goal_generation_only',run_directory=str(run),input_sha256=inputs,records=records,configured_jobs=32,max_live_processes=1,per_process_memory_GiB=32)
 env={**os.environ,'PATH':str(R/'.build/simple-kernels-bootstrap/bin')+':/tmp/qcp-coq820-install/bin:'+os.environ['PATH']}
 try:
  (run/'neon_unit.c').write_text(render());(run/'raw.c').write_text('#include "'+str(C/'shim/neon_kernel_frontend.h')+'"\n'+(C/'impl/testNEON.c').read_text())
  for label,cmd in [('cpp',['gcc','-E','-P','-CC','-nostdinc',str(run/'neon_unit.c'),'-o',str(run/'neon_unit.i')]),('raw-cpp',['gcc','-E','-P','-CC','-nostdinc',str(run/'raw.c'),'-o',str(run/'raw.i')]),('qcp',['qcp','--arch=64','--endian=little','--no-float-finite-vc','--no-exec-info','--strategy-application-limit=8192','--input-file='+str(run/'neon_unit.i'),'--coq-output-dir='+str(gen),'--coq-logic-path=ArgmaxPool','-slp',str(C/'shim'),'ArgmaxPool'])]:
   if label=='qcp':assert G.tokens((run/'neon_unit.i').read_text())==G.tokens((run/'raw.i').read_text()),'CPP token identity failure'
   log=run/(label+'.log');cmd=['prlimit','--as=34359738368:34359738368','--']+cmd;start=time.monotonic()
   try:
    with log.open('w')as f:p=subprocess.run(cmd,cwd=run,env=env,stdout=f,stderr=f,timeout=a.timeout)
    ec=p.returncode
   except subprocess.TimeoutExpired:ec=124
   records.append(dict(label=label,command=cmd,exit_code=ec,seconds=time.monotonic()-start,log_sha256=sha(log)));(run/'status.json').write_text(json.dumps(s,indent=2)+'\n');assert ec==0,log.read_text()[-4000:]
  goal=gen/'neon_unit_goal.v';assert all(sha(C/p)==h for p,h in inputs.items()),'source drift';s.update(passed=True,goal_path=str(goal),goal_sha256=sha(goal),actual_C_fields=len(re.findall(r'^Axiom proof_of_',goal.read_text(),re.M)),original_same_frontend_CPP_tokens_identical=True)
 except Exception as e:s['error']=str(e)
 (run/'status.json').write_text(json.dumps(s,indent=2)+'\n');print(json.dumps({k:s.get(k)for k in ['passed','run_directory','actual_C_fields','error']}));raise SystemExit(0 if s['passed']else 1)
if __name__=='__main__':main()
