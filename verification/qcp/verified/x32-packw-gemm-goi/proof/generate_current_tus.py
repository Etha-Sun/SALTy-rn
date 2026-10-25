#!/usr/bin/env python3
"""Current13 actual C generation and byte-exact adoption; no Coq proof credit."""
from pathlib import Path
import json,os,re,shutil,subprocess,tempfile,time
from full_inputs import CASE as C,NS,iter_current_unit_texts,sha
import coverage
R=next(p for p in C.parents if(p/'.git').exists())
def main():
 q=json.loads((R/'.build/memory/quota/state.json').read_text());assert not q['wind_down_requested']
 run=Path(tempfile.mkdtemp(prefix='current13-',dir=C/'.build'));records=[];units=[]
 paths=[C/'spec.c',C/'proof/full_inputs.py',Path(__file__)]+[p for root in ['impl','shim']for p in(C/root).rglob('*')if p.is_file()and p.suffix in['.c','.h']]
 pins={str(p.relative_to(C)):sha(p)for p in paths};s=dict(passed=False,whole_kernel_verified=False,scope='current actual C/CPP/generated-goal identity only; not a proof certificate',configured_jobs=32,actual_max_parallel_processes=1,run_directory=str(run),input_sha256=pins,quota_state_at_start=q,records=records,units=units)
 env={**os.environ,'PATH':str(R/'.build/simple-kernels-bootstrap/bin')+':/tmp/qcp-coq820-install/bin:'+os.environ['PATH']}
 def execute(label,cmd,memory=16,timeout=21600):
  cmd=['prlimit','--as='+str(memory*1024**3)+':'+str(memory*1024**3),'--',*map(str,cmd)];log=run/(label+'.log');t=time.monotonic()
  try:
   with log.open('w')as out:code=subprocess.run(cmd,cwd=run,env=env,stdout=out,stderr=out,timeout=timeout).returncode
  except subprocess.TimeoutExpired:code=124
  records.append(dict(label=label,command=cmd,exit_code=code,memory_GiB=memory,timeout_seconds=timeout,seconds=time.monotonic()-t,log_sha256=sha(log)));print(label,code,flush=True);assert code==0,log.read_text()[-2000:]
 try:
  for u in iter_current_unit_texts():
   stem=u['stem'];folder=run/stem;folder.mkdir();src=folder/(stem+'.in.c');src.write_text(u['text']);cpp=folder/(stem+'.c');out=folder/'generated';out.mkdir()
   execute(stem+'-cpp',['gcc','-E','-P','-CC','-nostdinc','-I',C,*u['cpp_flags'],src,'-o',cpp],timeout=300)
   execute(stem+'-qcp',['qcp','--arch=64','--endian=little','--no-float-finite-vc','--no-exec-info','--strategy-application-limit=4096','--input-file='+str(cpp),'--coq-output-dir='+str(out),'--coq-logic-path='+NS,'-slp',C/'shim',NS],memory=32 if stem in['neon_unit','rvv_unit']else 16)
   goal=out/(stem+'_goal.v');fields=re.findall(r'^Axiom proof_of_(\w+)\s*:',goal.read_text(),re.M);assert fields and len(fields)==len(set(fields));old=C/'proof/coq'/goal.name
   units.append(dict(stem=stem,fields=fields,actual_c_vcs=len(fields),functions_defined=sorted(n for n,_,_,edges in coverage._functions(cpp.read_text(),stem)if edges is not None),cpp_sha256=sha(cpp),goal_sha256=sha(goal),previous_goal_sha256=sha(old),goal_bytes_unchanged=old.read_bytes()==goal.read_bytes(),goal_source=str(goal)))
  assert len(units)==13 and sum(u['actual_c_vcs']for u in units)==312
  assert pins=={n:sha(C/n)for n in pins},'C source changed during generation'
  history=C/'proof/history'/run.name;history.mkdir(parents=True)
  for u in units:
   old=C/'proof/coq'/(u['stem']+'_goal.v');shutil.copy2(old,history/old.name);shutil.copy2(u['goal_source'],old)
  s.update(passed=True,actual_c_units=13,actual_c_vcs=312,adopted_byteexact_generated_goals=True)
 except Exception as e:s['error']=str(e)
 (run/'status.json').write_text(json.dumps(s,indent=2)+'\n');dest=C/'proof/current-generation-status.json'
 if dest.exists():shutil.copy2(dest,C/'proof/history'/('current-generation-status-'+sha(dest)+'.json'))
 dest.write_bytes((run/'status.json').read_bytes());print(json.dumps({k:s.get(k)for k in['passed','run_directory','actual_c_units','actual_c_vcs','error']}));return 0 if s['passed']else 1
if __name__=='__main__':raise SystemExit(main())
