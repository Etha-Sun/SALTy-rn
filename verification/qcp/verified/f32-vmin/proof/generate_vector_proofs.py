#!/usr/bin/env python3
"""Instantiate the checked fixed-field frame tactic for the generated C goals."""
from pathlib import Path
import json
import re

HERE = Path(__file__).resolve().parent
CASE = HERE.parent
ROOT = next(p for p in CASE.parents if (p / '.git').exists())
record = json.loads((HERE / 'vector-status.json').read_text())
assert record['generation_passed']
run = Path(record['run_directory'])
coq = HERE / 'coq'
# This audited, namespace-independent support proof ships with the case.
# Do not reread a different case's mutable candidate path on regeneration.
assert (coq / 'VectorFastFrame.v').is_file(), 'Missing the packaged frame support proof'

header = '''From Coq Require Import ZArith Lia.
From FMin Require Import Bits Model Types VectorModel VectorFastFrame {goal}.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Ltac vector_frame :=
 unfold UndefStructPredfloat32x4_t, UndefStructPredfloat32x2_t,
  UndefStructPredvfloat32m8_t, UndefStructPredvbool4_t;
 rewrite ?local_field_address;
 repeat progress rewrite <- logic_equiv_andp_assoc;
 first [apply _derivable1_andp_intros;
 [unfold derivable1,andp,coq_prop; intros;
  repeat first [assumption|split|reflexivity];lia
 |opaque_leaves; sepcon_assoc_change; fast_cancel]
 |opaque_leaves; sepcon_assoc_change; fast_cancel].
'''
groups = {
    'VectorScalarChecked': ('CheckedVectorScalar', ['qcp_fmin_active_min_', 'qcp_fmin_active_add_',
                                                   'qcp_fmin_active_ne_', 'qcp_fmin_active_merge_']),
    'VectorNeonChecked': ('CheckedVectorNeon', ['vminq_f32_']),
    'VectorMinChecked': ('CheckedVectorMin', ['__riscv_vfmin_vv_f32m8_']),
    'VectorAddChecked': ('CheckedVectorAdd', ['__riscv_vfadd_vv_f32m8_']),
    'VectorMergeChecked': ('CheckedVectorMerge', ['__riscv_vmerge_vvm_f32m8_']),
}
goal = (run / 'coq/vector_primitives_goal.v').read_text()
names = re.findall(r'^Axiom proof_of_(\w+) :', goal, re.M)
covered = []
for filename, (instance, prefixes) in groups.items():
    selected = [n for n in names if any(n.startswith(p) for p in prefixes)]
    assert selected, 'Missing expected fixed vector helper group: ' + filename
    covered += selected
    text = header.format(goal='vector_primitives_goal') + f'Module {instance}.\n'
    for name in selected:
        if '_safety_' in name or name.endswith('_pure'):
            tactic = '''try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 try change Int64.max_unsigned with 18446744073709551615 in *;
 cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size] in *;
 unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia'''
        elif name.startswith('qcp_fmin_active_'):
            kind = next(k for k in ['min', 'add', 'ne', 'merge'] if name.startswith('qcp_fmin_active_' + k + '_'))
            tactic = f'''try left; intros; unfold same_bits in *; subst;
 unfold mm_active_{kind};
 repeat match goal with
 | |- context[Z.ltb ?a ?b] => destruct (Z.ltb_spec a b)
 | |- context[Z.eqb ?a ?b] => destruct (Z.eqb_spec a b)
 end;
 unfold fp32_zero; entailer!; try lia'''
        else:
            tactic = 'try left; intros; unfold same_bits in *; subst; vector_frame'
        auxiliary = ', ' + name + '_aux' if re.search(r'^Definition ' + re.escape(name) + r'_aux\b', goal, re.M) else ''
        text += f'Lemma proof_of_{name} : {name}.\nProof. unfold {name}{auxiliary}; {tactic}. Qed.\n'
    text += f'End {instance}.\n'
    (coq / (filename + '.v')).write_text(text)
assert len(covered) == len(set(covered)) and set(covered) == set(names), 'Fresh vector VC partition mismatch'
aggregate = 'From FMin Require Import vector_primitives_goal ' + ' '.join(groups) + '.\n'
aggregate += 'Module CheckedVector : vector_primitives_goal.VC_Correct.\n'
aggregate += ''.join('Include ' + instance + '.\n' for instance, _ in groups.values())
aggregate += 'End CheckedVector.\n'
(coq / 'VectorChecked.v').write_text(aggregate)

goal = (run / 'coq/borrow_compare_goal.v').read_text()
names = re.findall(r'^Axiom proof_of_(\w+) :', goal, re.M)
assert names and all(n.startswith('qcp_fmin_vmfne_borrow_') for n in names)
text = header.format(goal='borrow_compare_goal') + 'Module CheckedBorrow : borrow_compare_goal.VC_Correct.\n'
for name in names:
    tactic = '''try left; intros; unfold same_bits in *; subst;
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 first [solve [unfold derivable1,andp,coq_prop; intros;
 repeat first [assumption|split|reflexivity];lia]
 |vector_frame]'''
    auxiliary = ', ' + name + '_aux' if re.search(r'^Definition ' + re.escape(name) + r'_aux\b', goal, re.M) else ''
    text += f'Lemma proof_of_{name} : {name}.\nProof. unfold {name}{auxiliary}; {tactic}. Qed.\n'
text += 'End CheckedBorrow.\n'
(coq / 'BorrowChecked.v').write_text(text)
print('Generated', len(covered), 'fixed vector proofs and', len(names), 'readonly borrow proofs')
