#!/usr/bin/env python3
"""Close every fresh repaired RVV kernel VC and case strategy in ordinary Coq."""
import argparse,hashlib,json,re,shutil,subprocess,tempfile,time
from pathlib import Path
HERE=Path(__file__).resolve().parent;CASE=HERE.parent
ROOT=next(p for p in CASE.parents if(p/'.git').exists())
def sha(p):return hashlib.sha256(p.read_bytes()).hexdigest()
def main():
 p=argparse.ArgumentParser(description=__doc__)
 for n in ['config','dependency-dir','scalar-dir','vector-dir']:p.add_argument('--'+n,type=Path,required=True)
 p.add_argument('--generation-dir',type=Path);args=p.parse_args();generation=args.generation_dir or Path(json.loads((HERE/'rvv-generation-status.json').read_text())['run_directory']);gen=json.loads((generation/'status.json').read_text());assert gen['generation_passed']and gen['same_frontend_cpp_tokens_identical'];assert sha(CASE/'impl/testRVV.c')==gen['raw_c_sha256']
 run=Path(tempfile.mkdtemp(prefix='rvv-proof-',dir=CASE/'.build'));coq=run/'coq';coq.mkdir();records=[]
 flags=json.loads(args.config.read_text())['flags'][2:]
 for d in sorted(args.dependency_dir.resolve().iterdir()):
  if d.is_dir():flags+=['-Q',str(d),''if d.name=='relations'else d.name]
 for d in [args.scalar_dir,args.vector_dir,coq]:flags+=['-Q',str(d.resolve()),'FMin']
 status={'passed':False,'whole_kernel_verified':False,'scope':'Repaired RVV kernel and case strategy only; all C helper units and wrapper remain necessary for the complete case','run_directory':str(run),'records':records}
 def execute(cmd,label,budget=1200):
  work=run/'jobs'/label;work.mkdir(parents=True);log=run/(label+'.log');cmd=['prlimit','--as=17179869184:17179869184','--',*map(str,cmd)];start=time.monotonic()
  with log.open('w')as out:
   try:code=subprocess.run(cmd,cwd=work,stdout=out,stderr=out,timeout=budget).returncode
   except subprocess.TimeoutExpired:code=124
  records.append({'label':label,'command':cmd,'cwd':str(work),'exit_code':code,'seconds':time.monotonic()-start,'log_sha256':sha(log)});(run/'records.json').write_text(json.dumps(records,indent=2)+'\n');print(label,code,flush=True)
  if code:raise RuntimeError(log.read_text()[-6000:])
 def compile_module(n):
  if(HERE/'coq'/(n+'.v')).exists():shutil.copyfile(HERE/'coq'/(n+'.v'),coq/(n+'.v'))
  execute(['qcp-env','coqc','-time',*flags,coq/(n+'.v')],n)
 try:
  for n in ['ProgramModel','RvvListSupport','RvvResult']:compile_module(n)
  strategy=Path(shutil.which('qcp')).resolve().parent/'StrategyCheck'
  execute([strategy,'--arch=64','--endian=little','--no-exec-info','--input-file='+str(HERE/'c/rvv_fmin.strategies'),'--coq-output-dir='+str(coq),'--coq-logic-path=FMin'],'StrategyCheck',300)
  for n in ['rvv_fmin_strategy_goal','RvvStrategy','rvv_fmin_strategy_proof']:compile_module(n)
  shutil.copyfile(generation/'rvv_unit_goal.v',coq/'rvv_unit_goal.v');compile_module('rvv_unit_goal')
  goal=(coq/'rvv_unit_goal.v').read_text();names=re.findall(r'^Axiom proof_of_(\w+) :',goal,re.M);assert len(names)==len(set(names))==55
  simple=[n for n in names if '_entail_'not in n and '_return_'not in n]
  text='''From Coq Require Import ZArith Lia.
From FMin Require Import Bits Types ProgramModel VectorFastFrame rvv_unit_goal.
From QcpVadd Require Import VaddBits.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module CheckedRvvCalls.
'''
  for n in simple:
   aux=', FMin.rvv_unit_goal.'+n+'_aux'if re.search(r'^Definition '+n+r'_aux\b',goal,re.M)else''
   if '_safety_'in n or n.endswith('_pure'):
    tactic='try left;intros;cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size]in *;unfold same_bits,fp32_bits_equal in *;subst;unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia'
   else:
    tactic='''try left;intros;unfold same_bits,fp32_bits_equal in *;subst;
 unfold UndefStructPredvfloat32m8_t,UndefStructPredvbool4_t;
 rewrite ?local_field_address;repeat progress rewrite <- logic_equiv_andp_assoc;
 first[apply _derivable1_andp_intros;
 [unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia
 |opaque_leaves;sepcon_assoc_change;fast_cancel]
 |opaque_leaves;sepcon_assoc_change;fast_cancel]'''
   text+=f'Lemma proof_of_{n} : FMin.rvv_unit_goal.{n}.\nProof. unfold FMin.rvv_unit_goal.{n}{aux};{tactic}. Qed.\n'
  text+='End CheckedRvvCalls.\n';(HERE/'coq/RvvCalls.v').write_text(text)
  for n in ['RvvCalls','RvvMemory']:compile_module(n)
  checked='''From FMin Require Import rvv_unit_goal RvvCalls RvvMemory rvv_fmin_strategy_proof.
Module CheckedRvv : FMin.rvv_unit_goal.VC_Correct.
Include rvv_arrays_strategy_proof.CheckedRvvArray.
Include rvv_store_strategy_proof.CheckedRvvStoreStrategy.
Include rvv_loop_strategy_proof.CheckedRvvLoopStrategy.
Include CheckedRvvFminStrategy.
Include CheckedRvvCalls.
Include CheckedRvvLoopMemory.
End CheckedRvv.
'''
  (HERE/'coq/RvvChecked.v').write_text(checked);compile_module('RvvChecked')
  fields=re.findall(r'^\s*Axiom (rvv_fmin_strategy\d+_correctness) :',(coq/'rvv_fmin_strategy_goal.v').read_text(),re.M);assert len(fields)==4
  gate='''From FMin Require Import rvv_unit_goal RvvChecked rvv_fmin_strategy_goal RvvStrategy.
Module FinalRvv : FMin.rvv_unit_goal.VC_Correct := FMin.RvvChecked.CheckedRvv.
Module FinalStrategy : FMin.rvv_fmin_strategy_goal.rvv_fmin_Strategy_Correct := FMin.RvvStrategy.CheckedRvvFminStrategy.
'''
  gate+='\n'.join('Print Assumptions FinalRvv.proof_of_'+n+'.'for n in names)+'\n'+'\n'.join('Print Assumptions FinalStrategy.'+n+'.'for n in fields)+'\n';(coq/'FinalRvvCheck.v').write_text(gate);compile_module('FinalRvvCheck')
  status.update(passed=True,kernel_c_vcs=len(names),strategy_fields=len(fields),vc_correct_passed=True)
 except Exception as e:status['error']=str(e);print(e,flush=True)
 finally:
  status['proof_source_sha256']={q.name:sha(q)for q in coq.glob('*.v')};status['sources_sha256']={str(q.relative_to(CASE)):sha(q)for q in [CASE/'impl/testRVV.c',CASE/'spec.c',CASE/'shim/rvv_frontend.h',HERE/'c/rvv.annotations.json',HERE/'c/rvv_fmin.strategies']}
  for q in [run/'status.json',HERE/'rvv-proof-status.json']:q.write_text(json.dumps(status,indent=2)+'\n')
 print('RUN',run);return 0 if status['passed']else 1
if __name__=='__main__':raise SystemExit(main())
