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
void qcp_vst1q_f32(float *p, const float32x4_t *a)
/*@ With (x0:fp32) (x1:fp32) (x2:fp32) (x3:fp32)
 Require store(&(a->s0),float,x0) * store(&(a->s1),float,x1) * store(&(a->s2),float,x2) * store(&(a->s3),float,x3) * undef_data_at(pointer_offset(p,0,float),float) * undef_data_at(pointer_offset(p,1,float),float) * undef_data_at(pointer_offset(p,2,float),float) * undef_data_at(pointer_offset(p,3,float),float)
 Ensure store(&(a->s0),float,x0) * store(&(a->s1),float,x1) * store(&(a->s2),float,x2) * store(&(a->s3),float,x3) * store(pointer_offset(p,0,float),float,x0) * store(pointer_offset(p,1,float),float,x1) * store(pointer_offset(p,2,float),float,x2) * store(pointer_offset(p,3,float),float,x3) */
{
 p[0] = a->s0;
 p[1] = a->s1;
 p[2] = a->s2;
 p[3] = a->s3;
}
void qcp_vst1_f32(float *p, const float32x2_t *a)
/*@ With (x0:fp32) (x1:fp32)
 Require store(&(a->s0),float,x0) * store(&(a->s1),float,x1) * undef_data_at(pointer_offset(p,0,float),float) * undef_data_at(pointer_offset(p,1,float),float)
 Ensure store(&(a->s0),float,x0) * store(&(a->s1),float,x1) * store(pointer_offset(p,0,float),float,x0) * store(pointer_offset(p,1,float),float,x1) */
{
 p[0] = a->s0;
 p[1] = a->s1;
}
void qcp_vst1_lane_f32(float *p, const float32x2_t *a, int lane)
/*@ With (x0:fp32) (x1:fp32)
 Require lane == 0 && store(&(a->s0),float,x0) * store(&(a->s1),float,x1) * undef_data_at(p,float)
 Ensure store(&(a->s0),float,x0) * store(&(a->s1),float,x1) * store(p,float,x0) */
{
 if (lane == 0) *p = a->s0;
 if (lane == 1) *p = a->s1;
}
void qcp_assert(int condition)
/*@ Require condition != 0 && emp Ensure emp */
{
}
