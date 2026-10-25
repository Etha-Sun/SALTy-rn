From Coq Require Import ZArith Lia List.
From Qs8Mul Require Import KernelFacts NeonOutputFacts NeonLaneFacts neon_unit_goal.
Import ListNotations Snaive_C_Rules64.
Local Open Scope Z_scope. Local Open Scope sac.
Local Opaque CharArray.full CharArray.undef_full qm_neon_lane qm_arm_add qm_arm_mul qm_signed_bits qm_sat8 qm_sat16 qm_sat32 rd_mem.
Lemma proof_of_test_neon_entail_wit_3 : Qs8Mul.neon_unit_goal.test_neon_entail_wit_3.
Proof.
 unfold Qs8Mul.neon_unit_goal.test_neon_entail_wit_3.
 intros params_pre output_pre input_b_pre input_a_pre batch_pre Hi Lo OZ Scale BZ AZ M output input_b input_a batch;intros.
 change(sizeof(CHAR))with 1 in *;change UINT64_MAX with 18446744073709551615 in *.
 rewrite ?Z.mul_1_r,?Z.add_0_r in *.
 rewrite !qm_neon_fold.
 Left.
 replace(qm_neon_lane(rd_get M input_a)(rd_get M input_b)AZ BZ Scale OZ Lo Hi)with(qm_lane M input_a input_b AZ BZ Scale OZ Lo Hi 0)by(unfold qm_lane;rewrite !Z.add_0_r;reflexivity).
 change(qm_neon_lane(rd_get M(input_a+1))(rd_get M(input_b+1))AZ BZ Scale OZ Lo Hi)with(qm_lane M input_a input_b AZ BZ Scale OZ Lo Hi 1).
 change(qm_neon_lane(rd_get M(input_a+2))(rd_get M(input_b+2))AZ BZ Scale OZ Lo Hi)with(qm_lane M input_a input_b AZ BZ Scale OZ Lo Hi 2).
 change(qm_neon_lane(rd_get M(input_a+3))(rd_get M(input_b+3))AZ BZ Scale OZ Lo Hi)with(qm_lane M input_a input_b AZ BZ Scale OZ Lo Hi 3).
 change(qm_neon_lane(rd_get M(input_a+4))(rd_get M(input_b+4))AZ BZ Scale OZ Lo Hi)with(qm_lane M input_a input_b AZ BZ Scale OZ Lo Hi 4).
 change(qm_neon_lane(rd_get M(input_a+5))(rd_get M(input_b+5))AZ BZ Scale OZ Lo Hi)with(qm_lane M input_a input_b AZ BZ Scale OZ Lo Hi 5).
 change(qm_neon_lane(rd_get M(input_a+6))(rd_get M(input_b+6))AZ BZ Scale OZ Lo Hi)with(qm_lane M input_a input_b AZ BZ Scale OZ Lo Hi 6).
 change(qm_neon_lane(rd_get M(input_a+7))(rd_get M(input_b+7))AZ BZ Scale OZ Lo Hi)with(qm_lane M input_a input_b AZ BZ Scale OZ Lo Hi 7).
 pose proof(qm_char_cells8 output
 (qm_lane M input_a input_b AZ BZ Scale OZ Lo Hi 0)
 (qm_lane M input_a input_b AZ BZ Scale OZ Lo Hi 1)
 (qm_lane M input_a input_b AZ BZ Scale OZ Lo Hi 2)
 (qm_lane M input_a input_b AZ BZ Scale OZ Lo Hi 3)
 (qm_lane M input_a input_b AZ BZ Scale OZ Lo Hi 4)
 (qm_lane M input_a input_b AZ BZ Scale OZ Lo Hi 5)
 (qm_lane M input_a input_b AZ BZ Scale OZ Lo Hi 6)
 (qm_lane M input_a input_b AZ BZ Scale OZ Lo Hi 7))as Hcells.
 rewrite Z.add_0_r in Hcells.
 sep_apply Hcells.
 rewrite <-qm_values_8.
 assert(Ecount:batch_pre-(batch-8)=(batch_pre-batch)+8)by lia.
 rewrite !Ecount.
 assert(Eoutput:output=output_pre+(batch_pre-batch))by lia.
 assert(Ea:input_a=input_a_pre+(batch_pre-batch))by lia.
 assert(Eb:input_b=input_b_pre+(batch_pre-batch))by lia.
 replace((((((((batch-1)-1)-1)-1)-1)-1)-1)-1)with(batch-8)by lia.
 rewrite !Eoutput,!Ea,!Eb.
 pose proof(qm_char_values_append output_pre(batch_pre-batch)8 M input_a_pre input_b_pre AZ BZ Scale OZ Lo Hi ltac:(lia)ltac:(lia))as Hmerge.
 let pref:=constr:(CharArray.full output_pre(batch_pre-batch)(qm_values(batch_pre-batch)M input_a_pre input_b_pre AZ BZ Scale OZ Lo Hi))in
 lazymatch goal with |-?P|--?Q=>
 eapply(derivable1_trans P(pref**_)Q);[pull_cell pref|]end.
 rewrite logic_equiv_sepcon_assoc.
 eapply derivable1_trans.
 - apply derivable1_sepcon_mono;[exact Hmerge|apply derivable1_refl].
 -
   repeat progress rewrite <-logic_equiv_andp_assoc.
   apply _derivable1_andp_intros.
   + unfold derivable1,andp,coq_prop;intros;repeat first[assumption|reflexivity|split];lia.
   + lazymatch goal with |-?P|--_=>lazymatch P with
     context[CharArray.undef_full ?buf ?len]=>
     let E:=fresh "Euf"in assert(E:CharArray.undef_full buf len=CharArray.undef_full(output_pre+(batch_pre-batch)+8)(batch-8))by(f_equal;lia);rewrite E
     end end.
     opaque_leaves;sepcon_assoc_change;fast_cancel.
Qed.
Print Assumptions proof_of_test_neon_entail_wit_3.
