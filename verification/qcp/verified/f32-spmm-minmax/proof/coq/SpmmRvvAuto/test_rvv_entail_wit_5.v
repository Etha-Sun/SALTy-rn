From Coq Require Import ZArith List Lia.
From SpmmRvv Require Import rvv_goal.
From SpmmProof Require Import RvvFrame.
Import ListNotations Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Module Checked.
Lemma proof_of_test_rvv_entail_wit_5 : test_rvv_entail_wit_5.
Proof.
 unfold test_rvv_entail_wit_5;right;intros.
 pose proof(spmm_active32_fma_step vl (z_at NN (nc_pre-n)-nnz) (rows-m) (nc_pre-n) start NN D A W x0_2 x1_2 x2_2 x3_2 x4_2 x5_2 x6_2 x7_2 x8_2 x9_2 x10_2 x11_2 x12_2 x13_2 x14_2 x15_2 x16_2 x17_2 x18_2 x19_2 x20_2 x21_2 x22_2 x23_2 x24_2 x25_2 x26_2 x27_2 x28_2 x29_2 x30_2 x31_2 z0 z1 z2 z3 z4 z5 z6 z7 z8 z9 z10 z11 z12 z13 z14 z15 z16 z17 z18 z19 z20 z21 z22 z23 z24 z25 z26 z27 z28 z29 z30 z31 z0_2 z1_2 z2_2 z3_2 z4_2 z5_2 z6_2 z7_2 z8_2 z9_2 z10_2 z11_2 z12_2 z13_2 z14_2 z15_2 z16_2 z17_2 z18_2 z19_2 z20_2 z21_2 z22_2 z23_2 z24_2 z25_2 z26_2 z27_2 z28_2 z29_2 z30_2 z31_2 ltac:(unfold z_at,Znth in *;lia) PreH58 PreH11 PreH1)as Hactive.
 spmm_normalize2.
 replace(z_at NN (nc_pre-n)-(nnz-1))with((z_at NN (nc_pre-n)-nnz)+1)by lia.
 spmm_shape_facts.
 unfold derivable1,andp,coq_prop;intros state [Htrue Hemp].
 repeat first[assumption|reflexivity|apply conj].
 - assert (E:replace_Znth (nnz_before NN(nc_pre-n)+(Znth(nc_pre-n)NN 0-nnz))
     (z_at D(nnz_before NN(nc_pre-n)+(Znth(nc_pre-n)NN 0-nnz)))D=D).
   { apply replace_Znth_Znth. }
   rewrite E.
   pose proof(spmm_input_remaining_step rows nc_pre start NN D A W(nc_pre-n)nnz(rows-m)a PreH4 ltac:(lia) ltac:(lia) ltac:(lia) ltac:(lia) ltac:(lia))as Hstep.
   replace(z_at NN(nc_pre-n)-(nnz-1))with(z_at NN(nc_pre-n)-nnz+1)in Hstep by lia.
   rewrite Z.mul_comm in Hstep.
   rewrite (Z.mul_comm 4 (input_index D start(rows-m)(nnz_before NN(nc_pre-n)+(z_at NN(nc_pre-n)-nnz+1))))in Hstep.
   exact Hstep.
 - unfold z_at,Znth;lia.
 - change(replace_Znth (nnz_before NN(nc_pre-n)+(z_at NN(nc_pre-n)-nnz))(Znth(nnz_before NN(nc_pre-n)+(z_at NN(nc_pre-n)-nnz))D 0)D=D).
   apply replace_Znth_Znth.
Qed.
End Checked.
Print Assumptions Checked.proof_of_test_rvv_entail_wit_5.
