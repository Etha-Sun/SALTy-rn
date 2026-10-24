From Coq Require Import ZArith List Bool Lia.
From QC4W Require Export PublicModel.
From Qd8Phase Require Export IntegerFold.
From GemmSpec Require Export FmaModel IntrinsicModel.
Import ListNotations Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Definition qc4_zget i (xs:list Z):=Znth i xs 0.
Definition qc4_fget i (xs:list fp32):=Znth i xs fp32_zero.
Definition qc4_panel_at (ps:list qc4_panel) tile:=Znth tile ps qc4_empty_panel.
Definition qc4_ks tile lane Ps:=qc4_zget lane(qc4_sums(qc4_panel_at Ps tile)).
Definition qc4_float_field kind tile lane Ps:=qc4_fget lane
 (if Z.eqb kind 0 then qc4_scales(qc4_panel_at Ps tile)else qc4_biases(qc4_panel_at Ps tile)).
Definition qc4_matrix_wf K (Ps:list qc4_panel):=Forall(qc4_panel_wf K)Ps.
Definition qc4_wrap_signed x:=signed32(wrap32 x).
Definition qc4_mac_signed acc a b:=qc4_wrap_signed(acc+a*b).
Definition qc4_active_z vl lane (actual expected:Z):Prop:=lane<vl -> actual=expected.
Definition qc4_active_f vl lane (actual expected:fp32):Prop:=lane<vl -> actual=expected.
Definition qc4_nan_flag(x:fp32):Z:=if Binary.is_nan 24 128 x then 1 else 0.
Definition qc4_merge(a b:fp32)(mask:Z):=if Z.eqb mask 0 then a else b.
Definition qc4_fappend(L R:list fp32):=List.app L R.
Definition qc4_acc_signed depth tile lane zp A Ps:=
 signed32(qc4_acc depth (qc4_ks tile lane Ps)zp lane A(qc4_weights(qc4_panel_at Ps tile))).
Definition qc4_active16_z(vl:Z)(a0 a1 a2 a3 a4 a5 a6 a7 a8 a9 a10 a11 a12 a13 a14 a15 e0 e1 e2 e3 e4 e5 e6 e7 e8 e9 e10 e11 e12 e13 e14 e15:Z):Prop:=
 qc4_active_z vl 0 a0 e0 /\
 qc4_active_z vl 1 a1 e1 /\
 qc4_active_z vl 2 a2 e2 /\
 qc4_active_z vl 3 a3 e3 /\
 qc4_active_z vl 4 a4 e4 /\
 qc4_active_z vl 5 a5 e5 /\
 qc4_active_z vl 6 a6 e6 /\
 qc4_active_z vl 7 a7 e7 /\
 qc4_active_z vl 8 a8 e8 /\
 qc4_active_z vl 9 a9 e9 /\
 qc4_active_z vl 10 a10 e10 /\
 qc4_active_z vl 11 a11 e11 /\
 qc4_active_z vl 12 a12 e12 /\
 qc4_active_z vl 13 a13 e13 /\
 qc4_active_z vl 14 a14 e14 /\
 qc4_active_z vl 15 a15 e15.
Definition qc4_active16_f(vl:Z)(a0 a1 a2 a3 a4 a5 a6 a7 a8 a9 a10 a11 a12 a13 a14 a15 e0 e1 e2 e3 e4 e5 e6 e7 e8 e9 e10 e11 e12 e13 e14 e15:fp32):Prop:=
 qc4_active_f vl 0 a0 e0 /\
 qc4_active_f vl 1 a1 e1 /\
 qc4_active_f vl 2 a2 e2 /\
 qc4_active_f vl 3 a3 e3 /\
 qc4_active_f vl 4 a4 e4 /\
 qc4_active_f vl 5 a5 e5 /\
 qc4_active_f vl 6 a6 e6 /\
 qc4_active_f vl 7 a7 e7 /\
 qc4_active_f vl 8 a8 e8 /\
 qc4_active_f vl 9 a9 e9 /\
 qc4_active_f vl 10 a10 e10 /\
 qc4_active_f vl 11 a11 e11 /\
 qc4_active_f vl 12 a12 e12 /\
 qc4_active_f vl 13 a13 e13 /\
 qc4_active_f vl 14 a14 e14 /\
 qc4_active_f vl 15 a15 e15.
Lemma qc4_mac_signed_matches_bits : forall acc a b,
 qc4_mac_signed(signed32(wrap32 acc))a b=signed32(mac32 acc a b).
Proof.
 intros;unfold qc4_mac_signed,qc4_wrap_signed.
 change(signed32(mac32(signed32(wrap32 acc))a b)=signed32(mac32 acc a b)).
 rewrite <-mac32_normalize at 1.
 rewrite signed32_mod_identity,mac32_normalize;reflexivity.
Qed.
Print Assumptions qc4_mac_signed_matches_bits.

(* Transparent alias avoids the observed frontend failure for the original
   fp32_mul symbol. The precise frontend cause has not been established.
   Identical IEEE multiplication definition, with no strengthened precondition. *)
Definition qc4_fp32_mul (a b:fp32):fp32:=fp32_mul a b.
Lemma qc4_fp32_mul_exact : forall a b,qc4_fp32_mul a b=fp32_mul a b.
Proof. reflexivity. Qed.
Print Assumptions qc4_fp32_mul_exact.
