typedef unsigned char uint8_t;
typedef signed short int16_t;
typedef unsigned short uint16_t;
typedef signed int int32_t;
typedef unsigned int uint32_t;
/*@ Import Coq Require Import Qu8Cvt.Model */
/*@ Extern Coq (cvt_s16 : Z -> Z) (cvt_seed : Z -> Z)
 (cvt_addw : Z -> Z -> Z) (cvt_sub16 : Z -> Z -> Z)
 (cvt_same : fp32 -> fp32 -> Prop) */
/* Fixed VLEN128: e8m2/e16m4/e32m8 each VLMAX32. Scalar-field C-shim, no physical vector ABI claim. */
/*@ Import Coq Require Import Qu8Cvt.Types */
typedef unsigned long long size_t;
struct qcp_qu8_cvt_scalar_params {int32_t zero_point;float scale;};
struct xnn_qu8_f32_cvt_params {struct qcp_qu8_cvt_scalar_params scalar;};
typedef struct uint8x8_t {uint8_t s0; uint8_t s1; uint8_t s2; uint8_t s3; uint8_t s4; uint8_t s5; uint8_t s6; uint8_t s7;} uint8x8_t;
typedef struct int16x8_t {int16_t s0; int16_t s1; int16_t s2; int16_t s3; int16_t s4; int16_t s5; int16_t s6; int16_t s7;} int16x8_t;
typedef struct int16x4_t {int16_t s0; int16_t s1; int16_t s2; int16_t s3;} int16x4_t;
typedef struct int32x4_t {int32_t s0; int32_t s1; int32_t s2; int32_t s3;} int32x4_t;
typedef struct float32x4_t {float s0; float s1; float s2; float s3;} float32x4_t;
typedef struct float32x2_t {float s0; float s1;} float32x2_t;
typedef struct vuint8m2_t {uint8_t s0; uint8_t s1; uint8_t s2; uint8_t s3; uint8_t s4; uint8_t s5; uint8_t s6; uint8_t s7; uint8_t s8; uint8_t s9; uint8_t s10; uint8_t s11; uint8_t s12; uint8_t s13; uint8_t s14; uint8_t s15; uint8_t s16; uint8_t s17; uint8_t s18; uint8_t s19; uint8_t s20; uint8_t s21; uint8_t s22; uint8_t s23; uint8_t s24; uint8_t s25; uint8_t s26; uint8_t s27; uint8_t s28; uint8_t s29; uint8_t s30; uint8_t s31;} vuint8m2_t;
typedef struct vint16m4_t {int16_t s0; int16_t s1; int16_t s2; int16_t s3; int16_t s4; int16_t s5; int16_t s6; int16_t s7; int16_t s8; int16_t s9; int16_t s10; int16_t s11; int16_t s12; int16_t s13; int16_t s14; int16_t s15; int16_t s16; int16_t s17; int16_t s18; int16_t s19; int16_t s20; int16_t s21; int16_t s22; int16_t s23; int16_t s24; int16_t s25; int16_t s26; int16_t s27; int16_t s28; int16_t s29; int16_t s30; int16_t s31;} vint16m4_t;
typedef struct vint32m8_t {int32_t s0; int32_t s1; int32_t s2; int32_t s3; int32_t s4; int32_t s5; int32_t s6; int32_t s7; int32_t s8; int32_t s9; int32_t s10; int32_t s11; int32_t s12; int32_t s13; int32_t s14; int32_t s15; int32_t s16; int32_t s17; int32_t s18; int32_t s19; int32_t s20; int32_t s21; int32_t s22; int32_t s23; int32_t s24; int32_t s25; int32_t s26; int32_t s27; int32_t s28; int32_t s29; int32_t s30; int32_t s31;} vint32m8_t;
typedef struct vfloat32m8_t {float s0; float s1; float s2; float s3; float s4; float s5; float s6; float s7; float s8; float s9; float s10; float s11; float s12; float s13; float s14; float s15; float s16; float s17; float s18; float s19; float s20; float s21; float s22; float s23; float s24; float s25; float s26; float s27; float s28; float s29; float s30; float s31;} vfloat32m8_t;
typedef struct uint16x8_t {uint16_t s0; uint16_t s1; uint16_t s2; uint16_t s3; uint16_t s4; uint16_t s5; uint16_t s6; uint16_t s7;} uint16x8_t;
typedef struct vuint16m4_t {uint16_t s0; uint16_t s1; uint16_t s2; uint16_t s3; uint16_t s4; uint16_t s5; uint16_t s6; uint16_t s7; uint16_t s8; uint16_t s9; uint16_t s10; uint16_t s11; uint16_t s12; uint16_t s13; uint16_t s14; uint16_t s15; uint16_t s16; uint16_t s17; uint16_t s18; uint16_t s19; uint16_t s20; uint16_t s21; uint16_t s22; uint16_t s23; uint16_t s24; uint16_t s25; uint16_t s26; uint16_t s27; uint16_t s28; uint16_t s29; uint16_t s30; uint16_t s31;} vuint16m4_t;
int16_t qcp_cvt_narrow16(int32_t x)
/*@ Require -2147483648<=x && x<=2147483647 && emp
 Ensure __return==cvt_s16(x) && -32768<=__return && __return<=32767 && emp */;
