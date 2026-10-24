#include "../../contracts/model.h"
/*@ Import Coq Require Import QC4W.ApiModel QC4W.Layouts */
/*@ Extern Coq
 (qc4_zget:Z -> list Z -> Z)
 (qc4_fget:Z -> list fp32 -> fp32)
 (qc4_panel_at:list qc4_panel -> Z -> qc4_panel)
 (qc4_weights:qc4_panel -> list Z)
 (qc4_ks:Z -> Z -> list qc4_panel -> Z)
 (qc4_float_field:Z -> Z -> Z -> list qc4_panel -> fp32)
 (qc4_matrix_wf:Z -> list qc4_panel -> Prop)
 (qc4_wrap_signed:Z -> Z)
 (qc4_mac_signed:Z -> Z -> Z -> Z)
 (low_bitop:Z -> Z)
 (high_bitop:Z -> Z)
 (shifted_accumulator:Z -> Z)
 (rounded_depth:Z -> Z)
 (panel_bytes:Z -> Z)
 (qc4_nan_flag:fp32 -> Z)
 (qc4_merge:fp32 -> fp32 -> Z -> fp32)
 (qc4_fappend:list fp32 -> list fp32 -> list fp32)
 (qc4_write_state:Z -> Z -> Z -> list fp32 -> Assertion)
 (qc4_output_prefix:Z -> Z -> Z -> Z -> Z -> list Z -> list qc4_panel -> fp32 -> fp32 -> fp32 -> Assertion)
 (qc4_values:Z -> Z -> Z -> list Z -> list qc4_panel -> fp32 -> fp32 -> fp32 -> list fp32)
 (qc4_panels:Z -> Z)
 (qc4_active_z:Z -> Z -> Z -> Z -> Prop)
 (qc4_acc_signed:Z -> Z -> Z -> Z -> list Z -> list qc4_panel -> Z)
 (fma_rne:fp32 -> fp32 -> fp32 -> fp32)
 (qc4_fp32_mul:fp32 -> fp32 -> fp32)
 (fp32_min_number:fp32 -> fp32 -> fp32)
 (fp32_max_number:fp32 -> fp32 -> fp32)
 (fp32_of_Z:Z -> fp32)
 (canonical_qnan:fp32)
 (qc4_active16_z:Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Prop)
 (qc4_active16_f:Z -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> Prop) */
#include "copy.h"
/*@ include strategies "copy.strategies" */
void qcp_assert(int condition) /*@ Require condition!=0 && emp Ensure emp */;
size_t round_up_po2(size_t n,size_t quantum)
/*@ Require 0<n && n<18446744073709551615 && quantum==2 && emp Ensure __return==rounded_depth(n) && emp */;
float qcp_identity(float x) /*@ Require emp Ensure qc4_bit_same(__return,x) && emp */;
int qcp_isnan(float x) /*@ Require emp Ensure __return==qc4_nan_flag(x) && emp */;
float qcp_nanf(void) /*@ Require emp Ensure qc4_bit_same(__return,canonical_qnan) && emp */;
#define assert(c) qcp_assert(c)
#define __builtin_isnan(x) qcp_isnan(x)
#define __builtin_nanf(x) qcp_nanf()

/*@ Import Coq Require Import QC4W.NeonModel */
/*@ Extern Coq (qc4_char_field:Z -> Z -> Z -> Z -> list Z -> list qc4_panel -> Z)
(qc4_i8_address_ok:Z -> Z -> Z -> Z -> Z -> Z -> Z -> list qc4_panel -> Prop)
(qc4_i16_lane:Z -> Z -> Z -> Z -> Z -> Z)
(qc4_narrow8:Z -> Z)
(fp32_neon_min:fp32 -> fp32 -> fp32) (fp32_neon_max:fp32 -> fp32 -> fp32) */
#define INT8_C(x) x
int8x8_t vld1_s8(const void *p)
/*@ With (K:Z) (ab:Z) (wb:Z) (tile:Z) (j:Z) (mode:Z) (A:list Z) (Ps:list qc4_panel)
 Require 0<K && qc4_matrix_wf(K,Ps) && qc4_i8_address_ok(mode,p,ab,wb,K,tile,j,Ps) && CharArray::full(ab,qc4_a_extent(K),A) * qc4_packed(K,wb,Ps)
 Ensure CharArray::full(ab,qc4_a_extent(K),A) * qc4_packed(K,wb,Ps) * store(&(__return.s0),char,qc4_char_field(mode,tile,j,0,A,Ps)) * store(&(__return.s1),char,qc4_char_field(mode,tile,j,1,A,Ps)) * store(&(__return.s2),char,qc4_char_field(mode,tile,j,2,A,Ps)) * store(&(__return.s3),char,qc4_char_field(mode,tile,j,3,A,Ps)) * store(&(__return.s4),char,qc4_char_field(mode,tile,j,4,A,Ps)) * store(&(__return.s5),char,qc4_char_field(mode,tile,j,5,A,Ps)) * store(&(__return.s6),char,qc4_char_field(mode,tile,j,6,A,Ps)) * store(&(__return.s7),char,qc4_char_field(mode,tile,j,7,A,Ps)) */;
