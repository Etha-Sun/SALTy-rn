#!/usr/bin/env python3
"""Prepare/generate one actual ordinary Argmax update helper; never a kernel certificate.
Existing scalar/record profiles and the valid main generation are not edited.
The native primitive contracts are the existing source-review boundary. A raw
R/Int emitter definition is archived, rejected, and replaced by the explicit
binary32/UInt/Snaive64LE record export, preserving actual generated goal bytes.
"""
from pathlib import Path
import argparse,hashlib,json,os,re,shutil,subprocess,tempfile,time
C=Path(__file__).resolve().parents[1];ROOT=C.parents[3]
sha=lambda p:hashlib.sha256(Path(p).read_bytes()).hexdigest()
def put(path,text):
 path=C/path
 if path.exists():assert path.read_text()==text,('Refuse to overwrite different existing source',str(path))
 else:path.write_text(text)
def prepare():
 fields=';\n'.join(' vuint32m8_t_s%d:Z'%i for i in range(32))
 def cells(undef=False):return ' **\n'.join(' (&(p # "vuint32m8_t" ->ₛ "s%d")) # UInt |->%s'%(i,'_'if undef else' v.(vuint32m8_t_s%d)'%i)for i in range(32))+'.\n'
 rel=' /\\\n'.join(' apr_int_lane %d vl j.(vuint32m8_t_s%d) (ap_rvv_select_u32 m.(vbool4_t_s%d) i.(vuint32m8_t_s%d) (ap_u32 index))'%(i,i,i,i)for i in range(32))
 model='''From Coq Require Import ZArith Strings.String.
From ArgmaxPool Require Export RvvVectorRecords.
Import Snaive_C_Rules64.
Local Open Scope string_scope. Local Open Scope sac.
(* Faithful unsigned32 physical fields; never the rejected generic R/Int view. *)
Record Recordvuint32m8_t : Type := make_record_vuint32m8_t {
'''+fields+'''\n}.
Definition StructPredvuint32m8_t(p:Z)(v:Recordvuint32m8_t):Assertion :=\n'''+cells()+'''Definition UndefStructPredvuint32m8_t(p:Z):Assertion :=\n'''+cells(True)+'''Definition ap_update_um32(j i:Recordvuint32m8_t)(m:Recordvbool4_t)(index vl:Z):Prop :=\n'''+rel+'''.
(* Active lanes implement the original GT and both original merges. Inactive
   lanes retain typed ownership while their values remain arbitrary. *)
Definition ap_rvv_update32(r:Recordvfloat32m8_t)(j:Recordvuint32m8_t)
 (a:Recordvfloat32m8_t)(i:Recordvuint32m8_t)(b:Recordvfloat32m8_t)(index vl:Z):Prop :=
 exists m:Recordvbool4_t, ap_record_gt32 m b a vl /\\ ap_record_mask32 m vl /\\
 ap_record_merge32 r m a b vl /\\ ap_update_um32 j i m index vl.
'''
 put(Path('proof/coq/RvvUpdateIntoModel.v'),model)
 contract='''/*@ With (A:Recordvfloat32m8_t) (I:Recordvuint32m8_t) (B:Recordvfloat32m8_t)
 Require 0<=vl && vl<=32 && StructPredvfloat32m8_t(pa,A)*StructPredvuint32m8_t(pi,I)*StructPredvfloat32m8_t(pb,B)
 Ensure exists(R:Recordvfloat32m8_t)(J:Recordvuint32m8_t),ap_rvv_update32(R,J,A,I,B,index,vl) && StructPredvfloat32m8_t(pa,R)*StructPredvuint32m8_t(pi,J)*StructPredvfloat32m8_t(pb,B) */'''
 proto='void ap_rvv_update_into32(vfloat32m8_t*pa,vuint32m8_t*pi,const vfloat32m8_t*pb,uint32_t index,size_t vl)'
 header='''#ifndef ARGMAXPOOL_RVV_UPDATE_INTO_H
#define ARGMAXPOOL_RVV_UPDATE_INTO_H
#include "rvv_record_consumers.h"
/*@ Import Coq Require Import ArgmaxPool.RvvUpdateIntoModel */
/*@ Extern Coq (Recordvuint32m8_t :: *) */
/*@ Extern Coq (StructPredvuint32m8_t:Z->Recordvuint32m8_t->Assertion)
 (ap_rvv_update32:Recordvfloat32m8_t->Recordvuint32m8_t->Recordvfloat32m8_t->Recordvuint32m8_t->Recordvfloat32m8_t->Z->Z->Prop) */
'''+proto+'\n'+contract+';\n#endif\n'
 body='''#include "rvv_update_into.h"
'''+proto+'\n'+contract+'''
{
 vfloat32m8_t a=*pa;
 vuint32m8_t i=*pi;
 vfloat32m8_t b=*pb;
 vbool4_t m=__riscv_vmfgt_vv_f32m8_b4(b,a,vl) /*@ where a=0,b=0 */;
 *pa=__riscv_vmerge_vvm_f32m8(a,b,m,vl) /*@ where a=0,b=0,m=0 */;
 *pi=__riscv_vmerge_vxm_u32m8(i,index,m,vl) /*@ where a=0,m=0 */;
}
'''
 put(Path('shim/rvv_update_into.h'),header);put(Path('shim/rvv_update_into.c'),body)
