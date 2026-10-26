From Coq Require Import ZArith Lia.
From ArgmaxPool Require Import APBlock32StageSupport.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Lemma proof_of_ap_rvv_block32_return_wit_1:ap_rvv_block32_return_wit_1.
Proof.
 unfold ap_rvv_block32_return_wit_1;right;intros.
 match goal with j:Recordvuint32m8_t|-_=>rename j into Jout end.
 assert(Hwritten:ap_block32_written F O I ab_pre ib_pre p0_pre p1_pre p2_pre p3_pre p4_pre p5_pre p6_pre p7_pre p8_pre idx_pre vl_pre output_pre index_pre
 (ap_output_write O output_pre vl_pre(apup_float A))(ap_index_write I index_pre vl_pre(apup_int Jout))).
 { apply apbc_written;[lia|eassumption]. }
 pose proof(apbc_frames O I output_pre index_pre vl_pre(apup_float A)(apup_int Jout)ltac:(lia))as Hframes.
 unfold apup_float,apup_int in Hwritten,Hframes;entailer!.
Qed.
Print Assumptions proof_of_ap_rvv_block32_return_wit_1.
