#include "../contracts/model.h"
#include "copy.h"
/*@ include strategies "copy.strategies" */
int16x8_t vmovl_s8(int8x8_t a)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z)
 Require store(&(a.s0),char,x0) * store(&(a.s1),char,x1) * store(&(a.s2),char,x2) * store(&(a.s3),char,x3) * store(&(a.s4),char,x4) * store(&(a.s5),char,x5) * store(&(a.s6),char,x6) * store(&(a.s7),char,x7)
 Ensure store(&(__return.s0),short,x0) * store(&(__return.s1),short,x1) * store(&(__return.s2),short,x2) * store(&(__return.s3),short,x3) * store(&(__return.s4),short,x4) * store(&(__return.s5),short,x5) * store(&(__return.s6),short,x6) * store(&(__return.s7),short,x7) */;
int16x4_t vget_low_s16(int16x8_t a)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z)
 Require store(&(a.s0),short,x0) * store(&(a.s1),short,x1) * store(&(a.s2),short,x2) * store(&(a.s3),short,x3) * store(&(a.s4),short,x4) * store(&(a.s5),short,x5) * store(&(a.s6),short,x6) * store(&(a.s7),short,x7)
 Ensure store(&(__return.s0),short,x0) * store(&(__return.s1),short,x1) * store(&(__return.s2),short,x2) * store(&(__return.s3),short,x3) */;
int16x4_t vget_high_s16(int16x8_t a)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z)
 Require store(&(a.s0),short,x0) * store(&(a.s1),short,x1) * store(&(a.s2),short,x2) * store(&(a.s3),short,x3) * store(&(a.s4),short,x4) * store(&(a.s5),short,x5) * store(&(a.s6),short,x6) * store(&(a.s7),short,x7)
 Ensure store(&(__return.s0),short,x4) * store(&(__return.s1),short,x5) * store(&(__return.s2),short,x6) * store(&(__return.s3),short,x7) */;
int32x4_t vmlal_lane_s16(int32x4_t acc,int16x4_t b,int16x4_t a,int lane)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) (y0:Z) (y1:Z) (y2:Z) (y3:Z) (z0:Z) (z1:Z) (z2:Z) (z3:Z)
 Require 0<=lane && lane<4 && store(&(acc.s0),int,x0) * store(&(acc.s1),int,x1) * store(&(acc.s2),int,x2) * store(&(acc.s3),int,x3) * store(&(b.s0),short,y0) * store(&(b.s1),short,y1) * store(&(b.s2),short,y2) * store(&(b.s3),short,y3) * store(&(a.s0),short,z0) * store(&(a.s1),short,z1) * store(&(a.s2),short,z2) * store(&(a.s3),short,z3)
 Ensure store(&(__return.s0),int,qs8_mac(x0,y0,qs8_lane4(lane,z0,z1,z2,z3))) * store(&(__return.s1),int,qs8_mac(x1,y1,qs8_lane4(lane,z0,z1,z2,z3))) * store(&(__return.s2),int,qs8_mac(x2,y2,qs8_lane4(lane,z0,z1,z2,z3))) * store(&(__return.s3),int,qs8_mac(x3,y3,qs8_lane4(lane,z0,z1,z2,z3))) */;
float32x4_t vcvtq_f32_s32(int32x4_t a)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z)
 Require store(&(a.s0),int,x0) * store(&(a.s1),int,x1) * store(&(a.s2),int,x2) * store(&(a.s3),int,x3)
 Ensure store(&(__return.s0),float,fp32_of_Z(x0)) * store(&(__return.s1),float,fp32_of_Z(x1)) * store(&(__return.s2),float,fp32_of_Z(x2)) * store(&(__return.s3),float,fp32_of_Z(x3)) */;
