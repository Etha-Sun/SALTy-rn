#!/usr/bin/env python3
"""Actual repaired RVV kernel; independent source-preserving annotations."""
from pathlib import Path
import argparse,hashlib,json,os,re,subprocess,tempfile,time
C=Path(__file__).resolve().parents[1]
def sha(p):return hashlib.sha256(Path(p).read_bytes()).hexdigest()
def tokens(s):return re.findall(r'\w+|[^\s\w]',re.sub(r'/\*.*?\*/|//[^\n]*','',s,flags=re.S))
def kernel_text():
 raw=(C/'impl/testRVV.c').read_text();spec=json.loads((C/'proof/c/kernel-contract.json').read_text());contract='/*@ '+spec['with']+' Require '+spec['require']+' Ensure '+spec['ensure']+' */';text=raw.replace('\n{','\n'+contract+'\n{',1);patches=[]
 P='output_pixels@pre';pixel='('+P+'-output_pixels)';done='(channels-c)'
 old='mp_pixel_before(F,PT,old,input@pre,input_offset@pre,input_pixel_stride,input_increment,output@pre,output_increment,kernel_elements,channels,'+pixel+',lo,hi)'
 fixed=['kernel_elements','channels','input_pixel_stride','input_increment','output_increment','params']
 const=' && '.join(x+'=='+x+'@pre'for x in fixed)
 geom='mp_geometry'+spec['require'].split(' && mp_geometry',1)[1].split(' && mp_data',1)[0]
 geom=geom.replace(',input,input_offset,',',input@pre,input_offset@pre,').replace(',output,output_increment',',output@pre,output_increment').replace(',output_pixels,',',output_pixels@pre,')
 words=' && '.join('mp_word64('+x+'@pre)'for x in ['output_pixels','kernel_elements','channels','input_offset','input_pixel_stride','input_increment','output_increment','input','output','params'])
 pure=const+' && sizeof(float)==4 && sizeof(float*)==8 && 0<'+P+' && 0<channels && params!=0 && '+words+' && '+geom+' && 0<=output_pixels && output_pixels<='+P+' && input==mp_table_at(input@pre,input_increment,'+pixel+') && input_offset==mp_offset_at(input_offset@pre,input_pixel_stride,'+pixel+') && output==mp_output_at(output@pre,output_increment,'+pixel+')'
 heap='mp_data(F) * mp_ptr_data(PT) * store(&(params->scalar.min),float,lo) * store(&(params->scalar.max),float,hi) * store(&(vmin),float,lo) * store(&(vmax),float,hi)'
 outer='0<output_pixels && '+pure
 def cut(anchor,body,kind='Assert',after=False):
  nonlocal text
  assert text.count(anchor)==1,(anchor,text.count(anchor));ann='/*@ '+kind+' '+body+' */';text=text.replace(anchor,anchor+'\n'+ann if after else ann+'\n'+anchor);patches.append(dict(anchor=anchor,annotation=ann,position='after'if after else'before'))
 identity=' && '.join(x+'=='+x+'@pre'for x in ['output_pixels','kernel_elements','channels','input','input_offset','input_pixel_stride','output','input_increment','output_increment','params'])
 cut('  assert(output_pixels != 0);',identity+' && '+spec['require']+' && sizeof(float)==4 && sizeof(float*)==8')
 def partial(group):return 'mp_pass_partial(F,PT,'+old+',input,input_offset,output,kernel_elements,channels,'+group+','+done+',lo,hi)'
 def complete(group):return 'mp_pass_complete(F,PT,'+old+',input,input_offset,output,kernel_elements,channels,'+group+',lo,hi)'
 def gstate():return '0<=g && g<=mp_extra_groups(kernel_elements) && k==mp_k_after(kernel_elements,g)'
 def current(group,more=False):
  return outer+(' && 0<k && '+gstate()if more else'')+' && i==mp_table_cursor(input,kernel_elements,'+group+') && 0<=c && c<=channels && o==mp_output_cursor(output,'+done+') && '+' && '.join('i'+str(j)+'==mp_row_cursor(PT,input,input_offset,kernel_elements,'+group+','+str(j)+','+done+')'for j in range(9))+' && '+heap+' * mp_out(W,'+partial(group)+')'
 for more,indent,group in [(False,'    ','0'),(True,'      ','(g+1)')]:
  cut('\n'+indent+'while (c > 0) {',('exists (g:Z), 'if more else'')+current(group,more),'Inv Assert')
  line='\n'+indent+'  size_t vl = __riscv_vsetvl_e32m8(c);'
  assert text.count(line)==1,(line,text.count(line))
  bound=current(group,more).split(' && '+heap)[0]+' && 0<c && mp_vl_allowed(c,vl) && 0<vl && vl<=32 && vl<=c && '+heap+' * mp_out(W,'+partial(group)+')'
  cut(line,('exists (g:Z), 'if more else'')+bound,after=True)
 cut('    for (size_t k = kernel_elements > 9 ? kernel_elements - 9 : 0;','exists (g:Z), '+outer+' && '+gstate()+' && i==mp_table_cursor(input,kernel_elements,g) && '+heap+' * mp_out(W,'+complete('g')+')','Inv Assert')
 cut('  } while (output_pixels != 0);',pure+' && output_pixels<'+P+' && '+heap+' * mp_out(W,'+old+')','Inv Assert')
 last=patches[-1]['annotation'];text=text.replace(last+'\n  } while (output_pixels != 0);','  }\n'+last+'\n  while (output_pixels != 0);')
 for more,indent,available,group in [(False,'    ','kernel_elements','0'),(True,'      ','k','(g+1)')]:
  state=outer+(' && 0<k && '+gstate()if more else'');before=complete('g')if more else old
  for j in range(9):
   line=('\n'+indent+'const float* i0 = mp_read_table(i); i += 1;'if j==0 else'\n'+indent+'if ('+str(j)+' < '+available+') { i'+str(j)+' = mp_read_table(i); i += 1; }')
   eq=' && '.join('i'+str(t)+'==mp_row_pointer(PT,input,kernel_elements,'+group+','+str(t)+')'for t in range(j+1))
   cut(line,('exists (g:Z), 'if more else'')+state+' && i==mp_table_read_cursor(input,kernel_elements,'+group+','+str(j+1)+') && '+eq+' && '+heap+' * mp_out(W,'+before+')',after=True)
  line='\n'+indent+'i8 = (const float*) ((uintptr_t) i8 + input_offset);'
  eq=' && '.join('i'+str(t)+'==mp_row_cursor(PT,input,input_offset,kernel_elements,'+group+','+str(t)+',0)'for t in range(9))
  cut(line,('exists (g:Z), 'if more else'')+state+' && i==mp_table_cursor(input,kernel_elements,'+group+') && '+eq+' && '+heap+' * mp_out(W,'+before+')',after=True)
 positions={'mp_max_vv':[(0,'a'),(1,'b')],'mp_min_vv':[(0,'a'),(1,'b')],'mp_max_vf':[(0,'a')],'mp_min_vf':[(0,'a')]};where=[]
 def call(m):
  name,args=m.group(1),[x.strip()for x in m.group(2).split(',')]
  if name=='__riscv_vle32_v_f32m8':bind='(output_map) W=W'if args[0]=='o'else'(readonly_map) F=F'
  elif name=='mp_read_table':bind='P=PT'
  elif name=='__riscv_vse32_v_f32m8':assert re.fullmatch(r'\w+',args[1]);bind='W=W'
  else:
   assert all(re.fullmatch(r'\w+',args[i])for i,k in positions[name]),m[0];bind=','.join(k+'=&'+args[i]for i,k in positions[name])
  ann=' /*@ where '+bind+' */';where.append(dict(call=m[0],annotation=ann));return m[0]+ann
 text=re.sub(r'\b('+ '|'.join([*positions,'__riscv_vle32_v_f32m8','__riscv_vse32_v_f32m8','mp_read_table'])+r')\(([^()]*?)\)',call,text)
 assert tokens(raw)==tokens(text)
 return raw,text,dict(contract=contract,annotations=patches,where=where,source_sha256=sha(C/'impl/testRVV.c'))
