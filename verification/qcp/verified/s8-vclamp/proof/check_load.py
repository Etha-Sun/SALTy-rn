#!/usr/bin/env python3
"""Fresh actual signed-byte full-array read/load C bodies and complete typed gate."""
import argparse
import hashlib
import json
from pathlib import Path
import re
import shutil
import subprocess
import tempfile
import time

CASE=Path(__file__).resolve().parent.parent
def sha(p):return hashlib.sha256(Path(p).read_bytes()).hexdigest()
def main():
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--config',type=Path,required=True)
    args=parser.parse_args()
    run=Path(tempfile.mkdtemp(prefix='load-',dir=CASE/'.build'));coq=run/'coq';coq.mkdir()
    records=[];status={'passed':False,'vc_correct_passed':False,'whole_kernel_verified':False,
                      'scope':'actual C full-array read/load component','run_directory':str(run),'records':records}
    def execute(cmd,label):
        cmd=['prlimit','--as=17179869184:17179869184','--',*map(str,cmd)]
        log=run/(label+'.log');start=time.monotonic()
        with log.open('w') as f:r=subprocess.run(cmd,cwd=run,stdout=f,stderr=f,timeout=1800)
        records.append({'label':label,'command':cmd,'exit_code':r.returncode,'seconds':time.monotonic()-start,'log_sha256':sha(log)})
        if r.returncode:raise RuntimeError(label+': '+log.read_text()[-3500:])
    try:
        names=['shim/neon_load.c','shim/array_model.h','shim/types.h','shim/types_def.h','proof/c/s8_arrays.strategies','proof/check_load.py']+[
            'proof/coq/'+n+'.v' for n in ['Model','Types','MemoryModel','NeonFrame','SignedWindow','S8ArraysStrategy','s8_arrays_strategy_proof','NeonLoadChecked']]
        inputs={n:sha(CASE/n) for n in names}
        src=run/'neon_load.c';out=run/'generated';out.mkdir()
        execute(['gcc','-E','-P','-CC','-nostdinc',CASE/'shim/neon_load.c','-o',src],'cpp')
        execute(['qcp','--arch=64','--endian=little','--no-exec-info','--input-file='+str(src),
                 '--coq-output-dir='+str(out),'--coq-logic-path=S8Clamp','-slp',CASE/'shim','S8Clamp','-slp',CASE/'proof/c','S8Clamp'],'qcp')
        goal=out/'neon_load_goal.v';fields=re.findall(r'^Axiom proof_of_(\w+) :',goal.read_text(),re.M)
        if len(fields)!=105:raise ValueError('Expected three actual bodies/105 C fields')
        strategy_out=run/'strategy';strategy_out.mkdir()
        strategy_tool=Path(shutil.which('qcp')).resolve().parent/'StrategyCheck'
        execute([strategy_tool,'--arch=64','--endian=little','--no-exec-info','--input-file='+str(CASE/'proof/c/s8_arrays.strategies'),'--coq-output-dir='+str(strategy_out),'--coq-logic-path=S8Clamp'],'StrategyCheck')
        shutil.copyfile(strategy_out/'s8_arrays_strategy_goal.v',coq/'s8_arrays_strategy_goal.v')
        for n in ['Model','Types','MemoryModel','NeonFrame','SignedWindow','S8ArraysStrategy','s8_arrays_strategy_proof','NeonLoadChecked']:shutil.copyfile(CASE/'proof/coq'/(n+'.v'),coq/(n+'.v'))
        shutil.copyfile(goal,coq/goal.name)
        flags=list(json.loads(args.config.read_text())['flags'])+['-Q',str(coq),'S8Clamp']
        for n in ['Model','Types','MemoryModel','NeonFrame','SignedWindow','s8_arrays_strategy_goal','S8ArraysStrategy','s8_arrays_strategy_proof','neon_load_goal','NeonLoadChecked']:
            execute([*flags,coq/(n+'.v')],n)
        gate=['Require Import S8Clamp.neon_load_goal S8Clamp.NeonLoadChecked.',
              'Module Typed : S8Clamp.neon_load_goal.VC_Correct := S8Clamp.NeonLoadChecked.CheckedNeonLoad.']
        gate+=['Print Assumptions Typed.proof_of_'+n+'.' for n in fields]
        gate+=['Module TypedStrategy : S8Clamp.s8_arrays_strategy_goal.s8_arrays_Strategy_Correct := S8Clamp.S8ArraysStrategy.CheckedS8Arrays.']
        gate+=['Print Assumptions TypedStrategy.s8_arrays_strategy'+str(i)+'_correctness.' for i in [1,2]]
        math=re.findall(r'^Lemma (\w+)',(coq/'Model.v').read_text(),re.M)
        gate+=['Print Assumptions S8Clamp.Model.'+n+'.' for n in math]
        (coq/'LoadGate.v').write_text('\n'.join(gate)+'\n');execute([*flags,coq/'LoadGate.v'],'LoadGate')
        if inputs!={n:sha(CASE/n) for n in names}:raise ValueError('Actual component input changed')
        status.update(passed=True,vc_correct_passed=True,actual_c_functions=['qcp_s8_read_lane','qcp_s8_load8','qcp_s8_load16'],checked_strategy_fields=2,
                      checked_c_vcs=len(fields),fields=fields,checked_module='S8Clamp.NeonLoadChecked.CheckedNeonLoad',
                      math_support_lemmas=len(math),input_sha256=inputs,cpp_sha256=sha(src),goal_sha256=sha(goal),
                      no_component_vo_reused=True,final_gate_sha256=sha(coq/'LoadGate.v'))
    except Exception as e:status['error']=str(e)
    (run/'status.json').write_text(json.dumps(status,indent=2)+'\n')
    dest=CASE/'proof/load-status.json'
    if dest.exists():
        old=dest.read_bytes();(CASE/'proof/history'/('load-status-'+hashlib.sha256(old).hexdigest()+'.json')).write_bytes(old)
    dest.write_text(json.dumps(status,indent=2)+'\n')
    print(json.dumps({'passed':status['passed'],'run_directory':str(run),'error':status.get('error'),'checked_c_vcs':status.get('checked_c_vcs')},indent=2))
    return 0 if status['passed'] else 1
if __name__=='__main__':raise SystemExit(main())
