#!/usr/bin/env python3
"""Finite actual public-caller replay with the same independent integer-bit oracle.
Adapted from check_native.py SHA 31da0f3d264279d747c14159c83a74faa2b17ea1d9505c6b669dc387594a754b. No original counterexample is rerun or overwritten.
The caller is a proof witness, not a runtime comparator.
"""
from concurrent.futures import ThreadPoolExecutor
from pathlib import Path
import argparse,hashlib,json,subprocess,tempfile,time,threading
C=Path(__file__).resolve().parent.parent
sha=lambda p:hashlib.sha256(Path(p).read_bytes()).hexdigest()
def main():
    parser=argparse.ArgumentParser(description=__doc__)
    args=parser.parse_args()
    run=Path(tempfile.mkdtemp(prefix='public-native-',dir=C/'.build'))
    files=[*sorted((C/'impl').glob('*.c')),*sorted((C/'proof/original').glob('*.c')),
           C/'proof/native/isa_arrays.h',C/'proof/native/public_regression.c',C/'public_spec.c',C/'spec.c',*sorted((C/'shim').glob('*.h')),C/'shim/rvv_block32.c',C/'shim/rvv_block32.h',C/'shim/rvv_update_into.c',C/'shim/rvv_update_into.h',C/'shim/read_table.c',C/'shim/read_table.h',C/'shim/read_previous.c',C/'shim/read_previous.h',Path(__file__).resolve()]
    inputs={str(p.relative_to(C)):sha(p)for p in files};records=[];lock=threading.Lock()
    state=dict(passed=False,whole_kernel_verified=False,formal_proof=False,
        scope='Finite actual two-kernel public-caller execution plus independent exact-bit/index oracle and wrong-one/both rejection; no new QCP or ISA proof credit',
        run_directory=str(run),records=records,input_sha256=inputs,configured_parallel_jobs=32,max_live_compile_processes=4)
    observer="""import pathlib,subprocess,sys,json
p=pathlib.Path('/proc/self/cgroup').read_text().strip().split('::',1)[1]
d=pathlib.Path('/sys/fs/cgroup')/p.lstrip('/')
m=(d/'memory.max').read_text().strip();s=(d/'memory.swap.max').read_text().strip()
assert m=='17179869184' and s=='0'
print(json.dumps({'actual_memory_max':m,'actual_memory_swap_max':s}),flush=True)
sys.exit(subprocess.run(sys.argv[1:]).returncode)
"""
    def execute(label,cmd,expected=0,asan=False,heavy=False):
        cap=(32 if heavy else 16)*1024**3
        prefix=(['systemd-run','--user','--wait','--pipe','--quiet','-p','MemoryMax=17179869184','-p','MemorySwapMax=0','python3','-c',observer]if asan else['prlimit','--as='+str(cap)+':'+str(cap),'--'])
        command=[*prefix,*map(str,cmd)];cwd=run/(label+'-cwd');cwd.mkdir();log=run/(label+'.log');start=time.monotonic()
        with log.open('w')as out:code=subprocess.run(command,cwd=cwd,stdout=out,stderr=out,timeout=1800).returncode
        with lock:records.append(dict(label=label,command=command,exit_code=code,expected_exit=expected,seconds=time.monotonic()-start,log_sha256=sha(log)))
        assert code==expected,(label,log.read_text()[-2500:]);print(label,code,flush=True);return log.read_text()
    try:
        for mode,sanitizer in [('undefined','undefined'),('address','address,undefined')]:
            flags=['gcc','-std=c11','-O2'if mode=='undefined'else'-O1','-g','-fsanitize='+sanitizer,'-fno-sanitize-recover=all','-fno-omit-frame-pointer']
            jobs=[('neon',C/'impl/testNEON.c',[]),('rvv',C/'impl/testRVV.c',['-include',str(C/'shim/rvv_block32.h'),'-DARGMAXPOOL_KERNEL_FRONTEND_H','-DARGMAXPOOL_RVV_SPECS_H']),
                  ('original-neon',C/'proof/original/testNEON.c',['-Dtest_neon=original_neon']),
                  ('original-rvv',C/'proof/original/testRVV.c',['-Dtest_rvv=original_rvv']),('block-helper',C/'shim/rvv_block32.c',['-DARGMAXPOOL_KERNEL_FRONTEND_H','-DARGMAXPOOL_RVV_SPECS_H']),('update-helper',C/'shim/rvv_update_into.c',['-DARGMAXPOOL_KERNEL_FRONTEND_H','-DARGMAXPOOL_RVV_SPECS_H']),('read-table',C/'shim/read_table.c',[]),('read-previous',C/'shim/read_previous.c',[]),('public-caller',C/'public_spec.c',[])]
            def compile(item):
                label,source,extra=item;obj=run/(mode+'-'+label+'.o')
                execute(mode+'-'+label,[*flags,*([]if label=='public-caller'else['-include',C/'proof/native/isa_arrays.h']),*extra,'-c',source,'-o',obj]);return obj
            with ThreadPoolExecutor(max_workers=4)as pool:objects=list(pool.map(compile,jobs))
            binary=run/mode;execute(mode+'-link',[*flags,C/'proof/native/public_regression.c',*objects,'-o',binary])
            output=execute(mode+'-regression',[binary],asan=mode=='address');counts=json.loads(output.splitlines()[-1])
            assert counts['cases']==4320 and counts['failures']==0
            if mode=='address':assert '"actual_memory_max": "17179869184"'in output
            state[mode]=counts
            for suffix in ['one','both']:
                text=execute(mode+'-negative-'+suffix,[binary,'--negative-'+suffix],expected=2,asan=mode=='address')
                assert 'oracle_rejected=1'in text
                if suffix=='both':assert 'comparator=1'in text
        assert state['undefined']==state['address']
        assert all(sha(C/n)==h for n,h in inputs.items()),'Native inputs changed during run'
        state.update(passed=True,shared_wrong_result_rejected=True,input_frame_and_output_canaries_checked=True)
    except Exception as error:state['error']=str(error);print(error,flush=True)
    (run/'status.json').write_text(json.dumps(state,indent=2)+'\n')
    (C/'proof/public-native-status.json').write_text(json.dumps(state,indent=2)+'\n')
    print('RUN',run,flush=True)
    return 0 if state['passed'] else 1
if __name__=='__main__':raise SystemExit(main())
