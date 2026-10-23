#!/usr/bin/env python3
"""Rerun original counterexamples and independent finite array/scalar oracle.
QCP_NATIVE selects the host stddef unsigned64 size_t; formal uses explicit ULL64.
The actual unsigned64 width/domain projection is checked separately.
"""
from pathlib import Path
import json,subprocess,tempfile,time,re,shutil
from full_inputs import CASE,sha
def main():
    run=Path(tempfile.mkdtemp(prefix='native-support64-',dir=CASE/'.build'))
    records=[];inputs={n:sha(CASE/n) for n in ['proof/check_native_support.py',
        'shim/runtime.h','shim/scalar.h','shim/scalar.c','shim/counterexamples.c',
        'shim/native_oracle.c','impl/testNEON.c','impl/testRVV.c',
        'proof/original/testNEON.c','proof/original/testRVV.c']}
    def execute(label,cmd,expected=0):
        cmd=['prlimit','--as=17179869184:17179869184','--',*map(str,cmd)]
        log=run/(label+'.log');start=time.monotonic()
        with log.open('w') as stream:code=subprocess.run(cmd,cwd=run,stdout=stream,stderr=stream,timeout=1800).returncode
        rec=dict(label=label,command=cmd,exit_code=code,expected_exit_code=expected,
            seconds=time.monotonic()-start,log_sha256=sha(log));records.append(rec)
        assert code==expected,(label,log.read_text()[-2500:]);print(label,code,flush=True)
        return log.read_text()
    flags=['gcc','-DQCP_NATIVE','-std=c11','-O1','-g','-fsanitize=undefined','-fno-sanitize-recover=all']
    passed=False
    try:
        execute('counter-build',[*flags,CASE/'shim/counterexamples.c',CASE/'shim/scalar.c','-o',run/'counter'])
        normal=execute('counter-rounding',[run/'counter'])
        for side in ['neon','rvv']:
            text=execute('counter-'+side,[run/'counter',side],1)
            assert 'negation of -2147483648' in text and 'cannot be represented' in text
        original=dict(passed=True,scope='Finite original counterexamples, not a formal proof',
            run_directory=str(run),records=list(records),input_sha256=inputs,
            original_output=[127,-128],repaired_output=[127,127],ubsan_reproduced_both_sides=True,
            actual_native_preprocessing='QCP_NATIVE host stddef.h unsigned64')
        assert '127' in normal and '-128' in normal
        target=CASE/'proof/evidence/original-counterexamples.json'
        shutil.copyfile(target,CASE/'proof/history'/('original-counterexamples-'+sha(target)+'.json'))
        target.write_text(json.dumps(original,indent=2)+'\n')
        repair=CASE/'proof/repair.json';old=repair.read_bytes()
        (CASE/'proof/history'/('repair-before-counter-replay-'+sha(repair)+'.json')).write_bytes(old)
        data=json.loads(old);data['counterexamples']['evidence_sha256']=sha(target)
        repair.write_text(json.dumps(data,indent=2)+'\n')
        execute('oracle-build',[*flags,CASE/'shim/native_oracle.c',CASE/'shim/scalar.c','-o',run/'oracle'])
        text=execute('oracle',[run/'oracle'])
        match=re.search(r'scalar_checks=(\d+) kernel_cases=(\d+) kernel_lanes_per_side=(\d+)',text)
        assert match and tuple(map(int,match.groups()))==(157155328,27496,2000540),text
        result=dict(passed=True,formal_proof=False,whole_kernel_verified=False,
            scope='Finite actual repaired array kernel/scalar oracle, not scalar-field formal ABI',
            run_directory=str(run),records=records,input_sha256=inputs,
            scalar_checks=157155328,kernel_cases=27496,kernel_lanes_per_side=2000540,
            ubsan=True,independent_oracle='__int128 with explicit wrap/saturation/floor',
            native_size_t_domain='unsigned64 host stddef.h under QCP_NATIVE')
        assert all(sha(CASE/n)==d for n,d in inputs.items())
        (CASE/'proof/native-oracle-status.json').write_text(json.dumps(result,indent=2)+'\n')
        passed=True
    except Exception as error:
        result=dict(passed=False,whole_kernel_verified=False,error=str(error),records=records,run_directory=str(run))
        print(error,flush=True)
    (run/'status.json').write_text(json.dumps(result,indent=2)+'\n')
    print('RUN',run,flush=True)
    return 0 if passed else 1
if __name__=='__main__':raise SystemExit(main())
