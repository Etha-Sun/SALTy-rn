"""Replay frozen C/spec with a pinned model overlay and an impossible-goal gate."""
import argparse
import json
from pathlib import Path
import subprocess
import shim_c_campaign_modular as campaign
import shim_c_call_closure
# Only these additional standard-library calls; their pinned libc contracts apply.
shim_c_call_closure.EXTERNAL |= {"fabsf", "floor"}

p = argparse.ArgumentParser(description=__doc__)
p.add_argument('case', type=Path)
p.add_argument('--frozen-sha256', required=True)
p.add_argument('--name', required=True)
p.add_argument('--prepare', action='store_true')
p.add_argument('--framac', default='frama-c')
p.add_argument('--prover-bin')
args = p.parse_args()
data = campaign.baseline(args.case.resolve(), args.frozen_sha256)
if data['files']['model_runner.py']['path'] != str(Path(__file__).resolve().relative_to(campaign.ROOT)):
    raise RuntimeError('The v6 checker must be frozen in the case')
model = data.get('wp_model_variant', data.get('model', 'Typed'))
if model not in {'Typed', 'Typed+raw', 'Bytes', 'Bytes+raw',
                 'Typed+float', 'Typed+raw+float', 'Bytes+float', 'Bytes+raw+float'}:
    raise RuntimeError('Unsupported model (unsafe casts and real abstraction forbidden)')
inputs = {}
libraries = data.get('wp_libraries', [])
share = data.get('wp_share')
config = data.get('wp_why3_config')
if libraries or share:
    lock_path = campaign.ROOT / data['files']['float_model_lock.json']['path']
    lock = json.loads(lock_path.read_text())
    if lock.get('loadpaths', []) != libraries or lock.get('share') != share or lock.get('why3_config') != config:
        raise RuntimeError('Model load paths differ from the pinned lock')
    for path, digest in lock['files'].items():
        source = Path(path) if Path(path).is_absolute() else campaign.ROOT / path
        if campaign.sha(source) != digest:
            raise RuntimeError('Model input changed: ' + path)
        inputs[str(source)] = digest
if 'float' in model and not (libraries or share):
    raise RuntimeError('Float replay requires the audited model overlay')
inputs[str(Path(__file__).resolve())] = campaign.sha(Path(__file__))
original_run = campaign.subprocess.run
actual_command, control, lemma_run = None, None, None


def invoke(command, *positional, **options):
    global actual_command, control, lemma_run
    if not isinstance(command, list) or '-wp' not in command:
        return original_run(command, *positional, **options)
    command = list(command)
    if '-wp-model' in command:
        command[command.index('-wp-model') + 1] = model
    else:
        command += ['-wp-model', model]
    if libraries:
        command += ['-wp-library', ','.join(str(campaign.ROOT / d) for d in libraries)]
    if share:
        command += ['-wp-share', str(campaign.ROOT / share)]
    if config:
        command += ['-wp-why3-config', str(campaign.ROOT / config), '-wp-no-why3-detect']
    if data.get('wp_provers'):
        command[command.index('-wp-prover') + 1] = data['wp_provers']
    command[command.index('-wp-timeout') + 1] = str(data.get('wp_timeout', 10))
    options['timeout'] = data.get('wp_budget', 600)
    actual_command = command
    output = options['stdout']
    output.write('# Actual pinned execution: ' + repr(command) + '\n')
    output.flush()
    # Select only diagnostic functions, retaining the exact model/driver/options.
    case = args.case.resolve()
    prefix = case / 'logs' / (args.name + '-model-control')
    source = prefix.with_suffix('.c')
    annotated = case / '.build' / args.name / 'annotated' / 'unit.c'
    source.write_text('#include ' + json.dumps(str(annotated)) + '\n'
                      '/*@ assigns \\nothing; ensures \\false; */\n'
                      'void shim_control_false(void) {}\n'
                      '/*@ assigns \\nothing; ensures \\true; */\n'
                      'void shim_control_true(void) {}\n')
    diagnostic = list(command)
    diagnostic[diagnostic.index('-wp-report-json') + 1] = str(prefix.with_suffix('.json'))
    diagnostic[diagnostic.index(str(annotated))] = str(source)
    if '-wp-fct' in diagnostic:
        diagnostic[diagnostic.index('-wp-fct') + 1] = 'shim_control_false,shim_control_true'
    else:
        diagnostic += ['-wp-fct', 'shim_control_false,shim_control_true']
    with prefix.with_suffix('.log').open('w') as log:
        result = original_run(diagnostic, cwd=options['cwd'], env=options['env'],
                              stdout=log, stderr=subprocess.STDOUT, timeout=180)
    raw = json.loads(prefix.with_suffix('.json').read_text()) if prefix.with_suffix('.json').exists() else []
    false = [g for g in raw if g.get('function') == 'shim_control_false' and g['property'].endswith('_ensures')]
    true = [g for g in raw if g.get('function') == 'shim_control_true' and g['property'].endswith('_ensures')]
    control = {'command': diagnostic, 'exit': result.returncode,
               'impossible_goal_proved': any(g['passed'] for g in false),
               'positive_control_proved': bool(true and true[0]['passed']),
               'reports_present': len(false) == len(true) == 1,
               'scope': 'Rejection test only; non-rejection is not a consistency theorem.'}
    control['accepted'] = (result.returncode == 0 and control['reports_present'] and
                           control['positive_control_proved'] and not control['impossible_goal_proved'])
    if not control['accepted']:
        output.write('# Model control rejected this context\n')
        return subprocess.CompletedProcess(command, 90)
    lemma_path = prefix.parent/(args.name+'-lemmas.json')
    if campaign.explicit_lemmas:
        lemma_command = list(command)
        for option in ['-wp-fct', '-wp-skip-fct']:
            if option in lemma_command:
                index = lemma_command.index(option)
                del lemma_command[index:index+2]
        lemma_command += ['-wp-prop', '@lemma']
        lemma_command[lemma_command.index('-wp-report-json')+1] = str(lemma_path)
        with lemma_path.with_suffix('.log').open('w') as log:
            checked = original_run(lemma_command, cwd=options['cwd'], env=options['env'],
                                   stdout=log, stderr=subprocess.STDOUT,
                                   timeout=data.get('wp_budget', 600))
        lemma_run = {'command': lemma_command, 'exit': checked.returncode,
                     'report': str(lemma_path)}
        if checked.returncode or not lemma_path.exists():
            return subprocess.CompletedProcess(command, 91)
    try:
        return original_run(command, *positional, **options)
    finally:
        if lemma_run:
            full_path = Path(command[command.index('-wp-report-json')+1])
            rows = json.loads(full_path.read_text()) if full_path.exists() else []
            rows += json.loads(lemma_path.read_text())
            full_path.write_text(json.dumps(rows, indent=2)+'\n')


campaign.subprocess.run = invoke
result = campaign.run(args)
if not args.prepare:
    unchanged = all(campaign.sha(Path(path)) == digest for path, digest in inputs.items())
    result.update(actual_command=actual_command, model_inputs=inputs,
                  model_inputs_unchanged=unchanged, model_control=control, lemma_run=lemma_run,
                  complete=result['complete'] and unchanged and bool(control and control['accepted']))
    (args.case / 'logs' / (args.name + '-summary.json')).write_text(json.dumps(result, indent=2) + '\n')
print(json.dumps(result, indent=2))
raise SystemExit(0 if result.get('passed', result.get('complete')) else 1)
