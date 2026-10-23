#!/usr/bin/env python3
"""Fresh-check the explicit34-module GEMM model/SL closure, never C kernel witnesses."""
import argparse
from concurrent.futures import FIRST_COMPLETED, ThreadPoolExecutor, wait
import hashlib
import importlib.util
import json
from pathlib import Path
import re
import shutil
import subprocess
import sys
import threading
import time

sys.dont_write_bytecode = True
HERE = Path(__file__).resolve().parent
CASE = HERE.parent
REPO = CASE.parents[3]
sha = lambda p: hashlib.sha256(Path(p).read_bytes()).hexdigest()
read = lambda p: json.loads(Path(p).read_text())


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--name', required=True, help='New evidence run name')
    parser.add_argument('--jobs', type=int, choices=[1, 2], default=2)
    parser.add_argument('--wall-seconds', type=int, default=300)
    parser.add_argument('--environment-tools', type=Path, default=REPO/'verification/qcp/tools',
                        help='Public environment capability checkout tools directory; default same repository')
    args = parser.parse_args()
    if not re.fullmatch(r'[A-Za-z0-9_-]+', args.name) or args.wall_seconds <= 0:
        parser.error('Use a simple new name and positive timeout')
    manifest = read(HERE/'manifest.json')
    env_file = args.environment_tools.resolve()/'environment.py'
    if not env_file.is_file() or sha(env_file) != manifest['environment_dependency']['sha256']:
        raise RuntimeError('Install the declared public environment capability PR#5; environment.py identity differs')
    spec = importlib.util.spec_from_file_location('gemm_public_environment', env_file)
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    environment = module.load_environment()
    run = CASE/'.build'/args.name
    run.mkdir(parents=True, exist_ok=False)
    modules = manifest['modules']
    assert len(modules) == manifest['module_count'] == 34
    names = {x['module'] for x in modules}
    assert len(names) == 34 and all(set(x['project_imports']) <= names for x in modules)
    guards = {str(HERE/'manifest.json'): sha(HERE/'manifest.json'), str(env_file): sha(env_file),
              str(HERE/'check.py'): sha(HERE/'check.py'), str(HERE/'ModelGate.v'): sha(HERE/'ModelGate.v')}
    flags = list(environment['flags'])
    for namespace in dict.fromkeys(x['namespace'] for x in modules):
        folder = run/'coq'/(namespace.replace('.', '/') or 'relations')
        folder.mkdir(parents=True, exist_ok=True)
        flags += ['-Q', str(folder), namespace]
    sources = {}
    for item in modules:
        source = REPO/item['reused_repository_source'] if item['reused_repository_source'] else CASE/item['package_source']
        assert sha(source) == item['source_sha256'], ('Model source changed', source)
        code = re.sub(r'\(\*.*?\*\)', '', source.read_text(), flags=re.S)
        assert not re.search(r'\b(?:Admitted|admit|Axiom|Parameter)\b', code), ('Unproved project declaration', source)
        target = run/'coq'/(item['namespace'].replace('.', '/') or 'relations')/item['name']
        shutil.copyfile(source, target)
        guards[str(source)] = item['source_sha256']
        sources[item['module']] = target
    assert not list(run.rglob('*.vo')), 'Fresh model run cannot begin with local objects'
    for item in manifest['review_files']:
        assert sha(CASE/item['path']) == item['sha256'], ('Review input changed', item['path'])
        guards[str(CASE/item['path'])] = item['sha256']
    (run/'inputs.json').write_text(json.dumps(guards, indent=2)+'\n')
    (run/'flags.json').write_text(json.dumps(flags, indent=2)+'\n')
    (run/'environment.json').write_text(json.dumps(environment, indent=2)+'\n')
    records = []
    lock = threading.Lock()
    state = {'passed': False, 'scope': 'GEMM mathematical/value/memory model closure only',
             'C_VCs_checked': 0, 'local_850_C_witnesses_shipped': False,
             'raw_C_kernel_or_ISA_proved': False, 'local_modules': 34, 'jobs': args.jobs,
             'per_compiler_AS_GiB': 16, 'per_compiler_CPU_and_wall_seconds': args.wall_seconds,
             'external_libraries_reused': True, 'source_to_external_vo_build_history_established': False,
             'run_directory': str(run), 'records': records}

    def save():
        (run/'result.json').write_text(json.dumps(state, indent=2)+'\n')

    def compile_one(name, source):
        command = ['/usr/bin/prlimit', '--as=17179869184', '--cpu='+str(args.wall_seconds), '--',
                   '/usr/bin/time', '-v', '-o', str(run/(name+'.resources.log')),
                   environment['coqc'], *flags, str(source)]
        start = time.monotonic()
        with (run/(name+'.log')).open('w') as output:
            try:
                result = subprocess.run(command, cwd=run, stdout=output, stderr=subprocess.STDOUT,
                                        timeout=args.wall_seconds+5, env={**__import__('os').environ, 'COQPATH': ''})
                code = result.returncode
            except subprocess.TimeoutExpired:
                code = 124
        record = {'module': name, 'source': str(source), 'source_sha256': sha(source),
                  'ordinary_coqc_exit': code, 'seconds': time.monotonic()-start,
                  'command': command, 'log_sha256': sha(run/(name+'.log'))}
        if code == 0:
            record['object_sha256'] = sha(source.with_suffix('.vo'))
        with lock:
            records.append(record)
            save()
        print(name, code, flush=True)
        if code: raise RuntimeError('Model compilation failed: '+name)

    started = time.monotonic()
    pending = {x['module']: x for x in modules}
    finished = set()
    active = {}
    try:
        with ThreadPoolExecutor(max_workers=args.jobs) as pool:
            while pending or active:
                for name, item in list(pending.items()):
                    if len(active) == args.jobs: break
                    if set(item['project_imports']) <= finished:
                        active[pool.submit(compile_one, name, sources[name])] = name
                        del pending[name]
                if not active: raise RuntimeError('Unknown/cyclic model dependency')
                completed, _ = wait(active, return_when=FIRST_COMPLETED)
                for future in completed:
                    future.result()
                    finished.add(active.pop(future))
        gate = run/'ModelGate.v'
        gate.write_bytes((HERE/'ModelGate.v').read_bytes())
        compile_one('ModelGate', gate)
        state['source_inputs_unchanged'] = all(sha(p) == h for p, h in guards.items())
        assert state['source_inputs_unchanged']
        state.update(passed=True, freshly_compiled_model_modules=len(finished), gate_checked=True)
    finally:
        state['seconds'] = time.monotonic()-started
        save()
    print(json.dumps({k: v for k, v in state.items() if k != 'records'}, indent=2))


if __name__ == '__main__':
    main()
