#!/usr/bin/env python3
"""Audit current actual C inputs; freeze only complete, byte-pinned components.

Preparation is source identity evidence. Only check_full.py can issue a complete
ordinary Coq run; this script never transfers component object-file credit.
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
import tempfile

CASE = Path(__file__).resolve().parent.parent
ROOT = next(p for p in CASE.parents if (p / '.git').exists())
NS = 'Qs8Mul'
sha = lambda p: hashlib.sha256(Path(p).read_bytes()).hexdigest()
read = lambda p: json.loads(Path(p).read_text())


def require(value, message):
    if not value:
        raise ValueError(message)


def module(name, path):
    spec = importlib.util.spec_from_file_location(name, path)
    result = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(result)
    return result


def required_modules(units, strategies, extra_roots):
    inputs = module('dependency_target_inputs', CASE / 'proof/full_inputs.py')
    generated = {u['stem'] + '_goal' for u in units} | {s['stem'] for s in strategies}
    generated_paths = {u['stem'] + '_goal': inputs.goal_source(u) for u in units}
    generated_paths.update({s['stem']: inputs.goal_source(s, strategy=True) for s in strategies})
    roots = {u['provider_root'] for u in units} | {s['provider_root'] for s in strategies}
    pending = list(roots | generated | set(extra_roots))
    needed = set()
    while pending:
        name = pending.pop()
        if name in needed:
            continue
        require(re.fullmatch(r'\w+', name), 'Unexpected module path: ' + name)
        source = generated_paths.get(name, CASE / 'proof/coq' / (name + '.v'))
        require(source.is_file(), 'Missing complete source dependency: ' + name)
        needed.add(name)
        text = re.sub(r'\(\*.*?\*\)', '', source.read_text(), flags=re.S)
        if name not in generated:
            require(not re.search(r'\b(?:Axiom|Parameter|Admitted|admit|Abort)\b', text),
                    'Unchecked project declaration: ' + name)
        for m in re.finditer(r'(?:From\s+([\w.]+)\s+)?Require\s+(?:(?:Import|Export)\s+)?([\w.\s]+?)\.(?=\s|$)', text):
            prefix, body = m.groups()
            for word in body.split():
                qualified = prefix + '.' + word if prefix else word
                if qualified.startswith(NS + '.'):
                    dep = qualified[len(NS) + 1:]
                    require('.' not in dep, 'Unexpected local subnamespace: ' + qualified)
                    pending.append(dep)
    return sorted(needed)


def audit_native(inventory):
    result = []
    expected_codes = {'correct-compile': 0, 'correct-run': 0,
                      'wrong-one-compile': 0, 'wrong-one-run': 2,
                      'wrong-both-compile': 0, 'wrong-both-run': 3}
    for name in inventory['native_statuses']:
        status = read(CASE / name)
        require(status['passed'] is True and status['per_process_memory_GiB'] == 16,
                'Native acceptance failed: ' + name)
        require({r['label']: r['exit_code'] for r in status['records']} == expected_codes and
                len(status['records']) == len(expected_codes), 'Native control evidence differs')
        require(status['cases'] == 278016 and status['lanes_per_side'] == 12804556 and
                status['all65536_output_offsets'] is True, 'Incomplete native corpus')
        for mapping in ['input_sha256', 'actual_recursive_local_input_sha256']:
            for source, digest in status[mapping].items():
                require((CASE / source).resolve().is_relative_to(ROOT.resolve()) and
                        sha(CASE / source) == digest, 'Native source drift: ' + source)
        require(len(status['actual_recursive_local_input_sha256']) ==
                status['actual_recursive_local_input_count'], 'Native recursive count differs')
        if status['sanitizer'] == 'address':
            require(status['actual_memory_max'] == 16 * 1024**3 and
                    status['actual_memory_swap_max'] == 0, 'Unobserved ASan memory limit')
        result.append(dict(path=name, sha256=sha(CASE / name),
                           input_sha256=status['input_sha256'],
                           recursive_input_sha256=status['actual_recursive_local_input_sha256']))
    require({read(CASE / r['path'])['backend'] for r in result} == {'arrays', 'fields'},
            'Both independent ISA and actual scalar-field views required')
    require(len(result) == 4, 'Both sanitizers for both views required')
    return result


def audit_semantics():
    semantic = read(CASE / 'proof/semantics.json')
    require(semantic['public_contract'] == 'spec.c' and
            semantic['intrinsic_ledger_sha256'] == sha(CASE / 'proof/intrinsic-ledger.json'),
            'Public semantic boundary/ledger binding differs')
    for name, digest in semantic['model_sources'].items():
        require(sha(CASE / name) == digest, 'Public semantic model changed: ' + name)
    require(semantic['trust_boundary']['intrinsic_terminals'] == 57 and
            semantic['trust_boundary']['ordinary_C_functions'] == 40,
            'Public semantic body/spec accounting differs')
    return semantic


def audit_implementations(run, execute):
    originals, repair = read(CASE / 'proof/originals.json'), read(CASE / 'proof/repair.json')
    result = {}
    for side, filename in [('neon', 'testNEON.c'), ('rvv', 'testRVV.c')]:
        old = originals['files'][side]
        require(sha(ROOT / old['path']) == sha(CASE / 'proof/original' / filename) ==
                old['sha256'] == repair['original_' + side + '_sha256'], 'Original source drift')
        require(sha(CASE / 'impl' / filename) == repair['repaired_' + side + '_sha256'],
                'Repaired implementation drift')
        result[side] = dict(original=old['path'], original_sha256=old['sha256'],
                            actual='impl/' + filename, actual_sha256=sha(CASE / 'impl' / filename))
    require(repair['neon_changed'] is False and result['neon']['original_sha256'] ==
            result['neon']['actual_sha256'], 'NEON original identity differs')
    require(sha(CASE / repair['patch']) == repair['patch_sha256'] and
            sha(CASE / repair['counterexamples']) == repair['counterexamples_sha256'],
            'Repair patch/counterexample identity differs')
    target = run / 'repair-replay/impl'
    target.mkdir(parents=True)
    shutil.copyfile(CASE / 'proof/original/testRVV.c', target / 'testRVV.c')
    execute(['patch', '--batch', '--forward', '--fuzz=0', '-p1', '-d', target.parent,
             '-i', CASE / repair['patch']], 'exact-repair-patch')
    require(sha(target / 'testRVV.c') == result['rvv']['actual_sha256'],
            'Exact original plus repair patch does not reconstruct current RVV')
    supporting = repair['supporting_source_sha256']
    require(len(supporting) == 46 and all(name.startswith('shim/') for name in supporting),
            'Expected complete forty-six-file supporting C/header bundle')
    expected_paths = {'impl/testRVV.c'} | set(supporting)
    patch_paths = re.findall(r'^\+\+\+ b/([^\t\n]+)', (CASE / repair['patch']).read_text(), re.M)
    require(len(patch_paths) == len(set(patch_paths)) and set(patch_paths) == expected_paths,
            'Primary patch destinations differ from actual complete source bundle')
    for name, digest in supporting.items():
        current, replayed = (CASE / name).resolve(), (target.parent / name).resolve()
        require(current.is_relative_to(CASE.resolve()) and replayed.is_relative_to(target.parent.resolve()) and
                current.is_file() and replayed.is_file() and sha(current) == sha(replayed) == digest,
                'Supporting repair source failed exact reconstruction: ' + name)
    require({str(p.relative_to(target.parent)) for p in target.parent.rglob('*') if p.is_file()} == expected_paths,
            'Unexpected file or omitted support in exact repair replay')
    require(sha(CASE / repair['single_impl_patch']) == repair['single_impl_patch_sha256'] and
            sha(CASE / repair['repair_bundle_status']) == repair['repair_bundle_status_sha256'],
            'Secondary main-only or bundle receipt changed')
    result['rvv']['supporting_source_sha256'] = supporting
    result['rvv']['primary_patch'] = repair['patch']
    result['rvv']['complete_bundle_reconstructed'] = True
    return result


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--freeze', action='store_true')
    parser.add_argument('--prepare-only', action='store_true')
    args = parser.parse_args()
    require(args.freeze != args.prepare_only, 'Choose --prepare-only or --freeze')
    run = Path(tempfile.mkdtemp(prefix='full-handoff-', dir=CASE / '.build'))
    records = []
    status = dict(passed=False, whole_kernel_verified=False, formal_proof=False,
                  freeze_requested=args.freeze, run_directory=str(run), records=records)
    def execute(command, label):
        command = ['prlimit', '--as=17179869184:17179869184', '--', *map(str, command)]
        log = run / (label + '.log')
        with log.open('w') as output:
            try:
                code = subprocess.run(command, cwd=run, stdout=output, stderr=output, timeout=600).returncode
            except subprocess.TimeoutExpired:
                code = 124
        records.append(dict(label=label, command=command, exit_code=code, log_sha256=sha(log)))
        require(code == 0, label + ': ' + log.read_text()[-2000:])
    try:
        inputs = module('current_full_inputs', CASE / 'proof/full_inputs.py')
        coverage = module('actual_call_coverage', CASE / 'proof/full_call_coverage.py')
        inventory = read(CASE / 'proof/component-unit-inventory.json')
        units = inputs.inventory_units(require_complete=args.freeze)
        paths = {}
        for unit in units:
            stem = unit['stem']
            folder = run / stem
            folder.mkdir()
            rendered = inputs.render_unit(stem, folder / (stem + '.c'), unit['construction'])
            expanded = folder / 'expanded.c'
            execute(['gcc', '-E', '-P', '-CC', '-nostdinc', *rendered['cpp_flags'],
                     '-I', CASE, rendered['private_source_path'], '-o', expanded], stem + '-cpp')
            paths[stem] = expanded
            if rendered['private_identity_path']:
                raw = folder / 'raw-expanded.c'
                execute(['gcc', '-E', '-P', '-CC', '-nostdinc', *rendered['cpp_flags'],
                         '-I', CASE, rendered['private_identity_path'], '-o', raw], stem + '-raw-cpp')
                require(inputs.tokens(raw.read_text()) == inputs.tokens(expanded.read_text()),
                        'Raw/annotated frontend tokens differ: ' + stem)
            if unit.get('historical_CPP'):
                historical = Path(unit['historical_CPP'])
                require(sha(historical) == unit['historical_CPP_sha256'], 'Historical CPP drift: ' + stem)
                require(inputs.tokens(historical.read_text()) == inputs.tokens(expanded.read_text()),
                        'Current CPP differs from checked component: ' + stem)
            unit.update(cpp_flags=rendered['cpp_flags'], cpp_sha256=sha(expanded),
                        identity_source=rendered['identity_source'])
        call_closure = coverage.audit_sources(paths, inventory, read(CASE / 'proof/intrinsic-ledger.json'),
                                             CASE, require_target_inventory=args.freeze)
        status['call_closure'] = call_closure
        if args.prepare_only:
            status.update(passed=True, scope='current actual C identity/call closure only')
        else:
            require(not (CASE / 'proof/frozen-full-handoff.json').exists(), 'Existing frozen H must be preserved')
            required_tools = ['check_full.py', 'gate_sources.py', 'parallel.py', 'external_dependencies.py']
            require(all((CASE / 'proof' / n).is_file() for n in required_tools), 'Incomplete whole-case tools')
            strategies = inputs.strategy_units()
            for strategy in strategies:
                goal = inputs.goal_source(strategy, strategy=True)
                fields = re.findall(r'^\s*Axiom (\w+)\s*:', goal.read_text(), re.M)
                types = re.findall(r'^Module Type (\w+)\.', goal.read_text(), re.M)
                require(len(fields) == strategy['fields'] and len(types) == 1, 'Strategy target inventory')
                strategy['field_names'], strategy['module_type'] = fields, types[0]
            own = required_modules(units, strategies, inventory['extra_required_math_roots'])
            native = audit_native(inventory)
            semantic = audit_semantics()
            implementations = audit_implementations(run, execute)
            files = {CASE / 'README.md', CASE / 'spec.c'}
            for directory, suffixes in [('impl', {'.c'}), ('shim', {'.c', '.h', '.strategies'}),
                                        ('proof/c', {'.c', '.h', '.json', '.strategies'}),
                                        ('proof/original', {'.c'}), ('proof/native', {'.c', '.h', '.py'})]:
                files |= {p for p in (CASE / directory).rglob('*') if p.is_file() and p.suffix in suffixes}
            generated = {u['stem'] + '_goal' for u in units} | {s['stem'] for s in strategies}
            files |= {CASE / 'proof/coq' / (n + '.v') for n in own if n not in generated}
            files |= {p for p in (CASE / 'proof').glob('*.py')}
            files |= {CASE / 'proof' / n for n in ['component-unit-inventory.json', 'intrinsic-ledger.json',
                      'intrinsic-contract-inventory.json', 'isa-source-review.json', 'repair.json', 'originals.json',
                      'original-counterexamples.json', 'repair-rvv.patch', 'semantics.json']}
            files |= {ROOT / r['original'] for r in implementations.values()}
            repair = read(CASE / 'proof/repair.json')
            files |= {CASE / repair[key] for key in ['patch', 'single_impl_patch', 'repair_bundle_status']}
            files |= {CASE / name for name in repair['supporting_source_sha256']}
            files |= {CASE / u['component_status'] for u in units}
            files |= {CASE / s['component_status'] for s in strategies}
            for receipt in native:
                files.add(CASE / receipt['path'])
                files |= {CASE / n for n in receipt['input_sha256']}
                files |= {CASE / n for n in receipt['recursive_input_sha256']}
            frozen = {os.path.relpath(p.resolve(), CASE): sha(p) for p in sorted(files)}
            handoff = dict(schema=1, namespace=NS,
                           scope='Repaired actual kernel C-shim modular partial correctness; explicit source-reviewed intrinsic specifications; no ISA or termination theorem',
                           units=units, strategies=strategies, own_modules=own,
                           total_actual_c_vcs=sum(len(u['fields']) for u in units),
                           actual_c_function_count=40, call_closure=call_closure,
                           native_statuses=native, implementations=implementations,
                           public_semantic_boundary=semantic,
                           frozen_source_sha256=frozen,
                           limits=dict(configured_jobs=32, ordinary_per_process_GiB=16,
                                       heavy_per_process_GiB=32, generation_timeout=21600,
                                       ordinary_timeout=7200, heavy_timeout=14400,
                                       address_bits=64, endian='little', VLEN=128, VLMAX=32,
                                       all_legal_VL_choices=True, all_binary32_scales=True),
                           planning_run_directory=str(run))
            text = json.dumps(handoff, indent=2) + '\n'
            (run / 'handoff.json').write_text(text)
            (CASE / 'proof/frozen-full-handoff.json').write_text(text)
            status.update(passed=True, source_handoff_frozen=True, frozen_inputs=len(frozen),
                          actual_C_fields=handoff['total_actual_c_vcs'], own_modules=len(own))
    except Exception as error:
        status['error'] = repr(error)
    (run / 'status.json').write_text(json.dumps(status, indent=2) + '\n')
    print(json.dumps({k: v for k, v in status.items() if k not in {'records', 'call_closure'}}, indent=2))
    return 0 if status['passed'] else 1


if __name__ == '__main__':
    raise SystemExit(main())
