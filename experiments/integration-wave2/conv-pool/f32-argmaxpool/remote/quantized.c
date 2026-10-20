#include "fp_primitives.h"

/*@ assigns \nothing;
 ensures root40_add: \forall integer j; 0<=j<4 ==> \result.lane[j]==(\at(a.lane[j],Pre)+b.lane[j])%4294967296; */
uint32x4_t vaddq_u32(uint32x4_t a,uint32x4_t b) { /*@ loop invariant root40_add_bounds: 0<=i<=4;
 loop invariant root40_add_prefix: \forall integer j; 0<=j<i ==> a.lane[j]==(\at(a.lane[j],Pre)+b.lane[j])%4294967296;
 loop invariant root40_add_suffix: \forall integer j; i<=j<4 ==> a.lane[j]==\at(a.lane[j],Pre);
 loop assigns i,a.lane[0..3]; loop variant 4-i; */
for(int i=0;i<4;i++)a.lane[i]+=b.lane[i];return a; }

vuint32m8_t __riscv_vle32_v_u32m8(const uint32_t *p,size_t vl) { vuint32m8_t r={{0}};/*@ loop invariant next_arg_u32_range: 0<=i<=vl; loop invariant next_arg_u32_prefix: \forall integer j; 0<=j<i ==> r.lane[j]==p[j]; loop assigns i,r.lane[0..vl-1]; loop variant vl-i; */
for(size_t i=0;i<vl;i++)r.lane[i]=p[i];return r; }

vuint32m8_t __riscv_vmv_v_x_u32m8(uint32_t x,size_t vl) { vuint32m8_t r={{0}};/*@ loop invariant next_arg_u32_range: 0<=i<=vl; loop invariant next_arg_u32_prefix: \forall integer j; 0<=j<i ==> r.lane[j]==x; loop assigns i,r.lane[0..vl-1]; loop variant vl-i; */
for(size_t i=0;i<vl;i++)r.lane[i]=x;return r; }

void __riscv_vse32_v_u32m8(uint32_t *p,vuint32m8_t a,size_t vl) { /*@ loop invariant next_arg_u32_range: 0<=i<=vl; loop invariant next_arg_u32_prefix: \forall integer j; 0<=j<i ==> p[j]==a.lane[j]; loop assigns i,p[0..vl-1]; loop variant vl-i; */
for(size_t i=0;i<vl;i++)p[i]=a.lane[i]; }

int32_t bits_i32(uint32_t u) { int32_t r;memcpy(&r,&u,4);return r; }

int8_t bits_i8(uint8_t u) { int8_t r;memcpy(&r,&u,1);return r; }

int32_t arithmetic_shift32(int32_t x,unsigned n) { int64_t d=INT64_C(1)<<n;int64_t v=x;return (int32_t)(v>=0?v/d:-((-v+d-1)/d)); }

int8x8_t vmov_n_s8(int8_t x) { int8x8_t r;for(int i=0;i<8;i++)r.lane[i]=x;return r; }

int8x8_t vshl_n_s8(int8x8_t a,unsigned n) { for(int i=0;i<8;i++)a.lane[i]=bits_i8((uint8_t)((uint8_t)a.lane[i]<<n));return a; }

int8x8_t vand_s8(int8x8_t a,int8x8_t b) { for(int i=0;i<8;i++)a.lane[i]=bits_i8((uint8_t)a.lane[i]&(uint8_t)b.lane[i]);return a; }

int16x8_t vmovl_s8(int8x8_t a) { int16x8_t r;for(int i=0;i<8;i++)r.lane[i]=a.lane[i];return r; }

int32x4_t vmulq_s32(int32x4_t a,int32x4_t b) { for(int i=0;i<4;i++)a.lane[i]=bits_i32((uint32_t)a.lane[i]*(uint32_t)b.lane[i]);return a; }

int32x4_t vmlal_lane_s16(int32x4_t a,int16x4_t b,int16x4_t c,int lane) { for(int i=0;i<4;i++)a.lane[i]=bits_i32((uint32_t)a.lane[i]+(uint32_t)((int32_t)b.lane[i]*c.lane[lane]));return a; }

int32x4_t vshrq_n_s32(int32x4_t a,unsigned n) { for(int i=0;i<4;i++)a.lane[i]=arithmetic_shift32(a.lane[i],n);return a; }

float32x4_t vcvtq_f32_s32(int32x4_t a) { float32x4_t r;for(int i=0;i<4;i++)r.lane[i]=(float)a.lane[i];return r; }

vint32m8_t __riscv_vle32_v_i32m8(const int32_t *p,size_t vl) { vint32m8_t r={{0}};for(size_t i=0;i<vl;i++)r.lane[i]=p[i];return r; }

vint32m8_t __riscv_vmul_vx_i32m8(vint32m8_t a,int32_t x,size_t vl) { for(size_t i=0;i<vl;i++)a.lane[i]=bits_i32((uint32_t)a.lane[i]*(uint32_t)x);return a; }

vint8m2_t __riscv_vle8_v_i8m2(const int8_t *p,size_t vl) { vint8m2_t r={{0}};for(size_t i=0;i<vl;i++)r.lane[i]=p[i];return r; }

vint8m2_t __riscv_vsll_vx_i8m2(vint8m2_t a,unsigned n,size_t vl) { for(size_t i=0;i<vl;i++)a.lane[i]=bits_i8((uint8_t)((uint8_t)a.lane[i]<<n));return a; }

vint8m2_t __riscv_vand_vx_i8m2(vint8m2_t a,int8_t x,size_t vl) { for(size_t i=0;i<vl;i++)a.lane[i]=bits_i8((uint8_t)a.lane[i]&(uint8_t)x);return a; }

vint16m4_t __riscv_vsext_vf2_i16m4(vint8m2_t a,size_t vl) { vint16m4_t r={{0}};for(size_t i=0;i<vl;i++)r.lane[i]=a.lane[i];return r; }

vint32m8_t __riscv_vwmacc_vx_i32m8(vint32m8_t a,int16_t x,vint16m4_t b,size_t vl) { for(size_t i=0;i<vl;i++)a.lane[i]=bits_i32((uint32_t)a.lane[i]+(uint32_t)((int32_t)x*b.lane[i]));return a; }

vint32m8_t __riscv_vsra_vx_i32m8(vint32m8_t a,unsigned n,size_t vl) { for(size_t i=0;i<vl;i++)a.lane[i]=arithmetic_shift32(a.lane[i],n);return a; }

vfloat32m8_t __riscv_vfcvt_f_x_v_f32m8(vint32m8_t a,size_t vl) { vfloat32m8_t r={{0}};for(size_t i=0;i<vl;i++)r.lane[i]=(float)a.lane[i];return r; }
