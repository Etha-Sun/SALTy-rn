#ifndef INTEGER_EXTENSION_SHIM_H
#define INTEGER_EXTENSION_SHIM_H
#include <stdint.h>
#include <stddef.h>
#include <assert.h>
#include <limits.h>
#include <math.h>
#include <string.h>
#define XNN_OOB_READS
#define XNN_UNLIKELY(x) (x)
#define XNN_LIKELY(x) (x)
#define XNN_UNPREDICTABLE(x) (x)
#define XNN_ARCH_ARM64 1
#define __RISCV_VXRM_RNU 0
#define __RISCV_VXRM_RDN 2
#define min(a,b) ((a)<(b)?(a):(b))
#define doz(a,b) ((a)>(b)?(a)-(b):0)
/* VLEN=128, e8m2/e16m4/e32m8 capacity=32. Rounding: RNE for floating operations. */
typedef struct { int8_t lane[8]; } int8x8_t;
typedef struct { int8_t lane[16]; } int8x16_t;
typedef struct { uint8_t lane[8]; } uint8x8_t;
typedef struct { uint8_t lane[16]; } uint8x16_t;
typedef struct { int16_t lane[4]; } int16x4_t;
typedef struct { int16_t lane[8]; } int16x8_t;
typedef struct { uint16_t lane[4]; } uint16x4_t;
typedef struct { uint16_t lane[8]; } uint16x8_t;
typedef struct { int32_t lane[2]; } int32x2_t;
typedef struct { int32_t lane[4]; } int32x4_t;
typedef struct { uint32_t lane[2]; } uint32x2_t;
typedef struct { uint32_t lane[4]; } uint32x4_t;
typedef struct { float lane[2]; } float32x2_t;
typedef struct { float lane[4]; } float32x4_t;
typedef struct { int8_t lane[32]; } vint8m2_t;
typedef struct { uint8_t lane[32]; } vuint8m2_t;
typedef struct { int16_t lane[32]; } vint16m4_t;
typedef struct { uint16_t lane[32]; } vuint16m4_t;
typedef struct { int32_t lane[32]; } vint32m8_t;
typedef struct { uint32_t lane[32]; } vuint32m8_t;
typedef struct { float lane[32]; } vfloat32m8_t;
typedef struct { uint8_t lane[32]; } vbool4_t;
struct xnn_qs8_add_minmax_params {
  struct {
    int8_t a_zero_point;
    int8_t b_zero_point;
    int32_t bias;
    int32_t a_multiplier;
    int32_t b_multiplier;
    int32_t shift;
    int16_t output_zero_point;
    int8_t output_min;
    int8_t output_max;
  } scalar;
};
struct xnn_qu8_add_minmax_params {
  struct {
    uint8_t a_zero_point;
    uint8_t b_zero_point;
    int32_t bias;
    int32_t a_multiplier;
    int32_t b_multiplier;
    int32_t shift;
    int16_t output_zero_point;
    uint8_t output_min;
    uint8_t output_max;
  } scalar;
};
struct xnn_qs8_cvt_params {
  struct {
    int16_t input_zero_point;
    int32_t multiplier;
    int16_t output_zero_point;
  } scalar;
};
struct xnn_qs8_lrelu_params {
  struct {
    int32_t input_zero_point;
    int32_t positive_multiplier;
    int32_t negative_multiplier;
    int32_t output_zero_point;
  } scalar;
};
struct xnn_qs8_f32_cvt_params {
  struct {
    int32_t zero_point;
    float scale;
  } scalar;
};
struct xnn_qu8_f32_cvt_params {
  struct {
    int32_t zero_point;
    float scale;
  } scalar;
};
union xnn_qs8_mul_minmax_params {
  struct {
    int8_t a_zero_point;
    int8_t b_zero_point;
    float scale;
    int16_t output_zero_point;
    int8_t output_min;
    int8_t output_max;
  } scalar;
#if XNN_ARCH_ARM || XNN_ARCH_ARM64
  struct {
    int8_t a_zero_point;
    int8_t b_zero_point;
    int32_t left_pre_shift;
    int32_t multiplier;
    int32_t left_post_shift;
    int16_t output_zero_point;
    int8_t output_min;
    int8_t output_max;
  } rndnu_neon;
#endif  // XNN_ARCH_ARM || XNN_ARCH_ARM64
};
struct xnn_qs8_rsum_params {
  char _;  // Dummy member variable to comply with the C standard
};
int16_t sat16(int64_t x);
int8_t sat8(int64_t x);
uint8_t satu8(int64_t x);
int32_t sat32(int64_t x);
int8_t wrap8(uint64_t x);
int16_t wrap16(uint64_t x);
int32_t wrap32(uint64_t x);
int64_t asr64(int64_t x, unsigned s);
int64_t round_shift(int64_t x, unsigned s, int mode);
int8x8_t vdup_n_s8(int8_t x);
int8x8_t vld1_s8(const int8_t *p);
void vst1_s8(int8_t *p, int8x8_t a);
int8x8_t vmax_s8(int8x8_t a, int8x8_t b);
int8x8_t vmin_s8(int8x8_t a, int8x8_t b);
void vst1_lane_s8(int8_t *p,int8x8_t a,int n);
int8x8_t vext_s8(int8x8_t a,int8x8_t b,int n);
int8x16_t vdupq_n_s8(int8_t x);
void vst1q_s8(int8_t *p, int8x16_t a);
int8x16_t vmaxq_s8(int8x16_t a, int8x16_t b);
int8x16_t vminq_s8(int8x16_t a, int8x16_t b);
int8x8_t vget_low_s8(int8x16_t a);
int8x16_t vcombine_s8(int8x8_t a,int8x8_t b);
uint8x8_t vdup_n_u8(uint8_t x);
uint8x8_t vld1_u8(const uint8_t *p);
void vst1_u8(uint8_t *p, uint8x8_t a);
uint8x8_t vmax_u8(uint8x8_t a, uint8x8_t b);
uint8x8_t vmin_u8(uint8x8_t a, uint8x8_t b);
void vst1_lane_u8(uint8_t *p,uint8x8_t a,int n);
uint8x8_t vext_u8(uint8x8_t a,uint8x8_t b,int n);
uint8x16_t vld1q_u8(const uint8_t *p);
uint8x8_t vget_low_u8(uint8x16_t a);
int16x8_t vdupq_n_s16(int16_t x);
int16x8_t vmovq_n_s16(int16_t x);
int16x4_t vget_low_s16(int16x8_t a);
int16x4_t vget_high_s16(int16x8_t a);
int16x8_t vcombine_s16(int16x4_t a,int16x4_t b);
void vst1_u16(uint16_t *p, uint16x4_t a);
uint16x4_t vadd_u16(uint16x4_t a, uint16x4_t b);
void vst1_lane_u16(void *p,uint16x4_t a,int n);
uint16x4_t vext_u16(uint16x4_t a,uint16x4_t b,int n);
uint16x4_t vand_u16(uint16x4_t a,uint16x4_t b);
uint16x4_t vorr_u16(uint16x4_t a,uint16x4_t b);
uint16x8_t vdupq_n_u16(uint16_t x);
uint16x8_t vmovq_n_u16(uint16_t x);
void vst1q_u16(uint16_t *p, uint16x8_t a);
uint16x8_t vaddq_u16(uint16x8_t a, uint16x8_t b);
uint16x4_t vget_low_u16(uint16x8_t a);
uint16x4_t vget_high_u16(uint16x8_t a);
uint16x8_t vcombine_u16(uint16x4_t a,uint16x4_t b);
uint16x8_t vandq_u16(uint16x8_t a,uint16x8_t b);
uint16x8_t vorrq_u16(uint16x8_t a,uint16x8_t b);
int32x2_t vld1_s32(const int32_t *p);
void vst1_s32(int32_t *p, int32x2_t a);
int32x2_t vadd_s32(int32x2_t a, int32x2_t b);
int32x4_t vdupq_n_s32(int32_t x);
int32x4_t vld1q_s32(const int32_t *p);
void vst1q_s32(int32_t *p, int32x4_t a);
int32x4_t vaddq_s32(int32x4_t a, int32x4_t b);
int32x4_t vmulq_s32(int32x4_t a, int32x4_t b);
int32_t vgetq_lane_s32(int32x4_t a,int n);
int32x4_t vextq_s32(int32x4_t a,int32x4_t b,int n);
int32x2_t vget_low_s32(int32x4_t a);
uint32x2_t vld1_u32(const uint32_t *p);
void vst1_u32(uint32_t *p, uint32x2_t a);
uint32x2_t vadd_u32(uint32x2_t a, uint32x2_t b);
void vst1_lane_u32(void *p,uint32x2_t a,int n);
uint32x4_t vdupq_n_u32(uint32_t x);
uint32x4_t vld1q_u32(const uint32_t *p);
void vst1q_u32(uint32_t *p, uint32x4_t a);
uint32x4_t vaddq_u32(uint32x4_t a, uint32x4_t b);
uint32x4_t vmaxq_u32(uint32x4_t a, uint32x4_t b);
uint32_t vgetq_lane_u32(uint32x4_t a,int n);
uint32x4_t vextq_u32(uint32x4_t a,uint32x4_t b,int n);
uint32x2_t vget_low_u32(uint32x4_t a);
uint32x4_t vandq_u32(uint32x4_t a,uint32x4_t b);
void vst1_f32(float *p, float32x2_t a);
void vst1_lane_f32(float *p,float32x2_t a,int n);
float32x4_t vdupq_n_f32(float x);
float32x4_t vld1q_f32(const float *p);
void vst1q_f32(float *p, float32x4_t a);
float32x4_t vaddq_f32(float32x4_t a, float32x4_t b);
float32x4_t vmulq_f32(float32x4_t a, float32x4_t b);
float32x2_t vget_low_f32(float32x4_t a);
float32x2_t vget_high_f32(float32x4_t a);
int16x8_t vreinterpretq_s16_u16(uint16x8_t a);
uint16x4_t vreinterpret_u16_s8(int8x8_t a);
uint16x4_t vreinterpret_u16_u8(uint8x8_t a);
uint16x8_t vreinterpretq_u16_s16(int16x8_t a);
int32x4_t vreinterpretq_s32_f32(float32x4_t a);
uint32x2_t vreinterpret_u32_s8(int8x8_t a);
uint32x2_t vreinterpret_u32_u8(uint8x8_t a);
uint32x2_t vreinterpret_u32_u16(uint16x4_t a);
uint32x4_t vreinterpretq_u32_f32(float32x4_t a);
float32x4_t vreinterpretq_f32_u32(uint32x4_t a);
int16x8_t vaddw_s8(int16x8_t a,int8x8_t b);
int16x8_t vsubw_s8(int16x8_t a,int8x8_t b);
int16x8_t vsubl_s8(int8x8_t a,int8x8_t b);
int32x4_t vmovl_s16(int16x4_t a);
int32x4_t vaddw_s16(int32x4_t a,int16x4_t b);
int32x4_t vmull_s16(int16x4_t a,int16x4_t b);
uint16x8_t vaddw_u8(uint16x8_t a,uint8x8_t b);
uint16x8_t vsubl_u8(uint8x8_t a,uint8x8_t b);
uint32x4_t vaddw_u16(uint32x4_t a,uint16x4_t b);
int8x8_t vqmovn_s16(int16x8_t a);
int16x8_t vqaddq_s16(int16x8_t a,int16x8_t b);
int16x4_t vqmovn_s32(int32x4_t a);
int32x4_t vqsubq_s32(int32x4_t a,int32x4_t b);
uint8x8_t vqmovun_s16(int16x8_t a);
int16x8_t vqmovn_high_s32(int16x4_t a,int32x4_t b);
int16x8_t vshlq_n_s16(int16x8_t a,int n);
int16x8_t vqrdmulhq_s16(int16x8_t a,int16x8_t b);
uint16x8_t vcltq_s16(int16x8_t a,int16x8_t b);
int16x8_t vbslq_s16(uint16x8_t m,int16x8_t a,int16x8_t b);
int32x4_t vmlaq_s32(int32x4_t a,int32x4_t b,int32x4_t c);
int32x4_t vrshlq_s32(int32x4_t a,int32x4_t b);
float32x4_t vcvtq_f32_s32(int32x4_t a);
float32x4_t vabsq_f32(float32x4_t a);
uint32x4_t vcgtq_u32(uint32x4_t a,uint32x4_t b);
uint16x4_t vmovn_u32(uint32x4_t a);
uint16x4_t vshrn_n_u32(uint32x4_t a,int n);
uint16x4_t vbsl_u16(uint16x4_t m,uint16x4_t a,uint16x4_t b);
uint16x8_t vbslq_u16(uint16x8_t m,uint16x8_t a,uint16x8_t b);
size_t __riscv_vsetvl_e8m2(size_t n);
vint8m2_t __riscv_vle8_v_i8m2(const int8_t *p,size_t vl);
void __riscv_vse8_v_i8m2(int8_t *p,vint8m2_t a,size_t vl);
vint8m2_t __riscv_vmax_vx_i8m2(vint8m2_t a,int8_t b,size_t vl);
vint8m2_t __riscv_vmin_vx_i8m2(vint8m2_t a,int8_t b,size_t vl);
vuint8m2_t __riscv_vle8_v_u8m2(const uint8_t *p,size_t vl);
void __riscv_vse8_v_u8m2(uint8_t *p,vuint8m2_t a,size_t vl);
vuint8m2_t __riscv_vmaxu_vx_u8m2(vuint8m2_t a,uint8_t b,size_t vl);
vuint8m2_t __riscv_vminu_vx_u8m2(vuint8m2_t a,uint8_t b,size_t vl);
vint16m4_t __riscv_vmv_v_x_i16m4(int16_t x,size_t vl);
vint16m4_t __riscv_vsub_vx_i16m4(vint16m4_t a,int16_t b,size_t vl);
vint16m4_t __riscv_vmax_vx_i16m4(vint16m4_t a,int16_t b,size_t vl);
vint16m4_t __riscv_vsll_vx_i16m4(vint16m4_t a,unsigned s,size_t vl);
vint16m4_t __riscv_vsadd_vx_i16m4(vint16m4_t a,int16_t b,size_t vl);
vint16m4_t __riscv_vrsub_vx_i16m4(vint16m4_t a,int16_t b,size_t vl);
void __riscv_vse16_v_u16m4(uint16_t *p,vuint16m4_t a,size_t vl);
vuint16m4_t __riscv_vmv_v_x_u16m4(uint16_t x,size_t vl);
vuint16m4_t __riscv_vadd_vx_u16m4(vuint16m4_t a,uint16_t b,size_t vl);
vuint16m4_t __riscv_vadd_vv_u16m4(vuint16m4_t a,vuint16m4_t b,size_t vl);
vuint16m4_t __riscv_vand_vx_u16m4(vuint16m4_t a,uint16_t b,size_t vl);
vuint16m4_t __riscv_vor_vv_u16m4(vuint16m4_t a,vuint16m4_t b,size_t vl);
size_t __riscv_vsetvl_e32m8(size_t n);
vint32m8_t __riscv_vle32_v_i32m8(const int32_t *p,size_t vl);
void __riscv_vse32_v_i32m8(int32_t *p,vint32m8_t a,size_t vl);
vint32m8_t __riscv_vmv_v_x_i32m8(int32_t x,size_t vl);
vint32m8_t __riscv_vadd_vx_i32m8(vint32m8_t a,int32_t b,size_t vl);
vint32m8_t __riscv_vadd_vv_i32m8(vint32m8_t a,vint32m8_t b,size_t vl);
vint32m8_t __riscv_vmul_vx_i32m8(vint32m8_t a,int32_t b,size_t vl);
vint32m8_t __riscv_vsll_vx_i32m8(vint32m8_t a,unsigned s,size_t vl);
vuint32m8_t __riscv_vle32_v_u32m8(const uint32_t *p,size_t vl);
void __riscv_vse32_v_u32m8(uint32_t *p,vuint32m8_t a,size_t vl);
vuint32m8_t __riscv_vmv_v_x_u32m8(uint32_t x,size_t vl);
vuint32m8_t __riscv_vadd_vx_u32m8(vuint32m8_t a,uint32_t b,size_t vl);
vuint32m8_t __riscv_vadd_vv_u32m8(vuint32m8_t a,vuint32m8_t b,size_t vl);
vuint32m8_t __riscv_vand_vx_u32m8(vuint32m8_t a,uint32_t b,size_t vl);
vuint32m8_t __riscv_vmaxu_vx_u32m8(vuint32m8_t a,uint32_t b,size_t vl);
vfloat32m8_t __riscv_vle32_v_f32m8(const float *p,size_t vl);
void __riscv_vse32_v_f32m8(float *p,vfloat32m8_t a,size_t vl);
vint16m4_t __riscv_vsext_vf2_i16m4(vint8m2_t a,size_t vl);
vint16m4_t __riscv_vwadd_wv_i16m4(vint16m4_t a,vint8m2_t b,size_t vl);
vint16m4_t __riscv_vwsub_vx_i16m4(vint8m2_t a,int8_t b,size_t vl);
vint32m8_t __riscv_vsext_vf2_i32m8(vint16m4_t a,size_t vl);
vint32m8_t __riscv_vwadd_wv_i32m8(vint32m8_t a,vint16m4_t b,size_t vl);
vuint16m4_t __riscv_vzext_vf2_u16m4(vuint8m2_t a,size_t vl);
vuint16m4_t __riscv_vwaddu_wv_u16m4(vuint16m4_t a,vuint8m2_t b,size_t vl);
vuint16m4_t __riscv_vwsubu_vx_u16m4(vuint8m2_t a,uint8_t b,size_t vl);
vuint32m8_t __riscv_vwaddu_wv_u32m8(vuint32m8_t a,vuint16m4_t b,size_t vl);
vint32m8_t __riscv_vwmul_vx_i32m8(vint16m4_t a,int16_t b,size_t vl);
vint32m8_t __riscv_vwmul_vv_i32m8(vint16m4_t a,vint16m4_t b,size_t vl);
vint32m8_t __riscv_vmacc_vx_i32m8(vint32m8_t a,int32_t b,vint32m8_t c,size_t vl);
vint32m8_t __riscv_vssra_vx_i32m8(vint32m8_t a,unsigned s,int mode,size_t vl);
vint8m2_t __riscv_vnclip_wx_i8m2(vint16m4_t a,unsigned s,int mode,size_t vl);
vint16m4_t __riscv_vnclip_wx_i16m4(vint32m8_t a,unsigned s,int mode,size_t vl);
vuint8m2_t __riscv_vnclipu_wx_u8m2(vuint16m4_t a,unsigned s,int mode,size_t vl);
vbool4_t __riscv_vmslt_vx_i16m4_b4(vint16m4_t a,int16_t b,size_t vl);
vbool4_t __riscv_vmsgtu_vx_u32m8_b4(vuint32m8_t a,uint32_t b,size_t vl);
vint16m4_t __riscv_vmerge_vxm_i16m4(vint16m4_t a,int16_t b,vbool4_t mask,size_t vl);
vuint16m4_t __riscv_vmerge_vxm_u16m4(vuint16m4_t a,uint16_t b,vbool4_t mask,size_t vl);
vuint16m4_t __riscv_vnsrl_wx_u16m4(vuint32m8_t a,unsigned s,size_t vl);
vfloat32m8_t __riscv_vfcvt_f_x_v_f32m8(vint32m8_t a,size_t vl);
int32_t rvv_f32_i32(float x);
vint32m8_t __riscv_vfcvt_x_f_v_i32m8(vfloat32m8_t a,size_t vl);
vfloat32m8_t __riscv_vfmul_vf_f32m8(vfloat32m8_t a,float b,size_t vl);
vfloat32m8_t __riscv_vfadd_vv_f32m8(vfloat32m8_t a,vfloat32m8_t b,size_t vl);
vfloat32m8_t __riscv_vfabs_v_f32m8(vfloat32m8_t a,size_t vl);
vint16m4_t __riscv_vreinterpret_v_u16m4_i16m4(vuint16m4_t a);
vuint16m4_t __riscv_vreinterpret_v_i16m4_u16m4(vint16m4_t a);
vuint32m8_t __riscv_vreinterpret_v_f32m8_u32m8(vfloat32m8_t a);
vfloat32m8_t __riscv_vreinterpret_v_u32m8_f32m8(vuint32m8_t a);
vfloat32m8_t __riscv_vfadd_vf_f32m8(vfloat32m8_t a,float b,size_t vl);
vint32m8_t __riscv_vreinterpret_v_f32m8_i32m8(vfloat32m8_t a);
vint32m8_t __riscv_vssub_vx_i32m8(vint32m8_t a,int32_t b,size_t vl);
#endif
