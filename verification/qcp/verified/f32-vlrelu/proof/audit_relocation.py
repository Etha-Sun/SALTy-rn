#!/usr/bin/env python3
"""Audit moved source/CPP/Coq identity; never run or claim a new proof."""
import hashlib
import importlib.util
import json
from pathlib import Path
import shutil
import subprocess
import tempfile

from artifact_paths import artifact_path

HERE = Path(__file__).resolve().parent
CASE = HERE.parent
ROOT = next(p for p in CASE.parents if (p / '.git').exists())
BASE = ROOT / 'verification/qcp/verified/f32-vadd'


def sha(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def load_module(name, path):
    spec = importlib.util.spec_from_file_location(name, path)
    result = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(result)
    return result


def main():
    inventory_path = HERE / 'evidence/pre-relocation-inventory.json'
    before = json.loads(inventory_path.read_text())
    full_path = HERE / 'full-status.json'
    full = json.loads(full_path.read_text())
    if not full['passed'] or sha(full_path) != before['full_status_sha256']:
        raise ValueError('Historical full certificate changed')
    historical_run = artifact_path(full['run_directory'])
    audit_run = Path(tempfile.mkdtemp(prefix='relocation-identity-', dir=CASE / '.build'))
    report = {'audit_passed': False, 'scope': 'identity audit only; no second QCP/Coq proof run',
              'formal_proof_replayed': False, 'old_case': before['old_case'],
              'new_case': str(CASE), 'historical_run_directory': full['run_directory'],
              'current_run_directory': str(historical_run), 'audit_directory': str(audit_run),
              'historical_full_status_sha256': sha(full_path),
              'cpp_records': [], 'compiled_source_records': []}
    records = report['cpp_records']
    full_runner = load_module('relocation_full', HERE / 'check_full.py')
    prepare = load_module('relocation_prepare', BASE / 'proof/prepare.py')
    base_manifest = json.loads((BASE / 'proof/manifest.json').read_text())
    expected = {u['label']: u for u in full['actual_c_units']}

    def cpp(label, stem, text):
        folder = audit_run / label.replace('/', '-')
        folder.mkdir()
        source = folder / (stem + '.c')
        source.write_text(text)
        expanded = folder / 'expanded.c'
        command = ['gcc', '-E', '-P', '-CC', '-nostdinc', str(source), '-I', str(CASE), '-o', str(expanded)]
        completed = subprocess.run(command, cwd=folder, capture_output=True, text=True, timeout=90)
        (folder / 'cpp.log').write_text(completed.stdout + completed.stderr)
        if completed.returncode:
            raise RuntimeError(label + ' current CPP failed')
        old = artifact_path(expected[label]['actual_c_path'])
        record = {'unit': label, 'command': command, 'exit_code': completed.returncode,
                  'historical_cpp_sha256': expected[label]['cpp_sha256'],
                  'moved_cpp_sha256': sha(old), 'current_cpp_sha256': sha(expanded),
                  'cpp_bytes_identical': expanded.read_bytes() == old.read_bytes()}
        records.append(record)
        if not record['cpp_bytes_identical'] or sha(old) != expected[label]['cpp_sha256']:
            raise ValueError('CPP identity mismatch: ' + label)

    try:
        for relative, digest in before['immutable'].items():
            if sha(CASE / relative) != digest:
                raise ValueError('C/spec/shim/Coq source changed: ' + relative)
        report['immutable_public_files_checked'] = len(before['immutable'])
        for namespace, stem in full_runner.BASE_UNITS:
            item = next(i for i in base_manifest['units'] if i['namespace'] == namespace
                        and i.get('stem', Path(i['path']).stem) == stem)
            source = BASE / 'proof' / item['path']
            temporary = audit_run / (namespace + '-' + stem + '-template.c')
            prepare.write_unit(source, source.read_text(), temporary)
            cpp(namespace + '/' + stem, stem, temporary.read_text())
        for stem in ['bits', 'neon_primitives', 'rvv_primitives']:
            cpp('VLRelu/' + stem, stem, '#include "' + str(CASE / 'shim' / (stem + '.c')) + '"\n')
        public = (CASE / 'spec.c').read_text()
        names = ['test_neon', 'test_rvv', 'qcp_vadd_read', 'preserve_float',
                 'check_observation', 'same_lane', 'compare_outputs', 'equivalent']
        functions = {n: prepare.function(public, n) for n in names}
        for side in ['neon', 'rvv']:
            original = (CASE / 'impl' / ('testNEON.c' if side == 'neon' else 'testRVV.c')).read_text()
            annotations = json.loads((HERE / 'c' / (side + '.annotations.json')).read_text())
            patches = annotations if side == 'neon' else annotations['patches']
            annotated = full_runner.patch_comments(original, patches)
            if side == 'rvv':
                annotated = full_runner.patch_comments(annotated, [
                    {'after': a, 'text': '/*@ where ' + b + ' */'} for a, b in annotations['where'].items()])
            cpp('VLRelu/' + side, side + '_unit',
                '#include "' + str(CASE / 'shim' / (side + '_frontend.h')) + '"\n' + annotated)
        preamble = public[:min(public.index(f) for f in functions.values())]
        wrappers = [
            ('read', 'array_read', ['qcp_vadd_read'], ['qcp_vadd_read'], ['float_array']),
            ('bridge', 'bridge', ['preserve_float', 'check_observation', 'same_lane'], ['preserve_float', 'check_observation', 'same_lane'], []),
            ('comparator', 'comparator', ['qcp_vadd_read', 'same_lane', 'compare_outputs'], ['compare_outputs'], ['comparator']),
            ('wrapper', 'wrapper', ['test_neon', 'test_rvv', 'compare_outputs', 'equivalent'], ['equivalent'], ['comparator', 'wrapper'])]
        for suffix, stem, selected, definitions, strategies in wrappers:
            pieces = [preamble] + ['/*@ include strategies "' + n + '.strategies" */' for n in strategies]
            for name in selected:
                text = functions[name]
                if name not in definitions:
                    text = prepare.declaration(text)
                elif name == 'compare_outputs':
                    inv = json.loads((BASE / 'proof/c/VaddComparator/comparator.annotations.json').read_text())['compare_outputs'][0]['text']
                    text = full_runner.patch_comments(text, [{'before': 'while (i < n)', 'text': inv}])
                elif name == 'equivalent':
                    text = full_runner.patch_comments(text, json.loads((HERE / 'c/wrapper.annotations.json').read_text())['equivalent'])
                pieces.append(text)
            cpp('VLRelu.' + suffix + '/' + stem, stem, '\n\n'.join(pieces))
        if {r['unit'] for r in records} != set(expected) or len(records) != 14:
            raise ValueError('Incomplete current CPP inventory')
        for name, digest in full['compiled_source_sha256'].items():
            namespace, stem = name.rsplit('.', 1)
            folder = namespace.replace('.', '/') if namespace else 'relations'
            current = historical_run / 'coq' / folder / (stem + '.v')
            if sha(current) != digest:
                raise ValueError('Moved compiled source changed: ' + name)
            report['compiled_source_records'].append({'logical_name': name, 'sha256': digest})
        if len(report['compiled_source_records']) != 123:
            raise ValueError('Unexpected ordinary compilation inventory')
        if sha(historical_run / 'FinalCaseCheck.v') != full['final_gate_sha256']:
            raise ValueError('Final gate source changed')
        if sha(historical_run / 'FinalCaseCheck.log') != full['final_assumptions_log_sha256']:
            raise ValueError('Final gate execution log changed')
        for item in base_manifest['modules']:
            if (BASE / 'proof' / item['path']).read_bytes() != (historical_run / item['path']).read_bytes():
                raise ValueError('Reviewed BASE source changed: ' + item['path'])
        for name in full_runner.CORE:
            if (HERE / 'coq' / (name + '.v')).read_bytes() != (historical_run / 'coq/VLRelu' / (name + '.v')).read_bytes():
                raise ValueError('Public CORE differs from compiled source: ' + name)
        report.update(audit_passed=True, current_cpp_units=14,
                      cpp_bytes_identical=True, ordinary_compiled_sources_identical=123,
                      final_gate_source_identical=True, compiled_source_count_including_final=124,
                      no_c_spec_shim_or_coq_changes=True)
    except Exception as error:
        report['error'] = str(error)
    finally:
        (audit_run / 'status.json').write_text(json.dumps(report, indent=2) + '\n')
        (HERE / 'relocation-identity.json').write_text(json.dumps(report, indent=2) + '\n')
    print(json.dumps({k: report.get(k) for k in ['audit_passed', 'current_cpp_units',
                     'compiled_source_count_including_final', 'formal_proof_replayed', 'error']}))
    return 0 if report['audit_passed'] else 1


if __name__ == '__main__':
    raise SystemExit(main())
