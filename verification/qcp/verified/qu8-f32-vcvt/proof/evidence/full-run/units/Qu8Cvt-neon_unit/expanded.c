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
 Ensure __return==cvt_read_lane(i,vl,idx,L) && UCharArray::full(base,count,L) */;
uint8x8_t vld1_u8(const uint8_t *p)
/*@ With (base:Z) (count:Z) (idx:Z) (L:list Z)
 Require 0<=idx && idx+8<=count && p==base+idx && UCharArray::full(base,count,L)
 Ensure UCharArray::full(base,count,L) * store(&(__return.s0),unsigned char,L[idx+0]) * store(&(__return.s1),unsigned char,L[idx+1]) * store(&(__return.s2),unsigned char,L[idx+2]) * store(&(__return.s3),unsigned char,L[idx+3]) * store(&(__return.s4),unsigned char,L[idx+4]) * store(&(__return.s5),unsigned char,L[idx+5]) * store(&(__return.s6),unsigned char,L[idx+6]) * store(&(__return.s7),unsigned char,L[idx+7]) */;
vuint8m2_t __riscv_vle8_v_u8m2(const uint8_t *p,size_t vl)
/*@ With (base:Z)(count:Z)(idx:Z)(L:list Z) Require 0<=vl && vl<=32 && 0<=idx && idx+vl<=count && p==base+idx && UCharArray::full(base,count,L) Ensure UCharArray::full(base,count,L) * store(&(__return.s0),unsigned char,cvt_read_lane(0,vl,idx,L)) * store(&(__return.s1),unsigned char,cvt_read_lane(1,vl,idx,L)) * store(&(__return.s2),unsigned char,cvt_read_lane(2,vl,idx,L)) * store(&(__return.s3),unsigned char,cvt_read_lane(3,vl,idx,L)) * store(&(__return.s4),unsigned char,cvt_read_lane(4,vl,idx,L)) * store(&(__return.s5),unsigned char,cvt_read_lane(5,vl,idx,L)) * store(&(__return.s6),unsigned char,cvt_read_lane(6,vl,idx,L)) * store(&(__return.s7),unsigned char,cvt_read_lane(7,vl,idx,L)) * store(&(__return.s8),unsigned char,cvt_read_lane(8,vl,idx,L)) * store(&(__return.s9),unsigned char,cvt_read_lane(9,vl,idx,L)) * store(&(__return.s10),unsigned char,cvt_read_lane(10,vl,idx,L)) * store(&(__return.s11),unsigned char,cvt_read_lane(11,vl,idx,L)) * store(&(__return.s12),unsigned char,cvt_read_lane(12,vl,idx,L)) * store(&(__return.s13),unsigned char,cvt_read_lane(13,vl,idx,L)) * store(&(__return.s14),unsigned char,cvt_read_lane(14,vl,idx,L)) * store(&(__return.s15),unsigned char,cvt_read_lane(15,vl,idx,L)) * store(&(__return.s16),unsigned char,cvt_read_lane(16,vl,idx,L)) * store(&(__return.s17),unsigned char,cvt_read_lane(17,vl,idx,L)) * store(&(__return.s18),unsigned char,cvt_read_lane(18,vl,idx,L)) * store(&(__return.s19),unsigned char,cvt_read_lane(19,vl,idx,L)) * store(&(__return.s20),unsigned char,cvt_read_lane(20,vl,idx,L)) * store(&(__return.s21),unsigned char,cvt_read_lane(21,vl,idx,L)) * store(&(__return.s22),unsigned char,cvt_read_lane(22,vl,idx,L)) * store(&(__return.s23),unsigned char,cvt_read_lane(23,vl,idx,L)) * store(&(__return.s24),unsigned char,cvt_read_lane(24,vl,idx,L)) * store(&(__return.s25),unsigned char,cvt_read_lane(25,vl,idx,L)) * store(&(__return.s26),unsigned char,cvt_read_lane(26,vl,idx,L)) * store(&(__return.s27),unsigned char,cvt_read_lane(27,vl,idx,L)) * store(&(__return.s28),unsigned char,cvt_read_lane(28,vl,idx,L)) * store(&(__return.s29),unsigned char,cvt_read_lane(29,vl,idx,L)) * store(&(__return.s30),unsigned char,cvt_read_lane(30,vl,idx,L)) * store(&(__return.s31),unsigned char,cvt_read_lane(31,vl,idx,L)) */
;
void qcp_vst1q_f32(float *p, const float32x4_t *a)
/*@ With (x0:fp32) (x1:fp32) (x2:fp32) (x3:fp32)
 Require store(&(a->s0),float,x0) * store(&(a->s1),float,x1) * store(&(a->s2),float,x2) * store(&(a->s3),float,x3) * undef_data_at(pointer_offset(p,0,float),float) * undef_data_at(pointer_offset(p,1,float),float) * undef_data_at(pointer_offset(p,2,float),float) * undef_data_at(pointer_offset(p,3,float),float)
 Ensure store(&(a->s0),float,x0) * store(&(a->s1),float,x1) * store(&(a->s2),float,x2) * store(&(a->s3),float,x3) * store(pointer_offset(p,0,float),float,x0) * store(pointer_offset(p,1,float),float,x1) * store(pointer_offset(p,2,float),float,x2) * store(pointer_offset(p,3,float),float,x3) */;
