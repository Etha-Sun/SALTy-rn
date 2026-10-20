#ifndef COMPLEX_FP_PRIMITIVES_H
#define COMPLEX_FP_PRIMITIVES_H
#include "native_types.h"
/*@ lemma core_byte_and_clip: \forall integer x,y;0<=x<=255 && 0<=y<=255 ==>
 (255 & (x & y))==(x & y); */
/*@ lemma core_u32_add_cast: \forall integer a,b;
 (uint32_t)((uint32_t)a+(uint32_t)b)==(uint32_t)(a+b);
 lemma core_u32_mul_cast: \forall integer a,b;
 (uint32_t)((uint32_t)a*(uint32_t)b)==(uint32_t)(a*b);
*/
/*@ lemma core_i16_product_range: \forall integer x,y;
 -32768<=x<=32767 && -32768<=y<=32767 ==> -1073741824<=x*y<=1073741824; */
/*@
 predicate ext_same(float x,float y) = (\is_NaN(x) && \is_NaN(y)) || (\eq_float(x,y) && \sign(x)==\sign(y));
 logic float complex_add32(float x,float y);
 logic float complex_sub32(float x,float y);
 logic float complex_mul32(float x,float y);
 logic float ext_num_min32(float a,float b) = \is_NaN(a) ? (\is_NaN(b)?a:b) : (\is_NaN(b)?a:(\lt_float(a,b)?a:(\lt_float(b,a)?b:(\sign(a)==\Negative?a:b))));
 logic float ext_num_max32(float a,float b) = \is_NaN(a) ? (\is_NaN(b)?a:b) : (\is_NaN(b)?a:(\lt_float(b,a)?a:(\lt_float(a,b)?b:(\sign(a)==\Positive?a:b))));
 logic float ext_neon_min32(float a,float b) = \is_NaN(a)?a:(\is_NaN(b)?b:ext_num_min32(a,b));
 logic float ext_neon_max32(float a,float b) = \is_NaN(a)?a:(\is_NaN(b)?b:ext_num_max32(a,b));
 lemma ext_same_refl: \forall float a; ext_same(a,a);
 lemma ext_same_trans: \forall float a,b,c; ext_same(a,b) && ext_same(b,c) ==> ext_same(a,c);
 lemma ext_add_congruence: \forall float a,b,c; ext_same(a,b) ==> ext_same(complex_add32(a,c),complex_add32(b,c));
 lemma ext_mul_congruence: \forall float a,b,c; ext_same(a,b) ==> ext_same(complex_mul32(a,c),complex_mul32(b,c));
 lemma ext_sub_congruence: \forall float a,b,c; ext_same(a,b) ==> ext_same(complex_sub32(a,c),complex_sub32(b,c));
*/
int fp_nan(float x);
float canonical_nan(void);
float min_number(float a,float b);
float max_number(float a,float b);
float neon_min(float a,float b);
float neon_max(float a,float b);
float32x4_t vld1q_f32(const float *p);
float32x2_t vld1_f32(const float *p);
float32x4_t vdupq_n_f32(float x);
float32x4_t vld1q_dup_f32(const float *p);
float32x4_t vdupq_lane_f32(float32x2_t v,int lane);
float32x4_t vfmaq_f32(float32x4_t a,float32x4_t b,float32x4_t c);
float32x4_t vminq_f32(float32x4_t a,float32x4_t b);
float32x4_t vmaxq_f32(float32x4_t a,float32x4_t b);
void vst1q_f32(float *p,float32x4_t v);
void vst1_f32(float *p,float32x2_t v);
void vst1_lane_f32(float *p,float32x2_t v,int lane);
float32x2_t vget_low_f32(float32x4_t v);
float32x2_t vget_high_f32(float32x4_t v);
size_t __riscv_vsetvl_e32m4(size_t n);
vfloat32m4_t __riscv_vle32_v_f32m4(const float *p,size_t vl);
vfloat32m4_t __riscv_vfmacc_vf_f32m4(vfloat32m4_t a,float b,vfloat32m4_t c,size_t vl);
vfloat32m4_t __riscv_vfmin_vf_f32m4(vfloat32m4_t a,float b,size_t vl);
vfloat32m4_t __riscv_vfmax_vf_f32m4(vfloat32m4_t a,float b,size_t vl);
void __riscv_vse32_v_f32m4(float *p,vfloat32m4_t v,size_t vl);
vbool8_t __riscv_vmfne_vv_f32m4_b8(vfloat32m4_t a,vfloat32m4_t b,size_t vl);
vfloat32m4_t __riscv_vfmerge_vfm_f32m4(vfloat32m4_t a,float value,vbool8_t mask,size_t vl);
vfloat32m4_t __riscv_vfmv_v_f_f32m4(float value,size_t vl);
void xnn_prefetch_to_l1(const void *p);
size_t round_down_po2(size_t n,size_t q);
size_t round_up_po2(size_t n,size_t q);
size_t doz(size_t n,size_t d);
float32x4_t vmovq_n_f32(float x);
float32x2_t vld1_dup_f32(const float *p);
float32x4x2_t vld2q_dup_f32(const float *p);
float32x2x2_t vld2_dup_f32(const float *p);
float32x4_t vcombine_f32(float32x2_t a,float32x2_t b);
float32x4_t vextq_f32(float32x4_t a,float32x4_t b,int n);
float32x4_t vfmaq_lane_f32(float32x4_t a,float32x4_t b,float32x2_t c,int n);
float32x4_t vfmaq_laneq_f32(float32x4_t a,float32x4_t b,float32x4_t c,int n);
float32x2_t vfma_f32(float32x2_t a,float32x2_t b,float32x2_t c);
float32x4_t vmulq_f32(float32x4_t a,float32x4_t b);
float32x4_t vaddq_f32(float32x4_t a,float32x4_t b);
float32x4_t vsubq_f32(float32x4_t a,float32x4_t b);
float32x4_t vmlaq_f32(float32x4_t a,float32x4_t b,float32x4_t c);
float32x2_t vmin_f32(float32x2_t a,float32x2_t b);
float32x2_t vmax_f32(float32x2_t a,float32x2_t b);
float vget_lane_f32(float32x2_t a,int n);
float vaddv_f32(float32x2_t a);
float vaddvq_f32(float32x4_t a);
uint32x4_t vld1q_u32(const uint32_t *p);
uint32x4_t vdupq_n_u32(uint32_t x);
uint32x4_t vaddq_u32(uint32x4_t a,uint32x4_t b);
uint32x4_t vandq_u32(uint32x4_t a,uint32x4_t b);
uint32x4_t vbicq_u32(uint32x4_t a,uint32x4_t b);
uint32x4_t vcgtq_f32(float32x4_t a,float32x4_t b);
uint32x4_t vcltq_f32(float32x4_t a,float32x4_t b);
uint32x4_t vbslq_u32(uint32x4_t m,uint32x4_t a,uint32x4_t b);
float32x4_t vbslq_f32(uint32x4_t m,float32x4_t a,float32x4_t b);
void vst1q_u32(uint32_t *p,uint32x4_t a);
uint32x2_t vget_low_u32(uint32x4_t a);
uint32x2_t vget_high_u32(uint32x4_t a);
void vst1_u32(uint32_t *p,uint32x2_t a);
void vst1_lane_u32(uint32_t *p,uint32x2_t a,int n);
int32x4_t vreinterpretq_s32_f32(float32x4_t a);
uint32x4_t vreinterpretq_u32_f32(float32x4_t a);
float32x4_t vreinterpretq_f32_s32(int32x4_t a);
float32x4_t vreinterpretq_f32_u32(uint32x4_t a);
int32x4_t vshlq_n_s32(int32x4_t a,int n);
float32x4_t vld1q_lane_f32(const float *p,float32x4_t a,int n);
void vst1q_lane_f32(float *p,float32x4_t a,int n);
float32x4_t vzip1q_f32(float32x4_t a,float32x4_t b);
float32x4_t vzip2q_f32(float32x4_t a,float32x4_t b);
size_t __riscv_vsetvlmax_e32m4(void);
vfloat32m4_t __riscv_vfmul_vv_f32m4(vfloat32m4_t a,vfloat32m4_t b,size_t vl);
vfloat32m4_t __riscv_vfadd_vv_f32m4(vfloat32m4_t a,vfloat32m4_t b,size_t vl);
vfloat32m4_t __riscv_vfsub_vf_f32m4(vfloat32m4_t a,float b,size_t vl);
vfloat32m4_t __riscv_vfmacc_vv_f32m4(vfloat32m4_t a,vfloat32m4_t b,vfloat32m4_t c,size_t vl);
vfloat32m4_t __riscv_vfmadd_vf_f32m4(vfloat32m4_t a,float b,vfloat32m4_t c,size_t vl);
vfloat32m4_t __riscv_vfadd_vv_f32m4_tu(vfloat32m4_t dest,vfloat32m4_t a,vfloat32m4_t b,size_t vl);
vbool8_t __riscv_vmflt_vf_f32m4_b8(vfloat32m4_t a,float b,size_t vl);
vint32m4_t __riscv_vreinterpret_v_f32m4_i32m4(vfloat32m4_t a);
vfloat32m4_t __riscv_vreinterpret_v_i32m4_f32m4(vint32m4_t a);
vint32m4_t __riscv_vsll_vx_i32m4(vint32m4_t a,unsigned n,size_t vl);
size_t __riscv_vsetvl_e32m1(size_t n);
size_t __riscv_vsetvlmax_e32m1(void);
vfloat32m1_t __riscv_vle32_v_f32m1(const float *p,size_t vl);
void __riscv_vse32_v_f32m1(float *p,vfloat32m1_t a,size_t vl);
vfloat32m1_t __riscv_vfmv_v_f_f32m1(float x,size_t vl);
vfloat32m1_t __riscv_vfmax_vf_f32m1(vfloat32m1_t a,float b,size_t vl);
vfloat32m1_t __riscv_vfmin_vf_f32m1(vfloat32m1_t a,float b,size_t vl);
vfloat32m1_t __riscv_vfmul_vf_f32m1(vfloat32m1_t a,float b,size_t vl);
vfloat32m1_t __riscv_vfmax_vv_f32m1(vfloat32m1_t a,vfloat32m1_t b,size_t vl);
vfloat32m1_t __riscv_vfmin_vv_f32m1(vfloat32m1_t a,vfloat32m1_t b,size_t vl);
vfloat32m1_t __riscv_vfadd_vv_f32m1(vfloat32m1_t a,vfloat32m1_t b,size_t vl);
vfloat32m1_t __riscv_vfmul_vv_f32m1(vfloat32m1_t a,vfloat32m1_t b,size_t vl);
vfloat32m1_t __riscv_vfmacc_vf_f32m1(vfloat32m1_t a,float b,vfloat32m1_t c,size_t vl);
vfloat32m1_t __riscv_vfmacc_vv_f32m1(vfloat32m1_t a,vfloat32m1_t b,vfloat32m1_t c,size_t vl);
vbool32_t __riscv_vmfgt_vv_f32m1_b32(vfloat32m1_t a,vfloat32m1_t c,size_t vl);
vbool32_t __riscv_vmfne_vv_f32m1_b32(vfloat32m1_t a,vfloat32m1_t c,size_t vl);
vfloat32m1_t __riscv_vmerge_vvm_f32m1(vfloat32m1_t a,vfloat32m1_t c,vbool32_t mask,size_t vl);
vfloat32m1_t __riscv_vfmerge_vfm_f32m1(vfloat32m1_t a,float c,vbool32_t mask,size_t vl);
vfloat32m1_t __riscv_vfslide1up_vf_f32m1(vfloat32m1_t a,float x,size_t vl);
vfloat32m1_t __riscv_vfslide1down_vf_f32m1(vfloat32m1_t a,float x,size_t vl);
size_t __riscv_vsetvl_e32m2(size_t n);
size_t __riscv_vsetvlmax_e32m2(void);
vfloat32m2_t __riscv_vle32_v_f32m2(const float *p,size_t vl);
void __riscv_vse32_v_f32m2(float *p,vfloat32m2_t a,size_t vl);
vfloat32m2_t __riscv_vfmv_v_f_f32m2(float x,size_t vl);
vfloat32m2_t __riscv_vfmax_vf_f32m2(vfloat32m2_t a,float b,size_t vl);
vfloat32m2_t __riscv_vfmin_vf_f32m2(vfloat32m2_t a,float b,size_t vl);
vfloat32m2_t __riscv_vfmul_vf_f32m2(vfloat32m2_t a,float b,size_t vl);
vfloat32m2_t __riscv_vfmax_vv_f32m2(vfloat32m2_t a,vfloat32m2_t b,size_t vl);
vfloat32m2_t __riscv_vfmin_vv_f32m2(vfloat32m2_t a,vfloat32m2_t b,size_t vl);
vfloat32m2_t __riscv_vfadd_vv_f32m2(vfloat32m2_t a,vfloat32m2_t b,size_t vl);
vfloat32m2_t __riscv_vfmul_vv_f32m2(vfloat32m2_t a,vfloat32m2_t b,size_t vl);
vfloat32m2_t __riscv_vfmacc_vf_f32m2(vfloat32m2_t a,float b,vfloat32m2_t c,size_t vl);
vfloat32m2_t __riscv_vfmacc_vv_f32m2(vfloat32m2_t a,vfloat32m2_t b,vfloat32m2_t c,size_t vl);
vbool16_t __riscv_vmfgt_vv_f32m2_b16(vfloat32m2_t a,vfloat32m2_t c,size_t vl);
vbool16_t __riscv_vmfne_vv_f32m2_b16(vfloat32m2_t a,vfloat32m2_t c,size_t vl);
vfloat32m2_t __riscv_vmerge_vvm_f32m2(vfloat32m2_t a,vfloat32m2_t c,vbool16_t mask,size_t vl);
vfloat32m2_t __riscv_vfmerge_vfm_f32m2(vfloat32m2_t a,float c,vbool16_t mask,size_t vl);
vfloat32m2_t __riscv_vfslide1up_vf_f32m2(vfloat32m2_t a,float x,size_t vl);
vfloat32m2_t __riscv_vfslide1down_vf_f32m2(vfloat32m2_t a,float x,size_t vl);
size_t __riscv_vsetvl_e32m8(size_t n);
size_t __riscv_vsetvlmax_e32m8(void);
vfloat32m8_t __riscv_vle32_v_f32m8(const float *p,size_t vl);
void __riscv_vse32_v_f32m8(float *p,vfloat32m8_t a,size_t vl);
vfloat32m8_t __riscv_vfmv_v_f_f32m8(float x,size_t vl);
vfloat32m8_t __riscv_vfmax_vf_f32m8(vfloat32m8_t a,float b,size_t vl);
vfloat32m8_t __riscv_vfmin_vf_f32m8(vfloat32m8_t a,float b,size_t vl);
vfloat32m8_t __riscv_vfmul_vf_f32m8(vfloat32m8_t a,float b,size_t vl);
vfloat32m8_t __riscv_vfmax_vv_f32m8(vfloat32m8_t a,vfloat32m8_t b,size_t vl);
vfloat32m8_t __riscv_vfmin_vv_f32m8(vfloat32m8_t a,vfloat32m8_t b,size_t vl);
vfloat32m8_t __riscv_vfadd_vv_f32m8(vfloat32m8_t a,vfloat32m8_t b,size_t vl);
vfloat32m8_t __riscv_vfmul_vv_f32m8(vfloat32m8_t a,vfloat32m8_t b,size_t vl);
vfloat32m8_t __riscv_vfmacc_vf_f32m8(vfloat32m8_t a,float b,vfloat32m8_t c,size_t vl);
vfloat32m8_t __riscv_vfmacc_vv_f32m8(vfloat32m8_t a,vfloat32m8_t b,vfloat32m8_t c,size_t vl);
vbool4_t __riscv_vmfgt_vv_f32m8_b4(vfloat32m8_t a,vfloat32m8_t c,size_t vl);
vbool4_t __riscv_vmfne_vv_f32m8_b4(vfloat32m8_t a,vfloat32m8_t c,size_t vl);
vfloat32m8_t __riscv_vmerge_vvm_f32m8(vfloat32m8_t a,vfloat32m8_t c,vbool4_t mask,size_t vl);
vfloat32m8_t __riscv_vfmerge_vfm_f32m8(vfloat32m8_t a,float c,vbool4_t mask,size_t vl);
vfloat32m8_t __riscv_vfslide1up_vf_f32m8(vfloat32m8_t a,float x,size_t vl);
vfloat32m8_t __riscv_vfslide1down_vf_f32m8(vfloat32m8_t a,float x,size_t vl);
vuint32m8_t __riscv_vle32_v_u32m8(const uint32_t *p,size_t vl);
vuint32m8_t __riscv_vmv_v_x_u32m8(uint32_t x,size_t vl);
vuint32m8_t __riscv_vmerge_vxm_u32m8(vuint32m8_t a,uint32_t x,vbool4_t m,size_t vl);
void __riscv_vse32_v_u32m8(uint32_t *p,vuint32m8_t a,size_t vl);
vfloat32m1_t __riscv_vfredusum_vs_f32m4_f32m1(vfloat32m4_t a,vfloat32m1_t z,size_t vl);
float __riscv_vfmv_f_s_f32m1_f32(vfloat32m1_t a);
vuint32m1_t __riscv_vid_v_u32m1(size_t vl);
vuint32m1_t __riscv_vadd_vx_u32m1(vuint32m1_t a,uint32_t x,size_t vl);
vuint32m1_t __riscv_vmul_vx_u32m1(vuint32m1_t a,uint32_t x,size_t vl);
vint32m1_t __riscv_vreinterpret_v_u32m1_i32m1(vuint32m1_t a);
vint32m1_t __riscv_vadd_vx_i32m1(vint32m1_t a,int32_t x,size_t vl);
vint32m1_t __riscv_vsub_vx_i32m1(vint32m1_t a,int32_t x,size_t vl);
vbool32_t __riscv_vmsge_vx_i32m1_b32(vint32m1_t a,int32_t x,size_t vl);
vbool32_t __riscv_vmslt_vx_i32m1_b32(vint32m1_t a,int32_t x,size_t vl);
vbool32_t __riscv_vmand_mm_b32(vbool32_t a,vbool32_t b,size_t vl);
vfloat32m1_t __riscv_vlse32_v_f32m1(const float *p,ptrdiff_t stride,size_t vl);
int32_t bits_i32(uint32_t u);
int8_t bits_i8(uint8_t u);
/*@ logic integer core_ashr32(integer x,integer n) = x>=0 ? x/(1<<n) : -((-x+(1<<n)-1)/(1<<n));
 lemma core_ashr_power: \forall integer n;0<=n<32 ==> 1<=(1<<n)<=2147483648;
 \wp::strategy Qc4PowerSolve: \prover("cvc5",5),\prover("z3",5);
 \wp::strategy Qc4PowerShift: \tactic("Wp.shift",\ingoal(lsl(1,N)),\children(Qc4PowerSolve)),Qc4PowerSolve;
 \wp::strategy Qc4PowerCases: \tactic("Wp.range",\ingoal(lsl(1,N)),\select(N),\param("inf",0),\param("sup",31),\children(Qc4PowerShift)),Qc4PowerSolve;
 \wp::proof Qc4PowerCases:core_ashr_power;
*/
int32_t arithmetic_shift32(int32_t x,unsigned n);
int8x8_t vmov_n_s8(int8_t x);
int8x8_t vld1_s8(const void *p);
int8x8_t vshl_n_s8(int8x8_t a,unsigned n);
int8x8_t vand_s8(int8x8_t a,int8x8_t b);
int16x8_t vmovl_s8(int8x8_t a);
int16x4_t vget_low_s16(int16x8_t a);
int16x4_t vget_high_s16(int16x8_t a);
int32x4_t vld1q_s32(const void *p);
int32x4_t vld1q_dup_s32(const int32_t *p);
int32x4_t vmulq_s32(int32x4_t a,int32x4_t b);
int32x4_t vmlal_lane_s16(int32x4_t a,int16x4_t b,int16x4_t c,int lane);
int32x4_t vshrq_n_s32(int32x4_t a,unsigned n);
float32x4_t vcvtq_f32_s32(int32x4_t a);
vint32m8_t __riscv_vle32_v_i32m8(const int32_t *p,size_t vl);
vint32m8_t __riscv_vmul_vx_i32m8(vint32m8_t a,int32_t x,size_t vl);
vint8m2_t __riscv_vle8_v_i8m2(const int8_t *p,size_t vl);
vint8m2_t __riscv_vsll_vx_i8m2(vint8m2_t a,unsigned n,size_t vl);
vint8m2_t __riscv_vand_vx_i8m2(vint8m2_t a,int8_t x,size_t vl);
vint16m4_t __riscv_vsext_vf2_i16m4(vint8m2_t a,size_t vl);
vint32m8_t __riscv_vwmacc_vx_i32m8(vint32m8_t a,int16_t x,vint16m4_t b,size_t vl);
vint32m8_t __riscv_vsra_vx_i32m8(vint32m8_t a,unsigned n,size_t vl);
vfloat32m8_t __riscv_vfcvt_f_x_v_f32m8(vint32m8_t a,size_t vl);
vfloat32m1_t __riscv_vlse32_v_f32m1_m(vbool32_t mask,const float *p,ptrdiff_t stride,size_t vl);
/*@ logic integer core_wrap32(integer x) = ((x+2147483648)%4294967296+4294967296)%4294967296-2147483648;
 logic integer core_nibble(integer byte,integer high) = high==0 ? ((byte%16)<8?byte%16:byte%16-16) : ((byte/16)<8?byte/16:byte/16-16);
 logic integer core_qc4_acc{L}(int8_t *a,unsigned char *packed,integer lane,integer zp,integer initial,integer t) =
 t<=0 ? core_wrap32(initial*zp) : core_wrap32(core_qc4_acc(a,packed,lane,zp,initial,t-1)+16*a[t-1]*core_nibble(packed[((t-1)/2)*16+lane],(t-1)%2));
*/
/*@ lemma core_s32_wrap_cast: \forall integer x; (int32_t)(uint32_t)x==core_wrap32(x);
 lemma core_qc4_low_nibble: \forall integer u;0<=u<=255 ==>
 (int8_t)(uint8_t)(u<<4)==16*core_nibble(u,0);
 lemma core_qc4_high_nibble: \forall integer u;0<=u<=255 ==>
 (int8_t)(uint8_t)(u & 240)==16*core_nibble(u,1);
*/
/*@ ghost
/@ requires 0<=u<=255; terminates \true; assigns \nothing;
 ensures -128<=16*core_nibble(u,0)<=112;
 ensures -128<=16*core_nibble(u,1)<=112; @/
void proof_qc4_nibble_range(uint8_t u) {}
*/

