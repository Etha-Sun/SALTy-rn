#!/usr/bin/env python3
"""Fresh original VCMUL C-shim closure, with exact generated-goal identities.

All local Coq sources are rebuilt without component .vo files. The C VC count
is the sum of translation-unit interface fields, not unique semantic duties.
QCP/Coq/Flocq libraries outside the reviewed VADD package remain dependencies.
"""
import argparse
import hashlib
import importlib.util
import json
from pathlib import Path
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
CORE = [
    'Model', 'ComplexModel', 'FastFrame', 'PrimitivesChecked',
    'WindowMemory', 'WindowChecked', 'RvvMemoryModel', 'RvvMemoryChecked',
    'RvvStoreModel', 'vcmul_store_strategy_proof', 'RvvStoreChecked',
    'NeonFacts', 'NeonStrategy', 'neon_vcmul_strategy_proof',
    'NeonPure', 'NeonCalls', 'NeonMemory', 'NeonGate',
    'RvvFacts', 'RvvPure', 'RvvCalls', 'RvvMemory', 'RvvGate', 'WrapperChecked',
]
COMPONENTS = [
    'primitive', 'window', 'rvv-memory', 'rvv-store', 'neon-proof',
    'rvv-proof', 'wrapper-proof', 'native', 'window-native',
    'rvv-memory-native', 'rvv-store-native',
]
SHIM_UNITS = [
    ('primitives', 'primitive', 'PrimitivesChecked', 'CheckedPrimitives', 179),
    ('window_load', 'window', 'WindowChecked', 'CheckedWindow', 14),
    ('rvv_memory', 'rvv-memory', 'RvvMemoryChecked', 'CheckedMemory', 58),
    ('rvv_store', 'rvv-store', 'RvvStoreChecked', 'CheckedRvvStore', 43),
]
EXPECTED_BODIES = {
    'ByValue/shim_unit': {
        'vld1q_f32', 'vaddq_f32', 'qcp_vst1q_f32', 'qcp_vst1_f32',
        'vget_low_f32', 'vget_high_f32', 'qcp_vst1_lane_f32', 'qcp_assert'},
    'VCMul/primitives': {
        'qcp_vcmul_' + s for s in
        ['mul', 'add', 'sub', 'mla', 'mls', 'active_mul', 'active_add', 'active_sub']
    } | {'vmulq_f32', 'vmlaq_f32', 'vmlsq_f32',
         '__riscv_vfmul_vv_f32m4', '__riscv_vfadd_vv_f32m4', '__riscv_vfsub_vv_f32m4'},
    'VCMul/window_load': {'qcp_vcmul_load4'},
    'VCMul/rvv_memory': {'qcp_vcmul_read_lane', 'qcp_vcmul_load16', '__riscv_vsetvl_e32m4'},
    'VCMul/rvv_store': {'qcp_vcmul_get16', 'qcp_vcmul_store_next', '__riscv_vse32_v_f32m4'},
    'VCMul/neon': {'test_neon'},
    'VCMul/rvv': {'test_rvv'},
    'VCMul.read/array_read': {'qcp_vadd_read'},
    'VCMul.bridge/bridge': {'preserve_float', 'check_observation', 'same_lane'},
    'VCMul.comparator/comparator': {'compare_outputs'},
    'VCMul.wrapper/wrapper': {'equivalent'},
}


def sha(path):
    return hashlib.sha256(Path(path).read_bytes()).hexdigest()


def module(name, path):
    spec = importlib.util.spec_from_file_location(name, path)
    value = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(value)
    return value


def artifact_path(path):
    """Resolve only this case's historical absolute prefix after relocation."""
    path = Path(path)
    if path.is_absolute():
        parts = path.parts
        for i in range(len(parts) - 3):
            if (parts[i:i + 2] == ('verification', 'qcp')
                    and parts[i + 2] in {'candidates', 'verified'}
                    and parts[i + 3] == 'f32-vcmul'):
                suffix = parts[i + 4:]
                if '..' in suffix:
                    raise ValueError('Historical case artifact escapes its case directory')
                return CASE.joinpath(*suffix)
    return path


