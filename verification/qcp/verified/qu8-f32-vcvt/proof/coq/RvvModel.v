From Coq Require Import ZArith Lia.
From Qu8Cvt Require Export Types.
Local Open Scope Z_scope.
Definition cvt_vl(n:Z):Z := Z.min n 32.
Definition cvt_active_int(i vl x:Z):Z := if Z.ltb i vl then x else 0.
Definition cvt_active_sub16(i vl a b:Z):Z := if Z.ltb i vl then cvt_sub16 a b else 0.
Definition cvt_active_float(i vl x:Z):fp32 := if Z.ltb i vl then Z_to_fp32 x else Z_to_fp32 0.
Definition cvt_active_mul(i vl:Z)(a scale:fp32):fp32 := if Z.ltb i vl then fp32_mul a scale else Z_to_fp32 0.
Lemma cvt_vl_bounds : forall n,0<=n -> 0<=cvt_vl n<=32 /\ cvt_vl n<=n /\ (0<n -> 0<cvt_vl n).
Proof. intros n H;unfold cvt_vl;destruct(Z_le_dec n 32);[rewrite Z.min_l|rewrite Z.min_r];lia. Qed.
Lemma cvt_active_int_range : forall i vl x,-32768<=x<=32767 -> -32768<=cvt_active_int i vl x<=32767.
Proof. intros;unfold cvt_active_int;destruct(Z.ltb i vl);lia. Qed.
Lemma cvt_active_sub16_range : forall i vl a b,-32768<=cvt_active_sub16 i vl a b<=32767.
Proof. intros;unfold cvt_active_sub16;pose proof(cvt_sub16_range a b);destruct(Z.ltb i vl);lia. Qed.
Print Assumptions cvt_vl_bounds.
Print Assumptions cvt_active_int_range.
Print Assumptions cvt_active_sub16_range.

Definition cvt_active_add_u16(i vl a b:Z):Z := if Z.ltb i vl then cvt_add_u16 a b else 0.
Lemma cvt_active_u16_range : forall i vl x,0<=x<=65535 ->0<=cvt_active_int i vl x<=65535.
Proof. intros;unfold cvt_active_int;destruct(Z.ltb i vl);lia. Qed.
Lemma cvt_active_add_u16_range : forall i vl a b,0<=cvt_active_add_u16 i vl a b<=65535.
Proof. intros;unfold cvt_active_add_u16,cvt_add_u16;pose proof(cvt_u16_range(a+b));destruct(Z.ltb i vl);lia. Qed.