/*@ logic float core_qc4_post(integer acc,float input_scale,float filter_scale,float bias,float lower,float upper) =
 ext_neon_min32(ext_neon_max32(shim_fma32(complex_mul32((float)(acc>>4),input_scale),filter_scale,bias),lower),upper); */
/*@
 lemma core_wrap32_idempotent: \forall integer x; core_wrap32(core_wrap32(x))==core_wrap32(x);
 lemma core_wrap32_add: \forall integer x,y; core_wrap32(core_wrap32(x)+y)==core_wrap32(x+y);
 lemma core_qc4_pair_wrap: \forall integer acc,x,y;
 core_wrap32(core_wrap32(acc+x)+y)==core_wrap32(acc+x+y);
 logic float core_qc4_output{L}(int8_t *a,unsigned char *weights,integer kc,integer channel,integer zp,float scale,float lo,float hi) =
 core_qc4_post(core_qc4_acc(a,weights+(channel/16)*(192+8*kc)+64,channel%16,zp,
 ((int32_t*)(weights+(channel/16)*(192+8*kc)))[channel%16],kc),scale,
 ((float*)(weights+(channel/16)*(192+8*kc)+64+8*kc))[channel%16],
 ((float*)(weights+(channel/16)*(192+8*kc)+128+8*kc))[channel%16],lo,hi);
*/

