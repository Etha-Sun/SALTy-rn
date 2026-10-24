From Coq Require Import ZArith List.
From QC4W Require Export ApiModel.
Import ListNotations.
Local Open Scope Z_scope.
Definition qc4_char_field (mode tile j lane:Z) (A:list Z) (Ps:list qc4_panel) :=
 qc4_zget(j+lane)(if Z.eqb mode 0 then A else qc4_weights(qc4_panel_at Ps tile)).
Definition qc4_i8_address_ok (mode p ab wb K tile j:Z) (Ps:list qc4_panel):Prop :=
 (mode=0 /\ p=ab+j /\ 0<=j /\ j+8<=qc4_a_extent K) \/
 (mode=1 /\ p=wb+tile*panel_bytes K+64+j /\
  0<=tile<Zlength Ps /\ 0<=j /\ j+8<=8*rounded_depth K).
Definition qc4_i16_lane (lane x0 x1 x2 x3:Z):=qc4_zget lane [x0;x1;x2;x3].
(* Includes the original call's implicit conversion from INT8_C(0xF0).
   AArch64 signed-char conversion retains the low 8 bits; 240 becomes -16. *)
Definition qc4_narrow8 (x:Z):=signed8(u8 x).
Lemma qc4_literal_mask : qc4_narrow8 240 = -16.
Proof. reflexivity. Qed.
Print Assumptions qc4_literal_mask.
