#!/usr/bin/env python3
"""Explicit QCP 2.1.4 / Coq 8.20.1 environment, without machine-specific paths."""
import argparse
import hashlib
import json
import os
from pathlib import Path
import re
import shlex
import shutil
import subprocess
import sys
import tempfile

QCP_COMMIT = '08cc7a0f1373a1db3800111a0205a340b6d6f99c'
BINARIES = {
    'symexec': '0e74c446cebca8c804ff9b838f07c67f23e31a093630675bc720b25c986e1032',
    'StrategyCheck': '1020125321f58191a8e0769d04bd9de46bb36237f6f9807cde62157a344c965d',
}

def sha(path):
    return hashlib.sha256(Path(path).read_bytes()).hexdigest()

def load_environment():
    """Use only QCP_HOME and optional QCP_COQC; reject mismatches explicitly."""
    value = os.environ.get('QCP_HOME')
    if not value:
        raise RuntimeError('environment: set QCP_HOME to the pinned QCP 2.1.4 checkout')
    home = Path(value).expanduser().resolve(strict=True)
    if sys.platform != 'linux':
        raise RuntimeError('environment: only the reviewed Linux binaries are configured')
    commit = None
    if (home / '.git').exists():
        commit = subprocess.check_output(
            ['git', '-C', str(home), 'rev-parse', 'HEAD'], text=True).strip()
        if commit != QCP_COMMIT:
            raise RuntimeError('environment: QCP source commit differs from the reviewed version')
        subprocess.run(['git', '-C', str(home), 'diff', '--quiet', '--', 'Rocq'], check=True)
    expected_project = 'ddd36da4a875085a220316daea571c86bb85244efff18306957ede0daee04925'
    if sha(home / 'Rocq/_CoqProject') != expected_project:
        raise RuntimeError('environment: QCP library mapping differs from the reviewed 2.1.4 release')
    tools = {}
    for name, expected in BINARIES.items():
        binary = home / 'linux-binary' / name
        if not binary.is_file() or sha(binary) != expected or not os.access(binary, os.X_OK):
            raise RuntimeError('environment: missing, nonexecutable or changed QCP binary: ' + name)
        tools[name] = str(binary)
    coqc = shutil.which(os.environ.get('QCP_COQC', 'coqc'))
    if not coqc:
        raise RuntimeError('environment: set QCP_COQC to Coq 8.20.1 coqc')
    version = subprocess.check_output([coqc, '--version'], text=True, timeout=15)
    if not re.search(r'\bversion 8\.20\.1\b', version):
        raise RuntimeError('environment: expected Coq 8.20.1')
    dependencies = {}
    for name in ('python3', 'gcc', 'patch', 'git'):
        dependencies[name] = shutil.which(name)
        if not dependencies[name]:
            raise RuntimeError('environment: missing runner dependency: ' + name)
    rocq = home / 'Rocq'
    flags = []
    for line in (rocq / '_CoqProject').read_text().splitlines():
        words = shlex.split(line, comments=True)
        if not words:
            continue
        if len(words) != 3 or words[0] not in ('-Q', '-R'):
            raise RuntimeError('environment: unrecognized _CoqProject line: ' + line)
        if '_build' in Path(words[1]).parts:
            continue
        physical = (rocq / words[1]).resolve()
        if not physical.is_dir():
            raise RuntimeError('environment: missing QCP library source: ' + str(physical))
        flags += [words[0], str(physical), words[2]]
    library = rocq / 'SeparationLogic/SeparationLogic.vo'
    if not library.is_file():
        raise RuntimeError('environment: QCP libraries are not compiled; build the pinned dependency closure')
    return {'qcp': tools['symexec'], 'strategy': tools['StrategyCheck'],
            'coqc': str(Path(coqc).resolve()), 'flags': flags, 'cwd': str(rocq),
            'qcp_commit': commit, 'qcp_commit_reference': QCP_COMMIT,
            'source_kind': 'git-checkout' if commit else 'release-archive-without-git-metadata',
            'coq_version': version.strip(),
            'tool_sha256': {name: sha(path) for name, path in
                [('qcp', tools['symexec']), ('strategy', tools['StrategyCheck']), ('coqc', coqc)]},
            'library_entry_sha256': sha(library),
            'coqproject_sha256': sha(rocq / '_CoqProject'), 'dependencies': dependencies}

def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--check', action='store_true',
                        help='Also compile an import probe against the configured libraries')
    args = parser.parse_args()
    try:
        environment = load_environment()
        if args.check:
            with tempfile.TemporaryDirectory(prefix='qcp-environment-') as directory:
                probe = Path(directory) / 'EnvironmentProbe.v'
                probe.write_text('From SimpleC.SL Require Import Mem SeparationLogic.\n'
                                 'Import Snaive_C_Rules64.\nCheck fp32_add.\nCheck fp32_eq.\n')
                result = subprocess.run([environment['coqc'], *environment['flags'], str(probe)],
                    cwd=environment['cwd'], capture_output=True, text=True, timeout=90)
                environment['import_probe'] = {'exit_code': result.returncode,
                                              'output': result.stdout + result.stderr}
                if result.returncode:
                    raise RuntimeError('environment: compiled library import probe failed: ' + result.stderr[-2000:])
        print(json.dumps({'passed': True, 'scope': 'tool environment, not a kernel proof',
                          **environment}, indent=2))
        return 0
    except (OSError, RuntimeError, ValueError, subprocess.SubprocessError) as exc:
        print(json.dumps({'passed': False, 'kind': 'environment_failure',
                          'error': str(exc)}, indent=2))
        return 1

if __name__ == '__main__':
    raise SystemExit(main())
