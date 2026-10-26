#!/usr/bin/env python3
"""Fresh actual C generation with explicitly bound canonical binary32 records.

The automatic emitter's R/Int definition is preserved and rejected. Actual
goal bytes are retained; the public *_def module only exports VectorRecords.
This checker generates goals, not a complete-kernel certificate.
"""
from pathlib import Path
import hashlib,json,os,re,subprocess,tempfile,time
C=Path(__file__).resolve().parents[1];R=C.parents[3]
sha=lambda p:hashlib.sha256(Path(p).read_bytes()).hexdigest()
def main():
 assert not json.loads((R/'.build/memory/quota/state.json').read_text())['wind_down_requested']
 run=Path(tempfile.mkdtemp(prefix='neon-record-compare-generation-',dir=C/'.build'));gen=run/'generated';gen.mkdir()
 paths=[Path(__file__),C/'shim/neon_record_compare.c',C/'proof/coq/VectorRecords.v',C/'proof/coq/NeonRecordCompareModel.v',C/'proof/coq/neon_record_compare_def.v',*sorted((C/'shim').glob('*.h'))]
 inputs={str(p.relative_to(C)):sha(p)for p in paths};records=[]
 s=dict(passed=False,whole_kernel_verified=False,scope='actual_ordinary_record_consumer_goal_generation_only',run_directory=str(run),input_sha256=inputs,records=records,configured_jobs=32,max_live_processes=1,per_process_memory_GiB=16)
 env={**os.environ,'PATH':str(R/'.build/simple-kernels-bootstrap/bin')+':/tmp/qcp-coq820-install/bin:'+os.environ['PATH']}
 try:
  for label,cmd in [('cpp',['gcc','-E','-P','-CC','-nostdinc',str(C/'shim/neon_record_compare.c'),'-o',str(run/'neon_record_compare.c')]),('qcp',['qcp','--arch=64','--endian=little','--no-float-finite-vc','--no-exec-info','--input-file='+str(run/'neon_record_compare.c'),'--coq-output-dir='+str(gen),'--coq-logic-path=ArgmaxPool','-slp',str(C/'shim'),'ArgmaxPool'])]:
   cmd=['prlimit','--as=17179869184:17179869184','--']+cmd;log=run/(label+'.log');start=time.monotonic()
   try:
    with log.open('w')as f:ec=subprocess.run(cmd,cwd=run,env=env,stdout=f,stderr=f,timeout=7200).returncode
   except subprocess.TimeoutExpired:ec=124
   records.append(dict(label=label,command=cmd,exit_code=ec,seconds=time.monotonic()-start,log_sha256=sha(log)));assert ec==0,log.read_text()[-2000:]
  goal=gen/'neon_record_compare_goal.v';fields=re.findall(r'^Axiom proof_of_(\w+)\s*:',goal.read_text(),re.M);assert fields
  assert inputs=={n:sha(C/n)for n in inputs}
  emitted=gen/'neon_record_compare_def.v';assert 'float32x4_t_s0 : R;'in emitted.read_text() and '# Int'in emitted.read_text()
  s.update(passed=True,actual_C_fields=len(fields),fields=fields,goal_path=str(goal),goal_sha256=sha(goal),actual_CPP_sha256=sha(run/'neon_record_compare.c'),raw_emitted_definition_sha256=sha(emitted),raw_emitted_definition_rejected=True,canonical_definition_module='ArgmaxPool.VectorRecords',canonical_definition_sha256=sha(C/'proof/coq/VectorRecords.v'),definition_export_module='ArgmaxPool.neon_record_compare_def',definition_export_sha256=sha(C/'proof/coq/neon_record_compare_def.v'))
  dest=C/'proof/coq/neon_record_compare_goal.v'
  if dest.exists():assert dest.read_bytes()==goal.read_bytes(),'existing actual goal changed'
  else:dest.write_bytes(goal.read_bytes())
 except Exception as e:s['error']=str(e)
 (run/'status.json').write_text(json.dumps(s,indent=2)+'\n');out=C/'proof/neon-record-compare-generation-status.json'
 if out.exists():(C/'proof/history'/('neon-record-compare-generation-'+sha(out)+'.json')).write_bytes(out.read_bytes())
 out.write_bytes((run/'status.json').read_bytes());print(json.dumps({k:s.get(k)for k in ['passed','run_directory','actual_C_fields','error']}),flush=True);return 0 if s['passed']else 1
if __name__=='__main__':raise SystemExit(main())
