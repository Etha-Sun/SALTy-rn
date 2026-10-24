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
 stmt='    vf = __riscv_vfadd_vv_f32m8(vf, __riscv_vreinterpret_v_u32m8_f32m8(vbias), vl);'
 N='(batch@pre/4)';k='f16_progress';logical_vl='vadd_vl('+N+'-'+k+')';end='('+k+'+'+logical_vl+')';chunk=f'rvv_slice({k},{end},A)'
 # Which RHS must use logical ghosts, not read mutable C scalar slots.
 assert text.count('/*@ Inv Assert ')==1
 text=text.replace('/*@ Inv Assert ','/*@ Inv Assert exists (f16_progress : Z), f16_progress == '+N+'-n && ',1)
 text=text.replace('  while (n > 0) {','  while (n > 0) {\n/*@ Given f16_progress */',1)
 vx_anchor='    vfloat32m8_t vx ='
 pos=text.index(vx_anchor);assert_start=text.rfind('/*@ Assert ',0,pos)
 assert assert_start>=0
 text=text[:assert_start]+text[assert_start:].replace('/*@ Assert ','/*@ Assert f16_progress == '+N+'-n && ',1)
 names=['f16_core_'+str(i)for i in range(32)]
 cells=lambda vs:' * '.join(f'store(&(vf.s{i}),float,{v})'for i,v in enumerate(vs))
 before=cells([f'vf.s{i}'for i in range(32)])
 rel=' && '.join(f'f16_same_bits({v},f16_rvv_named_core({i},{logical_vl},{chunk}))'for i,v in enumerate(names))
 post='exists ('+' '.join(names)+':fp32), '+rel+' && '+cells(names)
 ann='/*@ '+before+' which implies '+post+' */'
 assert raw.count(stmt)==1
 anchor='    vf = __riscv_vfadd_vv_f32m8('
 assert text.count(anchor)==1
 pos=text.index(anchor)
 while pos<len(text):
  if text.startswith('/*',pos):pos=text.index('*/',pos+2)+2;continue
  if text[pos]==';':pos+=1;break
  pos+=1
 else:raise ValueError('Missing original vfadd statement terminator')
 text=text[:pos]+'\n'+ann+text[pos:]
 assert tokens(raw)==tokens(text)
 meta['value_preserving_names']={'after_original_statement':stmt,'fields':32,'loop_ghost':'f16_progress == batch@pre/4 - n','which_RHS_reads_C_scalars':False,'equality':'f16_same_bits = Coq eq, never numeric fp32_eq','permission_cells_retained':32,'exact_existing_intermediate':'F32F16.RvvNamedCore.f16_rvv_named_core'}
 return raw,text,meta
def kernel_header(isa):
 assert isa=='rvv'
 return legacy.kernel_header(isa)+'#include "'+str(H/'c/rvv_named_model.h')+'"\n'
def main():
 ap=argparse.ArgumentParser();ap.add_argument('--isa',choices=['neon','rvv'],required=True);ap.add_argument('--timeout',type=int,default=7200);ap.add_argument('--private-status',action='store_true');a=ap.parse_args();assert 0<a.timeout<=14400
 run=Path(tempfile.mkdtemp(prefix='rvv-named-kernel-',dir=C/'.build'));raw,text,annotations=kernel_text(a.isa);(H/'c'/('rvv_named.annotations.json')).write_text(json.dumps(annotations,indent=2)+'\n');stem=a.isa+'_unit';records=[];s={'generator_source':'proof/generate_rvv_named.py','proof_compression':'value_preserving_fp32_names_after_float_core','generation_passed':False,'whole_kernel_verified':False,'run_directory':str(run),'records':records,'implementation_variant':'compatible-exact-decimal-literals','original_tokens_unchanged':False,'strategy_application_limit':8192 if a.isa=='rvv'else 1024,'timeout_seconds':a.timeout}
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
