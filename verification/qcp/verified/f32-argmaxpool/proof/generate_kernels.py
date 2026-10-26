#!/usr/bin/env python3
"""Private actual-kernel TU construction from live C and public contracts.

Annotations create ordinary Coq obligations; they are not new public axioms or
preconditions. Unused aggregate-address ghosts are bound independently of the
actual caller field cells. Every rendered C token is checked against raw C.
"""
from pathlib import Path
import argparse,hashlib,json,os,re,subprocess,tempfile,time
C=Path(__file__).resolve().parents[1];R=C.parents[3]
sha=lambda p:hashlib.sha256(Path(p).read_bytes()).hexdigest()
PARAMS=['output_pixels','pooling_elements','channels','input','input_offset','input_pixel_stride','output','index','input_increment','output_increment','index_increment']
FIELDS=['pixels','rows','channels','input','offset','pixel_stride','output_base','index_base','input_increment','output_increment','index_increment']
PIX='(app_pixels(D)-output_pixels)'
GROUP='app_group_cursor(D,k)'
DONE='(channels-c)'
def current(which,group=GROUP,done='0'):
 return 'app_rvv_partial_'+which+'(F,P,D,'+PIX+','+group+','+done+',O,I)'
def heap(group=GROUP,done='0'):
 return 'ap_data(F) * ap_ptr_data(P) * ap_output(W,'+current('output',group,done)+') * ap_index(WI,'+current('index',group,done)+')'
def common():
 return ['pooling_elements==app_rows(D)','channels==app_channels(D)','input_pixel_stride==app_pixel_stride(D)','input_increment==app_input_increment(D)','output_increment==app_output_increment(D)','index_increment==app_index_increment(D)','0<channels','0<pooling_elements','0<app_pixels(D)','app_valid(F,P,W,WI,D)','sizeof(float)==4','sizeof(float*)==8']
def coords():return ['0<output_pixels','output_pixels<=app_pixels(D)','input==app_table(D,'+PIX+')','input_offset==app_offset_at(D,'+PIX+')','output==app_output_at(D,'+PIX+')','index==app_index_at(D,'+PIX+')','output!=0','index!=0']
def cut(pures,spatial,inv=False):return '/*@ '+('Inv Assert 'if inv else'Assert ')+' && '.join(pures)+' && '+spatial+' */'
def outer():
 pure=common()+['0<=output_pixels','output_pixels<=app_pixels(D)','input==app_table(D,'+PIX+')','input_offset==app_offset_at(D,'+PIX+')','output==app_output_at(D,'+PIX+')','index==app_index_at(D,'+PIX+')']
 return cut(pure,heap('0','0'),True)
def pass_state():
 return common()+coords()+['0<=k','k<=pooling_elements','(0<k || '+GROUP+'==app_groups(pooling_elements))','k==app_remaining(pooling_elements,'+GROUP+')','idx0==app_index_base_at('+GROUP+')','ab==app_previous_cursor('+GROUP+',output,0)','ib==app_previous_cursor('+GROUP+',index,0)']
def row_pointer(j):return 'app_row_pointer(P,input,pooling_elements,'+GROUP+','+str(j)+')'
def row_cursor(j,done):return 'app_row_cursor(P,input,input_offset,pooling_elements,'+GROUP+','+str(j)+','+done+')'
def row_cut(read_count,before=False):
 p=pass_state()+['0<k','id==app_read_cursor(input,pooling_elements,'+GROUP+','+str(read_count)+')']
 p+=['i'+str(j)+'=='+row_pointer(j)for j in range(read_count)]
 if before:
  if read_count:p+=['i'+str(read_count)+'==i0']
  p+=['id!=0','ap_ptr_present(P,id)']
 return cut(p,heap())