def recorded_input(path):
    path = Path(path)
    if path.is_absolute():
        return artifact_path(path)
    if path.parts and path.parts[0] == 'verification':
        return artifact_path(ROOT / path)
    return CASE / path


def tokens(text):
    return re.findall(r'\w+|[^\s\w]', re.sub(r'/\*.*?\*/|//[^\n]*', '', text, flags=re.S))


def checked_goal_hash(label, path, recorded, history):
    """Missing local artifacts require the immutable previous full certificate."""
    old = history.get(label)
    path = artifact_path(path) if path is not None else None
    if path is not None and path.exists():
        current = sha(path)
        if recorded is not None and current != recorded:
            raise ValueError('Component goal artifact changed: ' + label)
        if old is not None and current != old:
            raise ValueError('Component goal differs from archived full target: ' + label)
        return current
    if old is None:
        raise ValueError('Missing checked goal artifact and immutable full archive: ' + label)
    if recorded is not None and recorded != old:
        raise ValueError('Recorded component and archived goal differ: ' + label)
    return old


def patch_comments(text, patches):
    original = tokens(text)
    for patch in patches:
        if ('before' in patch) == ('after' in patch):
            raise ValueError('Exactly one proof annotation anchor is required')
        annotation = patch['text']
        if not re.fullmatch(r'/\*@(?:(?!\*/).)*\*/', annotation, re.S) or tokens(annotation):
            raise ValueError('Proof patch must be one non-executable annotation')
        anchor = patch.get('before', patch.get('after'))
        count = patch.get('occurrences', 1)
        if not isinstance(count, int) or count < 1 or text.count(anchor) != count:
            raise ValueError('Proof anchor occurrence mismatch: ' + anchor)
        indent = patch.get('indent', '')
        if not re.fullmatch(r'[ \t]*', indent):
            raise ValueError('Proof insertion indentation must contain whitespace only')
        replacement = (annotation + '\n' + indent + anchor if 'before' in patch
                       else anchor + ' ' + annotation)
        text = text.replace(anchor, replacement)
    if tokens(text) != original:
        raise ValueError('Proof annotations changed original executable tokens')
    return text


