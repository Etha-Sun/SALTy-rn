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
/*@ Import Coq Require Import Qs8Cvt.MemoryModel */
/*@ Extern Coq (CharArray::full:Z -> Z -> list Z -> Assertion)
 (CharArray::missing_i:Z -> Z -> Z -> Z -> list Z -> Assertion)
 (CharArray::seg:Z -> Z -> Z -> list Z -> Assertion)
 (CharArray::undef_full:Z -> Z -> Assertion)
 (CharArray::undef_seg:Z -> Z -> Z -> Assertion)
 (CharArray::undef_missing_i:Z -> Z -> Z -> Z -> Assertion)
 (Znth:{A} -> Z -> list A -> A -> A)
 (cvt_read_lane:Z -> Z -> Z -> list Z -> Z) */
/*@ include strategies "char_arrays.strategies" */
int8_t qcp_cvt_read_lane(const int8_t *p,size_t i,size_t vl)
/*@ With (base:Z) (count:Z) (idx:Z) (L:list Z)
 Require 0<=i && i<32 && 0<=vl && vl<=32 && 0<=idx && idx+vl<=count && p==base+idx && CharArray::full(base,count,L)
 Ensure __return==cvt_read_lane(i,vl,idx,L) && CharArray::full(base,count,L) */;
int8x8_t vld1_s8(const int8_t *p)
/*@ With (base:Z) (count:Z) (idx:Z) (L:list Z)
 Require 0<=idx && idx+8<=count && p==base+idx && CharArray::full(base,count,L)
 Ensure CharArray::full(base,count,L) * store(&(__return.s0),char,L[idx+0]) * store(&(__return.s1),char,L[idx+1]) * store(&(__return.s2),char,L[idx+2]) * store(&(__return.s3),char,L[idx+3]) * store(&(__return.s4),char,L[idx+4]) * store(&(__return.s5),char,L[idx+5]) * store(&(__return.s6),char,L[idx+6]) * store(&(__return.s7),char,L[idx+7]) */;
