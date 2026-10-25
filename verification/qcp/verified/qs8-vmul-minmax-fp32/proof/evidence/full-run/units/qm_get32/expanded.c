typedef signed char int8_t;
typedef unsigned char uint8_t;
typedef short int16_t;
typedef unsigned short uint16_t;
typedef int int32_t;
typedef unsigned int uint32_t;
typedef unsigned long long size_t;
union xnn_qs8_mul_minmax_params {struct {int8_t a_zero_point;int8_t b_zero_point;float scale;int16_t output_zero_point;int8_t output_min;int8_t output_max;}scalar;};
typedef struct int8x8_t {
 int8_t s0;
 int8_t s1;
 int8_t s2;
 int8_t s3;
 int8_t s4;
 int8_t s5;
 int8_t s6;
 int8_t s7;
} int8x8_t;
typedef struct int16x4_t {
 int16_t s0;
 int16_t s1;
 int16_t s2;
 int16_t s3;
} int16x4_t;
typedef struct int16x8_t {
 int16_t s0;
 int16_t s1;
 int16_t s2;
 int16_t s3;
 int16_t s4;
 int16_t s5;
 int16_t s6;
 int16_t s7;
} int16x8_t;
typedef struct int32x4_t {
 int32_t s0;
 int32_t s1;
 int32_t s2;
 int32_t s3;
} int32x4_t;
typedef struct float32x4_t {
 float s0;
 float s1;
 float s2;
 float s3;
} float32x4_t;
typedef struct uint32x2_t {
 uint32_t s0;
 uint32_t s1;
} uint32x2_t;
typedef struct uint16x4_t {
 uint16_t s0;
 uint16_t s1;
 uint16_t s2;
 uint16_t s3;
} uint16x4_t;
typedef struct vint8m2_t {
 int8_t s0;
 int8_t s1;
 int8_t s2;
 int8_t s3;
 int8_t s4;
 int8_t s5;
 int8_t s6;
 int8_t s7;
 int8_t s8;
 int8_t s9;
 int8_t s10;
 int8_t s11;
 int8_t s12;
 int8_t s13;
 int8_t s14;
 int8_t s15;
 int8_t s16;
 int8_t s17;
 int8_t s18;
 int8_t s19;
 int8_t s20;
 int8_t s21;
 int8_t s22;
 int8_t s23;
 int8_t s24;
 int8_t s25;
 int8_t s26;
 int8_t s27;
 int8_t s28;
 int8_t s29;
 int8_t s30;
 int8_t s31;
} vint8m2_t;
typedef struct vint16m4_t {
 int16_t s0;
 int16_t s1;
 int16_t s2;
 int16_t s3;
 int16_t s4;
 int16_t s5;
 int16_t s6;
 int16_t s7;
 int16_t s8;
 int16_t s9;
 int16_t s10;
 int16_t s11;
 int16_t s12;
 int16_t s13;
 int16_t s14;
 int16_t s15;
 int16_t s16;
 int16_t s17;
 int16_t s18;
 int16_t s19;
 int16_t s20;
 int16_t s21;
 int16_t s22;
 int16_t s23;
 int16_t s24;
 int16_t s25;
 int16_t s26;
 int16_t s27;
 int16_t s28;
 int16_t s29;
 int16_t s30;
 int16_t s31;
} vint16m4_t;
typedef struct vint32m8_t {
 int32_t s0;
 int32_t s1;
 int32_t s2;
 int32_t s3;
 int32_t s4;
 int32_t s5;
 int32_t s6;
 int32_t s7;
 int32_t s8;
 int32_t s9;
 int32_t s10;
 int32_t s11;
 int32_t s12;
 int32_t s13;
 int32_t s14;
 int32_t s15;
 int32_t s16;
 int32_t s17;
 int32_t s18;
 int32_t s19;
 int32_t s20;
 int32_t s21;
 int32_t s22;
 int32_t s23;
 int32_t s24;
 int32_t s25;
 int32_t s26;
 int32_t s27;
 int32_t s28;
 int32_t s29;
 int32_t s30;
 int32_t s31;
} vint32m8_t;
typedef struct vfloat32m8_t {
 float s0;
 float s1;
 float s2;
 float s3;
 float s4;
 float s5;
 float s6;
 float s7;
 float s8;
 float s9;
 float s10;
 float s11;
 float s12;
 float s13;
 float s14;
 float s15;
 float s16;
 float s17;
 float s18;
 float s19;
 float s20;
 float s21;
 float s22;
 float s23;
 float s24;
 float s25;
 float s26;
 float s27;
 float s28;
 float s29;
 float s30;
 float s31;
} vfloat32m8_t;
/*@ Import Coq Require Import Qs8Mul.Types */
/*@ Import Coq Require Import Qs8Mul.IntrinsicModel */
/*@ Extern Coq (RDMap :: *) */
/*@ Extern Coq (qm_min:Z -> Z -> Z) (qm_max:Z -> Z -> Z) (qm_sub16:Z -> Z -> Z) (qm_of_int:Z -> fp32) (qm_arm_mul:fp32 -> fp32 -> fp32) (qm_arm_add:fp32 -> fp32 -> fp32) (qm_rvv_mul:fp32 -> fp32 -> fp32) (qm_rvv_add:fp32 -> fp32 -> fp32) (qm_sign:fp32 -> fp32 -> fp32) (qm_sat32:Z -> Z) (qm_sat16:Z -> Z) (qm_sat8:Z -> Z) (qm_signed_bits:Z -> Z) (bits_of_fp32:fp32 -> Z) (qm_pack16:Z -> Z -> Z) (qm_pack32:Z -> Z -> Z -> Z -> Z) (qm_ext_pair:Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z) (qm_lane_match:Z -> Z -> Z -> Z -> Prop) (qm_fp_lane_match:Z -> Z -> fp32 -> fp32 -> Prop) (qm_vl_allowed:Z -> Z -> Prop) (rd_get:RDMap -> Z -> Z) (rd_window:RDMap -> Z -> Z -> Prop) (rd_mem:RDMap -> Assertion) (qm_magic:fp32) */
/*@ Import Coq Require Import Qs8Mul.ActiveModel */
/*@ Extern Coq (qm_read:RDMap -> Z -> Z -> Z)
 (qm_sub_read:RDMap -> Z -> Z -> Z -> Z)
 (qm_product:RDMap -> Z -> Z -> Z -> Z -> Z -> Z)
 (qm_converted:RDMap -> Z -> Z -> Z -> Z -> Z -> fp32)
 (qm_scaled:RDMap -> Z -> Z -> Z -> Z -> fp32 -> Z -> fp32)
 (qm_biased:RDMap -> Z -> Z -> Z -> Z -> fp32 -> Z -> fp32)
 (qm_restored:RDMap -> Z -> Z -> Z -> Z -> fp32 -> Z -> fp32)
 (qm_reinterpreted:RDMap -> Z -> Z -> Z -> Z -> fp32 -> Z -> Z)
 (qm_offset:RDMap -> Z -> Z -> Z -> Z -> fp32 -> Z -> Z -> Z)
 (qm_narrow16:RDMap -> Z -> Z -> Z -> Z -> fp32 -> Z -> Z -> Z)
 (qm_narrow8:RDMap -> Z -> Z -> Z -> Z -> fp32 -> Z -> Z -> Z)
 (qm_lowered:RDMap -> Z -> Z -> Z -> Z -> fp32 -> Z -> Z -> Z -> Z)
 (qm_finished:RDMap -> Z -> Z -> Z -> Z -> fp32 -> Z -> Z -> Z -> Z -> Z) */
