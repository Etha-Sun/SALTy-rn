typedef unsigned long long size_t;
typedef unsigned int uint32_t;
typedef unsigned short uint16_t;
typedef struct float32x4_t { float s0; float s1; float s2; float s3; } float32x4_t;
typedef struct float32x2_t { float s0; float s1; } float32x2_t;
typedef struct uint32x4_t { unsigned int s0; unsigned int s1; unsigned int s2; unsigned int s3; } uint32x4_t;
typedef struct uint16x8_t { unsigned short s0; unsigned short s1; unsigned short s2; unsigned short s3; unsigned short s4; unsigned short s5; unsigned short s6; unsigned short s7; } uint16x8_t;
typedef struct uint16x4_t { unsigned short s0; unsigned short s1; unsigned short s2; unsigned short s3; } uint16x4_t;
typedef struct vfloat32m8_t { float s0; float s1; float s2; float s3; float s4; float s5; float s6; float s7; float s8; float s9; float s10; float s11; float s12; float s13; float s14; float s15; float s16; float s17; float s18; float s19; float s20; float s21; float s22; float s23; float s24; float s25; float s26; float s27; float s28; float s29; float s30; float s31; } vfloat32m8_t;
typedef struct vuint32m8_t { unsigned int s0; unsigned int s1; unsigned int s2; unsigned int s3; unsigned int s4; unsigned int s5; unsigned int s6; unsigned int s7; unsigned int s8; unsigned int s9; unsigned int s10; unsigned int s11; unsigned int s12; unsigned int s13; unsigned int s14; unsigned int s15; unsigned int s16; unsigned int s17; unsigned int s18; unsigned int s19; unsigned int s20; unsigned int s21; unsigned int s22; unsigned int s23; unsigned int s24; unsigned int s25; unsigned int s26; unsigned int s27; unsigned int s28; unsigned int s29; unsigned int s30; unsigned int s31; } vuint32m8_t;
typedef struct vuint16m4_t { unsigned short s0; unsigned short s1; unsigned short s2; unsigned short s3; unsigned short s4; unsigned short s5; unsigned short s6; unsigned short s7; unsigned short s8; unsigned short s9; unsigned short s10; unsigned short s11; unsigned short s12; unsigned short s13; unsigned short s14; unsigned short s15; unsigned short s16; unsigned short s17; unsigned short s18; unsigned short s19; unsigned short s20; unsigned short s21; unsigned short s22; unsigned short s23; unsigned short s24; unsigned short s25; unsigned short s26; unsigned short s27; unsigned short s28; unsigned short s29; unsigned short s30; unsigned short s31; } vuint16m4_t;
typedef struct vbool4_t { int s0; int s1; int s2; int s3; int s4; int s5; int s6; int s7; int s8; int s9; int s10; int s11; int s12; int s13; int s14; int s15; int s16; int s17; int s18; int s19; int s20; int s21; int s22; int s23; int s24; int s25; int s26; int s27; int s28; int s29; int s30; int s31; } vbool4_t;
/* Raw eight-byte view; u32 lane0 stores two ushort cells, no uint32 pointer dereference. */
typedef uint16x4_t uint32x2_t;
/*@ Import Coq Require Import F32F16.Types */
/*@ Extern Coq 
 (UndefStructPredfloat32x4_t : Z -> Assertion)
 (UndefStructPredfloat32x2_t : Z -> Assertion)
 (UndefStructPreduint32x4_t : Z -> Assertion)
 (UndefStructPreduint16x8_t : Z -> Assertion)
 (UndefStructPreduint16x4_t : Z -> Assertion)
 (UndefStructPredvfloat32m8_t : Z -> Assertion)
 (UndefStructPredvuint32m8_t : Z -> Assertion)
 (UndefStructPredvuint16m4_t : Z -> Assertion)
 (UndefStructPredvbool4_t : Z -> Assertion) */
/*@ Import Coq Require Import F32F16.UShortStoreModel */
/*@ Extern Coq
 (UShortArray::full : Z -> Z -> list Z -> Assertion)
 (UShortArray::undef_full : Z -> Z -> Assertion)
 (UShortArray::seg : Z -> Z -> Z -> list Z -> Assertion)
 (UShortArray::undef_seg : Z -> Z -> Z -> Assertion)
 (f16_take : Z -> list Z -> list Z)
 (f16_get : Z -> list Z -> Z)
 (f16_snoc : list Z -> Z -> list Z)
 (f16_length : list Z -> Z)
 (f16_u16_equal : Z -> Z -> Prop)
 (f16_pack32 : Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> list Z) */
