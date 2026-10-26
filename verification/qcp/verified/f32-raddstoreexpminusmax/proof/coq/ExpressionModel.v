From Coq Require Import ZArith.
From ExpMinusMax Require Export Constants Observation FmaComm.
Local Open Scope Z_scope.
Definition em_power(vn:fp32):fp32:=
 fp32_of_bits(unsigned_last_nbits(Z.shiftl(bits_of_fp32 vn)23)32).
Definition em_clt(x y:fp32):Z:=
 match fp32_compare x y with Some Lt=>4294967295|_=>0 end.
Definition em_bic(x:fp32)(mask:Z):fp32:=
 fp32_of_bits(Z.land(bits_of_fp32 x)(Z.lxor 4294967295 mask)).
Definition em_arm_polynomial(vx vn vs:fp32):fp32:=
 let vn:=em_arm_sub vn em_magic_bias in
 let vt:=em_arm_fma vx vn em_minus_ln2 in
 let vp:=em_arm_fma em_c4 em_c5 vt in
 let vp:=em_arm_fma em_c3 vp vt in
 let vp:=em_arm_fma em_c2 vp vt in
 let vp:=em_arm_fma em_c1 vp vt in
 let vt:=em_arm_mul vt vs in
 em_arm_fma vs vp vt.
Definition em_rvv_polynomial(vx vn vs:fp32):fp32:=
 let vn:=em_rvv_sub vn em_magic_bias in
 let vt:=em_rvv_fma vx vn em_minus_ln2 in
 let vp:=em_rvv_fma em_c4 em_c5 vt in
 let vp:=em_rvv_fma em_c3 vp vt in
 let vp:=em_rvv_fma em_c2 vp vt in
 let vp:=em_rvv_fma em_c1 vp vt in
 let vt:=em_rvv_mul vt vs in
 em_rvv_fma vs vp vt.
Definition em_arm_value(x maximum:fp32):fp32:=
 let vx:=em_arm_sub x maximum in
 let vn:=em_arm_fma em_magic_bias vx em_log2e in
 let vf:=em_arm_polynomial vx vn(em_power vn)in
 em_bic vf(em_clt vx em_denorm_cutoff).
Definition em_rvv_value(x maximum:fp32):fp32:=
 let vx:=em_rvv_sub x maximum in
 let vn:=em_rvv_fma em_magic_bias em_log2e vx in
 let vf:=em_rvv_polynomial vx vn(em_power vn)in
 if Z.eqb(em_clt vx em_denorm_cutoff)0 then vf else fp32_zero.
