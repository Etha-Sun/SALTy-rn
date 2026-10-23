typedef signed char int8_t;
typedef signed short int16_t;
typedef signed int int32_t;
typedef unsigned int uint32_t;
/*@ Import Coq Require Import Qs8Cvt.Model */
/*@ Extern Coq (cvt_s16 : Z -> Z) (cvt_seed : Z -> Z)
 (cvt_addw : Z -> Z -> Z) (cvt_sub16 : Z -> Z -> Z)
 (cvt_same : fp32 -> fp32 -> Prop) */
/* Fixed VLEN128: e8m2/e16m4/e32m8 each VLMAX32. Scalar-field C-shim, no physical vector ABI claim. */
/*@ Import Coq Require Import Qs8Cvt.Types */
typedef unsigned long long size_t;
struct qcp_qs8_cvt_scalar_params {int32_t zero_point;float scale;};
struct xnn_qs8_f32_cvt_params {struct qcp_qs8_cvt_scalar_params scalar;};
typedef struct int8x8_t {int8_t s0; int8_t s1; int8_t s2; int8_t s3; int8_t s4; int8_t s5; int8_t s6; int8_t s7;} int8x8_t;
typedef struct int16x8_t {int16_t s0; int16_t s1; int16_t s2; int16_t s3; int16_t s4; int16_t s5; int16_t s6; int16_t s7;} int16x8_t;
typedef struct int16x4_t {int16_t s0; int16_t s1; int16_t s2; int16_t s3;} int16x4_t;
typedef struct int32x4_t {int32_t s0; int32_t s1; int32_t s2; int32_t s3;} int32x4_t;
typedef struct float32x4_t {float s0; float s1; float s2; float s3;} float32x4_t;
typedef struct float32x2_t {float s0; float s1;} float32x2_t;
typedef struct vint8m2_t {int8_t s0; int8_t s1; int8_t s2; int8_t s3; int8_t s4; int8_t s5; int8_t s6; int8_t s7; int8_t s8; int8_t s9; int8_t s10; int8_t s11; int8_t s12; int8_t s13; int8_t s14; int8_t s15; int8_t s16; int8_t s17; int8_t s18; int8_t s19; int8_t s20; int8_t s21; int8_t s22; int8_t s23; int8_t s24; int8_t s25; int8_t s26; int8_t s27; int8_t s28; int8_t s29; int8_t s30; int8_t s31;} vint8m2_t;
typedef struct vint16m4_t {int16_t s0; int16_t s1; int16_t s2; int16_t s3; int16_t s4; int16_t s5; int16_t s6; int16_t s7; int16_t s8; int16_t s9; int16_t s10; int16_t s11; int16_t s12; int16_t s13; int16_t s14; int16_t s15; int16_t s16; int16_t s17; int16_t s18; int16_t s19; int16_t s20; int16_t s21; int16_t s22; int16_t s23; int16_t s24; int16_t s25; int16_t s26; int16_t s27; int16_t s28; int16_t s29; int16_t s30; int16_t s31;} vint16m4_t;
typedef struct vint32m8_t {int32_t s0; int32_t s1; int32_t s2; int32_t s3; int32_t s4; int32_t s5; int32_t s6; int32_t s7; int32_t s8; int32_t s9; int32_t s10; int32_t s11; int32_t s12; int32_t s13; int32_t s14; int32_t s15; int32_t s16; int32_t s17; int32_t s18; int32_t s19; int32_t s20; int32_t s21; int32_t s22; int32_t s23; int32_t s24; int32_t s25; int32_t s26; int32_t s27; int32_t s28; int32_t s29; int32_t s30; int32_t s31;} vint32m8_t;
typedef struct vfloat32m8_t {float s0; float s1; float s2; float s3; float s4; float s5; float s6; float s7; float s8; float s9; float s10; float s11; float s12; float s13; float s14; float s15; float s16; float s17; float s18; float s19; float s20; float s21; float s22; float s23; float s24; float s25; float s26; float s27; float s28; float s29; float s30; float s31;} vfloat32m8_t;
float32x4_t vdupq_n_f32(float x)
/*@ Require emp Ensure store(&(__return.s0),float,x) * store(&(__return.s1),float,x) * store(&(__return.s2),float,x) * store(&(__return.s3),float,x) */
;
int16x8_t vaddw_s8(int16x8_t a,int8x8_t b)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z) (a4:Z) (a5:Z) (a6:Z) (a7:Z) (b0:Z) (b1:Z) (b2:Z) (b3:Z) (b4:Z) (b5:Z) (b6:Z) (b7:Z) Require -32768<=a0 && a0<=32767 && -32768<=a1 && a1<=32767 && -32768<=a2 && a2<=32767 && -32768<=a3 && a3<=32767 && -32768<=a4 && a4<=32767 && -32768<=a5 && a5<=32767 && -32768<=a6 && a6<=32767 && -32768<=a7 && a7<=32767 && -128<=b0 && b0<=127 && -128<=b1 && b1<=127 && -128<=b2 && b2<=127 && -128<=b3 && b3<=127 && -128<=b4 && b4<=127 && -128<=b5 && b5<=127 && -128<=b6 && b6<=127 && -128<=b7 && b7<=127 && store(&(a.s0),short,a0) * store(&(a.s1),short,a1) * store(&(a.s2),short,a2) * store(&(a.s3),short,a3) * store(&(a.s4),short,a4) * store(&(a.s5),short,a5) * store(&(a.s6),short,a6) * store(&(a.s7),short,a7) * store(&(b.s0),char,b0) * store(&(b.s1),char,b1) * store(&(b.s2),char,b2) * store(&(b.s3),char,b3) * store(&(b.s4),char,b4) * store(&(b.s5),char,b5) * store(&(b.s6),char,b6) * store(&(b.s7),char,b7) Ensure store(&(__return.s0),short,cvt_addw(a0,b0)) * store(&(__return.s1),short,cvt_addw(a1,b1)) * store(&(__return.s2),short,cvt_addw(a2,b2)) * store(&(__return.s3),short,cvt_addw(a3,b3)) * store(&(__return.s4),short,cvt_addw(a4,b4)) * store(&(__return.s5),short,cvt_addw(a5,b5)) * store(&(__return.s6),short,cvt_addw(a6,b6)) * store(&(__return.s7),short,cvt_addw(a7,b7)) */
;
int16x4_t vget_low_s16(int16x8_t a)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z) (a4:Z) (a5:Z) (a6:Z) (a7:Z) Require -32768<=a0 && a0<=32767 && -32768<=a1 && a1<=32767 && -32768<=a2 && a2<=32767 && -32768<=a3 && a3<=32767 && -32768<=a4 && a4<=32767 && -32768<=a5 && a5<=32767 && -32768<=a6 && a6<=32767 && -32768<=a7 && a7<=32767 && store(&(a.s0),short,a0) * store(&(a.s1),short,a1) * store(&(a.s2),short,a2) * store(&(a.s3),short,a3) * store(&(a.s4),short,a4) * store(&(a.s5),short,a5) * store(&(a.s6),short,a6) * store(&(a.s7),short,a7) Ensure store(&(__return.s0),short,a0) * store(&(__return.s1),short,a1) * store(&(__return.s2),short,a2) * store(&(__return.s3),short,a3) */
;
int16x4_t vget_high_s16(int16x8_t a)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z) (a4:Z) (a5:Z) (a6:Z) (a7:Z) Require -32768<=a0 && a0<=32767 && -32768<=a1 && a1<=32767 && -32768<=a2 && a2<=32767 && -32768<=a3 && a3<=32767 && -32768<=a4 && a4<=32767 && -32768<=a5 && a5<=32767 && -32768<=a6 && a6<=32767 && -32768<=a7 && a7<=32767 && store(&(a.s0),short,a0) * store(&(a.s1),short,a1) * store(&(a.s2),short,a2) * store(&(a.s3),short,a3) * store(&(a.s4),short,a4) * store(&(a.s5),short,a5) * store(&(a.s6),short,a6) * store(&(a.s7),short,a7) Ensure store(&(__return.s0),short,a4) * store(&(__return.s1),short,a5) * store(&(__return.s2),short,a6) * store(&(__return.s3),short,a7) */
;
int32x4_t vmovl_s16(int16x4_t a)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z) Require -32768<=a0 && a0<=32767 && -32768<=a1 && a1<=32767 && -32768<=a2 && a2<=32767 && -32768<=a3 && a3<=32767 && store(&(a.s0),short,a0) * store(&(a.s1),short,a1) * store(&(a.s2),short,a2) * store(&(a.s3),short,a3) Ensure store(&(__return.s0),int,a0) * store(&(__return.s1),int,a1) * store(&(__return.s2),int,a2) * store(&(__return.s3),int,a3) */
;
float32x4_t vcvtq_f32_s32(int32x4_t a)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z) Require -2147483648<=a0 && a0<=2147483647 && -2147483648<=a1 && a1<=2147483647 && -2147483648<=a2 && a2<=2147483647 && -2147483648<=a3 && a3<=2147483647 && store(&(a.s0),int,a0) * store(&(a.s1),int,a1) * store(&(a.s2),int,a2) * store(&(a.s3),int,a3) Ensure store(&(__return.s0),float,Z_to_fp32(a0)) * store(&(__return.s1),float,Z_to_fp32(a1)) * store(&(__return.s2),float,Z_to_fp32(a2)) * store(&(__return.s3),float,Z_to_fp32(a3)) */
;
float32x4_t vmulq_f32(float32x4_t a,float32x4_t b)
/*@ With (a0:fp32) (a1:fp32) (a2:fp32) (a3:fp32) (b0:fp32) (b1:fp32) (b2:fp32) (b3:fp32) Require store(&(a.s0),float,a0) * store(&(a.s1),float,a1) * store(&(a.s2),float,a2) * store(&(a.s3),float,a3) * store(&(b.s0),float,b0) * store(&(b.s1),float,b1) * store(&(b.s2),float,b2) * store(&(b.s3),float,b3) Ensure store(&(__return.s0),float,fp32_mul(a0,b0)) * store(&(__return.s1),float,fp32_mul(a1,b1)) * store(&(__return.s2),float,fp32_mul(a2,b2)) * store(&(__return.s3),float,fp32_mul(a3,b3)) */
;
float32x2_t vget_low_f32(float32x4_t a)
/*@ With (a0:fp32) (a1:fp32) (a2:fp32) (a3:fp32) Require store(&(a.s0),float,a0) * store(&(a.s1),float,a1) * store(&(a.s2),float,a2) * store(&(a.s3),float,a3) Ensure store(&(__return.s0),float,a0) * store(&(__return.s1),float,a1) */
;
float32x2_t vget_high_f32(float32x4_t a)
/*@ With (a0:fp32) (a1:fp32) (a2:fp32) (a3:fp32) Require store(&(a.s0),float,a0) * store(&(a.s1),float,a1) * store(&(a.s2),float,a2) * store(&(a.s3),float,a3) Ensure store(&(__return.s0),float,a2) * store(&(__return.s1),float,a3) */
;
int16_t qcp_cvt_narrow16(int32_t x)
/*@ Require -2147483648<=x && x<=2147483647 && emp
 Ensure __return==cvt_s16(x) && -32768<=__return && __return<=32767 && emp */;
