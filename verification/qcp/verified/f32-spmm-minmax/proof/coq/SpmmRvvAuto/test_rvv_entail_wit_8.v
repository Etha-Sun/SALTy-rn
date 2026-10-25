From Coq Require Import ZArith List Lia.
From SpmmRvv Require Import rvv_goal.
From SpmmProof Require Import ColumnFrame.
Import ListNotations Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module Checked.
Lemma proof_of_test_rvv_entail_wit_8 : test_rvv_entail_wit_8.
Proof.
 unfold test_rvv_entail_wit_8;right;intros.
 assert(Ez:z_at NN(nc_pre-n)-Znth(nc_pre-n)NN 0=0)by(unfold z_at,Znth;lia).
 rewrite Ez in PreH1,PreH11.
 pose proof(spmm_active32_fma_step vl 0(rows-m)(nc_pre-n)start NN D A W z0 z1 z2 z3 z4 z5 z6 z7 z8 z9 z10 z11 z12 z13 z14 z15 z16 z17 z18 z19 z20 z21 z22 z23 z24 z25 z26 z27 z28 z29 z30 z31 z0_2 z1_2 z2_2 z3_2 z4_2 z5_2 z6_2 z7_2 z8_2 z9_2 z10_2 z11_2 z12_2 z13_2 z14_2 z15_2 z16_2 z17_2 z18_2 z19_2 z20_2 z21_2 z22_2 z23_2 z24_2 z25_2 z26_2 z27_2 z28_2 z29_2 z30_2 z31_2 z0_3 z1_3 z2_3 z3_3 z4_3 z5_3 z6_3 z7_3 z8_3 z9_3 z10_3 z11_3 z12_3 z13_3 z14_3 z15_3 z16_3 z17_3 z18_3 z19_3 z20_3 z21_3 z22_3 z23_3 z24_3 z25_3 z26_3 z27_3 z28_3 z29_3 z30_3 z31_3 ltac:(lia) PreH32 PreH11 PreH1)as Hactive.
 spmm_normalize2.
 replace(z_at NN(nc_pre-n)-(Znth(nc_pre-n)NN 0-1))with(0+1)by(unfold z_at,Znth;lia).
 spmm_shape_facts.
 unfold derivable1,andp,coq_prop;intros state [Htrue Hemp].
 repeat first[assumption|reflexivity|apply conj].
 - assert(E:replace_Znth(nnz_before NN(nc_pre-n))(z_at D(nnz_before NN(nc_pre-n)))D=D)by apply replace_Znth_Znth.
   rewrite E.
   pose proof(spmm_input_remaining_step rows nc_pre start NN D A W(nc_pre-n)(Znth(nc_pre-n)NN 0)(rows-m)a PreH4 ltac:(lia) ltac:(unfold z_at,Znth in *;lia) ltac:(lia) ltac:(lia) ltac:(lia))as Hstep.
   replace(z_at NN(nc_pre-n)-(Znth(nc_pre-n)NN 0-1))with(0+1)in Hstep by(unfold z_at,Znth;lia).
   replace(z_at NN(nc_pre-n)-Znth(nc_pre-n)NN 0)with 0 in Hstep by(unfold z_at,Znth;lia).
   rewrite ?Z.add_0_r in Hstep.
   rewrite Z.mul_comm in Hstep.
   rewrite (Z.mul_comm 4 (input_index D start(rows-m)(nnz_before NN(nc_pre-n)+(0+1))))in Hstep.
   exact Hstep.
 - apply replace_Znth_Znth.
Qed.
End Checked.
Print Assumptions Checked.proof_of_test_rvv_entail_wit_8.
