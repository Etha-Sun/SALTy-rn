#!/usr/bin/env python3
"""Finite current scalar-field C/caller ASan replay in an actual16GiB cgroup."""
from pathlib import Path
from concurrent.futures import ThreadPoolExecutor
import json,subprocess,tempfile,time,threading,shlex,hashlib
from check_native import body_replace
C=Path(__file__).resolve().parent.parent
sha=lambda p:hashlib.sha256(Path(p).read_bytes()).hexdigest()
def main():
    run=Path(tempfile.mkdtemp(prefix='native-asan64-',dir=C/'.build'));records=[];lock=threading.Lock()
    sources=[C/n for n in ['shim/scalar.c','shim/control.c','shim/neon_load.c','shim/neon_store.c',
        'shim/signed_tail.c','shim/neon_ext.c','shim/rvv_active.c','shim/rvv_load.c',
        'shim/rvv_store.c','shim/neon_composed.c']]
    sources += [C/x['source'] for kind in ['neon','rvv'] for x in json.loads((C/'proof'/(kind+'-arithmetic-units.json')).read_text())]
    harness=C/'shim/native_formal.c';inputs={};status=dict(passed=False,whole_kernel_verified=False,
        scope='Independent finite actual-C sanitizer/oracle regression, not a formal proof',
        run_directory=str(run),parallel_jobs=16,records=records)
    def execute(label,cmd,expect=0,capped=True):
        command=['prlimit','--as=17179869184:17179869184','--',*map(str,cmd)] if capped else list(map(str,cmd))
        log=run/(label+'.log');start=time.monotonic()
        with log.open('w') as stream:code=subprocess.run(command,cwd=run,stdout=stream,stderr=stream,timeout=1800).returncode
        with lock:records.append(dict(label=label,command=command,exit_code=code,expected_exit_code=expect,
            seconds=time.monotonic()-start,log_sha256=sha(log)))
        assert code==expect,(label,code,log.read_text()[-2500:]);print(label,code,flush=True)
        return log.read_text()
    try:
        for i,source in enumerate([harness,*sources]):
            dependencies=execute('deps-'+str(i),['gcc','-DQCP_NATIVE','-MM',source]).replace('\\\n',' ')
            for line in dependencies.splitlines():
                for name in shlex.split(line.split(':',1)[1]):
                    path=Path(name).resolve();assert path.is_relative_to(C)
                    inputs[str(path.relative_to(C))]=sha(path)
        inputs['proof/check_native_asan.py']=sha(Path(__file__))
        flags=['gcc','-DQCP_NATIVE','-O1','-g','-std=c11','-fsanitize=address,undefined',
            '-fno-sanitize-recover=all','-fno-omit-frame-pointer','-I',C/'shim']
        objects=[run/(str(i)+'.o') for i in range(len(sources))]
        with ThreadPoolExecutor(max_workers=16) as pool:
            list(pool.map(lambda item:execute('compile-'+str(item[0]),[*flags,'-c',item[1],'-o',objects[item[0]]]),enumerate(sources)))
        launch="import pathlib,subprocess,sys,json;p=pathlib.Path('/proc/self/cgroup').read_text().strip().split('::',1)[1];d=pathlib.Path('/sys/fs/cgroup')/p.lstrip('/');m=(d/'memory.max').read_text().strip();s=(d/'memory.swap.max').read_text().strip();assert m=='17179869184'and s=='0';print(json.dumps({'actual_memory_max':m,'actual_memory_swap_max':s}),flush=True);sys.exit(subprocess.run(sys.argv[1:]).returncode)"
        prefix=['systemd-run','--user','--wait','--pipe','--quiet','-p','MemoryMax=17179869184','-p','MemorySwapMax=0','python3','-c',launch]
        for name,extra in [('composed',[]),('canonical-nested',['-DQCV_NESTED_REFERENCE'])]:
            binary=run/name;execute(name+'-build',[*flags,*extra,harness,*objects,'-o',binary])
            text=execute(name,[*prefix,binary],capped=False)
            assert 'kernel_cases=27496 kernel_lanes_per_side=1998725' in text
        bad=body_replace((C/'shim/scalar.c').read_text(),'qcp_qcv_neon_qrdmulh','(void)a;(void)b;return 0;')
        bad=body_replace(bad,'qcp_qcv_rvv_clip15','(void)p;return 0;');source=run/'bad-scalar.c';source.write_text(bad)
        execute('bad-build',[*flags,harness,source,*objects[1:],'-o',run/'bad'])
        text=execute('bad-oracle-rejected',[*prefix,run/'bad','m'],expect=1,capped=False)
        assert 'mismatch ' in text and 'AddressSanitizer' not in text and 'LeakSanitizer' not in text
        assert all(sha(C/n)==digest for n,digest in inputs.items())
        status.update(passed=True,input_sha256=inputs,actual_memory_max=17179869184,actual_memory_swap_max=0,
            actual_provider_units=len(sources),cases_per_variant=27496,lanes_per_side=1998725,
            ASan_UBSan=True,independent_oracle=True,common_wrong_negative_rejected=True)
    except Exception as error:status['error']=str(error);print(error,flush=True)
    for path in [run/'status.json',C/'proof/native-asan-status.json']:path.write_text(json.dumps(status,indent=2)+'\n')
    print('RUN',run,flush=True)
    return 0 if status['passed'] else 1
if __name__=='__main__':raise SystemExit(main())