/*@ Import Coq Require Import Qs8Mul.VectorValues */
/*@ Extern Coq (qm_list32:Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> list Z) (qm_vec32:Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z) (qm_fpvec32:fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> Z -> fp32) (qm_take32:Z -> list Z -> list Z) */
/*@ Extern Coq (CharArray::full:Z -> Z -> list Z -> Assertion)
 (CharArray::missing_i:Z -> Z -> Z -> Z -> list Z -> Assertion)
 (CharArray::seg:Z -> Z -> Z -> list Z -> Assertion)
 (CharArray::undef_full:Z -> Z -> Assertion)
 (CharArray::undef_seg:Z -> Z -> Z -> Assertion)
 (CharArray::undef_missing_i:Z -> Z -> Z -> Z -> Assertion)
 (Znth:{A} -> Z -> list A -> A -> A) */
/*@ include strategies "byte_store.strategies" */
int8_t qm_get32(const vint8m2_t *a,size_t i)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z) (x8:Z) (x9:Z) (x10:Z) (x11:Z) (x12:Z) (x13:Z) (x14:Z) (x15:Z) (x16:Z) (x17:Z) (x18:Z) (x19:Z) (x20:Z) (x21:Z) (x22:Z) (x23:Z) (x24:Z) (x25:Z) (x26:Z) (x27:Z) (x28:Z) (x29:Z) (x30:Z) (x31:Z)
 Require 0<=i && i<32 && store(&(a->s0),char,x0) * store(&(a->s1),char,x1) * store(&(a->s2),char,x2) * store(&(a->s3),char,x3) * store(&(a->s4),char,x4) * store(&(a->s5),char,x5) * store(&(a->s6),char,x6) * store(&(a->s7),char,x7) * store(&(a->s8),char,x8) * store(&(a->s9),char,x9) * store(&(a->s10),char,x10) * store(&(a->s11),char,x11) * store(&(a->s12),char,x12) * store(&(a->s13),char,x13) * store(&(a->s14),char,x14) * store(&(a->s15),char,x15) * store(&(a->s16),char,x16) * store(&(a->s17),char,x17) * store(&(a->s18),char,x18) * store(&(a->s19),char,x19) * store(&(a->s20),char,x20) * store(&(a->s21),char,x21) * store(&(a->s22),char,x22) * store(&(a->s23),char,x23) * store(&(a->s24),char,x24) * store(&(a->s25),char,x25) * store(&(a->s26),char,x26) * store(&(a->s27),char,x27) * store(&(a->s28),char,x28) * store(&(a->s29),char,x29) * store(&(a->s30),char,x30) * store(&(a->s31),char,x31)
 Ensure __return==qm_vec32(x0,x1,x2,x3,x4,x5,x6,x7,x8,x9,x10,x11,x12,x13,x14,x15,x16,x17,x18,x19,x20,x21,x22,x23,x24,x25,x26,x27,x28,x29,x30,x31,i) && store(&(a->s0),char,x0) * store(&(a->s1),char,x1) * store(&(a->s2),char,x2) * store(&(a->s3),char,x3) * store(&(a->s4),char,x4) * store(&(a->s5),char,x5) * store(&(a->s6),char,x6) * store(&(a->s7),char,x7) * store(&(a->s8),char,x8) * store(&(a->s9),char,x9) * store(&(a->s10),char,x10) * store(&(a->s11),char,x11) * store(&(a->s12),char,x12) * store(&(a->s13),char,x13) * store(&(a->s14),char,x14) * store(&(a->s15),char,x15) * store(&(a->s16),char,x16) * store(&(a->s17),char,x17) * store(&(a->s18),char,x18) * store(&(a->s19),char,x19) * store(&(a->s20),char,x20) * store(&(a->s21),char,x21) * store(&(a->s22),char,x22) * store(&(a->s23),char,x23) * store(&(a->s24),char,x24) * store(&(a->s25),char,x25) * store(&(a->s26),char,x26) * store(&(a->s27),char,x27) * store(&(a->s28),char,x28) * store(&(a->s29),char,x29) * store(&(a->s30),char,x30) * store(&(a->s31),char,x31) */;