float32x4_t vmulq_f32(float32x4_t a,float32x4_t b)
/*@ With (x0:fp32) (x1:fp32) (x2:fp32) (x3:fp32) (y0:fp32) (y1:fp32) (y2:fp32) (y3:fp32)
 Require store(&(a.s0),float,x0) * store(&(a.s1),float,x1) * store(&(a.s2),float,x2) * store(&(a.s3),float,x3) * store(&(b.s0),float,y0) * store(&(b.s1),float,y1) * store(&(b.s2),float,y2) * store(&(b.s3),float,y3)
 Ensure store(&(__return.s0),float,f16_arm_mul(x0,y0)) * store(&(__return.s1),float,f16_arm_mul(x1,y1)) * store(&(__return.s2),float,f16_arm_mul(x2,y2)) * store(&(__return.s3),float,f16_arm_mul(x3,y3)) */;
float32x4_t vaddq_f32(float32x4_t a,float32x4_t b)
/*@ With (x0:fp32) (x1:fp32) (x2:fp32) (x3:fp32) (y0:fp32) (y1:fp32) (y2:fp32) (y3:fp32)
 Require store(&(a.s0),float,x0) * store(&(a.s1),float,x1) * store(&(a.s2),float,x2) * store(&(a.s3),float,x3) * store(&(b.s0),float,y0) * store(&(b.s1),float,y1) * store(&(b.s2),float,y2) * store(&(b.s3),float,y3)
 Ensure store(&(__return.s0),float,f16_arm_add(x0,y0)) * store(&(__return.s1),float,f16_arm_add(x1,y1)) * store(&(__return.s2),float,f16_arm_add(x2,y2)) * store(&(__return.s3),float,f16_arm_add(x3,y3)) */;
float32x4_t vdupq_n_f32(float a)
/*@ Require emp
 Ensure store(&(__return.s0),float,a) * store(&(__return.s1),float,a) * store(&(__return.s2),float,a) * store(&(__return.s3),float,a) */;
int32x4_t vdupq_n_s32(int32_t a)
/*@ Require emp
 Ensure store(&(__return.s0),int,a) * store(&(__return.s1),int,a) * store(&(__return.s2),int,a) * store(&(__return.s3),int,a) */;
int8x8_t vdup_n_s8(int8_t a)
/*@ Require emp
 Ensure store(&(__return.s0),char,a) * store(&(__return.s1),char,a) * store(&(__return.s2),char,a) * store(&(__return.s3),char,a) * store(&(__return.s4),char,a) * store(&(__return.s5),char,a) * store(&(__return.s6),char,a) * store(&(__return.s7),char,a) */;
int32x4_t vreinterpretq_s32_f32(float32x4_t a)
/*@ With (x0:fp32) (x1:fp32) (x2:fp32) (x3:fp32)
 Require store(&(a.s0),float,x0) * store(&(a.s1),float,x1) * store(&(a.s2),float,x2) * store(&(a.s3),float,x3)
 Ensure store(&(__return.s0),int,qs8_reinterpret(x0)) * store(&(__return.s1),int,qs8_reinterpret(x1)) * store(&(__return.s2),int,qs8_reinterpret(x2)) * store(&(__return.s3),int,qs8_reinterpret(x3)) */;
int32x4_t vqsubq_s32(int32x4_t a,int32x4_t b)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) (y0:Z) (y1:Z) (y2:Z) (y3:Z)
 Require store(&(a.s0),int,x0) * store(&(a.s1),int,x1) * store(&(a.s2),int,x2) * store(&(a.s3),int,x3) * store(&(b.s0),int,y0) * store(&(b.s1),int,y1) * store(&(b.s2),int,y2) * store(&(b.s3),int,y3)
 Ensure store(&(__return.s0),int,qs8_ssub32(x0,y0)) * store(&(__return.s1),int,qs8_ssub32(x1,y1)) * store(&(__return.s2),int,qs8_ssub32(x2,y2)) * store(&(__return.s3),int,qs8_ssub32(x3,y3)) */;
int16x4_t vqmovn_s32(int32x4_t a)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z)
 Require store(&(a.s0),int,x0) * store(&(a.s1),int,x1) * store(&(a.s2),int,x2) * store(&(a.s3),int,x3)
 Ensure store(&(__return.s0),short,qs8_narrow16(x0)) * store(&(__return.s1),short,qs8_narrow16(x1)) * store(&(__return.s2),short,qs8_narrow16(x2)) * store(&(__return.s3),short,qs8_narrow16(x3)) */;