def main():
 ap=argparse.ArgumentParser();ap.add_argument('--prepare-only',action='store_true');args=ap.parse_args();prepare()
 if args.prepare_only:print('Prepared only new ordinary helper, contract and faithful record model;0 verifier processes');return 0
 quota=json.loads((ROOT/'.build/memory/quota/state.json').read_text());assert quota['ordinary_usage_allowed']and not quota['wind_down_requested']
 run=Path(tempfile.mkdtemp(prefix='root-update-into-generation-',dir=C/'.build'));snapshot=run/'shim';snapshot.mkdir();gen=run/'generated';gen.mkdir();paths=[*sorted((C/'shim').glob('*.h')),C/'shim/rvv_update_into.c',C/'proof/coq/RvvUpdateIntoModel.v',C/'proof/coq/RvvVectorRecords.v',Path(__file__)];inputs={str(p.relative_to(C)):sha(p)for p in paths}
 for p in paths:
  if p.parent==C/'shim':shutil.copy2(p,snapshot/p.name)
 records=[];status={'passed':False,'whole_kernel_verified':False,'scope':'actual ordinary update helper goal generation only; canonical main unchanged','run_directory':str(run),'input_sha256':inputs,'records':records,'configured_jobs':32,'max_live_processes':1,'per_process_memory_GiB':32,'timeout_seconds':21600}
 env={**os.environ,'PATH':str(ROOT/'.build/simple-kernels-bootstrap/bin')+':/tmp/qcp-coq820-install/bin:'+os.environ['PATH']}
 try:
  commands=[('cpp',['gcc','-E','-P','-CC','-nostdinc',str(snapshot/'rvv_update_into.c'),'-o',str(run/'rvv_update_into.c')]),('qcp',['qcp','--arch=64','--endian=little','--no-float-finite-vc','--no-exec-info','--input-file='+str(run/'rvv_update_into.c'),'--coq-output-dir='+str(gen),'--coq-logic-path=ArgmaxPool','-slp',str(snapshot),'ArgmaxPool'])]
  for label,raw in commands:
   cmd=['prlimit','--as=34359738368:34359738368','--',*raw];log=run/(label+'.log');start=time.monotonic()
   try:
    with log.open('w')as f:code=subprocess.run(cmd,cwd=run,env=env,stdout=f,stderr=f,timeout=21600).returncode
   except subprocess.TimeoutExpired:code=124
   records.append({'label':label,'command':cmd,'exit_code':code,'seconds':time.monotonic()-start,'log_sha256':sha(log)});assert code==0,log.read_text()[-2000:]
  goal=gen/'rvv_update_into_goal.v';fields=re.findall(r'^Axiom proof_of_(\w+)\s*:',goal.read_text(),re.M);assert fields
  emitted=gen/'rvv_update_into_def.v';raw=emitted.read_bytes();(gen/'rvv_update_into_def.emitted.v.txt').write_bytes(raw);assert b'vfloat32m8_t_s0 : R;'in raw and b'# Int'in raw
  emitted.write_text('From ArgmaxPool Require Export RvvUpdateIntoModel.\n');assert inputs=={n:sha(C/n)for n in inputs}
  status.update(passed=True,actual_C_fields=len(fields),fields=fields,goal_sha256=sha(goal),goal_path=str(goal),actual_CPP_sha256=sha(run/'rvv_update_into.c'),raw_emitted_definition_sha256=hashlib.sha256(raw).hexdigest(),raw_emitted_definition_rejected=True,definition_adapter_sha256=sha(emitted),canonical_record_model_sha256=sha(C/'proof/coq/RvvUpdateIntoModel.v'),canonical_main_changed=False)
 except Exception as e:status['error']=str(e)
 (run/'status.json').write_text(json.dumps(status,indent=2)+'\n');(C/'.build/root-update-into-generation.json').write_bytes((run/'status.json').read_bytes());print(json.dumps({k:status.get(k)for k in ['passed','run_directory','actual_C_fields','error']}),flush=True);return 0 if status['passed']else 1
if __name__=='__main__':raise SystemExit(main())
