#include "../contracts/model.h"
/*@ Import Coq Require Import Qd8API.ApiModel Qd8API.Layouts */
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
int8x8_t vld1_s8(const void *p)
/*@ With (K:Z) (ab:Z) (wb:Z) (tile:Z) (j:Z) (mode:Z) (A:list Z) (Ps:list panel_data)
 Require 0<K && qd8_matrix_wf(K,Ps) && qd8_i8_address_ok(mode,p,ab,wb,K,tile,j,Ps) && CharArray::full(ab,a_read_extent(K),A) * packed_matrix(K,wb,Ps)
 Ensure CharArray::full(ab,a_read_extent(K),A) * packed_matrix(K,wb,Ps) * store(&(__return.s0),char,qd8_char_field(mode,tile,j,0,A,Ps)) * store(&(__return.s1),char,qd8_char_field(mode,tile,j,1,A,Ps)) * store(&(__return.s2),char,qd8_char_field(mode,tile,j,2,A,Ps)) * store(&(__return.s3),char,qd8_char_field(mode,tile,j,3,A,Ps)) * store(&(__return.s4),char,qd8_char_field(mode,tile,j,4,A,Ps)) * store(&(__return.s5),char,qd8_char_field(mode,tile,j,5,A,Ps)) * store(&(__return.s6),char,qd8_char_field(mode,tile,j,6,A,Ps)) * store(&(__return.s7),char,qd8_char_field(mode,tile,j,7,A,Ps)) */;
int32x4_t vld1q_s32(const void *p)
/*@ With (K:Z) (wb:Z) (tile:Z) (j:Z) (Ps:list panel_data)
 Require 0<K && qd8_matrix_wf(K,Ps) && 0<=tile && tile<Zlength(Ps) && 0<=j && j+4<=8 && p==wb+tile*(96+8*K)+4*j && packed_matrix(K,wb,Ps)
 Ensure packed_matrix(K,wb,Ps) * store(&(__return.s0),int,qd8_ks(tile,j+0,Ps)) * store(&(__return.s1),int,qd8_ks(tile,j+1,Ps)) * store(&(__return.s2),int,qd8_ks(tile,j+2,Ps)) * store(&(__return.s3),int,qd8_ks(tile,j+3,Ps)) */;
float32x4_t vld1q_f32(const void *p)
/*@ With (K:Z) (wb:Z) (tile:Z) (kind:Z) (j:Z) (Ps:list panel_data)
 Require 0<K && qd8_matrix_wf(K,Ps) && 0<=tile && tile<Zlength(Ps) && 0<=kind && kind<=1 && 0<=j && j+4<=8 && p==wb+tile*(96+8*K)+32+8*K+32*kind+4*j && packed_matrix(K,wb,Ps)
 Ensure packed_matrix(K,wb,Ps) * store(&(__return.s0),float,qd8_float_field(kind,tile,j+0,Ps)) * store(&(__return.s1),float,qd8_float_field(kind,tile,j+1,Ps)) * store(&(__return.s2),float,qd8_float_field(kind,tile,j+2,Ps)) * store(&(__return.s3),float,qd8_float_field(kind,tile,j+3,Ps)) */;
int32x4_t vld1q_dup_s32(const int *p)
/*@ With (x:Z)
 Require store(p,int,x)
 Ensure store(p,int,x) * store(&(__return.s0),int,x) * store(&(__return.s1),int,x) * store(&(__return.s2),int,x) * store(&(__return.s3),int,x) */;
float32x4_t vld1q_dup_f32(const float *p)
/*@ With (x:fp32)
 Require store(p,float,x)
 Ensure store(p,float,x) * store(&(__return.s0),float,x) * store(&(__return.s1),float,x) * store(&(__return.s2),float,x) * store(&(__return.s3),float,x) */;
