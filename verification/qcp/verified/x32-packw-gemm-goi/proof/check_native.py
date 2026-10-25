#!/usr/bin/env python3
"""Finite executions of original and disclosed compatible SIMD C with migrated indexed oracle; no formal kernel credit."""
from pathlib import Path
import argparse, hashlib, json, shlex, shutil, subprocess, tempfile, time

C = Path(__file__).resolve().parent.parent
sha = lambda p: hashlib.sha256(Path(p).read_bytes()).hexdigest()

def main():
    ap = argparse.ArgumentParser()
    ap.add_argument('--sanitizer', choices=['undefined', 'address'], default='undefined')
    args = ap.parse_args()
    (C / '.build').mkdir(exist_ok=True)
    run = Path(tempfile.mkdtemp(prefix='native-' + args.sanitizer + '-', dir=C / '.build'))
    snapshot = run / 'input'
    inputs = ['impl/testNEON.c', 'impl/testRVV.c', 'proof/original/testNEON.c',
              'proof/original/testRVV.c', 'proof/originals.json', 'proof/repair.json', 'proof/repair.patch', 'proof/native/isa_arrays.h',
              'proof/native/regression.c', 'proof/check_native.py','spec.c','shim/kernel_specs.h','shim/observe.c','shim/observe.h']
    inputs += [p for p in json.loads((C/'proof/repair.json').read_text())['patch_files'] if p not in inputs]
    pins = {p: sha(C / p) for p in inputs}
    for p in inputs:
        target = snapshot / p
        target.parent.mkdir(parents=True, exist_ok=True)
        shutil.copy2(C / p, target)
    records = []
    def execute(label, command, expected=0, runtime=False):
        cmd = list(map(str, command))
        if runtime and args.sanitizer == 'address':
            observer = "import pathlib,subprocess,sys,json;p=pathlib.Path('/proc/self/cgroup').read_text().strip().split('::',1)[1];d=pathlib.Path('/sys/fs/cgroup')/p.lstrip('/');m=(d/'memory.max').read_text().strip();s=(d/'memory.swap.max').read_text().strip();assert m=='17179869184'and s=='0';print(json.dumps({'actual_memory_max':m,'actual_memory_swap_max':s}),flush=True);sys.exit(subprocess.run(sys.argv[1:]).returncode)"
            cmd = ['systemd-run', '--user', '--wait', '--pipe', '--quiet', '-p',
                   'MemoryMax=17179869184', '-p', 'MemorySwapMax=0', 'python3', '-c', observer, *cmd]
        else:
            cmd = ['prlimit', '--as=17179869184:17179869184', '--', *cmd]
        start = time.monotonic()
        log = run / (label + '.log')
        with log.open('w') as f:
            code = subprocess.run(cmd, cwd=run, stdout=f, stderr=f, timeout=1800).returncode
        records.append({'label': label, 'command': cmd, 'exit_code': code,
                        'expected_exit_code': expected, 'seconds': time.monotonic() - start,
                        'log_sha256': sha(log)})
        text = log.read_text()
        assert code == expected, (label, code, text[-3000:])
        assert not any(x in text for x in ['runtime error:', 'ERROR: AddressSanitizer', 'ERROR: LeakSanitizer'])
        if runtime and args.sanitizer == 'address':
            assert '"actual_memory_max": "17179869184"' in text
            assert '"actual_memory_swap_max": "0"' in text
        return text
    result = {'passed': False, 'whole_kernel_verified': False,
              'scope': 'Finite original/compatible SIMD C; indexed oracle preserves OLD holes/gaps and RO aliases; native emulator, no ISA proof',
              'sanitizer': args.sanitizer, 'run_directory': str(run), 'input_sha256': pins,
              'records': records, 'configured_jobs': 32, 'actual_max_parallel_processes': 1,
              'per_process_memory_GiB': 16, 'per_command_timeout_seconds': 1800}
    try:
        originals = json.loads((snapshot / 'proof/originals.json').read_text())
        repair=json.loads((snapshot/'proof/repair.json').read_text())
        for arch in ['NEON','RVV']:
            assert pins['proof/original/test'+arch+'.c']==originals['identity'][arch]['sha256']==repair['original_'+arch+'_sha256']
            assert pins['impl/test'+arch+'.c']==repair['actual_'+arch+'_sha256']
        assert pins['proof/repair.patch']==repair['patch_sha256']
        replay=run/'patch-replay';(replay/'impl').mkdir(parents=True)
        for arch in ['NEON','RVV']:
            shutil.copy2(snapshot/('proof/original/test'+arch+'.c'),replay/('impl/test'+arch+'.c'))
        execute('zero-fuzz-patch',['patch','--batch','--fuzz=0','-p1','-d',replay,'-i',snapshot/'proof/repair.patch'])
        assert all(sha(replay/name)==pins[name]for name in repair['patch_files'])
        flags = ['gcc-12', '-std=c11', '-O1', '-g', '-fsanitize=' + args.sanitizer,
                 '-fno-sanitize-recover=all', '-include', snapshot / 'proof/native/isa_arrays.h']
        objects = []
        dependencies = {}
        for label, path, rename in [
            ('neon', 'impl/testNEON.c', []), ('rvv', 'impl/testRVV.c', []),
            ('original-neon','proof/original/testNEON.c',['-Dtest_neon=original_neon']),
            ('original-rvv','proof/original/testRVV.c',['-Dtest_rvv=original_rvv']),
            *[(Path(name).stem,name,[])for name in repair['patch_files'] if name.startswith('shim/')and name.endswith('.c')],
            ('observe','shim/observe.c',[]),('caller','spec.c',[]),
            ('driver', 'proof/native/regression.c', [])]:
            dep = execute('dependencies-' + label, [*flags, *rename, '-MM', snapshot / path])
            for filename in shlex.split(dep.replace('\\\n', ' ').split(':', 1)[1]):
                p = Path(filename).resolve()
                relative = str(p.relative_to(snapshot))
                assert relative in pins and sha(p) == pins[relative], relative
                dependencies[relative] = sha(p)
            obj = run / (label + '.o')
            execute('compile-' + label, [*flags, *rename, '-c', snapshot / path, '-o', obj])
            objects.append(obj)
        result['actual_recursive_local_input_sha256'] = dependencies
        executable = run / 'regression'
        execute('link', [*flags, *objects, '-o', executable])
        output = execute('original-compatible-regression', [executable], runtime=True)
        stats = json.loads(output.strip().splitlines()[-1])
        assert stats['passed'] is True and stats['cases'] == 41184 and stats['aliased_bias_cases'] == 13728 and stats['all_old_holes_gaps_and_guards'] and stats['inputs_preserved']
        result['original_compatible_regression'] = stats
        one = execute('wrong-one', [executable, '--wrong-one'], 2, runtime=True)
        both = execute('wrong-both', [executable, '--wrong-both'], 2, runtime=True)
        assert 'compare=0 independent_oracle_rejected=1' in one
        assert 'compare=1 independent_oracle_rejected=1' in both
        assert pins == {p: sha(C / p) for p in inputs}
        result.update(passed=True, originals_preserved_and_compatible_variant_exact_patch=True, both_wrong_still_equal_oracle_rejected=True)
        if args.sanitizer == 'address':
            result.update(actual_memory_max=17179869184, actual_memory_swap_max=0, LSan_enabled=True)
    except Exception as error:
        result['error'] = str(error)
    (run / 'status.json').write_text(json.dumps(result, indent=2) + '\n')
    target = C / 'proof' / ('native-' + args.sanitizer + '-status.json')
    if target.exists():
        history = C / 'proof/history'
        history.mkdir(exist_ok=True)
        shutil.copy2(target, history / (target.stem + '-' + sha(target) + '.json'))
    target.write_bytes((run / 'status.json').read_bytes())
    print(json.dumps({k: v for k, v in result.items() if k not in ['records', 'input_sha256', 'actual_recursive_local_input_sha256']}, indent=2))
    raise SystemExit(not result['passed'])

if __name__ == '__main__':
    main()
