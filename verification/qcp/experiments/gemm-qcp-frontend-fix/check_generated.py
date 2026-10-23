#!/usr/bin/env python3
"""Check GEMM's generated goal, 3 strategies and safety subset, not the full kernel."""
import argparse
import hashlib
import json
import os
from pathlib import Path
import re
import shutil
import subprocess

HERE = Path(__file__).resolve().parent
QCP = HERE.parents[1]


def sha(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def read(path):
    return json.loads(path.read_text())


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--run', type=Path, required=True)
    parser.add_argument('--model-run', type=Path, required=True)
    args = parser.parse_args()
    run, model = args.run.resolve(), args.model_run.resolve()
    generation = read(run / 'results.json')[-1]
    assert generation['exit_code'] == 0 and generation['generated_C_VCs'] == 474
    goal = run / 'gemm/neon_full_goal.v'
    all_names = re.findall(r'^Axiom (proof_of_\w+)\s*:', goal.read_text(), re.M)
    safety_names = [name for name in all_names if '_safety_wit_' in name]
    assert len(all_names) == 474 and len(safety_names) == 78
    state = read(model / 'result.json')
    assert state['passed'], 'The public model closure must have passed first'
    for name, expected in read(model / 'inputs.json').items():
        assert sha(Path(name)) == expected, 'Model source changed: ' + name
    for record in state['records']:
        assert record['ordinary_coqc_exit'] == 0
        assert sha(Path(record['source']).with_suffix('.vo')) == record['object_sha256']
    env, flags = read(run / 'environment.json'), read(model / 'flags.json')
    gemm_neon, qcp_neon = run / 'GemmNeon', run / 'QcpNeon'
    gemm_neon.mkdir(exist_ok=True); qcp_neon.mkdir(exist_ok=True)
    # Preserve the exact already-checked KernelModel object imported by PR6 models.
    for source in (model / 'coq/GemmNeon').glob('KernelModel.*'):
        shutil.copy2(source, gemm_neon / source.name)
    for i in range(len(flags)-2):
        if flags[i] == '-Q' and flags[i+2] == 'GemmNeon':
            flags[i+1] = str(gemm_neon)
    subset = run / 'GemmSubset'
    subset.mkdir(exist_ok=True)
    flags += ['-Q', str(qcp_neon), 'QcpNeon', '-Q', str(run / 'gemm'), 'FullDomainNeonRun',
              '-Q', str(subset), 'GemmSubset']
    (run / 'flags.json').write_text(json.dumps(flags, indent=2)+'\n')
    reused = QCP / 'verified/f32-vadd/proof/coq/QcpNeon/NeonBridge.v'
    shutil.copy2(reused, qcp_neon / reused.name)
    for source in (HERE / 'proof/GemmNeon').glob('*.v'):
        assert not re.search(r'\b(?:Admitted|admit|Axiom|Parameter)\b', source.read_text())
        shutil.copy2(source, gemm_neon / source.name)
    for source in (HERE / 'proof/Subset').glob('*.v'):
        assert not re.search(r'\b(?:Admitted|admit|Axiom|Parameter)\b', source.read_text())
        shutil.copy2(source, subset / source.name)
    checked_names = re.findall(r'^Lemma (proof_of_\w+)\s*:', (subset/'SafetyChecked.v').read_text(), re.M)
    assert len(checked_names) == 78 and set(checked_names) == set(safety_names)
    command = [env['strategy'], '--arch=64', '--endian=little',
               '--input-file='+str(HERE / 'input/copy.strategies'),
               '--coq-output-dir='+str(gemm_neon), '--coq-logic-path=GemmNeon', '--no-exec-info']
    with (run / 'strategy-generation.log').open('w') as log:
        subprocess.run(command, stdout=log, stderr=subprocess.STDOUT, check=True, timeout=30)
    records = []
    for source in [qcp_neon/'NeonBridge.v', gemm_neon/'LayoutModel.v',
                   gemm_neon/'copy_strategy_goal.v', gemm_neon/'copy_strategy_proof.v',
                   goal, subset/'SafetyChecked.v', subset/'SafetyGate.v']:
        command = [env['coqc'], *flags, str(source)]
        with (run/(source.stem+'.coqc.log')).open('w') as log:
            result = subprocess.run(command, stdout=log, stderr=subprocess.STDOUT, timeout=600,
                                    cwd=run, env={**os.environ, 'COQPATH': ''})
        records.append({'source': str(source), 'source_sha256': sha(source),
                        'command': command, 'exit_code': result.returncode})
        (run/'goal-compile-results.json').write_text(json.dumps(records, indent=2)+'\n')
        if result.returncode:
            raise RuntimeError('Compilation failed; see '+str(run/(source.stem+'.coqc.log')))
    log = (run/'copy_strategy_proof.coqc.log').read_text()
    assert not re.search(r'copy_strategy[123](?:_correctness)?\s*:', log)
    assumptions = (run/'SafetyGate.coqc.log').read_text()
    assert len(re.findall(r'^Axioms:|^Closed under the global context', assumptions, re.M)) == 79
    assert not re.search(r'proof_of_|test_neon_\w+_wit_', assumptions)
    axiom_names = set(re.findall(r'^([A-Za-z_][A-Za-z0-9_.]*)\s*(?=:)', assumptions, re.M)) - {'Axioms'}
    allowed_axioms = {'sizeof_union_type', 'sizeof_struct_type', 'sizeof_enum_type',
                      'sizeof_alias_type', 'eval_addr_expr', 'Classical_Prop.classic',
                      'FunctionalExtensionality.functional_extensionality_dep',
                      'ClassicalDedekindReals.sig_forall_dec', 'ClassicalDedekindReals.sig_not_dec'}
    # Coq qualifies CNotation names when the gate does not import that module.
    normalized_axioms = {name.removeprefix('CNotation.') for name in axiom_names}
    assert normalized_axioms <= allowed_axioms, 'Unexpected assumptions: ' + str(normalized_axioms - allowed_axioms)
    summary = {'passed': True, 'generated_C_VCs': 474, 'checked_safety_C_VCs': 78,
               'remaining_C_VCs': 396, 'strategies_checked': 3, 'safety_assumption_reports': 79,
               'kernel_proved': False, 'FMA_body_proved': False, 'ISA_proved': False,
               'model_objects_reused': True, 'model_run': str(model),
               'model_result_sha256': sha(model/'result.json'),
               'assumptions': sorted(axiom_names),
               'fresh_modules': len(records), 'records': records}
    (run/'checked-subset.json').write_text(json.dumps(summary, indent=2)+'\n')
    print('Checked 78/474 GEMM safety VCs and 3 strategies; full kernel closure remains open')


if __name__ == '__main__':
    main()
