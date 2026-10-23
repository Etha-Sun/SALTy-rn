#!/usr/bin/env python3
"""Check independent original-NEON C VCs; preserve partial success explicitly."""
from pathlib import Path
import json,re,shutil,subprocess,time,concurrent.futures,hashlib,sys
HERE=Path(__file__).resolve().parent;CASE=HERE.parent
REPO=next(p for p in CASE.parents if (p/'.git').exists());BASE=REPO/'verification/qcp/verified/f32-vmul'
OLD=Path(sys.argv[sys.argv.index('--dependency-dir')+1]).resolve() if '--dependency-dir' in sys.argv else Path(json.loads((BASE/'proof/status.json').read_text())['run_directory'])/'coq'
LOCAL=Path(json.loads((HERE/'rvv-proof-status.json').read_text())['run_directory'])/'coq'
RUN=Path(json.loads((HERE/'neon-generation-status.json').read_text())['run_directory']);COQ=RUN/'coq';COQ.mkdir(exist_ok=True)
CFG=json.loads((REPO.parents[1]/'research/qcp-shim-vadd/results/coq-flags.json').read_text());flags=['qcp-env','coqc',*CFG['flags'][2:]]
for p in OLD.iterdir():flags+=['-Q',str(p),'' if p.name=='relations' else p.name]
flags+=['-Q',str(LOCAL),'VMulc','-Q',str(COQ),'VMulc']
prior=json.loads((HERE/'neon-proof-status.json').read_text()) if '--retry-open' in sys.argv else None
records=list(prior['records']) if prior else []
def execute(cmd,label,timeout=120):
 start=time.monotonic()
 try:
  with (RUN/(label+'.log')).open('w') as out:r=subprocess.run(list(map(str,cmd)),cwd=CFG['cwd'],stdout=out,stderr=out,timeout=timeout)
  code=r.returncode
 except subprocess.TimeoutExpired:code=124
 rec={'label':label,'exit_code':code,'seconds':time.monotonic()-start,'command':list(map(str,cmd))};records.append(rec);return code==0
strategy=Path(shutil.which('qcp')).resolve().parent/'StrategyCheck'
assert execute([strategy,'--arch=64','--endian=little','--no-exec-info','--input-file='+str(HERE/'c/neon_vmulc.strategies'),'--coq-output-dir='+str(RUN),'--coq-logic-path=VMulc'],'strategy')
for n in ['neon_vmulc_strategy_goal.v','neon_unit_goal.v']:shutil.copyfile(RUN/n,COQ/n)
(COQ/'neon_vmulc_strategy_proof.v').write_text('''From VMulc Require Import Model neon_vmulc_strategy_goal.
From QcpRvv32 Require Import RvvLoopModel.
From SimpleC.SL Require Import SeparationLogic.
Import Snaive_C_Rules64.
Local Open Scope sac.
Module CheckedNeonVmulcStrategy : neon_vmulc_Strategy_Correct.
Lemma neon_vmulc_strategy1_correctness : neon_vmulc_strategy1.
Proof. pre_process_default; subst; unfold vmulc_values; simpl.
 unfold FloatArray.full, store_array; simpl store_array_rec; entailer!.
Qed.
End CheckedNeonVmulcStrategy.
''')
for n in ['neon_vmulc_strategy_goal.v','neon_vmulc_strategy_proof.v','neon_unit_goal.v']:
 if not (prior and (COQ/n).with_suffix('.vo').exists()) and not execute(flags+[COQ/n],n):raise SystemExit((RUN/(n+'.log')).read_text()[-2000:])
