#!/usr/bin/env python3
"""Replay current actual scalar-field C and independent oracles under ASan/UBSan.
ASan runtime is bounded by an observed 16 GiB cgroup, because its virtual shadow
mapping is incompatible with an RLIMIT_AS of 16 GiB. Compilation keeps RLIMIT_AS.
"""
from concurrent.futures import ThreadPoolExecutor
from pathlib import Path
import hashlib, json, re, shutil, subprocess, tempfile, threading, time

CASE = Path(__file__).resolve().parent.parent
sha = lambda p: hashlib.sha256(Path(p).read_bytes()).hexdigest()

def main():
    run = Path(tempfile.mkdtemp(prefix='formal-native-asan-', dir=CASE/'.build'))
    records = []; lock = threading.Lock()
    state = dict(passed=False, formal_proof=False, whole_kernel_verified=False,
                 scope='Finite current scalar-field helper/kernel/public-wrapper oracle; no formal C-VC credit',
                 run_directory=str(run), records=records, parallel_jobs=16)
    observer = """import pathlib,subprocess,sys,json
p=pathlib.Path('/proc/self/cgroup').read_text().strip().split('::',1)[1]
d=pathlib.Path('/sys/fs/cgroup')/p.lstrip('/')
m=(d/'memory.max').read_text().strip();s=(d/'memory.swap.max').read_text().strip()
assert m=='17179869184' and s=='0'
print(json.dumps({'actual_memory_max':m,'actual_memory_swap_max':s}),flush=True)
sys.exit(subprocess.run(sys.argv[1:]).returncode)
"""
    runtime = ['systemd-run','--user','--wait','--pipe','--quiet','-p','MemoryMax=17179869184',
               '-p','MemorySwapMax=0','python3','-c',observer]
    def execute(label, command, expected=0, is_runtime=False):
        cwd=run/'jobs'/label; cwd.mkdir(parents=True)
        cmd=[*(runtime if is_runtime else ['prlimit','--as=17179869184:17179869184','--']),*map(str,command)]
        log=run/(label+'.log'); start=time.monotonic()
        with log.open('w') as f:
            code=subprocess.run(cmd,cwd=cwd,stdout=f,stderr=f,timeout=1200).returncode
        with lock:
            records.append(dict(label=label, command=cmd, exit_code=code, expected_exit=expected,
                                seconds=time.monotonic()-start, log_sha256=sha(log)))
        assert code==expected, label+': '+log.read_text()[-2000:]
        return log.read_text()
    try:
        native_path=CASE/'proof/formal-native-status.json'
        native=json.loads(native_path.read_text())
        assert native['passed'] and native['actual_c_units']==36
        inputs=native['input_sha256']
        assert all(sha(CASE/n)==h for n,h in inputs.items()), 'UBSan native source is stale'
        prior=Path(native['run_directory'])
        for name in ['harness.c','formal_api.h']:
            assert sha(prior/name)==native['generated_harness_sha256'][name]
            shutil.copyfile(prior/name,run/name)
        # The diagnostic intentionally exits early on its injected wrong result.
        # Free the six owned allocations first so LeakSanitizer stays enabled.
        harness=run/'harness.c'; text=harness.read_text()
        assert text.count('exit(2);')==1
        replacement='free(in);free(copy);free(z);free(left);free(right);free(want);exit(2);'
        harness.write_text(text.replace('exit(2);',replacement))
        state['harness_diagnostic_cleanup']={'original_sha256':native['generated_harness_sha256']['harness.c'],
            'original':'exit(2);','replacement':replacement,'occurrences':1,
            'scope':'Only the injected negative-control failure path releases its allocations before the same exit(2).'}
        before={**inputs, 'proof/check_native_asan.py':sha(Path(__file__)),
                'proof/formal-native-status.json':sha(native_path)}
        units=[(p,[]) for p in sorted((CASE/'shim').glob('*.c'))]
        units += [(CASE/'impl/testNEON.c',['-include',str(CASE/'shim/neon_frontend.h')]),
                  (CASE/'impl/testRVV.c',['-include',str(CASE/'shim/rvv_frontend.h')]),
                  (CASE/'spec.c',[])]
        assert len(units)==36
        compiler=['gcc','-std=c11','-O1','-g','-fsanitize=address,undefined',
                  '-fno-omit-frame-pointer','-fno-sanitize-recover=all']
        def compile_unit(item):
            source,extra=item; obj=run/(source.stem+'.o')
            execute(source.stem,[*compiler,*extra,'-c',source,'-o',obj])
            return obj
        with ThreadPoolExecutor(max_workers=16) as pool:
            objects=list(pool.map(compile_unit,units))
        execute('link',[*compiler,run/'harness.c',*objects,'-o',run/'test'])
        output=execute('native',[run/'test'],is_runtime=True)
        lines=output.splitlines(); bound=json.loads(next(l for l in lines if 'actual_memory_max' in l))
        assert bound=={'actual_memory_max':'17179869184','actual_memory_swap_max':'0'}
        counts=json.loads(lines[-1])
        assert counts['cases']==native['cases']==11664 and counts['lanes_per_side']==native['lanes_per_side']==269730
        assert counts['failures']==0
        match=re.search(r'primitive_oracle cases=(\d+) lanes=(\d+) failures=0',output)
        assert match and int(match[1])==native['primitive_oracle_cases']==109824
        assert int(match[2])==native['primitive_oracle_lanes']==1647360
        wrong_one=execute('negative-one',[run/'test','--negative-one'],expected=2,is_runtime=True)
        wrong_both=execute('negative-both',[run/'test','--negative-both'],expected=2,is_runtime=True)
        assert 'negative comparator=1' in wrong_both
        for text in [wrong_one,wrong_both]:
            assert 'AddressSanitizer' not in text and 'runtime error:' not in text
        assert all(sha(CASE/n)==h for n,h in before.items()), 'Source changed during ASan run'
        state.update(counts, passed=True, ASan_UBSan=True, actual_c_units=36,
                     actual_memory_max=17179869184, actual_memory_swap_max=0,
                     primitive_oracle_cases=109824,primitive_oracle_lanes=1647360,
                     shared_wrong_result_rejected=True,input_sha256=before,
                     generated_harness_sha256={n:sha(run/n) for n in ['harness.c','formal_api.h']})
    except Exception as error:
        state['error']=str(error)
    (run/'status.json').write_text(json.dumps(state,indent=2)+'\n')
    target=CASE/'proof/native-asan-status.json'
    if target.exists():
        (CASE/'proof/history'/('native-asan-'+sha(target)+'.json')).write_bytes(target.read_bytes())
    target.write_bytes((run/'status.json').read_bytes())
    print(json.dumps({k:state.get(k) for k in ['passed','cases','lanes_per_side','run_directory','error']},indent=2))
    return 0 if state['passed'] else 1

if __name__=='__main__':
    raise SystemExit(main())
