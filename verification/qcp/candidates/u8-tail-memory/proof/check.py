#!/usr/bin/env python3
"""Regenerate the fixed byte-tail C goals and check their full source closure."""
from pathlib import Path
import argparse
import hashlib
import importlib.util
import json
import os
import re
import resource
import shutil
import signal
import subprocess
import time

CASE = Path(__file__).resolve().parents[1]
QCP = CASE.parents[1]
REPO = QCP.parents[1]


def sha(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def dump(path, value):
    path.write_text(json.dumps(value, indent=2) + '\n')


def tokens(text):
    text = re.sub(r'/\*.*?\*/|//[^\n]*', '', text, flags=re.S)
    return re.findall(r'[A-Za-z_]\w*|\d+|==|!=|->|\+\+|\+=|[^\s]', text)


def original_patterns(text):
    if re.search(r'\buint(?:16x4|32x2)_t\b', text):
        raise RuntimeError('unsupported independent word-vector context')
    found = []
    for line in text.splitlines():
        for bits in (32, 16):
            if 'vst1_lane_u%d(' % bits in line:
                call = line.strip().split(';')[0] + ';'
                expected = 'vst1_lane_u%d((void*) output, vreinterpret_u%d_u8(vacc), 0);' % (bits, bits)
                if tokens(call) != tokens(expected):
                    raise RuntimeError('unsupported original tail call pattern')
                found.append((bits, call))
    if sorted(bits for bits, _ in found) != [16, 32]:
        raise RuntimeError('unsupported original call multiplicity')
    return found


def limits():
    resource.setrlimit(resource.RLIMIT_AS, (16 * 1024**3, 16 * 1024**3))
    resource.setrlimit(resource.RLIMIT_CPU, (300, 301))
    resource.setrlimit(resource.RLIMIT_CORE, (0, 0))


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--name', required=True)
    parser.add_argument('--environment-tools', type=Path)
    parser.add_argument('--native', action='store_true', help='Also replay the ASan/UBSan regression; not a proof')
    args = parser.parse_args()
    if not re.fullmatch(r'[A-Za-z0-9][A-Za-z0-9_-]*', args.name):
        parser.error('use one new run-directory component')
    manifest = json.loads((CASE / 'proof/manifest.json').read_text())
    for rel, item in manifest['sources'].items():
        if sha(CASE / rel) != item['sha256']:
            raise RuntimeError('source identity mismatch: ' + rel)
    original = (CASE / 'reference/testNEON.c').read_text()
    adapter = (CASE / 'src/adapter.c').read_text()
    for bits, call in original_patterns(original):
        match = re.search(r'void original_tail_store%d\([^\n]*\).*?\n\{(.*?)\n\}' % bits, adapter, re.S)
        if not match or tokens(match[1]) != tokens(call):
            raise RuntimeError('original nested consumer executing tokens differ')
        macro = next(x for x in adapter.splitlines() if x.startswith('#define vst1_lane_u%d' % bits))
        if macro.count('(a)') != 1 or macro.count('(p)') != 1:
            raise RuntimeError('macro operand/pointer evaluation multiplicity changed')
    try:
        original_patterns(original.replace('vreinterpret_u32_u8(vacc), 0', 'vreinterpret_u32_u8(vacc), 1'))
    except RuntimeError:
        pass
    else:
        raise RuntimeError('unsupported lane negative control accepted')
    tools = args.environment_tools or QCP / 'tools'
    if sha(tools / 'environment.py') != manifest['environment_py_sha256']:
        raise RuntimeError('expected reviewed environment capability from PR5')
    spec = importlib.util.spec_from_file_location('tail_environment', tools / 'environment.py')
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    environment = module.load_environment()
    out = CASE / '.build' / args.name
    out.mkdir(parents=True, exist_ok=False)
    dump(out / 'environment.json', environment)
    shutil.copytree(CASE / 'src', out / 'c')
    shutil.copytree(CASE / 'proof/coq', out / 'coq')
    for rel, item in manifest['repository_source'].items():
        source = REPO / item['path']
        if sha(source) != item['sha256']:
            raise RuntimeError('reviewed repository dependency changed: ' + item['path'])
        target = out / 'coq' / Path(rel).relative_to('proof/coq')
        target.parent.mkdir(parents=True, exist_ok=True)
        shutil.copyfile(source, target)
    records = []
    started = time.monotonic()

    def run(label, command, bounded=True):
        command = list(map(str, command))
        t = time.monotonic()
        with (out / (label + '.log')).open('w') as log:
            process = subprocess.Popen(['/usr/bin/time', '-v', '-o', str(out / (label + '.resources.log')), *command],
                                       cwd=out, stdout=log, stderr=subprocess.STDOUT,
                                       env={**os.environ, 'COQPATH': ''}, start_new_session=True,
                                       preexec_fn=limits if bounded else None)
            try:
                code = process.wait(timeout=310)
            except subprocess.TimeoutExpired:
                os.killpg(process.pid, signal.SIGKILL)
                process.wait()
                code = 124
        records.append({'label': label, 'command': command, 'exit': code, 'seconds': time.monotonic() - t})
        dump(out / 'commands.json', records)
        print(label, code, flush=True)
        if code:
            raise RuntimeError(label + ' failed with ' + str(code))

    status = {'passed': False, 'scope': 'shared tail C-body capability only', 'whole_kernel_proved': False,
              'ISA_proved': False, 'external_libraries_reused': True, 'project_objects_reused': False,
              'C_VCs_proved': 0, 'strategies_proved': 0, 'new_distinct_C_VCs': 0}
    try:
        generated = out / 'generated'
        generated.mkdir()
        for source, namespace, target_ns, goal_name in [('adapter.c', 'TailAdapter', 'TailAdapter', 'unit'),
                                                       ('le_store.c', 'U8Tail', 'U8Tail', 'le_store')]:
            # QCP derives goal names from the expanded input basename.
            input_file = out / 'c' / (goal_name + '.expanded.c')
            if source == 'adapter.c':
                input_file = out / 'c/unit.c'
            else:
                input_file = out / 'c/le_store_unit.c'
            run('CPP-' + namespace, [environment['dependencies']['gcc'], '-E', '-P', '-CC', '-nostdinc',
                                     out / 'c' / source, '-o', input_file])
            dest = generated / namespace
            dest.mkdir()
            run('QCP-' + namespace, [environment['qcp'], '--arch=64', '--endian=little',
                '--no-float-finite-vc', '--no-exec-info', '--no-record-strategies',
                '--input-file=' + str(input_file), '--coq-output-dir=' + str(dest),
                '--coq-logic-path=' + namespace, '-slp', out / 'c', namespace])
            new_goal = dest / (input_file.stem + '_goal.v')
            expected = CASE / 'proof/coq' / target_ns / ('unit_goal.v' if source == 'adapter.c' else 'le_store_goal.v')
            # The LE helper was originally generated from le_store.c. Keep its
            # module filename unchanged after checking exact goal contents.
            if sha(new_goal) != sha(expected):
                raise RuntimeError('fresh generated goal differs: ' + namespace)
        strategies = generated / 'Strategies'
        strategies.mkdir()
        run('StrategyCheck', [environment['strategy'], '--arch=64', '--endian=little',
                              '--input-file=' + str(out / 'c/u8_copy.strategies'),
                              '--coq-output-dir=' + str(strategies), '--coq-logic-path=TailAdapter'])
        if sha(strategies / 'u8_copy_strategy_goal.v') != sha(CASE / 'proof/coq/TailAdapter/u8_copy_strategy_goal.v'):
            raise RuntimeError('fresh strategy goal differs')
        (out / 'gate').mkdir()
        flags = list(environment['flags'])
        for namespace in ['LeaderAutomation', 'U8Tail', 'TailAdapter', 'TailReview']:
            flags += ['-Q', str(out / 'coq' / namespace), namespace]
        flags += ['-Q', str(out / 'gate'), 'TailCapability']
        for namespace, name in manifest['module_order']:
            run(namespace + '.' + name, [environment['coqc'], '-time', *flags, out / 'coq' / namespace / (name + '.v')])
        shutil.copyfile(CASE / 'proof/TailCapabilityGate.v', out / 'gate/TailCapabilityGate.v')
        run('TailCapabilityGate', [environment['coqc'], *flags, out / 'gate/TailCapabilityGate.v'])
        names = re.findall(r'^Axiom proof_of_(\w+)', (out / 'coq/TailAdapter/unit_goal.v').read_text(), re.M)
        if len(names) != 41 or len(set(names)) != 41:
            raise RuntimeError('unexpected capability VC set')
        reports = len(re.findall(r'^Axioms:|^Closed under the global context', (out / 'TailAdapter.Checked.log').read_text(), re.M))
        if reports != 41:
            raise RuntimeError('incomplete per-VC assumptions report')
        unchanged = all(sha(CASE / rel) == item['sha256'] for rel, item in manifest['sources'].items())
        if not unchanged:
            raise RuntimeError('source inputs changed during checking')
        status.update({'passed': True, 'C_VCs_proved': 41, 'strategies_proved': 2,
                       'C_body_closure_modules_fresh': 10, 'support_math_modules_fresh': 2,
                       'gate_checked': True, 'all_VC_Print_reports': reports,
                       'fresh_generated_goals_match_archived_sources': True,
                       'source_inputs_unchanged': unchanged})
        if args.native:
            shutil.copyfile(CASE / 'native.c', out / 'c/native.c')
            run('native-build', [environment['dependencies']['gcc'], '-O2', '-std=c11', '-Wall', '-Wextra',
                                 '-Wno-unused-parameter', '-fsanitize=address,undefined', '-fno-omit-frame-pointer',
                                 out / 'c/native.c', '-o', out / 'c/native'], bounded=False)
            # ASan reserves a large virtual shadow address range; it must not
            # inherit the Coq/QCP AS limit. Outer resident-memory budget remains.
            run('native-run', [out / 'c/native'], bounded=False)
            status['native_passed_not_a_proof'] = True
    except (OSError, RuntimeError, ValueError, subprocess.SubprocessError) as exc:
        status.update({'passed': False, 'error': str(exc)})
    status.update({'seconds': time.monotonic() - started, 'records': records})
    dump(out / 'result.json', status)
    print(out, 'passed', status['passed'], flush=True)
    return 0 if status['passed'] else 1


if __name__ == '__main__':
    raise SystemExit(main())
