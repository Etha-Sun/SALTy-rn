#include "../contracts/model.h"
/*@ Import Coq Require Import Qd8API.ApiModel Qd8API.Layouts Qd8Rvv.RvvModel */
/*@ Extern Coq (qd8_selected_f:Z -> Z -> fp32 -> fp32) (qd8_selected_z:Z -> Z -> Z -> Z) */
/*@ Extern Coq
 (qd8_zget:Z -> list Z -> Z) (qd8_fget:Z -> list fp32 -> fp32)
 (qd8_wrap_signed:Z -> Z) (qd8_mac_signed:Z -> Z -> Z -> Z)
 (qd8_ks:Z -> Z -> list panel_data -> Z)
 (qd8_float_field:Z -> Z -> Z -> list panel_data -> fp32)
 (qd8_char_field:Z -> Z -> Z -> Z -> list Z -> list panel_data -> Z)
 (qd8_i8_address_ok:Z -> Z -> Z -> Z -> Z -> Z -> Z -> list panel_data -> Prop)
 (qd8_matrix_wf:Z -> list panel_data -> Prop)
 (qd8_i16_lane:Z -> Z -> Z -> Z -> Z -> Z)
 (qd8_f32_lane:Z -> fp32 -> fp32 -> fp32)
 (qd8_active_z:Z -> Z -> Z -> Z -> Prop)
 (qd8_active_f:Z -> Z -> fp32 -> fp32 -> Prop)
 (qd8_nan_flag:fp32 -> Z) (qd8_merge_value:fp32 -> fp32 -> Z -> fp32)
 (qd8_acc_signed:Z -> Z -> Z -> Z -> Z -> list Z -> list panel_data -> Z)
 (qd8_unclamped:Z -> Z -> Z -> Z -> list Z -> list panel_data -> fp32 -> fp32)
 (qd8_final_lane:Z -> Z -> Z -> Z -> list Z -> list panel_data -> fp32 -> fp32 -> fp32 -> fp32)
 (completed_values:Z -> Z -> Z -> list Z -> list panel_data -> fp32 -> fp32 -> fp32 -> list fp32)
 (qd8_write_state:Z -> Z -> Z -> list fp32 -> Assertion)
 (qd8_fappend:list fp32 -> list fp32 -> list fp32)
 (qd8_output_prefix:Z -> Z -> Z -> Z -> Z -> list Z -> list panel_data -> fp32 -> fp32 -> fp32 -> Assertion) */
/*@ Extern Coq (fp32_of_Z:Z -> fp32) (canonical_qnan:fp32)
 (weights:panel_data -> list Z) (panel_at:list panel_data -> Z -> panel_data) */
/*@ include strategies "copy.strategies" */
/*@ Extern Coq (UndefStructPredint8x8_t:Z -> Assertion) */
/*@ Extern Coq (UndefStructPredint16x8_t:Z -> Assertion) */
/*@ Extern Coq (UndefStructPredint16x4_t:Z -> Assertion) */
/*@ Extern Coq (UndefStructPredint32x4_t:Z -> Assertion) */
/*@ Extern Coq (UndefStructPredfloat32x4_t:Z -> Assertion) */
/*@ Extern Coq (UndefStructPredfloat32x2_t:Z -> Assertion) */
/*@ Extern Coq (UndefStructPredvint8mf2_t:Z -> Assertion) */
/*@ Extern Coq (UndefStructPredvint16m1_t:Z -> Assertion) */
/*@ Extern Coq (UndefStructPredvint32m2_t:Z -> Assertion) */
/*@ Extern Coq (UndefStructPredvfloat32m2_t:Z -> Assertion) */
/*@ Extern Coq (UndefStructPredvbool16_t:Z -> Assertion) */
vint32m2_t __riscv_vmul_vx_i32m2(vint32m2_t a,int scalar,size_t vl)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z)
 Require 1<=vl && vl<=8 && store(&(a.s0),int,x0) * store(&(a.s1),int,x1) * store(&(a.s2),int,x2) * store(&(a.s3),int,x3) * store(&(a.s4),int,x4) * store(&(a.s5),int,x5) * store(&(a.s6),int,x6) * store(&(a.s7),int,x7)
 Ensure store(&(__return.s0),int,qd8_selected_z(vl,0,qd8_wrap_signed(x0*scalar))) * store(&(__return.s1),int,qd8_selected_z(vl,1,qd8_wrap_signed(x1*scalar))) * store(&(__return.s2),int,qd8_selected_z(vl,2,qd8_wrap_signed(x2*scalar))) * store(&(__return.s3),int,qd8_selected_z(vl,3,qd8_wrap_signed(x3*scalar))) * store(&(__return.s4),int,qd8_selected_z(vl,4,qd8_wrap_signed(x4*scalar))) * store(&(__return.s5),int,qd8_selected_z(vl,5,qd8_wrap_signed(x5*scalar))) * store(&(__return.s6),int,qd8_selected_z(vl,6,qd8_wrap_signed(x6*scalar))) * store(&(__return.s7),int,qd8_selected_z(vl,7,qd8_wrap_signed(x7*scalar))) */;