int16x8_t vqmovn_high_s32(int16x4_t a,int32x4_t b)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) (y0:Z) (y1:Z) (y2:Z) (y3:Z)
 Require store(&(a.s0),short,x0) * store(&(a.s1),short,x1) * store(&(a.s2),short,x2) * store(&(a.s3),short,x3) * store(&(b.s0),int,y0) * store(&(b.s1),int,y1) * store(&(b.s2),int,y2) * store(&(b.s3),int,y3)
 Ensure store(&(__return.s0),short,x0) * store(&(__return.s1),short,x1) * store(&(__return.s2),short,x2) * store(&(__return.s3),short,x3) * store(&(__return.s4),short,qs8_narrow16(y0)) * store(&(__return.s5),short,qs8_narrow16(y1)) * store(&(__return.s6),short,qs8_narrow16(y2)) * store(&(__return.s7),short,qs8_narrow16(y3)) */;
int8x8_t vqmovn_s16(int16x8_t a)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z)
 Require store(&(a.s0),short,x0) * store(&(a.s1),short,x1) * store(&(a.s2),short,x2) * store(&(a.s3),short,x3) * store(&(a.s4),short,x4) * store(&(a.s5),short,x5) * store(&(a.s6),short,x6) * store(&(a.s7),short,x7)
 Ensure store(&(__return.s0),char,qs8_narrow8(x0)) * store(&(__return.s1),char,qs8_narrow8(x1)) * store(&(__return.s2),char,qs8_narrow8(x2)) * store(&(__return.s3),char,qs8_narrow8(x3)) * store(&(__return.s4),char,qs8_narrow8(x4)) * store(&(__return.s5),char,qs8_narrow8(x5)) * store(&(__return.s6),char,qs8_narrow8(x6)) * store(&(__return.s7),char,qs8_narrow8(x7)) */;
int8x8_t vmax_s8(int8x8_t a,int8x8_t b)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z) (y0:Z) (y1:Z) (y2:Z) (y3:Z) (y4:Z) (y5:Z) (y6:Z) (y7:Z)
 Require store(&(a.s0),char,x0) * store(&(a.s1),char,x1) * store(&(a.s2),char,x2) * store(&(a.s3),char,x3) * store(&(a.s4),char,x4) * store(&(a.s5),char,x5) * store(&(a.s6),char,x6) * store(&(a.s7),char,x7) * store(&(b.s0),char,y0) * store(&(b.s1),char,y1) * store(&(b.s2),char,y2) * store(&(b.s3),char,y3) * store(&(b.s4),char,y4) * store(&(b.s5),char,y5) * store(&(b.s6),char,y6) * store(&(b.s7),char,y7)
 Ensure store(&(__return.s0),char,qs8_max(x0,y0)) * store(&(__return.s1),char,qs8_max(x1,y1)) * store(&(__return.s2),char,qs8_max(x2,y2)) * store(&(__return.s3),char,qs8_max(x3,y3)) * store(&(__return.s4),char,qs8_max(x4,y4)) * store(&(__return.s5),char,qs8_max(x5,y5)) * store(&(__return.s6),char,qs8_max(x6,y6)) * store(&(__return.s7),char,qs8_max(x7,y7)) */;
int8x8_t vmin_s8(int8x8_t a,int8x8_t b)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z) (y0:Z) (y1:Z) (y2:Z) (y3:Z) (y4:Z) (y5:Z) (y6:Z) (y7:Z)
 Require store(&(a.s0),char,x0) * store(&(a.s1),char,x1) * store(&(a.s2),char,x2) * store(&(a.s3),char,x3) * store(&(a.s4),char,x4) * store(&(a.s5),char,x5) * store(&(a.s6),char,x6) * store(&(a.s7),char,x7) * store(&(b.s0),char,y0) * store(&(b.s1),char,y1) * store(&(b.s2),char,y2) * store(&(b.s3),char,y3) * store(&(b.s4),char,y4) * store(&(b.s5),char,y5) * store(&(b.s6),char,y6) * store(&(b.s7),char,y7)
 Ensure store(&(__return.s0),char,qs8_min(x0,y0)) * store(&(__return.s1),char,qs8_min(x1,y1)) * store(&(__return.s2),char,qs8_min(x2,y2)) * store(&(__return.s3),char,qs8_min(x3,y3)) * store(&(__return.s4),char,qs8_min(x4,y4)) * store(&(__return.s5),char,qs8_min(x5,y5)) * store(&(__return.s6),char,qs8_min(x6,y6)) * store(&(__return.s7),char,qs8_min(x7,y7)) */;
