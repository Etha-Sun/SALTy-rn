#!/usr/bin/env python3
"""Fresh RVV C helper goals, parallel independent proofs and exact typed gates."""
import argparse,json,re,hashlib,shutil,subprocess,tempfile,time,threading,math
from pathlib import Path
from concurrent.futures import ThreadPoolExecutor
HERE=Path(__file__).resolve().parent;CASE=HERE.parent
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
def main():
 p=argparse.ArgumentParser(description=__doc__);p.add_argument('--config',type=Path,required=True);p.add_argument('--units',type=Path,default=HERE/'rvv-arithmetic-units.json');p.add_argument('--status-name',default='rvv-arithmetic-status.json');p.add_argument('--jobs',type=int,default=16);p.add_argument('--module-timeout',type=int,default=2400);a=p.parse_args();assert a.jobs>0
 for n in ['scalar','rvv-active']:
  s=json.loads((HERE/(n+'-status.json')).read_text());assert s['passed']and s['vc_correct_passed']
 run=Path(tempfile.mkdtemp(prefix='rvv-arithmetic-',dir=CASE/'.build'));coq=run/'coq';coq.mkdir();records=[];lock=threading.Lock();flags=json.loads(a.config.read_text())['flags'][2:]+['-Q',str(coq),'Qu8Cvt'];units=json.loads(a.units.read_text());status={'passed':False,'whole_kernel_verified':False,'scope':'Actual five32-lane RVV arithmetic helper C bodies only; complete kernel/memory/wrapper remain necessary','run_directory':str(run),'records':records}
 def exe(cmd,label,budget=600):
  work=run/'jobs'/label;work.mkdir(parents=True);cmd=['prlimit','--as=17179869184:17179869184','--',*map(str,cmd)];t=time.monotonic()
  with(run/(label+'.log')).open('w')as f:
   try:code=subprocess.run(cmd,cwd=work,stdout=f,stderr=f,timeout=budget).returncode
   except subprocess.TimeoutExpired:code=124
  with lock:
   records.append({'label':label,'command':cmd,'exit_code':code,'seconds':time.monotonic()-t,'log_sha256':sha(run/(label+'.log'))});(run/'records.json').write_text(json.dumps(records,indent=2)+'\n');print(label,code,flush=True)
  if code:raise RuntimeError((run/(label+'.log')).read_text()[-5000:])
 def cc(n):exe(['qcp-env','coqc','-time',*flags,coq/(n+'.v')],n,a.module_timeout)
 def source(n,text):
  (coq/(n+'.v')).write_text(text);(HERE/'coq'/(n+'.v')).write_text(text)
 def prepare(row):
  stem=row['stem'];exe(['gcc','-E','-P','-CC','-nostdinc',CASE/row['source'],'-o',run/(stem+'.c')],stem+'-cpp');out=run/'generated'/stem;out.mkdir(parents=True)
  exe(['qcp','--arch=64','--endian=little','--no-float-finite-vc','--no-exec-info','--strategy-application-limit=1024','--input-file='+str(run/(stem+'.c')),'--coq-output-dir='+str(out),'--coq-logic-path=Qu8Cvt'],stem+'-qcp');shutil.copyfile(out/(stem+'_goal.v'),coq/(stem+'_goal.v'));cc(stem+'_goal');g=(coq/(stem+'_goal.v')).read_text();names=re.findall(r'^Axiom proof_of_(\w+) :',g,re.M);assert names and len(names)==len(set(names));count=max(1,math.ceil(len(names)/12));parts=[]
  for i in range(count):
   part=stem+'_part'+str(i+1);parts.append(part)
   text=f'''From Coq Require Import ZArith Lia.
From Qu8Cvt Require Import Types FastFrame RvvModel {stem}_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module CheckedPart{i+1}.
'''
   for n in names[i::count]:
    aux=', Qu8Cvt.'+stem+'_goal.'+n+'_aux'if re.search(r'^Definition '+n+r'_aux\b',g,re.M)else''
    text+=f'''Lemma proof_of_{n} : Qu8Cvt.{stem}_goal.{n}.
Proof. unfold Qu8Cvt.{stem}_goal.{n}{aux};try left;intros;
 unfold cvt_same in *;subst;
 unfold UndefStructPredvuint16m4_t,UndefStructPredvuint8m2_t,UndefStructPredvint16m4_t,UndefStructPredvint32m8_t,UndefStructPredvfloat32m8_t;
 rewrite ?local_field_address;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 repeat progress rewrite <-logic_equiv_andp_assoc;
 first[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia
 |apply _derivable1_andp_intros;
  [unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia
  |opaque_leaves;sepcon_assoc_change;fast_cancel]
 |opaque_leaves;sepcon_assoc_change;fast_cancel
 |entailer!;try congruence;try lia].
Qed.
'''
   text+=f'End CheckedPart{i+1}.\n';source(part,text)
  module=stem+'_checked';text='From Qu8Cvt Require Import '+stem+'_goal '+' '.join(parts)+'.\nModule Checked : Qu8Cvt.'+stem+'_goal.VC_Correct.\n'+''.join(f'Include Qu8Cvt.{part}.CheckedPart{i+1}.\n'for i,part in enumerate(parts))+'End Checked.\n';source(module,text)
  gate=stem+'_final';(coq/(gate+'.v')).write_text(f'From Qu8Cvt Require Import {stem}_goal {module}.\nModule Final : Qu8Cvt.{stem}_goal.VC_Correct := Qu8Cvt.{module}.Checked.\n'+''.join('Print Assumptions Final.proof_of_'+n+'.\n'for n in names))
  return dict(row,names=names,parts=parts,checked=module,final=gate,actual_c_vcs=len(names),goal_sha256=sha(coq/(stem+'_goal.v')))
 def finish(row):cc(row['checked']);cc(row['final']);return row
 try:
  for n in ['Model','UnsignedModel','Types','FastFrame','RvvModel']:shutil.copyfile(HERE/'coq'/(n+'.v'),coq/(n+'.v'));cc(n)
  with ThreadPoolExecutor(max_workers=min(a.jobs,len(units)))as pool:rows=list(pool.map(prepare,units))
  with ThreadPoolExecutor(max_workers=a.jobs)as pool:list(pool.map(cc,[part for row in rows for part in row['parts']]))
  with ThreadPoolExecutor(max_workers=min(a.jobs,len(units)))as pool:rows=list(pool.map(finish,rows))
  status.update(passed=True,vc_correct_passed=True,units=rows,actual_c_vcs=sum(x['actual_c_vcs']for x in rows),jobs=a.jobs)
 except Exception as e:status['error']=str(e);print(e,flush=True)
 finally:
  status['proof_source_sha256']={p.name:sha(p)for p in coq.glob('*.v')};status['sources_sha256']={str(p.relative_to(CASE)):sha(p)for p in [CASE/'shim/rvv_arithmetic.h',CASE/'shim/rvv_active.h',CASE/'shim/formal_types.h']}
  for p in [run/'status.json',HERE/a.status_name]:p.write_text(json.dumps(status,indent=2)+'\n')
 print('RUN',run,flush=True);return 0 if status['passed']else 1
if __name__=='__main__':raise SystemExit(main())
