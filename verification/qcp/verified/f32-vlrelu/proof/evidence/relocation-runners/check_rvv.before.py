#!/usr/bin/env python3
"""Generate/check the RVV primitive and kernel bodies with fresh local Coq modules."""
from pathlib import Path
import argparse,json,re,subprocess,shutil,sys,time,resource,hashlib,tempfile
HERE=Path(__file__).resolve().parent;CASE=HERE.parent
ROOT=next(p for p in CASE.parents if (p/'.git').exists())
parser=argparse.ArgumentParser(description=__doc__)
parser.add_argument('--config',type=Path,default=ROOT/'.build/simple-kernels-bootstrap/coq-flags.json')
parser.add_argument('--dependency-dir',type=Path,default=ROOT/'verification/qcp/verified/f32-vadd/.build/full-1f5wequq/coq')
parser.add_argument('--run-dir',type=Path)
parser.add_argument('--generation-dir',type=Path)
mode=parser.add_mutually_exclusive_group()
mode.add_argument('--kernel',action='store_true')
mode.add_argument('--generate',action='store_true')
args=parser.parse_args()
CFG=json.loads(args.config.read_text())
DEPS=args.dependency_dir.resolve()
RUN=args.run_dir.resolve() if args.run_dir else (Path(tempfile.mkdtemp(prefix='rvv-kernel-proof-',dir=CASE/'.build')) if args.kernel else CASE/'.build/rvv-primitives')
COQ=RUN/'coq';COQ.mkdir(parents=True,exist_ok=True)
flags=['qcp-env','coqc','-time',*CFG['flags'][2:]]
for p in DEPS.iterdir():flags+=['-Q',str(p),'' if p.name=='relations' else p.name]
flags+=['-Q',str(COQ),'VLRelu']
records=[]
def source_hashes():
 paths=[CASE/'shim/rvv_primitives.c',CASE/'shim/rvv_types.h',CASE/'shim/types.h',HERE/'coq/Model.v',HERE/'coq/RvvModel.v']
 return {str(p.relative_to(CASE)):hashlib.sha256(p.read_bytes()).hexdigest() for p in paths}
def limit():resource.setrlimit(resource.RLIMIT_AS,(16*1024**3,16*1024**3))
def execute(command,label,timeout=1200):
 start=time.monotonic()
 with (RUN/(label+'.log')).open('w') as out:
  try:code=subprocess.run(list(map(str,command)),cwd=RUN,stdout=out,stderr=out,timeout=timeout,preexec_fn=limit).returncode
  except subprocess.TimeoutExpired:code=124
 records.append({'label':label,'exit_code':code,'seconds':time.monotonic()-start,'command':list(map(str,command)),'cwd':str(RUN),'log_sha256':hashlib.sha256((RUN/(label+'.log')).read_bytes()).hexdigest()})
 (RUN/'records.json').write_text(json.dumps(records,indent=2)+'\n')
 print(label,code,flush=True)
 if code:raise RuntimeError((RUN/(label+'.log')).read_text()[-5000:])
def compile(name):
 src=HERE/'coq'/name
 if src.exists():
  if name.endswith('_goal.v') and (COQ/name).exists():
   assert src.read_bytes()==(COQ/name).read_bytes(),'Generated goal disagrees with reviewed proof snapshot: '+name
  else:shutil.copyfile(src,COQ/name)
 execute(flags+[COQ/name],name)

