#!/usr/bin/env python3
"""Prepare exact live C inventories; freeze only after every component gate passes.

This generates CPP and strategy interfaces, not a whole-kernel proof. Historical
component certificates and native JSON remain byte-preserved. The final full
runner regenerates all26 actual C targets and all10 strategy groups afresh.
"""
import argparse
import hashlib
import importlib.util
import json
import os
from pathlib import Path
import re
import shutil
import subprocess
import sys
import tempfile

sys.dont_write_bytecode = True
CASE = Path(__file__).resolve().parent.parent
ROOT = next(p for p in CASE.parents if (p / '.git').exists())
BASE = ROOT / 'verification/qcp/verified/f32-vadd'
NAMESPACE = 'Qs8Cvt'
EXCLUDED = {'CheckedNeonSeedProbe', 'neon_seed_probe_goal'}
STRATEGIES = [
    ('Qs8Cvt', 'char_arrays', 'proof/c/char_arrays.strategies', 'Qs8Cvt.CharArraysStrategy.CheckedCharArrays', 2),
    ('Qs8Cvt', 'cvt_rvv', 'proof/c/cvt_rvv.strategies', 'Qs8Cvt.RvvStrategy.CheckedRvvCvtStrategy', 4),
    ('QcpNeon', 'neon_bridge', '../../verified/f32-vadd/proof/c/QcpNeon/neon_bridge.strategies', 'QcpNeon.neon_bridge_strategy_proof.CheckedNeonBridge', 4),
    ('QcpNeonLoop', 'neon_tail', '../../verified/f32-vadd/proof/c/QcpNeonLoop/neon_tail.strategies', 'QcpNeonLoop.neon_tail_strategy_proof.CheckedNeonTail', 3),
    ('QcpVadd', 'float_array', '../../verified/f32-vadd/proof/c/QcpVadd/float_array.strategies', 'QcpVadd.float_array_strategy_proof.CheckedFloatArray', 2),
    ('QcpRvv32', 'rvv_arrays', '../../verified/f32-vadd/proof/c/QcpRvv32/rvv_arrays.strategies', 'QcpRvv32.rvv_arrays_strategy_proof.CheckedRvvArray', 3),
    ('QcpRvv32', 'rvv_store', '../../verified/f32-vadd/proof/c/QcpRvv32/rvv_store.strategies', 'QcpRvv32.rvv_store_strategy_proof.CheckedRvvStoreStrategy', 5),
    ('QcpRvv32', 'rvv_loop', '../../verified/f32-vadd/proof/c/QcpRvv32/rvv_loop.strategies', 'QcpRvv32.rvv_loop_strategy_proof.CheckedRvvLoopStrategy', 2),
    ('VaddComparator', 'comparator', '../../verified/f32-vadd/proof/c/VaddComparator/comparator.strategies', 'VaddComparator.comparator_strategy_proof.CheckedComparatorStrategies', 4),
    ('VaddWrapper', 'wrapper', '../../verified/f32-vadd/proof/c/VaddWrapper/wrapper.strategies', 'VaddWrapper.wrapper_strategy_proof.CheckedWrapperStrategy', 1),
]


def sha(p):
    return hashlib.sha256(Path(p).read_bytes()).hexdigest()


def read(p):
    return json.loads(Path(p).read_text())


def require(ok, message):
    if not ok:
        raise ValueError(message)


def module(name, path):
    spec = importlib.util.spec_from_file_location(name, path)
    result = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(result)
    return result


def locate(path):
    p = Path(path)
    if p.exists():
        return p
    for i, component in enumerate(p.parts):
        if component == CASE.name:
            candidate = CASE.joinpath(*p.parts[i+1:])
            if candidate.exists():
                return candidate
    return p


def relative_includes(text, destination, origin):
    def fix(match):
        p = Path(match[1])
        p = p if p.is_absolute() else origin / p
        require(p.resolve().is_relative_to(ROOT.resolve()), 'Include escapes repository')
        return '#include "' + os.path.relpath(p.resolve(), destination.parent) + '"'
    return re.sub(r'^\s*#\s*include\s*"([^\"]+)"', fix, text, flags=re.M)


def include(path, destination):
    return '#include "' + os.path.relpath(CASE / path, destination.parent) + '"\n'


