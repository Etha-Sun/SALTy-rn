#!/usr/bin/env python3
"""Fresh actual ordinary tuple first-field reader, without partial-TU slicing."""
from pathlib import Path
import hashlib,json,os,re,shutil,subprocess,tempfile,time
C=Path(__file__).resolve().parents[1]
R=next(p for p in C.parents if(p/'.git').exists())
sha=lambda p:hashlib.sha256(Path(p).read_bytes()).hexdigest()
def main():
 assert not json.loads((R/'.build/memory/quota/state.json').read_text())['wind_down_requested']
 run=Path(tempfile.mkdtemp(prefix='tuple-first-fresh-',dir=C/'.build'));snapshot=run/'input';Q=run/'coq';gen=run/'generated';Q.mkdir();gen.mkdir()
 files=['shim/tuple_first.c','shim/tuple_types.h','proof/coq/TupleFirstChecked.v','proof/check_tuple_first.py'];pins={p:sha(C/p)for p in files}
 for p in files:
  dst=snapshot/p;dst.parent.mkdir(parents=True,exist_ok=True);shutil.copy2(C/p,dst)
 records=[];s={'passed':False,'whole_kernel_verified':False,'scope':'Actual complete single ordinary tuple first-reader translation unit; no SIMD-kernel credit','run_directory':str(run),'input_sha256':pins,'records':records,'configured_jobs':32,'max_live_processes':1,'per_process_memory_GiB':16,'timeout_seconds':7200}
 env={**os.environ,'PATH':str(R/'.build/simple-kernels-bootstrap/bin')+':/tmp/qcp-coq820-install/bin:'+os.environ['PATH']}
 def execute(label,command):
  cmd=['prlimit','--as=17179869184:17179869184','--',*map(str,command)];log=run/(label+'.log');start=time.monotonic()
  try:
   with log.open('w')as f:rc=subprocess.run(cmd,cwd=run,env=env,stdout=f,stderr=f,timeout=7200).returncode
  except subprocess.TimeoutExpired:rc=124
  records.append({'label':label,'command':cmd,'exit_code':rc,'seconds':time.monotonic()-start,'log_sha256':sha(log)});print(label,rc,flush=True);assert rc==0,(label,log.read_text()[-2500:])
 try:
  expanded=run/'tuple_first.c';execute('cpp',['gcc','-E','-P','-CC','-nostdinc',snapshot/'shim/tuple_first.c','-o',expanded]);execute('qcp',['qcp','--arch=64','--endian=little','--no-exec-info','--input-file='+str(expanded),'--coq-output-dir='+str(gen),'--coq-logic-path=X32Packw','-slp',snapshot/'shim','X32Packw'])
  goal=gen/'tuple_first_goal.v';fields=re.findall(r'^Axiom proof_of_(\w+)\s*:',goal.read_text(),re.M);assert len(fields)==2
  shutil.copy2(goal,Q/goal.name);shutil.copy2(snapshot/'proof/coq/TupleFirstChecked.v',Q/'TupleFirstChecked.v')
  cfg=json.loads((R/'.build/simple-kernels-bootstrap/coq-flags.json').read_text());dep=R/'verification/qcp/verified/f32-vadd/.build/full-1f5wequq/coq';flags=cfg['flags']+sum((['-Q',str(p),''if p.name=='relations'else p.name]for p in sorted(dep.iterdir())if p.is_dir()),[])+['-Q',str(Q),'X32Packw']
  for name in ['tuple_first_goal','TupleFirstChecked']:execute(name,[*flags,Q/(name+'.v')])
  reports=len(re.findall(r'^(?:Axioms:|Closed under the global context)',(run/'TupleFirstChecked.log').read_text(),re.M));assert reports==2
  assert pins=={p:sha(C/p)for p in files}
  s.update(passed=True,actual_C_fields=2,fresh_local_modules=2,Print_reports=2,second_exact_ascription=True,checked_module='X32Packw.TupleFirstChecked.CheckedTupleFirst',cpp_sha256=sha(expanded),goal_sha256=sha(goal),proof_sha256=sha(Q/'TupleFirstChecked.v'))
  assert(C/'proof/coq'/goal.name).read_bytes()==goal.read_bytes()
 except Exception as error:s['error']=str(error)
 (run/'status.json').write_text(json.dumps(s,indent=2)+'\n');target=C/'proof/tuple-first-status.json'
 if target.exists():
  history=C/'proof/history';history.mkdir(exist_ok=True);shutil.copy2(target,history/(target.stem+'-'+sha(target)+'.json'))
 target.write_bytes((run/'status.json').read_bytes());print(json.dumps({k:v for k,v in s.items()if k not in ['input_sha256','records']},indent=2));raise SystemExit(not s['passed'])
if __name__=='__main__':main()