def check_kernel():
 generation_file=args.generation_dir/'generation-status.json' if args.generation_dir else HERE/'rvv-generation-status.json'
 generation=json.loads(generation_file.read_text());source_run=Path(generation['run_directory'])
 assert generation['generation_passed']
 for name in ['Model.v','RvvModel.v','RvvFastFrame.v']:compile(name)
 strategy=Path(shutil.which('qcp')).resolve().parent/'StrategyCheck'
 execute([strategy,'--arch=64','--endian=little','--no-exec-info','--input-file='+str(HERE/'c/rvv_vlrelu.strategies'),'--coq-output-dir='+str(COQ),'--coq-logic-path=VLRelu'],'kernel_strategy')
 shutil.copyfile(source_run/'rvv_unit_goal.v',COQ/'rvv_unit_goal.v')
 for name in ['RvvResult.v','rvv_vlrelu_strategy_goal.v','RvvStrategy.v','rvv_vlrelu_strategy_proof.v','rvv_unit_goal.v']:compile(name)
 strategy_fields=re.findall(r'^\s*Axiom (rvv_vlrelu_strategy\d+_correctness) :',(COQ/'rvv_vlrelu_strategy_goal.v').read_text(),re.M)
 assert strategy_fields and len(strategy_fields)==len(set(strategy_fields))
 goal=(COQ/'rvv_unit_goal.v').read_text();names=re.findall(r'^Axiom proof_of_(\w+) :',goal,re.M)
 simple=[n for n in names if '_entail_' not in n and n!='test_rvv_return_wit_1']
 s='''From Coq Require Import ZArith Lia.
From VLRelu Require Import Model RvvModel RvvFastFrame rvv_unit_goal.
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
   tactic='try left; intros; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold fp32_bits_equal in *; subst; unfold derivable1, andp, coq_prop; intros; repeat first [assumption | split | reflexivity]; lia'
  else:
   tactic='try left; intros; unfold fp32_bits_equal in *; subst; unfold UndefStructPredvfloat32m8_t, UndefStructPredvint32m8_t, UndefStructPredvbool4_t; rewrite ?local_field_address; repeat progress rewrite <- logic_equiv_andp_assoc; first [apply _derivable1_andp_intros; [unfold derivable1, andp, coq_prop; intros; repeat first [assumption | split | reflexivity]; lia|opaque_leaves; sepcon_assoc_change; fast_cancel] | opaque_leaves; sepcon_assoc_change; fast_cancel]'
  s+=f'Lemma proof_of_{n} : {n}.\nProof. unfold {n}{aux}; {tactic}. Qed.\n'
 s+='End KernelCalls.\n';(HERE/'coq/RvvCalls.v').write_text(s)
 compile('RvvCalls.v');compile('RvvMemory.v')
 s='''From QcpRvv32 Require Import rvv_arrays_strategy_proof rvv_store_strategy_proof rvv_loop_strategy_proof.