int16_t qcp_cvt_seed(int32_t z)
/*@ Require -2147483648<=z && z<=2147483647 && emp
 Ensure __return==cvt_seed(z) && -32768<=__return && __return<=32767 && emp */;
int16_t qcp_cvt_addw(int16_t a,uint8_t b)
/*@ Require -32768<=a && a<=32767 && 0<=b && b<=255 && emp
 Ensure __return==cvt_addw(a,b) && -32768<=__return && __return<=32767 && emp */;
int16_t qcp_cvt_sub16(int16_t a,int16_t b)
/*@ Require -32768<=a && a<=32767 && -32768<=b && b<=32767 && emp
 Ensure __return==cvt_sub16(a,b) && -32768<=__return && __return<=32767 && emp */;
int16_t qcp_cvt_sext8(uint8_t x)
/*@ Require 0<=x && x<=255 && emp Ensure __return==x && -32768<=__return && __return<=32767 && emp */;
int32_t qcp_cvt_sext16(int16_t x)
/*@ Require -32768<=x && x<=32767 && emp Ensure __return==x && emp */;
float qcp_cvt_to_f32(int32_t x)
/*@ Require -2147483648<=x && x<=2147483647 && emp
 Ensure cvt_same(__return,Z_to_fp32(x)) && emp */;
