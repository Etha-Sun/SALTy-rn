From Coq Require Import ZArith Lia.
From Qs8Lrelu Require Export Types ScalarFacts.
Local Open Scope Z_scope.
Definition qcv_vl(n:Z):Z := Z.min n 32.
Definition qcv_active_sext(i vl x:Z):Z := if Z.ltb i vl then x else 0.
Definition qcv_active_rsub(i vl a b:Z):Z := if Z.ltb i vl then qcv_s16(b-a) else 0.
Definition qcv_active_shl7(i vl a:Z):Z := if Z.ltb i vl then qcv_shl7 a else 0.
Definition qcv_active_mul(i vl a b:Z):Z := if Z.ltb i vl then qcv_rvv_mul a b else 0.
Definition qcv_active_clip15(i vl a:Z):Z := if Z.ltb i vl then qcv_rvv_clip15 a else 0.
Definition qcv_active_add(i vl a b:Z):Z := if Z.ltb i vl then qcv_rvv_add a b else 0.
Definition qcv_active_clip8(i vl a:Z):Z := if Z.ltb i vl then qcv_sat8 a else 0.
Lemma qcv_vl_bounds : forall n,0<=n -> 0<=qcv_vl n<=32 /\ qcv_vl n<=n /\ (0<n -> 0<qcv_vl n).
Proof. intros n H;unfold qcv_vl;destruct(Z_le_dec n 32);[rewrite Z.min_l|rewrite Z.min_r];lia. Qed.
