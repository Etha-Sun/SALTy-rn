From Coq Require Import ZArith List String Lia.
From SimpleC.SL Require Export SeparationLogic ArrayLib.
Import ListNotations Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope string_scope.
Local Open Scope sac.

(** Explicit binary32 record interpretation. The frontend's generated
    record template for this float-array case used R/Int and is retained as
    diagnostic evidence, not imported as the semantic definition. *)
Record Recordfloat32x4_t := vec4 { f0:fp32; f1:fp32; f2:fp32; f3:fp32 }.
Record Recordfloat32x4x2_t := tuple_record { tuple_values:list Recordfloat32x4_t }.
Definition veczero := vec4 fp32_zero fp32_zero fp32_zero fp32_zero.
Definition tuple_at (i:Z) (xs:list Recordfloat32x4_t) :=
 nth (Z.to_nat i) xs veczero.
Definition StructPredfloat32x4_t (p:Z) (v:Recordfloat32x4_t) : Assertion :=
 (&(p # "float32x4_t" ->ₛ "s0")) # Float |-> f0 v **
 (&(p # "float32x4_t" ->ₛ "s1")) # Float |-> f1 v **
 (&(p # "float32x4_t" ->ₛ "s2")) # Float |-> f2 v **
 (&(p # "float32x4_t" ->ₛ "s3")) # Float |-> f3 v.
Definition UndefStructPredfloat32x4_t (p:Z) : Assertion :=
 (&(p # "float32x4_t" ->ₛ "s0")) # Float |->_ **
 (&(p # "float32x4_t" ->ₛ "s1")) # Float |->_ **
 (&(p # "float32x4_t" ->ₛ "s2")) # Float |->_ **
 (&(p # "float32x4_t" ->ₛ "s3")) # Float |->_ .
Module Structfloat32x4_tArray.
 Fixpoint cells (p:Z) (xs:list Recordfloat32x4_t) : Assertion :=
 match xs with
 | [] => emp
 | x::rest => StructPredfloat32x4_t p x ** cells (p+sizeof("float32x4_t")) rest
 end.
 Fixpoint undef_cells (p:Z) (n:nat) : Assertion :=
 match n with
 | O => emp
 | S n => UndefStructPredfloat32x4_t p ** undef_cells (p+sizeof("float32x4_t")) n
 end.
 Definition full (p n:Z) (xs:list Recordfloat32x4_t) : Assertion :=
 “ n=Zlength xs ” && cells p xs.
 Definition undef_full (p n:Z) : Assertion :=
 “ 0<=n ” && undef_cells p (Z.to_nat n).
End Structfloat32x4_tArray.
Definition StructPredfloat32x4x2_t (p:Z) (v:Recordfloat32x4x2_t) : Assertion :=
 Structfloat32x4_tArray.full (&(p # "float32x4x2_t" ->ₛ "val")) 2 (tuple_values v).
Definition UndefStructPredfloat32x4x2_t (p:Z) : Assertion :=
 Structfloat32x4_tArray.undef_full (&(p # "float32x4x2_t" ->ₛ "val")) 2.

Lemma vector_forget : forall p v,
 StructPredfloat32x4_t p v |-- UndefStructPredfloat32x4_t p.
Proof.
 intros;unfold StructPredfloat32x4_t,UndefStructPredfloat32x4_t.
 repeat sep_apply store_float_undef_store_float;cancel.
Qed.
Lemma tuple_full_two : forall p xs,
 Structfloat32x4_tArray.full p 2 xs |--
 StructPredfloat32x4_t p (tuple_at 0 xs) **
 StructPredfloat32x4_t (p+sizeof("float32x4_t")) (tuple_at 1 xs).
Proof.
 intros p xs;unfold Structfloat32x4_tArray.full;Intros.
 destruct xs as[|x [|y rest]];rewrite ?Zlength_cons,?Zlength_nil in H;try lia.
 assert(Hr:Zlength rest=0)by lia;apply Zlength_nil_inv in Hr;subst rest.
 cbn [tuple_at Z.to_nat nth Structfloat32x4_tArray.cells];entailer!.
Qed.
Lemma tuple_undef_two : forall p,
 Structfloat32x4_tArray.undef_full p 2 --||--
 UndefStructPredfloat32x4_t p ** UndefStructPredfloat32x4_t(p+sizeof("float32x4_t")).
Proof.
 intros p.
 change ((“ (0<=2) ” &&
 (UndefStructPredfloat32x4_t p **
 (UndefStructPredfloat32x4_t (p+sizeof("float32x4_t")) ** emp))) --||--
 (UndefStructPredfloat32x4_t p ** UndefStructPredfloat32x4_t(p+sizeof("float32x4_t")))).
 split;entailer!;lia.
Qed.
Lemma tuple_forget : forall p xs,
 Structfloat32x4_tArray.full p 2 xs |-- Structfloat32x4_tArray.undef_full p 2.
Proof.
 intros;sep_apply tuple_full_two;rewrite tuple_undef_two.
 sep_apply vector_forget;sep_apply vector_forget;cancel.
Qed.
Print Assumptions vector_forget.
Print Assumptions tuple_full_two.
Print Assumptions tuple_undef_two.
Print Assumptions tuple_forget.

(** Same QCP address congruence used by verified F32 GEMM CopyFacts. *)
Lemma tuple_local_field_address : forall (v t f:string),
 eval_addr_expr (RE_addr_of (LE_arrow_field
  (RE_const (eval_addr_expr (RE_addr_of (LE_var v))) (FET_alias t)) f)) =
 eval_addr_expr (RE_addr_of (LE_arrow_field (RE_addr_of (LE_var v)) f)).
Proof.
 intros. apply eval_addr_expr_congr. apply RE_addr_of_congr.
 apply LE_arrow_field_congr; [apply eval_addr | reflexivity].
Qed.
Print Assumptions tuple_local_field_address.
