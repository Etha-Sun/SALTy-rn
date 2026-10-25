From Coq Require Import ZArith Lia.
From DwChw Require Export NeonKernelColumnFacts Bits.
Local Open Scope Z_scope.

Lemma dw_neon_tail_mask_index:forall N x n,
 x mod 4=0->1<=n<=4->N=x+n->dw_mask_index N=4-n.
Proof.
 intros N x n Hx Hn HN;unfold dw_mask_index.
 pose proof(Z.div_mod x 4 ltac:(lia))as He;rewrite Hx in He.
 replace(N-1)with(n-1+(x/4)*4)by lia.
 rewrite Z.mod_add,Z.mod_small by lia;ring.
Qed.

Lemma dw_u4_from_four:forall(A:Z->Z)i,
 0<=i<4->dw_u4(A 0)(A 1)(A 2)(A 3)i=A i.
Proof.
 intros A i Hi;assert(i=0\/i=1\/i=2\/i=3)by lia.
 destruct H as[->|[->|[->| -> ]]];reflexivity.
Qed.

Lemma dw_float_bits_full_mask:forall v,
 Z.land 4294967295(bits_of_fp32 v)=bits_of_fp32 v.
Proof.
 intro v;rewrite Z.land_comm.
 change(Z.land(bits_of_fp32 v)(Z.ones 32)=bits_of_fp32 v).
 rewrite Z.land_ones by lia;rewrite Z.mod_small;[reflexivity|].
 pose proof(fp32_bits_range v);change(0<=bits_of_fp32 v<4294967296);lia.
Qed.

(* Exactly the existing NEON reinterpret/AND/reinterpret definitions. This
   is derived mathematical notation, not another intrinsic declaration. *)
Definition dw_neon_masked4(index:Z)(A:Z->fp32):Z->fp32:=
 let M:=dw_u4(dw_mask7_word index 0)(dw_mask7_word index 1)
  (dw_mask7_word index 2)(dw_mask7_word index 3)in
 let B:=dw_u4(bits_of_fp32(A 0))(bits_of_fp32(A 1))
  (bits_of_fp32(A 2))(bits_of_fp32(A 3))in
 dw_fp4(fp32_of_bits(dw_arm_and M B 0))(fp32_of_bits(dw_arm_and M B 1))
  (fp32_of_bits(dw_arm_and M B 2))(fp32_of_bits(dw_arm_and M B 3)).

Lemma dw_neon_masked4_lane:forall n A i,
 1<=n<=4->0<=i<4->
 dw_neon_masked4(4-n)A i=if i<?n then A i else fp32_zero.
Proof.
 intros n A i Hn Hi;unfold dw_neon_masked4;cbn zeta.
 rewrite(dw_fp4_from_four
  (fun j=>fp32_of_bits(dw_arm_and
   (dw_u4(dw_mask7_word(4-n)0)(dw_mask7_word(4-n)1)(dw_mask7_word(4-n)2)(dw_mask7_word(4-n)3))
   (dw_u4(bits_of_fp32(A 0))(bits_of_fp32(A 1))(bits_of_fp32(A 2))(bits_of_fp32(A 3)))j))i Hi).
 unfold dw_arm_and.
 rewrite(dw_u4_from_four(fun j=>dw_mask7_word(4-n)j)i Hi).
 rewrite(dw_u4_from_four(fun j=>bits_of_fp32(A j))i Hi).
 unfold dw_mask7_word;destruct(Z.ltb_spec(4-n+i)4);destruct(Z.ltb_spec i n);try lia.
 - rewrite dw_float_bits_full_mask;apply fp32_of_bits_of_fp32.
 - rewrite Z.land_0_l;reflexivity.
Qed.
Print Assumptions dw_neon_tail_mask_index.
Print Assumptions dw_u4_from_four.
Print Assumptions dw_float_bits_full_mask.
Print Assumptions dw_neon_masked4_lane.