/*@
 lemma core_qc4_single_step{L}: \forall int8_t *a; \forall unsigned char *packed; \forall integer lane,zp,initial,t;t>=0 ==>
 core_qc4_acc(a,packed,lane,zp,initial,t+1)==core_wrap32(core_qc4_acc(a,packed,lane,zp,initial,t)+16*a[t]*core_nibble(packed[(t/2)*16+lane],t%2));
 lemma core_qc4_pair_step{L}: \forall int8_t *a; \forall unsigned char *packed; \forall integer lane,zp,initial,t;t>=0 ==>
 core_qc4_acc(a,packed,lane,zp,initial,t+2)==core_wrap32(core_wrap32(core_qc4_acc(a,packed,lane,zp,initial,t)+16*a[t]*core_nibble(packed[(t/2)*16+lane],t%2))+16*a[t+1]*core_nibble(packed[((t+1)/2)*16+lane],(t+1)%2));
*/

/*@
 \wp::strategy Qc4StepSolve: \prover("cvc5",10), \prover("z3",10);
 \wp::strategy Qc4UnrollOne:
  \tactic("Wp.unfold",\ingoal(L_core_qc4_acc(M,A,P,J,Z,I,1+T)),\children(Qc4StepSolve)),Qc4StepSolve;
 \wp::strategy Qc4UnrollTwo:
  \tactic("Wp.unfold",\ingoal(L_core_qc4_acc(M,A,P,J,Z,I,2+T)),\children(Qc4UnrollOne)),Qc4StepSolve;
 \wp::proof Qc4UnrollTwo:core_qc4_pair_step;
*/
/*@ lemma core_u32_bytes{L}: \forall uint32_t *p;
 \valid_read(p) ==> *p==((unsigned char*)p)[0]+256*((unsigned char*)p)[1]+65536*((unsigned char*)p)[2]+16777216*((unsigned char*)p)[3]; */

