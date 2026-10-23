#!/usr/bin/env python3
"""Test fixed-release pin regeneration against authenticated root build inputs."""
from pathlib import Path
import argparse
import copy
import io
import json
import subprocess
import sys
import tarfile


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    for option in ['archive', 'commit-api', 'root-tree-api', 'out']:
        parser.add_argument('--' + option, required=True, type=Path)
    args = parser.parse_args()
    args.out.mkdir(parents=True, exist_ok=False)
    tool = Path(__file__).resolve().parents[2] / 'tools/pin_qcp_source.py'
    members = []
    with tarfile.open(args.archive) as source:
        headers = dict(source.pax_headers)
        for member in source:
            relative = member.name.split('/', 1)[1] if '/' in member.name else ''
            if member.isfile() and (relative.startswith('Rocq/') or relative in ['_CoqProject', 'dune-project']):
                members.append((member, relative, source.extractfile(member).read()))
    records = []
    cases = [('authentic-source', None, True, None),
             ('root-content-mutation', 'content', False, 'differs from authenticated Git tree'),
             ('missing-root-input', 'missing', False, 'missing required archive root'),
             ('duplicate-root-input', 'duplicate', False, 'duplicate root build input'),
             ('root-mode-mutation', 'mode', False, 'differs from authenticated Git tree')]
    for label, mutation, expected, needle in cases:
        archive = args.out / (label + '.tar')
        with tarfile.open(archive, 'w', format=tarfile.PAX_FORMAT, pax_headers=headers) as target:
            for original, relative, data in members:
                if mutation == 'missing' and relative == 'dune-project':
                    continue
                member = copy.copy(original)
                if relative == '_CoqProject':
                    if mutation == 'content':
                        data += b'\n# unreviewed root build input\n'
                    if mutation == 'mode':
                        member.mode ^= 0o111
                member.size = len(data)
                target.addfile(member, io.BytesIO(data))
                if mutation == 'duplicate' and relative == '_CoqProject':
                    target.addfile(member, io.BytesIO(data))
        output = args.out / (label + '.json')
        command = [sys.executable, str(tool), '--archive', str(archive),
                   '--commit-api', str(args.commit_api), '--root-tree-api', str(args.root_tree_api),
                   '--out', str(output)]
        result = subprocess.run(command, capture_output=True, text=True, timeout=60)
        log = result.stdout + result.stderr
        (args.out / (label + '.log')).write_text(log)
        ok = (result.returncode == 0) == expected and (needle is None or needle in log)
        records.append({'name': label, 'command': command, 'exit_code': result.returncode,
                        'expected_success': expected, 'passed': ok})
        (args.out / 'result.json').write_text(json.dumps({'passed': all(r['passed'] for r in records)
             and len(records) == len(cases), 'scope': 'source-pin provenance controls only', 'records': records}, indent=2) + '\n')
        print(label, result.returncode, ok, flush=True)
        if not ok:
            raise RuntimeError(log[-2000:])
        archive.unlink()


if __name__ == '__main__':
    main()
