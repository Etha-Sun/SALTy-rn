#ifndef RDSUM_NATIVE_FORMAL_API_H
#define RDSUM_NATIVE_FORMAL_API_H
#include <stdint.h>
typedef struct int8x8_t { int8_t s0;int8_t s1;int8_t s2;int8_t s3;int8_t s4;int8_t s5;int8_t s6;int8_t s7; } int8x8_t;
typedef struct int16x8_t { int16_t s0;int16_t s1;int16_t s2;int16_t s3;int16_t s4;int16_t s5;int16_t s6;int16_t s7; } int16x8_t;
typedef struct int32x2_t { int32_t s0;int32_t s1; } int32x2_t;
typedef struct int32x4_t { int32_t s0;int32_t s1;int32_t s2;int32_t s3; } int32x4_t;
typedef struct vint8m2_t { int8_t s0;int8_t s1;int8_t s2;int8_t s3;int8_t s4;int8_t s5;int8_t s6;int8_t s7;int8_t s8;int8_t s9;int8_t s10;int8_t s11;int8_t s12;int8_t s13;int8_t s14;int8_t s15;int8_t s16;int8_t s17;int8_t s18;int8_t s19;int8_t s20;int8_t s21;int8_t s22;int8_t s23;int8_t s24;int8_t s25;int8_t s26;int8_t s27;int8_t s28;int8_t s29;int8_t s30;int8_t s31; } vint8m2_t;
typedef struct vint16m4_t { int16_t s0;int16_t s1;int16_t s2;int16_t s3;int16_t s4;int16_t s5;int16_t s6;int16_t s7;int16_t s8;int16_t s9;int16_t s10;int16_t s11;int16_t s12;int16_t s13;int16_t s14;int16_t s15;int16_t s16;int16_t s17;int16_t s18;int16_t s19;int16_t s20;int16_t s21;int16_t s22;int16_t s23;int16_t s24;int16_t s25;int16_t s26;int16_t s27;int16_t s28;int16_t s29;int16_t s30;int16_t s31; } vint16m4_t;
typedef struct vint32m8_t { int32_t s0;int32_t s1;int32_t s2;int32_t s3;int32_t s4;int32_t s5;int32_t s6;int32_t s7;int32_t s8;int32_t s9;int32_t s10;int32_t s11;int32_t s12;int32_t s13;int32_t s14;int32_t s15;int32_t s16;int32_t s17;int32_t s18;int32_t s19;int32_t s20;int32_t s21;int32_t s22;int32_t s23;int32_t s24;int32_t s25;int32_t s26;int32_t s27;int32_t s28;int32_t s29;int32_t s30;int32_t s31; } vint32m8_t;
struct xnn_qs8_rsum_params {char _;};



int16_t rsum_narrow16(int32_t x)
;
uint16_t rsum_unarrow16(int32_t x)
;
int32_t rsum_narrow32(long long x)
;
int32_t rsum_add_s32(int32_t a,int32_t b)
;
uint32_t rsum_add_u32(uint32_t a,uint32_t b)
;
int16_t rsum_pair_s8(int16_t a,int8_t x,int8_t y)
;
uint16_t rsum_pair_u8(uint16_t a,uint8_t x,uint8_t y)
;
int32_t rsum_pair_s16(int32_t a,int16_t x,int16_t y)
;
uint32_t rsum_pair_u16(uint32_t a,uint16_t x,uint16_t y)
;






int16x8_t vmovq_n_s16(int16_t x)
;
int32x4_t vdupq_n_s32(int32_t x)
;
int16x8_t vaddw_s8(int16x8_t a,int8x8_t b)
;
int32x4_t rdsum_wadd16_low(int32x4_t a,int16x8_t b)
;
int32x4_t rdsum_wadd16_high(int32x4_t a,int16x8_t b)
;
int32x4_t vaddq_s32(int32x4_t a,int32x4_t b)
;
int32x2_t rdsum_addlow2(int32x2_t a,int32x4_t b)
;
int32x4_t rdsum_selfext2(int32x4_t a)
;
int32_t rdsum_lane0(int32x4_t a)
;
vint16m4_t __riscv_vmv_v_x_i16m4(int16_t x,unsigned long long vl)
;
vint32m8_t __riscv_vmv_v_x_i32m8(int32_t x,unsigned long long vl)
;
vint16m4_t __riscv_vwadd_wv_i16m4(vint16m4_t a,vint8m2_t b,unsigned long long vl)
;
vint32m8_t __riscv_vwadd_wv_i32m8(vint32m8_t a,vint16m4_t b,unsigned long long vl)
;
vint32m8_t __riscv_vadd_vv_i32m8(vint32m8_t a,vint32m8_t b,unsigned long long vl)
;


void test_neon(unsigned long long rows,unsigned long long channels,const int8_t *input,unsigned long long input_stride,const int8_t *zero,int32_t *output,const struct xnn_qs8_rsum_params *params);
void test_rvv(unsigned long long rows,unsigned long long channels,const int8_t *input,unsigned long long input_stride,const int8_t *zero,int32_t *output,const struct xnn_qs8_rsum_params *params);
int equivalent(unsigned long long rows,unsigned long long channels,const int8_t *input,unsigned long long input_stride,const int8_t *zero,int32_t *left,int32_t *right,const struct xnn_qs8_rsum_params *params);
int rdsum_equal_i32(unsigned long long,const int32_t*,const int32_t*);
#endif