int16_t qcp_cvt_seed(int32_t z)
/*@ Require -2147483648<=z && z<=2147483647 && emp
 Ensure __return==cvt_seed(z) && -32768<=__return && __return<=32767 && emp */;
int16_t qcp_cvt_addw(int16_t a,int8_t b)
/*@ Require -32768<=a && a<=32767 && -128<=b && b<=127 && emp
 Ensure __return==cvt_addw(a,b) && -32768<=__return && __return<=32767 && emp */;
int16_t qcp_cvt_sub16(int16_t a,int16_t b)
/*@ Require -32768<=a && a<=32767 && -32768<=b && b<=32767 && emp
 Ensure __return==cvt_sub16(a,b) && -32768<=__return && __return<=32767 && emp */;
int16_t qcp_cvt_sext8(int8_t x)
/*@ Require -128<=x && x<=127 && emp Ensure __return==x && -32768<=__return && __return<=32767 && emp */;
int32_t qcp_cvt_sext16(int16_t x)
/*@ Require -32768<=x && x<=32767 && emp Ensure __return==x && emp */;
float qcp_cvt_to_f32(int32_t x)
/*@ Require -2147483648<=x && x<=2147483647 && emp
 Ensure cvt_same(__return,Z_to_fp32(x)) && emp */;
float qcp_cvt_mul(float a,float b)
/*@ Require emp Ensure cvt_same(__return,fp32_mul(a,b)) && emp */;
float32x4_t vcvtq_f32_s32(int32x4_t a)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z) Require -2147483648<=a0 && a0<=2147483647 && -2147483648<=a1 && a1<=2147483647 && -2147483648<=a2 && a2<=2147483647 && -2147483648<=a3 && a3<=2147483647 && store(&(a.s0),int,a0) * store(&(a.s1),int,a1) * store(&(a.s2),int,a2) * store(&(a.s3),int,a3) Ensure store(&(__return.s0),float,Z_to_fp32(a0)) * store(&(__return.s1),float,Z_to_fp32(a1)) * store(&(__return.s2),float,Z_to_fp32(a2)) * store(&(__return.s3),float,Z_to_fp32(a3)) */
{ float32x4_t r;
 r.s0=qcp_cvt_to_f32(a.s0);
 r.s1=qcp_cvt_to_f32(a.s1);
 r.s2=qcp_cvt_to_f32(a.s2);
 r.s3=qcp_cvt_to_f32(a.s3);
 return r;
}