/*@ 
 lemma ci_unsigned_view{L}: \forall uint32_t *p; \valid_read(p) ==> *(int32_t*)p==(int32_t)*p; */

/*@ lemma core_equal_u32_bytes{L}: \forall uint32_t *p,*q;
 \valid_read(p) && \valid_read(q) && (\forall integer b;0<=b<4 ==> ((unsigned char*)p)[b]==((unsigned char*)q)[b]) ==> *p==*q; */
/*@ \wp::strategy Qc4EqualBytesSolve: \prover("z3",20),\prover("cvc5",20);
 \wp::strategy Qc4EqualBytesUnfold:
 \tactic("Wp.unfold",\ingoal(read_uint32(M,P)),\children(Qc4EqualBytesUnfold)),Qc4EqualBytesSolve;
 \wp::proof Qc4EqualBytesUnfold:core_equal_u32_bytes;
*/

/*@ \wp::strategy ProductSolve: \prover("cvc5",5),\prover("z3",5);
 \wp::strategy ProductYSign:
 \tactic("Wp.cut",\ingoal(X*Y),\param("case","CASES"),\param("clause",Y>=0),\children(ProductSolve)),ProductSolve;
 \wp::strategy ProductSigns:
 \tactic("Wp.cut",\ingoal(X*Y),\param("case","CASES"),\param("clause",X>=0),\children(ProductYSign)),ProductSolve;
 \wp::proof ProductSigns:core_i16_product_range;
 \wp::strategy ProductPoint:
 \tactic("Wp.lemma",\ingoal(X*Y),\param("lemma","core_i16_product_range"),\param("P1",X),\param("P2",Y),\children(ProductSolve)),ProductSolve;
 \wp::proof ProductPoint:qc4_mac_product_range;
*/

