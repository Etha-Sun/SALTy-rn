#!/usr/bin/env python3
"""Run only the reviewed VADD87 checker with explicit subprocess wall budgets."""
import argparse
import hashlib
import json
from pathlib import Path
import runpy
import shutil
import subprocess
import sys
import threading
import time

sys.dont_write_bytecode = True
from environment import load_environment

ROOT = Path(__file__).resolve().parents[3]
CHECKER_SHA256 = '5a836c02f128825234ec1c459707aa982d5904d6bb7258489873c5c764113ef4'


def adjusted_timeout(command, old, wall_seconds, strategy):
    """Match this exact checker's five subprocess command shapes; keep args intact."""
    prefix = list(map(str, command[:2]))
    if prefix[:1] == ['qcp']:
        if prefix != ['qcp', '--arch=64'] or old != 240:
            raise RuntimeError('Unknown QCP command/timeout shape')
        return wall_seconds
    if prefix == ['qcp-env', 'coqc']:
        if old != 180:
            raise RuntimeError('Unknown Coq command/timeout shape')
        return wall_seconds
    if prefix == ['qcp-env', 'coqdep']:
        if old != 180:
            raise RuntimeError('Unknown coqdep timeout shape')
        return old
    if prefix == ['gcc', '-E']:
        if old != 180:
            raise RuntimeError('Unknown CPP timeout shape')
        return old
    if prefix[:1] == [str(strategy)]:
        if prefix[1:] != ['--arch=64'] or old != 180:
            raise RuntimeError('Unknown strategy command/timeout shape')
        return old
    raise RuntimeError('Unknown subprocess command in fixed VADD checker: '+repr(prefix))


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--case', choices=['f32-vadd'], default='f32-vadd')
    parser.add_argument('--config', type=Path, required=True)
    parser.add_argument('--jobs', type=int, default=1)
    parser.add_argument('--wall-seconds', type=int, default=900)
    parser.add_argument('--evidence-dir', type=Path, required=True, help='New wrapper evidence directory')
    args = parser.parse_args()
    if not 1 <= args.jobs <= 16 or args.wall_seconds < 240:
        parser.error('Use1..16 jobs and a wall budget of at least240 seconds')
    case = ROOT/'verification/qcp/verified'/args.case
    checker = case/'proof/check.py'
    sha = lambda p: hashlib.sha256(Path(p).read_bytes()).hexdigest()
    if sha(checker) != CHECKER_SHA256:
        raise RuntimeError('Unknown checker source; review the wrapper before adapting it')
    manifest = json.loads((case/'proof/manifest.json').read_text())
    if len(manifest['modules']) != 87 or len(manifest['units']) != 11:
        raise RuntimeError('Unknown f32-vadd package shape')
    environment = load_environment()
    config = json.loads(args.config.read_text())
    if config != {'cwd': str(ROOT), 'flags': ['qcp-env', 'coqc', *environment['flags']]}:
        raise RuntimeError('Config must be this root plus selected external-only library flags')
    if Path(shutil.which('qcp') or '').resolve() != Path(environment['qcp']).resolve():
        raise RuntimeError('PATH qcp does not select the verified symexec')
    strategy = Path(environment['strategy']).resolve()
    qcp_env = shutil.which('qcp-env')
    if not qcp_env:
        raise RuntimeError('Set PATH to the generated package tool directory')
    out = args.evidence_dir.resolve()
    out.mkdir(parents=True, exist_ok=False)
    original = subprocess.run
    lock = threading.Lock()
    trace = out/'timeout-adjustments.jsonl'

    def run(command, *positional, **kwargs):
        old = kwargs.get('timeout')
        new = adjusted_timeout(command, old, args.wall_seconds, strategy)
        if new != old:
            kwargs['timeout'] = new
            with lock, trace.open('a') as log:
                log.write(json.dumps({'command': list(map(str, command)), 'old_wall_seconds': old,
                                      'new_wall_seconds': new})+'\n')
        return original(command, *positional, **kwargs)

    before = {'checker_sha256': sha(checker), 'manifest_sha256': sha(case/'proof/manifest.json'),
              'config_sha256': sha(args.config), 'qcp_env_sha256': sha(qcp_env),
              'tools': environment['tool_sha256'], 'jobs': args.jobs,
              'wall_seconds': args.wall_seconds, 'case': args.case}
    (out/'inputs.json').write_text(json.dumps(before, indent=2)+'\n')
    started = time.monotonic()
    error = None
    try:
        subprocess.run = run
        sys.path.insert(0, str(checker.parent))
        sys.argv = [str(checker), '--jobs', str(args.jobs), '--config', str(args.config.resolve())]
        runpy.run_path(str(checker), run_name='__main__')
    except BaseException as exc:
        error = type(exc).__name__+': '+str(exc)
        raise
    finally:
        subprocess.run = original
        unchanged = sha(checker) == before['checker_sha256'] and sha(case/'proof/manifest.json') == before['manifest_sha256']
        result = {'checker_returned_normally': error is None, 'error': error,
                  'seconds': time.monotonic()-started,
                  'checker_and_manifest_unchanged': unchanged,
                  'scope': 'The unchanged package checker supplies its own full status and per-command logs.',
                  'limits': 'External prebuilt libraries reused; no ISA or termination theorem.'}
        (out/'wrapper-result.json').write_text(json.dumps(result, indent=2)+'\n')
        if error is None and not unchanged:
            raise RuntimeError('Checker/manifest changed during the check')


if __name__ == '__main__':
    main()
