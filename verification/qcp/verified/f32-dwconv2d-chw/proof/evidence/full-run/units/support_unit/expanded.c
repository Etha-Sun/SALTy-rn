typedef signed char int8_t;
typedef unsigned char uint8_t;
typedef int int32_t;
typedef unsigned int uint32_t;
typedef unsigned long long size_t;
typedef unsigned long long uintptr_t;
typedef uint8_t vbool16_t;
struct xnn_f32_minmax_params {struct {float min,max;}scalar;};
typedef struct float32x2_t {
 float s0;
 float s1;
} float32x2_t;
typedef struct float32x4_t {
 float s0;
 float s1;
 float s2;
 float s3;
} float32x4_t;
typedef struct uint32x4_t {
 uint32_t s0;
 uint32_t s1;
 uint32_t s2;
 uint32_t s3;
} uint32x4_t;
typedef struct vfloat32m2_t {
 float s0;
 float s1;
 float s2;
 float s3;
 float s4;
 float s5;
 float s6;
 float s7;
} vfloat32m2_t;
/*@ Import Coq Require Import DwChw.Types */
/*@ Import Coq Require Import DwChw.ControlModel */
/*@ Extern Coq (dw_doz_model:Z -> Z -> Z) (unsigned_last_nbits:Z -> Z -> Z) */
uint32x4_t dw_mask_words(const int32_t *p)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z)
 Require store(p+0,int,a0) * store(p+1,int,a1) * store(p+2,int,a2) * store(p+3,int,a3)
 Ensure store(p+0,int,a0) * store(p+1,int,a1) * store(p+2,int,a2) * store(p+3,int,a3) * store(&(__return.s0),unsigned int,unsigned_last_nbits(a0,32)) * store(&(__return.s1),unsigned int,unsigned_last_nbits(a1,32)) * store(&(__return.s2),unsigned int,unsigned_last_nbits(a2,32)) * store(&(__return.s3),unsigned int,unsigned_last_nbits(a3,32)) */;
void dw_assert(int b)
/*@ Require b!=0 && emp Ensure emp */;
size_t dw_round_up_po2(size_t n,size_t q)
/*@ Require 0<=n && q==16 && n<=18446744073709551600 && emp
 Ensure __return==((n+15)/16)*16 && emp */;
size_t dw_doz(size_t n,size_t q)
/*@ Require 0<=n && n<=18446744073709551615 && q==3 && emp
 Ensure __return==dw_doz_model(n,q) && emp */;
uint32x4_t dw_mask_words(const int32_t *p)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z)
 Require store(p+0,int,a0) * store(p+1,int,a1) * store(p+2,int,a2) * store(p+3,int,a3)
 Ensure store(p+0,int,a0) * store(p+1,int,a1) * store(p+2,int,a2) * store(p+3,int,a3) * store(&(__return.s0),unsigned int,unsigned_last_nbits(a0,32)) * store(&(__return.s1),unsigned int,unsigned_last_nbits(a1,32)) * store(&(__return.s2),unsigned int,unsigned_last_nbits(a2,32)) * store(&(__return.s3),unsigned int,unsigned_last_nbits(a3,32)) */
{
 uint32x4_t r;
 r.s0=(uint32_t)p[0];
 r.s1=(uint32_t)p[1];
 r.s2=(uint32_t)p[2];
 r.s3=(uint32_t)p[3];
 return r;
}
void dw_assert(int b)
/*@ Require b!=0 && emp Ensure emp */
{ (void)b; }
size_t dw_round_up_po2(size_t n,size_t q)
/*@ Require 0<=n && q==16 && n<=18446744073709551600 && emp
 Ensure __return==((n+15)/16)*16 && emp */
{ size_t sum=n+(q-1); return (sum/q)*q; }
size_t dw_doz(size_t n,size_t q)
/*@ Require 0<=n && n<=18446744073709551615 && q==3 && emp
 Ensure __return==dw_doz_model(n,q) && emp */
{ return n>q?n-q:0; }