uint32x2_t vreinterpret_u32_s8(int8x8_t a)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z)
 Require store(&(a.s0),char,x0) * store(&(a.s1),char,x1) * store(&(a.s2),char,x2) * store(&(a.s3),char,x3) * store(&(a.s4),char,x4) * store(&(a.s5),char,x5) * store(&(a.s6),char,x6) * store(&(a.s7),char,x7)
 Ensure store(&(__return.s0),char,x0) * store(&(__return.s1),char,x1) * store(&(__return.s2),char,x2) * store(&(__return.s3),char,x3) * store(&(__return.s4),char,x4) * store(&(__return.s5),char,x5) * store(&(__return.s6),char,x6) * store(&(__return.s7),char,x7) */;
uint16x4_t vreinterpret_u16_s8(int8x8_t a)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z)
 Require store(&(a.s0),char,x0) * store(&(a.s1),char,x1) * store(&(a.s2),char,x2) * store(&(a.s3),char,x3) * store(&(a.s4),char,x4) * store(&(a.s5),char,x5) * store(&(a.s6),char,x6) * store(&(a.s7),char,x7)
 Ensure store(&(__return.s0),char,x0) * store(&(__return.s1),char,x1) * store(&(__return.s2),char,x2) * store(&(__return.s3),char,x3) * store(&(__return.s4),char,x4) * store(&(__return.s5),char,x5) * store(&(__return.s6),char,x6) * store(&(__return.s7),char,x7) */;
int8x8_t qcp_qs8_ext(const int8x8_t *a,const int8x8_t *b,int k)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z)
 Require a==b && 0<=k && k<8 && store(&(a->s0),char,x0) * store(&(a->s1),char,x1) * store(&(a->s2),char,x2) * store(&(a->s3),char,x3) * store(&(a->s4),char,x4) * store(&(a->s5),char,x5) * store(&(a->s6),char,x6) * store(&(a->s7),char,x7)
 Ensure store(&(a->s0),char,x0) * store(&(a->s1),char,x1) * store(&(a->s2),char,x2) * store(&(a->s3),char,x3) * store(&(a->s4),char,x4) * store(&(a->s5),char,x5) * store(&(a->s6),char,x6) * store(&(a->s7),char,x7) * store(&(__return.s0),char,qs8_ext(k,0,cons(x0,cons(x1,cons(x2,cons(x3,cons(x4,cons(x5,cons(x6,cons(x7,nil)))))))))) * store(&(__return.s1),char,qs8_ext(k,1,cons(x0,cons(x1,cons(x2,cons(x3,cons(x4,cons(x5,cons(x6,cons(x7,nil)))))))))) * store(&(__return.s2),char,qs8_ext(k,2,cons(x0,cons(x1,cons(x2,cons(x3,cons(x4,cons(x5,cons(x6,cons(x7,nil)))))))))) * store(&(__return.s3),char,qs8_ext(k,3,cons(x0,cons(x1,cons(x2,cons(x3,cons(x4,cons(x5,cons(x6,cons(x7,nil)))))))))) * store(&(__return.s4),char,qs8_ext(k,4,cons(x0,cons(x1,cons(x2,cons(x3,cons(x4,cons(x5,cons(x6,cons(x7,nil)))))))))) * store(&(__return.s5),char,qs8_ext(k,5,cons(x0,cons(x1,cons(x2,cons(x3,cons(x4,cons(x5,cons(x6,cons(x7,nil)))))))))) * store(&(__return.s6),char,qs8_ext(k,6,cons(x0,cons(x1,cons(x2,cons(x3,cons(x4,cons(x5,cons(x6,cons(x7,nil)))))))))) * store(&(__return.s7),char,qs8_ext(k,7,cons(x0,cons(x1,cons(x2,cons(x3,cons(x4,cons(x5,cons(x6,cons(x7,nil)))))))))) */;