vint16m1_t __riscv_vsext_vf2_i16m1(vint8mf2_t a,size_t vl)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z)
 Require 1<=vl && vl<=8 && store(&(a.s0),char,x0) * store(&(a.s1),char,x1) * store(&(a.s2),char,x2) * store(&(a.s3),char,x3) * store(&(a.s4),char,x4) * store(&(a.s5),char,x5) * store(&(a.s6),char,x6) * store(&(a.s7),char,x7)
 Ensure store(&(__return.s0),short,qd8_selected_z(vl,0,x0)) * store(&(__return.s1),short,qd8_selected_z(vl,1,x1)) * store(&(__return.s2),short,qd8_selected_z(vl,2,x2)) * store(&(__return.s3),short,qd8_selected_z(vl,3,x3)) * store(&(__return.s4),short,qd8_selected_z(vl,4,x4)) * store(&(__return.s5),short,qd8_selected_z(vl,5,x5)) * store(&(__return.s6),short,qd8_selected_z(vl,6,x6)) * store(&(__return.s7),short,qd8_selected_z(vl,7,x7)) */;
vint32m2_t __riscv_vwmacc_vx_i32m2(vint32m2_t acc,short scalar,vint16m1_t b,size_t vl)
/*@ With (z0:Z) (z1:Z) (z2:Z) (z3:Z) (z4:Z) (z5:Z) (z6:Z) (z7:Z) (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z)
 Require 1<=vl && vl<=8 && store(&(acc.s0),int,z0) * store(&(acc.s1),int,z1) * store(&(acc.s2),int,z2) * store(&(acc.s3),int,z3) * store(&(acc.s4),int,z4) * store(&(acc.s5),int,z5) * store(&(acc.s6),int,z6) * store(&(acc.s7),int,z7) * store(&(b.s0),short,x0) * store(&(b.s1),short,x1) * store(&(b.s2),short,x2) * store(&(b.s3),short,x3) * store(&(b.s4),short,x4) * store(&(b.s5),short,x5) * store(&(b.s6),short,x6) * store(&(b.s7),short,x7)
 Ensure store(&(__return.s0),int,qd8_selected_z(vl,0,qd8_mac_signed(z0,scalar,x0))) * store(&(__return.s1),int,qd8_selected_z(vl,1,qd8_mac_signed(z1,scalar,x1))) * store(&(__return.s2),int,qd8_selected_z(vl,2,qd8_mac_signed(z2,scalar,x2))) * store(&(__return.s3),int,qd8_selected_z(vl,3,qd8_mac_signed(z3,scalar,x3))) * store(&(__return.s4),int,qd8_selected_z(vl,4,qd8_mac_signed(z4,scalar,x4))) * store(&(__return.s5),int,qd8_selected_z(vl,5,qd8_mac_signed(z5,scalar,x5))) * store(&(__return.s6),int,qd8_selected_z(vl,6,qd8_mac_signed(z6,scalar,x6))) * store(&(__return.s7),int,qd8_selected_z(vl,7,qd8_mac_signed(z7,scalar,x7))) */;
