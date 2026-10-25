From Coq Require Import ZArith List.
From Qs8Mul Require Export ProgramModel.
Import ListNotations.
Local Open Scope Z_scope.
(* True signed16 modular subtraction; active input8 values in the actual
   widening/subtraction chain make the later no-wrap lemma applicable. *)
Definition qm_s16(x:Z):Z:=signed_last_nbits x 16.
Definition qm_sub16(a b:Z):Z:=qm_s16(a-b).
Definition qm_lane_match(i vl x expected:Z):Prop:=vl<=i \/ x=expected.
Definition qm_fp_lane_match(i vl:Z)(x expected:fp32):Prop:=vl<=i \/ x=expected.
Definition qm_pack4(a b c d:Z):list Z:=[a;b;c;d]%list.
Definition qm_pack8(a b c d e f g h:Z):list Z:=[a;b;c;d;e;f;g;h]%list.
