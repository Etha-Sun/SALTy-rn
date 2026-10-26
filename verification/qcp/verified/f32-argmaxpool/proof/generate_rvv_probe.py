#!/usr/bin/env python3
"""Actual C probes of original intrinsic specification transport, no ISA credit."""
from pathlib import Path
import hashlib,json,os,re,subprocess,tempfile,time
C=Path(__file__).resolve().parents[1];R=C.parents[3]
sha=lambda p:hashlib.sha256(Path(p).read_bytes()).hexdigest()
def source():
 s='#include "rvv_specs.h"\n'
 s+='''size_t probe_vl(size_t avl)
/*@ Require emp Ensure ap_vl_allowed(avl,__return) && emp */
{return __riscv_vsetvl_e32m8(avl);}
'''
 fpacket='ap_fpack32('+','.join(['x']*32)+')';ipacket='ap_ipack32('+','.join(['ix']*32)+')'
 s+='''void probe_store_pair(float*p,uint32_t*q,float x,uint32_t ix,size_t vl)
/*@ With(W:list Z)(WI:list Z)(O:APOutput)(I:APIndex)
Require 0<=vl && vl<=32 && ap_write_window(W,p,vl) && ap_write_window(WI,q,vl) && ap_output(W,O) * ap_index(WI,I)
Ensure ap_output(W,ap_output_write(O,p,vl,'''+fpacket+''')) * ap_index(WI,ap_index_write(I,q,vl,'''+ipacket+''')) */
{vfloat32m8_t a;vuint32m8_t b;
'''
 s+='\n'.join(f'a.s{j}=x;b.s{j}=ix;'for j in range(32))+'\n__riscv_vse32_v_f32m8(p,a,vl);\n__riscv_vse32_v_u32m8(q,b,vl);\n}\n'
 s+='''float probe_select(float x,float y,size_t vl)
/*@ Require 1<=vl && vl<=32 && emp
Ensure apr_float_lane(0,vl,__return,ap_rvv_select_f32(ap_rvv_gt(y,x),x,y)) && emp */
{vfloat32m8_t a;vfloat32m8_t b;
'''
 s+='\n'.join(f'a.s{j}=x;b.s{j}=y;'for j in range(32))
 s+='\nvbool4_t m=__riscv_vmfgt_vv_f32m8_b4(b,a,vl) /*@ where a=0,b=0 */;\na=__riscv_vmerge_vvm_f32m8(a,b,m,vl) /*@ where a=0,b=0,m=0 */;\nreturn a.s0;\n}\n'
 return s
def main():
 run=Path(tempfile.mkdtemp(prefix='rvv-probe-generation-',dir=C/'.build'));records=[]
 inputs={str(p.relative_to(C)):sha(p)for p in [Path(__file__),*sorted((C/'shim').glob('*.h')),C/'proof/coq/RvvKernelModel.v']}
 status=dict(passed=False,whole_kernel_verified=False,scope='three_actual_C_transport_probes_only',run_directory=str(run),input_sha256=inputs,records=records,configured_jobs=32,max_live_processes=1,per_process_memory_GiB=16)
 env=os.environ.copy();env['PATH']=str(R/'.build/simple-kernels-bootstrap/bin')+':/tmp/qcp-coq820-install/bin:'+env['PATH']
 try:
  (run/'probe.c').write_text(source())
  commands=[('cpp',['gcc','-E','-P','-CC','-nostdinc','-I',str(C/'shim'),str(run/'probe.c'),'-o',str(run/'rvv_probe.c')]),('qcp',['qcp','--arch=64','--endian=little','--no-float-finite-vc','--no-exec-info','--input-file='+str(run/'rvv_probe.c'),'--coq-output-dir='+str(run),'--coq-logic-path=ArgmaxPool','-slp',str(C/'shim'),'ArgmaxPool'])]
  for label,cmd in commands:
   log=run/(label+'.log');start=time.monotonic();cmd=['prlimit','--as=17179869184:17179869184','--']+cmd
   with log.open('w')as f:p=subprocess.run(cmd,cwd=run,env=env,stdout=f,stderr=f,timeout=7200)
   records.append(dict(label=label,command=cmd,exit_code=p.returncode,seconds=time.monotonic()-start,log_sha256=sha(log)));assert p.returncode==0,log.read_text()[-3000:]
  goal=run/'rvv_probe_goal.v';fields=re.findall(r'^Axiom proof_of_(\w+)\s*:',goal.read_text(),re.M)
  assert fields;assert all(sha(C/p)==h for p,h in inputs.items());status.update(passed=True,fields=fields,actual_probe_C_fields=len(fields),goal_sha256=sha(goal),cpp_sha256=sha(run/'rvv_probe.c'))
 except Exception as e:status['error']=str(e)
 (run/'status.json').write_text(json.dumps(status,indent=2)+'\n');print(json.dumps({k:status.get(k)for k in ['passed','run_directory','actual_probe_C_fields','error']}));return 0 if status['passed']else 1
if __name__=='__main__':raise SystemExit(main())