vfloat32m2_t __riscv_vfcvt_f_x_v_f32m2(vint32m2_t a,size_t vl)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z)
 Require 1<=vl && vl<=8 && store(&(a.s0),int,x0) * store(&(a.s1),int,x1) * store(&(a.s2),int,x2) * store(&(a.s3),int,x3) * store(&(a.s4),int,x4) * store(&(a.s5),int,x5) * store(&(a.s6),int,x6) * store(&(a.s7),int,x7)
 Ensure store(&(__return.s0),float,qd8_selected_f(vl,0,fp32_of_Z(x0))) * store(&(__return.s1),float,qd8_selected_f(vl,1,fp32_of_Z(x1))) * store(&(__return.s2),float,qd8_selected_f(vl,2,fp32_of_Z(x2))) * store(&(__return.s3),float,qd8_selected_f(vl,3,fp32_of_Z(x3))) * store(&(__return.s4),float,qd8_selected_f(vl,4,fp32_of_Z(x4))) * store(&(__return.s5),float,qd8_selected_f(vl,5,fp32_of_Z(x5))) * store(&(__return.s6),float,qd8_selected_f(vl,6,fp32_of_Z(x6))) * store(&(__return.s7),float,qd8_selected_f(vl,7,fp32_of_Z(x7))) */;
vfloat32m2_t __riscv_vfmul_vf_f32m2(vfloat32m2_t a,float scalar,size_t vl)
/*@ With (x0:fp32) (x1:fp32) (x2:fp32) (x3:fp32) (x4:fp32) (x5:fp32) (x6:fp32) (x7:fp32)
 Require 1<=vl && vl<=8 && store(&(a.s0),float,x0) * store(&(a.s1),float,x1) * store(&(a.s2),float,x2) * store(&(a.s3),float,x3) * store(&(a.s4),float,x4) * store(&(a.s5),float,x5) * store(&(a.s6),float,x6) * store(&(a.s7),float,x7)
 Ensure store(&(__return.s0),float,qd8_selected_f(vl,0,fp32_mul(x0,scalar))) * store(&(__return.s1),float,qd8_selected_f(vl,1,fp32_mul(x1,scalar))) * store(&(__return.s2),float,qd8_selected_f(vl,2,fp32_mul(x2,scalar))) * store(&(__return.s3),float,qd8_selected_f(vl,3,fp32_mul(x3,scalar))) * store(&(__return.s4),float,qd8_selected_f(vl,4,fp32_mul(x4,scalar))) * store(&(__return.s5),float,qd8_selected_f(vl,5,fp32_mul(x5,scalar))) * store(&(__return.s6),float,qd8_selected_f(vl,6,fp32_mul(x6,scalar))) * store(&(__return.s7),float,qd8_selected_f(vl,7,fp32_mul(x7,scalar))) */;
vfloat32m2_t __riscv_vfmin_vf_f32m2(vfloat32m2_t a,float scalar,size_t vl)
/*@ With (x0:fp32) (x1:fp32) (x2:fp32) (x3:fp32) (x4:fp32) (x5:fp32) (x6:fp32) (x7:fp32)
 Require 1<=vl && vl<=8 && store(&(a.s0),float,x0) * store(&(a.s1),float,x1) * store(&(a.s2),float,x2) * store(&(a.s3),float,x3) * store(&(a.s4),float,x4) * store(&(a.s5),float,x5) * store(&(a.s6),float,x6) * store(&(a.s7),float,x7)
 Ensure store(&(__return.s0),float,qd8_selected_f(vl,0,fp32_min_number(x0,scalar))) * store(&(__return.s1),float,qd8_selected_f(vl,1,fp32_min_number(x1,scalar))) * store(&(__return.s2),float,qd8_selected_f(vl,2,fp32_min_number(x2,scalar))) * store(&(__return.s3),float,qd8_selected_f(vl,3,fp32_min_number(x3,scalar))) * store(&(__return.s4),float,qd8_selected_f(vl,4,fp32_min_number(x4,scalar))) * store(&(__return.s5),float,qd8_selected_f(vl,5,fp32_min_number(x5,scalar))) * store(&(__return.s6),float,qd8_selected_f(vl,6,fp32_min_number(x6,scalar))) * store(&(__return.s7),float,qd8_selected_f(vl,7,fp32_min_number(x7,scalar))) */;