void qcp_vst1_f32(float *p, const float32x2_t *a)
/*@ With (x0:fp32) (x1:fp32)
 Require store(&(a->s0),float,x0) * store(&(a->s1),float,x1) * undef_data_at(pointer_offset(p,0,float),float) * undef_data_at(pointer_offset(p,1,float),float)
 Ensure store(&(a->s0),float,x0) * store(&(a->s1),float,x1) * store(pointer_offset(p,0,float),float,x0) * store(pointer_offset(p,1,float),float,x1) */;
void qcp_vst1_lane_f32(float *p, const float32x2_t *a, int lane)
/*@ With (x0:fp32) (x1:fp32)
 Require lane == 0 && store(&(a->s0),float,x0) * store(&(a->s1),float,x1) * undef_data_at(p,float)
 Ensure store(&(a->s0),float,x0) * store(&(a->s1),float,x1) * store(p,float,x0) */;
void qcp_assert(int condition)
/*@ Require condition != 0 && emp Ensure emp */;
int16x8_t vdupq_n_s16(int16_t x)
/*@ Require -32768<=x && x<=32767 && emp Ensure store(&(__return.s0),short,x) * store(&(__return.s1),short,x) * store(&(__return.s2),short,x) * store(&(__return.s3),short,x) * store(&(__return.s4),short,x) * store(&(__return.s5),short,x) * store(&(__return.s6),short,x) * store(&(__return.s7),short,x) */
;
float32x4_t vdupq_n_f32(float x)
/*@ Require emp Ensure store(&(__return.s0),float,x) * store(&(__return.s1),float,x) * store(&(__return.s2),float,x) * store(&(__return.s3),float,x) */
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
/*@ Import Coq Require Import Qu8Cvt.ProgramModel */
/*@ Extern Coq (cvt_values : Z -> list Z -> Z -> fp32 -> list fp32)
 (cvt_rvv_values : Z -> list Z -> Z -> fp32 -> list fp32)
 (cvt_chunk : Z -> Z -> list Z -> Z -> fp32 -> list fp32)
 (FloatArray::full : Z -> Z -> list fp32 -> Assertion)
 (FloatArray::seg : Z -> Z -> Z -> list fp32 -> Assertion)
 (FloatArray::undef_full : Z -> Z -> Assertion)
 (FloatArray::undef_seg : Z -> Z -> Z -> Assertion) */
/*@ Import Coq Require Import QcpNeonLoop.InvariantFacts */
/*@ Extern Coq (fp32_length : list fp32 -> Z) */
/*@ Import Coq Require Import QcpVadd.VaddBits */
/*@ Extern Coq (FloatArray::full : Z -> Z -> list fp32 -> Assertion)
               (FloatArray::seg : Z -> Z -> Z -> list fp32 -> Assertion)
               (FloatArray::missing_i : Z -> Z -> Z -> Z -> list fp32 -> Assertion)
               (fp32_bits_equal : fp32 -> fp32 -> Prop) */
/*@ Import Coq Require Import QcpNeon.NeonBridge */
/*@ Extern Coq (FloatArray::undef_full : Z -> Z -> Assertion)
               (FloatArray::undef_seg : Z -> Z -> Z -> Assertion)
               (fp32_slice : Z -> Z -> list fp32 -> list fp32)
               (FloatArray::full : Z -> Z -> list fp32 -> Assertion)
               (FloatArray::seg : Z -> Z -> Z -> list fp32 -> Assertion)
               (UndefStructPredfloat32x4_t : Z -> Assertion)
               (UndefStructPredfloat32x2_t : Z -> Assertion) */