goal=(COQ/'neon_unit_goal.v').read_text();names=re.findall(r'^Axiom proof_of_(\w+) :',goal,re.M)
if '--aggregate' in sys.argv:
 spec=(CASE/'spec.c').read_text();start=spec.index(' test_neon(');a=spec.index('/*@',start);b=spec.index('*/',a)+2
 assert spec[a:b] in (RUN/'neon_unit.c').read_text(), 'Live kernel contract changed since generation'
 for n in ['NeonResult.v','NeonVcs.v','NeonChecked.v']:
  shutil.copyfile(HERE/'coq'/n,COQ/n)
  assert execute(flags+[COQ/n],n,240), (RUN/(n+'.log')).read_text()[-2500:]
 sources=[CASE/'impl/testNEON.c',CASE/'shim/neon_frontend.h',CASE/'shim/neon_model_def.h',CASE/'shim/model_def.h',HERE/'c/neon_vmulc.strategies',Path(__file__)] + [HERE/'coq'/n for n in ['Model.v','NeonResult.v','NeonVcs.v','NeonChecked.v','neon_unit_goal.v','neon_vmulc_strategy_goal.v','neon_vmulc_strategy_proof.v']]
 status={'passed':True,'scope':'original_NEON_kernel_body_VCs_with_fresh_VMUL_dependencies','whole_kernel_verified':False,'public_spec_is_draft':True,'run_directory':str(RUN),'checked_c_vcs':len(names),'generated_c_vcs':len(names),'vc_correct_passed':True,'vc_correct_alias':'VMulc.NeonChecked.CheckedOriginalNeon','records':records,'reused_dependencies':[str(OLD),str(LOCAL)],'sources_sha256':{str(p.relative_to(CASE)):hashlib.sha256(p.read_bytes()).hexdigest() for p in sources},'live_public_contract_sha256':hashlib.sha256(spec[a:b].encode()).hexdigest()}
 (HERE/'neon-proof-status.json').write_text(json.dumps(status,indent=2)+'\n')
 print('NEON aggregate VC_Correct:',len(names),'passed')
 raise SystemExit(0)

base='''From Coq Require Import ZArith Lia.
From SimpleC.SL Require Import Mem SeparationLogic.
From QcpNeon Require Import NeonBridge.
From QcpNeonLoop Require Import LoopMemory TailMemory neon_init_lemmas neon_tail_models InvariantFacts NeonLoopBridge.
From QcpRvv32 Require Import RvvLayout FastFrame.
From ByValue Require Import neon_copy_checked.
From VMulc Require Import Model neon_unit_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Ltac generic_copy :=
 unfold VMulc.Model.UndefStructPredfloat32x4_t, QcpNeon.NeonBridge.UndefStructPredfloat32x4_t, UndefStructPredfloat32x2_t;
 rewrite ?rvv_local_field_address; try csimpl;
 repeat progress rewrite <- logic_equiv_andp_assoc;
 first [apply _derivable1_andp_intros;
 [unfold derivable1, andp, coq_prop; intros; repeat first [assumption|split|reflexivity];lia
 |forget_rhs_fields; opaque_leaves; sepcon_assoc_change; fast_cancel]
 |forget_rhs_fields; opaque_leaves; sepcon_assoc_change; fast_cancel].
'''
for n in names:
 aux=', '+n+'_aux' if n+'_aux' in goal and not n.endswith('_pure') else ''
 tactic='first [solve [intros; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *; unfold fp32_bits_equal in *; unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia] | solve [pre_process; subst; try csimpl; entailer!] | solve [intros; generic_copy] | solve [intros; try (Exists k); try (Exists k_2); try csimpl; entailer!]]'
 custom=HERE/'coq'/('neon_'+n+'.v')
 text=custom.read_text() if custom.exists() else base+f'Lemma proof_of_{n} : {n}.\nProof. unfold {n}{aux}; {tactic}. Qed.\n'
 (COQ/('neon_'+n+'.v')).write_text(text)
def check(n):
 label='neon_'+n
 if execute(flags+['-time',COQ/(label+'.v')],label,120 if n=='test_neon_entail_wit_2' else 35):return n,True
 return n,False
selected=prior['open_vcs'] if prior else names
with concurrent.futures.ThreadPoolExecutor(max_workers=20) as pool:results=list(pool.map(check,selected))
if prior:results += [(n,True) for n in prior['passed_vcs']]
passed=[n for n,ok in results if ok];failed=[n for n,ok in results if not ok]
for n in ['neon_vmulc_strategy_goal.v','neon_vmulc_strategy_proof.v','neon_unit_goal.v']:shutil.copyfile(COQ/n,HERE/'coq'/n)
status={'passed':not failed,'scope':'original_NEON_C_VCs_partial_diagnostic','whole_kernel_verified':False,'run_directory':str(RUN),'checked_c_vcs':len(passed),'generated_c_vcs':len(names),'passed_vcs':passed,'open_vcs':failed,'records':records,'reused_dependencies':[str(OLD),str(LOCAL)]}
(HERE/'neon-proof-status.json').write_text(json.dumps(status,indent=2)+'\n')
print('NEON:',len(passed),'/',len(names),'open:',failed)