vfloat32m2_t __riscv_vfmax_vf_f32m2(vfloat32m2_t a,float scalar,size_t vl)
/*@ With (x0:fp32) (x1:fp32) (x2:fp32) (x3:fp32) (x4:fp32) (x5:fp32) (x6:fp32) (x7:fp32)
 Require 1<=vl && vl<=8 && store(&(a.s0),float,x0) * store(&(a.s1),float,x1) * store(&(a.s2),float,x2) * store(&(a.s3),float,x3) * store(&(a.s4),float,x4) * store(&(a.s5),float,x5) * store(&(a.s6),float,x6) * store(&(a.s7),float,x7)
 Ensure store(&(__return.s0),float,qd8_selected_f(vl,0,fp32_max_number(x0,scalar))) * store(&(__return.s1),float,qd8_selected_f(vl,1,fp32_max_number(x1,scalar))) * store(&(__return.s2),float,qd8_selected_f(vl,2,fp32_max_number(x2,scalar))) * store(&(__return.s3),float,qd8_selected_f(vl,3,fp32_max_number(x3,scalar))) * store(&(__return.s4),float,qd8_selected_f(vl,4,fp32_max_number(x4,scalar))) * store(&(__return.s5),float,qd8_selected_f(vl,5,fp32_max_number(x5,scalar))) * store(&(__return.s6),float,qd8_selected_f(vl,6,fp32_max_number(x6,scalar))) * store(&(__return.s7),float,qd8_selected_f(vl,7,fp32_max_number(x7,scalar))) */;
vfloat32m2_t __riscv_vfmacc_vv_f32m2(vfloat32m2_t acc,vfloat32m2_t a,vfloat32m2_t b,size_t vl)
/*@ With (z0:fp32) (z1:fp32) (z2:fp32) (z3:fp32) (z4:fp32) (z5:fp32) (z6:fp32) (z7:fp32) (x0:fp32) (x1:fp32) (x2:fp32) (x3:fp32) (x4:fp32) (x5:fp32) (x6:fp32) (x7:fp32) (y0:fp32) (y1:fp32) (y2:fp32) (y3:fp32) (y4:fp32) (y5:fp32) (y6:fp32) (y7:fp32)
 Require 1<=vl && vl<=8 && store(&(acc.s0),float,z0) * store(&(acc.s1),float,z1) * store(&(acc.s2),float,z2) * store(&(acc.s3),float,z3) * store(&(acc.s4),float,z4) * store(&(acc.s5),float,z5) * store(&(acc.s6),float,z6) * store(&(acc.s7),float,z7) * store(&(a.s0),float,x0) * store(&(a.s1),float,x1) * store(&(a.s2),float,x2) * store(&(a.s3),float,x3) * store(&(a.s4),float,x4) * store(&(a.s5),float,x5) * store(&(a.s6),float,x6) * store(&(a.s7),float,x7) * store(&(b.s0),float,y0) * store(&(b.s1),float,y1) * store(&(b.s2),float,y2) * store(&(b.s3),float,y3) * store(&(b.s4),float,y4) * store(&(b.s5),float,y5) * store(&(b.s6),float,y6) * store(&(b.s7),float,y7)
 Ensure store(&(__return.s0),float,qd8_selected_f(vl,0,fma_rne(x0,y0,z0))) * store(&(__return.s1),float,qd8_selected_f(vl,1,fma_rne(x1,y1,z1))) * store(&(__return.s2),float,qd8_selected_f(vl,2,fma_rne(x2,y2,z2))) * store(&(__return.s3),float,qd8_selected_f(vl,3,fma_rne(x3,y3,z3))) * store(&(__return.s4),float,qd8_selected_f(vl,4,fma_rne(x4,y4,z4))) * store(&(__return.s5),float,qd8_selected_f(vl,5,fma_rne(x5,y5,z5))) * store(&(__return.s6),float,qd8_selected_f(vl,6,fma_rne(x6,y6,z6))) * store(&(__return.s7),float,qd8_selected_f(vl,7,fma_rne(x7,y7,z7))) */;
