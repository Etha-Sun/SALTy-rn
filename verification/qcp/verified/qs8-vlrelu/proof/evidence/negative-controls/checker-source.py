#!/usr/bin/env python3
"""Reject a private source mutation and an actual false sizeof C postcondition.
These finite controls do not establish whole-model consistency or ISA refinement.
"""
from pathlib import Path
import argparse,hashlib,json,os,re,shutil,subprocess,tempfile,time
C=Path(__file__).resolve().parent.parent
sha=lambda p:hashlib.sha256(Path(p).read_bytes()).hexdigest()
def main():
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--config',type=Path,required=True)
    args=parser.parse_args();assert __debug__
    run=Path(tempfile.mkdtemp(prefix='negative-controls64-',dir=C/'.build'))
    shutil.copyfile(Path(__file__),run/'checker-source.py')
    records=[];result=dict(checker_sha256=sha(Path(__file__)),passed=False,whole_kernel_verified=False,
        scope='Source-identity and false-width controls only; not a whole model consistency proof',
        run_directory=str(run),records=records)
    def execute(label,cmd,expected=0):
        cmd=['prlimit','--as=17179869184:17179869184','--',*map(str,cmd)]
        log=run/(label+'.log');start=time.monotonic()
        with log.open('w') as stream:code=subprocess.run(cmd,cwd=run,stdout=stream,stderr=stream,timeout=1800).returncode
        records.append(dict(label=label,command=cmd,exit_code=code,expected_exit_code=expected,
            seconds=time.monotonic()-start,log_sha256=sha(log)))
        assert code==expected,(label,code,log.read_text()[-2000:]);print(label,code,flush=True)
        return log.read_text()
    try:
        private=run/C.name
        shutil.copytree(C,private,ignore=shutil.ignore_patterns('.build','__pycache__','*.vo','*.vos','*.vok','*.pyc','*.glob','.*.aux'))
        execute('private-positive-preflight',['python3',private/'proof/record_status.py','--preflight'])
        scalar=private/'shim/scalar.c';old=scalar.read_text()
        start=old.index('{');scalar.write_text(old[:start+1]+'/* deliberate private source mutation */ return 0;'+old[start+1:])
        text=execute('private-source-tamper-rejected',['python3',private/'proof/record_status.py','--preflight'],1)
        assert 'input changed: shim/scalar.c' in text,text[-2000:]
        false=run/'false_width.c';false.write_text('#include "'+str(C/'shim/scalar.h')+'"\nint false_width(void)\n/*@ Require emp Ensure __return==4 && emp */\n{return sizeof(size_t);}\n')
        execute('false-cpp',['gcc','-E','-P','-CC','-nostdinc',false,'-o',run/'false_width_expanded.c'])
        generated=run/'generated';generated.mkdir()
        execute('false-qcp',['qcp','--arch=64','--endian=little','--no-exec-info',
            '--input-file='+str(run/'false_width_expanded.c'),'--coq-output-dir='+str(generated),
            '--coq-logic-path=Qs8Lrelu','-slp',C/'shim','Qs8Lrelu'])
        coq=run/'coq';coq.mkdir();goal=generated/'false_width_expanded_goal.v'
        fields=re.findall(r'^Axiom proof_of_(\w+)\s*:',goal.read_text(),re.M);assert len(fields)==1
        assert 'sizeof(UINT64)'in goal.read_text() and '= 4'in goal.read_text()
        shutil.copyfile(C/'proof/coq/Model.v',coq/'Model.v');shutil.copyfile(goal,coq/goal.name)
        flags=json.loads(args.config.read_text())['flags']+['-Q',str(coq),'Qs8Lrelu']
        execute('Model',[*flags,'-time',coq/'Model.v'])
        execute('false-actual-goal',[*flags,'-time',coq/goal.name])
        proof=coq/'FalseWidthChecked.v';proof.write_text('From SimpleC.SL Require Import Mem SeparationLogic.\nFrom Qs8Lrelu Require Import false_width_expanded_goal.\nImport Snaive_C_Rules64.\nLocal Open Scope sac.\nModule FalseWidth : Qs8Lrelu.false_width_expanded_goal.VC_Correct.\nLemma proof_of_'+fields[0]+' : Qs8Lrelu.false_width_expanded_goal.'+fields[0]+'.\nProof. unfold Qs8Lrelu.false_width_expanded_goal.'+fields[0]+';entailer!. Qed.\nEnd FalseWidth.\n')
        text=execute('false-post-rejected',[*flags,'-time',proof],1)
        assert 'Attempt to save an incomplete proof'in text
        facts=coq/'WidthFacts.v';facts.write_text('From Coq Require Import ZArith Lia.\nFrom SimpleC.SL Require Import Mem SeparationLogic.\nImport Snaive_C_Rules64.\nLocal Open Scope Z_scope.\nLemma used_width_eight : sizeof(UINT64)=8. Proof. reflexivity. Qed.\nLemma used_width_not_four : sizeof(UINT64)<>4. Proof. cbv;congruence. Qed.\nPrint Assumptions used_width_not_four.\n')
        execute('actual-width-facts',[*flags,'-time',facts])
        result.update(passed=True,private_positive_control_passed=True,source_mutation_rejected=True,
            actual_C_false_postcondition_rejected=True,actual_width_eight_and_not_four_proved=True,
            false_C_goal_sha256=sha(goal),live_C_sources_unchanged=True)
    except Exception as error:result['error']=str(error);print(error,flush=True)
    for path in [run/'status.json',C/'proof/negative-controls-status.json']:path.write_text(json.dumps(result,indent=2)+'\n')
    print('RUN',run,flush=True)
    return 0 if result['passed'] else 1
if __name__=='__main__':raise SystemExit(main())
