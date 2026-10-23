#!/usr/bin/env python3
"""Replay a frozen QCP generator failure. No Coq or kernel proof is performed."""
from pathlib import Path
import argparse
import hashlib
import importlib.util
import json
import os
import re
import resource
import signal
import subprocess
import sys
import time

HERE = Path(__file__).resolve().parent


def sha(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def dump(path, value):
    path.write_text(json.dumps(value, indent=2) + '\n')


def original_tokens(path):
    # Only the fixed, hash-reviewed GEMM function is supported. This is an
    # identity check, not a C parser or a source-refinement theorem.
    text = re.sub(r'/\*.*?\*/|//[^\n]*', '', path.read_text(), flags=re.S)
    text = text[text.index('void test_neon('):]
    if '"' in text or "'" in text:
        raise RuntimeError('unsupported literal in frozen GEMM function')
    return re.findall(r'[A-Za-z_][A-Za-z_0-9]*|0[xX][0-9a-fA-F]+|[0-9]+[uUlL]*|>>=|<<=|->|\+\+|--|&&|\|\||<=|>=|==|!=|<<|>>|\+=|-=|\*=|/=|%=|&=|\|=|\^=|\S', text)


def limits():
    resource.setrlimit(resource.RLIMIT_AS, (16 * 1024**3, 16 * 1024**3))
    resource.setrlimit(resource.RLIMIT_STACK, (512 * 1024**2, 512 * 1024**2))
    resource.setrlimit(resource.RLIMIT_CORE, (0, 0))
    resource.setrlimit(resource.RLIMIT_CPU, (900, 901))


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--name', required=True)
    parser.add_argument('--environment-tools', type=Path)
    parser.add_argument('--original-kernel', type=Path)
    parser.add_argument('--preprocess-only', action='store_true')
    parser.add_argument('--wall-seconds', type=int, default=900)
    args = parser.parse_args()
    if not re.fullmatch(r'[A-Za-z0-9][A-Za-z0-9_-]*', args.name):
        parser.error('name must be one simple, new run directory component')
    if not 1 <= args.wall_seconds <= 900:
        parser.error('wall budget must be in 1..900 seconds')
    manifest = json.loads((HERE / 'manifest.json').read_text())
    before = {name: sha(HERE / name) for name in manifest['inputs']}
    if before != manifest['inputs']:
        raise RuntimeError('frozen diagnostic input mismatch')
    tools = args.environment_tools or HERE.parents[1] / 'tools'
    if sha(tools / 'environment.py') != manifest['environment_py_sha256']:
        raise RuntimeError('expected reviewed public environment capability from PR5')
    spec = importlib.util.spec_from_file_location('qcp_reproducer_environment', tools / 'environment.py')
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    environment = module.load_environment()
    if environment['tool_sha256']['qcp'] != manifest['symexec_sha256']:
        raise RuntimeError('unexpected generator binary')
    original = args.original_kernel or HERE.parents[1] / manifest['original_kernel_repository_source'].removeprefix('verification/qcp/')
    if sha(original) != manifest['original_kernel_sha256']:
        raise RuntimeError('expected original source from GEMM model PR6')
    source = HERE / 'input/neon-undef-original-stackcomplete.c'
    if original_tokens(source) != original_tokens(original):
        raise RuntimeError('annotated function executing tokens differ from original')
    out = HERE / '.build' / args.name
    out.mkdir(parents=True, exist_ok=False)
    dump(out / 'environment.json', environment)
    dump(out / 'input-identity.json', before)
    unit = out / 'neon_full.c'
    plain = out / 'executing.c'
    gcc = environment['dependencies']['gcc']
    for keep_comments, target, expected in [(True, unit, manifest['annotated_CPP_sha256']),
                                           (False, plain, manifest['executing_CPP_sha256'])]:
        command = [gcc, '-E', '-P', *(['-CC'] if keep_comments else []), '-nostdinc', str(source), '-o', str(target)]
        result = subprocess.run(command, capture_output=True, text=True, timeout=30)
        dump(out / ('CPP-annotated.json' if keep_comments else 'CPP-executing.json'),
             {'command': command, 'exit_code': result.returncode, 'stderr': result.stderr,
              'sha256': sha(target) if target.is_file() else None})
        if result.returncode or sha(target) != expected:
            raise RuntimeError('CPP differs from frozen generator input; see ' + str(out))
    if args.preprocess_only:
        dump(out / 'result.json', {'scope': 'input/source/CPP identity only', 'QCP_executed': False,
                                  'C_VCs_proved': 0, 'kernel_proved': False,
                                  'original_function_tokens_equal': True, 'both_CPP_hashes_match': True})
        print(out, 'identity checks passed; generator not executed', flush=True)
        return 0
    command = [environment['qcp'], '--arch=64', '--endian=little', '--no-float-finite-vc',
               '--no-exec-info', '--no-record-strategies', '--input-file=' + str(unit),
               '--coq-output-dir=' + str(out), '--coq-logic-path=FullDomainNeonRun',
               '-slp', str(HERE / 'input'), 'GemmNeon', '--strategy-application-limit', '4096']
    dump(out / 'command.json', command)
    started = time.monotonic()
    with (out / 'qcp.log').open('w') as log:
        process = subprocess.Popen(['/usr/bin/time', '-v', '-o', str(out / 'resources.log'), *command],
                                   stdout=log, stderr=subprocess.STDOUT, preexec_fn=limits,
                                   start_new_session=True, env={**os.environ, 'COQPATH': ''})
        dump(out / 'pid.json', {'pid': process.pid, 'process_group': process.pid})
        try:
            code = process.wait(timeout=args.wall_seconds)
        except subprocess.TimeoutExpired:
            os.killpg(process.pid, signal.SIGKILL)
            process.wait()
            code = 124
    resource_text = (out / 'resources.log').read_text()
    goal = out / 'neon_full_goal.v'
    count = len(re.findall(r'^Axiom proof_of_\w+', goal.read_text(), re.M)) if goal.is_file() else 0
    after = {name: sha(HERE / name) for name in before}
    dump(out / 'result.json', {'scope': 'QCP generator robustness diagnostic only',
        'QCP_executed': True, 'generation_exit_code': code,
        'SIGSEGV_observed': code in (-11, 139) and 'signal 11' in resource_text,
        'seconds': time.monotonic() - started, 'memory_limit_GiB': 16, 'stack_limit_MiB': 512,
        'wall_seconds': args.wall_seconds, 'inputs_unchanged': before == after,
        'annotated_CPP_sha256': sha(unit), 'executing_CPP_sha256': sha(plain),
        'generated_C_VCs': count, 'C_VCs_proved': 0, 'Coq_executed': False,
        'kernel_proved': False, 'ISA_proved': False,
        'interpretation': 'A normal generator exit would still require all Coq/body/source/ISA obligations. A crash is a tool failure, not a GEMM counterexample.'})
    print(out, 'generator exit', code, 'C VCs generated', count, 'proved 0', flush=True)
    return 0 if code == 0 and before == after else 1


if __name__ == '__main__':
    try:
        raise SystemExit(main())
    except (OSError, ValueError, KeyError, RuntimeError, subprocess.SubprocessError) as exc:
        print('reproducer failed:', exc, file=sys.stderr)
        raise SystemExit(2)
