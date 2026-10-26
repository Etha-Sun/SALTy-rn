#!/usr/bin/env python3
"""Independent source renderer using the checked, exact record select helper.

The original C and intrinsic specifications are unchanged. Every ordinary
helper requires its own actual C proof; generated float record definitions
are rejected in favor of the explicitly frozen canonical fp32/Float model.
"""
from pathlib import Path
import argparse,json,os,re,subprocess,tempfile,time
import generate_borrowed_kernels as B
import generate_kernels as G
import generate_compact_borrowed_kernels as Compact
C=B.C;R=B.R;sha=B.sha
def prefix():
 return '#include "'+str(C/'shim/kernel_frontend.h')+'"\n#include "'+str(C/'shim/rvv_record_consumers.h')+'"\n#undef __riscv_vmfgt_vv_f32m8_b4\n#undef __riscv_vmerge_vvm_f32m8\n#define __riscv_vmfgt_vv_f32m8_b4(a,b,vl) ap_record_rvv_gt32(&(a),&(b),(vl))\n#define __riscv_vmerge_vvm_f32m8(a,b,m,vl) ap_record_rvv_merge32(&(a),&(b),&(m),(vl))\n'
def render():
 raw,annotated,removed=Compact.render('rvv')
 assert G.tokens(raw)==G.tokens(annotated)
 return raw,annotated
def main():
 ap=argparse.ArgumentParser();ap.add_argument('--timeout',type=int,default=600);ap.add_argument('--prepare-only',action='store_true');a=ap.parse_args();assert 0<a.timeout<=21600
 assert not json.loads((R/'.build/memory/quota/state.json').read_text())['wind_down_requested']
 component=json.loads((C/'proof/rvv-record-consumers-status.json').read_text());native=json.loads((C/'proof/rvv-record-native-status.json').read_text());assert component['passed']and native['passed']
 for n,h in component['source_sha256'].items():assert sha(C/'proof/coq'/(n+'.v'))==h,('proof source changed',n)
 for n,h in native['input_sha256'].items():assert sha(C/n)==h,('native input changed',n)
 run=Path(tempfile.mkdtemp(prefix='rvv-record-borrowed-',dir=C/'.build'));gen=run/'generated';gen.mkdir();records=[]
 paths=[Path(__file__),Path(B.__file__),C/'proof/generate_compact_borrowed_kernels.py',C/'proof/generate_kernels.py',C/'impl/testRVV.c',C/'spec.c',C/'shim/rvv_record_consumers.c',C/'proof/coq/RvvVectorRecords.v',C/'proof/coq/rvv_record_consumers_def.v',*sorted((C/'shim').glob('*.h'))]
 inputs={str(p.relative_to(C)):sha(p)for p in paths}
 s=dict(passed=False,whole_kernel_verified=False,scope='actual_RVV_C_generation_with_checked_record_select_ordinary_helper_only',run_directory=str(run),records=records,input_sha256=inputs,configured_jobs=32,max_live_processes=1,per_process_memory_GiB=32,timeout_seconds=a.timeout)
 env={**os.environ,'PATH':str(R/'.build/simple-kernels-bootstrap/bin')+':/tmp/qcp-coq820-install/bin:'+os.environ['PATH']}
 try:
  raw,t=render();(run/'rvv_unit.c').write_text(prefix()+t);(run/'raw.c').write_text(prefix()+raw)
  for label,cmd in [('cpp',['gcc','-E','-P','-CC','-nostdinc',str(run/'rvv_unit.c'),'-o',str(run/'rvv_unit.i')]),('raw-cpp',['gcc','-E','-P','-CC','-nostdinc',str(run/'raw.c'),'-o',str(run/'raw.i')])]+([]if a.prepare_only else[('qcp',['qcp','--arch=64','--endian=little','--no-float-finite-vc','--no-exec-info','--strategy-application-limit=8192','--input-file='+str(run/'rvv_unit.i'),'--coq-output-dir='+str(gen),'--coq-logic-path=ArgmaxPool','-slp',str(C/'shim'),'ArgmaxPool'])]):
   if label=='qcp':assert G.tokens((run/'rvv_unit.i').read_text())==G.tokens((run/'raw.i').read_text())
   cmd=['prlimit','--as=34359738368:34359738368','--']+cmd;log=run/(label+'.log');start=time.monotonic()
   try:
    with log.open('w')as f:ec=subprocess.run(cmd,cwd=run,env=env,stdout=f,stderr=f,timeout=a.timeout).returncode
   except subprocess.TimeoutExpired:ec=124
   records.append(dict(label=label,command=cmd,exit_code=ec,seconds=time.monotonic()-start,log_sha256=sha(log)));(run/'status.json').write_text(json.dumps(s,indent=2)+'\n');assert ec==0,log.read_text()[-2000:]
  assert inputs=={n:sha(C/n)for n in inputs};s.update(passed=True,original_same_frontend_CPP_tokens_identical=True,prepare_only=a.prepare_only)
  if not a.prepare_only:
   goal=gen/'rvv_unit_goal.v';emitted=gen/'rvv_unit_def.v';assert '# Int'in emitted.read_text()and'vfloat32m8_t_s0 : R;'in emitted.read_text()
   wrapper=run/'rvv_unit_def.v';wrapper.write_text('From ArgmaxPool Require Export RvvVectorRecords.\n')
   s.update(goal_path=str(goal),goal_sha256=sha(goal),actual_C_fields=len(re.findall(r'^Axiom proof_of_',goal.read_text(),re.M)),raw_emitted_definition_rejected=True,raw_emitted_definition_sha256=sha(emitted),definition_export_path=str(wrapper),definition_export_sha256=sha(wrapper),canonical_record_module='ArgmaxPool.RvvVectorRecords',canonical_record_source_sha256=sha(C/'proof/coq/RvvVectorRecords.v'))
 except Exception as e:s['error']=str(e)
 (run/'status.json').write_text(json.dumps(s,indent=2)+'\n');print(json.dumps({k:s.get(k)for k in ['passed','run_directory','actual_C_fields','error']}),flush=True);return 0 if s['passed']else 1
if __name__=='__main__':raise SystemExit(main())
