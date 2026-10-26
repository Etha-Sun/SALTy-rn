From Coq Require Import ZArith.
From ExpMinusMax Require Export IntrinsicModel BorrowedMemory.
Local Open Scope Z_scope.
Definition em_rvv_dup_p(x:fp32)(vl:Z)(r:Recordvfloat32m4_t):Prop:=em_rvv_active_float vl r(fun _=>x).
Definition em_rvv_load_p(F:EMMap)(p vl:Z)(r:Recordvfloat32m4_t):Prop:=em_rvv_active_float vl r(fun j=>em_get F(p+4*j)).
Definition em_rvv_sub_p(a:Recordvfloat32m4_t)(x:fp32)(vl:Z)(r:Recordvfloat32m4_t):Prop:=em_rvv_active_float vl r(fun j=>em_rvv_sub(em_get_vfloat32m4_t a j)x).
Definition em_rvv_mac_vf_p(a:Recordvfloat32m4_t)(x:fp32)(b:Recordvfloat32m4_t)(vl:Z)(r:Recordvfloat32m4_t):Prop:=em_rvv_active_float vl r(fun j=>em_rvv_fma(em_get_vfloat32m4_t a j)x(em_get_vfloat32m4_t b j)).
Definition em_rvv_mad_vf_p(a:Recordvfloat32m4_t)(x:fp32)(b:Recordvfloat32m4_t)(vl:Z)(r:Recordvfloat32m4_t):Prop:=em_rvv_active_float vl r(fun j=>em_rvv_fma(em_get_vfloat32m4_t b j)(em_get_vfloat32m4_t a j)x).
Definition em_rvv_mac_vv_p(a b c:Recordvfloat32m4_t)(vl:Z)(r:Recordvfloat32m4_t):Prop:=em_rvv_active_float vl r(fun j=>em_rvv_fma(em_get_vfloat32m4_t a j)(em_get_vfloat32m4_t b j)(em_get_vfloat32m4_t c j)).
Definition em_rvv_mul_p(a b:Recordvfloat32m4_t)(vl:Z)(r:Recordvfloat32m4_t):Prop:=em_rvv_active_float vl r(fun j=>em_rvv_mul(em_get_vfloat32m4_t a j)(em_get_vfloat32m4_t b j)).
Definition em_rvv_mask_p(a:Recordvfloat32m4_t)(x:fp32)(vl:Z)(r:Recordvbool8_t):Prop:=em_rvv_active_mask vl r(fun j=>if Z.eqb(em_clt(em_get_vfloat32m4_t a j)x)0 then 0 else 1).
Definition em_rvv_merge_p(a:Recordvfloat32m4_t)(x:fp32)(m:Recordvbool8_t)(vl:Z)(r:Recordvfloat32m4_t):Prop:=em_rvv_active_float vl r(fun j=>if Z.eqb(em_get_vbool8_t m j)0 then em_get_vfloat32m4_t a j else x).
Definition em_rvv_add_tu(a b:Recordvfloat32m4_t)(vl:Z):Recordvfloat32m4_t:=em_make_vfloat32m4_t(fun j=>if Z.ltb j vl then em_rvv_add(em_get_vfloat32m4_t a j)(em_get_vfloat32m4_t b j)else em_get_vfloat32m4_t a j).
Definition em_rvv_slide_p(a:Recordvfloat32m4_t)(offset vl:Z)(r:Recordvfloat32m4_t):Prop:=em_rvv_active_float vl r(em_rvv_slide_lane a offset).
Definition em_rvv_reint_f_i(a:Recordvfloat32m4_t):Recordvint32m4_t:=em_make_vint32m4_t(fun j=>em_int_from_float(em_get_vfloat32m4_t a j)).
Definition em_rvv_reint_i_f(a:Recordvint32m4_t):Recordvfloat32m4_t:=em_make_vfloat32m4_t(fun j=>em_float_from_int(em_get_vint32m4_t a j)).
Definition em_rvv_shift_p(a:Recordvint32m4_t)(offset vl:Z)(r:Recordvint32m4_t):Prop:=em_rvv_active_int vl r(fun j=>em_shift_i32(em_get_vint32m4_t a j)(Z.land offset 31)).
Definition em_rvv_write(O:EMOutput)(p vl:Z)(a:Recordvfloat32m4_t):EMOutput:=em_output_write O p vl(em_get_vfloat32m4_t a).
