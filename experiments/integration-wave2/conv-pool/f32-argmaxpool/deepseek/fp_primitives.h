#ifndef COMPLEX_FP_PRIMITIVES_H
#define COMPLEX_FP_PRIMITIVES_H
#include "native_types.h"
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
/*@ logic float core_arg_at{L}(float *q0,float *q1,float *q2,float *q3,float *q4,float *q5,float *q6,float *q7,float *q8,integer ch,integer t) =
 t==0?q0[ch]:t==1?q1[ch]:t==2?q2[ch]:t==3?q3[ch]:t==4?q4[ch]:t==5?q5[ch]:t==6?q6[ch]:t==7?q7[ch]:q8[ch];
 logic float core_arg_v{L}(float old,float *q0,float *q1,float *q2,float *q3,float *q4,float *q5,float *q6,float *q7,float *q8,integer ch,boolean have,integer t) =
 t<=0 ? (have?old:q0[ch]) :
 (\lt_float(core_arg_v(old,q0,q1,q2,q3,q4,q5,q6,q7,q8,ch,have,t-1),core_arg_at(q0,q1,q2,q3,q4,q5,q6,q7,q8,ch,t-1)) ? core_arg_at(q0,q1,q2,q3,q4,q5,q6,q7,q8,ch,t-1) : core_arg_v(old,q0,q1,q2,q3,q4,q5,q6,q7,q8,ch,have,t-1));
 logic integer core_arg_i{L}(float old,integer oi,integer first,float *q0,float *q1,float *q2,float *q3,float *q4,float *q5,float *q6,float *q7,float *q8,integer ch,boolean have,integer t) =
 t<=0 ? (have?oi:first) :
 (\lt_float(core_arg_v(old,q0,q1,q2,q3,q4,q5,q6,q7,q8,ch,have,t-1),core_arg_at(q0,q1,q2,q3,q4,q5,q6,q7,q8,ch,t-1)) ? first+t-1 : core_arg_i(old,oi,first,q0,q1,q2,q3,q4,q5,q6,q7,q8,ch,have,t-1)); */
/*@ ghost
/@ terminates \true; assigns \nothing;
 ensures !\lt_float(old,next) ==> (\lt_float(old,next)?newi:oldi)==oldi;
 ensures (\is_NaN(old)||\is_NaN(next)||\eq_float(old,next)) ==> !\lt_float(old,next); @/
void proof_arg_tie(float old,float next,uint32_t oldi,uint32_t newi) {}
*/

/*@
 logic float core_arg_prefix_v{L}(float **table,integer ch,integer n) = n<=1?table[0][ch]:
 (\lt_float(core_arg_prefix_v(table,ch,n-1),table[n-1][ch])?table[n-1][ch]:core_arg_prefix_v(table,ch,n-1));
 logic integer core_arg_prefix_i{L}(float **table,integer ch,integer n) = n<=1?0:
 (\lt_float(core_arg_prefix_v(table,ch,n-1),table[n-1][ch])?n-1:core_arg_prefix_i(table,ch,n-1));
 lemma core_arg_repeat_value: \forall float a,b;
 ext_same((\lt_float((\lt_float(a,b)?b:a),b)?b:(\lt_float(a,b)?b:a)),(\lt_float(a,b)?b:a));
 lemma core_arg_repeat_index: \forall float a,b; \forall integer old,first,repeat;
 (\lt_float((\lt_float(a,b)?b:a),b)?repeat:(\lt_float(a,b)?first:old)) == (\lt_float(a,b)?first:old);
*/

/*@
 lemma core_arg_prefix_value_step{L}: \forall float **table; \forall integer ch,n;n>=1 ==>
 ext_same(core_arg_prefix_v(table,ch,n+1),(\lt_float(core_arg_prefix_v(table,ch,n),table[n][ch])?table[n][ch]:core_arg_prefix_v(table,ch,n)));
 lemma core_arg_prefix_index_step{L}: \forall float **table; \forall integer ch,n;n>=1 ==>
 core_arg_prefix_i(table,ch,n+1)==(\lt_float(core_arg_prefix_v(table,ch,n),table[n][ch])?n:core_arg_prefix_i(table,ch,n));
*/