/*@ \wp::strategy Qc4ByteShiftSolve: \prover("z3",5),\prover("cvc5",5);
 \wp::strategy Qc4ByteShiftNormalize: \tactic("Wp.shift",\ingoal(lsl(X,N)),\children(Qc4ByteShiftSolve)),Qc4ByteShiftSolve;
 \wp::strategy Qc4ByteShiftRange:
 \tactic("Wp.range",\ingoal(lsl(X,N)),\select(N),\param("inf",0),\param("sup",7),\children(Qc4ByteShiftNormalize)),Qc4ByteShiftSolve;
 \wp::proof Qc4ByteShiftRange:qc4_byte_shift_range;
*/

/*@ \wp::strategy Qc4NibbleSolve: \prover("cvc5",5),\prover("z3",5);
 \wp::strategy Qc4NibbleUnfold:
 \tactic("Wp.unfold",\ingoal(L_core_nibble(U,H)),\children(Qc4NibbleSolve)),Qc4NibbleSolve;
 \wp::strategy Qc4NibbleCases:
 \tactic("Wp.range",\ingoal(L_core_nibble(U,H)),\select(U),\param("inf",0),\param("sup",255),\children(Qc4NibbleUnfold)),Qc4NibbleUnfold;
 \wp::proof Qc4NibbleCases:core_qc4_low_nibble,core_qc4_high_nibble;
*/

