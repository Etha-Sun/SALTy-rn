#!/usr/bin/env python3
"""Generate actual repaired kernel C with checked-token-preserving annotations.

Intrinsic declarations are reviewed specs; ordinary reader/assert/NaN helpers
require their own body proofs. This generation never grants whole-kernel credit.
"""
from pathlib import Path
import argparse,hashlib,json,os,re,subprocess,tempfile,time
C=Path(__file__).resolve().parents[1]
def sha(p):return hashlib.sha256(Path(p).read_bytes()).hexdigest()
def tokens(s):return re.findall(r'\w+|[^\s\w]',re.sub(r'/\*.*?\*/|//[^\n]*','',s,flags=re.S))
def annotation_source(isa):
 assert isa=='neon','RVV annotations are constructed independently after NEON generation'
 raw=(C/'impl/testNEON.c').read_text();spec=json.loads((C/'proof/c/kernel-contract.json').read_text());contract='/*@ '+spec['with']+' Require '+spec['require']+' Ensure '+spec['ensure']+' */';text=raw.replace('\n{','\n'+contract+'\n{',1);patches=[]
 P='output_pixels@pre';K='kernel_elements';N='channels';pixel='('+P+'-output_pixels)';done='('+N+'-c)';table='input';offset='input_offset';output='output'
 old='mp_pixel_before(F,PT,old,input@pre,input_offset@pre,input_pixel_stride,input_increment,output@pre,output_increment,'+K+','+N+','+pixel+',lo,hi)'
 fixed=['kernel_elements','channels','input_pixel_stride','input_increment','output_increment','params']
 const=' && '.join(x+'=='+x+'@pre'for x in fixed)
 geom=spec['require'].split(' && mp_geometry',1)[1].split(' && mp_data',1)[0]
 geom='mp_geometry'+geom
 # Use original bases in the geometry; runtime pointers are related below.
 geom=geom.replace(',input,input_offset,',',input@pre,input_offset@pre,').replace(',output,output_increment',',output@pre,output_increment')
 geom=geom.replace(',output_pixels,',',output_pixels@pre,')
 words=' && '.join('mp_word64('+x+'@pre)'for x in ['output_pixels','kernel_elements','channels','input_offset','input_pixel_stride','input_increment','output_increment','input','output','params'])
 pure=const+' && sizeof(float)==4 && sizeof(float*)==8 && 0<'+P+' && 0<channels && params!=0 && '+words+' && '+geom+' && 0<=output_pixels && output_pixels<='+P+' && input==mp_table_at(input@pre,input_increment,'+pixel+') && input_offset==mp_offset_at(input_offset@pre,input_pixel_stride,'+pixel+') && output==mp_output_at(output@pre,output_increment,'+pixel+')'
 heap='mp_data(F) * mp_ptr_data(PT) * store(&(params->scalar.min),float,lo) * store(&(params->scalar.max),float,hi)'
 vectors=' * '.join('store(&('+v+'.s'+str(i)+'),float,'+val+')'for v,val in [('vmin','lo'),('vmax','hi')]for i in range(4))
 fullheap=heap+' * '+vectors
 def cut(anchor,body,kind='Assert',count=1):
  nonlocal text
  assert text.count(anchor)==count,(anchor,text.count(anchor),count)
  ann='/*@ '+kind+' '+body+' */';text=text.replace(anchor,ann+'\n'+anchor);patches.append(dict(anchor=anchor,annotation=ann,occurrences=count))
 # Width is independently checked; the actual entry VC must establish it too.
 cut('  assert(output_pixels != 0);',spec['require']+' && sizeof(float)==4 && sizeof(float*)==8')
 def partial(group):return 'mp_pass_partial(F,PT,'+old+',input,input_offset,output,kernel_elements,channels,'+group+','+done+',lo,hi)'
 def complete(group):return 'mp_pass_complete(F,PT,'+old+',input,input_offset,output,kernel_elements,channels,'+group+',lo,hi)'
 outer='0<output_pixels && '+pure
 def gstate():return '0<=g && g<=mp_extra_groups(kernel_elements) && k==mp_k_after(kernel_elements,g)'
 def current(group,more=False):
  extra=' && '+gstate() if more else ''
  return outer+extra+' && i==mp_table_cursor(input,kernel_elements,'+group+') && 0<=c && c<=channels && (channels-c)%4==0 && o==mp_output_cursor(output,'+done+') && '+' && '.join('i'+str(j)+'==mp_row_cursor(PT,input,input_offset,kernel_elements,'+group+','+str(j)+','+done+')'for j in range(9))+' && '+fullheap+' * mp_out(W,'+partial(group)+')'
 # Two loops have identical C tokens but different pass history.
 anchor='\n    for (; c >= 4; c -= 4) {';assert text.count(anchor)==1;cut(anchor,current('0'),'Inv Assert')
 anchor='\n      for (; c >= 4; c -= 4) {';assert text.count(anchor)==1;cut(anchor,'exists (g:Z), '+current('(g+1)',True),'Inv Assert')
 more_inv='exists (g:Z), '+outer+' && '+gstate()+' && i==mp_table_cursor(input,kernel_elements,g) && '+fullheap+' * mp_out(W,'+complete('g')+')'
 cut('    for (size_t k = kernel_elements > 9 ? kernel_elements - 9 : 0;',more_inv,'Inv Assert')
 # The do invariant is at the actual back edge after the explicit decrement.
 cut('  } while (output_pixels != 0);',pure+' && output_pixels<'+P+' && '+fullheap+' * mp_out(W,'+old+')','Inv Assert')
 # Move bottom Inv between closing brace and while, the supported QCP layout.
 last=patches[-1]['annotation'];text=text.replace(last+'\n  } while (output_pixels != 0);','  }\n'+last+'\n  while (output_pixels != 0);')
 # A cut after each conditional table read joins precisely the two original
 # branches, preventing exponential enumeration of eight optional inputs.
 for more,indent,available,group in [(False,'    ','kernel_elements','0'),(True,'      ','k','(g+1)')]:
  state=outer+(' && '+gstate()if more else '')
  before=complete('g')if more else old
  for j in range(9):
   line=('\n'+indent+'const float* i0 = mp_read_table(i); i += 1;'if j==0 else '\n'+indent+'if ('+str(j)+' < '+available+') { i'+str(j)+' = mp_read_table(i); i += 1; }')
   assert text.count(line)==1,(line,text.count(line))
   equalities=' && '.join('i'+str(t)+'==mp_row_pointer(PT,input,kernel_elements,'+group+','+str(t)+')'for t in range(j+1))
   value=state+' && i==mp_table_read_cursor(input,kernel_elements,'+group+','+str(j+1)+') && '+equalities+' && '+fullheap+' * mp_out(W,'+before+')'
   ann='/*@ Assert '+('exists (g:Z), 'if more else '')+value+' */';text=text.replace(line,line+'\n'+ann);patches.append(dict(anchor=line,annotation=ann,position='after',occurrences=1))
  line='\n'+indent+'i8 = (const float*) ((uintptr_t) i8 + input_offset);';assert text.count(line)==1
  equalities=' && '.join('i'+str(t)+'==mp_row_cursor(PT,input,input_offset,kernel_elements,'+group+','+str(t)+',0)'for t in range(9))
  value=state+' && i==mp_table_cursor(input,kernel_elements,'+group+') && '+equalities+' && '+fullheap+' * mp_out(W,'+before+')'
  ann='/*@ Assert '+('exists (g:Z), 'if more else '')+value+' */';text=text.replace(line,line+'\n'+ann);patches.append(dict(anchor=line,annotation=ann,position='after',occurrences=1))
 # Tail values beyond c are arbitrary, particularly for reads of undefined
 # output padding in later passes. Only the observed c lanes are related to
 # the mathematical pass. Preserve initialized record cells exactly once.
 for more,indent,group in [(False,'      ','0'),(True,'        ','(g+1)')]:
  logical='exists '+('(g:Z) 'if more else '')+'(q0:fp32) (q1:fp32) (q2:fp32) (q3:fp32), '
  tailpure=current(group,more).split(' && '+fullheap)[0]+' && 1<=c && c<=3 && mp_tail_values(F,PT,input,input_offset,kernel_elements,'+group+','+done+',c,lo,hi,q0,q1,q2,q3)'
  fields=' * '.join('store(&(vacc.s'+str(j)+'),float,q'+str(j)+')'for j in range(4))
  before=logical+tailpure+' && '+fullheap+' * mp_out(W,'+partial(group)+') * '+fields+' * store(&(vacc_lo.s0),float,q0) * store(&(vacc_lo.s1),float,q1)'
  cut('\n'+indent+'if (c & 2) {',before)
  offset='('+done+'+mp_tail_two(c))'
  afterpure=tailpure.replace('o==mp_output_cursor(output,'+done+')','o==mp_output_cursor(output,'+offset+')')
  aftermap=partial(group).replace(','+done+',lo,hi)',','+offset+',lo,hi)')
  after=logical.replace('exists ','exists (cur:MPOutput) ',1)+afterpure+' && mp_output_equal(cur,'+aftermap+') && '+fullheap+' * mp_out(W,cur) * '+fields+' * store(&(vacc_lo.s0),float,mp_tail_low(c,q0,q2)) * store(&(vacc_lo.s1),float,mp_tail_low(c,q1,q3))'
  cut('\n'+indent+'if (c & 1) {',after)
 # Explicit named actual addresses for every by-value record input.
 positions={'vmaxq_f32':[(0,'a'),(1,'b')],'vminq_f32':[(0,'a'),(1,'b')],'vget_low_f32':[(0,'a')],'vget_high_f32':[(0,'a')],'vst1q_f32':[(1,'a')],'vst1_f32':[(1,'a')],'vst1_lane_f32':[(1,'a')]}
 where=[]
 def calls(m):
  name,args=m.group(1),m.group(2);values=[s.strip()for s in args.split(',')]
  if name=='vld1q_f32':
   binding='(output_map) W=W'if values[0]=='o'else'(readonly_map) F=F'
  elif name=='mp_read_table':binding='P=PT'
  else:
   binding=','.join(key+'=&'+values[i]for i,key in positions[name]);binding+=(',W=W'if name.startswith('vst1')else'');assert all(re.fullmatch(r'\w+',values[i])for i,key in positions[name]),m[0]
  annotation=' /*@ where '+binding+' */';where.append(dict(call=m[0],annotation=annotation));return m[0]+annotation
 text=re.sub(r'\b('+ '|'.join([*positions,'vld1q_f32','mp_read_table'])+r')\(([^()]*?)\)',calls,text)
 assert tokens(text)==tokens(raw),'annotations changed real C tokens'
 return raw,text,dict(contract=contract,invariants=patches,where=where,source_sha256=sha(C/'impl/testNEON.c'),whole_kernel_verified=False)
