#!/usr/bin/env python3
"""Optional proof-only naming cut; original compatible C tokens are unchanged."""
from pathlib import Path
import argparse,json,re,hashlib,subprocess,tempfile,time
import generate_kernel as legacy
H=Path(__file__).resolve().parent;C=H.parent;R=next(p for p in C.parents if(p/'.git').exists());B=R/'verification/qcp/verified/f32-vadd'
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
tokens=legacy.tokens
def kernel_text(isa):
 assert isa=='rvv'
 raw,text,meta=legacy.kernel_text(isa)
 N='(batch@pre/4)';k='f16_progress';lv='vadd_vl('+N+'-'+k+')';chunk='rvv_slice('+k+','+k+'+'+lv+',A)'
 assert text.count('/*@ Inv Assert ')==1
 text=text.replace('/*@ Inv Assert ','/*@ Inv Assert exists (f16_progress : Z), f16_progress == '+N+'-n && ',1)
 text=text.replace('  while (n > 0) {','  while (n > 0) {\n/*@ Given f16_progress */',1)
 pos=text.index('    vfloat32m8_t vx =');start=text.rfind('/*@ Assert ',0,pos);assert start>=0
 text=text[:start]+text[start:].replace('/*@ Assert ','/*@ Assert f16_progress == '+N+'-n && ',1)
 def matches(t):
  clean=re.sub(r'/\*.*?\*/|//[^\n]*',lambda m:' '*len(m[0]),t,flags=re.S)
  return list(re.finditer(r'\w+|[^\w\s]',clean))
 rm=matches(raw);tm=matches(text);assert [x[0]for x in rm]==[x[0]for x in tm]
 types={};cuts=[];stage=0;meta_stages=[]
 for m in re.finditer(r'^\s*(?:(v\w+_t)\s+)?(\w+)\s*=\s*(__riscv_\w+\([^;]+\));',raw,re.M):
  ty,var,e=m.groups()
  if e.startswith('__riscv_vsetvl_'):continue
  if ty:types[var]=ty
  ct='float'if types[var]=='vfloat32m8_t'else'unsigned int'if types[var]=='vuint32m8_t'else'unsigned short'if types[var]=='vuint16m4_t'else'int'
  if ct!='float':stage+=1;continue
  rt='fp32'if ct=='float'else'Z'
  old=['f16_old_s'+str(stage)+'_'+str(i)for i in range(32)];new=['f16_s'+str(stage)+'_'+str(i)for i in range(32)]
  def assertion(vs):
   rel=[]
   for i,v in enumerate(vs):
    value='f16_stage_'+str(stage)+'('+str(i)+','+lv+','+chunk+')'
    rel.append('f16_same_bits('+v+','+value+')'if rt=='fp32'else v+' == '+value)
   cells=' * '.join('store(&('+var+'.s'+str(i)+'),'+ct+','+v+')'for i,v in enumerate(vs))
   return 'exists ('+' '.join(vs)+':'+rt+'), '+' && '.join(rel)+' && '+cells
  ann='/*@ '+assertion(old)+' which implies '+assertion(new)+' */'
  idx=next(i for i,t in enumerate(rm)if t.end()==m.end());assert rm[idx][0]==';'
  cuts.append((tm[idx].end(),'\n'+ann));meta_stages.append({'stage':stage,'variable':var,'field_count':32,'relation':'Coq equality','same_object_permissions_retained':32,'original_expression':e});stage+=1
 assert stage==21
 for pos,ann in reversed(cuts):text=text[:pos]+ann+text[pos:]
 assert tokens(raw)==tokens(text)
 meta['staged_identity_cuts']=meta_stages;meta['loop_ghost']='f16_progress == batch@pre/4 - n';meta['which_RHS_reads_C_scalars']=False
 return raw,text,meta
def kernel_header(isa):
 assert isa=='rvv'
 return legacy.kernel_header(isa)+'#include "'+str(H/'c/rvv_stages_model.h')+'"\n'
def main():
 ap=argparse.ArgumentParser();ap.add_argument('--isa',choices=['neon','rvv'],required=True);ap.add_argument('--timeout',type=int,default=7200);ap.add_argument('--private-status',action='store_true');a=ap.parse_args();assert 0<a.timeout<=14400
 run=Path(tempfile.mkdtemp(prefix='rvv-float-staged-kernel-',dir=C/'.build'));raw,text,annotations=kernel_text(a.isa);(H/'c'/('rvv_float_staged.annotations.json')).write_text(json.dumps(annotations,indent=2)+'\n');stem=a.isa+'_unit';records=[];s={'generator_source':'proof/generate_rvv_float_staged.py','proof_compression':'value_preserving_names_after_five_original_float_vector_assignments','generation_passed':False,'whole_kernel_verified':False,'run_directory':str(run),'records':records,'implementation_variant':'compatible-exact-decimal-literals','original_tokens_unchanged':False,'strategy_application_limit':8192 if a.isa=='rvv'else 1024,'timeout_seconds':a.timeout}
 head=kernel_header(a.isa)
 def execute(cmd,label,timeout):
  cmd=list(map(str,cmd));log=run/(label+'.log');t=time.monotonic()
  try:
   with log.open('w')as out:r=subprocess.run(['prlimit','--as=17179869184:17179869184','--']+cmd,cwd=run,stdout=out,stderr=out,timeout=timeout)
   ec=r.returncode
  except subprocess.TimeoutExpired:ec=124
  records.append({'label':label,'command':cmd,'exit_code':ec,'seconds':time.monotonic()-t,'log_sha256':sha(log)});print(label,ec,flush=True);return ec
 try:
  for n,body in [('raw',raw),(stem,text)]:
   (run/(n+'.raw.c')).write_text(head+body);assert execute(['gcc','-E','-P','-CC','-nostdinc',run/(n+'.raw.c'),'-o',run/(n+'.c')],n+'-cpp',60)==0
  assert tokens((run/'raw.c').read_text())==tokens((run/(stem+'.c')).read_text())
  cmd=['qcp','--arch=64','--endian=little','--no-float-finite-vc','--no-exec-info','--strategy-application-limit='+str(8192 if a.isa=='rvv'else 1024),'--input-file='+str(run/(stem+'.c')),'--coq-output-dir='+str(run),'--coq-logic-path=F32F16','-slp',C/'shim','F32F16','-slp',H/'c','F32F16']
  for d in sorted((B/'proof/c').iterdir()):
   if d.is_dir():cmd+=['-slp',d,d.name]
  assert execute(cmd,'qcp',a.timeout)==0,'actual QCP failed'
  goal=run/(stem+'_goal.v');fields=re.findall(r'^Axiom proof_of_(\w+)\s*:',goal.read_text(),re.M);assert fields;s.update(generation_passed=True,generated_c_vcs=len(fields),fields=fields,goal_sha256=sha(goal),cpp_sha256=sha(run/(stem+'.c')),compatible_impl_raw_tokens_preserved=True,same_frontend_cpp_tokens_preserved=True)
 except Exception as e:s['error']=str(e)
 (run/'status.json').write_text(json.dumps(s,indent=2)+'\n');(H/(a.isa+'-generation-status.json')).write_text(json.dumps(s,indent=2)+'\n')if not a.private_status else None;print(run,flush=True);raise SystemExit(0 if s['generation_passed']else 1)
if __name__=='__main__':main()