vfloat32m2_t __riscv_vfmv_v_f_f32m2(float scalar,size_t vl)
/*@ Require 1<=vl && vl<=8 && emp
 Ensure store(&(__return.s0),float,qd8_selected_f(vl,0,scalar)) * store(&(__return.s1),float,qd8_selected_f(vl,1,scalar)) * store(&(__return.s2),float,qd8_selected_f(vl,2,scalar)) * store(&(__return.s3),float,qd8_selected_f(vl,3,scalar)) * store(&(__return.s4),float,qd8_selected_f(vl,4,scalar)) * store(&(__return.s5),float,qd8_selected_f(vl,5,scalar)) * store(&(__return.s6),float,qd8_selected_f(vl,6,scalar)) * store(&(__return.s7),float,qd8_selected_f(vl,7,scalar)) */;
vfloat32m2_t __riscv_vmerge_vvm_f32m2(vfloat32m2_t a,vfloat32m2_t b,vbool16_t m,size_t vl)
/*@ With (x0:fp32) (x1:fp32) (x2:fp32) (x3:fp32) (x4:fp32) (x5:fp32) (x6:fp32) (x7:fp32) (y0:fp32) (y1:fp32) (y2:fp32) (y3:fp32) (y4:fp32) (y5:fp32) (y6:fp32) (y7:fp32) (z0:Z) (z1:Z) (z2:Z) (z3:Z) (z4:Z) (z5:Z) (z6:Z) (z7:Z)
 Require 1<=vl && vl<=8 && store(&(a.s0),float,x0) * store(&(a.s1),float,x1) * store(&(a.s2),float,x2) * store(&(a.s3),float,x3) * store(&(a.s4),float,x4) * store(&(a.s5),float,x5) * store(&(a.s6),float,x6) * store(&(a.s7),float,x7) * store(&(b.s0),float,y0) * store(&(b.s1),float,y1) * store(&(b.s2),float,y2) * store(&(b.s3),float,y3) * store(&(b.s4),float,y4) * store(&(b.s5),float,y5) * store(&(b.s6),float,y6) * store(&(b.s7),float,y7) * store(&(m.s0),int,z0) * store(&(m.s1),int,z1) * store(&(m.s2),int,z2) * store(&(m.s3),int,z3) * store(&(m.s4),int,z4) * store(&(m.s5),int,z5) * store(&(m.s6),int,z6) * store(&(m.s7),int,z7)
 Ensure store(&(__return.s0),float,qd8_selected_f(vl,0,qd8_merge_value(x0,y0,z0))) * store(&(__return.s1),float,qd8_selected_f(vl,1,qd8_merge_value(x1,y1,z1))) * store(&(__return.s2),float,qd8_selected_f(vl,2,qd8_merge_value(x2,y2,z2))) * store(&(__return.s3),float,qd8_selected_f(vl,3,qd8_merge_value(x3,y3,z3))) * store(&(__return.s4),float,qd8_selected_f(vl,4,qd8_merge_value(x4,y4,z4))) * store(&(__return.s5),float,qd8_selected_f(vl,5,qd8_merge_value(x5,y5,z5))) * store(&(__return.s6),float,qd8_selected_f(vl,6,qd8_merge_value(x6,y6,z6))) * store(&(__return.s7),float,qd8_selected_f(vl,7,qd8_merge_value(x7,y7,z7))) */;
vint32m2_t __riscv_vle32_v_i32m2(const int *p,size_t vl)
/*@ With  (K:Z) (wb:Z) (tile:Z) (j:Z) (kind:Z) (Ps:list panel_data)
 Require 1<=vl && vl<=8 && 0<K && 0<=tile && tile<Zlength(Ps) && 0<=j && j+vl<=8 && p==wb+tile*(96+8*K)+4*j && qd8_matrix_wf(K,Ps) && packed_matrix(K,wb,Ps)
 Ensure packed_matrix(K,wb,Ps) * store(&(__return.s0),int,qd8_selected_z(vl,0,qd8_ks(tile,j+0,Ps))) * store(&(__return.s1),int,qd8_selected_z(vl,1,qd8_ks(tile,j+1,Ps))) * store(&(__return.s2),int,qd8_selected_z(vl,2,qd8_ks(tile,j+2,Ps))) * store(&(__return.s3),int,qd8_selected_z(vl,3,qd8_ks(tile,j+3,Ps))) * store(&(__return.s4),int,qd8_selected_z(vl,4,qd8_ks(tile,j+4,Ps))) * store(&(__return.s5),int,qd8_selected_z(vl,5,qd8_ks(tile,j+5,Ps))) * store(&(__return.s6),int,qd8_selected_z(vl,6,qd8_ks(tile,j+6,Ps))) * store(&(__return.s7),int,qd8_selected_z(vl,7,qd8_ks(tile,j+7,Ps))) */;
