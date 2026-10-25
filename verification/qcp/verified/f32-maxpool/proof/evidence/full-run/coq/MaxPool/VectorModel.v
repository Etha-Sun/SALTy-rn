From Coq Require Import ZArith Bool.
From MaxPool Require Export Model.
Local Open Scope Z_scope.
Definition mp_land:=Z.land.
Definition mp_lor:=Z.lor.
Definition mp_arm_max:=mp_arm false.
Definition mp_arm_min:=mp_arm true.
Definition mp_rvv_max:=mp_rvv false.
Definition mp_rvv_min:=mp_rvv true.
Definition mp_fmatch(j vl:Z)(actual expected:fp32):Prop:=j<vl->actual=expected.
Definition mp_zmatch(j vl actual expected:Z):Prop:=j<vl->actual=expected.
Definition mp_bit_gt(a b:Z):Z:=if Z.ltb b a then 1 else 0.
Definition mp_bit_eq(a b:Z):Z:=if Z.eqb a b then 1 else 0.
Definition mp_mask_and(a b:Z):Z:=if andb(negb(Z.eqb a 0))(negb(Z.eqb b 0))then 1 else 0.
Definition mp_float_merge(a b:fp32)(m:Z):fp32:=if Z.eqb m 0 then a else b.
Definition mp_restore_float(a b numeric:fp32):fp32:=
 fp32_of_bits(mp_restore_bits(bits_of_fp32 a)(bits_of_fp32 b)(bits_of_fp32 numeric)).