From VLRelu Require Import RvvStrategy rvv_unit_goal RvvCalls RvvMemory.
Module KernelChecked : rvv_unit_goal.VC_Correct.
Include CheckedRvvArray.
Include CheckedRvvStoreStrategy.
Include CheckedRvvLoopStrategy.
Include CheckedRvvVlreluStrategy.
Include KernelCalls.
Include CheckedRvvLoopMemory.
End KernelChecked.
'''
 (HERE/'coq/RvvChecked.v').write_text(s);compile('RvvChecked.v')
 gate='From VLRelu Require Import rvv_unit_goal RvvChecked.\nModule FinalRvvKernel : rvv_unit_goal.VC_Correct := RvvChecked.KernelChecked.\n'
 gate+='\n'.join('Print Assumptions FinalRvvKernel.proof_of_'+name+'.' for name in names)+'\n'
 gate+='\n'.join('Print Assumptions FinalRvvKernel.'+name+'.' for name in strategy_fields)+'\n'
 (HERE/'coq/RvvGate.v').write_text(gate);compile('RvvGate.v')
 public=(CASE/'spec.c').read_text();start=public.index(' test_rvv(');a=public.index('/*@',start);b=public.index('*/',a)+2
 assert public[a:b] in (source_run/'rvv_unit.c').read_text(),'Live public contract changed since generation'
 for name in ['rvv_unit_goal.v','rvv_vlrelu_strategy_goal.v']:shutil.copyfile(COQ/name,HERE/'coq'/name)
 paths=[CASE/'impl/testRVV.c',CASE/'spec.c',CASE/'shim/rvv_frontend.h',CASE/'shim/types.h',CASE/'shim/rvv_types.h',CASE/'shim/rvv_model_def.h',HERE/'c/rvv.annotations.json',HERE/'c/rvv_vlrelu.strategies',HERE/'generate_rvv.py',Path(__file__)]+[HERE/'coq'/n for n in ['Model.v','RvvModel.v','RvvFastFrame.v','RvvResult.v','RvvStrategy.v','rvv_vlrelu_strategy_proof.v','RvvCalls.v','RvvMemory.v','RvvChecked.v','RvvGate.v','rvv_unit_goal.v','rvv_vlrelu_strategy_goal.v']]
 status={'passed':True,'scope':'original_RVV_kernel_body_VC_Correct','whole_kernel_verified':False,'checked_c_vcs':len(names),'checked_c_functions':['qcp_assert','__riscv_vsetvl_e32m8','test_rvv'],'custom_strategy_obligations':len(strategy_fields),'checked_module':'VLRelu.RvvChecked.KernelChecked : VLRelu.rvv_unit_goal.VC_Correct','final_gate':'VLRelu.RvvGate.FinalRvvKernel','run_directory':str(RUN),'generation_directory':str(source_run),'dependencies':'Fresh VADD load/store and strategies; local new primitives; scalar bits body checked separately; full case closure remains separate','records':records,'fresh_local_coq_modules':len(list(COQ.glob('*.vo'))),'sources_sha256':{str(p.relative_to(CASE)):hashlib.sha256(p.read_bytes()).hexdigest() for p in paths},'actual_c_sha256':hashlib.sha256((source_run/'rvv_unit.c').read_bytes()).hexdigest(),'generated_goal_sha256':hashlib.sha256((COQ/'rvv_unit_goal.v').read_bytes()).hexdigest(),'all_c_vc_assumptions_log':'RvvGate.v.log'}
 (HERE/'rvv-proof-status.json').write_text(json.dumps(status,indent=2)+'\n')
 (RUN/'status.json').write_text(json.dumps(status,indent=2)+'\n')

if __name__=='__main__':
 if args.kernel:
  try:check_kernel()
  except Exception as error:
   status={'passed':False,'scope':'original_RVV_kernel_body_VC_Correct_attempt','whole_kernel_verified':False,'run_directory':str(RUN),'records':records,'error':str(error)}
   (HERE/'rvv-proof-status.json').write_text(json.dumps(status,indent=2)+'\n')
   (RUN/'status.json').write_text(json.dumps(status,indent=2)+'\n')
   raise
 elif args.generate:
  execute(['qcp','--arch=64','--endian=little','--no-float-finite-vc','--no-exec-info','--input-file='+str(CASE/'shim/rvv_primitives.c'),'--coq-output-dir='+str(COQ),'--coq-logic-path=VLRelu','-slp',CASE/'shim','VLRelu'],'qcp')
 else:
  for name in ['Model.v','RvvModel.v','RvvFastFrame.v','RvvResult.v','rvv_primitives_goal.v','RvvPrimitiveScalar.v','RvvPrimitiveMul.v','RvvPrimitiveReinterpret.v','RvvPrimitiveMask.v','RvvPrimitiveMerge.v','RvvPrimitives.v']:compile(name)
  goal=(COQ/'rvv_primitives_goal.v').read_text()
  shutil.copyfile(COQ/'rvv_primitives_goal.v',HERE/'coq/rvv_primitives_goal.v')
  status={'passed':True,'scope':'new_RVV_C_primitive_body_VC_Correct','whole_kernel_verified':False,'checked_c_vcs':len(re.findall(r'^Axiom proof_of_',goal,re.M)),'run_directory':str(RUN),'sources_sha256':source_hashes(),'records':records,'external_c_callees':['qcp_float_bits']}
  (HERE/'rvv-primitive-status.json').write_text(json.dumps(status,indent=2)+'\n')
 (RUN/'records.json').write_text(json.dumps(records,indent=2)+'\n')
