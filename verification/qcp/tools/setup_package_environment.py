#!/usr/bin/env python3
"""Write tool/config files for the reviewed f32-vadd package; never run its checker."""
import argparse
import hashlib
import json
import os
from pathlib import Path

from environment import import_probe, load_environment

ROOT = Path(__file__).resolve().parents[3]


def sha(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--case', choices=['f32-vadd'], default='f32-vadd')
    parser.add_argument('--out', type=Path, required=True, help='New runtime-only output directory')
    parser.add_argument('--layout', choices=['in-place', 'dune'])
    parser.add_argument('--check', action='store_true', help='Check selected external imports, not the kernel')
    args = parser.parse_args()
    case = ROOT/'verification/qcp/verified'/args.case
    manifest = json.loads((case/'proof/manifest.json').read_text())
    if len(manifest['modules']) != 87 or len(manifest['units']) != 11:
        raise RuntimeError('Unknown f32-vadd package shape; review this entry before adapting it')
    environment = load_environment(args.layout)
    if args.check:
        environment['import_probe'] = import_probe(environment)
        if environment['import_probe']['exit_code']:
            raise RuntimeError('Selected external-library imports failed')
    qcp = Path(environment['qcp']).resolve(strict=True)
    strategy = Path(environment['strategy']).resolve(strict=True)
    coqc = Path(environment['coqc']).resolve(strict=True)
    coqdep = coqc.with_name('coqdep').resolve(strict=True)
    if strategy != qcp.parent/'StrategyCheck' or not os.access(coqdep, os.X_OK):
        raise RuntimeError('Unknown tool layout; expected adjacent StrategyCheck and coqdep')
    out = args.out.expanduser().resolve()
    out.mkdir(parents=True, exist_ok=False)
    tools = out/'bin'
    tools.mkdir()
    (tools/'qcp').symlink_to(qcp)
    wrapper = '''#!/usr/bin/env python3
import os, sys
TOOLS = %r
if len(sys.argv) < 2 or sys.argv[1] not in TOOLS:
    raise SystemExit('qcp-env accepts only coqc or coqdep')
os.execv(TOOLS[sys.argv[1]], [TOOLS[sys.argv[1]], *sys.argv[2:]])
''' % {'coqc': str(coqc), 'coqdep': str(coqdep)}
    (tools/'qcp-env').write_text(wrapper)
    (tools/'qcp-env').chmod(0o755)
    config = {'cwd': str(ROOT), 'flags': ['qcp-env', 'coqc', *environment['flags']]}
    (out/'coq-flags.json').write_text(json.dumps(config, indent=2)+'\n')
    report = {'prepared': True, 'proof_checker_started': False, 'case': args.case,
              'package_modules': 87, 'package_C_units': 11,
              'config': str(out/'coq-flags.json'), 'tool_directory': str(tools),
              'layout': environment['layout'], 'tool_sha256': environment['tool_sha256'],
              'source_identity': environment['source_identity'],
              'compiled_library_provenance': environment['compiled_library_provenance'],
              'import_probe': environment.get('import_probe'),
              'checker_sha256': sha(case/'proof/check.py'),
              'manifest_sha256': sha(case/'proof/manifest.json'),
              'limits': ['External libraries are existing artifacts; source-to-vo build history is not established.',
                         'Import checking is not kernel proof, recursive coqchk, or ISA correspondence.',
                         'Set per-process and aggregate resource budgets outside these forwarding tools.']}
    (out/'environment.json').write_text(json.dumps(report, indent=2)+'\n')
    print(json.dumps({'prepared': True, 'case': args.case, 'config': str(out/'coq-flags.json'),
                      'tool_directory': str(tools), 'checker_started': False}, indent=2))


if __name__ == '__main__':
    main()
