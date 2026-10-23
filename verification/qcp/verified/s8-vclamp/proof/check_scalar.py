#!/usr/bin/env python3
"""Fresh actual signed-byte scalar primitive C bodies and complete typed gate."""
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
    run=Path(tempfile.mkdtemp(prefix='scalar-',dir=CASE/'.build'));coq=run/'coq';coq.mkdir()
    records=[];status={'passed':False,'vc_correct_passed':False,'whole_kernel_verified':False,
                      'scope':'actual C scalar primitive component','run_directory':str(run),'records':records}
    def execute(cmd,label):
        cmd=['prlimit','--as=17179869184:17179869184','--',*map(str,cmd)]
        log=run/(label+'.log');start=time.monotonic()
        with log.open('w') as f:r=subprocess.run(cmd,cwd=run,stdout=f,stderr=f,timeout=300)
        records.append({'label':label,'command':cmd,'exit_code':r.returncode,'seconds':time.monotonic()-start,'log_sha256':sha(log)})
        if r.returncode:raise RuntimeError(label+': '+log.read_text()[-3500:])
    try:
        names=['shim/scalar_primitives.c','shim/types.h','shim/types_def.h','proof/coq/Model.v','proof/coq/Types.v','proof/coq/ScalarChecked.v','proof/check_scalar.py']
        inputs={n:sha(CASE/n) for n in names}
        src=run/'scalar_primitives.c';out=run/'generated';out.mkdir()
        execute(['gcc','-E','-P','-CC','-nostdinc',CASE/'shim/scalar_primitives.c','-o',src],'cpp')
        execute(['qcp','--arch=64','--endian=little','--no-exec-info','--input-file='+str(src),
                 '--coq-output-dir='+str(out),'--coq-logic-path=S8Clamp','-slp',CASE/'shim','S8Clamp'],'qcp')
        goal=out/'scalar_primitives_goal.v';fields=re.findall(r'^Axiom proof_of_(\w+) :',goal.read_text(),re.M)
        if len(fields)!=9:raise ValueError('Expected four actual bodies/nine C fields')
        for n in ['Model','Types','ScalarChecked']:shutil.copyfile(CASE/'proof/coq'/(n+'.v'),coq/(n+'.v'))
        shutil.copyfile(goal,coq/goal.name)
        flags=list(json.loads(args.config.read_text())['flags'])+['-Q',str(coq),'S8Clamp']
        for n in ['Model','Types','scalar_primitives_goal','ScalarChecked']:
            execute([*flags,coq/(n+'.v')],n)
        gate=['Require Import S8Clamp.scalar_primitives_goal S8Clamp.ScalarChecked.',
              'Module Typed : S8Clamp.scalar_primitives_goal.VC_Correct := S8Clamp.ScalarChecked.CheckedScalar.']
        gate+=['Print Assumptions Typed.proof_of_'+n+'.' for n in fields]
        math=re.findall(r'^Lemma (\w+)',(coq/'Model.v').read_text(),re.M)
        gate+=['Print Assumptions S8Clamp.Model.'+n+'.' for n in math]
        (coq/'ScalarGate.v').write_text('\n'.join(gate)+'\n');execute([*flags,coq/'ScalarGate.v'],'ScalarGate')
        if inputs!={n:sha(CASE/n) for n in names}:raise ValueError('Actual component input changed')
        status.update(passed=True,vc_correct_passed=True,actual_c_functions=['qcp_s8_min','qcp_s8_max','qcp_s8_narrow','__riscv_vsetvl_e8m8'],
                      checked_c_vcs=len(fields),fields=fields,checked_module='S8Clamp.ScalarChecked.CheckedScalar',
                      math_support_lemmas=len(math),input_sha256=inputs,cpp_sha256=sha(src),goal_sha256=sha(goal),
                      no_component_vo_reused=True,final_gate_sha256=sha(coq/'ScalarGate.v'))
    except Exception as e:status['error']=str(e)
    (run/'status.json').write_text(json.dumps(status,indent=2)+'\n')
    dest=CASE/'proof/scalar-status.json'
    if dest.exists():
        old=dest.read_bytes();(CASE/'proof/history'/('scalar-status-'+hashlib.sha256(old).hexdigest()+'.json')).write_bytes(old)
    dest.write_text(json.dumps(status,indent=2)+'\n')
    print(json.dumps({'passed':status['passed'],'run_directory':str(run),'error':status.get('error'),'checked_c_vcs':status.get('checked_c_vcs')},indent=2))
    return 0 if status['passed'] else 1
if __name__=='__main__':raise SystemExit(main())
