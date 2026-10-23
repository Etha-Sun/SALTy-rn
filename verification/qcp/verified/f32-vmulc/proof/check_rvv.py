#!/usr/bin/env python3
"""Check new RVV VCs using explicitly reused, already checked VMUL dependencies."""
from pathlib import Path
import json,shutil,subprocess,re,time,hashlib,sys
HERE=Path(__file__).resolve().parent;CASE=HERE.parent
REPO=next(p for p in CASE.parents if (p/'.git').exists())
BASE=REPO/'verification/qcp/verified/f32-vmul'
OLD=Path(sys.argv[sys.argv.index('--dependency-dir')+1]).resolve() if '--dependency-dir' in sys.argv else Path(json.loads((BASE/'proof/status.json').read_text())['run_directory'])/'coq'
RUN=Path(json.loads((HERE/'rvv-generation-status.json').read_text())['run_directory'])
COQ=RUN/'coq';COQ.mkdir(exist_ok=True)
CFG=json.loads((REPO.parents[1]/'research/qcp-shim-vadd/results/coq-flags.json').read_text())
flags=['qcp-env','coqc',*CFG['flags'][2:]]
for p in OLD.iterdir():flags+=['-Q',str(p),'' if p.name=='relations' else p.name]
flags+=['-Q',str(COQ),'VMulc']
records=[]
def execute(command,label,timeout=120):
 start=time.monotonic()
 with (RUN/(label+'.log')).open('w') as out:r=subprocess.run(list(map(str,command)),cwd=CFG['cwd'],stdout=out,stderr=out,timeout=timeout)
 records.append({'label':label,'exit_code':r.returncode,'seconds':time.monotonic()-start,'command':list(map(str,command))})
 print(label,r.returncode,flush=True)
 if r.returncode:raise RuntimeError((RUN/(label+'.log')).read_text()[-5000:])
def compile(name):
 if (HERE/'coq'/name).exists():shutil.copyfile(HERE/'coq'/name,COQ/name)
 execute(flags+[str(COQ/name)],name)
status={'passed':False,'scope':'RVV_kernel_body_VCs_with_reused_verified_VMUL_dependencies','whole_kernel_verified':False,'public_spec_is_draft':True,'run_directory':str(RUN),'reused_dependency_directory':str(OLD),'records':records}
try:
 strategy=Path(shutil.which('qcp')).resolve().parent/'StrategyCheck'
 execute([strategy,'--arch=64','--endian=little','--no-exec-info','--input-file='+str(HERE/'c/vmulc.strategies'),'--coq-output-dir='+str(RUN),'--coq-logic-path=VMulc'],'strategy')
 for name in ['rvv_unit_goal.v','vmulc_strategy_goal.v']:shutil.copyfile(RUN/name,COQ/name)
 for name in ['Model.v','FastFrame.v','RvvResult.v','vmulc_strategy_goal.v','vmulc_strategy_proof.v','rvv_unit_goal.v']:compile(name)
 goal=(COQ/'rvv_unit_goal.v').read_text();names=re.findall(r'^Axiom proof_of_(\w+) :',goal,re.M)
 simple=[n for n in names if '_entail_' not in n and n!='test_rvv_return_wit_1']
 s='''From Coq Require Import ZArith Lia.
From VMulc Require Import Model FastFrame rvv_unit_goal.
From QcpRvv32 Require Import RvvLoopModel rvv_loop_pure_checked.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module KernelCalls.
'''
 for n in simple:
  aux=', '+n+'_aux' if n+'_aux' in goal and not n.endswith('_pure') else ''
  if n.startswith('__riscv_vsetvl') or n=='qcp_assert_return_wit_1':
   tactic='exact CheckedRvvLoopPure.proof_of_'+n
  elif '_safety_' in n or n.endswith('_pure'):
   tactic='intros; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold fp32_bits_equal in *; unfold derivable1, andp, coq_prop; intros; repeat first [assumption | split | reflexivity]; lia'
  else:
   tactic='try left; intros; unfold fp32_bits_equal in *; subst; unfold VMulc.Model.UndefStructPredvfloat32m8_t; rewrite ?local_field_address; repeat progress rewrite <- logic_equiv_andp_assoc; first [apply _derivable1_andp_intros; [unfold derivable1, andp, coq_prop; intros; repeat first [assumption | split | reflexivity]; lia|opaque_leaves; sepcon_assoc_change; fast_cancel] | opaque_leaves; sepcon_assoc_change; fast_cancel]'
  s+=f'Lemma proof_of_{n} : {n}.\nProof. unfold {n}{aux}; {tactic}. Qed.\n'
 s+='End KernelCalls.\n';(COQ/'RvvCalls.v').write_text(s)
 compile('RvvCalls.v');compile('RvvMemory.v')
 final='''From QcpRvv32 Require Import rvv_arrays_strategy_proof rvv_store_strategy_proof rvv_loop_strategy_proof.
From VMulc Require Import vmulc_strategy_proof rvv_unit_goal RvvCalls RvvMemory.
Module KernelChecked : VC_Correct.
Include CheckedRvvArray.
Include CheckedRvvStoreStrategy.
Include CheckedRvvLoopStrategy.
Include CheckedVmulcStrategy.
Include KernelCalls.
Include CheckedRvvLoopMemory.
End KernelChecked.
Print Assumptions KernelChecked.proof_of_test_rvv_entail_wit_4.
'''
 (COQ/'RvvChecked.v').write_text(final);compile('RvvChecked.v')
 for name in ['rvv_unit_goal.v','vmulc_strategy_goal.v','RvvCalls.v','RvvChecked.v']:shutil.copyfile(COQ/name,HERE/'coq'/name)
 spec=(CASE/'spec.c').read_text();start=spec.index(' test_rvv(');a=spec.index('/*@',start);b=spec.index('*/',a)+2
 assert spec[a:b] in (RUN/'rvv_unit.c').read_text(), 'Live kernel contract changed since generation'
 sources=[CASE/'impl/testRVV.c',CASE/'shim/rvv_frontend.h',CASE/'shim/types.h',CASE/'shim/model_def.h',HERE/'c/vmulc.strategies',Path(__file__)]+[HERE/'coq'/n for n in ['Model.v','FastFrame.v','RvvResult.v','RvvMemory.v','RvvCalls.v','RvvChecked.v','rvv_unit_goal.v','vmulc_strategy_goal.v','vmulc_strategy_proof.v']]
 status['sources_sha256']={str(p.relative_to(CASE)):hashlib.sha256(p.read_bytes()).hexdigest() for p in sources}
 status['live_public_contract_sha256']=hashlib.sha256(spec[a:b].encode()).hexdigest()
 status.update(passed=True,checked_c_vcs=len(names),local_modules=9,remaining=['NEON original loop/tail','equivalent wrapper','fresh complete dependency and C-call closure replay'])
except RuntimeError as e:status['error']=str(e);print(e)
(HERE/'rvv-proof-status.json').write_text(json.dumps(status,indent=2)+'\n')
print('RVV body result:',status['passed'])
raise SystemExit(not status['passed'])