float qcp_cvt_mul(float a,float b)
/*@ Require emp Ensure cvt_same(__return,fp32_mul(a,b)) && emp */;
/*@ Import Coq Require Import Qu8Cvt.UnsignedModel */
/*@ Extern Coq (cvt_u16:Z -> Z)(cvt_add_u16:Z -> Z -> Z)(cvt_seed_u16:Z -> Z) */
uint16_t qcp_cvt_u16(int32_t x)
/*@ Require -2147483648<=x && x<=2147483647 && emp Ensure __return==cvt_u16(x) && 0<=__return && __return<=65535 && emp */;
uint16_t qcp_cvt_add_u16(uint16_t a,uint16_t b)
/*@ Require 0<=a && a<=65535 && 0<=b && b<=65535 && emp Ensure __return==cvt_add_u16(a,b) && 0<=__return && __return<=65535 && emp */;
int16_t qcp_cvt_as_s16(uint16_t x)
/*@ Require 0<=x && x<=65535 && emp Ensure __return==cvt_s16(x) && -32768<=__return && __return<=32767 && emp */;
uint16_t qcp_cvt_as_u16(int16_t x)
/*@ Require -32768<=x && x<=32767 && emp Ensure __return==cvt_u16(x) && 0<=__return && __return<=65535 && emp */;
uint16_t qcp_cvt_seed_u16(int32_t z)
/*@ Require -2147483648<=z && z<=2147483647 && emp Ensure __return==cvt_seed_u16(z) && 0<=__return && __return<=65535 && emp */;
uint16_t qcp_cvt_zext_u8(uint8_t x)
/*@ Require 0<=x && x<=255 && emp Ensure __return==x && 0<=__return && __return<=65535 && emp */;
uint16x8_t vreinterpretq_u16_s16(int16x8_t a)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z) (a4:Z) (a5:Z) (a6:Z) (a7:Z) Require -32768<=a0 && a0<=32767 && -32768<=a1 && a1<=32767 && -32768<=a2 && a2<=32767 && -32768<=a3 && a3<=32767 && -32768<=a4 && a4<=32767 && -32768<=a5 && a5<=32767 && -32768<=a6 && a6<=32767 && -32768<=a7 && a7<=32767 && store(&(a.s0),short,a0) * store(&(a.s1),short,a1) * store(&(a.s2),short,a2) * store(&(a.s3),short,a3) * store(&(a.s4),short,a4) * store(&(a.s5),short,a5) * store(&(a.s6),short,a6) * store(&(a.s7),short,a7) Ensure store(&(__return.s0),unsigned short,cvt_u16(a0)) * store(&(__return.s1),unsigned short,cvt_u16(a1)) * store(&(__return.s2),unsigned short,cvt_u16(a2)) * store(&(__return.s3),unsigned short,cvt_u16(a3)) * store(&(__return.s4),unsigned short,cvt_u16(a4)) * store(&(__return.s5),unsigned short,cvt_u16(a5)) * store(&(__return.s6),unsigned short,cvt_u16(a6)) * store(&(__return.s7),unsigned short,cvt_u16(a7)) */;
int16x8_t vreinterpretq_s16_u16(uint16x8_t a)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z) (a4:Z) (a5:Z) (a6:Z) (a7:Z) Require 0<=a0 && a0<=65535 && 0<=a1 && a1<=65535 && 0<=a2 && a2<=65535 && 0<=a3 && a3<=65535 && 0<=a4 && a4<=65535 && 0<=a5 && a5<=65535 && 0<=a6 && a6<=65535 && 0<=a7 && a7<=65535 && store(&(a.s0),unsigned short,a0) * store(&(a.s1),unsigned short,a1) * store(&(a.s2),unsigned short,a2) * store(&(a.s3),unsigned short,a3) * store(&(a.s4),unsigned short,a4) * store(&(a.s5),unsigned short,a5) * store(&(a.s6),unsigned short,a6) * store(&(a.s7),unsigned short,a7) Ensure store(&(__return.s0),short,cvt_s16(a0)) * store(&(__return.s1),short,cvt_s16(a1)) * store(&(__return.s2),short,cvt_s16(a2)) * store(&(__return.s3),short,cvt_s16(a3)) * store(&(__return.s4),short,cvt_s16(a4)) * store(&(__return.s5),short,cvt_s16(a5)) * store(&(__return.s6),short,cvt_s16(a6)) * store(&(__return.s7),short,cvt_s16(a7)) */;
uint16x8_t vaddw_u8(uint16x8_t a,uint8x8_t b)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z) (a4:Z) (a5:Z) (a6:Z) (a7:Z) (b0:Z) (b1:Z) (b2:Z) (b3:Z) (b4:Z) (b5:Z) (b6:Z) (b7:Z) Require 0<=a0 && a0<=65535 && 0<=a1 && a1<=65535 && 0<=a2 && a2<=65535 && 0<=a3 && a3<=65535 && 0<=a4 && a4<=65535 && 0<=a5 && a5<=65535 && 0<=a6 && a6<=65535 && 0<=a7 && a7<=65535 && 0<=b0 && b0<=255 && 0<=b1 && b1<=255 && 0<=b2 && b2<=255 && 0<=b3 && b3<=255 && 0<=b4 && b4<=255 && 0<=b5 && b5<=255 && 0<=b6 && b6<=255 && 0<=b7 && b7<=255 && store(&(a.s0),unsigned short,a0) * store(&(a.s1),unsigned short,a1) * store(&(a.s2),unsigned short,a2) * store(&(a.s3),unsigned short,a3) * store(&(a.s4),unsigned short,a4) * store(&(a.s5),unsigned short,a5) * store(&(a.s6),unsigned short,a6) * store(&(a.s7),unsigned short,a7) * store(&(b.s0),unsigned char,b0) * store(&(b.s1),unsigned char,b1) * store(&(b.s2),unsigned char,b2) * store(&(b.s3),unsigned char,b3) * store(&(b.s4),unsigned char,b4) * store(&(b.s5),unsigned char,b5) * store(&(b.s6),unsigned char,b6) * store(&(b.s7),unsigned char,b7) Ensure store(&(__return.s0),unsigned short,cvt_add_u16(a0,b0)) * store(&(__return.s1),unsigned short,cvt_add_u16(a1,b1)) * store(&(__return.s2),unsigned short,cvt_add_u16(a2,b2)) * store(&(__return.s3),unsigned short,cvt_add_u16(a3,b3)) * store(&(__return.s4),unsigned short,cvt_add_u16(a4,b4)) * store(&(__return.s5),unsigned short,cvt_add_u16(a5,b5)) * store(&(__return.s6),unsigned short,cvt_add_u16(a6,b6)) * store(&(__return.s7),unsigned short,cvt_add_u16(a7,b7)) */;
int16x8_t qcp_cvt_widen_u8(int16x8_t a,uint8x8_t b)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z) (a4:Z) (a5:Z) (a6:Z) (a7:Z) (b0:Z) (b1:Z) (b2:Z) (b3:Z) (b4:Z) (b5:Z) (b6:Z) (b7:Z) Require -32768<=a0 && a0<=32767 && -32768<=a1 && a1<=32767 && -32768<=a2 && a2<=32767 && -32768<=a3 && a3<=32767 && -32768<=a4 && a4<=32767 && -32768<=a5 && a5<=32767 && -32768<=a6 && a6<=32767 && -32768<=a7 && a7<=32767 && 0<=b0 && b0<=255 && 0<=b1 && b1<=255 && 0<=b2 && b2<=255 && 0<=b3 && b3<=255 && 0<=b4 && b4<=255 && 0<=b5 && b5<=255 && 0<=b6 && b6<=255 && 0<=b7 && b7<=255 && store(&(a.s0),short,a0) * store(&(a.s1),short,a1) * store(&(a.s2),short,a2) * store(&(a.s3),short,a3) * store(&(a.s4),short,a4) * store(&(a.s5),short,a5) * store(&(a.s6),short,a6) * store(&(a.s7),short,a7) * store(&(b.s0),unsigned char,b0) * store(&(b.s1),unsigned char,b1) * store(&(b.s2),unsigned char,b2) * store(&(b.s3),unsigned char,b3) * store(&(b.s4),unsigned char,b4) * store(&(b.s5),unsigned char,b5) * store(&(b.s6),unsigned char,b6) * store(&(b.s7),unsigned char,b7) Ensure store(&(__return.s0),short,cvt_addw(a0,b0)) * store(&(__return.s1),short,cvt_addw(a1,b1)) * store(&(__return.s2),short,cvt_addw(a2,b2)) * store(&(__return.s3),short,cvt_addw(a3,b3)) * store(&(__return.s4),short,cvt_addw(a4,b4)) * store(&(__return.s5),short,cvt_addw(a5,b5)) * store(&(__return.s6),short,cvt_addw(a6,b6)) * store(&(__return.s7),short,cvt_addw(a7,b7)) */;
int16x8_t vreinterpretq_s16_u16(uint16x8_t a)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z) (a4:Z) (a5:Z) (a6:Z) (a7:Z) Require 0<=a0 && a0<=65535 && 0<=a1 && a1<=65535 && 0<=a2 && a2<=65535 && 0<=a3 && a3<=65535 && 0<=a4 && a4<=65535 && 0<=a5 && a5<=65535 && 0<=a6 && a6<=65535 && 0<=a7 && a7<=65535 && store(&(a.s0),unsigned short,a0) * store(&(a.s1),unsigned short,a1) * store(&(a.s2),unsigned short,a2) * store(&(a.s3),unsigned short,a3) * store(&(a.s4),unsigned short,a4) * store(&(a.s5),unsigned short,a5) * store(&(a.s6),unsigned short,a6) * store(&(a.s7),unsigned short,a7) Ensure store(&(__return.s0),short,cvt_s16(a0)) * store(&(__return.s1),short,cvt_s16(a1)) * store(&(__return.s2),short,cvt_s16(a2)) * store(&(__return.s3),short,cvt_s16(a3)) * store(&(__return.s4),short,cvt_s16(a4)) * store(&(__return.s5),short,cvt_s16(a5)) * store(&(__return.s6),short,cvt_s16(a6)) * store(&(__return.s7),short,cvt_s16(a7)) */
{ int16x8_t r;
 r.s0=qcp_cvt_as_s16(a.s0);
 r.s1=qcp_cvt_as_s16(a.s1);
 r.s2=qcp_cvt_as_s16(a.s2);
 r.s3=qcp_cvt_as_s16(a.s3);
 r.s4=qcp_cvt_as_s16(a.s4);
 r.s5=qcp_cvt_as_s16(a.s5);
 r.s6=qcp_cvt_as_s16(a.s6);
 r.s7=qcp_cvt_as_s16(a.s7);
 return r;
}