vint8m2_t __riscv_vle8_v_i8m2(const int8_t *p,size_t vl)
/*@ With (base:Z)(count:Z)(idx:Z)(L:list Z) Require 0<=vl && vl<=32 && 0<=idx && idx+vl<=count && p==base+idx && CharArray::full(base,count,L) Ensure CharArray::full(base,count,L) * store(&(__return.s0),char,cvt_read_lane(0,vl,idx,L)) * store(&(__return.s1),char,cvt_read_lane(1,vl,idx,L)) * store(&(__return.s2),char,cvt_read_lane(2,vl,idx,L)) * store(&(__return.s3),char,cvt_read_lane(3,vl,idx,L)) * store(&(__return.s4),char,cvt_read_lane(4,vl,idx,L)) * store(&(__return.s5),char,cvt_read_lane(5,vl,idx,L)) * store(&(__return.s6),char,cvt_read_lane(6,vl,idx,L)) * store(&(__return.s7),char,cvt_read_lane(7,vl,idx,L)) * store(&(__return.s8),char,cvt_read_lane(8,vl,idx,L)) * store(&(__return.s9),char,cvt_read_lane(9,vl,idx,L)) * store(&(__return.s10),char,cvt_read_lane(10,vl,idx,L)) * store(&(__return.s11),char,cvt_read_lane(11,vl,idx,L)) * store(&(__return.s12),char,cvt_read_lane(12,vl,idx,L)) * store(&(__return.s13),char,cvt_read_lane(13,vl,idx,L)) * store(&(__return.s14),char,cvt_read_lane(14,vl,idx,L)) * store(&(__return.s15),char,cvt_read_lane(15,vl,idx,L)) * store(&(__return.s16),char,cvt_read_lane(16,vl,idx,L)) * store(&(__return.s17),char,cvt_read_lane(17,vl,idx,L)) * store(&(__return.s18),char,cvt_read_lane(18,vl,idx,L)) * store(&(__return.s19),char,cvt_read_lane(19,vl,idx,L)) * store(&(__return.s20),char,cvt_read_lane(20,vl,idx,L)) * store(&(__return.s21),char,cvt_read_lane(21,vl,idx,L)) * store(&(__return.s22),char,cvt_read_lane(22,vl,idx,L)) * store(&(__return.s23),char,cvt_read_lane(23,vl,idx,L)) * store(&(__return.s24),char,cvt_read_lane(24,vl,idx,L)) * store(&(__return.s25),char,cvt_read_lane(25,vl,idx,L)) * store(&(__return.s26),char,cvt_read_lane(26,vl,idx,L)) * store(&(__return.s27),char,cvt_read_lane(27,vl,idx,L)) * store(&(__return.s28),char,cvt_read_lane(28,vl,idx,L)) * store(&(__return.s29),char,cvt_read_lane(29,vl,idx,L)) * store(&(__return.s30),char,cvt_read_lane(30,vl,idx,L)) * store(&(__return.s31),char,cvt_read_lane(31,vl,idx,L)) */
;
vint8m2_t __riscv_vle8_v_i8m2(const int8_t *p,size_t vl)
/*@ With (base:Z)(count:Z)(idx:Z)(L:list Z) Require 0<=vl && vl<=32 && 0<=idx && idx+vl<=count && p==base+idx && CharArray::full(base,count,L) Ensure CharArray::full(base,count,L) * store(&(__return.s0),char,cvt_read_lane(0,vl,idx,L)) * store(&(__return.s1),char,cvt_read_lane(1,vl,idx,L)) * store(&(__return.s2),char,cvt_read_lane(2,vl,idx,L)) * store(&(__return.s3),char,cvt_read_lane(3,vl,idx,L)) * store(&(__return.s4),char,cvt_read_lane(4,vl,idx,L)) * store(&(__return.s5),char,cvt_read_lane(5,vl,idx,L)) * store(&(__return.s6),char,cvt_read_lane(6,vl,idx,L)) * store(&(__return.s7),char,cvt_read_lane(7,vl,idx,L)) * store(&(__return.s8),char,cvt_read_lane(8,vl,idx,L)) * store(&(__return.s9),char,cvt_read_lane(9,vl,idx,L)) * store(&(__return.s10),char,cvt_read_lane(10,vl,idx,L)) * store(&(__return.s11),char,cvt_read_lane(11,vl,idx,L)) * store(&(__return.s12),char,cvt_read_lane(12,vl,idx,L)) * store(&(__return.s13),char,cvt_read_lane(13,vl,idx,L)) * store(&(__return.s14),char,cvt_read_lane(14,vl,idx,L)) * store(&(__return.s15),char,cvt_read_lane(15,vl,idx,L)) * store(&(__return.s16),char,cvt_read_lane(16,vl,idx,L)) * store(&(__return.s17),char,cvt_read_lane(17,vl,idx,L)) * store(&(__return.s18),char,cvt_read_lane(18,vl,idx,L)) * store(&(__return.s19),char,cvt_read_lane(19,vl,idx,L)) * store(&(__return.s20),char,cvt_read_lane(20,vl,idx,L)) * store(&(__return.s21),char,cvt_read_lane(21,vl,idx,L)) * store(&(__return.s22),char,cvt_read_lane(22,vl,idx,L)) * store(&(__return.s23),char,cvt_read_lane(23,vl,idx,L)) * store(&(__return.s24),char,cvt_read_lane(24,vl,idx,L)) * store(&(__return.s25),char,cvt_read_lane(25,vl,idx,L)) * store(&(__return.s26),char,cvt_read_lane(26,vl,idx,L)) * store(&(__return.s27),char,cvt_read_lane(27,vl,idx,L)) * store(&(__return.s28),char,cvt_read_lane(28,vl,idx,L)) * store(&(__return.s29),char,cvt_read_lane(29,vl,idx,L)) * store(&(__return.s30),char,cvt_read_lane(30,vl,idx,L)) * store(&(__return.s31),char,cvt_read_lane(31,vl,idx,L)) */
{ vint8m2_t r;
 r.s0=qcp_cvt_read_lane(p,0,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s1=qcp_cvt_read_lane(p,1,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s2=qcp_cvt_read_lane(p,2,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s3=qcp_cvt_read_lane(p,3,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s4=qcp_cvt_read_lane(p,4,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s5=qcp_cvt_read_lane(p,5,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s6=qcp_cvt_read_lane(p,6,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s7=qcp_cvt_read_lane(p,7,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s8=qcp_cvt_read_lane(p,8,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s9=qcp_cvt_read_lane(p,9,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s10=qcp_cvt_read_lane(p,10,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s11=qcp_cvt_read_lane(p,11,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s12=qcp_cvt_read_lane(p,12,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s13=qcp_cvt_read_lane(p,13,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s14=qcp_cvt_read_lane(p,14,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s15=qcp_cvt_read_lane(p,15,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s16=qcp_cvt_read_lane(p,16,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s17=qcp_cvt_read_lane(p,17,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s18=qcp_cvt_read_lane(p,18,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s19=qcp_cvt_read_lane(p,19,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s20=qcp_cvt_read_lane(p,20,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s21=qcp_cvt_read_lane(p,21,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s22=qcp_cvt_read_lane(p,22,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s23=qcp_cvt_read_lane(p,23,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s24=qcp_cvt_read_lane(p,24,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s25=qcp_cvt_read_lane(p,25,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s26=qcp_cvt_read_lane(p,26,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s27=qcp_cvt_read_lane(p,27,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s28=qcp_cvt_read_lane(p,28,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s29=qcp_cvt_read_lane(p,29,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s30=qcp_cvt_read_lane(p,30,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s31=qcp_cvt_read_lane(p,31,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 return r;
}