/*@ Import Coq Require Import QcpNeonLoop.NeonLoopBridge */
/*@ include strategies "neon_bridge.strategies" */
/*@ include strategies "neon_tail.strategies" */
/*@ include strategies "float_array.strategies" */
int32x4_t qcp_cvt_movlow(int16x8_t a)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z) (a4:Z) (a5:Z) (a6:Z) (a7:Z) Require -32768<=a0 && a0<=32767 && -32768<=a1 && a1<=32767 && -32768<=a2 && a2<=32767 && -32768<=a3 && a3<=32767 && -32768<=a4 && a4<=32767 && -32768<=a5 && a5<=32767 && -32768<=a6 && a6<=32767 && -32768<=a7 && a7<=32767 && store(&(a.s0),short,a0) * store(&(a.s1),short,a1) * store(&(a.s2),short,a2) * store(&(a.s3),short,a3) * store(&(a.s4),short,a4) * store(&(a.s5),short,a5) * store(&(a.s6),short,a6) * store(&(a.s7),short,a7) Ensure store(&(__return.s0),int,a0) * store(&(__return.s1),int,a1) * store(&(__return.s2),int,a2) * store(&(__return.s3),int,a3) */;
int32x4_t qcp_cvt_movhigh(int16x8_t a)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z) (a4:Z) (a5:Z) (a6:Z) (a7:Z) Require -32768<=a0 && a0<=32767 && -32768<=a1 && a1<=32767 && -32768<=a2 && a2<=32767 && -32768<=a3 && a3<=32767 && -32768<=a4 && a4<=32767 && -32768<=a5 && a5<=32767 && -32768<=a6 && a6<=32767 && -32768<=a7 && a7<=32767 && store(&(a.s0),short,a0) * store(&(a.s1),short,a1) * store(&(a.s2),short,a2) * store(&(a.s3),short,a3) * store(&(a.s4),short,a4) * store(&(a.s5),short,a5) * store(&(a.s6),short,a6) * store(&(a.s7),short,a7) Ensure store(&(__return.s0),int,a4) * store(&(__return.s1),int,a5) * store(&(__return.s2),int,a6) * store(&(__return.s3),int,a7) */;
/* Exact nested composition; one argument evaluation, original inner and outer bodies remain in closure. */
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
/*
struct xnn_qu8_f32_cvt_params {
  struct {
    int32_t zero_point;
    float scale;
  } scalar;
};
*/
void test_neon(
    size_t batch,
    const uint8_t* input,
    float* output,
    const struct xnn_qu8_f32_cvt_params* restrict params)
