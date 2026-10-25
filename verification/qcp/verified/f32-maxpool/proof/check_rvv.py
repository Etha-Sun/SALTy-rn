#!/usr/bin/env python3
"""Assemble the actual268-field RVV VC_Correct with explicit checked218 core.

All remaining memory modules compile from .v in the same coherent namespace;
whole-case source-only regeneration/recompilation remains a separate gate.
"""
from pathlib import Path
import argparse,hashlib,json,os,re,shutil,subprocess,tempfile,threading,time
from check_neon import imports
from parallel import compile_modules
C=Path(__file__).resolve().parents[1]
def sha(p):return hashlib.sha256(Path(p).read_bytes()).hexdigest()
def main():
 p=argparse.ArgumentParser();p.add_argument('--config',type=Path,required=True);p.add_argument('--jobs',type=int,default=32);p.add_argument('--live-jobs',type=int,default=4);p.add_argument('--timeout',type=int,default=7200);a=p.parse_args();assert 1<=a.live_jobs<=a.jobs<=32
 quota=json.loads(Path('/srv/home/yuechunsun/tools/qcp-simple-kernels/.build/memory/quota/state.json').read_text());assert not quota.get('wind_down_requested')
 source='From MaxPool Require Import RvvNonMemory RvvMemory.\nModule CheckedRvv : MaxPool.rvv_unit_goal.VC_Correct.\nInclude MaxPool.RvvNonMemory.CheckedRvvNonMemory.\nInclude MaxPool.RvvMemory.CheckedRvvMemory.\nEnd CheckedRvv.\n';(C/'proof/coq/RvvChecked.v').write_text(source)
 goal=C/'proof/coq/rvv_unit_goal.v';fields=re.findall(r'^Axiom proof_of_(\w+)\s*:',goal.read_text(),re.M);assert len(fields)==268
 gate='From MaxPool Require Import RvvChecked.\nModule ExactRvv:MaxPool.rvv_unit_goal.VC_Correct:=MaxPool.RvvChecked.CheckedRvv.\n'+''.join('Definition typed_'+f+':MaxPool.rvv_unit_goal.'+f+':=MaxPool.RvvChecked.CheckedRvv.proof_of_'+f+'.\nPrint Assumptions typed_'+f+'.\n'for f in fields);(C/'proof/coq/RvvGate.v').write_text(gate)
 nonmemory=json.loads((C/'proof/rvv-nonmemory-status.json').read_text());memory=json.loads((C/'proof/rvv-memory-status.json').read_text());assert nonmemory['passed']and memory['passed'];assert nonmemory['checked_c_vcs']==218
 assert all(sha(C/f)==v for f,v in nonmemory['input_sha256'].items())
 base=Path(nonmemory['run_directory'])/'coq';r=Path(tempfile.mkdtemp(prefix='rvv-proof-',dir=C/'.build'));coq=r/'coq';coq.mkdir();cloned={};inputs={'proof/check_rvv.py':sha(__file__),'proof/check_neon.py':sha(C/'proof/check_neon.py'),'proof/parallel.py':sha(C/'proof/parallel.py'),'proof/rvv-nonmemory-status.json':sha(C/'proof/rvv-nonmemory-status.json'),'proof/rvv-memory-status.json':sha(C/'proof/rvv-memory-status.json')}
 for f in sorted(base.glob('*.v')):
  n=f.stem;pub=C/'proof/coq'/f.name;assert pub.read_bytes()==f.read_bytes(),n;assert f.with_suffix('.vo').exists(),n
  for ext in ['.v','.vo']:shutil.copy2(base/(n+ext),coq/(n+ext))
  cloned[n]={'source_sha256':sha(f),'vo_sha256':sha(f.with_suffix('.vo'))};inputs[str(pub.relative_to(C))]=sha(pub)
 new=set()
 def visit(n):
  pub=C/'proof/coq'/(n+'.v');assert pub.is_file(),n
  if n in cloned:assert sha(pub)==cloned[n]['source_sha256'];return
  if n in new:return
  new.add(n);shutil.copy2(pub,coq/pub.name);inputs[str(pub.relative_to(C))]=sha(pub)
  for d in imports(pub.read_text()):visit(d)
 visit('RvvGate');records=[];cv=threading.Condition();lock=threading.Lock();active=0;peak=0;ctl=r/'live-limit.json';ctl.write_text(json.dumps({'live_jobs':a.live_jobs})+'\n')
 s=dict(passed=False,whole_kernel_verified=False,vc_correct_passed=False,scope='actual268-field RVV kernel typed assembly; explicit source-checked218 dependencies reused, all memory/new assembly sources ordinary compiled; whole source-only case gate pending',run_directory=str(r),configured_jobs=a.jobs,initial_live_jobs=a.live_jobs,per_process_memory_GiB=16,timeout_seconds=a.timeout,input_sha256=inputs,cloned_modules=cloned,new_modules=sorted(new),records=records,goal_sha256=sha(goal),checked_c_vcs=268,actual_fields=fields)
 def save():(r/'status.json').write_text(json.dumps(s,indent=2)+'\n')
 flags=json.loads(a.config.read_text())['flags'][2:]+['-Q',str(coq),'MaxPool','-time'];os.environ['PATH']='/srv/home/yuechunsun/tools/qcp-simple-kernels/.build/simple-kernels-bootstrap/bin:/tmp/qcp-coq820-install/bin:'+os.environ['PATH']
 def execute(cmd,label,unused):
  nonlocal active,peak
  start=time.monotonic()
  with cv:
   while active>=json.loads(ctl.read_text())['live_jobs']:cv.wait(timeout=.25)
   active+=1;peak=max(peak,active)
  begin=time.monotonic();log=r/(label+'.log');wrapped=['prlimit','--as=17179869184:17179869184','--',*map(str,cmd)]
  try:
   with log.open('w')as out:z=subprocess.run(wrapped,cwd=r,stdout=out,stderr=out,timeout=a.timeout).returncode
  except subprocess.TimeoutExpired:z=124
  finally:
   with cv:active-=1;cv.notify_all()
  with lock:records.append(dict(label=label,command=wrapped,exit_code=z,seconds=time.monotonic()-begin,admission_wait_seconds=begin-start,source_sha256=sha(Path(cmd[-1])),log_sha256=sha(log)));s['peak_actual_live_jobs']=peak;save()
  assert z==0,label+' failed: '+str(log)
 save();print(r,flush=True)
 try:
  mods=[dict(path='coq/'+n+'.v',namespace='MaxPool',name=n)for n in sorted(new)];compile_modules(mods,r,flags,execute,a.jobs)
  assert all(sha(C/f)==v for f,v in inputs.items()),'input drift'
  assert(r/'MaxPool-RvvGate.log').read_text().count('Print~Assumptions~typed_')==268
  s.update(passed=True,vc_correct_passed=True,checked_module='MaxPool.RvvChecked.CheckedRvv',ordinary_new_modules=len(records),typed_gate_sha256=sha(coq/'RvvGate.v'),final_assumptions_log_sha256=sha(r/'MaxPool-RvvGate.log'),actual_field_Print_reports=268)
 except Exception as e:s['error']=str(e)
 save();dst=C/'proof/rvv-proof-status.json'
 if dst.exists():(C/'proof/history'/('rvv-proof-status-'+sha(dst)+'.json')).write_bytes(dst.read_bytes())
 dst.write_bytes((r/'status.json').read_bytes());print(json.dumps({k:s.get(k)for k in ['passed','run_directory','error']}),flush=True);return 0 if s['passed']else 1
if __name__=='__main__':raise SystemExit(main())
