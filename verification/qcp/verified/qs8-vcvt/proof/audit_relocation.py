#!/usr/bin/env python3
"""Rebuild live CPP identities against an immutable completed full proof.

Identity only: no QCP/Coq proof is replayed, no object files are copied, and no
historical certificate, current status, manifest or global catalog is changed.
"""
import argparse
import importlib.util
import json
from pathlib import Path
import sys
import tempfile

sys.dont_write_bytecode = True


def module(name, path):
    spec = importlib.util.spec_from_file_location(name, path)
    result = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(result)
    return result


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--proof-run', type=Path, help='Original completed run, optionally in another worktree')
    parser.add_argument('--preflight', action='store_true', help='Check current H/repair/native and live CPP against H; no completed proof or archive claim')
    args = parser.parse_args()
    here = Path(__file__).resolve().parent
    case = here.parent
    engine = module('record_case_identity', here / 'record_status.py')
    work = Path(tempfile.mkdtemp(prefix='relocation-identity-', dir=case / '.build'))
    report = {'audit_passed': False, 'formal_proof_replayed': False,
              'kind': 'live_source_cpp_and_compiled_source_identity_only',
              'case': str(case), 'audit_directory': str(work), 'cpp_records': [],
              'scope': 'Identity against an immutable completed proof; not a second verification run.'}
    try:
        if args.preflight:
            h = engine.read(here / 'frozen-full-handoff.json')
            report['identity'] = engine.identity(case, work, h)
            runner = module('case_preflight_translation_units', here / 'check_full.py')
            expected = {u['stem']: u for u in h['units']}
            engine.require(set(expected) == set(runner.EXPECTED_BODIES), 'Live C constructor inventory differs')
            seen = set()
            for u in runner.iter_current_unit_texts():
                stem = u['stem']
                engine.require(stem in expected and stem not in seen, 'Duplicate/unexpected live unit')
                folder = work / stem
                folder.mkdir()
                source, expanded = folder / (stem + '.c'), folder / 'expanded.c'
                source.write_text(u['text'])
                record = engine.execute(['gcc', '-E', '-P', '-CC', '-nostdinc', *map(str, u.get('cpp_flags', [])), str(source), '-I', str(case), '-o', str(expanded)], folder, folder / 'cpp.log')
                engine.require(engine.sha(expanded) == expected[stem]['cpp_sha256'], 'Current CPP differs from H: ' + stem)
                record.update(stem=stem, cpp_sha256=engine.sha(expanded))
                report['cpp_records'].append(record)
                seen.add(stem)
            engine.require(seen == set(expected), 'Incomplete live CPP inventory')
            report.update(preflight_passed=True, current_cpp_units=len(seen), audit_passed=False,
                          scope='Current input/CPP preflight only; complete proof is not asserted.')
            (work / 'status.json').write_text(json.dumps(report, indent=2) + '\n')
            print(json.dumps(report, indent=2))
            return 0
        full_path = here / 'full-status.json'
        archive = here / 'evidence/full-run'
        engine.require(full_path.read_bytes() == (archive / 'status.json').read_bytes(), 'Byte-preserved complete full certificate required')
        handoff = here / 'frozen-full-handoff.json'
        engine.require(handoff.read_bytes() == (archive / 'frozen-full-handoff.json').read_bytes(), 'Archived handoff differs')
        full, h = engine.read(full_path), engine.read(handoff)
        proof_run = args.proof_run.resolve() if args.proof_run else engine.locate(case, full['run_directory'])
        report.update(proof_run=str(proof_run), historical_case=str(Path(full['run_directory']).parent.parent),
                      full_status_sha256=engine.sha(full_path), handoff_sha256=engine.sha(handoff))
        report['identity'] = engine.identity(case, work, h)
        audit, artifacts = engine.validate(case, proof_run, h, full)
        report['assumptions'] = audit
        for src, relative in artifacts:
            engine.require(src.read_bytes() == (archive / relative).read_bytes(), 'Archived CPP/goal changed: ' + str(relative))
        for name, digest in full['compiled_source_sha256'].items():
            namespace, stem = name.rsplit('.', 1)
            path = Path('coq') / (namespace.replace('.', '/') if namespace else 'relations') / (stem + '.v')
            engine.require(engine.sha(archive / path) == digest, 'Archived compiled source changed: ' + name)
        root = next(p for p in case.parents if (p / '.git').exists())
        for relative, digest in full['input_sha256'].items():
            if relative.endswith('-status.json'):
                safe = Path(relative) if '..' not in Path(relative).parts else Path('__repo__') / (case / relative).resolve().relative_to(root)
                engine.require(engine.sha(archive / 'component-status' / safe) == digest, 'Archived component certificate changed: ' + relative)
        for record in full['records']:
            engine.require(engine.sha(archive / 'logs' / (record['label'] + '.log')) == record['log_sha256'], 'Archived original log changed')
        for name, digest in [('FinalCaseCheck.v', full['final_gate_sha256']), ('FinalCaseCheck.log', full['final_assumptions_log_sha256'])]:
            engine.require(engine.sha(archive / name) == digest, 'Archived final gate source/log changed')
        runner = module('case_current_translation_units', here / 'check_full.py')
        expected = {u['stem']: u for u in full['actual_c_units']}
        engine.require(set(expected) == set(runner.EXPECTED_BODIES), 'Live C constructor unit inventory differs')
        texts = {}
        for u in runner.iter_current_unit_texts():
            stem = u['stem']
            engine.require(stem in expected and stem not in texts, 'Duplicate/unexpected live unit')
            folder = work / stem
            folder.mkdir()
            source, expanded = folder / (stem + '.c'), folder / 'expanded.c'
            source.write_text(u['text'])
            command = ['gcc', '-E', '-P', '-CC', '-nostdinc', *map(str, u.get('cpp_flags', [])), str(source), '-I', str(case), '-o', str(expanded)]
            record = engine.execute(command, folder, folder / 'cpp.log')
            engine.require(engine.sha(expanded) == expected[stem]['cpp_sha256'], 'Live CPP differs: ' + stem)
            historical = proof_run / 'units' / stem / 'expanded.c'
            engine.require(historical.read_bytes() == expanded.read_bytes(), 'Live CPP bytes differ from original proof: ' + stem)
            record.update(stem=stem, cpp_sha256=engine.sha(expanded), cpp_bytes_identical=True)
            report['cpp_records'].append(record)
            texts[stem] = expanded.read_text()
        engine.require(set(texts) == set(expected), 'Incomplete fresh CPP coverage')
        definitions = engine.check_c_closure(case, full['actual_c_units'], texts)
        engine.require(definitions == full['call_closure']['definitions'], 'Current C body providers differ')
        report.update(audit_passed=True, current_cpp_units=len(texts),
                      compiled_source_count_including_final=len(full['compiled_source_sha256']) + 1,
                      all_archived_logs_and_sources_identical=True, cpp_bytes_identical=True,
                      current_c_body_count=len(definitions), published_certificates_modified=False)
    except Exception as error:
        report['error'] = str(error)
    (work / 'status.json').write_text(json.dumps(report, indent=2) + '\n')
    print(json.dumps(report, indent=2))
    return 0 if report['audit_passed'] else 1


if __name__ == '__main__':
    raise SystemExit(main())
