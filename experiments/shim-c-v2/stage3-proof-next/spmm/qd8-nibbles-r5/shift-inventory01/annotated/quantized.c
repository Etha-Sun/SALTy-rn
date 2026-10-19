/*@ ghost
/@ terminates \true; assigns \nothing;
    ensures qd8_shift8_bound_all: n<8 ==> (\forall integer u; 0<=u<=255 ==> 0<=(u<<n)<=32640);
@/
static void qd8_shift8_bound(unsigned n) {
  switch(n) {
    case 0: /@ assert qd8_shift8_case_0: \forall integer u; 0<=u<=255 ==> 0<=(u<<n)<=32640; @/ return;
    case 1: /@ assert qd8_shift8_case_1: \forall integer u; 0<=u<=255 ==> 0<=(u<<n)<=32640; @/ return;
    case 2: /@ assert qd8_shift8_case_2: \forall integer u; 0<=u<=255 ==> 0<=(u<<n)<=32640; @/ return;
    case 3: /@ assert qd8_shift8_case_3: \forall integer u; 0<=u<=255 ==> 0<=(u<<n)<=32640; @/ return;
    case 4: /@ assert qd8_shift8_case_4: \forall integer u; 0<=u<=255 ==> 0<=(u<<n)<=32640; @/ return;
    case 5: /@ assert qd8_shift8_case_5: \forall integer u; 0<=u<=255 ==> 0<=(u<<n)<=32640; @/ return;
    case 6: /@ assert qd8_shift8_case_6: \forall integer u; 0<=u<=255 ==> 0<=(u<<n)<=32640; @/ return;
    case 7: /@ assert qd8_shift8_case_7: \forall integer u; 0<=u<=255 ==> 0<=(u<<n)<=32640; @/ return;
    default: return;
  }
}
*/
#include "fp_primitives.h"

uint32x4_t vaddq_u32(uint32x4_t a,uint32x4_t b) { for(int i=0;i<4;i++)a.lane[i]+=b.lane[i];return a; }

vuint32m8_t __riscv_vle32_v_u32m8(const uint32_t *p,size_t vl) { vuint32m8_t r={{0}};for(size_t i=0;i<vl;i++)r.lane[i]=p[i];return r; }

vuint32m8_t __riscv_vmv_v_x_u32m8(uint32_t x,size_t vl) { vuint32m8_t r={{0}};for(size_t i=0;i<vl;i++)r.lane[i]=x;return r; }

void __riscv_vse32_v_u32m8(uint32_t *p,vuint32m8_t a,size_t vl) { for(size_t i=0;i<vl;i++)p[i]=a.lane[i]; }

int32_t bits_i32(uint32_t u) { int32_t r;memcpy(&r,&u,4);return r; }

/*@ assigns \nothing; ensures \result==(int8_t)u; */
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

/*@ requires vl<=32; requires \valid_read(p+(0..vl-1)); assigns \nothing; ensures \forall integer j;0<=j<vl ==> \result.lane[j]==p[j]; */
vint8m2_t __riscv_vle8_v_i8m2(const int8_t *p,size_t vl) { vint8m2_t r={{0}};/*@ loop invariant 0<=i<=vl; loop invariant \forall integer j;0<=j<i ==> r.lane[j]==p[j]; loop assigns i,r; loop variant vl-i; */for(size_t i=0;i<vl;i++)r.lane[i]=p[i];return r; }

/*@ requires vl<=32; requires n<8; assigns \nothing; ensures \forall integer j;0<=j<vl ==> \result.lane[j]==(int8_t)((uint8_t)\at(a.lane[j],Pre)<<n); */
vint8m2_t __riscv_vsll_vx_i8m2(vint8m2_t a,unsigned n,size_t vl) { /*@ ghost qd8_shift8_bound(n); */ /*@ loop invariant qd8_shift8_n: n<8; loop invariant qd8_shift8_all: \forall integer u; 0<=u<=255 ==> 0<=(u<<n)<=32640; loop invariant 0<=i<=vl; loop invariant \forall integer j;0<=j<i ==> a.lane[j]==(int8_t)((uint8_t)\at(a.lane[j],Pre)<<n); loop invariant \forall integer j;i<=j<32 ==> a.lane[j]==\at(a.lane[j],Pre); loop assigns i,a; loop variant vl-i; */ for(size_t i=0;i<vl;i++)a.lane[i]=bits_i8((uint8_t)((uint8_t)a.lane[i]<<n));return a; }

/*@ requires vl<=32; assigns \nothing; ensures \forall integer j;0<=j<vl ==> \result.lane[j]==(int8_t)((uint8_t)\at(a.lane[j],Pre)&(uint8_t)x); */
vint8m2_t __riscv_vand_vx_i8m2(vint8m2_t a,int8_t x,size_t vl) { /*@ loop invariant 0<=i<=vl; loop invariant \forall integer j;0<=j<i ==> a.lane[j]==(int8_t)((uint8_t)\at(a.lane[j],Pre)&(uint8_t)x); loop invariant \forall integer j;i<=j<32 ==> a.lane[j]==\at(a.lane[j],Pre); loop assigns i,a; loop variant vl-i; */ for(size_t i=0;i<vl;i++)a.lane[i]=bits_i8((uint8_t)a.lane[i]&(uint8_t)x);return a; }

/*@ requires vl<=32; assigns \nothing; ensures \forall integer j;0<=j<vl ==> \result.lane[j]==a.lane[j]; */
vint16m4_t __riscv_vsext_vf2_i16m4(vint8m2_t a,size_t vl) { vint16m4_t r={{0}};/*@ loop invariant 0<=i<=vl; loop invariant \forall integer j;0<=j<i ==> r.lane[j]==a.lane[j]; loop assigns i,r; loop variant vl-i; */for(size_t i=0;i<vl;i++)r.lane[i]=a.lane[i];return r; }

vint32m8_t __riscv_vwmacc_vx_i32m8(vint32m8_t a,int16_t x,vint16m4_t b,size_t vl) { for(size_t i=0;i<vl;i++)a.lane[i]=bits_i32((uint32_t)a.lane[i]+(uint32_t)((int32_t)x*b.lane[i]));return a; }

vint32m8_t __riscv_vsra_vx_i32m8(vint32m8_t a,unsigned n,size_t vl) { for(size_t i=0;i<vl;i++)a.lane[i]=arithmetic_shift32(a.lane[i],n);return a; }

vfloat32m8_t __riscv_vfcvt_f_x_v_f32m8(vint32m8_t a,size_t vl) { vfloat32m8_t r={{0}};for(size_t i=0;i<vl;i++)r.lane[i]=(float)a.lane[i];return r; }
