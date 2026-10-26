From Coq Require Import ZArith.
From ExpMinusMax Require Export ProgramModel IntrinsicModel.
Local Open Scope Z_scope.
Definition em_acc_record(a:EMAcc):Recordfloat32x4_t:=make_record_float32x4_t(em_acc0 a)(em_acc1 a)(em_acc2 a)(em_acc3 a).
Definition em_arm_acc_record(F:EMMap)(input maximum groups:Z):Recordfloat32x4_t:=
 em_acc_record(em_arm_accumulate(Z.to_nat groups)(em_input F input)(em_get F maximum)em_acc_zero 0).
Definition em_arm_output_prefix(F:EMMap)(input maximum output done:Z)(O:EMOutput):EMOutput:=
 em_output_write O output done(fun j=>em_arm_value(em_get F(input+4*j))(em_get F maximum)).
Definition em_rvv_output_prefix(F:EMMap)(input maximum output done:Z)(O:EMOutput):EMOutput:=
 em_output_write O output done(fun j=>em_rvv_value(em_get F(input+4*j))(em_get F maximum)).
Definition em_same_record4(a b:Recordfloat32x4_t):Prop:=a=b.
Definition em_neon_expression(vi maximum:Recordfloat32x4_t):Recordfloat32x4_t:=
 let vx:=em_neon_sub vi maximum in
 let vn:=em_neon_fma(em_neon_dup em_magic_bias)vx(em_neon_dup em_log2e)in
 let vs:=em_neon_reint_i_f(em_neon_slli(em_neon_reint_f_i vn)23)in
 let vn:=em_neon_sub vn(em_neon_dup em_magic_bias)in
 let vt:=em_neon_fma vx vn(em_neon_dup em_minus_ln2)in
 let vp:=em_neon_fma(em_neon_dup em_c4)(em_neon_dup em_c5)vt in
 let vp:=em_neon_fma(em_neon_dup em_c3)vp vt in
 let vp:=em_neon_fma(em_neon_dup em_c2)vp vt in
 let vp:=em_neon_fma(em_neon_dup em_c1)vp vt in
 let vt:=em_neon_mul vt vs in
 let vf:=em_neon_fma vs vp vt in
 em_neon_reint_u_f(em_neon_bic(em_neon_reint_f_u vf)(em_neon_clt vx(em_neon_dup em_denorm_cutoff))).