void qm_store32(int8_t *out,const vint8m2_t *a,size_t vl)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z) (x8:Z) (x9:Z) (x10:Z) (x11:Z) (x12:Z) (x13:Z) (x14:Z) (x15:Z) (x16:Z) (x17:Z) (x18:Z) (x19:Z) (x20:Z) (x21:Z) (x22:Z) (x23:Z) (x24:Z) (x25:Z) (x26:Z) (x27:Z) (x28:Z) (x29:Z) (x30:Z) (x31:Z)
 Require 0<=vl && vl<=32 && CharArray::undef_full(out,vl) * store(&(a->s0),char,x0) * store(&(a->s1),char,x1) * store(&(a->s2),char,x2) * store(&(a->s3),char,x3) * store(&(a->s4),char,x4) * store(&(a->s5),char,x5) * store(&(a->s6),char,x6) * store(&(a->s7),char,x7) * store(&(a->s8),char,x8) * store(&(a->s9),char,x9) * store(&(a->s10),char,x10) * store(&(a->s11),char,x11) * store(&(a->s12),char,x12) * store(&(a->s13),char,x13) * store(&(a->s14),char,x14) * store(&(a->s15),char,x15) * store(&(a->s16),char,x16) * store(&(a->s17),char,x17) * store(&(a->s18),char,x18) * store(&(a->s19),char,x19) * store(&(a->s20),char,x20) * store(&(a->s21),char,x21) * store(&(a->s22),char,x22) * store(&(a->s23),char,x23) * store(&(a->s24),char,x24) * store(&(a->s25),char,x25) * store(&(a->s26),char,x26) * store(&(a->s27),char,x27) * store(&(a->s28),char,x28) * store(&(a->s29),char,x29) * store(&(a->s30),char,x30) * store(&(a->s31),char,x31)
 Ensure CharArray::full(out,vl,qm_take32(vl,qm_list32(x0,x1,x2,x3,x4,x5,x6,x7,x8,x9,x10,x11,x12,x13,x14,x15,x16,x17,x18,x19,x20,x21,x22,x23,x24,x25,x26,x27,x28,x29,x30,x31))) * store(&(a->s0),char,x0) * store(&(a->s1),char,x1) * store(&(a->s2),char,x2) * store(&(a->s3),char,x3) * store(&(a->s4),char,x4) * store(&(a->s5),char,x5) * store(&(a->s6),char,x6) * store(&(a->s7),char,x7) * store(&(a->s8),char,x8) * store(&(a->s9),char,x9) * store(&(a->s10),char,x10) * store(&(a->s11),char,x11) * store(&(a->s12),char,x12) * store(&(a->s13),char,x13) * store(&(a->s14),char,x14) * store(&(a->s15),char,x15) * store(&(a->s16),char,x16) * store(&(a->s17),char,x17) * store(&(a->s18),char,x18) * store(&(a->s19),char,x19) * store(&(a->s20),char,x20) * store(&(a->s21),char,x21) * store(&(a->s22),char,x22) * store(&(a->s23),char,x23) * store(&(a->s24),char,x24) * store(&(a->s25),char,x25) * store(&(a->s26),char,x26) * store(&(a->s27),char,x27) * store(&(a->s28),char,x28) * store(&(a->s29),char,x29) * store(&(a->s30),char,x30) * store(&(a->s31),char,x31) */;