def kernel_text(side, public_function):
    original = (CASE / 'impl' / ('testNEON.c' if side == 'neon' else 'testRVV.c')).read_text()
    contracts = re.findall(r'/\*@.*?\*/', public_function, re.S)
    if len(contracts) != 1 or not all(re.search(r'\b' + word + r'\b', contracts[0])
                                      for word in ['Require', 'Ensure']):
        raise ValueError('Exactly one public kernel contract is required: ' + side)
    # Generators store only Inv/Assert/where patches; the public contract is
    # independently injected immediately before the original function body.
    if original.count('\n{') != 1:
        raise ValueError('Original function body anchor changed: ' + side)
    text = original.replace('\n{', '\n' + contracts[0] + '\n{', 1)
    patches = json.loads((HERE / 'c' / (side + '.annotations.json')).read_text())
    if not isinstance(patches, list) or not patches:
        raise ValueError('Expected generator annotation list: ' + side)
    for patch in patches:
        if re.search(r'\b(?:Require|Ensure|With|Extern|Import|include)\b', patch['text']):
            raise ValueError('Hidden contract/import in kernel annotation: ' + side)
        if not re.match(r'/\*@\s*(?:Inv|Assert|where)\b', patch['text']):
            raise ValueError('Unsupported kernel proof annotation: ' + side)
    text = patch_comments(text, patches)
    if tokens(text) != tokens(original):
        raise ValueError('Kernel executable tokens changed: ' + side)
    return original, text


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--config', type=Path, required=True)
    parser.add_argument('--dependency-dir', type=Path, required=True)
    parser.add_argument('--jobs', type=int, choices=[1, 2, 3, 4], default=2)
    args = parser.parse_args()
    cfg = json.loads(args.config.read_text())
    dep = args.dependency_dir.resolve()
    (CASE / '.build').mkdir(exist_ok=True)
    run = Path(tempfile.mkdtemp(prefix='full-', dir=CASE / '.build'))
    coq = run / 'coq'
    coq.mkdir()
    records, units, modules = [], [], []
    report = {
        'passed': False, 'whole_kernel_verified': False, 'scope': 'full',
        'run_directory': str(run), 'records': records, 'actual_c_units': units,
        'description': 'Both original C kernels, public observation caller, and complete C-shim call closure; partial correctness',
        'external_libraries_rebuilt': False, 'parallel_jobs': args.jobs,
        'unit_vc_counting': 'Sum of actual VC_Correct fields per generated translation unit; not deduplicated semantic duties or additional kernels',
        'historical_artifact_resolution': 'This case candidate absolute prefix maps to current CASE after relocation; historical reports are not rewritten',
    }
    lock = threading.Lock()

    def save():
        (run / 'status.json').write_text(json.dumps(report, indent=2) + '\n')

    def execute(command, label, timeout=300):
        if label.startswith('VCMul-'):
            timeout = max(timeout, 1800)
            if label in {'VCMul-NeonCalls', 'VCMul-RvvCalls'}:
                timeout = max(timeout, 3600)
        command = list(map(str, command))
        if command[:2] == ['qcp-env', 'coqc'] and '-time' not in command:
            command.insert(2, '-time')
        command = ['prlimit', '--as=17179869184:17179869184', '--', *command]
        work = run / 'jobs' / label
        work.mkdir(parents=True, exist_ok=True)
        output = run / (label + '.log')
        start = time.monotonic()
        with output.open('w') as stream:
            try:
                code = subprocess.run(command, cwd=work, stdout=stream, stderr=stream,
                                      timeout=timeout).returncode
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
        coverage = module('vcmul_full_coverage', BASE / 'proof/coverage.py')
        coverage.C_KEYWORDS.add('return')
        prepare = module('vcmul_full_prepare', BASE / 'proof/prepare.py')
        parallel = module('vcmul_full_parallel', BASE / 'proof/parallel.py')
        base_manifest = json.loads((BASE / 'proof/manifest.json').read_text())
        report['dependency_manifest_sha256'] = sha(BASE / 'proof/manifest.json')
        report['dependency_status_sha256'] = sha(dep.parent / 'status.json')
        report['config_sha256'] = sha(args.config)
        report['tool_sha256'] = {n: sha(Path(shutil.which(n)).resolve())
                                for n in ['qcp', 'qcp-env', 'coqc', 'gcc', 'prlimit']}
        dep_status = json.loads((dep.parent / 'status.json').read_text())
        if not dep_status.get('passed') or dep_status.get('scope') != 'full':
            raise ValueError('Dependency directory requires a completed fresh VADD replay')
        for item in base_manifest['files']:
            if sha(BASE / item['path']) != item['sha256']:
                raise ValueError('Reviewed VADD input changed: ' + item['path'])
        for item in base_manifest['modules']:
            if (BASE / 'proof' / item['path']).read_bytes() != (
                    dep / Path(item['path']).relative_to('coq')).read_bytes():
                raise ValueError('Dependency replay source differs: ' + item['path'])
        components = {n: json.loads((HERE / (n + '-status.json')).read_text()) for n in COMPONENTS}
        if any(not data.get('passed') for data in components.values()):
            raise ValueError('Every component gate and native check must pass before full integration')
        for name in ['primitive', 'window', 'rvv-memory', 'rvv-store', 'neon-proof', 'rvv-proof']:
            if not components[name].get('vc_correct_passed'):
                raise ValueError('Complete typed C VC component gate required: ' + name)
        report['components'] = {n: {'run_directory': d['run_directory'],
                                    'evidence_sha256': sha(HERE / (n + '-status.json'))}
                                for n, d in components.items()}
        for name, data in components.items():
            for key in ['input_hashes', 'source_sha256', 'sources_sha256']:
                identities = data.get(key)
                if isinstance(identities, dict):
                    for rel, digest in identities.items():
                        if sha(recorded_input(rel)) != digest:
                            raise ValueError('Component input changed: ' + name + ': ' + rel)
        original = json.loads((HERE / 'originals.json').read_text())
        if set(original['files']) != {'neon', 'rvv'}:
            raise ValueError('Original implementation identity set changed')
        for item in original['files'].values():
            if sha(CASE / item['copy']) != item['sha256'] or (
                    CASE / item['copy']).read_bytes() != (ROOT / item['path']).read_bytes():
                raise ValueError('Original implementation identity mismatch: ' + item['copy'])
        report['originals'] = original
        archived_path = HERE / 'evidence/full-run/status.json'
        archived = json.loads(archived_path.read_text()) if archived_path.exists() else None
        if archived is not None and not archived.get('passed'):
            raise ValueError('Archived full certificate is incomplete')
        archived_goals = {u['label']: u['goal_sha256']
                          for u in archived['actual_c_units']} if archived else {}
        archived_strategies = {u['label']: u['goal_sha256']
                              for u in archived.get('strategies', [])} if archived else {}

        def expected_hash(label, path, recorded=None, strategy=False):
            history = archived_strategies if strategy else archived_goals
            return checked_goal_hash(label, path, recorded, history)

        inputs = [CASE / 'spec.c', HERE / 'originals.json', HERE / 'semantics.json',
                  Path(__file__)]
        for folder in [CASE / 'impl', CASE / 'shim', HERE / 'c', HERE / 'coq']:
            inputs += [p for p in folder.rglob('*')
                       if p.is_file() and p.suffix in {'.c', '.h', '.v', '.json', '.strategies'}]
        inputs += [HERE / (n + '-status.json') for n in COMPONENTS]
        inputs += [HERE / n for n in ['neon-generation-status.json', 'rvv-generation-status.json',
                                     'wrapper-generation.json', 'generate_neon.py', 'generate_rvv.py']]
        input_hashes = {str(p.relative_to(CASE)): sha(p) for p in inputs}
        report['input_sha256'] = input_hashes
        for item in base_manifest['modules']:
            target = run / item['path']
            target.parent.mkdir(parents=True, exist_ok=True)
            shutil.copyfile(BASE / 'proof' / item['path'], target)
            modules.append({'namespace': item['namespace'], 'name': item['name'], 'path': item['path']})
        local = coq / 'VCMul'
        local.mkdir()
        for name in CORE:
            source = HERE / 'coq' / (name + '.v')
            code = re.sub(r'\(\*.*?\*\)', '', source.read_text(), flags=re.S)
            if re.search(r'\b(?:Admitted|admit|Axiom|Parameter)\b', code):
                raise ValueError('Unproved declaration in handwritten module: ' + name)
            if name in {'NeonPure', 'NeonCalls', 'NeonMemory', 'RvvPure', 'RvvCalls', 'RvvMemory', 'WrapperChecked'}:
                for field, target in re.findall(r'^Lemma proof_of_(\w+)\s*:\s*([\w.]+)\.', code, re.M):
                    goal = 'wrapper.wrapper_goal' if name == 'WrapperChecked' else (
                        'neon_unit_goal' if name.startswith('Neon') else 'rvv_unit_goal')
                    if target != 'VCMul.' + goal + '.' + field:
                        raise ValueError('Kernel/caller witness target is not fully qualified: ' + name + ': ' + field)
            shutil.copyfile(source, local / source.name)
            modules.append({'namespace': 'VCMul', 'name': source.name,
                            'path': 'coq/VCMul/' + source.name})
        slp = []
        for folder in sorted((BASE / 'proof/c').iterdir()):
            slp += ['-slp', str(folder), folder.name]
        slp += ['-slp', str(HERE / 'c'), 'VCMul']

        def add_unit(label, namespace, stem, text, checked, instance, expected_goal,
                     count, recorded_goal=None):
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
            execute(['qcp', '--arch=64', '--endian=little', '--no-float-finite-vc',
                     '--no-exec-info', '--strategy-application-limit', '1024',
                     '--input-file=' + str(source), '--coq-output-dir=' + str(output),
                     '--coq-logic-path=' + namespace, *slp], label.replace('/', '-') + '-qcp', 1200)
            goal = output / (stem + '_goal.v')
            if sha(goal) != expected_hash(label, expected_goal, recorded_goal):
                raise ValueError('Fresh C VC goal differs from checked target: ' + label)
            target = coq / namespace.replace('.', '/') / goal.name
            target.parent.mkdir(parents=True, exist_ok=True)
            if target.exists() and target.read_bytes() != goal.read_bytes():
                raise ValueError('Reviewed shared goal differs: ' + label)
            shutil.copyfile(goal, target)
            key = str(target.relative_to(run))
            if not any(m['path'] == key for m in modules):
                modules.append({'namespace': namespace, 'name': goal.name, 'path': key})
            names = re.findall(r'^Axiom proof_of_(\w+) :', goal.read_text(), re.M)
            if not names or len(names) != len(set(names)) or len(names) != count:
                raise ValueError('Missing/duplicate/unexpected actual C VC fields: ' + label)
            units.append({'label': label, 'namespace': namespace, 'stem': stem,
                          'actual_c_path': str(source), 'cpp_sha256': sha(source),
                          'fresh_goal_path': str(target), 'goal_sha256': sha(goal),
                          'checked_module': checked + '.' + instance,
                          'c_vcs': len(names), 'fields': names})

        base_item = next(i for i in base_manifest['units']
                         if i['namespace'] == 'ByValue' and i.get('stem') == 'shim_unit')
        source = BASE / 'proof' / base_item['path']
        temporary = run / 'ByValue-shim_unit-template.c'
        prepare.write_unit(source, source.read_text(), temporary)
        add_unit('ByValue/shim_unit', 'ByValue', 'shim_unit', temporary.read_text(),
                 'ByValue.shim_checked', 'CheckedShim', dep / 'ByValue/shim_unit_goal.v', 26)
        for stem, component, checked, instance, count in SHIM_UNITS:
            previous = artifact_path(components[component]['run_directory']) / 'coq' / (stem + '_goal.v')
            add_unit('VCMul/' + stem, 'VCMul', stem,
                     '#include "' + str(CASE / 'shim' / (stem + '.c')) + '"\n',
                     'VCMul.' + checked, instance, previous, count,
                     components[component]['goal_sha256'])

        public = (CASE / 'spec.c').read_text()
        public_functions = {n: prepare.function(public, n) for n in [
            'test_neon', 'test_rvv', 'qcp_vadd_read', 'preserve_float',
            'check_observation', 'same_lane', 'compare_outputs', 'equivalent']}
        for side, count, checked in [('neon', 210, 'NeonGate'), ('rvv', 62, 'RvvGate')]:
            generation = json.loads((HERE / (side + '-generation-status.json')).read_text())
            if not generation.get('generation_passed'):
                raise ValueError('Original kernel generation is incomplete: ' + side)
            if generation['goal_sha256'] != components[side + '-proof']['goal_sha256']:
                raise ValueError('Kernel component/generation target mismatch: ' + side)
            for rel, digest in generation['live_sources_sha256'].items():
                if sha(CASE / rel) != digest:
                    raise ValueError('Kernel generator input changed: ' + side + ': ' + rel)
            original_text, annotated = kernel_text(side, public_functions['test_' + side])
            frontend = '#include "' + str(CASE / 'shim' / (side + '_frontend.h')) + '"\n'
            original_source = run / (side + '-original.c')
            original_source.write_text(frontend + original_text)
            original_cpp = run / (side + '-original-expanded.c')
            execute(['gcc', '-E', '-P', '-CC', '-nostdinc', original_source, '-o', original_cpp],
                    side + '-original-cpp')
            goal = artifact_path(generation['run_directory']) / (side + '_unit_goal.v')
            add_unit('VCMul/' + side, 'VCMul', side + '_unit', frontend + annotated,
                     'VCMul.' + checked, 'CheckedOriginal' + side.title(), goal, count,
                     generation['goal_sha256'])
            if tokens(original_cpp.read_text()) != tokens(Path(units[-1]['actual_c_path']).read_text()):
                raise ValueError('Same-frontend original CPP executable tokens changed: ' + side)
            units[-1]['original_cpp_sha256'] = sha(original_cpp)
            units[-1]['original_raw_tokens_identical'] = True
            units[-1]['same_frontend_cpp_tokens_identical'] = True

        preamble = public[:min(public.index(f) for f in public_functions.values())]
        wrappers = [
            ('read', 'array_read', ['qcp_vadd_read'], ['qcp_vadd_read'], ['float_array'],
             'QcpVadd.array_read_checked', 'CheckedArrayRead', 2),
            ('bridge', 'bridge', ['preserve_float', 'check_observation', 'same_lane'],
             ['preserve_float', 'check_observation', 'same_lane'], [],
             'NanBridge.bridge_checked', 'Checked', 14),
            ('comparator', 'comparator', ['qcp_vadd_read', 'same_lane', 'compare_outputs'],
             ['compare_outputs'], ['comparator'], 'VaddComparator.comparator_checked',
             'CheckedComparator', 12),
            ('wrapper', 'wrapper', ['test_neon', 'test_rvv', 'compare_outputs', 'equivalent'],
             ['equivalent'], ['comparator', 'wrapper'], 'VCMul.WrapperChecked', 'CheckedWrapper', 9),
        ]
        generation = json.loads((HERE / 'wrapper-generation.json').read_text())
        if not generation.get('generation_passed') or generation['public_spec_sha256'] != sha(CASE / 'spec.c'):
            raise ValueError('Public helper generation is incomplete or stale')
        for suffix, stem, selected, definitions, strategies, checked, instance, count in wrappers:
            pieces = [preamble] + ['/*@ include strategies "' + s + '.strategies" */' for s in strategies]
            for name in selected:
                text = public_functions[name]
                if name not in definitions:
                    text = prepare.declaration(text)
                elif name == 'compare_outputs':
                    inv = json.loads((BASE / 'proof/c/VaddComparator/comparator.annotations.json').read_text())['compare_outputs'][0]['text']
                    text = patch_comments(text, [{'before': 'while (i < n)', 'text': inv, 'indent': '  '}])
                elif name == 'equivalent':
                    patches = json.loads((HERE / 'c/wrapper.annotations.json').read_text())['equivalent']
                    text = patch_comments(text, [dict(patch, indent=' ') for patch in patches])
                pieces.append(text)
            namespace = 'VCMul.' + suffix
            previous = next(u for u in generation['actual_units'] if u['namespace'] == namespace)
            add_unit(namespace + '/' + stem, namespace, stem, '\n\n'.join(pieces),
                     checked, instance, previous['goal'], count, previous['goal_sha256'])
        if {u['label'] for u in units} != set(EXPECTED_BODIES) or len(units) != len(EXPECTED_BODIES):
            raise ValueError('Unexpected actual C translation unit set')

        declarations, definitions, calls = {}, {}, []
        public_cpp = run / 'public-expanded.c'
        execute(['gcc', '-E', '-P', '-CC', '-nostdinc', CASE / 'spec.c', '-o', public_cpp], 'public-cpp')
        public_contracts = {n: (s, c) for n, s, c, _ in coverage._functions(public_cpp.read_text(), 'public spec')}
        if set(public_contracts) != set(public_functions):
            raise ValueError('Public function coverage changed')
        for unit in units:
            rows = []
            for name, signature, contract, edges in coverage._functions(
                    Path(unit['actual_c_path']).read_text(), unit['label']):
                pair = signature, contract
                if name in declarations and declarations[name] != pair:
                    raise ValueError('Actual C declaration/body contract/signature mismatch: ' + name)
                if name in public_contracts and public_contracts[name] != pair:
                    raise ValueError('Actual C function differs from public spec: ' + name)
                declarations[name] = pair
                rows.append({'name': name, 'definition': edges is not None,
                             'signature_sha256': hashlib.sha256(repr(signature).encode()).hexdigest(),
                             'contract_sha256': hashlib.sha256(contract.encode()).hexdigest()})
                if edges is not None:
                    definitions.setdefault(name, []).append(unit['label'])
                    calls += [(name, edge) for edge in edges]
            if {r['name'] for r in rows if r['definition']} != EXPECTED_BODIES[unit['label']]:
                raise ValueError('Actual C body set differs from reviewed unit: ' + unit['label'])
            unit['functions'] = rows
        unbound = sorted({c for _, c in calls} - definitions.keys())
        missing_declarations = sorted(declarations.keys() - definitions.keys())
        if unbound or missing_declarations:
            raise ValueError('C callee/declaration lacks a checked body: ' + repr((unbound, missing_declarations)))
        report['call_closure'] = {
            'definitions': definitions, 'calls': sorted(set(calls)), 'unbound_callees': unbound,
            'declarations_without_checked_body': missing_declarations,
            'unique_c_functions_with_bodies': len(definitions),
            'actual_body_occurrences': sum(len(v) for v in definitions.values()),
            'exact_contract_and_signature_match': True,
        }

        strategy_tool = Path(shutil.which('qcp')).resolve().parent / 'StrategyCheck'
        report['strategy_tool_sha256'] = sha(strategy_tool)
        strategy_records = []
        sources = [(f, folder.name) for folder in sorted((BASE / 'proof/c').iterdir())
                   for f in sorted(folder.glob('*.strategies'))]
        sources += [(HERE / 'c' / (n + '.strategies'), 'VCMul')
                    for n in ['neon_vcmul', 'vcmul_store']]
        for source, namespace in sources:
            label = namespace + '/' + source.stem
            output = run / ('strategy-' + namespace + '-' + source.stem)
            output.mkdir()
            execute([strategy_tool, '--arch=64', '--endian=little', '--no-exec-info',
                     '--input-file=' + str(source), '--coq-output-dir=' + str(output),
                     '--coq-logic-path=' + namespace], 'strategy-' + namespace + '-' + source.stem)
            goal = output / (source.stem + '_strategy_goal.v')
            target = coq / namespace.replace('.', '/') / goal.name
            if namespace == 'VCMul':
                component = 'neon-proof' if source.stem == 'neon_vcmul' else 'rvv-store'
                previous = artifact_path(components[component]['run_directory']) / 'coq' / goal.name
                if sha(goal) != expected_hash(label, previous, strategy=True):
                    raise ValueError('Fresh local strategy target differs: ' + label)
            elif not target.exists() or target.read_bytes() != goal.read_bytes():
                raise ValueError('Fresh strategy target differs from reviewed VADD source: ' + label)
            shutil.copyfile(goal, target)
            key = str(target.relative_to(run))
            if not any(m['path'] == key for m in modules):
                modules.append({'namespace': namespace, 'name': goal.name, 'path': key})
            text = goal.read_text()
            types = re.findall(r'^Module Type (\w+)\.', text, re.M)
            fields = re.findall(r'^\s*Axiom (\w+) :', text, re.M)
            if len(types) != 1 or not fields or len(fields) != len(set(fields)):
                raise ValueError('Unexpected strategy interface shape: ' + label)
            if namespace == 'VCMul':
                proof, instance = (
                    ('NeonStrategy', 'CheckedNeonStrategy') if source.stem == 'neon_vcmul'
                    else ('vcmul_store_strategy_proof', 'CheckedRvvStoreStrategy'))
                if len(fields) != (3 if source.stem == 'neon_vcmul' else 5):
                    raise ValueError('Local strategy field count changed: ' + label)
            else:
                proof = source.stem + '_strategy_proof'
                implementations = re.findall(r'^Module (\w+) : ' + re.escape(types[0]) + r'\.',
                                               (coq / namespace / (proof + '.v')).read_text(), re.M)
                if len(implementations) != 1:
                    raise ValueError('Strategy proof implementing module is ambiguous: ' + label)
                instance = implementations[0]
            strategy_records.append({
                'label': label, 'source': str(source), 'source_sha256': sha(source),
                'goal_sha256': sha(goal), 'namespace': namespace, 'stem': source.stem,
                'module_type': types[0], 'fields': fields,
                'checked_module': namespace + '.' + proof + '.' + instance,
            })
        report['strategies'] = strategy_records

        flags = list(cfg['flags'][2:])
        for namespace in dict.fromkeys(m['namespace'] for m in modules):
            folder = coq / namespace.replace('.', '/') if namespace else coq / 'relations'
            flags += ['-Q', str(folder), namespace]
        if list(coq.rglob('*.vo')):
            raise ValueError('A fresh integration directory must contain no precompiled .vo')
        parallel.compile_modules(modules, run, flags, execute, args.jobs)
        gate = []
        for index, unit in enumerate(units):
            goal = unit['namespace'] + '.' + unit['stem'] + '_goal'
            proof = unit['checked_module']
            gate += ['Require Import ' + goal + ' ' + proof.rsplit('.', 1)[0] + '.',
                     f'Module ActualUnit{index} : {goal}.VC_Correct := {proof}.']
            gate += [f'Print Assumptions ActualUnit{index}.proof_of_{name}.' for name in unit['fields']]
        for index, strategy in enumerate(strategy_records):
            goal = strategy['namespace'] + '.' + strategy['stem'] + '_strategy_goal'
            proof = strategy['checked_module']
            gate += ['Require Import ' + goal + ' ' + proof.rsplit('.', 1)[0] + '.',
                     f'Module ActualStrategy{index} : {goal}.{strategy["module_type"]} := {proof}.']
            gate += [f'Print Assumptions ActualStrategy{index}.{name}.' for name in strategy['fields']]
        final = run / 'FinalCaseCheck.v'
        final.write_text('\n'.join(gate) + '\n')
        execute(['qcp-env', 'coqc', '-time', *flags, final], 'FinalCaseCheck', 1800)
        for rel, digest in input_hashes.items():
            if sha(CASE / rel) != digest:
                raise ValueError('Reviewed input changed during full integration: ' + rel)
        for item in base_manifest['files']:
            if sha(BASE / item['path']) != item['sha256']:
                raise ValueError('Shared reviewed input changed: ' + item['path'])
        for name, digest in report['tool_sha256'].items():
            if sha(Path(shutil.which(name)).resolve()) != digest:
                raise ValueError('Verification tool changed during integration: ' + name)
        if sha(strategy_tool) != report['strategy_tool_sha256']:
            raise ValueError('Strategy checker changed during integration')
        if sha(args.config) != report['config_sha256']:
            raise ValueError('Coq configuration changed during integration')
        if sha(BASE / 'proof/manifest.json') != report['dependency_manifest_sha256']:
            raise ValueError('Reviewed dependency manifest changed during integration')
        if sha(dep.parent / 'status.json') != report['dependency_status_sha256']:
            raise ValueError('Dependency replay status changed during integration')
        report.update(
            passed=True, whole_kernel_verified=True,
            verification_state='checked_c_shim_partial_correctness',
            checked_c_units=len(units), checked_c_vcs=sum(u['c_vcs'] for u in units),
            checked_strategy_fields=sum(len(s['fields']) for s in strategy_records),
            fresh_compiled_local_modules=len(modules) + 1,
            compiled_source_sha256={m['namespace'] + '.' + Path(m['name']).stem: sha(run / m['path'])
                                    for m in modules},
            no_component_vo_reused=True, final_gate_sha256=sha(final),
            final_assumptions_log_sha256=sha(run / 'FinalCaseCheck.log'),
            limits=[
                'Fixed RVV VLEN=128/SEW=32/LMUL=4/VLMAX=16',
                'Full binary32 domain and explicit original planar input/padding/output memory contracts',
                'No formal ISA/shim observation or layout refinement; architecture NaN payload correspondence remains outside this C-shim theorem',
                'No complete termination theorem; FP flags/traps unobserved',
                'Inherited QCP/Coq/Flocq, classical/extensionality and C memory/type/address assumptions remain visible',
            ])
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
