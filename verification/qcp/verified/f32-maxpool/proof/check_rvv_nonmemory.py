#!/usr/bin/env python3
"""Check all218 actual non-resource RVV fields on an explicit coherent bundle."""
from pathlib import Path
import argparse,concurrent.futures,hashlib,json,os,re,shutil,subprocess,tempfile,threading,time
from check_neon import imports
C=Path(__file__).resolve().parents[1]
def sha(p):return hashlib.sha256(Path(p).read_bytes()).hexdigest()
def main():
 p=argparse.ArgumentParser();p.add_argument('--config',type=Path,required=True);p.add_argument('--core',type=Path,required=True);p.add_argument('--jobs',type=int,default=32);p.add_argument('--live-jobs',type=int,default=8);p.add_argument('--timeout',type=int,default=7200);a=p.parse_args();assert 1<=a.live_jobs<=a.jobs<=32
 q=Path('/srv/home/yuechunsun/tools/qcp-simple-kernels/.build/memory/quota/state.json');assert not json.loads(q.read_text()).get('wind_down_requested')
 g=C/'proof/coq/rvv_unit_goal.v';generation=json.loads((C/'proof/rvv-generation-status.json').read_text());assert generation['generation_passed']and sha(g)==generation['goal_sha256']
 fields=[f for f in re.findall(r'^Axiom proof_of_(\w+)\s*:',g.read_text(),re.M)if'safety'in f or'partial_solve'in f];assert len(fields)==218
 parts=['RvvNonMemoryPart'+str(i).zfill(2)for i in range(32)]
 source='From MaxPool Require Import '+' '.join(parts)+'.\nModule CheckedRvvNonMemory.\n'+''.join('Include MaxPool.'+n+'.CheckedPart.\n'for n in parts)+'End CheckedRvvNonMemory.\n';(C/'proof/coq/RvvNonMemory.v').write_text(source)
 gate='From MaxPool Require Import RvvNonMemory.\n'+''.join('Definition typed_'+f+':MaxPool.rvv_unit_goal.'+f+':=MaxPool.RvvNonMemory.CheckedRvvNonMemory.proof_of_'+f+'.\n'for f in fields);(C/'proof/coq/RvvNonMemoryGate.v').write_text(gate)
 r=Path(tempfile.mkdtemp(prefix='rvv-nonmemory-',dir=C/'.build'));coq=r/'coq';coq.mkdir();mods=set()
 def visit(n):
  if n in mods:return
  f=C/'proof/coq'/(n+'.v');assert f.read_bytes()==(a.core/f.name).read_bytes(),n;assert(a.core/(n+'.vo')).exists(),n;mods.add(n)
  for d in imports(f.read_text()):visit(d)
 visit('RvvAutomation');bundle={};inputs={'proof/check_rvv_nonmemory.py':sha(__file__),'proof/check_neon.py':sha(C/'proof/check_neon.py'),'proof/rvv-generation-status.json':sha(C/'proof/rvv-generation-status.json')}
 for n in sorted(mods):
  for ext in ['.v','.vo']:shutil.copy2(a.core/(n+ext),coq/(n+ext))
  inputs['proof/coq/'+n+'.v']=sha(coq/(n+'.v'));bundle[n]=dict(source_sha256=sha(coq/(n+'.v')),vo_sha256=sha(coq/(n+'.vo')))
 for n in parts+['RvvNonMemory','RvvNonMemoryGate']:
  f=C/'proof/coq'/(n+'.v');shutil.copy2(f,coq/f.name);inputs[str(f.relative_to(C))]=sha(f)
 control=r/'live-limit.json';control.write_text(json.dumps({'live_jobs':a.live_jobs})+'\n');cv=threading.Condition();live=0;peak=0;lock=threading.Lock();records=[];s=dict(passed=False,whole_kernel_verified=False,vc_correct_passed=False,scope='218-field partial actual RVV body component; explicit coherent dependency objects; full source-only replay pending',run_directory=str(r),configured_jobs=a.jobs,initial_live_jobs=a.live_jobs,per_process_memory_GiB=16,timeout_seconds=a.timeout,goal_sha256=sha(g),input_sha256=inputs,cloned_modules=bundle,records=records,actual_fields=fields,checked_c_vcs=218)
 def save():(r/'status.json').write_text(json.dumps(s,indent=2)+'\n')
 flags=json.loads(a.config.read_text())['flags']+['-Q',str(coq),'MaxPool'];env={**os.environ,'PATH':'/srv/home/yuechunsun/tools/qcp-simple-kernels/.build/simple-kernels-bootstrap/bin:/tmp/qcp-coq820-install/bin:'+os.environ['PATH']}
 def compile(n):
  nonlocal live,peak
  queued=time.monotonic()
  with cv:
   while live>=json.loads(control.read_text())['live_jobs']:cv.wait(timeout=.25)
   live+=1;peak=max(peak,live)
  start=time.monotonic();log=r/(n+'.log');cmd=['prlimit','--as=17179869184:17179869184','--',*flags,'-time',str(coq/(n+'.v'))]
  try:
   with log.open('w')as out:z=subprocess.run(cmd,cwd=r,env=env,stdout=out,stderr=out,timeout=a.timeout).returncode
  except subprocess.TimeoutExpired:z=124
  finally:
   with cv:live-=1;cv.notify_all()
  with lock:records.append(dict(label=n,command=cmd,exit_code=z,seconds=time.monotonic()-start,admission_wait_seconds=start-queued,source_sha256=sha(coq/(n+'.v')),log_sha256=sha(log)));s['peak_actual_live_jobs']=peak;save()
  return z
 save();print(r,flush=True)
 try:
  with concurrent.futures.ThreadPoolExecutor(max_workers=a.jobs)as pool:codes=list(pool.map(compile,parts))
  assert all(z==0 for z in codes),'one or more actual-field parts failed'
  assert compile('RvvNonMemory')==0 and compile('RvvNonMemoryGate')==0
  assert inputs=={f:sha(C/f)for f in inputs},'input drift'
  s.update(passed=True,typed_partial_interface_passed=True,checked_module='MaxPool.RvvNonMemory.CheckedRvvNonMemory',ordinary_compiled_modules=34,field_Print_reports=218)
 except Exception as e:s['error']=str(e)
 save();dst=C/'proof/rvv-nonmemory-status.json'
 if dst.exists():(C/'proof/history'/('rvv-nonmemory-status-'+sha(dst)+'.json')).write_bytes(dst.read_bytes())
 dst.write_bytes((r/'status.json').read_bytes());print(json.dumps({k:s.get(k)for k in ['passed','run_directory','error']}),flush=True);return 0 if s['passed']else 1
if __name__=='__main__':raise SystemExit(main())
