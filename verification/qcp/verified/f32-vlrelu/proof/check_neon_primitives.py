#!/usr/bin/env python3
"""Check all generated NEON primitive VCs; scalar bit helpers stay separate."""
import argparse
import hashlib
import json
from pathlib import Path
from artifact_paths import artifact_path
import re
import shutil
import subprocess
import tempfile
import time

HERE = Path(__file__).resolve().parent
CASE = HERE.parent

def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument('--config', type=Path, required=True)
    p.add_argument('--dependency-dir', type=Path, required=True)
    args = p.parse_args()
    cfg = json.loads(args.config.read_text())
    dep = args.dependency_dir.resolve()
    generation = json.loads((HERE / 'neon-primitives-generation.json').read_text())
    assert generation['generation_passed']
    generated = artifact_path(generation['run_directory']) / 'neon_primitives_goal.v'
    run = Path(tempfile.mkdtemp(prefix='neon-primitive-proof-', dir=CASE / '.build'))
    coq = run / 'coq'
    coq.mkdir()
    flags = cfg['flags'][2:]
    for folder in sorted(dep.iterdir()):
        if folder.is_dir():
            flags += ['-Q', str(folder), '' if folder.name == 'relations' else folder.name]
    flags += ['-Q', str(coq), 'VLRelu']
    goal = generated.read_text()
    names = re.findall(r'^Axiom proof_of_(\w+) :', goal, re.M)
    assert names and len(names) == len(set(names))
    source = '''From Coq Require Import ZArith Lia.
From VLRelu Require Import Model Bits RvvFastFrame neon_primitives_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Ltac primitive_frame :=
 unfold fp32_bits_equal, same_bits in *; subst;
 unfold UndefStructPredfloat32x4_t, UndefStructPredfloat32x2_t,
  UndefStructPredint32x4_t, UndefStructPreduint32x4_t;
 rewrite ?local_field_address;
 repeat progress rewrite <- logic_equiv_andp_assoc;
 first [apply _derivable1_andp_intros;
 [unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia
 |opaque_leaves; sepcon_assoc_change; fast_cancel]
 |opaque_leaves; sepcon_assoc_change; fast_cancel].
Module CheckedNeonPrimitives : VC_Correct.
'''
    allowed = ['qcp_signed32_lane_', 'qcp_bitselect_', 'vdupq_n_f32_', 'vmovq_n_s32_',
               'vmulq_f32_', 'vreinterpretq_s32_f32_', 'vcltq_s32_', 'vbslq_f32_']
    for name in names:
        assert any(name.startswith(prefix) for prefix in allowed), 'Unknown primitive shape: ' + name
        if name.startswith('qcp_signed32_lane_'):
            tactic = '''try left; intros; subst; pose proof (fp32_bits_range x_pre);
 unfold vlrelu_signed32; repeat match goal with
 | |- context[Z.ltb ?x ?y] => destruct (Z.ltb_spec x y); try lia end;
 try change Int.min_signed with (-2147483648) in *;
 try change Int.max_signed with 2147483647 in *;
 try change Int.max_unsigned with 4294967295 in *;
 unfold derivable1,andp,coq_prop; intros; repeat first [assumption|split|reflexivity];lia'''
            if name.endswith('partial_solve_wit_1'):
                tactic = 'entailer!'
            elif '_return_' in name:
                tactic = '''left; intros; subst; pose proof (fp32_bits_range x_pre);
 unfold vlrelu_signed32;
 repeat match goal with |- context[Z.ltb ?x ?y] => destruct (Z.ltb_spec x y); try lia end;
 try change Int.max_signed with 2147483647 in *; entailer!; lia'''
        elif name.startswith('qcp_bitselect_'):
            tactic = '''try left; intros; unfold same_bits,fp32_bits_equal,vlrelu_bitselect in *; subst;
 try change Int.max_unsigned with 4294967295 in *; entailer!'''
        elif name.startswith('vcltq_s32_return_'):
            tactic = '''left; intros; unfold vlrelu_compare_mask;
 repeat match goal with |- context[Z.ltb ?x ?y] => destruct (Z.ltb_spec x y); try lia end;
 try change Int.max_unsigned with 4294967295; primitive_frame'''
        else:
            tactic = 'try left; intros; primitive_frame'
        source += f'Lemma proof_of_{name} : {name}.\nProof. unfold {name}; {tactic}. Qed.\n'
    source += 'End CheckedNeonPrimitives.\n'
    source += '\n'.join('Print Assumptions CheckedNeonPrimitives.proof_of_' + n + '.' for n in names) + '\n'
    (HERE / 'coq/NeonPrimitives.v').write_text(source)
    records = []
    report = {'passed': False, 'scope': 'Actual NEON primitive C VCs; scalar bit helper bodies separate',
              'whole_kernel_verified': False, 'run_directory': str(run), 'records': records,
              'generated_goal_sha256': hashlib.sha256(generated.read_bytes()).hexdigest()}
    try:
        for name in ['Model.v', 'Bits.v', 'RvvFastFrame.v', 'neon_primitives_goal.v', 'NeonPrimitives.v']:
            original = generated if name.endswith('_goal.v') else HERE / 'coq' / name
            shutil.copyfile(original, coq / name)
            command = ['qcp-env', 'coqc', '-time', *flags, str(coq / name)]
            start = time.monotonic()
            with (run / (name + '.log')).open('w') as output:
                result = subprocess.run(command, cwd=run, stdout=output, stderr=subprocess.STDOUT, timeout=300)
            records.append({'command': command, 'exit_code': result.returncode,
                            'seconds': time.monotonic() - start,
                            'source_sha256': hashlib.sha256(original.read_bytes()).hexdigest()})
            print(name, result.returncode, flush=True)
            if result.returncode:
                raise RuntimeError((run / (name + '.log')).read_text()[-3500:])
        report.update(passed=True, checked_c_vcs=len(names), vc_correct_passed=True)
    finally:
        (run / 'status.json').write_text(json.dumps(report, indent=2) + '\n')
        (HERE / 'neon-primitive-status.json').write_text(json.dumps(report, indent=2) + '\n')

if __name__ == '__main__':
    main()