float32x4_t vdupq_n_f32(float x)
/*@ Require emp
 Ensure store(&(__return.s0),float,x) * store(&(__return.s1),float,x) * store(&(__return.s2),float,x) * store(&(__return.s3),float,x) */;
int16x4_t vget_low_s16(int16x8_t a)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z)
 Require store(&(a.s0),short,x0) * store(&(a.s1),short,x1) * store(&(a.s2),short,x2) * store(&(a.s3),short,x3) * store(&(a.s4),short,x4) * store(&(a.s5),short,x5) * store(&(a.s6),short,x6) * store(&(a.s7),short,x7)
 Ensure store(&(__return.s0),short,x0) * store(&(__return.s1),short,x1) * store(&(__return.s2),short,x2) * store(&(__return.s3),short,x3) */;
int16x4_t vget_high_s16(int16x8_t a)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z)
 Require store(&(a.s0),short,x0) * store(&(a.s1),short,x1) * store(&(a.s2),short,x2) * store(&(a.s3),short,x3) * store(&(a.s4),short,x4) * store(&(a.s5),short,x5) * store(&(a.s6),short,x6) * store(&(a.s7),short,x7)
 Ensure store(&(__return.s0),short,x4) * store(&(__return.s1),short,x5) * store(&(__return.s2),short,x6) * store(&(__return.s3),short,x7) */;
float32x2_t vget_low_f32(float32x4_t a)
/*@ With (x0:fp32) (x1:fp32) (x2:fp32) (x3:fp32)
 Require store(&(a.s0),float,x0) * store(&(a.s1),float,x1) * store(&(a.s2),float,x2) * store(&(a.s3),float,x3)
 Ensure store(&(__return.s0),float,x0) * store(&(__return.s1),float,x1) */;
float32x2_t vget_high_f32(float32x4_t a)
/*@ With (x0:fp32) (x1:fp32) (x2:fp32) (x3:fp32)
 Require store(&(a.s0),float,x0) * store(&(a.s1),float,x1) * store(&(a.s2),float,x2) * store(&(a.s3),float,x3)
 Ensure store(&(__return.s0),float,x2) * store(&(__return.s1),float,x3) */;
int16x8_t vmovl_s8(int8x8_t a)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z)
 Require store(&(a.s0),char,x0) * store(&(a.s1),char,x1) * store(&(a.s2),char,x2) * store(&(a.s3),char,x3) * store(&(a.s4),char,x4) * store(&(a.s5),char,x5) * store(&(a.s6),char,x6) * store(&(a.s7),char,x7)
 Ensure store(&(__return.s0),short,x0) * store(&(__return.s1),short,x1) * store(&(__return.s2),short,x2) * store(&(__return.s3),short,x3) * store(&(__return.s4),short,x4) * store(&(__return.s5),short,x5) * store(&(__return.s6),short,x6) * store(&(__return.s7),short,x7) */;
float32x4_t vcvtq_f32_s32(int32x4_t a)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z)
 Require store(&(a.s0),int,x0) * store(&(a.s1),int,x1) * store(&(a.s2),int,x2) * store(&(a.s3),int,x3)
 Ensure store(&(__return.s0),float,fp32_of_Z(x0)) * store(&(__return.s1),float,fp32_of_Z(x1)) * store(&(__return.s2),float,fp32_of_Z(x2)) * store(&(__return.s3),float,fp32_of_Z(x3)) */;
int32x4_t vmulq_s32(int32x4_t a,int32x4_t b)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) (y0:Z) (y1:Z) (y2:Z) (y3:Z)
 Require store(&(a.s0),int,x0) * store(&(a.s1),int,x1) * store(&(a.s2),int,x2) * store(&(a.s3),int,x3) * store(&(b.s0),int,y0) * store(&(b.s1),int,y1) * store(&(b.s2),int,y2) * store(&(b.s3),int,y3)
 Ensure store(&(__return.s0),int,qd8_wrap_signed(x0*y0)) * store(&(__return.s1),int,qd8_wrap_signed(x1*y1)) * store(&(__return.s2),int,qd8_wrap_signed(x2*y2)) * store(&(__return.s3),int,qd8_wrap_signed(x3*y3)) */;
