#!/usr/bin/env python3
"""Fresh single RVV kernel array-split strategy; zero C VC credit."""
from pathlib import Path
import argparse,hashlib,json,re,shutil,subprocess,tempfile,time
C=Path(__file__).resolve().parent.parent;NS="Qu8Add";sha=lambda p:hashlib.sha256(Path(p).read_bytes()).hexdigest()
def main():
 p=argparse.ArgumentParser(description=__doc__);p.add_argument('--config',type=Path,required=True);p.add_argument('--jobs',type=int,default=16);a=p.parse_args();assert 16<=a.jobs<=64;r=Path(tempfile.mkdtemp(prefix='rvv-kernel-strategy-',dir=C/'.build'));coq=r/'coq';coq.mkdir();mods=['Model','ShiftFacts','Types','MemoryModel','RvvModel','RvvMemoryModel','rvv_kernel_strategy_proof'];names=['proof/check_rvv_kernel_strategy.py','proof/c/rvv_kernel.strategies','shim/rvv_memory.h','shim/array_model.h','shim/types_def.h','shim/types.h','shim/scalar.h']+['proof/coq/'+n+'.v'for n in mods];inputs={n:sha(C/n)for n in names};records=[];s=dict(passed=False,whole_kernel_verified=False,scope='single actual RVV kernel array-split strategy; zero C VCs',checked_c_vcs=0,parallel_jobs=a.jobs,run_directory=str(r),input_sha256=inputs,records=records)
 def run(label,cmd):
  log=r/(label+'.log');t=time.monotonic()
  with log.open('w')as f:z=subprocess.run(['prlimit','--as=17179869184:17179869184','--',*map(str,cmd)],cwd=r,stdout=f,stderr=f,timeout=1200)
  records.append(dict(label=label,command=list(map(str,cmd)),exit_code=z.returncode,seconds=time.monotonic()-t,log_sha256=sha(log)));assert not z.returncode,log.read_text()[-2400:]
 try:
  tool=Path(shutil.which('qcp')).resolve().parent/'StrategyCheck';run('StrategyCheck',[tool,'--arch=64','--endian=little','--no-exec-info','--input-file='+str(C/'proof/c/rvv_kernel.strategies'),'--coq-output-dir='+str(r),'--coq-logic-path='+NS]);goal=r/'rvv_kernel_strategy_goal.v';fields=re.findall(r'^\s*Axiom (\w+)\s*:',goal.read_text(),re.M);assert fields==['rvv_kernel_strategy1_correctness'];shutil.copyfile(goal,coq/goal.name)
  for n in mods:shutil.copyfile(C/'proof/coq'/(n+'.v'),coq/(n+'.v'))
  flags=json.loads(a.config.read_text())['flags']+['-Q',str(coq),NS]
  for n in mods[:-1]+['rvv_kernel_strategy_goal',mods[-1]]:run(n,[*flags,'-time',coq/(n+'.v')])
  gate='From '+NS+' Require Import rvv_kernel_strategy_proof.\nModule Typed : '+NS+'.rvv_kernel_strategy_goal.rvv_kernel_Strategy_Correct := '+NS+'.rvv_kernel_strategy_proof.CheckedRvvKernelStrategy.\nPrint Assumptions Typed.rvv_kernel_strategy1_correctness.\n';(coq/'RvvKernelStrategyGate.v').write_text(gate);run('RvvKernelStrategyGate',[*flags,'-time',coq/'RvvKernelStrategyGate.v']);assert inputs=={n:sha(C/n)for n in names};s.update(passed=True,checked_strategies=1,fields=fields,goal_sha256=sha(goal),checked_module=NS+'.rvv_kernel_strategy_proof.CheckedRvvKernelStrategy',final_gate_sha256=sha(coq/'RvvKernelStrategyGate.v'),final_assumptions_log_sha256=sha(r/'RvvKernelStrategyGate.log'),no_component_vo_reused=True)
 except Exception as e:s['error']=str(e)
 (r/'status.json').write_text(json.dumps(s,indent=2)+'\n');d=C/'proof/rvv-kernel-strategy-status.json'
 if d.exists():(C/'proof/history'/('rvv-kernel-strategy-status-'+sha(d)+'.json')).write_bytes(d.read_bytes())
 d.write_bytes((r/'status.json').read_bytes());print(json.dumps({k:s.get(k)for k in ['passed','run_directory','checked_strategies','error']},indent=2));return 0 if s['passed']else 1
if __name__=='__main__':raise SystemExit(main())