/*@ Import Coq Require Import QcpVadd.VaddBits */
/*@ Extern Coq (FloatArray::full : Z -> Z -> list fp32 -> Assertion)
               (FloatArray::seg : Z -> Z -> Z -> list fp32 -> Assertion)
               (FloatArray::missing_i : Z -> Z -> Z -> Z -> list fp32 -> Assertion)
               (fp32_bits_equal : fp32 -> fp32 -> Prop) */
/*@ Import Coq Require Import QcpNeonLoop.InvariantFacts */
/*@ Extern Coq (fp32_length : list fp32 -> Z) */
/*@ Import Coq Require Import QcpNeon.NeonBridge */
/*@ Extern Coq (FloatArray::undef_full : Z -> Z -> Assertion)
               (FloatArray::undef_seg : Z -> Z -> Z -> Assertion)
               (fp32_slice : Z -> Z -> list fp32 -> list fp32)
               (FloatArray::full : Z -> Z -> list fp32 -> Assertion)
               (FloatArray::seg : Z -> Z -> Z -> list fp32 -> Assertion)
               (UndefStructPredfloat32x4_t : Z -> Assertion)
               (UndefStructPredfloat32x2_t : Z -> Assertion) */
/*@ Import Coq Require Import QcpNeonLoop.NeonLoopBridge */
/*@ Import Coq Require Import QcpRvv32.RvvLogic */
/*@ Extern Coq (FloatArray::full : Z -> Z -> list fp32 -> Assertion)
 (FloatArray::seg : Z -> Z -> Z -> list fp32 -> Assertion)
 (FloatArray::missing_i : Z -> Z -> Z -> Z -> list fp32 -> Assertion)
 (rvv_read_value : Z -> Z -> list fp32 -> fp32) */
/*@ Import Coq Require Import QcpRvv32.RvvStoreModel */
/*@ Extern Coq
 (FloatArray::full : Z -> Z -> list fp32 -> Assertion)
 (FloatArray::undef_full : Z -> Z -> Assertion)
 (FloatArray::seg : Z -> Z -> Z -> list fp32 -> Assertion)
 (FloatArray::undef_seg : Z -> Z -> Z -> Assertion)
 (rvv_take : Z -> list fp32 -> list fp32)
 (rvv_get : Z -> list fp32 -> fp32)
 (rvv_snoc : list fp32 -> fp32 -> list fp32)
 (rvv_length : list fp32 -> Z)
 (rvv_pack32 : fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> list fp32) */
/*@ Import Coq Require Import QcpRvv32.RvvLoopModel */
/*@ Extern Coq (rvv_slice : Z -> Z -> list fp32 -> list fp32)
 (vadd_vl : Z -> Z)
 (vadd_values : Z -> list fp32 -> list fp32 -> list fp32) */
/*@ Import Coq Require Import F32F16.ProgramModel */
/*@ Extern Coq (f16_values : Z -> list fp32 -> list Z)
 (f16_rvv_values : Z -> list fp32 -> list Z) */