float32x4_t vmulq_f32(float32x4_t a,float32x4_t b)
/*@ With (x0:fp32) (x1:fp32) (x2:fp32) (x3:fp32) (y0:fp32) (y1:fp32) (y2:fp32) (y3:fp32)
 Require store(&(a.s0),float,x0) * store(&(a.s1),float,x1) * store(&(a.s2),float,x2) * store(&(a.s3),float,x3) * store(&(b.s0),float,y0) * store(&(b.s1),float,y1) * store(&(b.s2),float,y2) * store(&(b.s3),float,y3)
 Ensure store(&(__return.s0),float,fp32_mul(x0,y0)) * store(&(__return.s1),float,fp32_mul(x1,y1)) * store(&(__return.s2),float,fp32_mul(x2,y2)) * store(&(__return.s3),float,fp32_mul(x3,y3)) */;
float32x4_t vminq_f32(float32x4_t a,float32x4_t b)
/*@ With (x0:fp32) (x1:fp32) (x2:fp32) (x3:fp32) (y0:fp32) (y1:fp32) (y2:fp32) (y3:fp32)
 Require store(&(a.s0),float,x0) * store(&(a.s1),float,x1) * store(&(a.s2),float,x2) * store(&(a.s3),float,x3) * store(&(b.s0),float,y0) * store(&(b.s1),float,y1) * store(&(b.s2),float,y2) * store(&(b.s3),float,y3)
 Ensure store(&(__return.s0),float,fp32_neon_min(x0,y0)) * store(&(__return.s1),float,fp32_neon_min(x1,y1)) * store(&(__return.s2),float,fp32_neon_min(x2,y2)) * store(&(__return.s3),float,fp32_neon_min(x3,y3)) */;
float32x4_t vmaxq_f32(float32x4_t a,float32x4_t b)
/*@ With (x0:fp32) (x1:fp32) (x2:fp32) (x3:fp32) (y0:fp32) (y1:fp32) (y2:fp32) (y3:fp32)
 Require store(&(a.s0),float,x0) * store(&(a.s1),float,x1) * store(&(a.s2),float,x2) * store(&(a.s3),float,x3) * store(&(b.s0),float,y0) * store(&(b.s1),float,y1) * store(&(b.s2),float,y2) * store(&(b.s3),float,y3)
 Ensure store(&(__return.s0),float,fp32_neon_max(x0,y0)) * store(&(__return.s1),float,fp32_neon_max(x1,y1)) * store(&(__return.s2),float,fp32_neon_max(x2,y2)) * store(&(__return.s3),float,fp32_neon_max(x3,y3)) */;
float32x4_t vfmaq_f32(float32x4_t acc,float32x4_t a,float32x4_t b)
/*@ With (x0:fp32) (x1:fp32) (x2:fp32) (x3:fp32) (y0:fp32) (y1:fp32) (y2:fp32) (y3:fp32) (z0:fp32) (z1:fp32) (z2:fp32) (z3:fp32)
 Require store(&(acc.s0),float,z0) * store(&(acc.s1),float,z1) * store(&(acc.s2),float,z2) * store(&(acc.s3),float,z3) * store(&(a.s0),float,x0) * store(&(a.s1),float,x1) * store(&(a.s2),float,x2) * store(&(a.s3),float,x3) * store(&(b.s0),float,y0) * store(&(b.s1),float,y1) * store(&(b.s2),float,y2) * store(&(b.s3),float,y3)
 Ensure store(&(__return.s0),float,fma_rne(x0,y0,z0)) * store(&(__return.s1),float,fma_rne(x1,y1,z1)) * store(&(__return.s2),float,fma_rne(x2,y2,z2)) * store(&(__return.s3),float,fma_rne(x3,y3,z3)) */;
