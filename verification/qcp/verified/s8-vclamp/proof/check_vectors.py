#!/usr/bin/env python3
"""Fresh actual signed-byte NEON vector/EXT C bodies and complete typed gate."""
import argparse
import concurrent.futures
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
    parser.add_argument('--unit',choices=['neon','ext'],required=True)
    parser.add_argument('--config',type=Path,required=True)
    parser.add_argument('--jobs',type=int,choices=range(1,17),default=16)
    args=parser.parse_args()
    stem,proof,checked,count,functions={'neon':('neon_primitives','NeonPrimitivesChecked','CheckedNeonPrimitives',108,['vmin_s8','vmax_s8','vminq_s8','vmaxq_s8','vdupq_n_s8','vget_low_s8']),'ext':('neon_ext','NeonExtChecked','CheckedNeonExt',10,['qcp_s8_ext2','qcp_s8_ext4'])}[args.unit]
    leafs=['NeonVectorPart%02d'%i for i in range(16)] if args.unit=='neon' else []
    run=Path(tempfile.mkdtemp(prefix=args.unit+'-vectors-',dir=CASE/'.build'));coq=run/'coq';coq.mkdir()
    records=[];status={'passed':False,'vc_correct_passed':False,'whole_kernel_verified':False,
                      'scope':'actual C NEON vector/EXT component','run_directory':str(run),'records':records}
    def execute(cmd,label):
        cmd=['prlimit','--as=17179869184:17179869184','--',*map(str,cmd)]
        log=run/(label+'.log');start=time.monotonic()
        work=run/'jobs'/label;work.mkdir(parents=True,exist_ok=True)
        with log.open('w') as f:r=subprocess.run(cmd,cwd=work,stdout=f,stderr=f,timeout=1800)
        records.append({'label':label,'command':cmd,'exit_code':r.returncode,'seconds':time.monotonic()-start,'log_sha256':sha(log)})
        if r.returncode:raise RuntimeError(label+': '+log.read_text()[-3500:])
    try:
        names=['shim/'+stem+'.c','shim/scalar_primitives.h','shim/types.h','shim/types_def.h','proof/coq/Model.v','proof/coq/Types.v','proof/coq/NeonFrame.v','proof/coq/'+proof+'.v','proof/check_vectors.py']+['proof/coq/'+n+'.v' for n in leafs]
        inputs={n:sha(CASE/n) for n in names}
        src=run/(stem+'.c');out=run/'generated';out.mkdir()
        execute(['gcc','-E','-P','-CC','-nostdinc',CASE/'shim'/(stem+'.c'),'-o',src],'cpp')
        execute(['qcp','--arch=64','--endian=little','--no-exec-info','--input-file='+str(src),
                 '--coq-output-dir='+str(out),'--coq-logic-path=S8Clamp','-slp',CASE/'shim','S8Clamp'],'qcp')
        goal=out/(stem+'_goal.v');fields=re.findall(r'^Axiom proof_of_(\w+) :',goal.read_text(),re.M)
        if len(fields)!=count:raise ValueError('Actual C component interface changed')
        for n in ['Model','Types','NeonFrame',proof]+leafs:shutil.copyfile(CASE/'proof/coq'/(n+'.v'),coq/(n+'.v'))
        shutil.copyfile(goal,coq/goal.name)
        flags=list(json.loads(args.config.read_text())['flags'])+['-Q',str(coq),'S8Clamp']
        for n in ['Model','Types','NeonFrame',stem+'_goal']:
            execute([*flags,coq/(n+'.v')],n)
        if leafs:
            with concurrent.futures.ThreadPoolExecutor(max_workers=args.jobs) as pool:
                pending=[pool.submit(execute,[*flags,coq/(n+'.v')],n) for n in leafs]
                for task in concurrent.futures.as_completed(pending):task.result()
        execute([*flags,coq/(proof+'.v')],proof)
        gate=['Require Import S8Clamp.'+stem+'_goal S8Clamp.'+proof+'.',
              'Module Typed : S8Clamp.'+stem+'_goal.VC_Correct := S8Clamp.'+proof+'.'+checked+'.']
        gate+=['Print Assumptions Typed.proof_of_'+n+'.' for n in fields]
        math=re.findall(r'^Lemma (\w+)',(coq/'Model.v').read_text(),re.M)
        gate+=['Print Assumptions S8Clamp.Model.'+n+'.' for n in math]
        (coq/'VectorGate.v').write_text('\n'.join(gate)+'\n');execute([*flags,coq/'VectorGate.v'],'VectorGate')
        if inputs!={n:sha(CASE/n) for n in names}:raise ValueError('Actual component input changed')
        status.update(passed=True,vc_correct_passed=True,actual_c_functions=functions,
                      checked_c_vcs=len(fields),fields=fields,checked_module='S8Clamp.'+proof+'.'+checked,
                      math_support_lemmas=len(math),input_sha256=inputs,cpp_sha256=sha(src),goal_sha256=sha(goal),
                      no_component_vo_reused=True,parallel_jobs=args.jobs,checked_leaf_modules=leafs,final_gate_sha256=sha(coq/'VectorGate.v'))
    except Exception as e:status['error']=str(e)
    (run/'status.json').write_text(json.dumps(status,indent=2)+'\n')
    dest=CASE/'proof'/(args.unit+'-vector-status.json')
    if dest.exists():
        old=dest.read_bytes();(CASE/'proof/history'/(args.unit+'-vector-status-'+hashlib.sha256(old).hexdigest()+'.json')).write_bytes(old)
    dest.write_text(json.dumps(status,indent=2)+'\n')
    print(json.dumps({'passed':status['passed'],'run_directory':str(run),'error':status.get('error'),'checked_c_vcs':status.get('checked_c_vcs')},indent=2))
    return 0 if status['passed'] else 1
if __name__=='__main__':raise SystemExit(main())
