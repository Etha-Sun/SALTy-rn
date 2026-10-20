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
/*@
 logic float *core_table_at{L}(float **table,integer row) = table[row];
 logic float core_row_at{L}(float *row,integer ch) = row[ch];
*/
/*@ logic float core_pool9{L}(float *q0,float *q1,float *q2,float *q3,float *q4,float *q5,float *q6,float *q7,float *q8,integer ch) = ext_neon_max32(ext_neon_max32(ext_neon_max32(q2[ch],q3[ch]),ext_neon_max32(q4[ch],q5[ch])),ext_neon_max32(ext_neon_max32(ext_neon_max32(q0[ch],q1[ch]),q8[ch]),ext_neon_max32(q6[ch],q7[ch]))); */
/*@ ghost
/@ terminates \true; assigns \nothing;
 ensures ext_same(ext_neon_max32(ext_neon_max32(a,b),c),ext_neon_max32(a,ext_neon_max32(b,c))); @/
void proof_pool_max_assoc(float a,float b,float c) {}
/@ terminates \true; assigns \nothing;
 ensures ext_same(ext_neon_max32(a,b),ext_neon_max32(b,a)); @/
void proof_pool_max_commute(float a,float b) {}
*/

/*@
 logic float core_pool_tree(float a,float b,float c,float d,float e,float f,float g,float h,float i) = ext_neon_max32(ext_neon_max32(ext_neon_max32(c,d),ext_neon_max32(e,f)),ext_neon_max32(ext_neon_max32(ext_neon_max32(a,b),i),ext_neon_max32(g,h)));
 logic float core_pool_serial(float a,float b,float c,float d,float e,float f,float g,float h,float i) = ext_neon_max32(ext_neon_max32(ext_neon_max32(ext_neon_max32(ext_neon_max32(ext_neon_max32(ext_neon_max32(ext_neon_max32(a,b),c),d),e),f),g),h),i);
 lemma core_pool_assoc: \forall float a,b,c; ext_same(ext_neon_max32(ext_neon_max32(a,b),c),ext_neon_max32(a,ext_neon_max32(b,c)));
 lemma core_pool_commute: \forall float a,b; ext_same(ext_neon_max32(a,b),ext_neon_max32(b,a));
 lemma core_pool_congruence: \forall float a,b,c,d; ext_same(a,b) && ext_same(c,d) ==> ext_same(ext_neon_max32(a,c),ext_neon_max32(b,d));
 logic float core_pool_chunk{L}(float **table,integer k,integer ch,integer b) =
 core_pool9(table[b*9],table[b*9+1<k?b*9+1:b*9],table[b*9+2<k?b*9+2:b*9],
 table[b*9+3<k?b*9+3:b*9],table[b*9+4<k?b*9+4:b*9],table[b*9+5<k?b*9+5:b*9],
 table[b*9+6<k?b*9+6:b*9],table[b*9+7<k?b*9+7:b*9],table[b*9+8<k?b*9+8:b*9],ch);
 logic float core_pool_prefix{L}(float **table,integer k,integer ch,float lower,float upper,integer blocks) =
 blocks<=1 ? ext_neon_min32(ext_neon_max32(core_pool_chunk(table,k,ch,0),lower),upper) :
 ext_neon_min32(ext_neon_max32(core_pool_prefix(table,k,ch,lower,upper,blocks-1),core_pool_chunk(table,k,ch,blocks-1)),upper);
 lemma core_pool_max_congruence: \forall float a,b,c,d; ext_same(a,b) && ext_same(c,d) ==> ext_same(ext_neon_max32(a,c),ext_neon_max32(b,d));
 lemma core_pool_min_congruence: \forall float a,b,c,d; ext_same(a,b) && ext_same(c,d) ==> ext_same(ext_neon_min32(a,c),ext_neon_min32(b,d));
 lemma core_pool_clamp_congruence: \forall float a,b,l,u; ext_same(a,b) ==> ext_same(ext_neon_min32(ext_neon_max32(a,l),u),ext_neon_min32(ext_neon_max32(b,l),u));
*/