float32x4_t vld1q_f32(const float* p)
/*@ With (x0:fp32) (x1:fp32) (x2:fp32) (x3:fp32) Require store(pointer_offset(p,0,float),float,x0) * store(pointer_offset(p,1,float),float,x1) * store(pointer_offset(p,2,float),float,x2) * store(pointer_offset(p,3,float),float,x3) Ensure store(pointer_offset(p,0,float),float,x0) * store(pointer_offset(p,1,float),float,x1) * store(pointer_offset(p,2,float),float,x2) * store(pointer_offset(p,3,float),float,x3) * store(&(__return.s0),float,x0) * store(&(__return.s1),float,x1) * store(&(__return.s2),float,x2) * store(&(__return.s3),float,x3) */;
void qcp_f16_store8(uint16_t* p,const uint16x8_t* a)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z) Require store(&(a->s0),unsigned short,x0) * store(&(a->s1),unsigned short,x1) * store(&(a->s2),unsigned short,x2) * store(&(a->s3),unsigned short,x3) * store(&(a->s4),unsigned short,x4) * store(&(a->s5),unsigned short,x5) * store(&(a->s6),unsigned short,x6) * store(&(a->s7),unsigned short,x7) * undef_data_at(pointer_offset(p,0,unsigned short),unsigned short) * undef_data_at(pointer_offset(p,1,unsigned short),unsigned short) * undef_data_at(pointer_offset(p,2,unsigned short),unsigned short) * undef_data_at(pointer_offset(p,3,unsigned short),unsigned short) * undef_data_at(pointer_offset(p,4,unsigned short),unsigned short) * undef_data_at(pointer_offset(p,5,unsigned short),unsigned short) * undef_data_at(pointer_offset(p,6,unsigned short),unsigned short) * undef_data_at(pointer_offset(p,7,unsigned short),unsigned short) Ensure store(&(a->s0),unsigned short,x0) * store(&(a->s1),unsigned short,x1) * store(&(a->s2),unsigned short,x2) * store(&(a->s3),unsigned short,x3) * store(&(a->s4),unsigned short,x4) * store(&(a->s5),unsigned short,x5) * store(&(a->s6),unsigned short,x6) * store(&(a->s7),unsigned short,x7) * store(pointer_offset(p,0,unsigned short),unsigned short,x0) * store(pointer_offset(p,1,unsigned short),unsigned short,x1) * store(pointer_offset(p,2,unsigned short),unsigned short,x2) * store(pointer_offset(p,3,unsigned short),unsigned short,x3) * store(pointer_offset(p,4,unsigned short),unsigned short,x4) * store(pointer_offset(p,5,unsigned short),unsigned short,x5) * store(pointer_offset(p,6,unsigned short),unsigned short,x6) * store(pointer_offset(p,7,unsigned short),unsigned short,x7) */;
void qcp_f16_store4(uint16_t* p,const uint16x4_t* a)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) Require store(&(a->s0),unsigned short,x0) * store(&(a->s1),unsigned short,x1) * store(&(a->s2),unsigned short,x2) * store(&(a->s3),unsigned short,x3) * undef_data_at(pointer_offset(p,0,unsigned short),unsigned short) * undef_data_at(pointer_offset(p,1,unsigned short),unsigned short) * undef_data_at(pointer_offset(p,2,unsigned short),unsigned short) * undef_data_at(pointer_offset(p,3,unsigned short),unsigned short) Ensure store(&(a->s0),unsigned short,x0) * store(&(a->s1),unsigned short,x1) * store(&(a->s2),unsigned short,x2) * store(&(a->s3),unsigned short,x3) * store(pointer_offset(p,0,unsigned short),unsigned short,x0) * store(pointer_offset(p,1,unsigned short),unsigned short,x1) * store(pointer_offset(p,2,unsigned short),unsigned short,x2) * store(pointer_offset(p,3,unsigned short),unsigned short,x3) */;
void qcp_f16_store2_0(void* p,const uint16x4_t* a)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) Require store(&(a->s0),unsigned short,x0) * store(&(a->s1),unsigned short,x1) * store(&(a->s2),unsigned short,x2) * store(&(a->s3),unsigned short,x3) * undef_data_at(pointer_offset(p,0,unsigned short),unsigned short) * undef_data_at(pointer_offset(p,1,unsigned short),unsigned short) Ensure store(&(a->s0),unsigned short,x0) * store(&(a->s1),unsigned short,x1) * store(&(a->s2),unsigned short,x2) * store(&(a->s3),unsigned short,x3) * store(pointer_offset(p,0,unsigned short),unsigned short,x0) * store(pointer_offset(p,1,unsigned short),unsigned short,x1) */;
void qcp_f16_store1_0(uint16_t* p,const uint16x4_t* a)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) Require store(&(a->s0),unsigned short,x0) * store(&(a->s1),unsigned short,x1) * store(&(a->s2),unsigned short,x2) * store(&(a->s3),unsigned short,x3) * undef_data_at(pointer_offset(p,0,unsigned short),unsigned short) Ensure store(&(a->s0),unsigned short,x0) * store(&(a->s1),unsigned short,x1) * store(&(a->s2),unsigned short,x2) * store(&(a->s3),unsigned short,x3) * store(pointer_offset(p,0,unsigned short),unsigned short,x0) */;
const uint16x4_t* qcp_f16_u32_view(const uint16x4_t* a)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) Require store(&(a->s0),unsigned short,x0) * store(&(a->s1),unsigned short,x1) * store(&(a->s2),unsigned short,x2) * store(&(a->s3),unsigned short,x3) Ensure __return == a && store(&(a->s0),unsigned short,x0) * store(&(a->s1),unsigned short,x1) * store(&(a->s2),unsigned short,x2) * store(&(a->s3),unsigned short,x3) */;
void qcp_assert(int condition)
/*@ Require condition != 0 && emp Ensure emp */;
/* Supported composition only: local u16x4 -> unchanged8-byte borrowed view
 * -> lane0 four-byte store. Both actual helper bodies are checked. */
