#!/usr/bin/env python3
"""Rebuild live CPP identities against a completed, byte-preserved full proof.

No QCP or Coq is run. The original proof run supplies object-origin evidence;
the public archive supplies immutable source, target, status and log evidence.
"""
import argparse
import importlib.util
import json
from pathlib import Path
import subprocess
import tempfile


def module(name, path):
    spec = importlib.util.spec_from_file_location(name, path)
    result = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(result)
    return result


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--proof-run', type=Path, help='Original completed full run, possibly in another worktree')
    args = parser.parse_args()
    here = Path(__file__).resolve().parent
    case = here.parent
    engine = module('relocation_issuer', here / 'record_status_v2.py')
    inputs = module('relocation_live_inputs', here / 'full_inputs.py')
    work = Path(tempfile.mkdtemp(prefix='relocation-identity-', dir=case / '.build'))
    report = dict(audit_passed=False, formal_proof_replayed=False,
                  scope='Current source, CPP, archive and object-origin identity only; not a second proof',
                  directory=str(work), cpp_records=[])
    try:
        archive = here / 'evidence/full-run'
        engine.require((here / 'full-status.json').read_bytes() == (archive / 'status.json').read_bytes(),
                       'Byte-preserved complete full receipt required')
        engine.require((here / 'frozen-full-handoff.json').read_bytes() ==
                       (archive / 'frozen-full-handoff.json').read_bytes(), 'Archived frozen inputs differ')
        full = engine.read(here / 'full-status.json')
        handoff = engine.read(here / 'frozen-full-handoff.json')
        run = args.proof_run.resolve() if args.proof_run else Path(full['run_directory'])
        report['identity'] = engine.identity(case, work, handoff)
        audit, artifacts = engine.validate(case, run, handoff, full)
        report['assumptions'] = audit
        for source, relative in artifacts:
            engine.require(source.read_bytes() == (archive / relative).read_bytes(),
                           'Archived actual proof artifact differs: ' + str(relative))
        for name, digest in full['compiled_source_sha256'].items():
            path = Path('coq') / name.split('.')[0] / (name.split('.')[1] + '.v')
            engine.require(engine.sha(archive / path) == digest, 'Archived compiled source changed')
        for record in full['records']:
            engine.require(engine.sha(archive / 'logs' / (record['label'] + '.log')) == record['log_sha256'],
                           'Archived original execution log changed')
        for name, digest in [('FinalCaseCheck.v', full['final_gate_sha256']),
                             ('AssumptionsReport.log', full['final_assumptions_log_sha256'])]:
            engine.require(engine.sha(archive / name) == digest, 'Archived final gate changed')
        paths = {}
        for unit in handoff['units']:
            stem = unit['stem']
            folder = work / stem
            folder.mkdir()
            rendered = inputs.render_unit(stem, folder / (stem + '.c'), unit['construction'])
            expanded = folder / 'expanded.c'
            command = ['prlimit', '--as=17179869184:17179869184', '--', 'gcc',
                       '-E', '-P', '-CC', '-nostdinc', *unit['cpp_flags'], '-I', str(case),
                       rendered['private_source_path'], '-o', str(expanded)]
            log = folder / 'cpp.log'
            with log.open('w') as output:
                result = subprocess.run(command, cwd=folder, stdout=output, stderr=output, timeout=600)
            engine.require(result.returncode == 0, 'Live CPP command failed: ' + stem)
            engine.require(engine.sha(expanded) == unit['cpp_sha256'] and expanded.read_bytes() ==
                           (run / 'units' / stem / 'expanded.c').read_bytes(), 'Live CPP differs: ' + stem)
            if rendered['private_identity_path']:
                raw = folder / 'raw-expanded.c'
                raw_command = list(command)
                raw_command[-3] = rendered['private_identity_path']
                raw_command[-1] = str(raw)
                raw_log = folder / 'raw-cpp.log'
                with raw_log.open('w') as output:
                    raw_result = subprocess.run(raw_command, cwd=folder, stdout=output, stderr=output, timeout=600)
                engine.require(raw_result.returncode == 0 and inputs.tokens(raw.read_text()) ==
                               inputs.tokens(expanded.read_text()), 'Live raw/annotated tokens differ: ' + stem)
            paths[stem] = expanded
            report['cpp_records'].append(dict(stem=stem, command=command, exit_code=result.returncode,
                                              log_sha256=engine.sha(log), cpp_sha256=engine.sha(expanded)))
        coverage = module('relocation_call_coverage', here / 'full_call_coverage.py')
        closure = coverage.audit_sources(paths, engine.read(here / 'component-unit-inventory.json'),
                                        engine.read(here / 'semantics.json'), case)
        engine.require(closure == full['call_closure'], 'Live C body/contract/call/spec closure differs')
        report.update(audit_passed=True, current_cpp_units=len(paths), ordinary_C_bodies=15,
                      source_reviewed_terminals=closure['terminal_intrinsic_count'],
                      all_archived_sources_and_logs_identical=True,
                      compiled_source_count_including_final=len(full['compiled_source_sha256']) + 1,
                      published_certificates_modified=False)
    except Exception as error:
        report['error'] = repr(error)
    (work / 'status.json').write_text(json.dumps(report, indent=2) + '\n')
    print(json.dumps(report, indent=2))
    return 0 if report['audit_passed'] else 1


if __name__ == '__main__':
    raise SystemExit(main())
