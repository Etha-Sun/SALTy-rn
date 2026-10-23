#!/usr/bin/env python3
"""Rebuild the fixed VLReLU C-call and ordinary-Coq closure from live inputs.

This reuses the verified VADD preparation, coverage parser and dependency
scheduler. No component .vo file is copied into the new build.
"""
import argparse
import hashlib
import importlib.util
import json
from pathlib import Path
from artifact_paths import artifact_path
import re
import shutil
import subprocess
import tempfile
import threading
import time

HERE = Path(__file__).resolve().parent
CASE = HERE.parent
ROOT = next(p for p in CASE.parents if (p / '.git').exists())
BASE = ROOT / 'verification/qcp/verified/f32-vadd'
CORE = ['Model', 'Bits', 'BitsChecked', 'RvvModel', 'RvvFastFrame',
        'NeonPrimitives', 'RvvPrimitiveScalar', 'RvvPrimitiveMul',
        'RvvPrimitiveReinterpret', 'RvvPrimitiveMask', 'RvvPrimitiveMerge',
        'RvvPrimitives', 'NeonResult', 'NeonSelect', 'NeonCalls', 'NeonVcs',
        'neon_vlrelu_strategy_proof', 'NeonChecked', 'RvvResult', 'RvvStrategy',
        'rvv_vlrelu_strategy_proof', 'RvvCalls', 'RvvMemory', 'RvvChecked',
        'WrapperChecked']
BASE_UNITS = [('ByValue', 'shim_unit'), ('ByvalueRvv', 'shim'),
              ('QcpRvv32', 'rvv_load'), ('QcpRvv32', 'rvv_add'), ('QcpRvv32', 'rvv_store')]


