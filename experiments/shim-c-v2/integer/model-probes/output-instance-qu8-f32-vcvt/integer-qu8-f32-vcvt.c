#include "shim.h"
/*@
  requires \valid_read(p+(0..8-1));
  terminates \true;
  assigns \nothing;
  ensures \forall integer j; 0<=j<8 ==> \result.lane[j]==(uint8_t)(p[j]);
*/
uint8x8_t vld1_u8(const uint8_t *p) { uint8x8_t r = {0}; /*@
  loop invariant 0<=i<=8;
  loop invariant \forall integer j; 0<=j<i ==> r.lane[j]==(uint8_t)(p[j]);
  loop assigns i,r.lane[0..7];
  loop variant 8-i;
*/
for(size_t i=0;i<8;i++) r.lane[i]=p[i]; return r; }
/*@
  terminates \true;
  assigns \nothing;
  ensures \forall integer j; 0<=j<8 ==> \result.lane[j]==(int16_t)(x);
*/
int16x8_t vdupq_n_s16(int16_t x) { int16x8_t r = {0}; /*@
  loop invariant 0<=i<=8;
  loop invariant \forall integer j; 0<=j<i ==> r.lane[j]==(int16_t)(x);
  loop assigns i,r.lane[0..7];
  loop variant 8-i;
*/
for(size_t i=0;i<8;i++) r.lane[i]=x; return r; }
/*@
  terminates \true;
  assigns \nothing;
  ensures \forall integer j; 0<=j<4 ==> \result.lane[j]==(int16_t)(a.lane[j]);
*/
int16x4_t vget_low_s16(int16x8_t a) { int16x4_t r = {0}; /*@
  loop invariant 0<=i<=4;
  loop invariant \forall integer j; 0<=j<i ==> r.lane[j]==(int16_t)(a.lane[j]);
  loop assigns i,r.lane[0..3];
  loop variant 4-i;
*/
for(size_t i=0;i<4;i++) r.lane[i]=a.lane[i]; return r; }
/*@
  terminates \true;
  assigns \nothing;
  ensures \forall integer j; 0<=j<4 ==> \result.lane[j]==(int16_t)(a.lane[j+4]);
*/
int16x4_t vget_high_s16(int16x8_t a) { int16x4_t r = {0}; /*@
  loop invariant 0<=i<=4;
  loop invariant \forall integer j; 0<=j<i ==> r.lane[j]==(int16_t)(a.lane[j+4]);
  loop assigns i,r.lane[0..3];
  loop variant 4-i;
*/
for(size_t i=0;i<4;i++) r.lane[i]=a.lane[i+4]; return r; }
/*@
  requires \valid(p+(0..2-1));
  terminates \true;
  assigns p[0..2-1];
  ensures \forall integer j; 0<=j<2 ==> same_float(p[j],a.lane[j]);
  ensures \forall float *q; \valid_read(q) && \separated(q,p+(0..2-1)) ==> same_float(*q,\old(*q));
*/
void vst1_f32(float *p, float32x2_t a) { /*@
  loop invariant 0<=i<=2;
  loop invariant \forall integer j; 0<=j<i ==> same_float(p[j],a.lane[j]);
  loop assigns i,p[0..2-1];
  loop variant 2-i;
*/
for(size_t i=0;i<2;i++)p[i]=a.lane[i]; }
/*@
  requires \valid(p);
  requires 0<=n<2;
  terminates \true;
  assigns *p;
  ensures same_float(*p,a.lane[n]);
  ensures \forall float *q; \valid_read(q) && \separated(q,p) ==> same_float(*q,\old(*q));
*/
void vst1_lane_f32(float *p,float32x2_t a,int n) { *p=a.lane[n]; }
/*@
  terminates \true;
  assigns \nothing;
  ensures \forall integer j; 0<=j<4 ==> same_float(\result.lane[j],x);
*/
float32x4_t vdupq_n_f32(float x) { float32x4_t r = {0}; /*@
  loop invariant 0<=i<=4;
  loop invariant \forall integer j; 0<=j<i ==> same_float(r.lane[j],x);
  loop assigns i,r.lane[0..3];
  loop variant 4-i;
*/
for(size_t i=0;i<4;i++) r.lane[i]=x; return r; }
/*@
  requires \valid(p+(0..4-1));
  terminates \true;
  assigns p[0..4-1];
  ensures \forall integer j; 0<=j<4 ==> same_float(p[j],a.lane[j]);
  ensures \forall float *q; \valid_read(q) && \separated(q,p+(0..4-1)) ==> same_float(*q,\old(*q));
*/
void vst1q_f32(float *p, float32x4_t a) { /*@
  loop invariant 0<=i<=4;
  loop invariant \forall integer j; 0<=j<i ==> same_float(p[j],a.lane[j]);
  loop assigns i,p[0..4-1];
  loop variant 4-i;
*/
for(size_t i=0;i<4;i++)p[i]=a.lane[i]; }
/*@
  terminates \true;
  assigns \nothing;
  ensures \forall integer j; 0<=j<4 ==> same_value(\result.lane[j],fp_mul32(a.lane[j],b.lane[j]));
*/
float32x4_t vmulq_f32(float32x4_t a, float32x4_t b) { float32x4_t r = {0}; /*@
  loop invariant 0<=i<=4;
  loop invariant \forall integer j; 0<=j<i ==> same_value(r.lane[j],fp_mul32(a.lane[j],b.lane[j]));
  loop assigns i,r.lane[0..3];
  loop variant 4-i;
*/
for(size_t i=0;i<4;i++) r.lane[i]=a.lane[i]*b.lane[i]; return r; }
/*@
  terminates \true;
  assigns \nothing;
  ensures \forall integer j; 0<=j<2 ==> same_float(\result.lane[j],a.lane[j]);
*/
float32x2_t vget_low_f32(float32x4_t a) { float32x2_t r = {0}; /*@
  loop invariant 0<=i<=2;
  loop invariant \forall integer j; 0<=j<i ==> same_float(r.lane[j],a.lane[j]);
  loop assigns i,r.lane[0..1];
  loop variant 2-i;
*/
for(size_t i=0;i<2;i++) r.lane[i]=a.lane[i]; return r; }
/*@
  terminates \true;
  assigns \nothing;
  ensures \forall integer j; 0<=j<2 ==> same_float(\result.lane[j],a.lane[j+2]);
*/
float32x2_t vget_high_f32(float32x4_t a) { float32x2_t r = {0}; /*@
  loop invariant 0<=i<=2;
  loop invariant \forall integer j; 0<=j<i ==> same_float(r.lane[j],a.lane[j+2]);
  loop assigns i,r.lane[0..1];
  loop variant 2-i;
*/
for(size_t i=0;i<2;i++) r.lane[i]=a.lane[i+2]; return r; }
/*@
  terminates \true;
  assigns \nothing;
  ensures \forall integer j; 0<=j<8 ==> \result.lane[j]==(int16_t)(a.lane[j]<=INT16_MAX?(int16_t)a.lane[j]:(int16_t)(-1-(int32_t)(UINT16_MAX-a.lane[j])));
*/
int16x8_t vreinterpretq_s16_u16(uint16x8_t a) { int16x8_t r; /*@
  loop invariant 0<=i<=8;
  loop invariant \forall integer j; 0<=j<i ==> r.lane[j]==(int16_t)(a.lane[j]<=INT16_MAX?(int16_t)a.lane[j]:(int16_t)(-1-(int32_t)(UINT16_MAX-a.lane[j])));
  loop assigns i,r.lane[0..7];
  loop variant 8-i;
*/
for(size_t i=0;i<8;i++) r.lane[i]=a.lane[i]<=INT16_MAX?(int16_t)a.lane[i]:(int16_t)(-1-(int32_t)(UINT16_MAX-a.lane[i])); return r; }
/*@
  terminates \true;
  assigns \nothing;
  ensures \forall integer j; 0<=j<8 ==> \result.lane[j]==(uint16_t)((uint16_t)a.lane[j]);
*/
uint16x8_t vreinterpretq_u16_s16(int16x8_t a) { uint16x8_t r; /*@
  loop invariant 0<=i<=8;
  loop invariant \forall integer j; 0<=j<i ==> r.lane[j]==(uint16_t)((uint16_t)a.lane[j]);
  loop assigns i,r.lane[0..7];
  loop variant 8-i;
*/
for(size_t i=0;i<8;i++) r.lane[i]=(uint16_t)a.lane[i]; return r; }
/*@
  terminates \true;
  assigns \nothing;
  ensures \forall integer j; 0<=j<4 ==> \result.lane[j]==(int32_t)(a.lane[j]);
*/
int32x4_t vmovl_s16(int16x4_t a) { int32x4_t r = {0}; /*@
  loop invariant 0<=i<=4;
  loop invariant \forall integer j; 0<=j<i ==> r.lane[j]==(int32_t)(a.lane[j]);
  loop assigns i,r.lane[0..3];
  loop variant 4-i;
*/
for(size_t i=0;i<4;i++) r.lane[i]=a.lane[i]; return r; }
/*@
  terminates \true;
  assigns \nothing;
  ensures \forall integer j; 0<=j<8 ==> \result.lane[j]==(uint16_t)((int64_t)a.lane[j]+b.lane[j]);
*/
uint16x8_t vaddw_u8(uint16x8_t a,uint8x8_t b) { uint16x8_t r = {0}; /*@
  loop invariant 0<=i<=8;
  loop invariant \forall integer j; 0<=j<i ==> r.lane[j]==(uint16_t)((int64_t)a.lane[j]+b.lane[j]);
  loop assigns i,r.lane[0..7];
  loop variant 8-i;
*/
for(size_t i=0;i<8;i++) r.lane[i]=(int64_t)a.lane[i]+b.lane[i]; return r; }
/*@
  terminates \true;
  assigns \nothing;
  ensures \forall integer j; 0<=j<4 ==> same_float(\result.lane[j],(float)a.lane[j]);
*/
float32x4_t vcvtq_f32_s32(int32x4_t a) { float32x4_t r = {0}; /*@
  loop invariant 0<=i<=4;
  loop invariant \forall integer j; 0<=j<i ==> same_float(r.lane[j],(float)a.lane[j]);
  loop assigns i,r.lane[0..3];
  loop variant 4-i;
*/
for(size_t i=0;i<4;i++) r.lane[i]=(float)a.lane[i]; return r; }
/*@
  terminates \true;
  assigns \nothing;
  ensures \result==(n<32?n:32);
*/
size_t __riscv_vsetvl_e8m2(size_t n) { return n<32?n:32; }
/*@
  requires vl<=32;
  requires \valid_read(p+(0..vl-1));
  terminates \true;
  assigns \nothing;
  ensures \forall integer j; 0<=j<vl ==> \result.lane[j]==(uint8_t)(p[j]);
*/
vuint8m2_t __riscv_vle8_v_u8m2(const uint8_t *p,size_t vl) { vuint8m2_t r = {0}; /*@
  loop invariant 0<=i<=vl;
  loop invariant \forall integer j; 0<=j<i ==> r.lane[j]==(uint8_t)(p[j]);
  loop assigns i,r.lane[0..31];
  loop variant vl-i;
*/
for(size_t i=0;i<vl;i++) r.lane[i]=p[i]; return r; }
/*@
  requires vl<=32;
  terminates \true;
  assigns \nothing;
  ensures \forall integer j; 0<=j<vl ==> \result.lane[j]==(uint16_t)(a.lane[j]+b);
*/
vuint16m4_t __riscv_vadd_vx_u16m4(vuint16m4_t a,uint16_t b,size_t vl) { vuint16m4_t r = {0}; /*@
  loop invariant 0<=i<=vl;
  loop invariant \forall integer j; 0<=j<i ==> r.lane[j]==(uint16_t)(a.lane[j]+b);
  loop assigns i,r.lane[0..31];
  loop variant vl-i;
*/
for(size_t i=0;i<vl;i++) r.lane[i]=a.lane[i]+b; return r; }
/*@
  requires vl<=32;
  requires \valid(p+(0..vl-1));
  terminates \true;
  assigns p[0..vl-1];
  ensures \forall integer j; 0<=j<vl ==> same_float(p[j],a.lane[j]);
  ensures \forall float *q; \valid_read(q) && \separated(q,p+(0..vl-1)) ==> same_float(*q,\old(*q));
*/
void __riscv_vse32_v_f32m8(float *p,vfloat32m8_t a,size_t vl) { /*@
  loop invariant 0<=i<=vl;
  loop invariant \forall integer j; 0<=j<i ==> same_float(p[j],a.lane[j]);
  loop assigns i,p[0..vl-1];
  loop variant vl-i;
*/
for(size_t i=0;i<vl;i++)p[i]=a.lane[i]; }
/*@
  requires vl<=32;
  terminates \true;
  assigns \nothing;
  ensures \forall integer j; 0<=j<vl ==> \result.lane[j]==(int32_t)(a.lane[j]);
*/
vint32m8_t __riscv_vsext_vf2_i32m8(vint16m4_t a,size_t vl) { vint32m8_t r = {0}; /*@
  loop invariant 0<=i<=vl;
  loop invariant \forall integer j; 0<=j<i ==> r.lane[j]==(int32_t)(a.lane[j]);
  loop assigns i,r.lane[0..31];
  loop variant vl-i;
*/
for(size_t i=0;i<vl;i++) r.lane[i]=a.lane[i]; return r; }
/*@
  requires vl<=32;
  terminates \true;
  assigns \nothing;
  ensures \forall integer j; 0<=j<vl ==> \result.lane[j]==(uint16_t)(a.lane[j]);
*/
vuint16m4_t __riscv_vzext_vf2_u16m4(vuint8m2_t a,size_t vl) { vuint16m4_t r = {0}; /*@
  loop invariant 0<=i<=vl;
  loop invariant \forall integer j; 0<=j<i ==> r.lane[j]==(uint16_t)(a.lane[j]);
  loop assigns i,r.lane[0..31];
  loop variant vl-i;
*/
for(size_t i=0;i<vl;i++) r.lane[i]=a.lane[i]; return r; }
/*@
  requires vl<=32;
  terminates \true;
  assigns \nothing;
  ensures \forall integer j; 0<=j<vl ==> same_float(\result.lane[j],(float)a.lane[j]);
*/
vfloat32m8_t __riscv_vfcvt_f_x_v_f32m8(vint32m8_t a,size_t vl) { vfloat32m8_t r = {0}; /*@
  loop invariant 0<=i<=vl;
  loop invariant \forall integer j; 0<=j<i ==> same_float(r.lane[j],(float)a.lane[j]);
  loop assigns i,r.lane[0..31];
  loop variant vl-i;
*/
for(size_t i=0;i<vl;i++) r.lane[i]=(float)a.lane[i]; return r; }
/*@
  requires vl<=32;
  terminates \true;
  assigns \nothing;
  ensures \forall integer j; 0<=j<vl ==> same_value(\result.lane[j],fp_mul32(a.lane[j],b));
*/
vfloat32m8_t __riscv_vfmul_vf_f32m8(vfloat32m8_t a,float b,size_t vl) { vfloat32m8_t r = {0}; /*@
  loop invariant 0<=i<=vl;
  loop invariant \forall integer j; 0<=j<i ==> same_value(r.lane[j],fp_mul32(a.lane[j],b));
  loop assigns i,r.lane[0..31];
  loop variant vl-i;
*/
for(size_t i=0;i<vl;i++) r.lane[i]=a.lane[i]*b; return r; }
/*@
  terminates \true;
  assigns \nothing;
  ensures \forall integer j; 0<=j<32 ==> \result.lane[j]==(int16_t)(a.lane[j]<=INT16_MAX?(int16_t)a.lane[j]:(int16_t)(-1-(int32_t)(UINT16_MAX-a.lane[j])));
*/
vint16m4_t __riscv_vreinterpret_v_u16m4_i16m4(vuint16m4_t a) { vint16m4_t r; /*@
  loop invariant 0<=i<=32;
  loop invariant \forall integer j; 0<=j<i ==> r.lane[j]==(int16_t)(a.lane[j]<=INT16_MAX?(int16_t)a.lane[j]:(int16_t)(-1-(int32_t)(UINT16_MAX-a.lane[j])));
  loop assigns i,r.lane[0..31];
  loop variant 32-i;
*/
for(size_t i=0;i<32;i++) r.lane[i]=a.lane[i]<=INT16_MAX?(int16_t)a.lane[i]:(int16_t)(-1-(int32_t)(UINT16_MAX-a.lane[i])); return r; }
