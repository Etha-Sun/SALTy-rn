#!/usr/bin/env python3
"""Fresh counterexample replay of original C with distinct architecture shims."""
from pathlib import Path
from datetime import datetime, timezone
import hashlib
import json
import os
import platform
import shutil
import subprocess
import tempfile
import time

HERE=Path(__file__).resolve().parent
CASE=HERE.parent
ROOT=next(p for p in CASE.parents if (p/'.git').exists())
EXPECTED={
 'f32-vmin':{'neon':'e7c9e8d03d5bd59bcb91167285c54565a571a406eae8fb9554e86a639a1e7be1','rvv':'76fd6aefcbf9f82bf36ead665072d3a24285c1dc63e87ec17e66efa8af39949e'},
 'f32-vmax':{'neon':'09e27c12a074f0ebac6fb78c055dc8244be915827771359afa16f70527360552','rvv':'29040b9201bb2a4150f6fc2d1c69fceda44b60ad683f813a02dc83ac69ec3af6'},
}
def sha(p):return hashlib.sha256(Path(p).read_bytes()).hexdigest()
def audit():
 lock=json.loads((HERE/'originals.json').read_text())
 if lock['upstream_commit']!='be16280c7812a7459c26c3ce82a47339a3d07718':raise ValueError('Source commit lock changed')
 result={}
 for side,name,folder in [('neon','testNEON.c','source'),('rvv','testRVV.c','target')]:
  source=ROOT/f'kernels/{folder}/{CASE.name}.c';copy=CASE/'impl'/name
  expected=EXPECTED[CASE.name][side]
  if sha(source)!=expected or sha(copy)!=expected or source.read_bytes()!=copy.read_bytes():
   raise ValueError('Original source identity mismatch: '+side)
  result[side]={'path':str(source.relative_to(ROOT)),'copy':str(copy.relative_to(CASE)),'sha256':expected}
 if lock['files']!=result:raise ValueError('Original source identity record changed')
 return result
def main():
 evidence=CASE/'.build';evidence.mkdir(exist_ok=True)
 run=Path(tempfile.mkdtemp(prefix='native-',dir=evidence))
 status={'status':'pending_replay','replay_passed':False,'kernel':CASE.name,
  'fresh_utc':datetime.now(timezone.utc).isoformat(),'run_directory':str(run),
  'scope':'Native C-shim replay under the declared semantics; not actual Arm/RVV execution or complete formal verification.',
  'complete_qcp_kernel_proofs':0,'records':[]}
 try:
  status['originals']=audit()
  files=[CASE/'spec.c',CASE/'shim/runtime.h',CASE/'shim/harness.c',CASE/'impl/testNEON.c',CASE/'impl/testRVV.c',
         HERE/'semantics.json',HERE/'originals.json',Path(__file__)]
  inputs={str(p.relative_to(CASE)):sha(p) for p in files}
  (run/'inputs.json').write_text(json.dumps(inputs,indent=2)+'\n')
  status['host']={'platform':platform.platform(),'machine':platform.machine()}
  cc=shutil.which('gcc')
  if not cc:raise RuntimeError('gcc is required')
  status['compiler']=subprocess.check_output([cc,'--version'],text=True).splitlines()[0]
  def execute(command,label):
   command=list(map(str,command));started=time.monotonic()
   env=dict(os.environ,ASAN_OPTIONS='detect_leaks=1:halt_on_error=1:abort_on_error=1',UBSAN_OPTIONS='halt_on_error=1:print_stacktrace=1')
   result=subprocess.run(command,cwd=ROOT,env=env,capture_output=True,text=True,timeout=120)
   log=run/(label+'.log');log.write_text(result.stdout+result.stderr)
   status['records'].append({'label':label,'command':command,'exit_code':result.returncode,'seconds':time.monotonic()-started,'log_sha256':sha(log),'log':str(log)})
   if result.returncode:raise RuntimeError(label+' failed: '+(result.stdout+result.stderr)[-5000:])
   return result.stdout
  binary=run/'replay'
  flags=['-std=c11','-O1','-g','-fno-pie','-no-pie','-fno-omit-frame-pointer','-fno-fast-math',
         '-ffp-contract=off','-frounding-math','-fsanitize=address,undefined','-fno-sanitize-recover=all',
         '-include',CASE/'shim/runtime.h']
  if CASE.name=='f32-vmin':flags+=['-DCASE_MINIMUM']
  execute([cc,*flags,CASE/'shim/harness.c',CASE/'spec.c',CASE/'impl/testNEON.c',CASE/'impl/testRVV.c','-o',binary],'build')
  output=execute([binary],'replay')
  records=[json.loads(line) for line in output.splitlines()]
  examples=[r for r in records if r['kind']=='counterexample'];summary=records[-1]
  if summary['kind']!='summary' or not summary['replay_passed'] or len(examples)!=44:
   raise RuntimeError('Expected complete fresh known-bit replay record')
  if {x['n'] for x in examples}!={1,2,3,4,5,31,32,33,63,64,65}:raise RuntimeError('Missing length boundary')
  if not all(x['frame_preserved'] and x['all_lanes_match_known_oracle'] and x['equivalent_return']==0 for x in examples):
   raise RuntimeError('Invalid counterexample record')
  audit()
  if any(sha(CASE/rel)!=digest for rel,digest in inputs.items()):raise RuntimeError('Inputs changed during replay')
  status.update(status='counterexample',replay_passed=True,cases=summary['cases'],counterexamples=examples,
    input_hashes=inputs,asan_ubsan_checked=True,input_and_padding_frame_preserved=True,
    params_frame_preserved=True,output_prefix_suffix_frame_preserved=True,
    oracle='Independent table of known exact output bit patterns; no shim computation used for expected results.',
    observation='Numerical equality or both NaN; NaN-versus-finite is rejected.',
    explanation='Arm FMIN/FMAX propagates the qNaN; RVV vfmin/vfmax returns the numeric operand when exactly one operand is NaN.',
    actual_hardware_executed=False,execution_concurrency=1)
 except Exception as exc:
  status.update(status='replay_failure',replay_passed=False,error=str(exc));raise
 finally:
  (run/'status.json').write_text(json.dumps(status,ensure_ascii=False,indent=2)+'\n')
  (HERE/'replay-status.json').write_text(json.dumps(status,ensure_ascii=False,indent=2)+'\n')
 print(json.dumps({'kernel':CASE.name,'status':status['status'],'replay_passed':status['replay_passed'],
   'cases':status['cases'],'counterexamples':len(status['counterexamples']),'evidence':str(run)}))
if __name__=='__main__':main()