def sha(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def module(name, path):
    spec = importlib.util.spec_from_file_location(name, path)
    value = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(value)
    return value


def tokens(text):
    return re.findall(r'\w+|[^\s\w]', re.sub(r'/\*.*?\*/|//[^\n]*', '', text, flags=re.S))


def patch_comments(text, patches):
    original = tokens(text)
    for patch in patches:
        annotation = patch['text']
        if tokens(annotation):
            raise ValueError('Proof patch contains executable tokens')
        before = patch.get('before')
        anchor = before if before is not None else patch['after']
        if text.count(anchor) != 1:
            raise ValueError('Unsupported or ambiguous annotation anchor: ' + anchor)
        replacement = annotation + '\n' + anchor if before is not None else anchor + ' ' + annotation
        text = text.replace(anchor, replacement, 1)
    if tokens(text) != original:
        raise ValueError('Annotations changed original executable tokens')
    return text


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--config', type=Path, required=True)
    parser.add_argument('--dependency-dir', type=Path, required=True)
    parser.add_argument('--jobs', type=int, choices=[1, 2, 3, 4], default=4)
    args = parser.parse_args()
    cfg = json.loads(args.config.read_text())
    dep = args.dependency_dir.resolve()
    run = Path(tempfile.mkdtemp(prefix='full-', dir=CASE / '.build'))
    coq = run / 'coq'
    coq.mkdir()
    records, units, modules = [], [], []
    report = {'passed': False, 'whole_kernel_verified': False,
              'run_directory': str(run), 'records': records, 'actual_c_units': units,
              'scope': 'Both original C kernels and complete C-shim call closure; partial correctness only',
              'external_libraries_rebuilt': False, 'parallel_jobs': args.jobs}
    lock = threading.Lock()

    def save():
        (run / 'status.json').write_text(json.dumps(report, indent=2) + '\n')

    def execute(command, label, timeout=300):
        # Some checked vector proof modules need more than the baseline
        # scheduler's small default; these are finite per-module budgets.
        if label.startswith('VLRelu-'):
            timeout = max(timeout, 1200)
        command = ['prlimit', '--as=17179869184:17179869184', '--', *map(str, command)]
        work = run / 'jobs' / label
        work.mkdir(parents=True, exist_ok=True)
        output = run / (label + '.log')
        start = time.monotonic()
        with output.open('w') as stream:
            try:
                code = subprocess.run(command, cwd=work, stdout=stream,
                                      stderr=stream, timeout=timeout).returncode
            except subprocess.TimeoutExpired:
                code = 124
        with lock:
            records.append({'label': label, 'command': command, 'cwd': str(work),
                            'exit_code': code, 'seconds': time.monotonic() - start,
                            'log_sha256': sha(output)})
            save()
        print(label, code, flush=True)
        if code:
            raise RuntimeError(label + ': ' + output.read_text()[-4000:])

    try:
        coverage = module('full_coverage', BASE / 'proof/coverage.py')
        coverage.C_KEYWORDS.add('return')
        prepare = module('full_prepare', BASE / 'proof/prepare.py')
        parallel = module('full_parallel', BASE / 'proof/parallel.py')
        base_manifest = json.loads((BASE / 'proof/manifest.json').read_text())
        report['dependency_manifest_sha256'] = sha(BASE / 'proof/manifest.json')
        report['dependency_status_sha256'] = sha(dep.parent / 'status.json')
        report['config_sha256'] = sha(args.config)
        report['tool_sha256'] = {n: sha(Path(shutil.which(n)).resolve())
                                for n in ['qcp', 'qcp-env', 'coqc', 'gcc', 'prlimit']}
        dep_status = json.loads((dep.parent / 'status.json').read_text())
        if not dep_status['passed'] or dep_status['scope'] != 'full':
            raise ValueError('Dependency directory requires its own completed fresh VADD replay')
        for item in base_manifest['files']:
            if sha(BASE / item['path']) != item['sha256']:
                raise ValueError('Reviewed VADD input changed: ' + item['path'])
        for item in base_manifest['modules']:
            live = BASE / 'proof' / item['path']
            if live.read_bytes() != (dep / Path(item['path']).relative_to('coq')).read_bytes():
                raise ValueError('Dependency replay source differs from reviewed source: ' + item['path'])
        components = {n: json.loads((HERE / (n + '-status.json')).read_text())
                      for n in ['primitive-closure', 'neon-proof', 'rvv-proof', 'wrapper-proof', 'native']}
        if any(not data.get('passed') for data in components.values()):
            raise ValueError('Complete component gates and native check must pass before full integration')
        report['components'] = {n: {'run_directory': d['run_directory'],
                                    'evidence_sha256': sha(HERE / (n + '-status.json'))}
                                for n, d in components.items()}
        for rel, digest in components['native']['input_hashes'].items():
            if sha(CASE / rel) != digest:
                raise ValueError('Native input changed: ' + rel)
        original = json.loads((HERE / 'originals.json').read_text())
        for item in original['files']:
            if sha(CASE / item['copy']) != item['sha256'] or (CASE / item['copy']).read_bytes() != (ROOT / item['path']).read_bytes():
                raise ValueError('Original implementation identity mismatch: ' + item['copy'])
        report['originals'] = original
        archived = HERE / 'evidence/full-run/status.json'
        archived_goal_hashes = {}
        if archived.exists():
            previous_full = json.loads(archived.read_text())
            if not previous_full['passed']:
                raise ValueError('Archived full certificate is not complete')
            archived_goal_hashes = {u['label']: u['goal_sha256']
                                    for u in previous_full['actual_c_units']}
        # Capture all reviewed public and proof inputs before creating derived files.
        inputs = [CASE / 'spec.c', HERE / 'originals.json', HERE / 'semantics.json', Path(__file__)]
        for folder in [CASE / 'shim', HERE / 'c', HERE / 'coq']:
            inputs += [p for p in folder.rglob('*') if p.is_file() and p.suffix in {'.c', '.h', '.v', '.json', '.strategies'}]
        input_hashes = {str(p.relative_to(CASE)): sha(p) for p in inputs}
        report['input_sha256'] = input_hashes
        for item in base_manifest['modules']:
            target = run / item['path']
            target.parent.mkdir(parents=True, exist_ok=True)
            shutil.copyfile(BASE / 'proof' / item['path'], target)
            modules.append({'namespace': item['namespace'], 'name': item['name'], 'path': item['path']})
        local = coq / 'VLRelu'
        local.mkdir()
        for name in CORE:
            source = HERE / 'coq' / (name + '.v')
            code = re.sub(r'\(\*.*?\*\)', '', source.read_text(), flags=re.S)
            if re.search(r'\b(?:Admitted|admit|Axiom|Parameter)\b', code):
                raise ValueError('Unproved declaration in handwritten module: ' + name)
            shutil.copyfile(source, local / source.name)
            modules.append({'namespace': 'VLRelu', 'name': source.name,
                            'path': 'coq/VLRelu/' + source.name})
        slp = []
        for folder in sorted((BASE / 'proof/c').iterdir()):
            slp += ['-slp', str(folder), folder.name]
        slp += ['-slp', str(CASE / 'shim'), 'VLRelu', '-slp', str(HERE / 'c'), 'VLRelu']
        aliases = {(ns, stem): (checked, instance) for ns, stem, checked, instance, _ in coverage.UNITS}

        def add_unit(label, namespace, stem, text, checked, instance, expected_goal=None):
            folder = run / 'units' / label.replace('/', '-')
            folder.mkdir(parents=True)
            source = folder / (stem + '.c')
            source.write_text(text)
            expanded = folder / 'expanded.c'
            execute(['gcc', '-E', '-P', '-CC', '-nostdinc', source, '-I', CASE, '-o', expanded],
                    label.replace('/', '-') + '-cpp')
            source.write_bytes(expanded.read_bytes())
            output = folder / 'generated'
            output.mkdir()
            # Only search effort is bounded; all emitted obligations must be checked.
            execute(['qcp', '--arch=64', '--endian=little', '--no-float-finite-vc',
                     '--no-exec-info', '--strategy-application-limit', '1024',
                     '--input-file=' + str(source), '--coq-output-dir=' + str(output),
                     '--coq-logic-path=' + namespace, *slp], label.replace('/', '-') + '-qcp', 600)
            goal = output / (stem + '_goal.v')
            expected_hash = archived_goal_hashes.get(label)
            if expected_goal is not None and expected_goal.exists():
                component_hash = sha(expected_goal)
                if expected_hash is not None and component_hash != expected_hash:
                    raise ValueError('Component target differs from archived full target: ' + label)
                expected_hash = component_hash
            if expected_hash is None or sha(goal) != expected_hash:
                raise ValueError('Fresh VC goal differs from checked target identity: ' + label)
            target = coq / namespace.replace('.', '/') / goal.name
            target.parent.mkdir(parents=True, exist_ok=True)
            if target.exists() and target.read_bytes() != goal.read_bytes():
                raise ValueError('Reviewed/shared fresh goal differs: ' + label)
            shutil.copyfile(goal, target)
            key = str(target.relative_to(run))
            if not any(m['path'] == key for m in modules):
                modules.append({'namespace': namespace, 'name': goal.name, 'path': key})
            names = re.findall(r'^Axiom proof_of_(\w+) :', goal.read_text(), re.M)
            if not names or len(names) != len(set(names)):
                raise ValueError('Missing or duplicate C VC fields: ' + label)
            units.append({'label': label, 'namespace': namespace, 'stem': stem,
                          'actual_c_path': str(source), 'cpp_sha256': sha(source),
                          'fresh_goal_path': str(target), 'goal_sha256': sha(goal),
                          'checked_module': checked + '.' + instance,
                          'c_vcs': len(names), 'fields': names})

        # Existing shim bodies are regenerated from the live, reviewed common files.
        for namespace, stem in BASE_UNITS:
            item = next(i for i in base_manifest['units'] if i['namespace'] == namespace
                        and i.get('stem', Path(i['path']).stem) == stem)
            source = BASE / 'proof' / item['path']
            temporary = run / (namespace + '-' + stem + '-template.c')
            prepare.write_unit(source, source.read_text(), temporary)
            checked, instance = aliases[(namespace, stem)]
            add_unit(namespace + '/' + stem, namespace, stem, temporary.read_text(),
                     namespace + '.' + checked, instance, dep / namespace / (stem + '_goal.v'))
        primitive_dir = artifact_path(components['primitive-closure']['run_directory']) / 'coq'
        for stem, checked, instance in [('bits', 'BitsChecked', 'CheckedBits'),
                                        ('neon_primitives', 'NeonPrimitives', 'CheckedNeonPrimitives'),
                                        ('rvv_primitives', 'RvvPrimitives', 'CheckedRvvPrimitives')]:
            add_unit('VLRelu/' + stem, 'VLRelu', stem,
                     '#include "' + str(CASE / 'shim' / (stem + '.c')) + '"\n',
                     'VLRelu.' + checked, instance, primitive_dir / (stem + '_goal.v'))
        public = (CASE / 'spec.c').read_text()
        public_functions = {n: prepare.function(public, n) for n in ['test_neon', 'test_rvv',
            'qcp_vadd_read', 'preserve_float', 'check_observation', 'same_lane', 'compare_outputs', 'equivalent']}
        for side in ['neon', 'rvv']:
            original_text = (CASE / 'impl' / ('testNEON.c' if side == 'neon' else 'testRVV.c')).read_text()
            annotations = json.loads((HERE / 'c' / (side + '.annotations.json')).read_text())
            patches = annotations if side == 'neon' else annotations['patches']
            first_contract = re.search(r'/\*@.*?\*/', public_functions['test_' + side], re.S).group()
            if patches[0]['text'] != first_contract:
                raise ValueError('Kernel contract annotation differs from public spec: ' + side)
            for p in patches[1:]:
                if re.search(r'\b(?:Require|Ensure)\b', p['text']):
                    raise ValueError('Hidden kernel contract in proof annotations')
            annotated = patch_comments(original_text, patches)
            if side == 'rvv':
                annotated = patch_comments(annotated, [{'after': a, 'text': '/*@ where ' + b + ' */'}
                                                       for a, b in annotations['where'].items()])
            frontend = '#include "' + str(CASE / 'shim' / (side + '_frontend.h')) + '"\n'
            original_source = run / (side + '-original.c')
            original_source.write_text(frontend + original_text)
            original_cpp = run / (side + '-original-expanded.c')
            execute(['gcc', '-E', '-P', '-CC', '-nostdinc', original_source, '-o', original_cpp], side + '-original-cpp')
            gen = json.loads((HERE / ('neon-kernel-generation.json' if side == 'neon' else 'rvv-generation-status.json')).read_text())
            goal = artifact_path(gen['run_directory']) / (side + '_unit_goal.v')
            add_unit('VLRelu/' + side, 'VLRelu', side + '_unit', frontend + annotated,
                     'VLRelu.NeonChecked' if side == 'neon' else 'VLRelu.RvvChecked',
                     'CheckedOriginalNeon' if side == 'neon' else 'KernelChecked', goal)
            if tokens(original_cpp.read_text()) != tokens(Path(units[-1]['actual_c_path']).read_text()):
                raise ValueError('Same-frontend original CPP tokens changed: ' + side)
        preamble = public[:min(public.index(f) for f in public_functions.values())]
        wrapper_units = [
            ('read', 'array_read', ['qcp_vadd_read'], ['qcp_vadd_read'], ['float_array'], 'QcpVadd.array_read_checked', 'CheckedArrayRead'),
            ('bridge', 'bridge', ['preserve_float', 'check_observation', 'same_lane'], ['preserve_float', 'check_observation', 'same_lane'], [], 'NanBridge.bridge_checked', 'Checked'),
            ('comparator', 'comparator', ['qcp_vadd_read', 'same_lane', 'compare_outputs'], ['compare_outputs'], ['comparator'], 'VaddComparator.comparator_checked', 'CheckedComparator'),
            ('wrapper', 'wrapper', ['test_neon', 'test_rvv', 'compare_outputs', 'equivalent'], ['equivalent'], ['comparator', 'wrapper'], 'VLRelu.WrapperChecked', 'CheckedWrapper')]
        wrapper_generation = json.loads((HERE / 'wrapper-generation.json').read_text())
        for suffix, stem, selected, definitions, strategies, checked, instance in wrapper_units:
            pieces = [preamble] + ['/*@ include strategies "' + s + '.strategies" */' for s in strategies]
            for name in selected:
                text = public_functions[name]
                if name not in definitions:
                    text = prepare.declaration(text)
                elif name == 'compare_outputs':
                    inv = json.loads((BASE / 'proof/c/VaddComparator/comparator.annotations.json').read_text())['compare_outputs'][0]['text']
                    text = patch_comments(text, [{'before': 'while (i < n)', 'text': inv}])
                elif name == 'equivalent':
                    text = patch_comments(text, json.loads((HERE / 'c/wrapper.annotations.json').read_text())['equivalent'])
                pieces.append(text)
            namespace = 'VLRelu.' + suffix
            previous = next(u for u in wrapper_generation['actual_units'] if u['namespace'] == namespace)
            add_unit(namespace + '/' + stem, namespace, stem, '\n\n'.join(pieces),
                     checked, instance, artifact_path(previous['goal']))
        if len(units) != 14:
            raise ValueError('Unexpected actual C unit set')
        declarations, definitions, calls = {}, {}, []
        public_cpp = run / 'public-expanded.c'
        execute(['gcc', '-E', '-P', '-CC', '-nostdinc', CASE / 'spec.c', '-o', public_cpp], 'public-cpp')
        public_contracts = {n: (s, c) for n, s, c, _ in coverage._functions(public_cpp.read_text(), 'public spec')}
        for unit in units:
            rows = []
            for name, signature, contract, edges in coverage._functions(Path(unit['actual_c_path']).read_text(), unit['label']):
                pair = signature, contract
                if name in declarations and declarations[name] != pair:
                    raise ValueError('Actual C declaration/body mismatch: ' + name)
                if name in public_contracts and public_contracts[name] != pair:
                    raise ValueError('Actual C function differs from public spec: ' + name)
                declarations[name] = pair
                rows.append({'name': name, 'definition': edges is not None,
                             'contract_sha256': hashlib.sha256(contract.encode()).hexdigest()})
                if edges is not None:
                    definitions.setdefault(name, []).append(unit['label'])
                    calls += [(name, edge) for edge in edges]
            unit['functions'] = rows
        unbound = sorted({c for _, c in calls} - definitions.keys())
        if unbound:
            raise ValueError('C callee lacks a checked body: ' + repr(unbound))
        report['call_closure'] = {'definitions': definitions, 'calls': sorted(set(calls)),
                                  'unbound_callees': unbound, 'exact_contract_and_signature_match': True}
        # Fresh strategy goals must match the reviewed proof interfaces as well.
        strategy_tool = Path(shutil.which('qcp')).resolve().parent / 'StrategyCheck'
        report['strategy_tool_sha256'] = sha(strategy_tool)
        strategy_records = []
        strategy_sources = [(f, folder.name) for folder in sorted((BASE / 'proof/c').iterdir())
                            for f in sorted(folder.glob('*.strategies'))]
        strategy_sources += [(HERE / 'c' / (n + '.strategies'), 'VLRelu') for n in ['neon_vlrelu', 'rvv_vlrelu']]
        for source, namespace in strategy_sources:
            output = run / ('strategy-' + namespace + '-' + source.stem)
            output.mkdir()
            execute([strategy_tool, '--arch=64', '--endian=little', '--no-exec-info',
                     '--input-file=' + str(source), '--coq-output-dir=' + str(output),
                     '--coq-logic-path=' + namespace], 'strategy-' + namespace + '-' + source.stem)
            goal = output / (source.stem + '_strategy_goal.v')
            target = coq / namespace.replace('.', '/') / goal.name
            if target.exists() and target.read_bytes() != goal.read_bytes():
                raise ValueError('Fresh strategy target differs from reviewed dependency: ' + source.name)
            shutil.copyfile(goal, target)
            key = str(target.relative_to(run))
            if not any(m['path'] == key for m in modules):
                modules.append({'namespace': namespace, 'name': goal.name, 'path': key})
            strategy_records.append({'source': str(source), 'source_sha256': sha(source), 'goal_sha256': sha(goal)})
        report['strategies'] = strategy_records
        flags = cfg['flags'][2:]
        for namespace in dict.fromkeys(m['namespace'] for m in modules):
            folder = coq / namespace.replace('.', '/') if namespace else coq / 'relations'
            flags += ['-Q', str(folder), namespace]
        # The dependency scheduler is the existing verified framework's runner.
        parallel.compile_modules(modules, run, flags, execute, args.jobs)
        gate = []
        for index, unit in enumerate(units):
            goal = unit['namespace'] + '.' + unit['stem'] + '_goal'
            proof = unit['checked_module']
            gate += ['Require Import ' + goal + ' ' + proof.rsplit('.', 1)[0] + '.',
                     f'Module ActualUnit{index} : {goal}.VC_Correct := {proof}.']
            gate += [f'Print Assumptions ActualUnit{index}.proof_of_{name}.' for name in unit['fields']]
        final = run / 'FinalCaseCheck.v'
        final.write_text('\n'.join(gate) + '\n')
        execute(['qcp-env', 'coqc', '-time', *flags, final], 'FinalCaseCheck', 1800)
        for rel, digest in input_hashes.items():
            if sha(CASE / rel) != digest:
                raise ValueError('Reviewed input changed during complete check: ' + rel)
        for item in base_manifest['files']:
            if sha(BASE / item['path']) != item['sha256']:
                raise ValueError('Shared reviewed input changed during complete check: ' + item['path'])
        for name, digest in report['tool_sha256'].items():
            if sha(Path(shutil.which(name)).resolve()) != digest:
                raise ValueError('Verification tool changed during complete check: ' + name)
        if sha(strategy_tool) != report['strategy_tool_sha256']:
            raise ValueError('Strategy checker changed during complete check')
        report.update(passed=True, whole_kernel_verified=True,
                      verification_state='checked_c_shim_partial_correctness',
                      checked_c_units=len(units), checked_c_vcs=sum(u['c_vcs'] for u in units),
                      fresh_compiled_local_modules=len(modules) + 1,
                      compiled_source_sha256={m['namespace'] + '.' + Path(m['name']).stem: sha(run / m['path']) for m in modules},
                      no_component_vo_reused=True,
                      final_gate_sha256=sha(final), final_assumptions_log_sha256=sha(run / 'FinalCaseCheck.log'),
                      limits=['Fixed RVV VLEN=128/SEW=32/LMUL=8',
                              'No formal ISA/shim observation refinement', 'No complete termination theorem',
                              'Inherited QCP/Coq/Flocq and memory/address assumptions remain visible'])
    except Exception as error:
        report['error'] = str(error)
        print(error, flush=True)
    finally:
        save()
        (HERE / 'full-status.json').write_text(json.dumps(report, indent=2) + '\n')
        print('RUN', run, flush=True)
    return 0 if report['passed'] else 1


if __name__ == '__main__':
    raise SystemExit(main())
