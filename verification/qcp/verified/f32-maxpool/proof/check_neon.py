#!/usr/bin/env python3
"""Fresh source-only closure of the actual 442-field NEON function interface.

This kernel component still needs the whole-case callees and paired RVV gate.
No previous case/component objects are imported from .build directories.
"""
from pathlib import Path
import argparse,hashlib,json,os,re,shutil,subprocess,tempfile,threading,time
from parallel import compile_modules
C=Path(__file__).resolve().parents[1]
def sha(p):return hashlib.sha256(Path(p).read_bytes()).hexdigest()
def imports(text):
 out=set()
 for m in re.finditer(r'From\s+MaxPool\s+Require\s+(?:Import|Export)\s+([^.]*)\.',text,re.S):out.update(m[1].split())
 for m in re.finditer(r'(?<!From )Require\s+(?:Import|Export)\s+([^.]*(?:\.[^.]*)*)\.',text):
  out.update(re.findall(r'MaxPool\.([A-Za-z_][A-Za-z_0-9]*)',m[0]))
 # The direct qualified form commonly has one module per command.
 out.update(re.findall(r'\bRequire\s+(?:Import|Export)\s+MaxPool\.(\w+)\s*\.',text))
 return out

def main():
 p=argparse.ArgumentParser();p.add_argument('--config',type=Path,required=True);p.add_argument('--jobs',type=int,default=32);p.add_argument('--live-jobs',type=int,default=4);p.add_argument('--timeout',type=int,default=7200);a=p.parse_args();assert 1<=a.live_jobs<=a.jobs<=32
 q=Path('/srv/home/yuechunsun/tools/qcp-simple-kernels/.build/memory/quota/state.json')
 if q.exists():assert not json.loads(q.read_text()).get('wind_down_requested'),'quota wind down requested'
 generation=json.loads((C/'proof/neon-generation-status.json').read_text());assert generation['generation_passed']
 goal=C/'proof/coq/neon_unit_goal.v';assert sha(goal)==generation['goal_sha256']=='8a30b8c57e398919212fa3b8a6f7136879968d9f5cbacdcdf4eef56a6194f802'
 fields=re.findall(r'^Axiom proof_of_(\w+)\s*:',goal.read_text(),re.M);assert len(fields)==442
 needed=set();visiting=set();deps={}
 def visit(n):
  if n in needed:return
  assert n not in visiting,'cycle '+n
  f=C/'proof/coq'/(n+'.v');assert f.is_file(),'missing source '+n
  visiting.add(n);ds=imports(f.read_text());deps[n]=sorted(ds)
  for d in ds:visit(d)
  visiting.remove(n);needed.add(n)
 visit('NeonGate');assert {'NeonLoopResource','NeonMemoryRoot','NeonMemory','NeonChecked','neon_unit_goal'}<=needed
 r=Path(tempfile.mkdtemp(prefix='neon-proof-',dir=C/'.build'));coq=r/'coq';coq.mkdir();inputs={'proof/check_neon.py':sha(__file__),'proof/parallel.py':sha(C/'proof/parallel.py'),'proof/neon-generation-status.json':sha(C/'proof/neon-generation-status.json')}
 for n in sorted(needed):
  f=C/'proof/coq'/(n+'.v');shutil.copy2(f,coq/f.name);inputs[str(f.relative_to(C))]=sha(f)
 assert not list(coq.glob('*.vo'))
 control=r/'live-limit.json';control.write_text(json.dumps(dict(live_jobs=a.live_jobs))+'\n');cv=threading.Condition();active=0;peak=0;lock=threading.Lock();records=[]
 s=dict(passed=False,whole_kernel_verified=False,vc_correct_passed=False,scope='fresh source-only ordinary Coq actual NEON 442-field body component; whole-case callees/pair still pending',run_directory=str(r),configured_jobs=a.jobs,initial_live_jobs=a.live_jobs,memory_GiB=16,timeout_seconds=a.timeout,goal_sha256=sha(goal),input_sha256=inputs,local_modules=sorted(needed),local_dag=deps,records=records,cloned_objects=[],actual_fields=fields,checked_c_vcs=442)
 def save():(r/'status.json').write_text(json.dumps(s,indent=2)+'\n')
 def execute(cmd,label,unused):
  nonlocal active,peak
  start=time.monotonic()
  with cv:
   while active>=json.loads(control.read_text())['live_jobs']:cv.wait(timeout=.25)
   active+=1;peak=max(peak,active)
  begin=time.monotonic();log=r/(label+'.log');command=['prlimit','--as=17179869184:17179869184','--',*map(str,cmd)]
  try:
   with log.open('w')as out:z=subprocess.run(command,cwd=r,stdout=out,stderr=out,timeout=a.timeout).returncode
  except subprocess.TimeoutExpired:z=124
  finally:
   with cv:active-=1;cv.notify_all()
  record=dict(label=label,command=command,exit_code=z,seconds=time.monotonic()-begin,admission_wait_seconds=begin-start,log_sha256=sha(log),source_sha256=sha(cmd[-1]))
  with lock:records.append(record);s['peak_actual_live_jobs']=peak;save()
  if z:raise RuntimeError(label+' failed '+str(z)+'; see '+str(log))
 flags=json.loads(a.config.read_text())['flags'];assert flags[:2]==['qcp-env','coqc'];flags=flags[2:]+['-Q',str(coq),'MaxPool','-time'];os.environ['PATH']='/srv/home/yuechunsun/tools/qcp-simple-kernels/.build/simple-kernels-bootstrap/bin:/tmp/qcp-coq820-install/bin:'+os.environ['PATH']
 save();print(r,flush=True)
 try:
  modules=[dict(path='coq/'+n+'.v',namespace='MaxPool',name=n)for n in sorted(needed)]
  compile_modules(modules,r,flags,execute,a.jobs)
  assert inputs=={f:sha(C/f)for f in inputs},'input drift'
  assert all(x['exit_code']==0 for x in records)and len(records)==len(needed)
  log=r/'MaxPool-NeonGate.log';assert log.read_text().count('Print~Assumptions~typed_')==442,'missing exact field Print reports'
  s.update(passed=True,vc_correct_passed=True,checked_module='MaxPool.NeonChecked.CheckedNeon',ordinary_compiled_modules=len(records),all_sources_fresh=True,typed_gate_sha256=sha(coq/'NeonGate.v'),gate_log_sha256=sha(log),actual_field_Print_reports=442)
 except Exception as e:s['error']=str(e)
 save();dst=C/'proof/neon-proof-status.json'
 if dst.exists():(C/'proof/history'/('neon-proof-status-'+sha(dst)+'.json')).write_bytes(dst.read_bytes())
 dst.write_bytes((r/'status.json').read_bytes());print(json.dumps({k:s.get(k)for k in ['passed','run_directory','error']}),flush=True);return 0 if s['passed']else 1
if __name__=='__main__':raise SystemExit(main())
