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
/*@ Import Coq Require Import Qu8Cvt.MemoryModel */
/*@ Extern Coq (UCharArray::full:Z -> Z -> list Z -> Assertion)
 (UCharArray::missing_i:Z -> Z -> Z -> Z -> list Z -> Assertion)
 (UCharArray::seg:Z -> Z -> Z -> list Z -> Assertion)
 (UCharArray::undef_full:Z -> Z -> Assertion)
 (UCharArray::undef_seg:Z -> Z -> Z -> Assertion)
 (UCharArray::undef_missing_i:Z -> Z -> Z -> Z -> Assertion)
 (Znth:{A} -> Z -> list A -> A -> A)
 (cvt_read_lane:Z -> Z -> Z -> list Z -> Z) */
/*@ include strategies "char_arrays.strategies" */
uint8_t qcp_cvt_read_lane(const uint8_t *p,size_t i,size_t vl)
/*@ With (base:Z) (count:Z) (idx:Z) (L:list Z)
 Require 0<=i && i<32 && 0<=vl && vl<=32 && 0<=idx && idx+vl<=count && p==base+idx && UCharArray::full(base,count,L)
 Ensure __return==cvt_read_lane(i,vl,idx,L) && UCharArray::full(base,count,L) */
{
 if(i<vl) {
  /*@ Assert p==p@pre && i==i@pre && vl==vl@pre && 0<=i && i<32 && 0<=vl && vl<=32 && i<vl && 0<=idx && idx+vl<=count && p==base+idx && UCharArray::missing_i(base,idx+i,0,count,L) * store(pointer_offset(p,i,unsigned char),unsigned char,L[idx+i]) */
  uint8_t value=p[i];
  /*@ Assert p==p@pre && i==i@pre && vl==vl@pre && 0<=i && i<32 && 0<=vl && vl<=32 && i<vl && 0<=idx && idx+vl<=count && p==base+idx && UCharArray::full(base,count,L) * store(&value,unsigned char,L[idx+i]) */
  return value;
 }
 return 0;
}
uint8x8_t vld1_u8(const uint8_t *p)
/*@ With (base:Z) (count:Z) (idx:Z) (L:list Z)
 Require 0<=idx && idx+8<=count && p==base+idx && UCharArray::full(base,count,L)
 Ensure UCharArray::full(base,count,L) * store(&(__return.s0),unsigned char,L[idx+0]) * store(&(__return.s1),unsigned char,L[idx+1]) * store(&(__return.s2),unsigned char,L[idx+2]) * store(&(__return.s3),unsigned char,L[idx+3]) * store(&(__return.s4),unsigned char,L[idx+4]) * store(&(__return.s5),unsigned char,L[idx+5]) * store(&(__return.s6),unsigned char,L[idx+6]) * store(&(__return.s7),unsigned char,L[idx+7]) */
{
 uint8x8_t r;
 r.s0=qcp_cvt_read_lane(p,0,8) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s1=qcp_cvt_read_lane(p,1,8) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s2=qcp_cvt_read_lane(p,2,8) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s3=qcp_cvt_read_lane(p,3,8) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s4=qcp_cvt_read_lane(p,4,8) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s5=qcp_cvt_read_lane(p,5,8) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s6=qcp_cvt_read_lane(p,6,8) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s7=qcp_cvt_read_lane(p,7,8) /*@ where base=base,count=count,idx=idx,L=L */;
 return r;
}
