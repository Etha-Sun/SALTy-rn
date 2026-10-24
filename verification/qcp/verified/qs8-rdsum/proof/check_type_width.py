#!/usr/bin/env python3
"""Actual sizeof C/ordinary typed gate and native unsigned64 projection.
The projection checks width and unsigned value range, not a physical ABI theorem.
"""
from pathlib import Path
import argparse,json,re,subprocess,tempfile,time,shutil,hashlib
C=Path(__file__).resolve().parent.parent
sha=lambda p:hashlib.sha256(Path(p).read_bytes()).hexdigest()
def main():
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--config',required=True,type=Path)
    args=parser.parse_args();assert __debug__
    ns='Qs8Rdsum'
    run=Path(tempfile.mkdtemp(prefix='width64-projection-',dir=C/'.build'));coq=run/'coq';coq.mkdir()
    records=[];inputs={n:sha(C/n) for n in ['shim/formal_model.h','shim/type_width_probe.h','proof/check_type_width.py','proof/coq/Model.v']}
    result=dict(passed=False,whole_kernel_verified=False,run_directory=str(run),records=records,
        input_sha256=inputs,scope='Actual used type-width and unsigned-range projection; no ABI/ISA theorem')
    def execute(label,cmd):
        cmd=['prlimit','--as=17179869184:17179869184','--',*map(str,cmd)]
        log=run/(label+'.log');start=time.monotonic()
        with log.open('w') as stream:code=subprocess.run(cmd,cwd=run,stdout=stream,stderr=stream,timeout=1200).returncode
        records.append(dict(label=label,command=cmd,exit_code=code,seconds=time.monotonic()-start,log_sha256=sha(log)))
        assert code==0,(label,log.read_text()[-2500:]);print(label,code,flush=True)
    try:
        execute('cpp',['gcc','-E','-P','-CC','-nostdinc',C/'shim/type_width_probe.h','-o',run/'type_width.c'])
        execute('qcp',['qcp','--arch=64','--endian=little','--no-exec-info',
            '--input-file='+str(run/'type_width.c'),'--coq-output-dir='+str(run),
            '--coq-logic-path='+ns,'-slp',C/'shim',ns])
        goal=run/'type_width_goal.v';text=goal.read_text()
        fields=re.findall(r'^Axiom proof_of_(\w+)\s*:',text,re.M);assert len(fields)>=9 and 'width_size_t_unsigned_return_wit_1' in fields
        size_goal=text.split('Definition width_size_t_return_wit_1 :=',1)[1].split('Definition ',1)[0]
        assert 'sizeof(UL)' in size_goal or 'sizeof(UINT64)' in size_goal,size_goal
        shutil.copyfile(goal,coq/goal.name);shutil.copyfile(C/'proof/coq/Model.v',coq/'Model.v')
        proof='From Coq Require Import ZArith Lia.\nFrom SimpleC.SL Require Import Mem SeparationLogic.\nFrom '+ns+' Require Import type_width_goal.\nImport Snaive_C_Rules64.\nLocal Open Scope Z_scope. Local Open Scope sac.\nModule CheckedWidth : '+ns+'.type_width_goal.VC_Correct.\n'
        for field in fields:
            body='intros; entailer!'
            if field.startswith('width_size_t_unsigned_'):
                body='intros; assert (Hcast: unsigned_last_nbits (-1) 64 = 18446744073709551615) by (vm_compute; reflexivity); rewrite ?Hcast in *; entailer!'
            proof+='Lemma proof_of_'+field+' : '+ns+'.type_width_goal.'+field+'.\nProof. unfold '+ns+'.type_width_goal.'+field+'; '+body+'. Qed.\n'
        proof+='End CheckedWidth.\n'+''.join('Print Assumptions CheckedWidth.proof_of_'+field+'.\n' for field in fields)
        (coq/'Width64Checked.v').write_text(proof)
        flags=json.loads(args.config.read_text())['flags']+['-Q',str(coq),ns]
        for name in ['Model','type_width_goal','Width64Checked']:execute(name,[*flags,'-time',coq/(name+'.v')])
        native=run/'native.c';native.write_text('#include "'+str(C/'shim/formal_model.h')+'"\n'
            '_Static_assert(sizeof(size_t)==8 && (size_t)-1==18446744073709551615ULL && (size_t)-1>0,"unsigned64 size_t");\n'
            '_Static_assert(sizeof(void*)==8 && sizeof(int8_t)==1 && sizeof(int16_t)==2 && sizeof(uint16_t)==2 && sizeof(int32_t)==4 && sizeof(uint32_t)==4 && sizeof(int64_t)==8,"used widths");\n'
            'int main(void){return 0;}\n')
        for name,flags in [('formal-alias',[])]:
            execute(name+'-build',['gcc','-std=c11',*flags,native,'-o',run/name])
            execute(name,[run/name])
        shutil.copyfile(coq/'Width64Checked.v',C/'proof/coq/Width64Checked.v')
        inputs['proof/coq/Width64Checked.v']=sha(C/'proof/coq/Width64Checked.v')
        assert inputs=={n:sha(C/n) for n in inputs}
        result.update(passed=True,actual_C_width_fields=len(fields),formal_size_t_unsigned_bits=64,
            native_size_t_unsigned_bits=64,no_component_objects_reused=True,
            full_unsigned_value_domain='0..18446744073709551615',
            goal_sha256=sha(goal),ordinary_typed_gate_sha256=sha(coq/'Width64Checked.v'),
            print_log_sha256=sha(run/'Width64Checked.log'))
    except Exception as error:result['error']=str(error);print(error,flush=True)
    for path in [run/'status.json',C/'proof/type-width-status.json']:path.write_text(json.dumps(result,indent=2)+'\n')
    print('RUN',run,flush=True)
    return 0 if result['passed'] else 1
if __name__=='__main__':raise SystemExit(main())
