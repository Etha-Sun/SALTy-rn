#!/usr/bin/env python3
"""Fresh actual signed-byte NEON byte-store C bodies and complete typed gate."""
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
    run=Path(tempfile.mkdtemp(prefix='store-',dir=CASE/'.build'));coq=run/'coq';coq.mkdir()
    records=[];status={'passed':False,'vc_correct_passed':False,'whole_kernel_verified':False,
                      'scope':'actual C NEON byte-store component','run_directory':str(run),'records':records}
    def execute(cmd,label):
        cmd=['prlimit','--as=17179869184:17179869184','--',*map(str,cmd)]
        log=run/(label+'.log');start=time.monotonic()
        with log.open('w') as f:r=subprocess.run(cmd,cwd=run,stdout=f,stderr=f,timeout=1800)
        records.append({'label':label,'command':cmd,'exit_code':r.returncode,'seconds':time.monotonic()-start,'log_sha256':sha(log)})
        if r.returncode:raise RuntimeError(label+': '+log.read_text()[-3500:])
    try:
        names=['shim/scalar.h','shim/neon_store.c','shim/array_model.h','shim/neon_store.h','shim/types.h','shim/types_def.h','proof/c/u8_arrays.strategies','proof/check_store.py']+[
            'proof/coq/'+n+'.v' for n in ['Model','Types','MemoryModel','NeonFrame','NeonStoreModel','NeonStoreMemory','U8ArraysStrategy','u8_arrays_strategy_proof','NeonStoreChecked']]
        inputs={n:sha(CASE/n) for n in names}
        src=run/'neon_store.c';out=run/'generated';out.mkdir()
        execute(['gcc','-E','-P','-CC','-nostdinc',CASE/'shim/neon_store.c','-o',src],'cpp')
        execute(['qcp','--arch=64','--endian=little','--no-exec-info','--input-file='+str(src),
                 '--coq-output-dir='+str(out),'--coq-logic-path=Qu8Add','-slp',CASE/'shim','Qu8Add','-slp',CASE/'proof/c','Qu8Add'],'qcp')
        goal=out/'neon_store_goal.v';fields=re.findall(r'^Axiom proof_of_(\w+) :',goal.read_text(),re.M)
        if len(fields)!=29:raise ValueError('Expected three actual bodies/29 C fields')
        strategy_out=run/'strategy';strategy_out.mkdir()
        strategy_tool=Path(shutil.which('qcp')).resolve().parent/'StrategyCheck'
        execute([strategy_tool,'--arch=64','--endian=little','--no-exec-info','--input-file='+str(CASE/'proof/c/u8_arrays.strategies'),'--coq-output-dir='+str(strategy_out),'--coq-logic-path=Qu8Add'],'StrategyCheck')
        shutil.copyfile(strategy_out/'u8_arrays_strategy_goal.v',coq/'u8_arrays_strategy_goal.v')
        for n in ['Model','Types','MemoryModel','NeonFrame','NeonStoreModel','NeonStoreMemory','U8ArraysStrategy','u8_arrays_strategy_proof','NeonStoreChecked']:shutil.copyfile(CASE/'proof/coq'/(n+'.v'),coq/(n+'.v'))
        shutil.copyfile(goal,coq/goal.name)
        flags=list(json.loads(args.config.read_text())['flags'])+['-Q',str(coq),'Qu8Add']
        for n in ['Model','Types','MemoryModel','NeonFrame','NeonStoreModel','NeonStoreMemory','u8_arrays_strategy_goal','U8ArraysStrategy','u8_arrays_strategy_proof','neon_store_goal','NeonStoreChecked']:
            execute([*flags,coq/(n+'.v')],n)
        gate=['Require Import Qu8Add.neon_store_goal Qu8Add.NeonStoreChecked.',
              'Module Typed : Qu8Add.neon_store_goal.VC_Correct := Qu8Add.NeonStoreChecked.CheckedNeonStore.']
        gate+=['Print Assumptions Typed.proof_of_'+n+'.' for n in fields]
        gate+=['Module TypedStrategy : Qu8Add.u8_arrays_strategy_goal.u8_arrays_Strategy_Correct := Qu8Add.U8ArraysStrategy.CheckedU8Arrays.']
        gate+=['Print Assumptions TypedStrategy.u8_arrays_strategy'+str(i)+'_correctness.' for i in [1,2]]
        math=re.findall(r'^Lemma (\w+)',(coq/'Model.v').read_text(),re.M)
        gate+=['Print Assumptions Qu8Add.Model.'+n+'.' for n in math]
        (coq/'StoreGate.v').write_text('\n'.join(gate)+'\n');execute([*flags,coq/'StoreGate.v'],'StoreGate')
        if inputs!={n:sha(CASE/n) for n in names}:raise ValueError('Actual component input changed')
        status.update(passed=True,vc_correct_passed=True,actual_c_functions=['qcp_u8_store8','qcp_u8_store16','qcp_u8_store_lane0'],checked_strategy_fields=2,
                      checked_c_vcs=len(fields),fields=fields,checked_module='Qu8Add.NeonStoreChecked.CheckedNeonStore',
                      math_support_lemmas=len(math),input_sha256=inputs,cpp_sha256=sha(src),goal_sha256=sha(goal),
                      no_component_vo_reused=True,final_gate_sha256=sha(coq/'StoreGate.v'))
    except Exception as e:status['error']=str(e)
    (run/'status.json').write_text(json.dumps(status,indent=2)+'\n')
    dest=CASE/'proof/store-status.json'
    if dest.exists():
        old=dest.read_bytes();(CASE/'proof/history'/('store-status-'+hashlib.sha256(old).hexdigest()+'.json')).write_bytes(old)
    dest.write_text(json.dumps(status,indent=2)+'\n')
    print(json.dumps({'passed':status['passed'],'run_directory':str(run),'error':status.get('error'),'checked_c_vcs':status.get('checked_c_vcs')},indent=2))
    return 0 if status['passed'] else 1
if __name__=='__main__':raise SystemExit(main())
