#!/usr/bin/env python3
"""Fresh actual unsigned-byte public wrapper/comparator/assert C bodies and complete typed gate."""
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
    parser.add_argument('--jobs',type=int,default=16)
    args=parser.parse_args();assert 16<=args.jobs<=64
    run=Path(tempfile.mkdtemp(prefix='wrapper-proof-',dir=CASE/'.build'));coq=run/'coq';coq.mkdir()
    records=[];status={'passed':False,'vc_correct_passed':False,'whole_kernel_verified':False,
                      'parallel_jobs':args.jobs,'scope':'actual C public wrapper/comparator/assert component','run_directory':str(run),'records':records}
    def execute(cmd,label):
        cmd=['prlimit','--as=17179869184:17179869184','--',*map(str,cmd)]
        log=run/(label+'.log');start=time.monotonic()
        with log.open('w') as f:r=subprocess.run(cmd,cwd=run,stdout=f,stderr=f,timeout=1800)
        records.append({'label':label,'command':cmd,'exit_code':r.returncode,'seconds':time.monotonic()-start,'log_sha256':sha(log)})
        if r.returncode:raise RuntimeError(label+': '+log.read_text()[-3500:])
    try:
        names=['spec.c','shim/control.c','shim/control.h','shim/program_model.h','shim/array_model.h','shim/scalar.h','shim/types.h','shim/types_def.h','proof/c/u8_arrays.strategies','proof/c/wrapper.annotations.json','proof/generate_wrapper.py','proof/check_wrapper.py']+['proof/coq/'+n+'.v'for n in ['Model','ShiftFacts','UnsignedModel','Types','MemoryModel','ProgramModel','NeonFrame','U8ArraysStrategy','u8_arrays_strategy_proof','WrapperChecked']]
        inputs={n:sha(CASE/n)for n in names}
        execute(['python3',CASE/'proof/generate_wrapper.py'],'generation')
        generated=json.loads((CASE/'proof/wrapper-generation-status.json').read_text());assert generated['passed']
        src=Path(generated['run_directory'])/'wrapper.c';out=Path(generated['run_directory'])
        goal=out/'wrapper_goal.v';fields=re.findall(r'^Axiom proof_of_(\w+) :',goal.read_text(),re.M)
        if len(fields)!=15:raise ValueError('Expected assert/comparator/caller15 C fields')
        strategy_out=run/'strategy';strategy_out.mkdir()
        strategy_tool=Path(shutil.which('qcp')).resolve().parent/'StrategyCheck'
        execute([strategy_tool,'--arch=64','--endian=little','--no-exec-info','--input-file='+str(CASE/'proof/c/u8_arrays.strategies'),'--coq-output-dir='+str(strategy_out),'--coq-logic-path=Qu8Add'],'StrategyCheck')
        shutil.copyfile(strategy_out/'u8_arrays_strategy_goal.v',coq/'u8_arrays_strategy_goal.v')
        for n in ['Model','ShiftFacts','UnsignedModel','Types','MemoryModel','NeonFrame','ProgramModel','U8ArraysStrategy','u8_arrays_strategy_proof','WrapperChecked']:shutil.copyfile(CASE/'proof/coq'/(n+'.v'),coq/(n+'.v'))
        shutil.copyfile(goal,coq/goal.name)
        flags=list(json.loads(args.config.read_text())['flags'])+['-Q',str(coq),'Qu8Add']
        for n in ['Model','ShiftFacts','UnsignedModel','Types','MemoryModel','NeonFrame','ProgramModel','u8_arrays_strategy_goal','U8ArraysStrategy','u8_arrays_strategy_proof','wrapper_goal','WrapperChecked']:
            execute([*flags,coq/(n+'.v')],n)
        gate=['Require Import Qu8Add.wrapper_goal Qu8Add.WrapperChecked.',
              'Module Typed : Qu8Add.wrapper_goal.VC_Correct := Qu8Add.WrapperChecked.CheckedWrapper.']
        gate+=['Print Assumptions Typed.proof_of_'+n+'.' for n in fields]
        gate+=['Module TypedStrategy : Qu8Add.u8_arrays_strategy_goal.u8_arrays_Strategy_Correct := Qu8Add.U8ArraysStrategy.CheckedU8Arrays.']
        gate+=['Print Assumptions TypedStrategy.u8_arrays_strategy'+str(i)+'_correctness.' for i in [1,2]]
        math=re.findall(r'^Lemma (\w+)',(coq/'Model.v').read_text(),re.M)
        gate+=['Print Assumptions Qu8Add.Model.'+n+'.' for n in math]
        (coq/'WrapperGate.v').write_text('\n'.join(gate)+'\n');execute([*flags,coq/'WrapperGate.v'],'WrapperGate')
        if inputs!={n:sha(CASE/n) for n in names}:raise ValueError('Actual component input changed')
        status.update(passed=True,vc_correct_passed=True,actual_c_functions=['qcp_qu_assert','compare_outputs','equivalent'],checked_strategy_fields=2,
                      checked_c_vcs=len(fields),fields=fields,checked_module='Qu8Add.WrapperChecked.CheckedWrapper',
                      math_support_lemmas=len(math),input_sha256=inputs,cpp_sha256=sha(src),goal_sha256=sha(goal),
                      no_component_vo_reused=True,final_gate_sha256=sha(coq/'WrapperGate.v'))
    except Exception as e:status['error']=str(e)
    (run/'status.json').write_text(json.dumps(status,indent=2)+'\n')
    dest=CASE/'proof/wrapper-proof-status.json'
    if dest.exists():
        old=dest.read_bytes();(CASE/'proof/history'/('wrapper-proof-status-'+hashlib.sha256(old).hexdigest()+'.json')).write_bytes(old)
    dest.write_text(json.dumps(status,indent=2)+'\n')
    print(json.dumps({'passed':status['passed'],'run_directory':str(run),'error':status.get('error'),'checked_c_vcs':status.get('checked_c_vcs')},indent=2))
    return 0 if status['passed'] else 1
if __name__=='__main__':raise SystemExit(main())