/*@ \wp::strategy ByteClipSolve: \prover("cvc5",5),\prover("z3",5);
 \wp::strategy ByteClipRanges: \tactic("Wp.bitrange",\children(ByteClipSolve)),ByteClipSolve;
 \wp::strategy ByteClipBits: \tactic("Wp.bitwised",\param("Wp.bitwised.range",8),\children(ByteClipRanges)),ByteClipRanges;
 \wp::proof ByteClipBits:core_byte_and_clip;
*/


/*@ \wp::strategy Qc4NibblePostSolve: \prover("cvc5",5),\prover("z3",5);
 \wp::strategy Qc4LowPost:
 \tactic("Wp.lemma",\ingoal(L_core_nibble(U,H)),\param("lemma","core_qc4_low_nibble"),\param("P1",U),\children(Qc4NibblePostSolve)),Qc4NibblePostSolve;
 \wp::strategy Qc4HighPostClip:
 \tactic("Wp.lemma",\ingoal(L_core_nibble(U,H)),\param("lemma","core_byte_and_clip"),\param("P1",240),\param("P2",U),\children(Qc4NibblePostSolve)),Qc4NibblePostSolve;
 \wp::strategy Qc4HighPost:
 \tactic("Wp.lemma",\ingoal(L_core_nibble(U,H)),\param("lemma","core_qc4_high_nibble"),\param("P1",U),\children(Qc4HighPostClip)),Qc4HighPostClip;
 \wp::proof Qc4LowPost:core_low_value_vshl_n_s8,core_low_value___riscv_vsll_vx_i8m2;
 \wp::proof Qc4HighPost:core_high_value_vand_s8,core_high_value___riscv_vand_vx_i8m2;
*/


