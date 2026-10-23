#!/usr/bin/env python3
"""Check only the new broadcast primitives; this never verifies the kernels."""
from pathlib import Path
import hashlib,json,re,shutil,subprocess,tempfile,time
HERE=Path(__file__).resolve().parent
CASE=HERE.parent
REPO=next(p for p in CASE.parents if (p/'.git').exists())
CFG=json.loads((REPO.parents[1]/'research/qcp-shim-vadd/results/coq-flags.json').read_text())
BUILD=CASE/'.build';BUILD.mkdir(exist_ok=True)
RUN=Path(tempfile.mkdtemp(prefix='primitives-',dir=BUILD))
COQ=RUN/'coq';COQ.mkdir()
records=[]
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
def execute(command,label,timeout=120):
 start=time.monotonic()
 with (RUN/(label+'.log')).open('w') as out:
  result=subprocess.run(list(map(str,command)),cwd=CFG['cwd'],stdout=out,stderr=out,timeout=timeout)
 records.append({'label':label,'exit_code':result.returncode,'seconds':time.monotonic()-start,'command':list(map(str,command)),'log_sha256':sha(RUN/(label+'.log'))})
 print(label,result.returncode,flush=True)
 if result.returncode:raise RuntimeError((RUN/(label+'.log')).read_text()[-3500:])
flags=['qcp-env','coqc',*CFG['flags'][2:],'-Q',COQ,'VMulc']
status={'passed':False,'scope':'new_broadcast_primitives_only','whole_kernel_verified':False,'run_directory':str(RUN),'records':records}
try:
 execute(['qcp','--arch=64','--endian=little','--no-float-finite-vc','--no-exec-info','--input-file='+str(CASE/'shim/primitives.c'),'--coq-output-dir='+str(COQ),'--coq-logic-path=VMulc','-slp',CASE/'shim','VMulc'],'qcp')
 for name in ['Model.v','FastFrame.v']:shutil.copyfile(HERE/'coq'/name,COQ/name)
 goal=(COQ/'primitives_goal.v').read_text()
 names=re.findall(r'^Axiom proof_of_(\w+) :',goal,re.M)
 checked='''From Coq Require Import ZArith Lia.
From VMulc Require Import Model FastFrame primitives_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module CheckedBroadcast : VC_Correct.
'''
 for name in names:
  extra=', '+name+'_aux' if name+'_aux' in goal and not name.endswith('_pure') else ''
  if name=='qcp_rvv_mulf_lane_return_wit_1':
   tactic='left; intros; unfold fp32_bits_equal, vmulc_active_mul; assert (Htest: Z.ltb i_pre vl_pre = false) by (apply Z.ltb_ge; lia); rewrite Htest; entailer!.'
  elif name=='qcp_rvv_mulf_lane_return_wit_2':
   tactic='left; intros; unfold fp32_bits_equal, vmulc_active_mul; assert (Htest: Z.ltb i_pre vl_pre = true) by (apply Z.ltb_lt; lia); rewrite Htest; entailer!.'
  elif '_safety_' in name or name.endswith('_pure'):
   tactic='intros; unfold derivable1, andp, coq_prop; intros; repeat first [assumption | split | reflexivity]; lia.'
  else:
   tactic='try left; intros; unfold fp32_bits_equal in *; subst; unfold UndefStructPredfloat32x4_t, UndefStructPredvfloat32m8_t; rewrite ?local_field_address; repeat progress rewrite <- logic_equiv_andp_assoc; first [ apply _derivable1_andp_intros; [unfold derivable1, andp, coq_prop; intros; repeat first [assumption | split | reflexivity]; lia | opaque_leaves; sepcon_assoc_change; fast_cancel ] | opaque_leaves; sepcon_assoc_change; fast_cancel ].'
  checked+=f'Lemma proof_of_{name} : {name}.\nProof. unfold {name}{extra}; {tactic} Qed.\n'
 checked+='End CheckedBroadcast.\n'
 (COQ/'primitives_checked.v').write_text(checked)
 for name in ['Model.v','FastFrame.v','primitives_goal.v','primitives_checked.v']:execute(flags+[COQ/name],name)
 for name in ['primitives_goal.v','primitives_checked.v']:shutil.copyfile(COQ/name,HERE/'coq'/name)
 code=re.sub(r'/\*.*?\*/|//[^\n]*','',(CASE/'shim/primitives.c').read_text(),flags=re.S)
 calls=set(re.findall(r'\b([a-zA-Z_]\w*)\s*\(',code))
 assert calls-{'if','vld1q_dup_f32','qcp_rvv_mulf_lane','__riscv_vfmul_vf_f32m8'}==set(),calls
 status.update(passed=True,checked_c_vcs=len(names),fresh_local_coq_modules=4,checked_functions=['vld1q_dup_f32','qcp_rvv_mulf_lane','__riscv_vfmul_vf_f32m8'],external_c_callees=[])
except RuntimeError as error:status['error']=str(error);print(error)
status['sources_sha256']={str(p.relative_to(CASE)):sha(p) for p in [CASE/'shim/primitives.c',CASE/'shim/types.h',HERE/'coq/Model.v',HERE/'coq/FastFrame.v',Path(__file__)]}
(HERE/'primitive-status.json').write_text(json.dumps(status,indent=2)+'\n')
print(json.dumps({k:status.get(k) for k in ['passed','scope','checked_c_vcs','whole_kernel_verified']}))
raise SystemExit(0 if status['passed'] else 1)