def main():
 p=argparse.ArgumentParser();p.add_argument('--isa',choices=['neon'],default='neon');p.add_argument('--timeout',type=int,default=21600);p.add_argument('--prepare-only',action='store_true');a=p.parse_args();r=Path(tempfile.mkdtemp(prefix=a.isa+'-kernel-',dir=C/'.build'));raw,text,ann=annotation_source(a.isa);stem=a.isa+'_unit';env=os.environ.copy();env['PATH']=str(C.parents[3]/'.build/simple-kernels-bootstrap/bin')+':/tmp/qcp-coq820-install/bin:'+env['PATH'];inputs={str(q.relative_to(C)):sha(q)for q in [C/'impl/testNEON.c',*sorted((C/'shim').glob('*.h')),*[C/'proof/coq'/(n+'.v')for n in ['Bits','Model','MemoryModel','MemoryViews','PackModel','Types','ProgramModel','ContractModel','KernelState','KernelTail']],C/'proof/c/kernel-contract.json',Path(__file__)]};records=[];status=dict(generation_passed=False,whole_kernel_verified=False,run_directory=str(r),input_sha256=inputs,records=records)
 def run(label,cmd,mem,timeout):
  cmd=['prlimit','--as='+str(mem*1024**3)+':'+str(mem*1024**3),'--',*map(str,cmd)];log=r/(label+'.log');t=time.monotonic()
  with log.open('w')as f:result=subprocess.run(cmd,cwd=r,env=env,stdout=f,stderr=f,timeout=timeout)
  records.append(dict(label=label,command=cmd,exit_code=result.returncode,seconds=time.monotonic()-t,memory_limit_GiB=mem,log_sha256=sha(log)));(r/'status.json').write_text(json.dumps(status,indent=2)+'\n');assert result.returncode==0,log.read_text()[-4000:]
 try:
  prefix='#include "'+str(C/'shim/kernel_state.h')+'"\n#include "'+str(C/'shim/neon_specs.h')+'"\nvoid mp_assert(int ok) /*@ Require ok!=0 && emp Ensure emp */;\n#define assert(x) mp_assert(x)\n#define restrict\n'
  for name,body in [('raw',raw),(stem,text)]:
   source=r/(name+'.in.c');source.write_text(prefix+body);run(name+'-cpp',['gcc','-E','-P','-CC','-nostdinc','-I',C/'impl',source,'-o',r/(name+'.c')],16,120)
  assert tokens((r/'raw.c').read_text())==tokens((r/(stem+'.c')).read_text());(r/'annotations.json').write_text(json.dumps(ann,indent=2)+'\n');status['source_tokens_preserved']=True
  if not a.prepare_only:
   gen=r/'generated';gen.mkdir();run('qcp',['qcp','--arch=64','--endian=little','--no-float-finite-vc','--no-exec-info','--strategy-application-limit=4096','--input-file='+str(r/(stem+'.c')),'--coq-output-dir='+str(gen),'--coq-logic-path=MaxPool','-slp',C/'shim','MaxPool'],32,a.timeout);goal=gen/(stem+'_goal.v');fields=re.findall(r'^Axiom proof_of_(\w+)\s*:',goal.read_text(),re.M);assert fields;assert inputs=={s:sha(C/s)for s in inputs};status.update(generation_passed=True,generated_c_vcs=len(fields),fields=fields,goal_sha256=sha(goal),cpp_sha256=sha(r/(stem+'.c')))
 except Exception as e:status['error']=str(e)
 (r/'status.json').write_text(json.dumps(status,indent=2)+'\n');print(json.dumps({k:status.get(k)for k in ['generation_passed','run_directory','generated_c_vcs','error']}));return 0 if status.get('generation_passed')or a.prepare_only and'error'not in status else 1
if __name__=='__main__':raise SystemExit(main())