/*@ ghost
/@ terminates \true; assigns \nothing;
 ensures ext_same(core_pool_tree(a,b,c,d,e,f,g,h,i),core_pool_serial(a,b,c,d,e,f,g,h,i)); @/
void proof_pool_tree_serial(float a,float b,float c,float d,float e,float f,float g,float h,float i) {
  /@ assert max_rewrite_0: ext_same(ext_neon_max32(ext_neon_max32(ext_neon_max32(c,d),ext_neon_max32(e,f)),ext_neon_max32(ext_neon_max32(ext_neon_max32(a,b),i),ext_neon_max32(g,h))),ext_neon_max32(ext_neon_max32(c,d),ext_neon_max32(ext_neon_max32(e,f),ext_neon_max32(ext_neon_max32(ext_neon_max32(a,b),i),ext_neon_max32(g,h))))); @/
  /@ assert max_context_0: ext_same(ext_neon_max32(ext_neon_max32(ext_neon_max32(c,d),ext_neon_max32(e,f)),ext_neon_max32(ext_neon_max32(ext_neon_max32(a,b),i),ext_neon_max32(g,h))),ext_neon_max32(ext_neon_max32(c,d),ext_neon_max32(ext_neon_max32(e,f),ext_neon_max32(ext_neon_max32(ext_neon_max32(a,b),i),ext_neon_max32(g,h))))); @/
  /@ assert max_rewrite_1: ext_same(ext_neon_max32(ext_neon_max32(c,d),ext_neon_max32(ext_neon_max32(e,f),ext_neon_max32(ext_neon_max32(ext_neon_max32(a,b),i),ext_neon_max32(g,h)))),ext_neon_max32(c,ext_neon_max32(d,ext_neon_max32(ext_neon_max32(e,f),ext_neon_max32(ext_neon_max32(ext_neon_max32(a,b),i),ext_neon_max32(g,h)))))); @/
  /@ assert max_context_1: ext_same(ext_neon_max32(ext_neon_max32(c,d),ext_neon_max32(ext_neon_max32(e,f),ext_neon_max32(ext_neon_max32(ext_neon_max32(a,b),i),ext_neon_max32(g,h)))),ext_neon_max32(c,ext_neon_max32(d,ext_neon_max32(ext_neon_max32(e,f),ext_neon_max32(ext_neon_max32(ext_neon_max32(a,b),i),ext_neon_max32(g,h)))))); @/
  /@ assert max_rewrite_2: ext_same(ext_neon_max32(ext_neon_max32(e,f),ext_neon_max32(ext_neon_max32(ext_neon_max32(a,b),i),ext_neon_max32(g,h))),ext_neon_max32(e,ext_neon_max32(f,ext_neon_max32(ext_neon_max32(ext_neon_max32(a,b),i),ext_neon_max32(g,h))))); @/
  /@ assert max_context_2: ext_same(ext_neon_max32(c,ext_neon_max32(d,ext_neon_max32(ext_neon_max32(e,f),ext_neon_max32(ext_neon_max32(ext_neon_max32(a,b),i),ext_neon_max32(g,h))))),ext_neon_max32(c,ext_neon_max32(d,ext_neon_max32(e,ext_neon_max32(f,ext_neon_max32(ext_neon_max32(ext_neon_max32(a,b),i),ext_neon_max32(g,h))))))); @/
  /@ assert max_rewrite_3: ext_same(ext_neon_max32(ext_neon_max32(ext_neon_max32(a,b),i),ext_neon_max32(g,h)),ext_neon_max32(ext_neon_max32(a,b),ext_neon_max32(i,ext_neon_max32(g,h)))); @/
  /@ assert max_context_3: ext_same(ext_neon_max32(c,ext_neon_max32(d,ext_neon_max32(e,ext_neon_max32(f,ext_neon_max32(ext_neon_max32(ext_neon_max32(a,b),i),ext_neon_max32(g,h)))))),ext_neon_max32(c,ext_neon_max32(d,ext_neon_max32(e,ext_neon_max32(f,ext_neon_max32(ext_neon_max32(a,b),ext_neon_max32(i,ext_neon_max32(g,h)))))))); @/
  /@ assert max_rewrite_4: ext_same(ext_neon_max32(ext_neon_max32(a,b),ext_neon_max32(i,ext_neon_max32(g,h))),ext_neon_max32(a,ext_neon_max32(b,ext_neon_max32(i,ext_neon_max32(g,h))))); @/
  /@ assert max_context_4: ext_same(ext_neon_max32(c,ext_neon_max32(d,ext_neon_max32(e,ext_neon_max32(f,ext_neon_max32(ext_neon_max32(a,b),ext_neon_max32(i,ext_neon_max32(g,h))))))),ext_neon_max32(c,ext_neon_max32(d,ext_neon_max32(e,ext_neon_max32(f,ext_neon_max32(a,ext_neon_max32(b,ext_neon_max32(i,ext_neon_max32(g,h))))))))); @/
  /@ assert max_rewrite_5: ext_same(ext_neon_max32(f,ext_neon_max32(a,ext_neon_max32(b,ext_neon_max32(i,ext_neon_max32(g,h))))),ext_neon_max32(ext_neon_max32(f,a),ext_neon_max32(b,ext_neon_max32(i,ext_neon_max32(g,h))))); @/
  /@ assert max_context_5: ext_same(ext_neon_max32(c,ext_neon_max32(d,ext_neon_max32(e,ext_neon_max32(f,ext_neon_max32(a,ext_neon_max32(b,ext_neon_max32(i,ext_neon_max32(g,h)))))))),ext_neon_max32(c,ext_neon_max32(d,ext_neon_max32(e,ext_neon_max32(ext_neon_max32(f,a),ext_neon_max32(b,ext_neon_max32(i,ext_neon_max32(g,h)))))))); @/
  /@ assert max_rewrite_6: ext_same(ext_neon_max32(f,a),ext_neon_max32(a,f)); @/
  /@ assert max_context_6: ext_same(ext_neon_max32(c,ext_neon_max32(d,ext_neon_max32(e,ext_neon_max32(ext_neon_max32(f,a),ext_neon_max32(b,ext_neon_max32(i,ext_neon_max32(g,h))))))),ext_neon_max32(c,ext_neon_max32(d,ext_neon_max32(e,ext_neon_max32(ext_neon_max32(a,f),ext_neon_max32(b,ext_neon_max32(i,ext_neon_max32(g,h)))))))); @/
  /@ assert max_rewrite_7: ext_same(ext_neon_max32(ext_neon_max32(a,f),ext_neon_max32(b,ext_neon_max32(i,ext_neon_max32(g,h)))),ext_neon_max32(a,ext_neon_max32(f,ext_neon_max32(b,ext_neon_max32(i,ext_neon_max32(g,h)))))); @/
  /@ assert max_context_7: ext_same(ext_neon_max32(c,ext_neon_max32(d,ext_neon_max32(e,ext_neon_max32(ext_neon_max32(a,f),ext_neon_max32(b,ext_neon_max32(i,ext_neon_max32(g,h))))))),ext_neon_max32(c,ext_neon_max32(d,ext_neon_max32(e,ext_neon_max32(a,ext_neon_max32(f,ext_neon_max32(b,ext_neon_max32(i,ext_neon_max32(g,h))))))))); @/
  /@ assert max_rewrite_8: ext_same(ext_neon_max32(e,ext_neon_max32(a,ext_neon_max32(f,ext_neon_max32(b,ext_neon_max32(i,ext_neon_max32(g,h)))))),ext_neon_max32(ext_neon_max32(e,a),ext_neon_max32(f,ext_neon_max32(b,ext_neon_max32(i,ext_neon_max32(g,h)))))); @/
  /@ assert max_context_8: ext_same(ext_neon_max32(c,ext_neon_max32(d,ext_neon_max32(e,ext_neon_max32(a,ext_neon_max32(f,ext_neon_max32(b,ext_neon_max32(i,ext_neon_max32(g,h)))))))),ext_neon_max32(c,ext_neon_max32(d,ext_neon_max32(ext_neon_max32(e,a),ext_neon_max32(f,ext_neon_max32(b,ext_neon_max32(i,ext_neon_max32(g,h)))))))); @/
  /@ assert max_rewrite_9: ext_same(ext_neon_max32(e,a),ext_neon_max32(a,e)); @/
  /@ assert max_context_9: ext_same(ext_neon_max32(c,ext_neon_max32(d,ext_neon_max32(ext_neon_max32(e,a),ext_neon_max32(f,ext_neon_max32(b,ext_neon_max32(i,ext_neon_max32(g,h))))))),ext_neon_max32(c,ext_neon_max32(d,ext_neon_max32(ext_neon_max32(a,e),ext_neon_max32(f,ext_neon_max32(b,ext_neon_max32(i,ext_neon_max32(g,h)))))))); @/
  /@ assert max_rewrite_10: ext_same(ext_neon_max32(ext_neon_max32(a,e),ext_neon_max32(f,ext_neon_max32(b,ext_neon_max32(i,ext_neon_max32(g,h))))),ext_neon_max32(a,ext_neon_max32(e,ext_neon_max32(f,ext_neon_max32(b,ext_neon_max32(i,ext_neon_max32(g,h))))))); @/
  /@ assert max_context_10: ext_same(ext_neon_max32(c,ext_neon_max32(d,ext_neon_max32(ext_neon_max32(a,e),ext_neon_max32(f,ext_neon_max32(b,ext_neon_max32(i,ext_neon_max32(g,h))))))),ext_neon_max32(c,ext_neon_max32(d,ext_neon_max32(a,ext_neon_max32(e,ext_neon_max32(f,ext_neon_max32(b,ext_neon_max32(i,ext_neon_max32(g,h))))))))); @/
  /@ assert max_rewrite_11: ext_same(ext_neon_max32(d,ext_neon_max32(a,ext_neon_max32(e,ext_neon_max32(f,ext_neon_max32(b,ext_neon_max32(i,ext_neon_max32(g,h))))))),ext_neon_max32(ext_neon_max32(d,a),ext_neon_max32(e,ext_neon_max32(f,ext_neon_max32(b,ext_neon_max32(i,ext_neon_max32(g,h))))))); @/
  /@ assert max_context_11: ext_same(ext_neon_max32(c,ext_neon_max32(d,ext_neon_max32(a,ext_neon_max32(e,ext_neon_max32(f,ext_neon_max32(b,ext_neon_max32(i,ext_neon_max32(g,h)))))))),ext_neon_max32(c,ext_neon_max32(ext_neon_max32(d,a),ext_neon_max32(e,ext_neon_max32(f,ext_neon_max32(b,ext_neon_max32(i,ext_neon_max32(g,h)))))))); @/
  /@ assert max_rewrite_12: ext_same(ext_neon_max32(d,a),ext_neon_max32(a,d)); @/
  /@ assert max_context_12: ext_same(ext_neon_max32(c,ext_neon_max32(ext_neon_max32(d,a),ext_neon_max32(e,ext_neon_max32(f,ext_neon_max32(b,ext_neon_max32(i,ext_neon_max32(g,h))))))),ext_neon_max32(c,ext_neon_max32(ext_neon_max32(a,d),ext_neon_max32(e,ext_neon_max32(f,ext_neon_max32(b,ext_neon_max32(i,ext_neon_max32(g,h)))))))); @/
  /@ assert max_rewrite_13: ext_same(ext_neon_max32(ext_neon_max32(a,d),ext_neon_max32(e,ext_neon_max32(f,ext_neon_max32(b,ext_neon_max32(i,ext_neon_max32(g,h)))))),ext_neon_max32(a,ext_neon_max32(d,ext_neon_max32(e,ext_neon_max32(f,ext_neon_max32(b,ext_neon_max32(i,ext_neon_max32(g,h)))))))); @/
  /@ assert max_context_13: ext_same(ext_neon_max32(c,ext_neon_max32(ext_neon_max32(a,d),ext_neon_max32(e,ext_neon_max32(f,ext_neon_max32(b,ext_neon_max32(i,ext_neon_max32(g,h))))))),ext_neon_max32(c,ext_neon_max32(a,ext_neon_max32(d,ext_neon_max32(e,ext_neon_max32(f,ext_neon_max32(b,ext_neon_max32(i,ext_neon_max32(g,h))))))))); @/
  /@ assert max_rewrite_14: ext_same(ext_neon_max32(c,ext_neon_max32(a,ext_neon_max32(d,ext_neon_max32(e,ext_neon_max32(f,ext_neon_max32(b,ext_neon_max32(i,ext_neon_max32(g,h)))))))),ext_neon_max32(ext_neon_max32(c,a),ext_neon_max32(d,ext_neon_max32(e,ext_neon_max32(f,ext_neon_max32(b,ext_neon_max32(i,ext_neon_max32(g,h)))))))); @/
  /@ assert max_context_14: ext_same(ext_neon_max32(c,ext_neon_max32(a,ext_neon_max32(d,ext_neon_max32(e,ext_neon_max32(f,ext_neon_max32(b,ext_neon_max32(i,ext_neon_max32(g,h)))))))),ext_neon_max32(ext_neon_max32(c,a),ext_neon_max32(d,ext_neon_max32(e,ext_neon_max32(f,ext_neon_max32(b,ext_neon_max32(i,ext_neon_max32(g,h)))))))); @/
  /@ assert max_rewrite_15: ext_same(ext_neon_max32(c,a),ext_neon_max32(a,c)); @/
  /@ assert max_context_15: ext_same(ext_neon_max32(ext_neon_max32(c,a),ext_neon_max32(d,ext_neon_max32(e,ext_neon_max32(f,ext_neon_max32(b,ext_neon_max32(i,ext_neon_max32(g,h))))))),ext_neon_max32(ext_neon_max32(a,c),ext_neon_max32(d,ext_neon_max32(e,ext_neon_max32(f,ext_neon_max32(b,ext_neon_max32(i,ext_neon_max32(g,h)))))))); @/
  /@ assert max_rewrite_16: ext_same(ext_neon_max32(ext_neon_max32(a,c),ext_neon_max32(d,ext_neon_max32(e,ext_neon_max32(f,ext_neon_max32(b,ext_neon_max32(i,ext_neon_max32(g,h))))))),ext_neon_max32(a,ext_neon_max32(c,ext_neon_max32(d,ext_neon_max32(e,ext_neon_max32(f,ext_neon_max32(b,ext_neon_max32(i,ext_neon_max32(g,h))))))))); @/
  /@ assert max_context_16: ext_same(ext_neon_max32(ext_neon_max32(a,c),ext_neon_max32(d,ext_neon_max32(e,ext_neon_max32(f,ext_neon_max32(b,ext_neon_max32(i,ext_neon_max32(g,h))))))),ext_neon_max32(a,ext_neon_max32(c,ext_neon_max32(d,ext_neon_max32(e,ext_neon_max32(f,ext_neon_max32(b,ext_neon_max32(i,ext_neon_max32(g,h))))))))); @/
  /@ assert max_rewrite_17: ext_same(ext_neon_max32(f,ext_neon_max32(b,ext_neon_max32(i,ext_neon_max32(g,h)))),ext_neon_max32(ext_neon_max32(f,b),ext_neon_max32(i,ext_neon_max32(g,h)))); @/
  /@ assert max_context_17: ext_same(ext_neon_max32(a,ext_neon_max32(c,ext_neon_max32(d,ext_neon_max32(e,ext_neon_max32(f,ext_neon_max32(b,ext_neon_max32(i,ext_neon_max32(g,h)))))))),ext_neon_max32(a,ext_neon_max32(c,ext_neon_max32(d,ext_neon_max32(e,ext_neon_max32(ext_neon_max32(f,b),ext_neon_max32(i,ext_neon_max32(g,h)))))))); @/
  /@ assert max_rewrite_18: ext_same(ext_neon_max32(f,b),ext_neon_max32(b,f)); @/
  /@ assert max_context_18: ext_same(ext_neon_max32(a,ext_neon_max32(c,ext_neon_max32(d,ext_neon_max32(e,ext_neon_max32(ext_neon_max32(f,b),ext_neon_max32(i,ext_neon_max32(g,h))))))),ext_neon_max32(a,ext_neon_max32(c,ext_neon_max32(d,ext_neon_max32(e,ext_neon_max32(ext_neon_max32(b,f),ext_neon_max32(i,ext_neon_max32(g,h)))))))); @/
  /@ assert max_rewrite_19: ext_same(ext_neon_max32(ext_neon_max32(b,f),ext_neon_max32(i,ext_neon_max32(g,h))),ext_neon_max32(b,ext_neon_max32(f,ext_neon_max32(i,ext_neon_max32(g,h))))); @/
  /@ assert max_context_19_lift_1: ext_same(ext_neon_max32(e,ext_neon_max32(ext_neon_max32(b,f),ext_neon_max32(i,ext_neon_max32(g,h)))),ext_neon_max32(e,ext_neon_max32(b,ext_neon_max32(f,ext_neon_max32(i,ext_neon_max32(g,h)))))); @/
  /@ assert max_context_19_lift_2: ext_same(ext_neon_max32(d,ext_neon_max32(e,ext_neon_max32(ext_neon_max32(b,f),ext_neon_max32(i,ext_neon_max32(g,h))))),ext_neon_max32(d,ext_neon_max32(e,ext_neon_max32(b,ext_neon_max32(f,ext_neon_max32(i,ext_neon_max32(g,h))))))); @/
  /@ assert max_context_19_lift_3: ext_same(ext_neon_max32(c,ext_neon_max32(d,ext_neon_max32(e,ext_neon_max32(ext_neon_max32(b,f),ext_neon_max32(i,ext_neon_max32(g,h)))))),ext_neon_max32(c,ext_neon_max32(d,ext_neon_max32(e,ext_neon_max32(b,ext_neon_max32(f,ext_neon_max32(i,ext_neon_max32(g,h)))))))); @/
  /@ assert max_context_19: ext_same(ext_neon_max32(a,ext_neon_max32(c,ext_neon_max32(d,ext_neon_max32(e,ext_neon_max32(ext_neon_max32(b,f),ext_neon_max32(i,ext_neon_max32(g,h))))))),ext_neon_max32(a,ext_neon_max32(c,ext_neon_max32(d,ext_neon_max32(e,ext_neon_max32(b,ext_neon_max32(f,ext_neon_max32(i,ext_neon_max32(g,h))))))))); @/
  /@ assert max_rewrite_20: ext_same(ext_neon_max32(e,ext_neon_max32(b,ext_neon_max32(f,ext_neon_max32(i,ext_neon_max32(g,h))))),ext_neon_max32(ext_neon_max32(e,b),ext_neon_max32(f,ext_neon_max32(i,ext_neon_max32(g,h))))); @/
  /@ assert max_context_20: ext_same(ext_neon_max32(a,ext_neon_max32(c,ext_neon_max32(d,ext_neon_max32(e,ext_neon_max32(b,ext_neon_max32(f,ext_neon_max32(i,ext_neon_max32(g,h)))))))),ext_neon_max32(a,ext_neon_max32(c,ext_neon_max32(d,ext_neon_max32(ext_neon_max32(e,b),ext_neon_max32(f,ext_neon_max32(i,ext_neon_max32(g,h)))))))); @/
  /@ assert max_rewrite_21: ext_same(ext_neon_max32(e,b),ext_neon_max32(b,e)); @/
  /@ assert max_context_21_lift_1: ext_same(ext_neon_max32(ext_neon_max32(e,b),ext_neon_max32(f,ext_neon_max32(i,ext_neon_max32(g,h)))),ext_neon_max32(ext_neon_max32(b,e),ext_neon_max32(f,ext_neon_max32(i,ext_neon_max32(g,h))))); @/
  /@ assert max_context_21_lift_2: ext_same(ext_neon_max32(d,ext_neon_max32(ext_neon_max32(e,b),ext_neon_max32(f,ext_neon_max32(i,ext_neon_max32(g,h))))),ext_neon_max32(d,ext_neon_max32(ext_neon_max32(b,e),ext_neon_max32(f,ext_neon_max32(i,ext_neon_max32(g,h)))))); @/
  /@ assert max_context_21_lift_3: ext_same(ext_neon_max32(c,ext_neon_max32(d,ext_neon_max32(ext_neon_max32(e,b),ext_neon_max32(f,ext_neon_max32(i,ext_neon_max32(g,h)))))),ext_neon_max32(c,ext_neon_max32(d,ext_neon_max32(ext_neon_max32(b,e),ext_neon_max32(f,ext_neon_max32(i,ext_neon_max32(g,h))))))); @/
  /@ assert max_context_21: ext_same(ext_neon_max32(a,ext_neon_max32(c,ext_neon_max32(d,ext_neon_max32(ext_neon_max32(e,b),ext_neon_max32(f,ext_neon_max32(i,ext_neon_max32(g,h))))))),ext_neon_max32(a,ext_neon_max32(c,ext_neon_max32(d,ext_neon_max32(ext_neon_max32(b,e),ext_neon_max32(f,ext_neon_max32(i,ext_neon_max32(g,h)))))))); @/
  /@ assert max_rewrite_22: ext_same(ext_neon_max32(ext_neon_max32(b,e),ext_neon_max32(f,ext_neon_max32(i,ext_neon_max32(g,h)))),ext_neon_max32(b,ext_neon_max32(e,ext_neon_max32(f,ext_neon_max32(i,ext_neon_max32(g,h)))))); @/
  /@ assert max_context_22: ext_same(ext_neon_max32(a,ext_neon_max32(c,ext_neon_max32(d,ext_neon_max32(ext_neon_max32(b,e),ext_neon_max32(f,ext_neon_max32(i,ext_neon_max32(g,h))))))),ext_neon_max32(a,ext_neon_max32(c,ext_neon_max32(d,ext_neon_max32(b,ext_neon_max32(e,ext_neon_max32(f,ext_neon_max32(i,ext_neon_max32(g,h))))))))); @/
  /@ assert max_rewrite_23: ext_same(ext_neon_max32(d,ext_neon_max32(b,ext_neon_max32(e,ext_neon_max32(f,ext_neon_max32(i,ext_neon_max32(g,h)))))),ext_neon_max32(ext_neon_max32(d,b),ext_neon_max32(e,ext_neon_max32(f,ext_neon_max32(i,ext_neon_max32(g,h)))))); @/
  /@ assert max_context_23: ext_same(ext_neon_max32(a,ext_neon_max32(c,ext_neon_max32(d,ext_neon_max32(b,ext_neon_max32(e,ext_neon_max32(f,ext_neon_max32(i,ext_neon_max32(g,h)))))))),ext_neon_max32(a,ext_neon_max32(c,ext_neon_max32(ext_neon_max32(d,b),ext_neon_max32(e,ext_neon_max32(f,ext_neon_max32(i,ext_neon_max32(g,h)))))))); @/
  /@ assert max_rewrite_24: ext_same(ext_neon_max32(d,b),ext_neon_max32(b,d)); @/
  /@ assert max_context_24: ext_same(ext_neon_max32(a,ext_neon_max32(c,ext_neon_max32(ext_neon_max32(d,b),ext_neon_max32(e,ext_neon_max32(f,ext_neon_max32(i,ext_neon_max32(g,h))))))),ext_neon_max32(a,ext_neon_max32(c,ext_neon_max32(ext_neon_max32(b,d),ext_neon_max32(e,ext_neon_max32(f,ext_neon_max32(i,ext_neon_max32(g,h)))))))); @/
  /@ assert max_rewrite_25: ext_same(ext_neon_max32(ext_neon_max32(b,d),ext_neon_max32(e,ext_neon_max32(f,ext_neon_max32(i,ext_neon_max32(g,h))))),ext_neon_max32(b,ext_neon_max32(d,ext_neon_max32(e,ext_neon_max32(f,ext_neon_max32(i,ext_neon_max32(g,h))))))); @/
  /@ assert max_context_25: ext_same(ext_neon_max32(a,ext_neon_max32(c,ext_neon_max32(ext_neon_max32(b,d),ext_neon_max32(e,ext_neon_max32(f,ext_neon_max32(i,ext_neon_max32(g,h))))))),ext_neon_max32(a,ext_neon_max32(c,ext_neon_max32(b,ext_neon_max32(d,ext_neon_max32(e,ext_neon_max32(f,ext_neon_max32(i,ext_neon_max32(g,h))))))))); @/
  /@ assert max_rewrite_26: ext_same(ext_neon_max32(c,ext_neon_max32(b,ext_neon_max32(d,ext_neon_max32(e,ext_neon_max32(f,ext_neon_max32(i,ext_neon_max32(g,h))))))),ext_neon_max32(ext_neon_max32(c,b),ext_neon_max32(d,ext_neon_max32(e,ext_neon_max32(f,ext_neon_max32(i,ext_neon_max32(g,h))))))); @/
  /@ assert max_context_26: ext_same(ext_neon_max32(a,ext_neon_max32(c,ext_neon_max32(b,ext_neon_max32(d,ext_neon_max32(e,ext_neon_max32(f,ext_neon_max32(i,ext_neon_max32(g,h)))))))),ext_neon_max32(a,ext_neon_max32(ext_neon_max32(c,b),ext_neon_max32(d,ext_neon_max32(e,ext_neon_max32(f,ext_neon_max32(i,ext_neon_max32(g,h)))))))); @/
  /@ assert max_rewrite_27: ext_same(ext_neon_max32(c,b),ext_neon_max32(b,c)); @/
  /@ assert max_context_27: ext_same(ext_neon_max32(a,ext_neon_max32(ext_neon_max32(c,b),ext_neon_max32(d,ext_neon_max32(e,ext_neon_max32(f,ext_neon_max32(i,ext_neon_max32(g,h))))))),ext_neon_max32(a,ext_neon_max32(ext_neon_max32(b,c),ext_neon_max32(d,ext_neon_max32(e,ext_neon_max32(f,ext_neon_max32(i,ext_neon_max32(g,h)))))))); @/
  /@ assert max_rewrite_28: ext_same(ext_neon_max32(ext_neon_max32(b,c),ext_neon_max32(d,ext_neon_max32(e,ext_neon_max32(f,ext_neon_max32(i,ext_neon_max32(g,h)))))),ext_neon_max32(b,ext_neon_max32(c,ext_neon_max32(d,ext_neon_max32(e,ext_neon_max32(f,ext_neon_max32(i,ext_neon_max32(g,h)))))))); @/
  /@ assert max_context_28: ext_same(ext_neon_max32(a,ext_neon_max32(ext_neon_max32(b,c),ext_neon_max32(d,ext_neon_max32(e,ext_neon_max32(f,ext_neon_max32(i,ext_neon_max32(g,h))))))),ext_neon_max32(a,ext_neon_max32(b,ext_neon_max32(c,ext_neon_max32(d,ext_neon_max32(e,ext_neon_max32(f,ext_neon_max32(i,ext_neon_max32(g,h))))))))); @/
  /@ assert max_rewrite_29: ext_same(ext_neon_max32(i,ext_neon_max32(g,h)),ext_neon_max32(ext_neon_max32(i,g),h)); @/
  /@ assert max_context_29_lift_1: ext_same(ext_neon_max32(f,ext_neon_max32(i,ext_neon_max32(g,h))),ext_neon_max32(f,ext_neon_max32(ext_neon_max32(i,g),h))); @/
  /@ assert max_context_29_lift_2: ext_same(ext_neon_max32(e,ext_neon_max32(f,ext_neon_max32(i,ext_neon_max32(g,h)))),ext_neon_max32(e,ext_neon_max32(f,ext_neon_max32(ext_neon_max32(i,g),h)))); @/
  /@ assert max_context_29_lift_3: ext_same(ext_neon_max32(d,ext_neon_max32(e,ext_neon_max32(f,ext_neon_max32(i,ext_neon_max32(g,h))))),ext_neon_max32(d,ext_neon_max32(e,ext_neon_max32(f,ext_neon_max32(ext_neon_max32(i,g),h))))); @/
  /@ assert max_context_29_lift_4: ext_same(ext_neon_max32(c,ext_neon_max32(d,ext_neon_max32(e,ext_neon_max32(f,ext_neon_max32(i,ext_neon_max32(g,h)))))),ext_neon_max32(c,ext_neon_max32(d,ext_neon_max32(e,ext_neon_max32(f,ext_neon_max32(ext_neon_max32(i,g),h)))))); @/
  /@ assert max_context_29_lift_5: ext_same(ext_neon_max32(b,ext_neon_max32(c,ext_neon_max32(d,ext_neon_max32(e,ext_neon_max32(f,ext_neon_max32(i,ext_neon_max32(g,h))))))),ext_neon_max32(b,ext_neon_max32(c,ext_neon_max32(d,ext_neon_max32(e,ext_neon_max32(f,ext_neon_max32(ext_neon_max32(i,g),h))))))); @/
  /@ assert max_context_29: ext_same(ext_neon_max32(a,ext_neon_max32(b,ext_neon_max32(c,ext_neon_max32(d,ext_neon_max32(e,ext_neon_max32(f,ext_neon_max32(i,ext_neon_max32(g,h)))))))),ext_neon_max32(a,ext_neon_max32(b,ext_neon_max32(c,ext_neon_max32(d,ext_neon_max32(e,ext_neon_max32(f,ext_neon_max32(ext_neon_max32(i,g),h)))))))); @/
  /@ assert max_rewrite_30: ext_same(ext_neon_max32(i,g),ext_neon_max32(g,i)); @/
  /@ assert max_context_30_lift_1: ext_same(ext_neon_max32(ext_neon_max32(i,g),h),ext_neon_max32(ext_neon_max32(g,i),h)); @/
  /@ assert max_context_30_lift_2: ext_same(ext_neon_max32(f,ext_neon_max32(ext_neon_max32(i,g),h)),ext_neon_max32(f,ext_neon_max32(ext_neon_max32(g,i),h))); @/
  /@ assert max_context_30_lift_3: ext_same(ext_neon_max32(e,ext_neon_max32(f,ext_neon_max32(ext_neon_max32(i,g),h))),ext_neon_max32(e,ext_neon_max32(f,ext_neon_max32(ext_neon_max32(g,i),h)))); @/
  /@ assert max_context_30_lift_4: ext_same(ext_neon_max32(d,ext_neon_max32(e,ext_neon_max32(f,ext_neon_max32(ext_neon_max32(i,g),h)))),ext_neon_max32(d,ext_neon_max32(e,ext_neon_max32(f,ext_neon_max32(ext_neon_max32(g,i),h))))); @/
  /@ assert max_context_30_lift_5: ext_same(ext_neon_max32(c,ext_neon_max32(d,ext_neon_max32(e,ext_neon_max32(f,ext_neon_max32(ext_neon_max32(i,g),h))))),ext_neon_max32(c,ext_neon_max32(d,ext_neon_max32(e,ext_neon_max32(f,ext_neon_max32(ext_neon_max32(g,i),h)))))); @/
  /@ assert max_context_30_lift_6: ext_same(ext_neon_max32(b,ext_neon_max32(c,ext_neon_max32(d,ext_neon_max32(e,ext_neon_max32(f,ext_neon_max32(ext_neon_max32(i,g),h)))))),ext_neon_max32(b,ext_neon_max32(c,ext_neon_max32(d,ext_neon_max32(e,ext_neon_max32(f,ext_neon_max32(ext_neon_max32(g,i),h))))))); @/
  /@ assert max_context_30: ext_same(ext_neon_max32(a,ext_neon_max32(b,ext_neon_max32(c,ext_neon_max32(d,ext_neon_max32(e,ext_neon_max32(f,ext_neon_max32(ext_neon_max32(i,g),h))))))),ext_neon_max32(a,ext_neon_max32(b,ext_neon_max32(c,ext_neon_max32(d,ext_neon_max32(e,ext_neon_max32(f,ext_neon_max32(ext_neon_max32(g,i),h)))))))); @/
  /@ assert max_rewrite_31: ext_same(ext_neon_max32(ext_neon_max32(g,i),h),ext_neon_max32(g,ext_neon_max32(i,h))); @/
  /@ assert max_context_31_lift_1: ext_same(ext_neon_max32(f,ext_neon_max32(ext_neon_max32(g,i),h)),ext_neon_max32(f,ext_neon_max32(g,ext_neon_max32(i,h)))); @/
  /@ assert max_context_31_lift_2: ext_same(ext_neon_max32(e,ext_neon_max32(f,ext_neon_max32(ext_neon_max32(g,i),h))),ext_neon_max32(e,ext_neon_max32(f,ext_neon_max32(g,ext_neon_max32(i,h))))); @/
  /@ assert max_context_31_lift_3: ext_same(ext_neon_max32(d,ext_neon_max32(e,ext_neon_max32(f,ext_neon_max32(ext_neon_max32(g,i),h)))),ext_neon_max32(d,ext_neon_max32(e,ext_neon_max32(f,ext_neon_max32(g,ext_neon_max32(i,h)))))); @/
  /@ assert max_context_31_lift_4: ext_same(ext_neon_max32(c,ext_neon_max32(d,ext_neon_max32(e,ext_neon_max32(f,ext_neon_max32(ext_neon_max32(g,i),h))))),ext_neon_max32(c,ext_neon_max32(d,ext_neon_max32(e,ext_neon_max32(f,ext_neon_max32(g,ext_neon_max32(i,h))))))); @/
  /@ assert max_context_31_lift_5: ext_same(ext_neon_max32(b,ext_neon_max32(c,ext_neon_max32(d,ext_neon_max32(e,ext_neon_max32(f,ext_neon_max32(ext_neon_max32(g,i),h)))))),ext_neon_max32(b,ext_neon_max32(c,ext_neon_max32(d,ext_neon_max32(e,ext_neon_max32(f,ext_neon_max32(g,ext_neon_max32(i,h)))))))); @/
  /@ assert max_context_31: ext_same(ext_neon_max32(a,ext_neon_max32(b,ext_neon_max32(c,ext_neon_max32(d,ext_neon_max32(e,ext_neon_max32(f,ext_neon_max32(ext_neon_max32(g,i),h))))))),ext_neon_max32(a,ext_neon_max32(b,ext_neon_max32(c,ext_neon_max32(d,ext_neon_max32(e,ext_neon_max32(f,ext_neon_max32(g,ext_neon_max32(i,h))))))))); @/
  /@ assert max_rewrite_32: ext_same(ext_neon_max32(i,h),ext_neon_max32(h,i)); @/
  /@ assert max_context_32_lift_1: ext_same(ext_neon_max32(g,ext_neon_max32(i,h)),ext_neon_max32(g,ext_neon_max32(h,i))); @/
  /@ assert max_context_32_lift_2: ext_same(ext_neon_max32(f,ext_neon_max32(g,ext_neon_max32(i,h))),ext_neon_max32(f,ext_neon_max32(g,ext_neon_max32(h,i)))); @/
  /@ assert max_context_32_lift_3: ext_same(ext_neon_max32(e,ext_neon_max32(f,ext_neon_max32(g,ext_neon_max32(i,h)))),ext_neon_max32(e,ext_neon_max32(f,ext_neon_max32(g,ext_neon_max32(h,i))))); @/
  /@ assert max_context_32_lift_4: ext_same(ext_neon_max32(d,ext_neon_max32(e,ext_neon_max32(f,ext_neon_max32(g,ext_neon_max32(i,h))))),ext_neon_max32(d,ext_neon_max32(e,ext_neon_max32(f,ext_neon_max32(g,ext_neon_max32(h,i)))))); @/
  /@ assert max_context_32_lift_5: ext_same(ext_neon_max32(c,ext_neon_max32(d,ext_neon_max32(e,ext_neon_max32(f,ext_neon_max32(g,ext_neon_max32(i,h)))))),ext_neon_max32(c,ext_neon_max32(d,ext_neon_max32(e,ext_neon_max32(f,ext_neon_max32(g,ext_neon_max32(h,i))))))); @/
  /@ assert max_context_32_lift_6: ext_same(ext_neon_max32(b,ext_neon_max32(c,ext_neon_max32(d,ext_neon_max32(e,ext_neon_max32(f,ext_neon_max32(g,ext_neon_max32(i,h))))))),ext_neon_max32(b,ext_neon_max32(c,ext_neon_max32(d,ext_neon_max32(e,ext_neon_max32(f,ext_neon_max32(g,ext_neon_max32(h,i)))))))); @/
  /@ assert max_context_32: ext_same(ext_neon_max32(a,ext_neon_max32(b,ext_neon_max32(c,ext_neon_max32(d,ext_neon_max32(e,ext_neon_max32(f,ext_neon_max32(g,ext_neon_max32(i,h)))))))),ext_neon_max32(a,ext_neon_max32(b,ext_neon_max32(c,ext_neon_max32(d,ext_neon_max32(e,ext_neon_max32(f,ext_neon_max32(g,ext_neon_max32(h,i))))))))); @/
  /@ assert max_rewrite_33: ext_same(ext_neon_max32(ext_neon_max32(ext_neon_max32(ext_neon_max32(ext_neon_max32(ext_neon_max32(ext_neon_max32(ext_neon_max32(a,b),c),d),e),f),g),h),i),ext_neon_max32(ext_neon_max32(ext_neon_max32(ext_neon_max32(ext_neon_max32(ext_neon_max32(ext_neon_max32(a,b),c),d),e),f),g),ext_neon_max32(h,i))); @/
  /@ assert max_context_33: ext_same(ext_neon_max32(ext_neon_max32(ext_neon_max32(ext_neon_max32(ext_neon_max32(ext_neon_max32(ext_neon_max32(ext_neon_max32(a,b),c),d),e),f),g),h),i),ext_neon_max32(ext_neon_max32(ext_neon_max32(ext_neon_max32(ext_neon_max32(ext_neon_max32(ext_neon_max32(a,b),c),d),e),f),g),ext_neon_max32(h,i))); @/
  /@ assert max_rewrite_34: ext_same(ext_neon_max32(ext_neon_max32(ext_neon_max32(ext_neon_max32(ext_neon_max32(ext_neon_max32(ext_neon_max32(a,b),c),d),e),f),g),ext_neon_max32(h,i)),ext_neon_max32(ext_neon_max32(ext_neon_max32(ext_neon_max32(ext_neon_max32(ext_neon_max32(a,b),c),d),e),f),ext_neon_max32(g,ext_neon_max32(h,i)))); @/
  /@ assert max_context_34: ext_same(ext_neon_max32(ext_neon_max32(ext_neon_max32(ext_neon_max32(ext_neon_max32(ext_neon_max32(ext_neon_max32(a,b),c),d),e),f),g),ext_neon_max32(h,i)),ext_neon_max32(ext_neon_max32(ext_neon_max32(ext_neon_max32(ext_neon_max32(ext_neon_max32(a,b),c),d),e),f),ext_neon_max32(g,ext_neon_max32(h,i)))); @/
  /@ assert max_rewrite_35: ext_same(ext_neon_max32(ext_neon_max32(ext_neon_max32(ext_neon_max32(ext_neon_max32(ext_neon_max32(a,b),c),d),e),f),ext_neon_max32(g,ext_neon_max32(h,i))),ext_neon_max32(ext_neon_max32(ext_neon_max32(ext_neon_max32(ext_neon_max32(a,b),c),d),e),ext_neon_max32(f,ext_neon_max32(g,ext_neon_max32(h,i))))); @/
  /@ assert max_context_35: ext_same(ext_neon_max32(ext_neon_max32(ext_neon_max32(ext_neon_max32(ext_neon_max32(ext_neon_max32(a,b),c),d),e),f),ext_neon_max32(g,ext_neon_max32(h,i))),ext_neon_max32(ext_neon_max32(ext_neon_max32(ext_neon_max32(ext_neon_max32(a,b),c),d),e),ext_neon_max32(f,ext_neon_max32(g,ext_neon_max32(h,i))))); @/
  /@ assert max_rewrite_36: ext_same(ext_neon_max32(ext_neon_max32(ext_neon_max32(ext_neon_max32(ext_neon_max32(a,b),c),d),e),ext_neon_max32(f,ext_neon_max32(g,ext_neon_max32(h,i)))),ext_neon_max32(ext_neon_max32(ext_neon_max32(ext_neon_max32(a,b),c),d),ext_neon_max32(e,ext_neon_max32(f,ext_neon_max32(g,ext_neon_max32(h,i)))))); @/
  /@ assert max_context_36: ext_same(ext_neon_max32(ext_neon_max32(ext_neon_max32(ext_neon_max32(ext_neon_max32(a,b),c),d),e),ext_neon_max32(f,ext_neon_max32(g,ext_neon_max32(h,i)))),ext_neon_max32(ext_neon_max32(ext_neon_max32(ext_neon_max32(a,b),c),d),ext_neon_max32(e,ext_neon_max32(f,ext_neon_max32(g,ext_neon_max32(h,i)))))); @/
  /@ assert max_rewrite_37: ext_same(ext_neon_max32(ext_neon_max32(ext_neon_max32(ext_neon_max32(a,b),c),d),ext_neon_max32(e,ext_neon_max32(f,ext_neon_max32(g,ext_neon_max32(h,i))))),ext_neon_max32(ext_neon_max32(ext_neon_max32(a,b),c),ext_neon_max32(d,ext_neon_max32(e,ext_neon_max32(f,ext_neon_max32(g,ext_neon_max32(h,i))))))); @/
  /@ assert max_context_37: ext_same(ext_neon_max32(ext_neon_max32(ext_neon_max32(ext_neon_max32(a,b),c),d),ext_neon_max32(e,ext_neon_max32(f,ext_neon_max32(g,ext_neon_max32(h,i))))),ext_neon_max32(ext_neon_max32(ext_neon_max32(a,b),c),ext_neon_max32(d,ext_neon_max32(e,ext_neon_max32(f,ext_neon_max32(g,ext_neon_max32(h,i))))))); @/
  /@ assert max_rewrite_38: ext_same(ext_neon_max32(ext_neon_max32(ext_neon_max32(a,b),c),ext_neon_max32(d,ext_neon_max32(e,ext_neon_max32(f,ext_neon_max32(g,ext_neon_max32(h,i)))))),ext_neon_max32(ext_neon_max32(a,b),ext_neon_max32(c,ext_neon_max32(d,ext_neon_max32(e,ext_neon_max32(f,ext_neon_max32(g,ext_neon_max32(h,i)))))))); @/
  /@ assert max_context_38: ext_same(ext_neon_max32(ext_neon_max32(ext_neon_max32(a,b),c),ext_neon_max32(d,ext_neon_max32(e,ext_neon_max32(f,ext_neon_max32(g,ext_neon_max32(h,i)))))),ext_neon_max32(ext_neon_max32(a,b),ext_neon_max32(c,ext_neon_max32(d,ext_neon_max32(e,ext_neon_max32(f,ext_neon_max32(g,ext_neon_max32(h,i)))))))); @/
  /@ assert max_rewrite_39: ext_same(ext_neon_max32(ext_neon_max32(a,b),ext_neon_max32(c,ext_neon_max32(d,ext_neon_max32(e,ext_neon_max32(f,ext_neon_max32(g,ext_neon_max32(h,i))))))),ext_neon_max32(a,ext_neon_max32(b,ext_neon_max32(c,ext_neon_max32(d,ext_neon_max32(e,ext_neon_max32(f,ext_neon_max32(g,ext_neon_max32(h,i))))))))); @/
  /@ assert max_context_39: ext_same(ext_neon_max32(ext_neon_max32(a,b),ext_neon_max32(c,ext_neon_max32(d,ext_neon_max32(e,ext_neon_max32(f,ext_neon_max32(g,ext_neon_max32(h,i))))))),ext_neon_max32(a,ext_neon_max32(b,ext_neon_max32(c,ext_neon_max32(d,ext_neon_max32(e,ext_neon_max32(f,ext_neon_max32(g,ext_neon_max32(h,i))))))))); @/
}
*/
/*@ \wp::strategy StoreMemSolve: \prover("cvc5",5),\prover("z3",5); \wp::strategy StoreMemUnfold: \tactic("Wp.unfold",\pattern(shift_float32(P,I)),\children(StoreMemUnfold)),\tactic("Wp.unfold",\ingoal(shift_uint32(P,I)),\children(StoreMemUnfold)),\tactic("Wp.unfold",\ingoal(shift_uint8(P,I)),\children(StoreMemUnfold)),StoreMemSolve; */

