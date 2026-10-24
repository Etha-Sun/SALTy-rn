#!/usr/bin/env python3
"""Fresh actual public caller plus source-fresh ordinary typed proof closure."""
from pathlib import Path
import argparse,json,hashlib,os,re,subprocess,tempfile,time
C=Path(__file__).resolve().parents[1];R=next(p for p in C.parents if(p/'.git').exists());sha=lambda p:hashlib.sha256(Path(p).read_bytes()).hexdigest()
def main():
 ap=argparse.ArgumentParser();ap.add_argument('--jobs',type=int,default=32);ap.add_argument('--max-live',type=int,default=2);a=ap.parse_args();assert 0<a.max_live<=a.jobs<=32
 run=Path(tempfile.mkdtemp(prefix='wrapper-fresh-',dir=C/'.build'));gen=run/'generated';gen.mkdir();records=[];files=['proof/check_wrapper.py','proof/check_coq.py','spec.c','shim/public_compare.h','shim/program.h','shim/intrinsics.h','shim/maps.h','shim/control.h','proof/c/dw_maps.strategies','shim/public_wrapper.c','shim/public_wrapper.h','shim/written_read.h','shim/output_read.h','shim/memory.h','shim/types.h','shim/observation.h','proof/c/public_contracts.json']+['proof/coq/'+n+'.v'for n in ['WrapperChecked','CompareSupport','PublicModel','OutputRangeFacts','WrittenReadModel','public_wrapper_goal']];before={p:sha(C/p)for p in files};s=dict(passed=False,whole_kernel_verified=False,scope='actual8 caller component only',run_directory=str(run),input_sha256=before,records=records,configured_jobs=a.jobs,max_live_processes=a.max_live,per_process_memory_GiB=16);env=os.environ.copy();env['PATH']=str(R/'.build/simple-kernels-bootstrap/bin')+':/tmp/qcp-coq820-install/bin:'+env['PATH']
 def call(label,cmd):
  cmd=['prlimit','--as=17179869184:17179869184','--',*map(str,cmd)];log=run/(label+'.log');t=time.monotonic()
  try:
   with log.open('w')as f:p=subprocess.run(cmd,cwd=run,env=env,stdout=f,stderr=f,timeout=14400 if label=='ordinary-closure'else 7200)
   code=p.returncode
  except subprocess.TimeoutExpired:code=124
  records.append(dict(label=label,command=cmd,exit_code=code,seconds=time.monotonic()-t,log_sha256=sha(log)));(run/'status.json').write_text(json.dumps(s,indent=2)+'\n');print(label,code,flush=True);assert code==0,log.read_text()[-3000:]
 try:
  call('cpp',['gcc','-E','-P','-CC','-nostdinc',C/'shim/public_wrapper.c','-o',run/'public_wrapper.i'])
  call('qcp',['qcp','--arch=64','--endian=little','--no-float-finite-vc','--no-exec-info','--input-file='+str(run/'public_wrapper.i'),'--coq-output-dir='+str(gen),'--coq-logic-path=Dwconv','-slp',C/'shim','Dwconv','-slp',C/'proof/c','Dwconv'])
  goal=gen/'public_wrapper_goal.v';assert sha(goal)==sha(C/'proof/coq/public_wrapper_goal.v');fields=re.findall(r'^Axiom proof_of_(\w+)\s*:',goal.read_text(),re.M);assert len(fields)==8
  import importlib.util
  sp=importlib.util.spec_from_file_location('ownership',C/'proof/audit_output_ownership.py');m=importlib.util.module_from_spec(sp);sp.loader.exec_module(m);owners={n:m.audit(goal,n,max_owners=mx)for n,mx in [('dw_output',2),('dw_data',1),('dw_ptr_data',1)]};assert all(o['passed']for o in owners.values()),owners;s['ownership_audit']=owners
  call('ordinary-closure',['python3',C/'proof/check_coq.py','--targets','WrapperChecked','--jobs',a.jobs,'--max-live',a.max_live,'--timeout','7200']);closure=json.loads((C/'.build/coq-status-WrapperChecked.json').read_text());assert closure['passed']
  assert all(sha(C/p)==h for p,h in before.items()),'source drift'
  s.update(passed=True,actual_c_vcs=8,fields=fields,checked_module='Dwconv.WrapperChecked.CheckedWrapper',goal_sha256=sha(goal),cpp_sha256=sha(run/'public_wrapper.i'),ordinary_closure=closure['run_directory'],own_sources_fresh=True,external_BASE_object_reuse_component_only=True)
 except Exception as e:s['error']=str(e)
 (run/'status.json').write_text(json.dumps(s,indent=2)+'\n');dest=C/'proof/wrapper-status.json'
 if dest.exists():(C/'proof/history'/('wrapper-status-'+sha(dest)+'.json')).write_bytes(dest.read_bytes())
 dest.write_bytes((run/'status.json').read_bytes());print(run,flush=True);raise SystemExit(0 if s['passed']else 1)
if __name__=='__main__':main()
