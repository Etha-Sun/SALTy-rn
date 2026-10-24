#ifndef RDSUM_NATIVE_FORMAL_API_H
#define RDSUM_NATIVE_FORMAL_API_H
#include <stdint.h>
typedef struct uint8x8_t { uint8_t s0;uint8_t s1;uint8_t s2;uint8_t s3;uint8_t s4;uint8_t s5;uint8_t s6;uint8_t s7; } uint8x8_t;
typedef struct uint8x16_t { uint8_t s0;uint8_t s1;uint8_t s2;uint8_t s3;uint8_t s4;uint8_t s5;uint8_t s6;uint8_t s7;uint8_t s8;uint8_t s9;uint8_t s10;uint8_t s11;uint8_t s12;uint8_t s13;uint8_t s14;uint8_t s15; } uint8x16_t;
typedef struct uint16x8_t { uint16_t s0;uint16_t s1;uint16_t s2;uint16_t s3;uint16_t s4;uint16_t s5;uint16_t s6;uint16_t s7; } uint16x8_t;
typedef struct uint32x2_t { uint32_t s0;uint32_t s1; } uint32x2_t;
typedef struct uint32x4_t { uint32_t s0;uint32_t s1;uint32_t s2;uint32_t s3; } uint32x4_t;
typedef struct vuint8m2_t { uint8_t s0;uint8_t s1;uint8_t s2;uint8_t s3;uint8_t s4;uint8_t s5;uint8_t s6;uint8_t s7;uint8_t s8;uint8_t s9;uint8_t s10;uint8_t s11;uint8_t s12;uint8_t s13;uint8_t s14;uint8_t s15;uint8_t s16;uint8_t s17;uint8_t s18;uint8_t s19;uint8_t s20;uint8_t s21;uint8_t s22;uint8_t s23;uint8_t s24;uint8_t s25;uint8_t s26;uint8_t s27;uint8_t s28;uint8_t s29;uint8_t s30;uint8_t s31; } vuint8m2_t;
typedef struct vuint16m4_t { uint16_t s0;uint16_t s1;uint16_t s2;uint16_t s3;uint16_t s4;uint16_t s5;uint16_t s6;uint16_t s7;uint16_t s8;uint16_t s9;uint16_t s10;uint16_t s11;uint16_t s12;uint16_t s13;uint16_t s14;uint16_t s15;uint16_t s16;uint16_t s17;uint16_t s18;uint16_t s19;uint16_t s20;uint16_t s21;uint16_t s22;uint16_t s23;uint16_t s24;uint16_t s25;uint16_t s26;uint16_t s27;uint16_t s28;uint16_t s29;uint16_t s30;uint16_t s31; } vuint16m4_t;
typedef struct vuint32m8_t { uint32_t s0;uint32_t s1;uint32_t s2;uint32_t s3;uint32_t s4;uint32_t s5;uint32_t s6;uint32_t s7;uint32_t s8;uint32_t s9;uint32_t s10;uint32_t s11;uint32_t s12;uint32_t s13;uint32_t s14;uint32_t s15;uint32_t s16;uint32_t s17;uint32_t s18;uint32_t s19;uint32_t s20;uint32_t s21;uint32_t s22;uint32_t s23;uint32_t s24;uint32_t s25;uint32_t s26;uint32_t s27;uint32_t s28;uint32_t s29;uint32_t s30;uint32_t s31; } vuint32m8_t;
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






uint16x8_t vmovq_n_u16(uint16_t x)
;
uint32x4_t vdupq_n_u32(uint32_t x)
;
uint16x8_t vaddw_u8(uint16x8_t a,uint8x8_t b)
;
uint16x8_t rdsum_wadd8_low16(uint16x8_t a,uint8x16_t b)
;
uint32x4_t rdsum_wadd16_low(uint32x4_t a,uint16x8_t b)
;
uint32x4_t rdsum_wadd16_high(uint32x4_t a,uint16x8_t b)
;
uint32x4_t vaddq_u32(uint32x4_t a,uint32x4_t b)
;
uint32x2_t rdsum_addlow2(uint32x2_t a,uint32x4_t b)
;
uint32x4_t rdsum_selfext2(uint32x4_t a)
;
uint32_t rdsum_lane0(uint32x4_t a)
;
vuint16m4_t __riscv_vmv_v_x_u16m4(uint16_t x,unsigned long long vl)
;
vuint32m8_t __riscv_vmv_v_x_u32m8(uint32_t x,unsigned long long vl)
;
vuint16m4_t __riscv_vwaddu_wv_u16m4(vuint16m4_t a,vuint8m2_t b,unsigned long long vl)
;
vuint32m8_t __riscv_vwaddu_wv_u32m8(vuint32m8_t a,vuint16m4_t b,unsigned long long vl)
;
vuint32m8_t __riscv_vadd_vv_u32m8(vuint32m8_t a,vuint32m8_t b,unsigned long long vl)
;


void test_neon(unsigned long long rows,unsigned long long channels,const uint8_t *input,unsigned long long input_stride,const uint8_t *zero,uint32_t *output,const struct xnn_qs8_rsum_params *params);
void test_rvv(unsigned long long rows,unsigned long long channels,const uint8_t *input,unsigned long long input_stride,const uint8_t *zero,uint32_t *output,const struct xnn_qs8_rsum_params *params);
int equivalent(unsigned long long rows,unsigned long long channels,const uint8_t *input,unsigned long long input_stride,const uint8_t *zero,uint32_t *left,uint32_t *right,const struct xnn_qs8_rsum_params *params);
int rdsum_equal_i32(unsigned long long,const uint32_t*,const uint32_t*);
#endif