vfloat32m2_t __riscv_vle32_v_f32m2(const float *p,size_t vl)
/*@ With  (K:Z) (wb:Z) (tile:Z) (j:Z) (kind:Z) (Ps:list panel_data)
 Require 1<=vl && vl<=8 && 0<K && 0<=tile && tile<Zlength(Ps) && 0<=kind && kind<=1 && 0<=j && j+vl<=8 && p==wb+tile*(96+8*K)+32+8*K+32*kind+4*j && qd8_matrix_wf(K,Ps) && packed_matrix(K,wb,Ps)
 Ensure packed_matrix(K,wb,Ps) * store(&(__return.s0),float,qd8_selected_f(vl,0,qd8_float_field(kind,tile,j+0,Ps))) * store(&(__return.s1),float,qd8_selected_f(vl,1,qd8_float_field(kind,tile,j+1,Ps))) * store(&(__return.s2),float,qd8_selected_f(vl,2,qd8_float_field(kind,tile,j+2,Ps))) * store(&(__return.s3),float,qd8_selected_f(vl,3,qd8_float_field(kind,tile,j+3,Ps))) * store(&(__return.s4),float,qd8_selected_f(vl,4,qd8_float_field(kind,tile,j+4,Ps))) * store(&(__return.s5),float,qd8_selected_f(vl,5,qd8_float_field(kind,tile,j+5,Ps))) * store(&(__return.s6),float,qd8_selected_f(vl,6,qd8_float_field(kind,tile,j+6,Ps))) * store(&(__return.s7),float,qd8_selected_f(vl,7,qd8_float_field(kind,tile,j+7,Ps))) */;
vint8mf2_t __riscv_vle8_v_i8mf2(const char *p,size_t vl)
/*@ With  (K:Z) (wb:Z) (tile:Z) (j:Z) (kind:Z) (Ps:list panel_data)
 Require 1<=vl && vl<=8 && 0<K && 0<=tile && tile<Zlength(Ps) && 0<=j && j+vl<=8*K && p==wb+tile*(96+8*K)+32+j && qd8_matrix_wf(K,Ps) && packed_matrix(K,wb,Ps)
 Ensure packed_matrix(K,wb,Ps) * store(&(__return.s0),char,qd8_selected_z(vl,0,qd8_zget(j+0,weights(panel_at(Ps,tile))))) * store(&(__return.s1),char,qd8_selected_z(vl,1,qd8_zget(j+1,weights(panel_at(Ps,tile))))) * store(&(__return.s2),char,qd8_selected_z(vl,2,qd8_zget(j+2,weights(panel_at(Ps,tile))))) * store(&(__return.s3),char,qd8_selected_z(vl,3,qd8_zget(j+3,weights(panel_at(Ps,tile))))) * store(&(__return.s4),char,qd8_selected_z(vl,4,qd8_zget(j+4,weights(panel_at(Ps,tile))))) * store(&(__return.s5),char,qd8_selected_z(vl,5,qd8_zget(j+5,weights(panel_at(Ps,tile))))) * store(&(__return.s6),char,qd8_selected_z(vl,6,qd8_zget(j+6,weights(panel_at(Ps,tile))))) * store(&(__return.s7),char,qd8_selected_z(vl,7,qd8_zget(j+7,weights(panel_at(Ps,tile))))) */;
size_t __riscv_vsetvl_e32m2(size_t n)
/*@ Require 1<=n && n<=8 && emp
 Ensure __return==n && emp */;
