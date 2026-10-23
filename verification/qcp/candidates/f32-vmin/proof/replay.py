#!/usr/bin/env python3
"""Replay original or repaired C with unchanged architecture-specific min/max semantics."""
from pathlib import Path
from datetime import datetime,timezone
import argparse
import hashlib
import json
import os
import platform
import shutil
import subprocess
import tempfile
import time

HERE=Path(__file__).resolve().parent;CASE=HERE.parent
ROOT=next(p for p in CASE.parents if(p/'.git').exists())
EXPECTED={
 'f32-vmin':{'neon':'e7c9e8d03d5bd59bcb91167285c54565a571a406eae8fb9554e86a639a1e7be1','rvv':'76fd6aefcbf9f82bf36ead665072d3a24285c1dc63e87ec17e66efa8af39949e','repaired':'1ced2ed27e53c16b97d914c6ce0190b4526bb105299e8573f822336c8e01261f','patch':'c170cd7925a11ec21067145e1ad384d7577aabdb72c515d8d496efdda68c935f'},
 'f32-vmax':{'neon':'09e27c12a074f0ebac6fb78c055dc8244be915827771359afa16f70527360552','rvv':'29040b9201bb2a4150f6fc2d1c69fceda44b60ad683f813a02dc83ac69ec3af6','repaired':'c41a4a25edf0ac21c2c6422f98be7251610ab779ea5e96a85d3745f237d7b373','patch':'4ae5a62801a5f62b1b608bd5fdab4f404fa276f0d8e9477bc9300a0bd5c8896d'},
}
def sha(p):return hashlib.sha256(Path(p).read_bytes()).hexdigest()
def audit():
 lock=json.loads((HERE/'originals.json').read_text());expected=EXPECTED[CASE.name]
 if lock['upstream_commit']!='be16280c7812a7459c26c3ce82a47339a3d07718':raise ValueError('Original upstream lock changed')
 identities={}
 for side,name,folder in [('neon','testNEON.c','source'),('rvv','testRVV.c','target')]:
  source=ROOT/f'kernels/{folder}/{CASE.name}.c'
  if sha(source)!=expected[side]:raise ValueError('Upstream original identity changed: '+side)
  identities[side]={'path':str(source.relative_to(ROOT)),'copy':'impl/'+name,'sha256':expected[side]}
 if lock['files']!=identities:raise ValueError('Original identity record changed')
 if sha(CASE/'impl/testNEON.c')!=expected['neon']:raise ValueError('NEON source changed')
 return identities
