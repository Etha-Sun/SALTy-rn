From Coq Require Import ZArith Lia List.
From Qs8Mul Require Import NeonMemoryTactics NeonMemoryReturnFacts.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Local Opaque qm_lane qm_neon_lane qm_arm_mul qm_arm_add qm_values qm_signed_bits qm_sat8 qm_sat16 qm_sat32.
Lemma proof_of_test_neon_return_wit_1:Qs8Mul.neon_unit_goal.test_neon_return_wit_1.
Proof. unfold Qs8Mul.neon_unit_goal.test_neon_return_wit_1;left;qm_nm_intro;match goal with heap:RDMap|-_=>rename heap into ByteMap end.
change(sizeof(CHAR))with 1 in *;rewrite ?Z.mul_1_r in *;subst batch.
repeat rewrite qm_neon_fold.
Transparent qm_lane.
fold(qm_lane ByteMap input_a input_b AZ BZ Scale OZ Lo Hi 0).
fold(qm_lane ByteMap input_a input_b AZ BZ Scale OZ Lo Hi 1).
fold(qm_lane ByteMap input_a input_b AZ BZ Scale OZ Lo Hi 2).
fold(qm_lane ByteMap input_a input_b AZ BZ Scale OZ Lo Hi 3).
fold(qm_lane ByteMap input_a input_b AZ BZ Scale OZ Lo Hi 4).
fold(qm_lane ByteMap input_a input_b AZ BZ Scale OZ Lo Hi 5).
fold(qm_lane ByteMap input_a input_b AZ BZ Scale OZ Lo Hi 6).
fold(qm_lane ByteMap input_a input_b AZ BZ Scale OZ Lo Hi 7).
Opaque qm_lane.
autorewrite with qm_ext qm_vector in *.
rewrite ?Z.add_0_r.
try replace((1:Z)+1)with 2 by lia.
try replace((output+1)+1)with(output+2)by lia.
try replace((1:Z)+2)with 3 by lia.
try replace((output+1)+2)with(output+3)by lia.
try replace((1:Z)+3)with 4 by lia.
try replace((output+1)+3)with(output+4)by lia.
try replace((1:Z)+4)with 5 by lia.
try replace((output+1)+4)with(output+5)by lia.
try replace((1:Z)+5)with 6 by lia.
try replace((output+1)+5)with(output+6)by lia.
try replace((1:Z)+6)with 7 by lia.
try replace((output+1)+6)with(output+7)by lia.
try replace((2:Z)+1)with 3 by lia.
try replace((output+2)+1)with(output+3)by lia.
try replace((2:Z)+2)with 4 by lia.
try replace((output+2)+2)with(output+4)by lia.
try replace((2:Z)+3)with 5 by lia.
try replace((output+2)+3)with(output+5)by lia.
try replace((2:Z)+4)with 6 by lia.
try replace((output+2)+4)with(output+6)by lia.
try replace((2:Z)+5)with 7 by lia.
try replace((output+2)+5)with(output+7)by lia.
try replace((3:Z)+1)with 4 by lia.
try replace((output+3)+1)with(output+4)by lia.
try replace((3:Z)+2)with 5 by lia.
try replace((output+3)+2)with(output+5)by lia.
try replace((3:Z)+3)with 6 by lia.
try replace((output+3)+3)with(output+6)by lia.
try replace((3:Z)+4)with 7 by lia.
try replace((output+3)+4)with(output+7)by lia.
try replace((4:Z)+1)with 5 by lia.
try replace((output+4)+1)with(output+5)by lia.
try replace((4:Z)+2)with 6 by lia.
try replace((output+4)+2)with(output+6)by lia.
try replace((4:Z)+3)with 7 by lia.
try replace((output+4)+3)with(output+7)by lia.
try replace((5:Z)+1)with 6 by lia.
try replace((output+5)+1)with(output+6)by lia.
try replace((5:Z)+2)with 7 by lia.
try replace((output+5)+2)with(output+7)by lia.
try replace((6:Z)+1)with 7 by lia.
try replace((output+6)+1)with(output+7)by lia.
replace (((3-1)-1)-1) with 0 by lia;rewrite CharArray.undef_full_empty.
pose proof(qm_nm_cells3 output (qm_lane ByteMap input_a input_b AZ BZ Scale OZ Lo Hi 0) (qm_lane ByteMap input_a input_b AZ BZ Scale OZ Lo Hi 1) (qm_lane ByteMap input_a input_b AZ BZ Scale OZ Lo Hi 2))as Hcells.
rewrite ?Z.add_0_r,<-qm_nm_values3 in Hcells.
sep_apply Hcells.
subst input_a input_b output.
pose proof(qm_char_values_append output_pre(batch_pre-3)3 ByteMap input_a_pre input_b_pre AZ BZ Scale OZ Lo Hi ltac:(lia) ltac:(lia))as Hjoin.
replace(batch_pre-3+3)with batch_pre in Hjoin by lia.
sep_apply Hjoin;qm_k_finish.
Qed.
Print Assumptions proof_of_test_neon_return_wit_1.
