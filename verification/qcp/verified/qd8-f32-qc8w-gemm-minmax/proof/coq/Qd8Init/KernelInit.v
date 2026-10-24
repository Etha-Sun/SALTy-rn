(* Exact initial accumulator bridge for original complete K-loop VCs. *)
From Coq Require Import ZArith Lia.
From SimpleC.SL Require Import Mem SeparationLogic.
From Qd8FullKernel Require Import FullModel.
From Qd8API Require Import ApiModel.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Lemma qd8_init_acc_lane:forall K tile lane zp A Ps,
 qd8_acc_signed K 0 tile lane zp A Ps =
 qd8_wrap_signed(qd8_ks tile lane Ps*zp).
Proof. reflexivity. Qed.
Print Assumptions qd8_init_acc_lane.

Lemma qd8_output_prefix_zero:forall c N K zp A Ps inv lo hi,
 qd8_output_prefix c N 0 K zp A Ps inv lo hi --||-- FloatArray.undef_full c N.
Proof.
 intros;unfold qd8_output_prefix.
 change(FloatArray.full c 0 nil ** FloatArray.undef_seg c 0 N --||-- FloatArray.undef_full c N).
 rewrite FloatArray.full_empty.
 unfold FloatArray.undef_seg,FloatArray.undef_full,store_undef_array.
 rewrite Z.sub_0_r. split;entailer!.
Qed.
Print Assumptions qd8_output_prefix_zero.