int32x4_t vld1q_s32(const void *p)
/*@ With (K:Z) (wb:Z) (tile:Z) (j:Z) (Ps:list qc4_panel)
 Require 0<K && qc4_matrix_wf(K,Ps) && 0<=tile && tile<Zlength(Ps) && 0<=j && j+4<=16 && p==wb+tile*panel_bytes(K)+4*j && qc4_packed(K,wb,Ps)
 Ensure qc4_packed(K,wb,Ps) * store(&(__return.s0),int,qc4_ks(tile,j+0,Ps)) * store(&(__return.s1),int,qc4_ks(tile,j+1,Ps)) * store(&(__return.s2),int,qc4_ks(tile,j+2,Ps)) * store(&(__return.s3),int,qc4_ks(tile,j+3,Ps)) */;
float32x4_t vld1q_f32(const void *p)
/*@ With (K:Z) (wb:Z) (tile:Z) (kind:Z) (j:Z) (Ps:list qc4_panel)
 Require 0<K && qc4_matrix_wf(K,Ps) && 0<=tile && tile<Zlength(Ps) && 0<=kind && kind<=1 && 0<=j && j+4<=16 && p==wb+tile*panel_bytes(K)+64+8*rounded_depth(K)+64*kind+4*j && qc4_packed(K,wb,Ps)
 Ensure qc4_packed(K,wb,Ps) * store(&(__return.s0),float,qc4_float_field(kind,tile,j+0,Ps)) * store(&(__return.s1),float,qc4_float_field(kind,tile,j+1,Ps)) * store(&(__return.s2),float,qc4_float_field(kind,tile,j+2,Ps)) * store(&(__return.s3),float,qc4_float_field(kind,tile,j+3,Ps)) */;
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
 Ensure store(&(__return.s0),int,qc4_wrap_signed(x0*y0)) * store(&(__return.s1),int,qc4_wrap_signed(x1*y1)) * store(&(__return.s2),int,qc4_wrap_signed(x2*y2)) * store(&(__return.s3),int,qc4_wrap_signed(x3*y3)) */;
float32x4_t vmulq_f32(float32x4_t a,float32x4_t b)
/*@ With (x0:fp32) (x1:fp32) (x2:fp32) (x3:fp32) (y0:fp32) (y1:fp32) (y2:fp32) (y3:fp32)
 Require store(&(a.s0),float,x0) * store(&(a.s1),float,x1) * store(&(a.s2),float,x2) * store(&(a.s3),float,x3) * store(&(b.s0),float,y0) * store(&(b.s1),float,y1) * store(&(b.s2),float,y2) * store(&(b.s3),float,y3)
 Ensure store(&(__return.s0),float,qc4_fp32_mul(x0,y0)) * store(&(__return.s1),float,qc4_fp32_mul(x1,y1)) * store(&(__return.s2),float,qc4_fp32_mul(x2,y2)) * store(&(__return.s3),float,qc4_fp32_mul(x3,y3)) */;
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
 Ensure store(&(__return.s0),int,qc4_mac_signed(z0,y0,qc4_i16_lane(lane,x0,x1,x2,x3))) * store(&(__return.s1),int,qc4_mac_signed(z1,y1,qc4_i16_lane(lane,x0,x1,x2,x3))) * store(&(__return.s2),int,qc4_mac_signed(z2,y2,qc4_i16_lane(lane,x0,x1,x2,x3))) * store(&(__return.s3),int,qc4_mac_signed(z3,y3,qc4_i16_lane(lane,x0,x1,x2,x3))) */;
void qcp_vst1q_f32(float *p,const float32x4_t *a)
/*@ With (x0:fp32) (x1:fp32) (x2:fp32) (x3:fp32) (base:Z) (N:Z) (done:Z) (L:list fp32)
 Require 0<=done && done+4<=N && p==base+4*done && store(&(a->s0),float,x0) * store(&(a->s1),float,x1) * store(&(a->s2),float,x2) * store(&(a->s3),float,x3) * qc4_write_state(base,N,done,L)
 Ensure store(&(a->s0),float,x0) * store(&(a->s1),float,x1) * store(&(a->s2),float,x2) * store(&(a->s3),float,x3) * qc4_write_state(base,N,done+4,qc4_fappend(L,cons(x0,cons(x1,cons(x2,cons(x3,nil)))))) */;