/*@ With (A:list Z) (RawZ:Z) (Scale:fp32)
 Require 0<batch && batch<=4611686018427387903 &&
 input!=0 && output!=0 && params!=0 &&
 UCharArray::full(input,batch+7,A) * FloatArray::undef_full(output,batch) *
 store(&(params->scalar.zero_point),int,RawZ) * store(&(params->scalar.scale),float,Scale)
 Ensure UCharArray::full(input,batch+7,A) * FloatArray::full(output,batch,cvt_values(batch,A,RawZ,Scale)) *
 store(&(params->scalar.zero_point),int,RawZ) * store(&(params->scalar.scale),float,Scale) */
{
/*@ Assert sizeof(uint8_t)==1 && sizeof(float)==4 && batch%sizeof(uint8_t)==0 && batch==batch@pre && input==input@pre && output==output@pre && params==params@pre && 0<batch@pre && batch@pre<=4611686018427387903 && input!=0 && output!=0 && params!=0 && UCharArray::full(input,batch+7,A) * FloatArray::undef_full(output,batch) * store(&(params->scalar.zero_point),int,RawZ) * store(&(params->scalar.scale),float,Scale) */
  qcp_assert(batch != 0);
  qcp_assert(batch % sizeof(uint8_t) == 0);
  qcp_assert(input != ((void*)0));
  qcp_assert(output != ((void*)0));
  const int16x8_t vminus_zero_point = vdupq_n_s16((int16_t)(0U - (uint32_t)params->scalar.zero_point));
  const float32x4_t vscale = vdupq_n_f32(params->scalar.scale);
/*@ Inv Assert sizeof(uint8_t)==1 && sizeof(float)==4 &&
0 < batch@pre && batch@pre<=4611686018427387903 &&
0 <= (batch@pre-batch) && (batch@pre-batch)+batch == batch@pre && 0 <= batch && batch <= batch@pre &&
(batch == 0 || batch == 1 || batch == 2 || batch == 3 || batch == 4 || batch == 5 || batch == 6 || batch == 7 || 8 <= batch) &&
params == params@pre && params != 0 &&
input == input@pre+(batch@pre-batch) && output == output@pre+(batch@pre-batch) &&
UCharArray::full(input@pre,batch@pre+7,A) *
FloatArray::full(output@pre,(batch@pre-batch),cvt_values((batch@pre-batch),A,RawZ,Scale)) * FloatArray::undef_full(output,batch) *
store(&(params->scalar.zero_point),int,RawZ) * store(&(params->scalar.scale),float,Scale) *
store(&(vminus_zero_point.s0),short,cvt_seed(RawZ)) * store(&(vminus_zero_point.s1),short,cvt_seed(RawZ)) * store(&(vminus_zero_point.s2),short,cvt_seed(RawZ)) * store(&(vminus_zero_point.s3),short,cvt_seed(RawZ)) * store(&(vminus_zero_point.s4),short,cvt_seed(RawZ)) * store(&(vminus_zero_point.s5),short,cvt_seed(RawZ)) * store(&(vminus_zero_point.s6),short,cvt_seed(RawZ)) * store(&(vminus_zero_point.s7),short,cvt_seed(RawZ)) *
store(&(vscale.s0),float,Scale) * store(&(vscale.s1),float,Scale) * store(&(vscale.s2),float,Scale) * store(&(vscale.s3),float,Scale) */
  for (; batch >= 8 * sizeof(uint8_t); batch -= 8 * sizeof(uint8_t)) {
    const uint8x8_t vx = vld1_u8(input) /*@ where base=input@pre,count=batch@pre+7,idx=batch@pre-batch,L=A */; input += 8;
    const int16x8_t vhx = qcp_cvt_widen_u8(vminus_zero_point,vx) /*@ where a=&vminus_zero_point,b=&vx */;
    const int32x4_t vwx_lo = qcp_cvt_movlow(vhx) /*@ where a=&vhx */;
    const int32x4_t vwx_hi = qcp_cvt_movhigh(vhx) /*@ where a=&vhx */;
    float32x4_t vy_lo = vcvtq_f32_s32(vwx_lo) /*@ where a=&vwx_lo */;
    float32x4_t vy_hi = vcvtq_f32_s32(vwx_hi) /*@ where a=&vwx_hi */;
    vy_lo = vmulq_f32(vy_lo, vscale) /*@ where a=&vy_lo,b=&vscale */;
    vy_hi = vmulq_f32(vy_hi, vscale) /*@ where a=&vy_hi,b=&vscale */;
    qcp_vst1q_f32((output),&(vy_lo)) /*@ where a=&vy_lo */; output += 4;
    qcp_vst1q_f32((output),&(vy_hi)) /*@ where a=&vy_hi */; output += 4;
  }
  if (batch != 0) {
    qcp_assert(batch >= 1 * sizeof(uint8_t));
    qcp_assert(batch <= 7 * sizeof(uint8_t));
    const uint8x8_t vx = vld1_u8(input) /*@ where base=input@pre,count=batch@pre+7,idx=batch@pre-batch,L=A */;
    const int16x8_t vhx = qcp_cvt_widen_u8(vminus_zero_point,vx) /*@ where a=&vminus_zero_point,b=&vx */;
    const int32x4_t vwx_lo = qcp_cvt_movlow(vhx) /*@ where a=&vhx */;
    const int32x4_t vwx_hi = qcp_cvt_movhigh(vhx) /*@ where a=&vhx */;
    float32x4_t vy = vcvtq_f32_s32(vwx_lo) /*@ where a=&vwx_lo */;
    vy = vmulq_f32(vy, vscale) /*@ where a=&vy,b=&vscale */;
    if (batch & (4 * sizeof(uint8_t))) {
      qcp_vst1q_f32((output),&(vy)) /*@ where a=&vy */; output += 4;
      vy = vcvtq_f32_s32(vwx_hi) /*@ where a=&vwx_hi */;
      vy = vmulq_f32(vy, vscale) /*@ where a=&vy,b=&vscale */;
    }
    float32x2_t vy_lo = vget_low_f32(vy) /*@ where a=&vy */;
    if (batch & (2 * sizeof(uint8_t))) {
      qcp_vst1_f32((output),&(vy_lo)) /*@ where a=&vy_lo */; output += 2;
      vy_lo = vget_high_f32(vy) /*@ where a=&vy */;
    }
    if (batch & (1 * sizeof(uint8_t))) {
      qcp_vst1_lane_f32((output),&(vy_lo),(0)) /*@ where a=&vy_lo */;
    }
  }
}