def kernel_text(isa):
    """Mirror the reviewed generator's comments; executable raw tokens stay exact."""
    raw = (CASE / 'impl' / ('testNEON.c' if isa == 'neon' else 'testRVV.c')).read_text()
    spec = (CASE / 'spec.c').read_text()
    name = 'test_' + isa
    contract = re.search(r'/\*@.*?\*/', spec[spec.index('void ' + name + '('):], re.S).group()
    require(raw.count('\n{') == 1, 'Kernel body anchor drift')
    text = raw.replace('\n{', '\n' + contract + '\n{', 1)
    ann = read(CASE / 'proof/c' / (isa + '.annotations.json'))
    anchors = [('  for (;', 'invariant')] if isa == 'neon' else [('  while (batch > 0)', 'invariant'), ('    vint8m2_t vx =', 'cut')]
    anchors.append(('  assert(batch != 0);', 'entry_cut'))
    for anchor, key in anchors:
        require(text.count(anchor) == 1, 'Kernel annotation anchor drift: ' + anchor)
        text = text.replace(anchor, ann[key] + '\n' + anchor, 1)
    for call, binding in ann['where'].items():
        require(call in text, 'where anchor drift: ' + call)
        text = text.replace(call, call + ' /*@ where ' + binding + ' */')
    full = module('qs8_token_identity', CASE / 'proof/check_full.py')
    require(full.tokens(text) == full.tokens(raw), 'Annotated kernel executable tokens changed')
    return '#include "' + str(CASE / 'shim' / (isa + '_frontend.h')) + '"\n' + text


def template(stem, destination):
    raw = None
    flags = []
    identity = None
    if stem in {'neon_unit', 'rvv_unit'}:
        isa = stem.split('_')[0]
        text = relative_includes(kernel_text(isa), destination, CASE)
        raw = destination.with_name(stem + '.raw.c')
        identity = 'impl/' + ('testNEON.c' if isa == 'neon' else 'testRVV.c')
        raw.write_text(include('shim/' + isa + '_frontend.h', raw) + include(identity, raw))
    elif stem == 'wrapper_unit':
        original = (CASE / 'spec.c').read_text()
        text = original
        for rule in read(CASE / 'proof/c/wrapper.annotations.json')['compare_outputs']:
            require(text.count(rule['before']) == 1, 'Wrapper anchor drift')
            text = text.replace(rule['before'], rule['text'] + '\n ' + rule['before'], 1)
        full = module('qs8_wrapper_tokens', CASE / 'proof/check_full.py')
        require(full.tokens(original) == full.tokens(text), 'Wrapper executable tokens changed')
        strategies = ''.join('/*@ include strategies "' + n + '.strategies" */\n' for n in ['float_array', 'comparator', 'wrapper'])
        text = text.replace('void test_neon(', strategies + 'void test_neon(', 1)
        text = relative_includes(text, destination, CASE)
        flags = ['-DQCP_FORMAL']
        raw = destination.with_name(stem + '.raw.c')
        raw.write_text(include('spec.c', raw))
        identity = 'spec.c'
    else:
        text = include('shim/' + stem + '.c', destination)
    return text, flags, raw, identity


def goal_for(stem, status, preflight=None):
    candidates = []
    expected = preflight.get('goal_sha256') if preflight else status.get('goal_sha256')
    if preflight:
        candidates.append(locate(preflight['goal']))
    roots = [locate(status[key]) for key in ['run_directory', 'generation_dir', 'generation_run_directory'] if status.get(key)]
    if stem in {'neon_unit', 'rvv_unit', 'wrapper_unit'}:
        label = stem.split('_')[0]
        generation = read(CASE / 'proof' / (label + '-generation-status.json'))
        roots.append(locate(generation['run_directory']))
    for r in roots:
        candidates.extend(r / sub / (stem + '_goal.v') for sub in ['', 'coq', 'generated'])
    for p in candidates:
        if p.is_file():
            if expected:
                require(sha(p) == expected, 'Existing historical checked goal changed: ' + str(p))
            return p
    archive = CASE / 'proof/evidence/full-run'
    if (archive / 'status.json').exists():
        old = read(archive / 'status.json')
        matches = [u for u in old['actual_c_units'] if u['stem'] == stem]
        require(len(matches) == 1, 'Archive unit goal inventory ambiguous')
        u = matches[0]
        p = archive / 'units' / u['label'].replace('/', '-') / 'goal.v'
        require(sha(p) == u['goal_sha256'] and (not expected or expected == u['goal_sha256']), 'Archived checked goal changed')
        return p
    raise ValueError('Cannot locate exact actual checked goal for ' + stem)