def main():
 p=argparse.ArgumentParser();p.add_argument('--timeout',type=int,default=21600);p.add_argument('--prepare-only',action='store_true');a=p.parse_args();r=Path(tempfile.mkdtemp(prefix='rvv-kernel-',dir=C/'.build'));raw,text,ann=kernel_text();stem='rvv_unit';env={**os.environ,'PATH':str(C.parents[3]/'.build/simple-kernels-bootstrap/bin')+':/tmp/qcp-coq820-install/bin:'+os.environ['PATH']};files=['impl/testRVV.c','proof/generate_rvv.py','proof/c/kernel-contract.json']+[str(q.relative_to(C))for q in(C/'shim').glob('*.h')]+['proof/coq/'+n+'.v'for n in ['Bits','Model','Types','VectorModel','MemoryModel','MemoryViews','PackModel','ProgramModel','ContractModel','KernelState','KernelTail','RvvMemoryModel']];inputs={x:sha(C/x)for x in files};records=[];status=dict(generation_passed=False,whole_kernel_verified=False,input_sha256=inputs,run_directory=str(r),records=records)
 def run(label,cmd,mem,timeout):
  cmd=['prlimit','--as='+str(mem*1024**3)+':'+str(mem*1024**3),'--',*map(str,cmd)];log=r/(label+'.log');t=time.monotonic()
  with log.open('w')as out:cp=subprocess.run(cmd,cwd=r,env=env,stdout=out,stderr=out,timeout=timeout)
  records.append(dict(label=label,command=cmd,exit_code=cp.returncode,seconds=time.monotonic()-t,log_sha256=sha(log),memory_limit_GiB=mem));(r/'status.json').write_text(json.dumps(status,indent=2)+'\n');assert cp.returncode==0,log.read_text()[-3000:]
 try:
  prefix='#include "'+str(C/'shim/kernel_state.h')+'"\n#include "'+str(C/'shim/rvv_memory_specs.h')+'"\n#include "'+str(C/'shim/propagate_specs.h')+'"\n#define MP_PROPAGATE_H\nvoid mp_assert(int ok) /*@ Require ok!=0 && emp Ensure emp */;\n#define assert(x) mp_assert(x)\n#define restrict\n'
  for n,body in [('raw',raw),(stem,text)]:
   f=r/(n+'.in.c');f.write_text(prefix+body);run(n+'-cpp',['gcc','-E','-P','-CC','-nostdinc','-I',C/'impl',f,'-o',r/(n+'.c')],16,120)
  assert tokens((r/'raw.c').read_text())==tokens((r/(stem+'.c')).read_text());(r/'annotations.json').write_text(json.dumps(ann,indent=2)+'\n');status['source_tokens_preserved']=True
  if not a.prepare_only:
   g=r/'generated';g.mkdir();run('qcp',['qcp','--arch=64','--endian=little','--no-float-finite-vc','--no-exec-info','--strategy-application-limit=4096','--input-file='+str(r/(stem+'.c')),'--coq-output-dir='+str(g),'--coq-logic-path=MaxPool','-slp',C/'shim','MaxPool'],32,a.timeout);goal=g/(stem+'_goal.v');fields=re.findall(r'^Axiom proof_of_(\w+)\s*:',goal.read_text(),re.M);assert fields;assert inputs=={x:sha(C/x)for x in inputs};status.update(generation_passed=True,generated_c_vcs=len(fields),fields=fields,goal_sha256=sha(goal),cpp_sha256=sha(r/(stem+'.c')))
 except Exception as e:status['error']=str(e)
 (r/'status.json').write_text(json.dumps(status,indent=2)+'\n');print(json.dumps({k:status.get(k)for k in ['generation_passed','run_directory','generated_c_vcs','error']}));return 0 if status['generation_passed']or a.prepare_only and'error'not in status else 1
if __name__=='__main__':raise SystemExit(main())