def inner(inv=True,active=False):
 p=pass_state()+['0<k','0<=c','c<=channels','id==app_table_cursor(input,pooling_elements,('+GROUP+'+1))','o==app_output_cursor(output,'+DONE+')','i==app_output_cursor(index,'+DONE+')','current_ab==app_previous_cursor('+GROUP+',output,'+DONE+')','current_ib==app_previous_cursor('+GROUP+',index,'+DONE+')']
 p+=['i'+str(j)+'=='+row_cursor(j,DONE)for j in range(9)]
 if active:
  p+=['0<c','1<=vl','vl<=32','vl<=c','ap_vl_allowed(c,vl)','ap_write_window(W,o,vl)','ap_write_window(WI,i,vl)']
  p+=['ap_window(F,i'+str(j)+',vl)'for j in range(9)]
  p+=['(current_ab==0 || ap_output_readable('+current('output',done=DONE)+',current_ab,vl))','(current_ib==0 || ap_index_readable('+current('index',done=DONE)+',current_ib,vl))','(current_ab==0 || ap_write_window(W,current_ab,vl))','(current_ib==0 || ap_write_window(WI,current_ib,vl))']
 return cut(p,heap(done=DONE),inv)
def contract(isa):
 t=(C/'spec.c').read_text();m=re.search(r'void test_'+isa+r'\([^;]+?(/\*@.*?\*/);',t,re.S);assert m;return m.group(1)
def render(isa):
 assert isa=='rvv','NEON constructor will be added after RVV transport proof'
 t=(C/'impl/testRVV.c').read_text();anchor=' XNN_OOB_READS\n{';assert t.count(anchor)==1;t=t.replace(anchor,' XNN_OOB_READS\n'+contract(isa)+'\n{',1)
 entry=common()+[a+'==app_'+f+'(D)'for a,f in zip(PARAMS,FIELDS)]+['0<output_pixels']
 t=t.replace('  assert(output_pixels != 0);','  '+cut(entry,'ap_data(F) * ap_ptr_data(P) * ap_output(W,O) * ap_index(WI,I)')+'\n  assert(output_pixels != 0);',1)
 t=t.replace('    for (; k > 0; k = k > 9 ? k - 9 : 0) {','    '+cut(pass_state()+['id==app_table_cursor(input,pooling_elements,'+GROUP+')'],heap(),True)+'\n    for (; k > 0; k = k > 9 ? k - 9 : 0) {',1)
 # Before each table read expose the precise owned address. Earlier row
 # pointer locals are ordinary scalar locals and automatically framed.
 t=t.replace('      const float* i0 = ap_read_table(id);','      '+row_cut(0,True)+'\n      const float* i0 = ap_read_table(id);',1)
 for j in range(1,9):
  a=f'        i{j} = ap_read_table(id);';assert t.count(a)==1
  t=t.replace(a,'        '+row_cut(j,True)+'\n'+a,1)
 anchor='      i0 = (const float*) ((uintptr_t) i0 + input_offset);';t=t.replace(anchor,'      '+row_cut(9)+'\n'+anchor,1)
 t=t.replace('      while (c > 0) {','      '+inner()+'\n      while (c > 0) {',1)
 a='        size_t vl = __riscv_vsetvl_e32m8(c);';t=t.replace(a,a+'\n        '+inner(False,True),1)
 t=t.replace('  } while (output_pixels != 0);','  } '+outer()+' while (output_pixels != 0);',1)
 # Select overloads explicitly; every map's state is the exact current prefix.
 def load(m):
  name,arg=m.group(1),m.group(2);w='(output_map) W=W,O='+current('output',done=DONE)if arg=='current_ab'else'(readonly_map) F=F'
  if name.endswith('u32m8'):w='(output_map) W=WI,O='+current('index',done=DONE)
  return m.group(0)[:-1]+' /*@ where '+w+' */;'
 t=re.sub(r'(__riscv_vle32_v_(?:f32|u32)m8)\((\w+), vl\);',load,t)
 for name,bindings in [('__riscv_vmfgt_vv_f32m8_b4','a=0,b=0'),('__riscv_vmerge_vvm_f32m8','a=0,b=0,m=0'),('__riscv_vmerge_vxm_u32m8','a=0,m=0')]:
  t=re.sub('('+name+r'\([^;\n]+\))\s*;',lambda m:m[1]+' /*@ where '+bindings+' */;',t)
 return '#include "'+str(C/'shim/kernel_frontend.h')+'"\n'+t