/*@ Import Coq Require Import F32F16.PackModel */
/*@ Extern Coq 
 (f16_pack1 : Z -> list Z)
 (f16_pack2 : Z -> Z -> list Z)
 (f16_pack4 : Z -> Z -> Z -> Z -> list Z)
 (f16_pack8 : Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> list Z) */
void qcp_f16_store8_array(uint16_t* p,const uint16x8_t* a)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z)
 Require store(&(a->s0),unsigned short,x0) * store(&(a->s1),unsigned short,x1) * store(&(a->s2),unsigned short,x2) * store(&(a->s3),unsigned short,x3) * store(&(a->s4),unsigned short,x4) * store(&(a->s5),unsigned short,x5) * store(&(a->s6),unsigned short,x6) * store(&(a->s7),unsigned short,x7) * UShortArray::undef_full(p,8)
 Ensure store(&(a->s0),unsigned short,x0) * store(&(a->s1),unsigned short,x1) * store(&(a->s2),unsigned short,x2) * store(&(a->s3),unsigned short,x3) * store(&(a->s4),unsigned short,x4) * store(&(a->s5),unsigned short,x5) * store(&(a->s6),unsigned short,x6) * store(&(a->s7),unsigned short,x7) * UShortArray::full(p,8,f16_pack8(x0,x1,x2,x3,x4,x5,x6,x7)) */;
void qcp_f16_store4_array(uint16_t* p,const uint16x4_t* a)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z)
 Require store(&(a->s0),unsigned short,x0) * store(&(a->s1),unsigned short,x1) * store(&(a->s2),unsigned short,x2) * store(&(a->s3),unsigned short,x3) * UShortArray::undef_full(p,4)
 Ensure store(&(a->s0),unsigned short,x0) * store(&(a->s1),unsigned short,x1) * store(&(a->s2),unsigned short,x2) * store(&(a->s3),unsigned short,x3) * UShortArray::full(p,4,f16_pack4(x0,x1,x2,x3)) */;
void qcp_f16_store2_0_array(void* p,const uint16x4_t* a)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z)
 Require store(&(a->s0),unsigned short,x0) * store(&(a->s1),unsigned short,x1) * store(&(a->s2),unsigned short,x2) * store(&(a->s3),unsigned short,x3) * UShortArray::undef_full(p,2)
 Ensure store(&(a->s0),unsigned short,x0) * store(&(a->s1),unsigned short,x1) * store(&(a->s2),unsigned short,x2) * store(&(a->s3),unsigned short,x3) * UShortArray::full(p,2,f16_pack2(x0,x1)) */;
void qcp_f16_store1_0_array(uint16_t* p,const uint16x4_t* a)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z)
 Require store(&(a->s0),unsigned short,x0) * store(&(a->s1),unsigned short,x1) * store(&(a->s2),unsigned short,x2) * store(&(a->s3),unsigned short,x3) * UShortArray::undef_full(p,1)
 Ensure store(&(a->s0),unsigned short,x0) * store(&(a->s1),unsigned short,x1) * store(&(a->s2),unsigned short,x2) * store(&(a->s3),unsigned short,x3) * UShortArray::full(p,1,f16_pack1(x0)) */;
