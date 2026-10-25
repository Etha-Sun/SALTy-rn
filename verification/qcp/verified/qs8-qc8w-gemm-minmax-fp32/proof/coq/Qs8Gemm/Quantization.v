From Coq Require Import ZArith List Lia Reals.
From Qs8Gemm Require Import FloatBits.
From Qd8Cast Require Import CastModel IntegerFold.
From Qd8Phase Require Import PhaseModel.
Import ListNotations Snaive_C_Rules64.
Local Open Scope Z_scope.
Definition qs8_sat (lo hi x:Z) := Z.min hi (Z.max lo x).
Definition qs8_ssub32 (a b:Z) := qs8_sat (-2147483648) 2147483647 (a-b).
Definition qs8_narrow16 (x:Z) := qs8_sat (-32768) 32767 x.
Definition qs8_narrow8 (x:Z) := qs8_sat (-128) 127 x.
Definition qs8_magic_bits (acc:Z) (scale magic:fp32) :=
 bits_of_fp32 (f16_arm_add (f16_arm_mul (fp32_of_real (IZR acc)) scale) magic).
Definition qs8_quant (acc:Z) (scale magic:fp32) (offset lo hi:Z) :=
 qs8_sat lo hi (qs8_narrow8 (qs8_narrow16
 (qs8_ssub32 (signed32_view (qs8_magic_bits acc scale magic)) offset))).
Lemma qs8_sat_range : forall lo hi x, lo<=hi -> lo<=qs8_sat lo hi x<=hi.
Proof. intros;unfold qs8_sat;lia. Qed.
Lemma qs8_narrow_chain : forall x,
 qs8_narrow8 (qs8_narrow16 (qs8_sat (-2147483648) 2147483647 x))=
 qs8_narrow8 x.
Proof. intros;unfold qs8_narrow8,qs8_narrow16,qs8_sat;lia. Qed.
Lemma qs8_narrow_chain_sub : forall a b,
 qs8_narrow8 (qs8_narrow16 (qs8_ssub32 a b))=qs8_narrow8 (a-b).
Proof. intros;apply qs8_narrow_chain. Qed.
Lemma qs8_quant_range : forall acc scale magic off lo hi,
 -128<=lo<=127 -> -128<=hi<=127 ->
 -128<=qs8_quant acc scale magic off lo hi<=127.
Proof. intros;unfold qs8_quant,qs8_narrow8,qs8_sat;lia. Qed.
(* Reuse the existing arbitrary-length modulo-32 fold with initial bias
   represented as ks=bias,zp=1. No upper bound on the K fold is introduced. *)
Lemma qs8_fold_step : forall d bias lane av wv,
 0<=d ->
 PhaseModel.lane_acc (d+1) bias 1 lane av wv =
 Qd8Phase.IntegerFold.mac32 (PhaseModel.lane_acc d bias 1 lane av wv)
 (PhaseModel.zget d av) (PhaseModel.zget (8*d+lane) wv).
Proof.
 intros;unfold PhaseModel.lane_acc;rewrite Z2Nat.inj_add by lia.
 cbn;rewrite Nat.add_1_r;cbn;rewrite Z2Nat.id by lia;reflexivity.
Qed.
Lemma qs8_fold_initial : forall bias lane av wv,
 PhaseModel.lane_acc 0 bias 1 lane av wv=Qd8Phase.IntegerFold.wrap32 bias.
Proof. intros;change (Qd8Phase.IntegerFold.wrap32 (bias*1)=Qd8Phase.IntegerFold.wrap32 bias);now rewrite Z.mul_1_r. Qed.
Print Assumptions qs8_narrow_chain_sub.
Print Assumptions qs8_quant_range.
Print Assumptions qs8_fold_step.
