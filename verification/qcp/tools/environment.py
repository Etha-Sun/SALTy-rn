#!/usr/bin/env python3
"""Pinned QCP source identity and one selected Coq library layout."""
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
SOURCE_MANIFEST = Path(__file__).with_name('qcp-2.1.4-source.json')


def sha(path):
    return hashlib.sha256(Path(path).read_bytes()).hexdigest()


def source_file(path, scope):
    return path.suffix in scope['suffixes'] or path.name in scope['names']


def check_git_sources(home, expected_commit=QCP_COMMIT):
    """Check HEAD vs both index and worktree. expected_commit is injectable only for isolated tests."""
    commit = subprocess.check_output(['git', '-C', str(home), 'rev-parse', 'HEAD'], text=True).strip()
    if commit != expected_commit:
        raise RuntimeError('environment: QCP source commit differs from the reviewed version')
    # Check both views independently; a staged edit plus worktree restoration can
    # cancel out in a single `git diff HEAD` comparison.
    for index in (False, True):
        command = ['git', '-C', str(home), 'diff', '--quiet']
        if index:
            command.append('--cached')
        command += [expected_commit, '--', 'Rocq', '_CoqProject', 'dune-project']
        if subprocess.run(command).returncode:
            raise RuntimeError('environment: tracked Rocq/build files differ from pinned HEAD (index or worktree)')
    # Include ignored files too: an ignored .v is still importable under an -R mapping.
    untracked = subprocess.check_output(['git', '-C', str(home), 'ls-files', '--others', '-z', '--', 'Rocq'])
    suffixes = {'.v', '.ml', '.mli', '.mll', '.mly', '.mlpack', '.mllib', '.c', '.h'}
    extras = [os.fsdecode(name) for name in untracked.split(b'\0') if name and Path(os.fsdecode(name)).suffix in suffixes]
    if extras:
        raise RuntimeError('environment: untracked importable Rocq source: ' + extras[0])
    return commit


def check_source_tree(home):
    manifest = json.loads(SOURCE_MANIFEST.read_text())
    if manifest['commit'] != QCP_COMMIT:
        raise RuntimeError('environment: source manifest commit mismatch')
    for relative, expected in manifest['root_inputs'].items():
        if sha(home / relative) != expected:
            raise RuntimeError('environment: pinned root build input changed: ' + relative)
    root = home / 'Rocq'
    groups = {}
    for path in sorted(root.rglob('*')):
        if path.is_symlink():
            raise RuntimeError('environment: unexpected symlink in reviewed source tree: ' + str(path))
        if not path.is_file() or not source_file(path, manifest['source_scope']):
            continue
        relative = path.relative_to(root).as_posix()
        group = relative.split('/', 1)[0] if '/' in relative else '.'
        groups.setdefault(group, []).append((relative, sha(path)))
    actual = {}
    for group, entries in groups.items():
        payload = ''.join(name + '\0' + digest + '\n' for name, digest in sorted(entries)).encode()
        actual[group] = {'files': len(entries), 'sha256': hashlib.sha256(payload).hexdigest()}
    if actual != manifest['groups']:
        keys = sorted(set(actual) | set(manifest['groups']))
        changed = [key for key in keys if actual.get(key) != manifest['groups'].get(key)]
        raise RuntimeError('environment: pinned Coq source/build inputs changed: ' + ', '.join(changed))
    return {'manifest_sha256': sha(SOURCE_MANIFEST), 'verified_commit': QCP_COMMIT,
            'files_checked': sum(x['files'] for x in actual.values()),
            'archive_rocq_git_tree': manifest['verified_archive_rocq_git_tree'],
            'scope': manifest['source_scope'], 'compiled_correspondence_established': False}


def select_paths(home, layout):
    """Collapse reviewed duplicate mappings, then derive exactly one layout for every namespace."""
    if layout not in ('in-place', 'dune'):
        raise RuntimeError('environment: QCP_LAYOUT must be in-place or dune')
    root = home / 'Rocq'
    mappings = {}
    dune_mappings = {}
    for line in (root / '_CoqProject').read_text().splitlines():
        words = shlex.split(line, comments=True)
        if not words:
            continue
        if len(words) != 3 or words[0] not in ('-R', '-Q'):
            raise RuntimeError('environment: unrecognized _CoqProject line: ' + line)
        kind, relative, namespace = words
        parts = Path(relative).parts
        if '_build' in parts:
            expected = Path('../_build/default/Rocq')
            try:
                dune_mappings[namespace] = (kind, Path(relative).relative_to(expected).as_posix())
            except ValueError:
                raise RuntimeError('environment: unknown dune mapping: ' + line)
        else:
            if Path(relative).is_absolute() or '..' in parts or namespace in mappings:
                raise RuntimeError('environment: unsafe or duplicate source mapping: ' + line)
            mappings[namespace] = (kind, relative)
    for namespace, mapping in dune_mappings.items():
        if mappings.get(namespace) != mapping:
            raise RuntimeError('environment: source/dune namespace mappings disagree: ' + namespace)
    selected = root if layout == 'in-place' else home / '_build/default/Rocq'
    if not selected.is_dir():
        raise RuntimeError('environment: selected ' + layout + ' library layout is missing')
    selected = selected.resolve()
    flags = ['-q']
    for namespace, (kind, relative) in mappings.items():
        physical = selected / relative
        if not physical.is_dir() or not physical.resolve().is_relative_to(selected):
            raise RuntimeError('environment: missing or escaping selected-layout dependency: ' + str(physical))
        flags += [kind, str(physical), namespace]
    library = selected / 'SeparationLogic/SeparationLogic.vo'
    if not library.is_file():
        raise RuntimeError('environment: selected ' + layout + ' library entry is not compiled')
    return selected, flags, library