/*@ logic float from_repr32(integer u);
 logic integer repr32(float x);
 lemma core_store_float_value: \forall float x; \forall integer b;
 0<=b<=4294967295 ==> ext_same(from_repr32(\is_NaN(x)?(\is_NaN(from_repr32(b))?b:2143289344):repr32(x)),x); */


/*@ \wp::strategy StoreCodecPoint:
 \tactic("Wp.lemma",\ingoal(repr_encode32(X)),\ingoal(to_uint32(B)),\param("lemma","core_store_float_value"),\param("P1",X),\param("P2",to_uint32(B)),\children(StoreMemUnfold)),StoreMemUnfold;
 \wp::strategy StorePrefixCase:
 \tactic("Wp.cut",\ingoal(P_ext_same(R,A[J])),\ingoal(repr_encode32(A[I])),\param("case","CASES"),\param("clause",J==I),\children(StoreCodecPoint)),StoreCodecPoint;
 \wp::proof StorePrefixCase:vst1_f32,vst1q_f32,__riscv_vse32_v_f32m8;
*/

/*@ \wp::strategy StoreExitCount:
 \tactic("Wp.cut",\ingoal(memcpy(M,P,U,P,4*I)),\incontext(I<=V),\param("clause",I==V),\children(StoreMemSolve)),StoreMemUnfold;
 \wp::proof StoreExitCount:rvv_store_values;
*/

/*@ \wp::strategy PoolCongruenceSolve: \prover("cvc5",5),\prover("z3",5);
 \wp::strategy PoolCongruenceApply:
 \tactic("Wp.split",\children(PoolCongruenceApply)),
 \tactic("Wp.lemma",\ingoal(P_ext_same(L_ext_neon_max32(A,C),L_ext_neon_max32(B,D))),
   \param("lemma","core_pool_congruence"),\param("P1",A),\param("P2",B),\param("P3",C),\param("P4",D),
   \children(PoolCongruenceApply)),PoolCongruenceSolve;
 \wp::proof PoolCongruenceApply: proof_pool_tree_serial,core_vector_values_0,core_tail_values_0,core_vector_values_1,core_tail_values_1;
*/
#endif