def main():
 parser=argparse.ArgumentParser(description=__doc__);parser.add_argument('--variant',choices=['original','repaired'],default='repaired');args=parser.parse_args()
 build=CASE/'.build';build.mkdir(exist_ok=True);run=Path(tempfile.mkdtemp(prefix='native-'+args.variant+'-',dir=build))
 status={'status':'pending_replay','variant':args.variant,'kernel':CASE.name,'replay_passed':False,
  'fresh_utc':datetime.now(timezone.utc).isoformat(),'run_directory':str(run),'records':[],
  'scope':'Finite native C-shim replay, not Arm/RVV hardware execution or formal kernel correctness.',
  'complete_qcp_kernel_proofs':0,'observation':'Numerical equality or both NaN; payload and zero sign ignored publicly, known-bit oracle checks zero sign separately.'}
 try:
  identities=audit();status['originals']=identities
  expected=EXPECTED[CASE.name];repair=json.loads((HERE/'repair.json').read_text())
  if repair['original_rvv_sha256']!=expected['rvv']or repair['repaired_rvv_sha256']!=expected['repaired']or repair['patch_sha256']!=expected['patch']:raise ValueError('Repair identity record changed')
  if sha(HERE/'repair.patch')!=expected['patch']:raise ValueError('Repair patch changed')
  if sha(CASE/'impl/testRVV.c')!=expected['repaired']:raise ValueError('Current repaired RVV source changed')
  status['host']={'platform':platform.platform(),'machine':platform.machine()};status['repair']=repair
  def execute(command,label,cwd=ROOT):
   command=list(map(str,command));start=time.monotonic()
   env=dict(os.environ,ASAN_OPTIONS='detect_leaks=1:halt_on_error=1:abort_on_error=1',UBSAN_OPTIONS='halt_on_error=1:print_stacktrace=1')
   result=subprocess.run(command,cwd=cwd,env=env,capture_output=True,text=True,timeout=120)
   log=run/(label+'.log');log.write_text(result.stdout+result.stderr)
   status['records'].append({'label':label,'command':command,'cwd':str(cwd),'exit_code':result.returncode,'seconds':time.monotonic()-start,'log':str(log),'log_sha256':sha(log)})
   if result.returncode:raise RuntimeError(label+': '+(result.stdout+result.stderr)[-6000:])
   return result.stdout
  patch_tree=run/'patch-audit';(patch_tree/'impl').mkdir(parents=True)
  original_rvv=ROOT/identities['rvv']['path'];patched=patch_tree/'impl/testRVV.c';shutil.copyfile(original_rvv,patched)
  execute(['patch','--batch','--fuzz=0','-p1','-i',HERE/'repair.patch'],'patch-exact-application',patch_tree)
  if sha(patched)!=expected['repaired']or patched.read_bytes()!=(CASE/'impl/testRVV.c').read_bytes():raise ValueError('Patch does not produce exact repaired implementation')
  status['patch_exact_application_checked']=True
  if args.variant=='original':
   selected=run/'originals';selected.mkdir()
   for side,name in [('neon','testNEON.c'),('rvv','testRVV.c')]:shutil.copyfile(ROOT/identities[side]['path'],selected/name)
   neon=selected/'testNEON.c';rvv=selected/'testRVV.c'
   if sha(neon)!=expected['neon']or sha(rvv)!=expected['rvv']:raise ValueError('Original replay snapshot differs')
  else:neon=CASE/'impl/testNEON.c';rvv=CASE/'impl/testRVV.c'
  status['selected_sources']={'neon':{'path':str(neon),'sha256':sha(neon)},'rvv':{'path':str(rvv),'sha256':sha(rvv)}}
  files=[CASE/'spec.c',CASE/'shim/runtime.h',CASE/'shim/harness.c',CASE/'impl/testNEON.c',CASE/'impl/testRVV.c',HERE/'semantics.json',HERE/'originals.json',HERE/'repair.json',HERE/'repair.patch',Path(__file__)]
  inputs={str(p.relative_to(CASE)):sha(p)for p in files};(run/'inputs.json').write_text(json.dumps(inputs,indent=2)+'\n')
  cc=shutil.which('gcc')
  if not cc:raise RuntimeError('gcc required')
  status['compiler']=subprocess.check_output([cc,'--version'],text=True).splitlines()[0]
  binary=run/'replay';flags=['-std=c11','-O1','-g','-fno-pie','-no-pie','-fno-omit-frame-pointer','-fno-fast-math','-ffp-contract=off','-frounding-math','-fsanitize=address,undefined','-fno-sanitize-recover=all','-include',CASE/'shim/runtime.h']
  if CASE.name=='f32-vmin':flags+=['-DCASE_MINIMUM']
  if args.variant=='repaired':flags+=['-DREPAIRED_VARIANT']
  execute([cc,*flags,CASE/'shim/harness.c',CASE/'spec.c',neon,rvv,'-lm','-o',binary],'build')
  output=execute([binary],'replay');records=[json.loads(x)for x in output.splitlines()];summary=records[-1];cases=records[:-1]
  expected_divergence=154 if args.variant=='original'else 0
  if summary['kind']!='summary'or not summary['replay_passed']or len(cases)!=275 or summary['counterexamples']!=expected_divergence:raise RuntimeError('Incomplete expanded replay')
  if not all(x['frame_preserved']and x['all_lanes_match_known_oracle']for x in cases):raise RuntimeError('Missing oracle/frame evidence')
  if args.variant=='repaired'and any(x['equivalent_return']!=1 for x in cases):raise RuntimeError('Repaired output mismatch')
  if {x['n']for x in cases}!={1,2,3,4,5,31,32,33,63,64,65}:raise RuntimeError('Boundary coverage changed')
  audit()
  if any(sha(CASE/rel)!=digest for rel,digest in inputs.items()):raise RuntimeError('Replay source changed during execution')
  status.update(status='counterexample'if args.variant=='original'else'repaired_native_checked',replay_passed=True,cases=summary['cases'],
    counterexamples=[x for x in cases if x['equivalent_return']==0],representative_results=[x for x in cases if x['n']==1],
    primitive_checks=summary['primitive_checks'],asan_ubsan_checked=True,wrong_result_rejected=summary['wrong_result_rejected'],
    input_and_padding_frame_preserved=True,output_prefix_suffix_frame_preserved=True,params_frame_preserved=True,
    input_hashes=inputs,execution_concurrency=1,actual_hardware_executed=False,
    oracle='Independent literal expected output bits for both original and repaired variants, including sNaN/qNaN/Inf/zeros.',
    limits=['No complete QCP proof or hardware execution','NaN payload/sign differ and are outside requested observation','Unconditional RVV addition can change exception flags; flags/traps remain outside observation'])
 except Exception as exc:status.update(status='replay_failure',replay_passed=False,error=str(exc));raise
 finally:
  (run/'status.json').write_text(json.dumps(status,ensure_ascii=False,indent=2)+'\n')
  (HERE/(args.variant+'-replay-status.json')).write_text(json.dumps(status,ensure_ascii=False,indent=2)+'\n')
  if args.variant=='repaired':(HERE/'replay-status.json').write_text(json.dumps(status,ensure_ascii=False,indent=2)+'\n')
 print(json.dumps({'kernel':CASE.name,'variant':args.variant,'status':status['status'],'cases':status['cases'],'counterexamples':len(status['counterexamples']),'run':str(run)}))
if __name__=='__main__':main()
