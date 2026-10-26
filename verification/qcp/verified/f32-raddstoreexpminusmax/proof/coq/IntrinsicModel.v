From Coq Require Import ZArith List.
From ExpMinusMax Require Export VectorRecords SignedWord AccumulatorModel.
Local Open Scope Z_scope.
Definition em_same(a b:fp32):Prop:=a=b.
Definition em_neon_add(a b:Recordfloat32x4_t):Recordfloat32x4_t:=em_make_float32x4_t(fun j=>em_arm_add(em_get_float32x4_t a j)(em_get_float32x4_t b j)).
Definition em_neon_sub(a b:Recordfloat32x4_t):Recordfloat32x4_t:=em_make_float32x4_t(fun j=>em_arm_sub(em_get_float32x4_t a j)(em_get_float32x4_t b j)).
Definition em_neon_mul(a b:Recordfloat32x4_t):Recordfloat32x4_t:=em_make_float32x4_t(fun j=>em_arm_mul(em_get_float32x4_t a j)(em_get_float32x4_t b j)).
Definition em_neon_dup(x:fp32):Recordfloat32x4_t:=em_make_float32x4_t(fun _=>x).
Definition em_neon_fma(a b c:Recordfloat32x4_t):Recordfloat32x4_t:=em_make_float32x4_t(fun j=>em_arm_fma(em_get_float32x4_t a j)(em_get_float32x4_t b j)(em_get_float32x4_t c j)).
Definition em_neon_clt(a b:Recordfloat32x4_t):Recorduint32x4_t:=em_make_uint32x4_t(fun j=>em_clt(em_get_float32x4_t a j)(em_get_float32x4_t b j)).
Definition em_neon_bic(a b:Recorduint32x4_t):Recorduint32x4_t:=em_make_uint32x4_t(fun j=>Z.land(em_get_uint32x4_t a j)(Z.lxor 4294967295(em_get_uint32x4_t b j))).
Definition em_neon_reint_f_i(a:Recordfloat32x4_t):Recordint32x4_t:=em_make_int32x4_t(fun j=>em_int_from_float(em_get_float32x4_t a j)).
Definition em_neon_reint_i_f(a:Recordint32x4_t):Recordfloat32x4_t:=em_make_float32x4_t(fun j=>em_float_from_int(em_get_int32x4_t a j)).
Definition em_neon_reint_f_u(a:Recordfloat32x4_t):Recorduint32x4_t:=em_make_uint32x4_t(fun j=>bits_of_fp32(em_get_float32x4_t a j)).
Definition em_neon_reint_u_f(a:Recorduint32x4_t):Recordfloat32x4_t:=em_make_float32x4_t(fun j=>fp32_of_bits(unsigned_last_nbits(em_get_uint32x4_t a j)32)).
Definition em_neon_slli(a:Recordint32x4_t)(n:Z):Recordint32x4_t:=em_make_int32x4_t(fun j=>em_shift_i32(em_get_int32x4_t a j)n).
Definition em_neon_low(a:Recordfloat32x4_t):Recordfloat32x2_t:=em_make_float32x2_t(fun j=>em_get_float32x4_t a j).
Definition em_neon_high(a:Recordfloat32x4_t):Recordfloat32x2_t:=em_make_float32x2_t(fun j=>em_get_float32x4_t a(j+2)).
Definition em_neon_reduce4(a:Recordfloat32x4_t):fp32:=em_arm_add(em_arm_add(em_get_float32x4_t a 0)(em_get_float32x4_t a 1))(em_arm_add(em_get_float32x4_t a 2)(em_get_float32x4_t a 3)).
Definition em_neon_reduce2(a:Recordfloat32x2_t):fp32:=em_arm_add(em_get_float32x2_t a 0)(em_get_float32x2_t a 1).
(* All legal vsetvl choices at VLEN=128, SEW=32, LMUL=4, VLMAX=16. *)
Definition em_legal_vl(avl vl:Z):Prop:=0<=avl /\ (if Z.leb avl 16 then vl=avl else if Z.ltb avl 32 then (avl+1)/2<=vl<=16 else vl=16).
Definition em_rvv_active_float(vl:Z)(r:Recordvfloat32m4_t)(f:Z->fp32):Prop:=forall j,0<=j<vl->em_get_vfloat32m4_t r j=f j.
Definition em_rvv_active_int(vl:Z)(r:Recordvint32m4_t)(f:Z->Z):Prop:=forall j,0<=j<vl->em_get_vint32m4_t r j=f j.
Definition em_rvv_active_mask(vl:Z)(r:Recordvbool8_t)(f:Z->Z):Prop:=forall j,0<=j<vl->em_get_vbool8_t r j=f j.
Definition em_rvv_tail_undisturbed(vl:Z)(r old:Recordvfloat32m4_t):Prop:=forall j,vl<=j<16->em_get_vfloat32m4_t r j=em_get_vfloat32m4_t old j.
Definition em_rvv_slide_lane(a:Recordvfloat32m4_t)(offset j:Z):fp32:=if Z.ltb(j+offset)16 then em_get_vfloat32m4_t a(j+offset)else fp32_zero.