/*@ \wp::strategy Qc4WordLoadSolve: \prover("cvc5",5),\prover("z3",5);
 \wp::strategy Qc4WordLoadUnfold:
 \tactic("Wp.unfold",\ingoal(shiftfield_F11_lane(P)),\children(Qc4WordLoadUnfold)),
 \tactic("Wp.unfold",\ingoal(shift_sint32(P,I)),\children(Qc4WordLoadUnfold)),
 \tactic("Wp.unfold",\ingoal(shift_uint32(P,I)),\children(Qc4WordLoadUnfold)),
 \tactic("Wp.unfold",\ingoal(shift_uint8(P,I)),\children(Qc4WordLoadUnfold)),Qc4WordLoadSolve;
 \wp::proof Qc4WordLoadUnfold:vld1q_s32;
*/

/*@ lemma core_u32_byte_offset{L}: \forall uint32_t *p; \forall integer i,b;
 0<=i && 0<=b<4 && \valid_read(p+i) ==> ((unsigned char*)(p+i))[b]==((unsigned char*)p)[4*i+b];
 \wp::strategy Qc4OffsetSolve: \prover("cvc5",5),\prover("z3",5);
 \wp::strategy Qc4OffsetUnfold:
 \tactic("Wp.unfold",\ingoal(shift_uint32(P,I)),\children(Qc4OffsetUnfold)),
 \tactic("Wp.unfold",\ingoal(shift_uint8(P,I)),\children(Qc4OffsetUnfold)),Qc4OffsetSolve;
 \wp::proof Qc4OffsetUnfold:core_u32_byte_offset;
*/
/*@ lemma core_ashr_floor_range: \forall integer x,d; -2147483648<=x<=2147483647 && 1<=d<=2147483648 ==> -2147483648<=(x>=0?x/d:-((-x+d-1)/d))<=2147483647; \wp::strategy Qc4ShiftPostUnfold: \tactic("Wp.unfold",\ingoal(L_core_ashr32(X,N)),\children(Qc4PowerSolve)),Qc4PowerSolve; \wp::proof Qc4ShiftPostUnfold:arithmetic_shift32,qc4_shift_casted_formula; */

/*@ lemma core_u32_shift_four: \forall uint32_t u; (u>>4)==u/16;
 lemma core_i32_shift_four_word: \forall int32_t x; (uint32_t)(x>>4)==(((uint32_t)x>>4)|(x<0?4026531840:0));
 \wp::strategy Qc4ShiftMathSolve: \prover("cvc5",10),\prover("z3",10);
 \wp::strategy Qc4UnsignedShift: \tactic("Wp.shift",\ingoal(lsr(U,4)),\children(Qc4ShiftMathSolve)),Qc4ShiftMathSolve;
 \wp::proof Qc4UnsignedShift:core_u32_shift_four;
 \wp::strategy Qc4ShiftBitRanges: \tactic("Wp.bitrange",\children(Qc4ShiftMathSolve)),Qc4ShiftMathSolve;
 \wp::strategy Qc4ShiftBits: \tactic("Wp.bitwised",\param("Wp.bitwised.range",32),\children(Qc4ShiftBitRanges)),Qc4ShiftMathSolve;
 \wp::proof Qc4ShiftBits:core_i32_shift_four_word;
*/

/*@ lemma core_u32_lowmask_identity: \forall integer u;0<=u<268435456 ==> (u&268435455)==u; */
/*@ lemma core_u32_signfill_disjoint: \forall integer u;0<=u<268435456 ==> (u&4026531840)==0;
 lemma core_u32_signfill_add: \forall integer u;0<=u<268435456 ==> (u|4026531840)==u+4026531840;
 lemma core_shift_four_negative_div: \forall integer x;-2147483648<=x<0 ==> (x+4294967296)/16-268435456==-((-x+15)/16);
 
*/

/*@ \wp::strategy Qc4LowMask: \tactic("Wp.modmask",\ingoal(land(U,268435455)),\children(Qc4ShiftMathSolve)),Qc4ShiftMathSolve;
 \wp::proof Qc4LowMask:core_u32_lowmask_identity;
 \wp::strategy Qc4MaskRewrite:
 \tactic("Wp.TacRewrite.Left",\when(U==land(U,268435455)),\children(Qc4ShiftMathSolve)),
 \tactic("Wp.TacRewrite.Right",\when(U==land(U,268435455)),\children(Qc4ShiftMathSolve)),
 \tactic("Wp.TacRewrite.Left",\when(land(U,268435455)==U),\children(Qc4ShiftMathSolve)),
 \tactic("Wp.TacRewrite.Right",\when(land(U,268435455)==U),\children(Qc4ShiftMathSolve)),Qc4ShiftMathSolve;
 \wp::strategy Qc4MaskDisjoint: \tactic("Wp.cut",\ingoal(land(U,4026531840)),\param("case","MODUS"),\param("clause",land(U,268435455)==U),\child("Clause",Qc4ShiftMathSolve),\child("Assume",Qc4MaskRewrite),\children(Qc4ShiftMathSolve)),Qc4ShiftMathSolve;
 \wp::strategy Qc4MaskAddition: \tactic("Wp.cut",\ingoal(lor(U,4026531840)),\param("case","MODUS"),\param("clause",land(U,4026531840)==0),\children(Qc4ShiftMathSolve)),Qc4ShiftMathSolve;
 \wp::proof Qc4MaskAddition:core_u32_signfill_add;
*/
/*@ \wp::proof Qc4MaskDisjoint:core_u32_signfill_disjoint; */

