From Coq Require Import ZArith List String Lia.
From SpmmSpec Require Export Model TupleMemory.
Import ListNotations Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope string_scope.
Local Open Scope sac.
Definition spmm_get (i:Z)(xs:list fp32) := fp_at xs i.
Definition spmm_nanth (x:fp32):Z := if Binary.is_nan 24 128 x then 1 else 0.
Definition spmm_merge (x scalar:fp32)(m:Z) := if Z.eqb m 0 then x else scalar.
Definition spmm_active_value (vl lane:Z)(actual expected:fp32):Prop := lane<vl -> bit_same actual expected.
Definition spmm_active_mask (vl lane actual expected:Z):Prop := lane<vl -> actual=expected.
Definition spmm_vl_allowed (n vl:Z):Prop :=
 0<=vl<=32 /\ (n<=32 -> vl=n) /\
 (32<n<64 -> (n+1)/2<=vl) /\ (64<=n -> vl=32).
Lemma spmm_vl_progress : forall n vl,
 0<n -> spmm_vl_allowed n vl -> 1<=vl<=n /\ vl<=32.
Proof.
 intros n vl Hn [Hv [Hsmall [Hmid Hlarge]]].
 destruct (Z_le_dec n 32);[specialize(Hsmall l);lia|].
 destruct (Z_lt_dec n 64).
 - specialize(Hmid ltac:(lia)).
   assert(1<=(n+1)/2)by(apply Z.div_le_lower_bound;lia);lia.
 - specialize(Hlarge ltac:(lia));lia.
Qed.
Print Assumptions spmm_vl_progress.
Definition spmm_active32 (vl:Z) (z0 z1 z2 z3 z4 z5 z6 z7 z8 z9 z10 z11 z12 z13 z14 z15 z16 z17 z18 z19 z20 z21 z22 z23 z24 z25 z26 z27 z28 z29 z30 z31 e0 e1 e2 e3 e4 e5 e6 e7 e8 e9 e10 e11 e12 e13 e14 e15 e16 e17 e18 e19 e20 e21 e22 e23 e24 e25 e26 e27 e28 e29 e30 e31:fp32):Prop :=
 spmm_active_value vl 0 z0 e0 /\
 spmm_active_value vl 1 z1 e1 /\
 spmm_active_value vl 2 z2 e2 /\
 spmm_active_value vl 3 z3 e3 /\
 spmm_active_value vl 4 z4 e4 /\
 spmm_active_value vl 5 z5 e5 /\
 spmm_active_value vl 6 z6 e6 /\
 spmm_active_value vl 7 z7 e7 /\
 spmm_active_value vl 8 z8 e8 /\
 spmm_active_value vl 9 z9 e9 /\
 spmm_active_value vl 10 z10 e10 /\
 spmm_active_value vl 11 z11 e11 /\
 spmm_active_value vl 12 z12 e12 /\
 spmm_active_value vl 13 z13 e13 /\
 spmm_active_value vl 14 z14 e14 /\
 spmm_active_value vl 15 z15 e15 /\
 spmm_active_value vl 16 z16 e16 /\
 spmm_active_value vl 17 z17 e17 /\
 spmm_active_value vl 18 z18 e18 /\
 spmm_active_value vl 19 z19 e19 /\
 spmm_active_value vl 20 z20 e20 /\
 spmm_active_value vl 21 z21 e21 /\
 spmm_active_value vl 22 z22 e22 /\
 spmm_active_value vl 23 z23 e23 /\
 spmm_active_value vl 24 z24 e24 /\
 spmm_active_value vl 25 z25 e25 /\
 spmm_active_value vl 26 z26 e26 /\
 spmm_active_value vl 27 z27 e27 /\
 spmm_active_value vl 28 z28 e28 /\
 spmm_active_value vl 29 z29 e29 /\
 spmm_active_value vl 30 z30 e30 /\
 spmm_active_value vl 31 z31 e31.