int32x4_t vmlal_lane_s16(int32x4_t acc,int16x4_t b,int16x4_t a,int lane)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) (y0:Z) (y1:Z) (y2:Z) (y3:Z) (z0:Z) (z1:Z) (z2:Z) (z3:Z)
 Require 0<=lane && lane<4 && store(&(acc.s0),int,z0) * store(&(acc.s1),int,z1) * store(&(acc.s2),int,z2) * store(&(acc.s3),int,z3) * store(&(b.s0),short,y0) * store(&(b.s1),short,y1) * store(&(b.s2),short,y2) * store(&(b.s3),short,y3) * store(&(a.s0),short,x0) * store(&(a.s1),short,x1) * store(&(a.s2),short,x2) * store(&(a.s3),short,x3)
 Ensure store(&(__return.s0),int,qd8_mac_signed(z0,y0,qd8_i16_lane(lane,x0,x1,x2,x3))) * store(&(__return.s1),int,qd8_mac_signed(z1,y1,qd8_i16_lane(lane,x0,x1,x2,x3))) * store(&(__return.s2),int,qd8_mac_signed(z2,y2,qd8_i16_lane(lane,x0,x1,x2,x3))) * store(&(__return.s3),int,qd8_mac_signed(z3,y3,qd8_i16_lane(lane,x0,x1,x2,x3))) */;
void qcp_vst1q_f32(float *p,const float32x4_t *a)
/*@ With (x0:fp32) (x1:fp32) (x2:fp32) (x3:fp32) (base:Z) (N:Z) (done:Z) (L:list fp32)
 Require 0<=done && done+4<=N && p==base+4*done && store(&(a->s0),float,x0) * store(&(a->s1),float,x1) * store(&(a->s2),float,x2) * store(&(a->s3),float,x3) * qd8_write_state(base,N,done,L)
 Ensure store(&(a->s0),float,x0) * store(&(a->s1),float,x1) * store(&(a->s2),float,x2) * store(&(a->s3),float,x3) * qd8_write_state(base,N,done+4,qd8_fappend(L,cons(x0,cons(x1,cons(x2,cons(x3,nil)))))) */;
#define vst1q_f32(p,a) qcp_vst1q_f32((p),&(a))
void qcp_vst1_f32(float *p,const float32x2_t *a)
/*@ With (x0:fp32) (x1:fp32) (base:Z) (N:Z) (done:Z) (L:list fp32)
 Require 0<=done && done+2<=N && p==base+4*done && store(&(a->s0),float,x0) * store(&(a->s1),float,x1) * qd8_write_state(base,N,done,L)
 Ensure store(&(a->s0),float,x0) * store(&(a->s1),float,x1) * qd8_write_state(base,N,done+2,qd8_fappend(L,cons(x0,cons(x1,nil)))) */;
#define vst1_f32(p,a) qcp_vst1_f32((p),&(a))
void qcp_vst1_lane_f32(float *p,const float32x2_t *a,int lane)
/*@ With (x0:fp32) (x1:fp32) (base:Z) (N:Z) (done:Z) (L:list fp32)
 Require lane==0 && 0<=done && done+1<=N && p==base+4*done && store(&(a->s0),float,x0) * store(&(a->s1),float,x1) * qd8_write_state(base,N,done,L)
 Ensure store(&(a->s0),float,x0) * store(&(a->s1),float,x1) * qd8_write_state(base,N,done+1,qd8_fappend(L,cons(x0,nil))) */;
#define vst1_lane_f32(p,a,lane) qcp_vst1_lane_f32((p),&(a),(lane))
void qcp_assert(int condition)
/*@ Require condition!=0 && emp Ensure emp */;
#define assert(x) qcp_assert(x)
void xnn_prefetch_to_l1(const void *p)
/*@ Require 0<=p && p<=18446744073709551615 && emp Ensure emp */;