#define vext_s8(a,b,k) qcp_qs8_ext(&(a),&(b),(k))
int32x4_t vld1q_s32(const void *p)
/*@ With (K:Z) (wb:Z) (tile:Z) (j:Z) (Ps:list panel_data)
 Require 0<K && qs8_matrix_wf(K,Ps) && 0<=tile && tile<Zlength(Ps) && 0<=j && j+4<=8 && p==wb+tile*(64+8*K)+4*j && packed_matrix(K,wb,Ps)
 Ensure packed_matrix(K,wb,Ps) * store(&(__return.s0),int,qs8_bias(tile,j+0,Ps)) * store(&(__return.s1),int,qs8_bias(tile,j+1,Ps)) * store(&(__return.s2),int,qs8_bias(tile,j+2,Ps)) * store(&(__return.s3),int,qs8_bias(tile,j+3,Ps)) */;
float32x4_t vld1q_f32(const void *p)
/*@ With (K:Z) (wb:Z) (tile:Z) (j:Z) (Ps:list panel_data)
 Require 0<K && qs8_matrix_wf(K,Ps) && 0<=tile && tile<Zlength(Ps) && 0<=j && j+4<=8 && p==wb+tile*(64+8*K)+32+8*K+4*j && packed_matrix(K,wb,Ps)
 Ensure packed_matrix(K,wb,Ps) * store(&(__return.s0),float,qs8_scale(tile,j+0,Ps)) * store(&(__return.s1),float,qs8_scale(tile,j+1,Ps)) * store(&(__return.s2),float,qs8_scale(tile,j+2,Ps)) * store(&(__return.s3),float,qs8_scale(tile,j+3,Ps)) */;
int8x8_t vld1_s8(const void *p)
/*@ With (K:Z) (ab:Z) (wb:Z) (tile:Z) (j:Z) (mode:Z) (A:list Z) (Ps:list panel_data)
 Require 0<K && qs8_matrix_wf(K,Ps) && qs8_i8_address_ok(mode,p,ab,wb,K,tile,j,Ps) && CharArray::full(ab,a_read_extent(K),A) * packed_matrix(K,wb,Ps)
 Ensure CharArray::full(ab,a_read_extent(K),A) * packed_matrix(K,wb,Ps) * store(&(__return.s0),char,qs8_char(mode,tile,j,0,A,Ps)) * store(&(__return.s1),char,qs8_char(mode,tile,j,1,A,Ps)) * store(&(__return.s2),char,qs8_char(mode,tile,j,2,A,Ps)) * store(&(__return.s3),char,qs8_char(mode,tile,j,3,A,Ps)) * store(&(__return.s4),char,qs8_char(mode,tile,j,4,A,Ps)) * store(&(__return.s5),char,qs8_char(mode,tile,j,5,A,Ps)) * store(&(__return.s6),char,qs8_char(mode,tile,j,6,A,Ps)) * store(&(__return.s7),char,qs8_char(mode,tile,j,7,A,Ps)) */;
void qcp_qs8_store8(int8_t *p,const int8x8_t *a)
/*@ With (base:Z) (N:Z) (done:Z) (L:list Z) (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z)
 Require 0<=done && done+8<=N && p==base+done && store(&(a->s0),char,x0) * store(&(a->s1),char,x1) * store(&(a->s2),char,x2) * store(&(a->s3),char,x3) * store(&(a->s4),char,x4) * store(&(a->s5),char,x5) * store(&(a->s6),char,x6) * store(&(a->s7),char,x7) * qs8_write_state(base,N,done,L)
 Ensure store(&(a->s0),char,x0) * store(&(a->s1),char,x1) * store(&(a->s2),char,x2) * store(&(a->s3),char,x3) * store(&(a->s4),char,x4) * store(&(a->s5),char,x5) * store(&(a->s6),char,x6) * store(&(a->s7),char,x7) * qs8_write_state(base,N,done+8,qs8_append(L,cons(x0,cons(x1,cons(x2,cons(x3,cons(x4,cons(x5,cons(x6,cons(x7,nil)))))))))) */;
