#!/usr/bin/env python3
"""Write fixed proof tactics for the named scalar helper shapes, rejecting others."""
import hashlib
import json
from pathlib import Path
import re

HERE = Path(__file__).resolve().parent
CASE = HERE.parent
record = json.loads((HERE / 'formal-primitives-status.json').read_text())
assert record['generation_passed']
for name in ['shim/scalar_primitives.c', 'shim/formal_model.h', 'proof/coq/Model.v']:
    assert hashlib.sha256((CASE / name).read_bytes()).hexdigest() == record['source_sha256'][name]
goal = Path(record['run_directory']) / 'coq/scalar_primitives_goal.v'
names = re.findall(r'^Axiom proof_of_(\w+) :', goal.read_text(), re.M)
definitions = {
    'qcp_fmax_abs_bits_': 'mm_abs_bits',
    'qcp_fmax_nan_bits_': 'mm_nan_bits',
    'qcp_fmax_snan_bits_': 'mm_snan_bits',
    'qcp_fmax_order_key_': 'mm_order_key',
    'qcp_fmax_ordered_bits_': 'mm_ordered_bits',
    'qcp_fmax_arm_bits_': 'mm_arm_bits',
    'qcp_fmax_rvv_bits_': 'mm_rvv_bits',
    'qcp_fmax_arm_': 'mm_arm',
    'qcp_fmax_rvv_add_': 'mm_rvv_add, mm_canonical_nan',
    'qcp_fmax_rvv_ne_': 'mm_rvv_ne',
    'qcp_fmax_rvv_': 'mm_rvv',
}
source = '''From Coq Require Import ZArith Lia Bool.
From FMax Require Import Bits Model scalar_primitives_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Ltac scalar_cases :=
 repeat match goal with
 | |- context[Z.eqb ?a ?b] => destruct (Z.eqb_spec a b); cbn [andb orb]; try contradiction
 | |- context[Z.ltb ?a ?b] => destruct (Z.ltb_spec a b); cbn [andb orb]; try contradiction
 end.
Ltac scalar_finish :=
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 try change Int.max_unsigned with 4294967295 in *;
 entailer!; try congruence; try lia.
Module CheckedScalar : scalar_primitives_goal.VC_Correct.
'''
for name in names:
    prefixes = sorted((p for p in definitions if name.startswith(p)), key=len, reverse=True)
    assert prefixes, 'Unknown scalar helper shape: ' + name
    model = definitions[prefixes[0]]
    tactic = f'try left; intros; unfold same_bits in *; subst; unfold {model}; scalar_cases; scalar_finish'
    source += f'Lemma proof_of_{name} : {name}.\nProof. unfold {name}; {tactic}. Qed.\n'
source += 'End CheckedScalar.\n'
(HERE / 'coq/ScalarChecked.v').write_text(source)
print('Generated concrete proof of', len(names), 'fresh C VC fields')
