#!/usr/bin/env python3
"""Freshly generate and check the NEON byte-permission strategy interface."""
import argparse,hashlib,json,re,shutil,subprocess,tempfile,time
from pathlib import Path
CASE=Path(__file__).resolve().parent.parent
def sha(p):return hashlib.sha256(Path(p).read_bytes()).hexdigest()
def main():
 parser=argparse.ArgumentParser(description=__doc__);parser.add_argument('--config',type=Path,required=True);args=parser.parse_args()
 run=Path(tempfile.mkdtemp(prefix='neon-memory-strategies-',dir=CASE/'.build'));coq=run/'coq';coq.mkdir();generated=run/'generated';generated.mkdir();records=[]
 status=dict(passed=False,whole_kernel_verified=False,scope='NEON permission strategies; zero actual C VCs',run_directory=str(run),records=records)
 def execute(cmd,label):
  cmd=['prlimit','--as=17179869184:17179869184','--']+list(map(str,cmd));start=time.monotonic();log=run/(label+'.log')
  with log.open('w')as out:r=subprocess.run(cmd,cwd=run,stdout=out,stderr=out,timeout=300)
  records.append(dict(label=label,command=cmd,exit_code=r.returncode,seconds=time.monotonic()-start,log_sha256=sha(log)))
  if r.returncode:raise RuntimeError(label+': '+log.read_text()[-3500:])
 try:
  modules=['Model','Types','MemoryModel','ByteBridge','NeonMemoryStrategy','s8_neon_memory_strategy_proof']
  names=['proof/check_neon_memory_strategies.py','proof/c/s8_neon_memory.strategies','shim/array_model.h','shim/types.h','shim/types_def.h']+['proof/coq/'+n+'.v' for n in modules]
  inputs={n:sha(CASE/n)for n in names}
  tool=Path(shutil.which('qcp')).resolve().parent/'StrategyCheck'
  execute([tool,'--arch=64','--endian=little','--no-exec-info','--input-file='+str(CASE/'proof/c/s8_neon_memory.strategies'),'--coq-output-dir='+str(generated),'--coq-logic-path=S8Clamp'],'StrategyCheck')
  stem='s8_neon_memory_strategy_goal';shutil.copyfile(generated/(stem+'.v'),coq/(stem+'.v'))
  fields=re.findall(r'^  Axiom (\w+) :', (coq/(stem+'.v')).read_text(),re.M)
  if len(fields)!=5:raise ValueError('Expected five permission strategy fields')
  for n in modules:shutil.copyfile(CASE/'proof/coq'/(n+'.v'),coq/(n+'.v'))
  flags=list(json.loads(args.config.read_text())['flags'])+['-Q',str(coq),'S8Clamp']
  for n in ['Model','Types','MemoryModel','ByteBridge',stem,'NeonMemoryStrategy','s8_neon_memory_strategy_proof']:execute([*flags,coq/(n+'.v')],n)
  gate=['From S8Clamp Require Import '+stem+' NeonMemoryStrategy.','Module Typed : S8Clamp.'+stem+'.s8_neon_memory_Strategy_Correct := S8Clamp.NeonMemoryStrategy.CheckedNeonMemoryStrategy.']+['Print Assumptions Typed.'+n+'.'for n in fields]
  (coq/'NeonMemoryStrategyGate.v').write_text('\n'.join(gate)+'\n');execute([*flags,coq/'NeonMemoryStrategyGate.v'],'NeonMemoryStrategyGate')
  if inputs!={n:sha(CASE/n)for n in names}:raise ValueError('Strategy inputs changed during fresh check')
  status.update(passed=True,checked_strategies=len(fields),checked_c_vcs=0,fields=fields,checked_module='S8Clamp.NeonMemoryStrategy.CheckedNeonMemoryStrategy',input_sha256=inputs,goal_sha256=sha(coq/(stem+'.v')),final_gate_sha256=sha(coq/'NeonMemoryStrategyGate.v'),final_assumptions_log_sha256=sha(run/'NeonMemoryStrategyGate.log'),no_component_vo_reused=True)
 except Exception as e:status['error']=str(e)
 (run/'status.json').write_text(json.dumps(status,indent=2)+'\n');dest=CASE/'proof/neon-memory-strategy-status.json'
 if dest.exists():
  old=dest.read_bytes();(CASE/'proof/history'/('neon-memory-strategy-status-'+hashlib.sha256(old).hexdigest()+'.json')).write_bytes(old)
 dest.write_text(json.dumps(status,indent=2)+'\n');print(json.dumps({k:status.get(k)for k in ['passed','run_directory','checked_strategies','error']},indent=2));return 0 if status['passed'] else 1
if __name__=='__main__':raise SystemExit(main())