int8_t qm_get32(const vint8m2_t *a,size_t i)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z) (x8:Z) (x9:Z) (x10:Z) (x11:Z) (x12:Z) (x13:Z) (x14:Z) (x15:Z) (x16:Z) (x17:Z) (x18:Z) (x19:Z) (x20:Z) (x21:Z) (x22:Z) (x23:Z) (x24:Z) (x25:Z) (x26:Z) (x27:Z) (x28:Z) (x29:Z) (x30:Z) (x31:Z)
 Require 0<=i && i<32 && store(&(a->s0),char,x0) * store(&(a->s1),char,x1) * store(&(a->s2),char,x2) * store(&(a->s3),char,x3) * store(&(a->s4),char,x4) * store(&(a->s5),char,x5) * store(&(a->s6),char,x6) * store(&(a->s7),char,x7) * store(&(a->s8),char,x8) * store(&(a->s9),char,x9) * store(&(a->s10),char,x10) * store(&(a->s11),char,x11) * store(&(a->s12),char,x12) * store(&(a->s13),char,x13) * store(&(a->s14),char,x14) * store(&(a->s15),char,x15) * store(&(a->s16),char,x16) * store(&(a->s17),char,x17) * store(&(a->s18),char,x18) * store(&(a->s19),char,x19) * store(&(a->s20),char,x20) * store(&(a->s21),char,x21) * store(&(a->s22),char,x22) * store(&(a->s23),char,x23) * store(&(a->s24),char,x24) * store(&(a->s25),char,x25) * store(&(a->s26),char,x26) * store(&(a->s27),char,x27) * store(&(a->s28),char,x28) * store(&(a->s29),char,x29) * store(&(a->s30),char,x30) * store(&(a->s31),char,x31)
 Ensure __return==qm_vec32(x0,x1,x2,x3,x4,x5,x6,x7,x8,x9,x10,x11,x12,x13,x14,x15,x16,x17,x18,x19,x20,x21,x22,x23,x24,x25,x26,x27,x28,x29,x30,x31,i) && store(&(a->s0),char,x0) * store(&(a->s1),char,x1) * store(&(a->s2),char,x2) * store(&(a->s3),char,x3) * store(&(a->s4),char,x4) * store(&(a->s5),char,x5) * store(&(a->s6),char,x6) * store(&(a->s7),char,x7) * store(&(a->s8),char,x8) * store(&(a->s9),char,x9) * store(&(a->s10),char,x10) * store(&(a->s11),char,x11) * store(&(a->s12),char,x12) * store(&(a->s13),char,x13) * store(&(a->s14),char,x14) * store(&(a->s15),char,x15) * store(&(a->s16),char,x16) * store(&(a->s17),char,x17) * store(&(a->s18),char,x18) * store(&(a->s19),char,x19) * store(&(a->s20),char,x20) * store(&(a->s21),char,x21) * store(&(a->s22),char,x22) * store(&(a->s23),char,x23) * store(&(a->s24),char,x24) * store(&(a->s25),char,x25) * store(&(a->s26),char,x26) * store(&(a->s27),char,x27) * store(&(a->s28),char,x28) * store(&(a->s29),char,x29) * store(&(a->s30),char,x30) * store(&(a->s31),char,x31) */
{
if(i==0)return a->s0;
if(i==1)return a->s1;
if(i==2)return a->s2;
if(i==3)return a->s3;
if(i==4)return a->s4;
if(i==5)return a->s5;
if(i==6)return a->s6;
if(i==7)return a->s7;
if(i==8)return a->s8;
if(i==9)return a->s9;
if(i==10)return a->s10;
if(i==11)return a->s11;
if(i==12)return a->s12;
if(i==13)return a->s13;
if(i==14)return a->s14;
if(i==15)return a->s15;
if(i==16)return a->s16;
if(i==17)return a->s17;
if(i==18)return a->s18;
if(i==19)return a->s19;
if(i==20)return a->s20;
if(i==21)return a->s21;
if(i==22)return a->s22;
if(i==23)return a->s23;
if(i==24)return a->s24;
if(i==25)return a->s25;
if(i==26)return a->s26;
if(i==27)return a->s27;
if(i==28)return a->s28;
if(i==29)return a->s29;
if(i==30)return a->s30;
return a->s31;
}
