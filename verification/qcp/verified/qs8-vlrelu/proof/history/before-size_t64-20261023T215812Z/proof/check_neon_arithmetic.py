#!/usr/bin/env python3
"""Fresh actual NEON vector helper C units, ordinary Coq and typed interfaces."""
import argparse,json,re,hashlib,shutil,subprocess,tempfile,time,threading
from pathlib import Path
from concurrent.futures import ThreadPoolExecutor
HERE=Path(__file__).resolve().parent;CASE=HERE.parent
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
def main():
 p=argparse.ArgumentParser(description=__doc__);p.add_argument('--config',type=Path,required=True);p.add_argument('--units',type=Path,default=HERE/'neon-arithmetic-units.json');p.add_argument('--status-name',default='neon-arithmetic-status.json');p.add_argument('--jobs',type=int,default=16);p.add_argument('--module-timeout',type=int,default=1200);a=p.parse_args();assert __debug__ and 1<=a.jobs<=16
 scalar=json.loads((HERE/'scalar-status.json').read_text());assert scalar['passed']and scalar['vc_correct_passed']
 run=Path(tempfile.mkdtemp(prefix='neon-arithmetic-',dir=CASE/'.build'));coq=run/'coq';coq.mkdir();records=[];lock=threading.Lock();flags=json.loads(a.config.read_text())['flags'][2:]+['-Q',str(coq),'Qs8Lrelu'];units=json.loads(a.units.read_text());status={'passed':False,'whole_kernel_verified':False,'scope':'Actual selected NEON arithmetic/movement C helper bodies only; kernel/memory/wrapper remain required','run_directory':str(run),'records':records}
 input_names=['proof/check_neon_arithmetic.py',str(a.units.relative_to(CASE)),'proof/scalar-status.json','shim/scalar.h','shim/types.h','shim/types_def.h','shim/neon_arithmetic.h']+['proof/coq/'+n+'.v'for n in ['Model','Types','NeonFrame']]+[u['source']for u in units]+['proof/coq/'+u['stem']+'_checked.v'for u in units]
 input_hashes={n:sha(CASE/n)for n in input_names}
 for n,d in scalar['input_sha256'].items():assert sha(CASE/n)==d,'Stale scalar provider: '+n
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
  exe(['qcp','--arch=64','--endian=little','--no-float-finite-vc','--no-exec-info','--strategy-application-limit=1024','--input-file='+str(run/(stem+'.c')),'--coq-output-dir='+str(out),'--coq-logic-path=Qs8Lrelu'],stem+'-qcp')
  shutil.copyfile(out/(stem+'_goal.v'),coq/(stem+'_goal.v'));cc(stem+'_goal');g=(coq/(stem+'_goal.v')).read_text();names=re.findall(r'^Axiom proof_of_(\w+) :',g,re.M);assert names and len(names)==len(set(names));module=stem+'_checked'
  text=f'''From Coq Require Import ZArith Lia.
From Qs8Lrelu Require Import Types NeonFrame {stem}_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module Checked : Qs8Lrelu.{stem}_goal.VC_Correct.
'''
  for n in names:
   aux=', Qs8Lrelu.'+stem+'_goal.'+n+'_aux'if re.search(r'^Definition '+n+r'_aux\b',g,re.M)else''
   text+=f'''Lemma proof_of_{n} : Qs8Lrelu.{stem}_goal.{n}.
Proof. unfold Qs8Lrelu.{stem}_goal.{n}{aux};try left;intros;
 subst;
 unfold UndefStructPredint8x8_t,UndefStructPredint16x8_t,UndefStructPredint8x16_t,UndefStructPredvint8m2_t,UndefStructPredvint16m4_t,UndefStructPredvint32m8_t,UndefStructPreduint8x8_t;
 rewrite ?local_field_address;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 entailer!;try congruence;try lia;try(opaque_leaves;sepcon_assoc_change;fast_cancel).
Qed.
'''
  text+='End Checked.\n';(coq/(module+'.v')).write_text(text);(HERE/'coq'/(module+'.v')).write_text(text);cc(module);gate=stem+'_final';(coq/(gate+'.v')).write_text(f'From Qs8Lrelu Require Import {stem}_goal {module}.\nModule Final : Qs8Lrelu.{stem}_goal.VC_Correct := Qs8Lrelu.{module}.Checked.\n'+''.join('Print Assumptions Final.proof_of_'+n+'.\n'for n in names));cc(gate)
  return {'stem':stem,'actual_c_vcs':len(names),'typed_instance':'Qs8Lrelu.'+module+'.Checked','goal_sha256':sha(coq/(stem+'_goal.v')),'source_sha256':sha(CASE/row['source']),'cpp_sha256':sha(run/(stem+'.c')),'fields':names,'checked_module':'Qs8Lrelu.'+module+'.Checked'}
 try:
  for n in ['Model','Types','NeonFrame']:shutil.copyfile(HERE/'coq'/(n+'.v'),coq/(n+'.v'));cc(n)
  with ThreadPoolExecutor(max_workers=min(a.jobs,len(units)))as pool:
   results=list(pool.map(unit,units))
  combined=run/'NeonArithmeticGate.v';gate=[]
  for i,u in enumerate(results):
   stem=u['stem'];gate+=['From Qs8Lrelu Require Import '+stem+'_goal '+stem+'_checked.',f'Module ActualNeon{i} : Qs8Lrelu.{stem}_goal.VC_Correct := '+u['checked_module']+'.'];gate+=['Print Assumptions ActualNeon'+str(i)+'.proof_of_'+n+'.'for n in u['fields']]
  combined.write_text('\n'.join(gate)+'\n');exe(['qcp-env','coqc','-time',*flags,combined],'NeonArithmeticGate',a.module_timeout)
  assert input_hashes=={n:sha(CASE/n)for n in input_names},'Input changed during complete vector gate'
  status.update(passed=True,vc_correct_passed=True,units=results,actual_c_vcs=sum(x['actual_c_vcs']for x in results),checked_c_vcs=sum(x['actual_c_vcs']for x in results),input_sha256=input_hashes,no_component_vo_reused=True,fresh_compiled_modules=len([r for r in records if 'coqc'in r['command']]),final_gate_sha256=sha(combined),final_assumptions_log_sha256=sha(run/'NeonArithmeticGate.log'))
 except Exception as e:status['error']=str(e);print(e,flush=True)
 finally:
  status['proof_source_sha256']={p.name:sha(p)for p in coq.glob('*.v')};status['sources_sha256']={str(p.relative_to(CASE)):sha(p)for p in [CASE/'shim/neon_arithmetic.h',CASE/'shim/scalar.h',CASE/'shim/types.h',CASE/'shim/types_def.h']}
  dest=HERE/a.status_name
  if dest.exists(): history=HERE/'history';history.mkdir(exist_ok=True);(history/(a.status_name+'.'+sha(dest)+'.json')).write_bytes(dest.read_bytes())
  for p in [run/'status.json',dest]:p.write_text(json.dumps(status,indent=2)+'\n')
 print('RUN',run,flush=True);return 0 if status['passed']else 1
if __name__=='__main__':raise SystemExit(main())