vbool16_t qcp_qd8_self_nan(const vfloat32m2_t *a,const vfloat32m2_t *b,size_t vl)
/*@ With (x0:fp32) (x1:fp32) (x2:fp32) (x3:fp32) (x4:fp32) (x5:fp32) (x6:fp32) (x7:fp32)
 Require a==b && 1<=vl && vl<=8 && store(&(a->s0),float,x0) * store(&(a->s1),float,x1) * store(&(a->s2),float,x2) * store(&(a->s3),float,x3) * store(&(a->s4),float,x4) * store(&(a->s5),float,x5) * store(&(a->s6),float,x6) * store(&(a->s7),float,x7)
 Ensure store(&(a->s0),float,x0) * store(&(a->s1),float,x1) * store(&(a->s2),float,x2) * store(&(a->s3),float,x3) * store(&(a->s4),float,x4) * store(&(a->s5),float,x5) * store(&(a->s6),float,x6) * store(&(a->s7),float,x7) * store(&(__return.s0),int,qd8_selected_z(vl,0,qd8_nan_flag(x0))) * store(&(__return.s1),int,qd8_selected_z(vl,1,qd8_nan_flag(x1))) * store(&(__return.s2),int,qd8_selected_z(vl,2,qd8_nan_flag(x2))) * store(&(__return.s3),int,qd8_selected_z(vl,3,qd8_nan_flag(x3))) * store(&(__return.s4),int,qd8_selected_z(vl,4,qd8_nan_flag(x4))) * store(&(__return.s5),int,qd8_selected_z(vl,5,qd8_nan_flag(x5))) * store(&(__return.s6),int,qd8_selected_z(vl,6,qd8_nan_flag(x6))) * store(&(__return.s7),int,qd8_selected_z(vl,7,qd8_nan_flag(x7))) */;
#define __riscv_vmfne_vv_f32m2_b16(a,b,vl) qcp_qd8_self_nan(&(a),&(b),(vl))
void qcp_qd8_store(float *p,const vfloat32m2_t *a,size_t vl)
/*@ With (base:Z) (N:Z) (done:Z) (L:list fp32) (x0:fp32) (x1:fp32) (x2:fp32) (x3:fp32) (x4:fp32) (x5:fp32) (x6:fp32) (x7:fp32)
 Require 1<=vl && vl<=8 && 0<=done && done+vl<=N && p==base+4*done && store(&(a->s0),float,x0) * store(&(a->s1),float,x1) * store(&(a->s2),float,x2) * store(&(a->s3),float,x3) * store(&(a->s4),float,x4) * store(&(a->s5),float,x5) * store(&(a->s6),float,x6) * store(&(a->s7),float,x7) * qd8_write_state(base,N,done,L)
 Ensure store(&(a->s0),float,x0) * store(&(a->s1),float,x1) * store(&(a->s2),float,x2) * store(&(a->s3),float,x3) * store(&(a->s4),float,x4) * store(&(a->s5),float,x5) * store(&(a->s6),float,x6) * store(&(a->s7),float,x7) * qd8_write_state(base,N,done+vl,qd8_fappend(L,sublist(0,vl,cons(x0,cons(x1,cons(x2,cons(x3,cons(x4,cons(x5,cons(x6,cons(x7,nil))))))))))) */;
#define __riscv_vse32_v_f32m2(p,a,vl) qcp_qd8_store((p),&(a),(vl))
float qcp_qd8_nanf(void)
/*@ Require emp
 Ensure qd8_bit_same(__return,canonical_qnan) && emp */;
#define __builtin_nanf(tag) qcp_qd8_nanf()
void qcp_assert(int condition)
/*@ Require condition!=0 && emp Ensure emp */;
#define assert(x) qcp_assert(x)

/*@ Import Coq Require Import Qd8Rvv.RvvModel */
/*@ Extern Coq (qd8_bounds_flag:fp32 -> fp32 -> Z)
 (qd8_rvv_completed:Z -> Z -> Z -> list Z -> list panel_data -> fp32 -> fp32 -> fp32 -> list fp32)
 (qd8_rvv_prefix:Z -> Z -> Z -> Z -> Z -> list Z -> list panel_data -> fp32 -> fp32 -> fp32 -> Assertion) */

int qcp_qd8_isnan(float x)
/*@ Require emp Ensure __return==qd8_nan_flag(x) && emp */;
#define __builtin_isnan(x) qcp_qd8_isnan(x)