void qcp_f16_store8_array(uint16_t* p,const uint16x8_t* a)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z)
 Require store(&(a->s0),unsigned short,x0) * store(&(a->s1),unsigned short,x1) * store(&(a->s2),unsigned short,x2) * store(&(a->s3),unsigned short,x3) * store(&(a->s4),unsigned short,x4) * store(&(a->s5),unsigned short,x5) * store(&(a->s6),unsigned short,x6) * store(&(a->s7),unsigned short,x7) * UShortArray::undef_full(p,8)
 Ensure store(&(a->s0),unsigned short,x0) * store(&(a->s1),unsigned short,x1) * store(&(a->s2),unsigned short,x2) * store(&(a->s3),unsigned short,x3) * store(&(a->s4),unsigned short,x4) * store(&(a->s5),unsigned short,x5) * store(&(a->s6),unsigned short,x6) * store(&(a->s7),unsigned short,x7) * UShortArray::full(p,8,f16_pack8(x0,x1,x2,x3,x4,x5,x6,x7)) */
{
 /*@ UShortArray::undef_full(p,8) which implies undef_data_at(pointer_offset(p,0,unsigned short),unsigned short) * undef_data_at(pointer_offset(p,1,unsigned short),unsigned short) * undef_data_at(pointer_offset(p,2,unsigned short),unsigned short) * undef_data_at(pointer_offset(p,3,unsigned short),unsigned short) * undef_data_at(pointer_offset(p,4,unsigned short),unsigned short) * undef_data_at(pointer_offset(p,5,unsigned short),unsigned short) * undef_data_at(pointer_offset(p,6,unsigned short),unsigned short) * undef_data_at(pointer_offset(p,7,unsigned short),unsigned short) */
 qcp_f16_store8(p,a);
 /*@ store(pointer_offset(p,0,unsigned short),unsigned short,x0) * store(pointer_offset(p,1,unsigned short),unsigned short,x1) * store(pointer_offset(p,2,unsigned short),unsigned short,x2) * store(pointer_offset(p,3,unsigned short),unsigned short,x3) * store(pointer_offset(p,4,unsigned short),unsigned short,x4) * store(pointer_offset(p,5,unsigned short),unsigned short,x5) * store(pointer_offset(p,6,unsigned short),unsigned short,x6) * store(pointer_offset(p,7,unsigned short),unsigned short,x7) which implies UShortArray::full(p,8,f16_pack8(x0,x1,x2,x3,x4,x5,x6,x7)) */
}
void qcp_f16_store4_array(uint16_t* p,const uint16x4_t* a)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z)
 Require store(&(a->s0),unsigned short,x0) * store(&(a->s1),unsigned short,x1) * store(&(a->s2),unsigned short,x2) * store(&(a->s3),unsigned short,x3) * UShortArray::undef_full(p,4)
 Ensure store(&(a->s0),unsigned short,x0) * store(&(a->s1),unsigned short,x1) * store(&(a->s2),unsigned short,x2) * store(&(a->s3),unsigned short,x3) * UShortArray::full(p,4,f16_pack4(x0,x1,x2,x3)) */
{
 /*@ UShortArray::undef_full(p,4) which implies undef_data_at(pointer_offset(p,0,unsigned short),unsigned short) * undef_data_at(pointer_offset(p,1,unsigned short),unsigned short) * undef_data_at(pointer_offset(p,2,unsigned short),unsigned short) * undef_data_at(pointer_offset(p,3,unsigned short),unsigned short) */
 qcp_f16_store4(p,a);
 /*@ store(pointer_offset(p,0,unsigned short),unsigned short,x0) * store(pointer_offset(p,1,unsigned short),unsigned short,x1) * store(pointer_offset(p,2,unsigned short),unsigned short,x2) * store(pointer_offset(p,3,unsigned short),unsigned short,x3) which implies UShortArray::full(p,4,f16_pack4(x0,x1,x2,x3)) */
}
void qcp_f16_store2_0_array(void* p,const uint16x4_t* a)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z)
 Require store(&(a->s0),unsigned short,x0) * store(&(a->s1),unsigned short,x1) * store(&(a->s2),unsigned short,x2) * store(&(a->s3),unsigned short,x3) * UShortArray::undef_full(p,2)
 Ensure store(&(a->s0),unsigned short,x0) * store(&(a->s1),unsigned short,x1) * store(&(a->s2),unsigned short,x2) * store(&(a->s3),unsigned short,x3) * UShortArray::full(p,2,f16_pack2(x0,x1)) */
{
 /*@ UShortArray::undef_full(p,2) which implies undef_data_at(pointer_offset(p,0,unsigned short),unsigned short) * undef_data_at(pointer_offset(p,1,unsigned short),unsigned short) */
 qcp_f16_store2_0(p,a);
 /*@ store(pointer_offset(p,0,unsigned short),unsigned short,x0) * store(pointer_offset(p,1,unsigned short),unsigned short,x1) which implies UShortArray::full(p,2,f16_pack2(x0,x1)) */
}
void qcp_f16_store1_0_array(uint16_t* p,const uint16x4_t* a)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z)
 Require store(&(a->s0),unsigned short,x0) * store(&(a->s1),unsigned short,x1) * store(&(a->s2),unsigned short,x2) * store(&(a->s3),unsigned short,x3) * UShortArray::undef_full(p,1)
 Ensure store(&(a->s0),unsigned short,x0) * store(&(a->s1),unsigned short,x1) * store(&(a->s2),unsigned short,x2) * store(&(a->s3),unsigned short,x3) * UShortArray::full(p,1,f16_pack1(x0)) */
{
 /*@ UShortArray::undef_full(p,1) which implies undef_data_at(pointer_offset(p,0,unsigned short),unsigned short) */
 qcp_f16_store1_0(p,a);
 /*@ store(pointer_offset(p,0,unsigned short),unsigned short,x0) which implies UShortArray::full(p,1,f16_pack1(x0)) */
}