Definition spmm_mask32 (vl:Z) (z0 z1 z2 z3 z4 z5 z6 z7 z8 z9 z10 z11 z12 z13 z14 z15 z16 z17 z18 z19 z20 z21 z22 z23 z24 z25 z26 z27 z28 z29 z30 z31 e0 e1 e2 e3 e4 e5 e6 e7 e8 e9 e10 e11 e12 e13 e14 e15 e16 e17 e18 e19 e20 e21 e22 e23 e24 e25 e26 e27 e28 e29 e30 e31:Z):Prop :=
 spmm_active_mask vl 0 z0 e0 /\
 spmm_active_mask vl 1 z1 e1 /\
 spmm_active_mask vl 2 z2 e2 /\
 spmm_active_mask vl 3 z3 e3 /\
 spmm_active_mask vl 4 z4 e4 /\
 spmm_active_mask vl 5 z5 e5 /\
 spmm_active_mask vl 6 z6 e6 /\
 spmm_active_mask vl 7 z7 e7 /\
 spmm_active_mask vl 8 z8 e8 /\
 spmm_active_mask vl 9 z9 e9 /\
 spmm_active_mask vl 10 z10 e10 /\
 spmm_active_mask vl 11 z11 e11 /\
 spmm_active_mask vl 12 z12 e12 /\
 spmm_active_mask vl 13 z13 e13 /\
 spmm_active_mask vl 14 z14 e14 /\
 spmm_active_mask vl 15 z15 e15 /\
 spmm_active_mask vl 16 z16 e16 /\
 spmm_active_mask vl 17 z17 e17 /\
 spmm_active_mask vl 18 z18 e18 /\
 spmm_active_mask vl 19 z19 e19 /\
 spmm_active_mask vl 20 z20 e20 /\
 spmm_active_mask vl 21 z21 e21 /\
 spmm_active_mask vl 22 z22 e22 /\
 spmm_active_mask vl 23 z23 e23 /\
 spmm_active_mask vl 24 z24 e24 /\
 spmm_active_mask vl 25 z25 e25 /\
 spmm_active_mask vl 26 z26 e26 /\
 spmm_active_mask vl 27 z27 e27 /\
 spmm_active_mask vl 28 z28 e28 /\
 spmm_active_mask vl 29 z29 e29 /\
 spmm_active_mask vl 30 z30 e30 /\
 spmm_active_mask vl 31 z31 e31.