def check_component(path, status, freeze):
    if not freeze:
        return {}
    require(status.get('passed') is True, 'Incomplete component ' + path)
    if path == 'proof/neon-seed-capability-status.json':
        require(status['vdup_c_vcs'] == 2 and 'Qs8Cvt.vector_primitives_goal.VC_Correct' in status['typed_interfaces'], 'Actual vdup typed component missing')
        require(all(r['exit_code'] == 0 for r in status['ordinary_coq_records']), 'Failed vdup ordinary component record')
    else:
        require(status.get('vc_correct_passed') is True, 'Incomplete typed component ' + path)
    public_proofs = {}
    for key in ['input_sha256', 'live_source_sha256', 'source_sha256', 'sources_sha256', 'proof_source_sha256', 'proof_sources_sha256']:
        values = status.get(key, {})
        if not isinstance(values, dict):
            continue
        for name, digest in values.items():
            source = CASE / name
            if not source.is_file() and '/' not in name:
                source = CASE / 'proof/coq' / (name if name.endswith('.v') else name + '.v')
            if source.is_file():
                require(sha(source) == digest, 'Stale component source ' + path + ': ' + name)
                if source.parent == CASE / 'proof/coq' and source.stem not in EXCLUDED:
                    public_proofs[str(source.relative_to(CASE))] = digest
            elif '/' in name:
                raise ValueError('Missing component source: ' + name)
            else:
                # Private generated goals/final local gates are not replacement
                # inputs for the full proof. Check retained bytes when available.
                candidate = locate(status['run_directory']) / 'coq' / name
                if candidate.exists():
                    require(sha(candidate) == digest, 'Historical private component source changed: ' + name)
    return public_proofs


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--freeze', action='store_true', help='Require all components complete and install an immutable H')
    args = parser.parse_args()
    (CASE / '.build').mkdir(exist_ok=True)
    run = Path(tempfile.mkdtemp(prefix='full-handoff-', dir=CASE / '.build'))
    folder = CASE / 'proof/c/full'
    folder.mkdir(exist_ok=True)
    records = []
    status = {'passed': False, 'formal_proof': False, 'freeze_requested': args.freeze, 'run_directory': str(run), 'records': records}

    def execute(command, label):
        command = ['prlimit', '--as=17179869184:17179869184', '--', *map(str, command)]
        log = run / (label + '.log')
        with log.open('w') as output:
            result = subprocess.run(command, cwd=run, stdout=output, stderr=output, timeout=600)
        records.append({'label': label, 'command': command, 'exit_code': result.returncode, 'log_sha256': sha(log)})
        require(result.returncode == 0, label + ': ' + log.read_text()[-3000:])

    try:
        require(not (CASE / 'proof/frozen-full-handoff.json').exists(), 'Existing frozen handoff: do not overwrite; preserve/unfreeze explicitly')
        full = module('qs8_full_preparation', CASE / 'proof/check_full.py')
        coverage = module('qs8_full_coverage', BASE / 'proof/coverage.py')
        coverage.C_KEYWORDS.add('return')
        preflight = read(CASE / 'proof/component-unit-preflight.json')
        require(len(preflight['units']) == 23 and preflight['actual_c_vcs'] == 832, 'Provider preflight inventory changed')
        inventory = [(u['stem'], u['component_status'], u['typed_instance'], u) for u in preflight['units']]
        inventory += [('neon_unit', 'proof/neon-proof-status.json', 'Qs8Cvt.NeonChecked.CheckedNeon', None),
                      ('rvv_unit', 'proof/rvv-proof-status.json', 'Qs8Cvt.RvvChecked.CheckedRvv', None),
                      ('wrapper_unit', 'proof/wrapper-proof-status.json', 'Qs8Cvt.WrapperChecked.CheckedWrapper', None)]
        units, components, definitions, declarations, calls, public_proofs = [], {}, {}, {}, set(), {}
        for stem, certificate, checked, pre in inventory:
            path = CASE / certificate
            component = read(path) if path.exists() else {}
            public_proofs.update(check_component(certificate, component, args.freeze))
            if path.exists():
                components[certificate] = {'path': certificate, 'sha256': sha(path)}
            elif args.freeze:
                raise ValueError('Missing complete component ' + certificate)
            tu = folder / (stem + '.c')
            text, flags, raw, identity_source = template(stem, tu)
            tu.write_text(text)
            src = run / (stem + '.c')
            src.write_text(full.render_unit_text(CASE, {'translation_unit': str(tu.relative_to(CASE))}))
            expanded = run / (stem + '.expanded.c')
            execute(['gcc', '-E', '-P', '-CC', '-nostdinc', *flags, src, '-I', CASE, '-o', expanded], stem + '-cpp')
            if pre:
                require(sha(CASE / pre['actual_source']) == pre['actual_source_sha256'], 'Provider original source changed: ' + stem)
                require(sha(expanded) == pre['generated_cpp_sha256'], 'Current provider CPP differs from checked component: ' + stem)
            if raw:
                raw_cpp = run / (stem + '.raw.expanded.c')
                execute(['gcc', '-E', '-P', '-CC', '-nostdinc', *flags, raw, '-I', CASE, '-o', raw_cpp], stem + '-raw-cpp')
                require(full.tokens(expanded.read_text()) == full.tokens(raw_cpp.read_text()), 'Original frontend executable tokens differ: ' + stem)
            goal = goal_for(stem, component, pre)
            fields = re.findall(r'^Axiom proof_of_(\w+) :', goal.read_text(), re.M)
            require(len(fields) == full.EXPECTED_UNITS[stem] and len(set(fields)) == len(fields), 'Generated field inventory changed: ' + stem)
            bodies = []
            for name, signature, contract, edges in coverage._functions(expanded.read_text(), stem):
                pair = signature, contract
                require(name not in declarations or declarations[name] == pair, 'C signature/contract mismatch: ' + name)
                declarations[name] = pair
                if edges is not None:
                    definitions.setdefault(name, []).append(stem)
                    bodies.append(name)
                    calls.update(edges)
            if pre:
                require(sorted(bodies) == pre['functions_defined'], 'Provider body inventory changed')
            unit = dict(stem=stem, translation_unit=str(tu.relative_to(CASE)), cpp_flags=flags,
                        cpp_sha256=sha(expanded), goal_sha256=sha(goal), fields=fields,
                        functions_defined=sorted(bodies), typed_instance=checked, strategy_application_limit=1024)
            if raw:
                unit.update(raw_translation_unit=str(raw.relative_to(CASE)), identity_source=identity_source)
            units.append(unit)
        require(not set(declarations) - set(definitions) and not calls - set(definitions) and len(definitions) == 49, 'Actual C body/call closure incomplete')
        require(sum(len(u['fields']) for u in units) == 1337, 'Actual unit field sum changed')
        public = run / 'public.expanded.c'
        execute(['gcc', '-E', '-P', '-CC', '-nostdinc', '-DQCP_FORMAL', CASE / 'spec.c', '-I', CASE, '-o', public], 'public-cpp')
        for name, signature, contract, _ in coverage._functions(public.read_text(), 'public spec'):
            require(name not in declarations or declarations[name] == (signature, contract), 'Public contract/signature mismatch: ' + name)
        strategies = []
        tool = Path(shutil.which('qcp')).resolve().parent / 'StrategyCheck'
        for namespace, stem, source, checked, count in STRATEGIES:
            out = run / ('strategy-' + namespace + '-' + stem)
            out.mkdir()
            execute([tool, '--arch=64', '--endian=little', '--no-exec-info', '--input-file=' + str(CASE / source), '--coq-output-dir=' + str(out), '--coq-logic-path=' + namespace], 'strategy-' + namespace + '-' + stem)
            goal = out / (stem + '_strategy_goal.v')
            fields = re.findall(r'^\s*Axiom (\w+) :', goal.read_text(), re.M)
            require(len(fields) == count, 'Strategy field inventory changed: ' + stem)
            if namespace != NAMESPACE:
                require(goal.read_bytes() == (BASE / 'proof/coq' / namespace / goal.name).read_bytes(), 'Fresh inherited strategy differs from reviewed BASE')
            strategies.append(dict(file=source, namespace=namespace, fields=fields, goal_sha256=sha(goal), typed_instance=checked))
        native_path = 'proof/native-status.json'
        native, formal = read(CASE / native_path), read(CASE / 'proof/formal-native-status.json')
        require(native['passed'] and formal['passed'] and 'failures=0' in native['ubsan_output'] and 'failures=0' in native['asan_output'], 'Current native acceptance failed')
        provenance = CASE / '.build/independent-audit/formal-current-native.json'
        retained = CASE / 'proof/evidence/formal-current-native.json'
        source = provenance if provenance.exists() else retained
        current = read(source)
        require(current['build_exit_code'] == 0 and current['run_exit_code'] == 0 and current['input_identity_unchanged'] and 'failures=0' in current['output'], 'Current exact-closure native replay incomplete')
        require(len(current['input_sha256']) == 53, 'Recursive native input inventory must contain53 source files')
        recursive = {}
        for name, digest in current['input_sha256'].items():
            p = Path(name)
            if not p.exists():
                p = locate(name)
            require(p.resolve().is_relative_to(ROOT.resolve()) and sha(p) == digest, 'Native recursive input changed: ' + name)
            recursive[os.path.relpath(p.resolve(), CASE)] = digest
        retained.parent.mkdir(exist_ok=True)
        if retained.exists():
            require(retained.read_bytes() == source.read_bytes(), 'Preserve existing native evidence bytes')
        else:
            shutil.copyfile(source, retained)
        auxiliary = [dict(path='proof/formal-native-status.json', sha256=sha(CASE / 'proof/formal-native-status.json'),
                          required_values={'output': formal['output'], 'address_sanitizer': formal['address_sanitizer']},
                          input_sha256=recursive, recursive_input_inventory_evidence='proof/evidence/formal-current-native.json',
                          recursive_input_inventory_evidence_sha256=sha(retained), system_headers_not_hashed=current['system_headers_not_hashed'])]
        own = []
        for p in sorted((CASE / 'proof/coq').glob('*.v')):
            if p.stem in EXCLUDED:
                continue
            clean = re.sub(r'\(\*.*?\*\)', '', p.read_text(), flags=re.S)
            require(not re.search(r'\b(?:CheckedNeonSeedProbe|neon_seed_probe_goal)\b', clean), 'Diagnostic consumer in public closure: ' + p.name)
            require(not re.search(r'\b(?:Axiom|Parameter|Admitted|admit)\b', clean), 'Unchecked project declaration: ' + p.name)
            own.append(p.stem)
        own += [u['stem'] + '_goal' for u in units]
        own += [Path(s['file']).stem + '_strategy_goal' for s in strategies if s['namespace'] == NAMESPACE]
        require(len(own) == len(set(own)), 'Duplicate local Coq inventory')
        memory_certificate = CASE / 'proof/neon-memory-status.json'
        support_statuses = []
        if memory_certificate.exists():
            memory = read(memory_certificate)
            if args.freeze:
                require(memory.get('passed') is True and memory.get('partial_interface_checked') is True and memory['actual_c_fields'] == memory['print_assumptions'] == 67, 'Incomplete memory67 supporting component')
                require(all(r['exit_code'] == 0 for r in memory['records']), 'Failed memory67 record')
                for n, d in memory['input_sha256'].items():
                    require(sha(CASE / n) == d, 'Memory67 support source changed: ' + n)
            support_statuses.append(dict(path='proof/neon-memory-status.json', sha256=sha(memory_certificate)))
        originals, repair = read(CASE / 'proof/originals.json'), read(CASE / 'proof/repair.json')
        implementations = {}
        for side, cap in [('neon', 'NEON'), ('rvv', 'RVV')]:
            item = dict(actual='impl/test' + cap + '.c', actual_sha256=sha(CASE / 'impl' / ('test' + cap + '.c')),
                        original=originals['original_' + side + '_path'], original_sha256=originals['original_' + side + '_sha256'],
                        variant='repaired' if side == 'neon' else 'original')
            require(sha(ROOT / item['original']) == item['original_sha256'], 'Repository original changed')
            if side == 'neon':
                require(item['actual_sha256'] == repair['repaired_neon_sha256'], 'Repaired NEON changed')
                item.update(patch='proof/repair.patch', patch_sha256=sha(CASE / 'proof/repair.patch'), patch_target='impl/testNEON.c',
                            counterexample_sha256={'proof/repair.json': sha(CASE / 'proof/repair.json'), 'proof/original/testNEON.c': sha(CASE / 'proof/original/testNEON.c')})
            else:
                require(item['actual_sha256'] == item['original_sha256'] == repair['unchanged_rvv_sha256'], 'Original RVV changed')
            implementations[side] = item
        files = {CASE / 'spec.c', Path(__file__), CASE / 'proof/check_full.py', CASE / 'proof/originals.json', CASE / 'proof/repair.json', CASE / 'proof/repair.patch',
                 CASE / native_path, CASE / 'proof/formal-native-status.json', retained, CASE / 'proof/component-unit-preflight.json'}
        files |= {CASE / p for p in components}
        files |= {CASE / s['path'] for s in support_statuses}
        files |= {CASE / ('proof/' + label + '-generation-status.json') for label in ['neon', 'rvv', 'wrapper']}
        for directory, extensions in [('impl', {'.c'}), ('shim', {'.c', '.h', '.strategies'}), ('proof/c', {'.c', '.h', '.json', '.strategies'}), ('proof/original', {'.c'})]:
            files |= {p for p in (CASE / directory).rglob('*') if p.is_file() and p.suffix in extensions}
        files |= {CASE / 'proof/coq' / (name + '.v') for name in own if not name.endswith('_goal')}
        files |= {p for p in (CASE / 'proof').glob('*.py') if p.name not in {'record_status.py', 'audit_relocation.py'}}
        files |= {CASE / p for p in recursive}
        files |= {CASE / s['file'] for s in strategies}
        frozen = {os.path.relpath(p.resolve(), CASE): sha(p) for p in sorted(files)}
        for name, digest in native['current_sources_sha256'].items():
            require(sha(CASE / name) == digest, 'Native input changed: ' + name)
        h = dict(namespace=NAMESPACE, scope='Repaired NEON/original RVV fixed C-shim partial correctness; all int32 zero-points and all binary32 scales, with NaN-aware observation',
                 total_actual_c_vcs=1337, actual_c_function_count=49, whole_kernel_bodies_required=['test_neon', 'test_rvv', 'compare_outputs', 'equivalent'],
                 units=units, strategies=strategies, own_modules=own, components=list(components.values()), component_public_proof_sha256=public_proofs, support_statuses=support_statuses,
                 implementations=implementations, native_status=native_path, native_status_sha256=sha(CASE / native_path), native_success_field='passed',
                 native_required_values={'ubsan_output': native['ubsan_output'], 'asan_output': native['asan_output']}, native_input_sha256=native['current_sources_sha256'], auxiliary_native_statuses=auxiliary,
                 frozen_source_sha256=frozen, diagnostics_excluded=sorted(EXCLUDED),
                 limits=dict(pointer_bits=64, endian='little', vlen_bits=128, rvv_configurations=['e8m2', 'e16m4', 'e32m8'], vlmax=32,
                             selected_vl='min(AVL,32)', input_padding_bytes=7, output_padding_floats=0,
                             batch_domain='0<n<=4611686018427387903', parameter_domain='All int32 zero points and all IEEE binary32 scales including NaN/Inf/signed zero',
                             arithmetic_order='Signed16 wrapping before signed32 widening and binary32 conversion/multiply',
                             observation='Numeric equality or both NaN; NaN payload/sign, flags and traps unobserved', isa_refinement='open', physical_struct_abi_refinement='not claimed', termination_theorem='not claimed'),
                 planning_run_directory=str(run))
        (run / 'handoff.json').write_text(json.dumps(h, indent=2) + '\n')
        if args.freeze:
            (CASE / 'proof/frozen-full-handoff.json').write_text(json.dumps(h, indent=2) + '\n')
        status.update(passed=True, units=len(units), actual_c_fields=sum(len(u['fields']) for u in units), actual_c_bodies=len(definitions), strategy_groups=len(strategies), strategy_fields=sum(len(s['fields']) for s in strategies), own_modules=len(own), frozen_inputs=len(frozen))
    except Exception as error:
        status['error'] = str(error)
    (run / 'status.json').write_text(json.dumps(status, indent=2) + '\n')
    print(json.dumps({k: v for k, v in status.items() if k != 'records'}, indent=2))
    return 0 if status['passed'] else 1


if __name__ == '__main__':
    raise SystemExit(main())