#define vst1q_f32(p,a) qcp_vst1q_f32((p),&(a))
void qcp_vst1_f32(float *p,const float32x2_t *a)
/*@ With (x0:fp32) (x1:fp32) (base:Z) (N:Z) (done:Z) (L:list fp32)
 Require 0<=done && done+2<=N && p==base+4*done && store(&(a->s0),float,x0) * store(&(a->s1),float,x1) * qc4_write_state(base,N,done,L)
 Ensure store(&(a->s0),float,x0) * store(&(a->s1),float,x1) * qc4_write_state(base,N,done+2,qc4_fappend(L,cons(x0,cons(x1,nil)))) */;
#define vst1_f32(p,a) qcp_vst1_f32((p),&(a))
void qcp_vst1_lane_f32(float *p,const float32x2_t *a,int lane)
/*@ With (x0:fp32) (x1:fp32) (base:Z) (N:Z) (done:Z) (L:list fp32)
 Require lane==0 && 0<=done && done+1<=N && p==base+4*done && store(&(a->s0),float,x0) * store(&(a->s1),float,x1) * qc4_write_state(base,N,done,L)
 Ensure store(&(a->s0),float,x0) * store(&(a->s1),float,x1) * qc4_write_state(base,N,done+1,qc4_fappend(L,cons(x0,nil))) */;
#define vst1_lane_f32(p,a,lane) qcp_vst1_lane_f32((p),&(a),(lane))
int8x8_t vmov_n_s8(int value)
/*@ Require emp
 Ensure store(&(__return.s0),char,qc4_narrow8(value)) * store(&(__return.s1),char,qc4_narrow8(value)) * store(&(__return.s2),char,qc4_narrow8(value)) * store(&(__return.s3),char,qc4_narrow8(value)) * store(&(__return.s4),char,qc4_narrow8(value)) * store(&(__return.s5),char,qc4_narrow8(value)) * store(&(__return.s6),char,qc4_narrow8(value)) * store(&(__return.s7),char,qc4_narrow8(value)) */;
int8x8_t vshl_n_s8(int8x8_t a,int shift)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z)
 Require shift==4 && store(&(a.s0),char,x0) * store(&(a.s1),char,x1) * store(&(a.s2),char,x2) * store(&(a.s3),char,x3) * store(&(a.s4),char,x4) * store(&(a.s5),char,x5) * store(&(a.s6),char,x6) * store(&(a.s7),char,x7)
 Ensure store(&(__return.s0),char,low_bitop(x0)) * store(&(__return.s1),char,low_bitop(x1)) * store(&(__return.s2),char,low_bitop(x2)) * store(&(__return.s3),char,low_bitop(x3)) * store(&(__return.s4),char,low_bitop(x4)) * store(&(__return.s5),char,low_bitop(x5)) * store(&(__return.s6),char,low_bitop(x6)) * store(&(__return.s7),char,low_bitop(x7)) */;
int8x8_t vand_s8(int8x8_t a,int8x8_t b)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z) (y0:Z) (y1:Z) (y2:Z) (y3:Z) (y4:Z) (y5:Z) (y6:Z) (y7:Z)
 Require y0==(-16) && y1==(-16) && y2==(-16) && y3==(-16) && y4==(-16) && y5==(-16) && y6==(-16) && y7==(-16) && store(&(a.s0),char,x0) * store(&(a.s1),char,x1) * store(&(a.s2),char,x2) * store(&(a.s3),char,x3) * store(&(a.s4),char,x4) * store(&(a.s5),char,x5) * store(&(a.s6),char,x6) * store(&(a.s7),char,x7) * store(&(b.s0),char,y0) * store(&(b.s1),char,y1) * store(&(b.s2),char,y2) * store(&(b.s3),char,y3) * store(&(b.s4),char,y4) * store(&(b.s5),char,y5) * store(&(b.s6),char,y6) * store(&(b.s7),char,y7)
 Ensure store(&(__return.s0),char,high_bitop(x0)) * store(&(__return.s1),char,high_bitop(x1)) * store(&(__return.s2),char,high_bitop(x2)) * store(&(__return.s3),char,high_bitop(x3)) * store(&(__return.s4),char,high_bitop(x4)) * store(&(__return.s5),char,high_bitop(x5)) * store(&(__return.s6),char,high_bitop(x6)) * store(&(__return.s7),char,high_bitop(x7)) */;
int32x4_t vshrq_n_s32(int32x4_t a,int shift)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z)
 Require shift==4 && store(&(a.s0),int,x0) * store(&(a.s1),int,x1) * store(&(a.s2),int,x2) * store(&(a.s3),int,x3)
 Ensure store(&(__return.s0),int,shifted_accumulator(x0)) * store(&(__return.s1),int,shifted_accumulator(x1)) * store(&(__return.s2),int,shifted_accumulator(x2)) * store(&(__return.s3),int,shifted_accumulator(x3)) */;
