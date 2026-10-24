#!/usr/bin/env python3
"""Fresh actual C initialized written-output reader, ordinary typed Coq; component only."""
from pathlib import Path
import argparse,hashlib,json,os,re,shutil,subprocess,tempfile,time
C=Path(__file__).resolve().parents[1]
R=next(p for p in C.parents if (p/'.git').exists())
def sha(p):return hashlib.sha256(Path(p).read_bytes()).hexdigest()
def main():
 ap=argparse.ArgumentParser();ap.add_argument('--config',type=Path,required=True);a=ap.parse_args()
 run=Path(tempfile.mkdtemp(prefix='written-read-fresh-',dir=C/'.build'));coq=run/'coq';coq.mkdir();gen=run/'generated';gen.mkdir()
 mods=['FmaModel','MemoryModel','MemoryFacts','OutputMemory','MemoryInterface','OutputReadModel','WrittenReadModel']
 inputs=['proof/check_written_read.py','shim/written_read.c','shim/written_read.h','shim/output_read.h','shim/memory.h','shim/types.h','proof/coq/WrittenReadChecked.v','proof/coq/written_read_goal.v']+['proof/coq/'+n+'.v'for n in mods]
 before={p:sha(C/p)for p in inputs};records=[]
 state=dict(passed=False,whole_kernel_verified=False,scope='actual initialized written-output reader component only',run_directory=str(run),input_sha256=before,records=records,per_process_memory_GiB=16,configured_jobs=32,max_live_processes=1)
 env=os.environ.copy();env['PATH']=str(R/'.build/simple-kernels-bootstrap/bin')+':/tmp/qcp-coq820-install/bin:'+env['PATH'];flags=json.loads(a.config.read_text())['flags']+['-Q',str(coq),'Dwconv']
 def call(label,cmd):
  cmd=['prlimit','--as=17179869184:17179869184','--',*map(str,cmd)];log=run/(label+'.log');t=time.monotonic()
  try:
   with log.open('w')as f:p=subprocess.run(cmd,cwd=run,env=env,stdout=f,stderr=f,timeout=7200)
   code=p.returncode
  except subprocess.TimeoutExpired:code=124
  records.append(dict(label=label,command=cmd,exit_code=code,seconds=time.monotonic()-t,log_sha256=sha(log)));(run/'status.json').write_text(json.dumps(state,indent=2)+'\n');print(label,code,flush=True)
  assert code==0,log.read_text()[-3000:]
 try:
  for n in mods:
   shutil.copy2(C/'proof/coq'/(n+'.v'),coq/(n+'.v'));call(n,[*flags,coq/(n+'.v')])
  call('cpp',['gcc','-E','-P','-CC','-nostdinc',C/'shim/written_read.c','-o',run/'written_read.i'])
  call('qcp',['qcp','--arch=64','--endian=little','--no-float-finite-vc','--no-exec-info','--input-file='+str(run/'written_read.i'),'--coq-output-dir='+str(gen),'--coq-logic-path=Dwconv','-slp',C/'shim','Dwconv'])
  goal=gen/'written_read_goal.v';assert sha(goal)==sha(C/'proof/coq/written_read_goal.v'),'actual generated goal changed'
  fields=re.findall(r'^Axiom proof_of_(\w+)\s*:',goal.read_text(),re.M);assert len(fields)==2
  shutil.copy2(goal,coq/goal.name);call('written_read_goal',[*flags,coq/goal.name])
  shutil.copy2(C/'proof/coq/WrittenReadChecked.v',coq/'WrittenReadChecked.v');call('WrittenReadChecked',[*flags,coq/'WrittenReadChecked.v'])
  assert all(sha(C/p)==h for p,h in before.items()),'component inputs changed'
  state.update(passed=True,actual_c_vcs=len(fields),fields=fields,checked_module='Dwconv.WrittenReadChecked.CheckedWrittenRead',goal_sha256=sha(goal),cpp_sha256=sha(run/'written_read.i'),no_component_vo_reused=True,ordinary_assumptions_log_sha256=sha(run/'WrittenReadChecked.log'))
 except Exception as e:state['error']=str(e)
 (run/'status.json').write_text(json.dumps(state,indent=2)+'\n');dest=C/'proof/written-read-status.json'
 if dest.exists():(C/'proof/history'/('written-read-status-'+sha(dest)+'.json')).write_bytes(dest.read_bytes())
 dest.write_bytes((run/'status.json').read_bytes());print(run,flush=True);raise SystemExit(0 if state['passed']else 1)
if __name__=='__main__':main()
