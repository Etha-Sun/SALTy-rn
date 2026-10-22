#!/usr/bin/env python3
"""Check value-returning float vectors; this is not a complete kernel proof."""
from pathlib import Path
import hashlib
import json
import re
import shutil
import subprocess
import tempfile

HERE = Path(__file__).resolve().parent
WORKSPACE = HERE.parents[5]


def main():
    build = HERE / '.build'
    build.mkdir(exist_ok=True)
    run = Path(tempfile.mkdtemp(prefix='run-', dir=build))
    config = json.loads((WORKSPACE / 'research/qcp-shim-vadd/results/coq-flags.json').read_text())
    records = []

    def execute(command, label):
        result = subprocess.run(list(map(str, command)), cwd=config['cwd'],
                                capture_output=True, text=True, timeout=60)
        (run / (label + '.log')).write_text(result.stdout + result.stderr)
        records.append({'label': label, 'exit_code': result.returncode,
                        'command': list(map(str, command))})
        return result

    def qcp(directory, label):
        return execute(['qcp', '--arch=64', '--endian=little', '--no-float-finite-vc',
                        '--no-exec-info', '--input-file=' + str(directory / 'vadd.c'),
                        '--coq-output-dir=' + str(directory), '--coq-logic-path=Probe',
                        '-slp', directory, 'Probe'], label)

    for name in ['vadd.c', 'Layout.v', 'checked.v']:
        shutil.copyfile(HERE / name, run / name)
    assert qcp(run, 'generate').returncode == 0
    flags = config['flags'][2:]
    for name in ['Layout.v', 'vadd_goal.v', 'checked.v']:
        assert execute(['qcp-env', 'coqc', *flags, '-Q', run, 'Probe', run / name], name).returncode == 0
    obligations = re.findall(r'^Axiom proof_of_(\w+) :', (run / 'vadd_goal.v').read_text(), re.M)
    assert len(obligations) == 8
    assert not re.search(r'\b(?:Admitted|admit|Axiom|Parameter)\b', (HERE / 'checked.v').read_text())

    # The same proof must reject computing a+c instead of (a+b)+c.
    negative = run / 'negative'
    negative.mkdir()
    for name in ['Layout.v', 'checked.v']:
        shutil.copyfile(HERE / name, negative / name)
    source = (HERE / 'vadd.c').read_text()
    mutant = source.replace('vaddq_f32(vacc,c) /*@ where a = &vacc, b = &c */',
                            'vaddq_f32(a,c) /*@ where a = &a, b = &c */')
    assert mutant != source
    (negative / 'vadd.c').write_text(mutant)
    assert qcp(negative, 'negative-generate').returncode == 0
    for name in ['Layout.v', 'vadd_goal.v']:
        assert execute(['qcp-env', 'coqc', *flags, '-Q', negative, 'Probe', negative / name],
                       'negative-' + name).returncode == 0
    rejected = execute(['qcp-env', 'coqc', *flags, '-Q', negative, 'Probe', negative / 'checked.v'],
                       'negative-proof')
    assert rejected.returncode != 0 and 'incomplete proof' in rejected.stderr

    duplicate = run / 'duplicate'
    duplicate.mkdir()
    shutil.copyfile(HERE / 'duplicate.c', duplicate / 'vadd.c')
    shutil.copyfile(HERE / 'Layout.v', duplicate / 'Layout.v')
    result = qcp(duplicate, 'duplicate-generate')
    assert result.returncode != 0 and 'Cannot derive the precondition' in result.stderr
    status = {'checked_c_vcs': len(obligations), 'full_kernel_proved': False,
              'negative_control_rejected': True, 'duplicate_input_supported': False,
              'run_directory': str(run), 'commands': records,
              'sources': {n: hashlib.sha256((HERE / n).read_bytes()).hexdigest()
                          for n in ['vadd.c', 'duplicate.c', 'Layout.v', 'checked.v', 'run.py']}}
    (HERE / 'status.json').write_text(json.dumps(status, indent=2) + '\n')
    print(json.dumps({k: status[k] for k in ['checked_c_vcs', 'full_kernel_proved',
                                           'negative_control_rejected', 'duplicate_input_supported']}))


if __name__ == '__main__':
    main()
