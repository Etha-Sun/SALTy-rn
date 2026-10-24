#!/usr/bin/env python3
"""Actual ordinary C readonly pointer-map adapter, fresh generated/typed."""
from pathlib import Path
import argparse,hashlib,json,os,re,shutil,subprocess,tempfile,time
C=Path(__file__).resolve().parents[1]
def sha(p):return hashlib.sha256(Path(p).read_bytes()).hexdigest()
def main():
 p=argparse.ArgumentParser();p.add_argument('--config',type=Path,required=True);a=p.parse_args();r=Path(tempfile.mkdtemp(prefix='memory-helper-fresh-',dir=C/'.build'));coq=r/'coq';coq.mkdir();mods=['FmaModel','MemoryModel','MemoryFacts','OutputMemory','MemoryInterface'];files=['proof/check_memory.py','shim/memory.c','shim/memory.h','proof/coq/MemoryChecked.v']+['proof/coq/'+n+'.v'for n in mods];inputs={p:sha(C/p)for p in files};records=[];status=dict(passed=False,whole_kernel_verified=False,run_directory=str(r),input_sha256=inputs,records=records);env=os.environ.copy();env['PATH']=str(C.parents[3]/'.build/simple-kernels-bootstrap/bin')+':/tmp/qcp-coq820-install/bin:'+env['PATH'];flags=json.loads(a.config.read_text())['flags']+['-Q',str(coq),'Dwconv']
 def run(label,cmd):
  cmd=['prlimit','--as=17179869184:17179869184','--',*map(str,cmd)];log=r/(label+'.log');t=time.monotonic()
  with log.open('w')as f:p=subprocess.run(cmd,cwd=r,env=env,stdout=f,stderr=f,timeout=7200)
  records.append(dict(label=label,command=cmd,exit_code=p.returncode,seconds=time.monotonic()-t,log_sha256=sha(log)));(r/'status.json').write_text(json.dumps(status,indent=2)+'\n');assert p.returncode==0,log.read_text()[-3000:]
 try:
  for n in mods:shutil.copy2(C/'proof/coq'/(n+'.v'),coq/(n+'.v'));run(n,[*flags,'-time',coq/(n+'.v')])
  run('cpp',['gcc','-E','-P','-CC','-nostdinc',C/'shim/memory.c','-o',r/'memory.c']);gen=r/'generated';gen.mkdir();run('qcp',['qcp','--arch=64','--endian=little','--no-float-finite-vc','--no-exec-info','--input-file='+str(r/'memory.c'),'--coq-output-dir='+str(gen),'--coq-logic-path=Dwconv','-slp',C/'shim','Dwconv']);goal=gen/'memory_goal.v';shutil.copy2(goal,coq/goal.name);run('memory_goal',[*flags,'-time',coq/goal.name]);fields=re.findall(r'^Axiom proof_of_(\w+)\s*:',goal.read_text(),re.M);assert len(fields)==4
  shutil.copyfile(C/'proof/coq/MemoryChecked.v',coq/'MemoryChecked.v');run('MemoryChecked',[*flags,'-time',coq/'MemoryChecked.v']);assert inputs=={p:sha(C/p)for p in inputs};status.update(passed=True,actual_c_vcs=4,fields=fields,checked_module='Dwconv.MemoryChecked.CheckedMemory',cpp_sha256=sha(r/'memory.c'),goal_sha256=sha(goal),proof_sha256=sha(coq/'MemoryChecked.v'),final_assumptions_log_sha256=sha(r/'MemoryChecked.log'),no_component_vo_reused=True)
 except Exception as e:status['error']=str(e)
 (r/'status.json').write_text(json.dumps(status,indent=2)+'\n');dest=C/'proof/memory-helper-status.json'
 if dest.exists():(C/'proof/history'/('memory-helper-status-'+sha(dest)+'.json')).write_bytes(dest.read_bytes())
 dest.write_bytes((r/'status.json').read_bytes());print(json.dumps({k:status.get(k)for k in ['passed','run_directory','actual_c_vcs','error']}));return 0 if status['passed']else 1
if __name__=='__main__':raise SystemExit(main())