/*@ logic integer repr32(float x); logic float from_repr32(integer u); */
/*@ lemma core_u32_bytes{L}: \forall uint32_t *p;
 \valid_read(p) ==> *p==((unsigned char*)p)[0]+256*((unsigned char*)p)[1]+65536*((unsigned char*)p)[2]+16777216*((unsigned char*)p)[3]; */

/*@ lemma core_equal_u32_bytes{L}: \forall uint32_t *p,*q;
 \valid_read(p) && \valid_read(q) && (\forall integer b;0<=b<4 ==> ((unsigned char*)p)[b]==((unsigned char*)q)[b]) ==> *p==*q; */

/*@ lemma core_u32_byte_offset{L}: \forall uint32_t *p; \forall integer i,b;
 0<=i && 0<=b<4 && \valid_read(p+i) ==> ((unsigned char*)(p+i))[b]==((unsigned char*)p)[4*i+b]; */

/*@
 \wp::strategy CoreOffsetSolve: \prover("cvc5",5),\prover("z3",5);
 \wp::strategy CoreOffsetUnfold:
  \tactic("Wp.unfold",\ingoal(shift_uint32(P,I)),\children(CoreOffsetUnfold)),
  \tactic("Wp.unfold",\ingoal(shift_uint8(P,I)),\children(CoreOffsetUnfold)),CoreOffsetSolve;
 \wp::proof CoreOffsetUnfold:core_u32_byte_offset;
*/

/*@ lemma core_u32_byte_view{L}: \forall uint32_t *p; \forall integer i,b; 0<=i && 0<=b<4 ==> ((unsigned char*)(p+i))[b]==((unsigned char*)p)[4*i+b]; \wp::proof CoreOffsetUnfold:core_u32_byte_view; */


/*@
 \wp::strategy BslSolve: \prover("cvc5",5),\prover("z3",5);
 \wp::strategy BslLayout:
 \tactic("Wp.unfold",\ingoal(shiftfield_F5_lane(P)),\children(BslLayout)),
 \tactic("Wp.unfold",\ingoal(shiftfield_F9_lane(P)),\children(BslLayout)),
 \tactic("Wp.unfold",\ingoal(shift_uint32(P,I)),\children(BslLayout)),
 \tactic("Wp.unfold",\ingoal(shift_float32(P,I)),\children(BslLayout)),
 \tactic("Wp.unfold",\ingoal(shift_sint8(P,I)),\children(BslLayout)),
 \tactic("Wp.unfold",\ingoal(shift_uint8(P,I)),\children(BslLayout)),BslSolve;
 \wp::proof BslLayout:vbslq_f32;
 \wp::strategy BslRange4: \tactic("Wp.range",\ingoal(shift_uint32(P,I)),\select(I),\param("inf",0),\param("sup",3),\children(BslLayout)),BslLayout;
 \wp::proof BslRange4:bsl_a_words,bsl_b_words,bsl_result_words;
*/
/*@ lemma core_u32_full_mask: \forall uint32_t a; (4294967295 & a)==a;
 lemma core_bsl_mask_extremes: \forall uint32_t a,b,m; (m==4294967295 ==> ((m&a)|((uint32_t)~m&b))==a) && (m==0 ==> ((m&a)|((uint32_t)~m&b))==b);
 \wp::strategy BslBits: \tactic("Wp.bitwised",\param("Wp.bitwised.range",32),\children(BslSolve)),BslSolve;
 \wp::proof BslBits:core_u32_full_mask;
 \wp::strategy BslBytes16: \tactic("Wp.range",\ingoal(shift_uint8(P,I)),\select(I),\param("inf",0),\param("sup",15),\children(BslLayout)),BslLayout;
 \wp::proof BslBytes16:bsl_result_bytes;
*/

#endif
