#!/usr/bin/env python3
"""Fresh actual NEON vector helper C units, ordinary Coq and typed interfaces."""
import argparse,json,re,hashlib,shutil,subprocess,tempfile,time,threading
from pathlib import Path
from concurrent.futures import ThreadPoolExecutor
HERE=Path(__file__).resolve().parent;CASE=HERE.parent
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
def main():
 p=argparse.ArgumentParser(description=__doc__);p.add_argument('--config',type=Path,required=True);p.add_argument('--units',type=Path,default=HERE/'neon-arithmetic-units.json');p.add_argument('--status-name',default='neon-arithmetic-status.json');p.add_argument('--jobs',type=int,default=16);p.add_argument('--module-timeout',type=int,default=1200);a=p.parse_args();assert a.jobs>0
 scalar=json.loads((HERE/'scalar-status.json').read_text());assert scalar['passed']and scalar['vc_correct_passed']
 run=Path(tempfile.mkdtemp(prefix='neon-arithmetic-',dir=CASE/'.build'));coq=run/'coq';coq.mkdir();records=[];lock=threading.Lock();flags=json.loads(a.config.read_text())['flags'][2:]+['-Q',str(coq),'Qu8Cvt'];units=json.loads(a.units.read_text());status={'passed':False,'whole_kernel_verified':False,'scope':'Actual selected NEON arithmetic/movement C helper bodies only; kernel/memory/wrapper remain required','run_directory':str(run),'records':records}
 def exe(cmd,label,budget=300):
  work=run/'jobs'/label;work.mkdir(parents=True);cmd=['prlimit','--as=17179869184:17179869184','--',*map(str,cmd)];t=time.monotonic()
  with(run/(label+'.log')).open('w')as f:
   try:code=subprocess.run(cmd,cwd=work,stdout=f,stderr=f,timeout=budget).returncode
   except subprocess.TimeoutExpired:code=124
  with lock:
   records.append({'label':label,'command':cmd,'exit_code':code,'seconds':time.monotonic()-t,'log_sha256':sha(run/(label+'.log'))});(run/'records.json').write_text(json.dumps(records,indent=2)+'\n');print(label,code,flush=True)
  if code:raise RuntimeError((run/(label+'.log')).read_text()[-5000:])
 def cc(n):exe(['qcp-env','coqc','-time',*flags,coq/(n+'.v')],n,a.module_timeout)
 def unit(row):
  stem=row['stem'];exe(['gcc','-E','-P','-CC','-nostdinc',CASE/row['source'],'-o',run/(stem+'.c')],stem+'-cpp');out=run/'generated'/stem;out.mkdir(parents=True)
  exe(['qcp','--arch=64','--endian=little','--no-float-finite-vc','--no-exec-info','--strategy-application-limit=1024','--input-file='+str(run/(stem+'.c')),'--coq-output-dir='+str(out),'--coq-logic-path=Qu8Cvt'],stem+'-qcp')
  shutil.copyfile(out/(stem+'_goal.v'),coq/(stem+'_goal.v'));cc(stem+'_goal');g=(coq/(stem+'_goal.v')).read_text();names=re.findall(r'^Axiom proof_of_(\w+) :',g,re.M);assert names and len(names)==len(set(names));module=stem+'_checked'
  text=f'''From Coq Require Import ZArith Lia.
From Qu8Cvt Require Import Types FastFrame {stem}_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module Checked : Qu8Cvt.{stem}_goal.VC_Correct.
'''
  for n in names:
   aux=', Qu8Cvt.'+stem+'_goal.'+n+'_aux'if re.search(r'^Definition '+n+r'_aux\b',g,re.M)else''
   text+=f'''Lemma proof_of_{n} : Qu8Cvt.{stem}_goal.{n}.
Proof. unfold Qu8Cvt.{stem}_goal.{n}{aux};try left;intros;
 unfold cvt_same in *;subst;
 unfold UndefStructPreduint16x8_t,UndefStructPreduint8x8_t,UndefStructPredint16x8_t,UndefStructPredint16x4_t,UndefStructPredint32x4_t,UndefStructPredfloat32x4_t,UndefStructPredfloat32x2_t;
 rewrite ?local_field_address;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
  try pose proof(cvt_u16_range a0);try pose proof(cvt_add_u16_range (cvt_u16 a0) b0);
 try pose proof(cvt_u16_range a1);try pose proof(cvt_add_u16_range (cvt_u16 a1) b1);
 try pose proof(cvt_u16_range a2);try pose proof(cvt_add_u16_range (cvt_u16 a2) b2);
 try pose proof(cvt_u16_range a3);try pose proof(cvt_add_u16_range (cvt_u16 a3) b3);
 try pose proof(cvt_u16_range a4);try pose proof(cvt_add_u16_range (cvt_u16 a4) b4);
 try pose proof(cvt_u16_range a5);try pose proof(cvt_add_u16_range (cvt_u16 a5) b5);
 try pose proof(cvt_u16_range a6);try pose proof(cvt_add_u16_range (cvt_u16 a6) b6);
 try pose proof(cvt_u16_range a7);try pose proof(cvt_add_u16_range (cvt_u16 a7) b7);
 rewrite ?cvt_unsigned_addw;
 entailer!;try congruence;try lia;try(opaque_leaves;sepcon_assoc_change;fast_cancel).
Qed.
'''
  text+='End Checked.\n';(coq/(module+'.v')).write_text(text);(HERE/'coq'/(module+'.v')).write_text(text);cc(module);gate=stem+'_final';(coq/(gate+'.v')).write_text(f'From Qu8Cvt Require Import {stem}_goal {module}.\nModule Final : Qu8Cvt.{stem}_goal.VC_Correct := Qu8Cvt.{module}.Checked.\n'+''.join('Print Assumptions Final.proof_of_'+n+'.\n'for n in names));cc(gate)
  return {'stem':stem,'actual_c_vcs':len(names),'typed_instance':'Qu8Cvt.'+module+'.Checked','goal_sha256':sha(coq/(stem+'_goal.v')),'source_sha256':sha(CASE/row['source'])}
 try:
  for n in ['Model','UnsignedModel','Types','FastFrame']:shutil.copyfile(HERE/'coq'/(n+'.v'),coq/(n+'.v'));cc(n)
  with ThreadPoolExecutor(max_workers=min(a.jobs,len(units)))as pool:
   results=list(pool.map(unit,units))
  status.update(passed=True,vc_correct_passed=True,units=results,actual_c_vcs=sum(x['actual_c_vcs']for x in results))
 except Exception as e:status['error']=str(e);print(e,flush=True)
 finally:
  status['proof_source_sha256']={p.name:sha(p)for p in coq.glob('*.v')};status['sources_sha256']={str(p.relative_to(CASE)):sha(p)for p in [CASE/'shim/neon_arithmetic.h',CASE/'shim/scalar_primitives.h',CASE/'shim/formal_types.h']}
  for p in [run/'status.json',HERE/a.status_name]:p.write_text(json.dumps(status,indent=2)+'\n')
 print('RUN',run,flush=True);return 0 if status['passed']else 1
if __name__=='__main__':raise SystemExit(main())