def compiled_inventory(home, selected):
    entries = []
    sources = home / 'Rocq'
    # Coq -R follows directory symlinks, whereas pathlib.rglob does not.
    # Reject hidden subtrees instead of omitting their sources/artifacts.
    for path in selected.rglob('*'):
        if path.is_symlink() and (path.is_dir() or not path.exists()):
            raise RuntimeError('environment: selected-layout directory symlink: ' + str(path))
    for view in selected.rglob('*.v'):
        source = sources / view.relative_to(selected)
        if not source.is_file() or sha(view) != sha(source):
            raise RuntimeError('environment: unexpected or stale selected-layout source view: ' + str(view))
    for suffix in ('.vo', '.vos', '.vok'):
        for path in sorted(selected.rglob('*' + suffix)):
            relative = path.relative_to(selected)
            if path.is_symlink() and not path.resolve().is_relative_to(selected):
                raise RuntimeError('environment: compiled artifact escapes selected layout: ' + str(path))
            source = sources / relative.with_suffix('.v')
            if not source.is_file():
                raise RuntimeError('environment: compiled module has no pinned source: ' + str(relative))
            # Dune often exposes source symlinks. If present, detect stale source views too.
            view = path.with_suffix('.v')
            if view.is_file() and sha(view) != sha(source):
                raise RuntimeError('environment: stale selected-layout source view: ' + str(view))
            entries.append((relative.as_posix(), sha(path)))
    payload = ''.join(name + '\0' + digest + '\n' for name, digest in sorted(entries)).encode()
    return {'artifact_count': len(entries), 'artifact_set_sha256': hashlib.sha256(payload).hexdigest(),
            'build_history': 'not supplied or independently reconstructed',
            'source_to_compiled_correspondence': 'not established by source hashes or import probe',
            'validation': 'artifact identity recorded; import probe only when --check is requested',
            'recursive_coqchk_performed': False}


def load_environment(layout=None):
    value = os.environ.get('QCP_HOME')
    if not value:
        raise RuntimeError('environment: set QCP_HOME to the pinned QCP 2.1.4 checkout')
    home = Path(value).expanduser().resolve(strict=True)
    if sys.platform != 'linux':
        raise RuntimeError('environment: only the reviewed Linux binaries are configured')
    commit = check_git_sources(home) if (home / '.git').exists() else None
    source_identity = check_source_tree(home)
    selected_layout = layout or os.environ.get('QCP_LAYOUT', 'in-place')
    selected, flags, library = select_paths(home, selected_layout)
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
    artifacts = compiled_inventory(home, selected)
    return {'qcp': tools['symexec'], 'strategy': tools['StrategyCheck'],
            'coqc': str(Path(coqc).resolve()), 'flags': flags, 'cwd': str(selected),
            'layout': selected_layout, 'library_root': str(selected),
            'qcp_commit': commit, 'qcp_commit_reference': QCP_COMMIT,
            'source_kind': 'git-checkout' if commit else 'archive-with-pinned-source-manifest',
            'source_identity': source_identity, 'compiled_library_provenance': artifacts,
            'coq_version': version.strip(),
            'tool_sha256': {name: sha(path) for name, path in
                [('qcp', tools['symexec']), ('strategy', tools['StrategyCheck']), ('coqc', coqc)]},
            'library_entry_sha256': sha(library),
            'coqproject_sha256': sha(home / 'Rocq/_CoqProject'), 'dependencies': dependencies}


def import_probe(environment):
    with tempfile.TemporaryDirectory(prefix='qcp-environment-') as directory:
        probe = Path(directory) / 'EnvironmentProbe.v'
        probe.write_text('From SimpleC.SL Require Import Mem SeparationLogic.\n'
                         'Import Snaive_C_Rules64.\nCheck fp32_add.\nCheck fp32_eq.\n')
        command = [environment['coqc'], *environment['flags'], str(probe)]
        probe_sha256 = sha(probe)
        result = subprocess.run(command, cwd=environment['cwd'], capture_output=True, text=True, timeout=90)
    return {'exit_code': result.returncode, 'output': result.stdout + result.stderr,
            'command': command, 'probe_source_sha256': probe_sha256,
            'scope': 'selected compiled dependencies import; not source-to-vo correspondence or recursive coqchk'}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--check', action='store_true', help='Compile the selected-layout import probe')
    parser.add_argument('--layout', choices=('in-place', 'dune'))
    args = parser.parse_args()
    try:
        environment = load_environment(args.layout)
        if args.check:
            environment['import_probe'] = import_probe(environment)
            if environment['import_probe']['exit_code']:
                raise RuntimeError('environment: selected-layout library import failed: ' + environment['import_probe']['output'][-2000:])
            environment['compiled_library_provenance']['validation'] = 'selected-layout import probe passed; existing artifacts were not rebuilt'
        print(json.dumps({'passed': True, 'scope': 'tool/source/layout validation; not a kernel proof', **environment}, indent=2))
        return 0
    except (OSError, RuntimeError, ValueError, KeyError, subprocess.SubprocessError) as exc:
        print(json.dumps({'passed': False, 'kind': 'environment_failure', 'error': str(exc)}, indent=2))
        return 1

if __name__ == '__main__':
    raise SystemExit(main())