#define vst1_s8(p,a) qcp_qs8_store8((p),&(a))
void qcp_qs8_store_u32(int8_t *p,const uint32x2_t *a,int lane)
/*@ With (base:Z) (N:Z) (done:Z) (L:list Z) (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z)
 Require lane==0 && 0<=done && done+4<=N && p==base+done && store(&(a->s0),char,x0) * store(&(a->s1),char,x1) * store(&(a->s2),char,x2) * store(&(a->s3),char,x3) * store(&(a->s4),char,x4) * store(&(a->s5),char,x5) * store(&(a->s6),char,x6) * store(&(a->s7),char,x7) * qs8_write_state(base,N,done,L)
 Ensure store(&(a->s0),char,x0) * store(&(a->s1),char,x1) * store(&(a->s2),char,x2) * store(&(a->s3),char,x3) * store(&(a->s4),char,x4) * store(&(a->s5),char,x5) * store(&(a->s6),char,x6) * store(&(a->s7),char,x7) * qs8_write_state(base,N,done+4,qs8_append(L,cons(x0,cons(x1,cons(x2,cons(x3,nil)))))) */;
#define vst1_lane_u32(p,a,k) { uint32x2_t qcp_store_tmp; qcp_store_tmp=(a); qcp_qs8_store_u32((p),&qcp_store_tmp,(k)) /*@ where base=c@pre, N=nc@pre, done=(nc@pre-nc) */; }
void qcp_qs8_store_u16(int8_t *p,const uint16x4_t *a,int lane)
/*@ With (base:Z) (N:Z) (done:Z) (L:list Z) (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z)
 Require lane==0 && 0<=done && done+2<=N && p==base+done && store(&(a->s0),char,x0) * store(&(a->s1),char,x1) * store(&(a->s2),char,x2) * store(&(a->s3),char,x3) * store(&(a->s4),char,x4) * store(&(a->s5),char,x5) * store(&(a->s6),char,x6) * store(&(a->s7),char,x7) * qs8_write_state(base,N,done,L)
 Ensure store(&(a->s0),char,x0) * store(&(a->s1),char,x1) * store(&(a->s2),char,x2) * store(&(a->s3),char,x3) * store(&(a->s4),char,x4) * store(&(a->s5),char,x5) * store(&(a->s6),char,x6) * store(&(a->s7),char,x7) * qs8_write_state(base,N,done+2,qs8_append(L,cons(x0,cons(x1,nil)))) */;
#define vst1_lane_u16(p,a,k) { uint16x4_t qcp_store_tmp; qcp_store_tmp=(a); qcp_qs8_store_u16((p),&qcp_store_tmp,(k)) /*@ where base=c@pre, N=nc@pre, done=(nc@pre-nc)+(nc&4) */; }
void qcp_qs8_store_lane(int8_t *p,const int8x8_t *a,int lane)
/*@ With (base:Z) (N:Z) (done:Z) (L:list Z) (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z)
 Require lane==0 && 0<=done && done+1<=N && p==base+done && store(&(a->s0),char,x0) * store(&(a->s1),char,x1) * store(&(a->s2),char,x2) * store(&(a->s3),char,x3) * store(&(a->s4),char,x4) * store(&(a->s5),char,x5) * store(&(a->s6),char,x6) * store(&(a->s7),char,x7) * qs8_write_state(base,N,done,L)
 Ensure store(&(a->s0),char,x0) * store(&(a->s1),char,x1) * store(&(a->s2),char,x2) * store(&(a->s3),char,x3) * store(&(a->s4),char,x4) * store(&(a->s5),char,x5) * store(&(a->s6),char,x6) * store(&(a->s7),char,x7) * qs8_write_state(base,N,done+1,qs8_append(L,cons(x0,nil))) */;
#define vst1_lane_s8(p,a,k) qcp_qs8_store_lane((p),&(a),(k))
void qcp_assert(int c)
/*@ Require c!=0 && emp Ensure emp */;
#define assert(x) qcp_assert(x)