Definition UndefStructPredfloat32x2_t (p:Z):Assertion :=
 (&(p # "float32x2_t" ->ₛ "s0")) # Float |->_ **
 (&(p # "float32x2_t" ->ₛ "s1")) # Float |->_.
Definition UndefStructPredvfloat32m8_t (p:Z):Assertion :=
 (&(p # "vfloat32m8_t" ->ₛ "s0")) # Float |->_ **
 (&(p # "vfloat32m8_t" ->ₛ "s1")) # Float |->_ **
 (&(p # "vfloat32m8_t" ->ₛ "s2")) # Float |->_ **
 (&(p # "vfloat32m8_t" ->ₛ "s3")) # Float |->_ **
 (&(p # "vfloat32m8_t" ->ₛ "s4")) # Float |->_ **
 (&(p # "vfloat32m8_t" ->ₛ "s5")) # Float |->_ **
 (&(p # "vfloat32m8_t" ->ₛ "s6")) # Float |->_ **
 (&(p # "vfloat32m8_t" ->ₛ "s7")) # Float |->_ **
 (&(p # "vfloat32m8_t" ->ₛ "s8")) # Float |->_ **
 (&(p # "vfloat32m8_t" ->ₛ "s9")) # Float |->_ **
 (&(p # "vfloat32m8_t" ->ₛ "s10")) # Float |->_ **
 (&(p # "vfloat32m8_t" ->ₛ "s11")) # Float |->_ **
 (&(p # "vfloat32m8_t" ->ₛ "s12")) # Float |->_ **
 (&(p # "vfloat32m8_t" ->ₛ "s13")) # Float |->_ **
 (&(p # "vfloat32m8_t" ->ₛ "s14")) # Float |->_ **
 (&(p # "vfloat32m8_t" ->ₛ "s15")) # Float |->_ **
 (&(p # "vfloat32m8_t" ->ₛ "s16")) # Float |->_ **
 (&(p # "vfloat32m8_t" ->ₛ "s17")) # Float |->_ **
 (&(p # "vfloat32m8_t" ->ₛ "s18")) # Float |->_ **
 (&(p # "vfloat32m8_t" ->ₛ "s19")) # Float |->_ **
 (&(p # "vfloat32m8_t" ->ₛ "s20")) # Float |->_ **
 (&(p # "vfloat32m8_t" ->ₛ "s21")) # Float |->_ **
 (&(p # "vfloat32m8_t" ->ₛ "s22")) # Float |->_ **
 (&(p # "vfloat32m8_t" ->ₛ "s23")) # Float |->_ **
 (&(p # "vfloat32m8_t" ->ₛ "s24")) # Float |->_ **
 (&(p # "vfloat32m8_t" ->ₛ "s25")) # Float |->_ **
 (&(p # "vfloat32m8_t" ->ₛ "s26")) # Float |->_ **
 (&(p # "vfloat32m8_t" ->ₛ "s27")) # Float |->_ **
 (&(p # "vfloat32m8_t" ->ₛ "s28")) # Float |->_ **
 (&(p # "vfloat32m8_t" ->ₛ "s29")) # Float |->_ **
 (&(p # "vfloat32m8_t" ->ₛ "s30")) # Float |->_ **
 (&(p # "vfloat32m8_t" ->ₛ "s31")) # Float |->_.
Definition UndefStructPredvbool4_t (p:Z):Assertion :=
 (&(p # "vbool4_t" ->ₛ "s0")) # Int |->_ **
 (&(p # "vbool4_t" ->ₛ "s1")) # Int |->_ **
 (&(p # "vbool4_t" ->ₛ "s2")) # Int |->_ **
 (&(p # "vbool4_t" ->ₛ "s3")) # Int |->_ **
 (&(p # "vbool4_t" ->ₛ "s4")) # Int |->_ **
 (&(p # "vbool4_t" ->ₛ "s5")) # Int |->_ **
 (&(p # "vbool4_t" ->ₛ "s6")) # Int |->_ **
 (&(p # "vbool4_t" ->ₛ "s7")) # Int |->_ **
 (&(p # "vbool4_t" ->ₛ "s8")) # Int |->_ **
 (&(p # "vbool4_t" ->ₛ "s9")) # Int |->_ **
 (&(p # "vbool4_t" ->ₛ "s10")) # Int |->_ **
 (&(p # "vbool4_t" ->ₛ "s11")) # Int |->_ **
 (&(p # "vbool4_t" ->ₛ "s12")) # Int |->_ **
 (&(p # "vbool4_t" ->ₛ "s13")) # Int |->_ **
 (&(p # "vbool4_t" ->ₛ "s14")) # Int |->_ **
 (&(p # "vbool4_t" ->ₛ "s15")) # Int |->_ **
 (&(p # "vbool4_t" ->ₛ "s16")) # Int |->_ **
 (&(p # "vbool4_t" ->ₛ "s17")) # Int |->_ **
 (&(p # "vbool4_t" ->ₛ "s18")) # Int |->_ **
 (&(p # "vbool4_t" ->ₛ "s19")) # Int |->_ **
 (&(p # "vbool4_t" ->ₛ "s20")) # Int |->_ **
 (&(p # "vbool4_t" ->ₛ "s21")) # Int |->_ **
 (&(p # "vbool4_t" ->ₛ "s22")) # Int |->_ **
 (&(p # "vbool4_t" ->ₛ "s23")) # Int |->_ **
 (&(p # "vbool4_t" ->ₛ "s24")) # Int |->_ **
 (&(p # "vbool4_t" ->ₛ "s25")) # Int |->_ **
 (&(p # "vbool4_t" ->ₛ "s26")) # Int |->_ **
 (&(p # "vbool4_t" ->ₛ "s27")) # Int |->_ **
 (&(p # "vbool4_t" ->ₛ "s28")) # Int |->_ **
 (&(p # "vbool4_t" ->ₛ "s29")) # Int |->_ **
 (&(p # "vbool4_t" ->ₛ "s30")) # Int |->_ **
 (&(p # "vbool4_t" ->ₛ "s31")) # Int |->_.
