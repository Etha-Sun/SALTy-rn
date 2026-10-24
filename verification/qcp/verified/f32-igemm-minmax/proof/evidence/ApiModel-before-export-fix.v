From Coq Require Import ZArith.
From FloatIndirect Require Export PublicModel.
From GemmRvv Require Export Model SLBounds.
From GemmNeon Require Export KernelModel LayoutModel.
Local Open Scope Z_scope.
Definition active_value (vl lane:Z)(actual expected:fp32):Prop := lane<vl -> actual=expected.
Definition active_mask (vl lane actual expected:Z):Prop := lane<vl -> actual=expected.
Definition active8 (vl:Z) (z0 z1 z2 z3 z4 z5 z6 z7 e0 e1 e2 e3 e4 e5 e6 e7:fp32) : Prop :=
 active_value vl 0 z0 e0 /\
 active_value vl 1 z1 e1 /\
 active_value vl 2 z2 e2 /\
 active_value vl 3 z3 e3 /\
 active_value vl 4 z4 e4 /\
 active_value vl 5 z5 e5 /\
 active_value vl 6 z6 e6 /\
 active_value vl 7 z7 e7.
Lemma active8_expand : forall vl (z0 z1 z2 z3 z4 z5 z6 z7 e0 e1 e2 e3 e4 e5 e6 e7:fp32),
 active8 vl z0 z1 z2 z3 z4 z5 z6 z7 e0 e1 e2 e3 e4 e5 e6 e7 <->
 (active_value vl 0 z0 e0 /\
 active_value vl 1 z1 e1 /\
 active_value vl 2 z2 e2 /\
 active_value vl 3 z3 e3 /\
 active_value vl 4 z4 e4 /\
 active_value vl 5 z5 e5 /\
 active_value vl 6 z6 e6 /\
 active_value vl 7 z7 e7).
Proof. reflexivity. Qed.
Print Assumptions active8_expand.
Definition mask8 (vl:Z) (z0 z1 z2 z3 z4 z5 z6 z7 e0 e1 e2 e3 e4 e5 e6 e7:Z) : Prop :=
 active_mask vl 0 z0 e0 /\
 active_mask vl 1 z1 e1 /\
 active_mask vl 2 z2 e2 /\
 active_mask vl 3 z3 e3 /\
 active_mask vl 4 z4 e4 /\
 active_mask vl 5 z5 e5 /\
 active_mask vl 6 z6 e6 /\
 active_mask vl 7 z7 e7.
Lemma mask8_expand : forall vl (z0 z1 z2 z3 z4 z5 z6 z7 e0 e1 e2 e3 e4 e5 e6 e7:Z),
 mask8 vl z0 z1 z2 z3 z4 z5 z6 z7 e0 e1 e2 e3 e4 e5 e6 e7 <->
 (active_mask vl 0 z0 e0 /\
 active_mask vl 1 z1 e1 /\
 active_mask vl 2 z2 e2 /\
 active_mask vl 3 z3 e3 /\
 active_mask vl 4 z4 e4 /\
 active_mask vl 5 z5 e5 /\
 active_mask vl 6 z6 e6 /\
 active_mask vl 7 z7 e7).
Proof. reflexivity. Qed.
Print Assumptions mask8_expand.