def tokens(s):
 s=re.sub(r'/\*.*?\*/|//[^\n]*',' ',s,flags=re.S);return re.findall(r'[A-Za-z_]\w*|(?:\d+(?:\.\d*)?)|>>=|<<=|==|!=|<=|>=|\+\+|--|&&|\|\||->|\+=|-=|\S',s)
def main():
 ap=argparse.ArgumentParser();ap.add_argument('--isa',choices=['rvv'],required=True);ap.add_argument('--timeout',type=int,default=21600);a=ap.parse_args()
 run=Path(tempfile.mkdtemp(prefix=a.isa+'-kernel-',dir=C/'.build'));gen=run/'generated';gen.mkdir();records=[]
 paths=[Path(__file__),C/'spec.c',C/'impl/testRVV.c',*sorted((C/'shim').glob('*.h'))];inputs={str(p.relative_to(C)):sha(p)for p in paths}
 status=dict(passed=False,whole_kernel_verified=False,scope='actual_C_kernel_goal_generation_only',run_directory=str(run),input_sha256=inputs,records=records,configured_jobs=32,max_live_processes=1,per_process_memory_GiB=32)
 env=os.environ.copy();env['PATH']=str(R/'.build/simple-kernels-bootstrap/bin')+':/tmp/qcp-coq820-install/bin:'+env['PATH']
 try:
  src=run/(a.isa+'_unit.c');src.write_text(render(a.isa));raw=run/'raw.c';raw.write_text('#include "'+str(C/'shim/kernel_frontend.h')+'"\n'+(C/'impl/testRVV.c').read_text())
  for label,cmd in [('cpp',['gcc','-E','-P','-CC','-nostdinc',str(src),'-o',str(run/'annotated.i')]),('raw-cpp',['gcc','-E','-P','-CC','-nostdinc',str(raw),'-o',str(run/'raw.i')]),('qcp',['qcp','--arch=64','--endian=little','--no-float-finite-vc','--no-exec-info','--strategy-application-limit=8192','--input-file='+str(run/'annotated.i'),'--coq-output-dir='+str(gen),'--coq-logic-path=ArgmaxPool','-slp',str(C/'shim'),'ArgmaxPool'])]:
   if label=='qcp':assert tokens((run/'annotated.i').read_text())==tokens((run/'raw.i').read_text()),'original same-frontend CPP tokens changed'
   log=run/(label+'.log');cmd=['prlimit','--as=34359738368:34359738368','--']+cmd;start=time.monotonic()
   try:
    with log.open('w')as f:p=subprocess.run(cmd,cwd=run,env=env,stdout=f,stderr=f,timeout=a.timeout)
    ec=p.returncode
   except subprocess.TimeoutExpired:ec=124
   records.append(dict(label=label,command=cmd,exit_code=ec,seconds=time.monotonic()-start,log_sha256=sha(log)));(run/'status.json').write_text(json.dumps(status,indent=2)+'\n');assert ec==0,log.read_text()[-4000:]
  goal=gen/'annotated_goal.v';assert all(sha(C/p)==h for p,h in inputs.items()),'source drift';status.update(passed=True,goal_path=str(goal),goal_sha256=sha(goal),actual_C_fields=len(re.findall(r'^Axiom proof_of_',goal.read_text(),re.M)),original_same_frontend_CPP_tokens_identical=True)
 except Exception as e:status['error']=str(e)
 (run/'status.json').write_text(json.dumps(status,indent=2)+'\n');print(json.dumps({k:status.get(k)for k in ['passed','run_directory','actual_C_fields','error']}));raise SystemExit(0 if status['passed']else 1)
if __name__=='__main__':main()
