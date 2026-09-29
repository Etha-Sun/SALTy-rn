#!/usr/bin/env python3
"""Independently recheck compiled Coq modules and record their exact roots."""
import argparse
import json
import check
import translate as t

if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('modules', nargs='+')
    parser.add_argument('--name', default='rvv-composition')
    parser.add_argument('--timeout', type=int, default=3600)
    args = parser.parse_args()
    roots = {
        name: {'source_sha256': t.probe.sha(t.HERE / (name + '.v')),
               'object_sha256': t.probe.sha(t.HERE / (name + '.vo'))}
        for name in args.modules
    }
    result = t.probe.run('coqchk-' + args.name,
                        [t.ENV, 'coqchk', '-silent', *check.coq_args(), *args.modules],
                        timeout=args.timeout)
    result['checked_roots'] = roots
    result['roots_unchanged_during_check'] = all(
        t.probe.sha(t.HERE / (name + '.v')) == hashes['source_sha256'] and
        t.probe.sha(t.HERE / (name + '.vo')) == hashes['object_sha256']
        for name, hashes in roots.items())
    (t.HERE / 'results' / ('coqchk-' + args.name + '.json')).write_text(
        json.dumps(result, indent=2) + '\n')
    raise SystemExit(0 if result['exit_code'] == 0 and result['roots_unchanged_during_check'] else 1)