/*@ \wp::strategy Qc4MaskDisjointInstance: \tactic("Wp.lemma",\ingoal(land(4026531840,U)),\param("lemma","core_u32_lowmask_identity"),\param("P1",U),\children(Qc4MaskRewrite)),Qc4ShiftMathSolve;
 \wp::strategy Qc4MaskAddInstance: \tactic("Wp.lemma",\ingoal(lor(4026531840,U)),\param("lemma","core_u32_signfill_disjoint"),\param("P1",U),\children(Qc4ShiftMathSolve)),Qc4ShiftMathSolve;
 \wp::proof Qc4MaskDisjointInstance:core_u32_signfill_disjoint;
 \wp::proof Qc4MaskAddInstance:core_u32_signfill_add;
*/
/*@ lemma core_shift_four_wordvalue: \forall int32_t x; (uint32_t)(x>>4)==(x>=0?x/16:-((-x+15)/16)+4294967296); lemma core_shift_four_value: \forall int32_t x; (x>>4)==(x>=0?x/16:-((-x+15)/16)); lemma core_shift_four_floor: \forall int32_t x;core_ashr32(x,4)==(x>>4); \wp::strategy Qc4FloorFourUnfold: \tactic("Wp.unfold",\ingoal(L_core_ashr32(X,4)),\children(Qc4ShiftMathSolve)),Qc4ShiftMathSolve; \wp::proof Qc4FloorFourUnfold:core_shift_four_floor; */
/*@ \wp::strategy Qc4ShiftWordTry: \prover("z3",20),\prover("cvc5",20);
 \wp::strategy Qc4ShiftWordSign:
 \tactic("Wp.cut",\ingoal(X>=0),\param("case","CASES"),\param("clause",X>=0),\children(Qc4ShiftWordTry)),Qc4ShiftWordTry;
 \wp::proof Qc4ShiftWordSign:core_shift_four_wordvalue;
*/
/*@ lemma ext_neon_max_all_congruence: \forall float a,b,c,d;ext_same(a,b) && ext_same(c,d) ==> ext_same(ext_neon_max32(a,c),ext_neon_max32(b,d)); lemma ext_neon_min_all_congruence: \forall float a,b,c,d;ext_same(a,b) && ext_same(c,d) ==> ext_same(ext_neon_min32(a,c),ext_neon_min32(b,d)); */

/*@ lemma qc4_byte_unsigned_view{L}: \forall unsigned char *p;
 \valid_read(p) ==> (uint8_t)*(const int8_t*)p==*p;
 lemma qc4_modulo_cast_add: \forall integer x,y;
 -2147483648<=x<=2147483647 && -2147483648<=y<=2147483647 ==>
 (int32_t)((uint32_t)x+(uint32_t)y)==core_wrap32(x+y);
 \wp::strategy Qc4ModuloCastSolve: \prover("z3",30),\prover("cvc5",30);
 \wp::strategy Qc4ModuloCastUnfold:
 \tactic("Wp.unfold",\ingoal(to_sint32(X)),\children(Qc4ModuloCastUnfold)),
 \tactic("Wp.unfold",\ingoal(to_uint32(X)),\children(Qc4ModuloCastUnfold)),
 \tactic("Wp.unfold",\ingoal(L_core_wrap32(X)),\children(Qc4ModuloCastSolve)),Qc4ModuloCastSolve;
 \wp::strategy Qc4ModuloCastY:
 \tactic("Wp.cut",\ingoal(to_uint32(Y)),\param("case","CASES"),\param("clause",Y>=0),\children(Qc4ModuloCastUnfold)),Qc4ModuloCastUnfold;
 \wp::strategy Qc4ModuloCastX:
 \tactic("Wp.cut",\ingoal(to_uint32(X)),\param("case","CASES"),\param("clause",X>=0),\children(Qc4ModuloCastY)),Qc4ModuloCastY;
 \wp::proof Qc4ModuloCastX:qc4_modulo_cast_add;
*/

/*@ lemma qc4_fma_first_congruence: \forall float a,b,x,y;
 ext_same(a,b) ==> ext_same(shim_fma32(a,x,y),shim_fma32(b,x,y)); */

/*@ logic integer repr32(float x); logic float from_repr32(integer u); */
/*@ lemma qc4_store_float_value: \forall float x; \forall integer b;
 0<=b<=4294967295 ==> ext_same(from_repr32(\is_NaN(x)?(\is_NaN(from_repr32(b))?b:2143289344):repr32(x)),x); */
#endif
