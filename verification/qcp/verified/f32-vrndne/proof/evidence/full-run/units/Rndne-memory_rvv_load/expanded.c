typedef unsigned long long size_t;
typedef unsigned int uint32_t;
struct xnn_f32_default_params { char _; };
typedef struct float32x4_t { float s0; float s1; float s2; float s3; } float32x4_t;
typedef struct float32x2_t { float s0; float s1; } float32x2_t;
typedef struct uint32x4_t { unsigned int s0; unsigned int s1; unsigned int s2; unsigned int s3; } uint32x4_t;
typedef struct vfloat32m8_t { float s0; float s1; float s2; float s3; float s4; float s5; float s6; float s7; float s8; float s9; float s10; float s11; float s12; float s13; float s14; float s15; float s16; float s17; float s18; float s19; float s20; float s21; float s22; float s23; float s24; float s25; float s26; float s27; float s28; float s29; float s30; float s31; } vfloat32m8_t;
typedef struct vuint32m8_t { unsigned int s0; unsigned int s1; unsigned int s2; unsigned int s3; unsigned int s4; unsigned int s5; unsigned int s6; unsigned int s7; unsigned int s8; unsigned int s9; unsigned int s10; unsigned int s11; unsigned int s12; unsigned int s13; unsigned int s14; unsigned int s15; unsigned int s16; unsigned int s17; unsigned int s18; unsigned int s19; unsigned int s20; unsigned int s21; unsigned int s22; unsigned int s23; unsigned int s24; unsigned int s25; unsigned int s26; unsigned int s27; unsigned int s28; unsigned int s29; unsigned int s30; unsigned int s31; } vuint32m8_t;
typedef struct vbool4_t { int s0; int s1; int s2; int s3; int s4; int s5; int s6; int s7; int s8; int s9; int s10; int s11; int s12; int s13; int s14; int s15; int s16; int s17; int s18; int s19; int s20; int s21; int s22; int s23; int s24; int s25; int s26; int s27; int s28; int s29; int s30; int s31; } vbool4_t;
/*@ Import Coq Require Import Rndne.Types */
/*@ Extern Coq (UndefStructPredfloat32x4_t : Z -> Assertion)
 (UndefStructPredfloat32x2_t : Z -> Assertion)
 (UndefStructPreduint32x4_t : Z -> Assertion)
 (UndefStructPredvfloat32m8_t : Z -> Assertion)
 (UndefStructPredvuint32m8_t : Z -> Assertion)
 (UndefStructPredvbool4_t : Z -> Assertion) */
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
/*@ Import Coq Require Import Rndne.ProgramModel */
/*@ Extern Coq (rndne_values : Z -> list fp32 -> list fp32)
 (rndne_rvv_values : Z -> list fp32 -> list fp32) */
/*@ include strategies "float_array.strategies" */
/*@ include strategies "neon_bridge.strategies" */
/*@ include strategies "neon_tail.strategies" */
/*@ include strategies "rvv_arrays.strategies" */
/*@ include strategies "rvv_store.strategies" */
/*@ include strategies "rvv_loop.strategies" */
/*@ include strategies "rndne_memory.strategies" */
/*@ Import Coq Require Import QcpVadd.VaddBits */
/*@ Extern Coq (fp32_bits_equal : fp32 -> fp32 -> Prop) */
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
/*@ include strategies "rvv_arrays.strategies" */
/*@ include strategies "rvv_store.strategies" */
/*@ include strategies "rvv_loop.strategies" */
/*@ include strategies "rndne_memory.strategies" */
void qcp_rvv_read_lane(const float *p,float *out,unsigned long long vl,unsigned long long i)
/*@ With (L:list fp32)
 Require 0 <= vl && vl <= 32 && 0 <= i && i < 32 &&
         FloatArray::full(p,vl,L) * undef_data_at(out,float)
 Ensure FloatArray::full(p,vl,L) * store(out,float,rvv_read_value(i,vl,L)) */
{
 if(i<vl) *out=p[i];
 else *out=0.0f;
}
void __riscv_vle32_v_f32m8(struct vfloat32m8_t *r,const float *p,unsigned long long vl)
/*@ With (L:list fp32)
 Require 0 <= vl && vl <= 32 && FloatArray::full(p,vl,L) * undef_data_at(&(r->s0),float) * undef_data_at(&(r->s1),float) * undef_data_at(&(r->s2),float) * undef_data_at(&(r->s3),float) * undef_data_at(&(r->s4),float) * undef_data_at(&(r->s5),float) * undef_data_at(&(r->s6),float) * undef_data_at(&(r->s7),float) * undef_data_at(&(r->s8),float) * undef_data_at(&(r->s9),float) * undef_data_at(&(r->s10),float) * undef_data_at(&(r->s11),float) * undef_data_at(&(r->s12),float) * undef_data_at(&(r->s13),float) * undef_data_at(&(r->s14),float) * undef_data_at(&(r->s15),float) * undef_data_at(&(r->s16),float) * undef_data_at(&(r->s17),float) * undef_data_at(&(r->s18),float) * undef_data_at(&(r->s19),float) * undef_data_at(&(r->s20),float) * undef_data_at(&(r->s21),float) * undef_data_at(&(r->s22),float) * undef_data_at(&(r->s23),float) * undef_data_at(&(r->s24),float) * undef_data_at(&(r->s25),float) * undef_data_at(&(r->s26),float) * undef_data_at(&(r->s27),float) * undef_data_at(&(r->s28),float) * undef_data_at(&(r->s29),float) * undef_data_at(&(r->s30),float) * undef_data_at(&(r->s31),float)
 Ensure FloatArray::full(p,vl,L) * store(&(r->s0),float,rvv_read_value(0,vl,L)) * store(&(r->s1),float,rvv_read_value(1,vl,L)) * store(&(r->s2),float,rvv_read_value(2,vl,L)) * store(&(r->s3),float,rvv_read_value(3,vl,L)) * store(&(r->s4),float,rvv_read_value(4,vl,L)) * store(&(r->s5),float,rvv_read_value(5,vl,L)) * store(&(r->s6),float,rvv_read_value(6,vl,L)) * store(&(r->s7),float,rvv_read_value(7,vl,L)) * store(&(r->s8),float,rvv_read_value(8,vl,L)) * store(&(r->s9),float,rvv_read_value(9,vl,L)) * store(&(r->s10),float,rvv_read_value(10,vl,L)) * store(&(r->s11),float,rvv_read_value(11,vl,L)) * store(&(r->s12),float,rvv_read_value(12,vl,L)) * store(&(r->s13),float,rvv_read_value(13,vl,L)) * store(&(r->s14),float,rvv_read_value(14,vl,L)) * store(&(r->s15),float,rvv_read_value(15,vl,L)) * store(&(r->s16),float,rvv_read_value(16,vl,L)) * store(&(r->s17),float,rvv_read_value(17,vl,L)) * store(&(r->s18),float,rvv_read_value(18,vl,L)) * store(&(r->s19),float,rvv_read_value(19,vl,L)) * store(&(r->s20),float,rvv_read_value(20,vl,L)) * store(&(r->s21),float,rvv_read_value(21,vl,L)) * store(&(r->s22),float,rvv_read_value(22,vl,L)) * store(&(r->s23),float,rvv_read_value(23,vl,L)) * store(&(r->s24),float,rvv_read_value(24,vl,L)) * store(&(r->s25),float,rvv_read_value(25,vl,L)) * store(&(r->s26),float,rvv_read_value(26,vl,L)) * store(&(r->s27),float,rvv_read_value(27,vl,L)) * store(&(r->s28),float,rvv_read_value(28,vl,L)) * store(&(r->s29),float,rvv_read_value(29,vl,L)) * store(&(r->s30),float,rvv_read_value(30,vl,L)) * store(&(r->s31),float,rvv_read_value(31,vl,L)) */
{
 qcp_rvv_read_lane(p,&(r->s0),vl,0);
 qcp_rvv_read_lane(p,&(r->s1),vl,1);
 qcp_rvv_read_lane(p,&(r->s2),vl,2);
 qcp_rvv_read_lane(p,&(r->s3),vl,3);
 qcp_rvv_read_lane(p,&(r->s4),vl,4);
 qcp_rvv_read_lane(p,&(r->s5),vl,5);
 qcp_rvv_read_lane(p,&(r->s6),vl,6);
 qcp_rvv_read_lane(p,&(r->s7),vl,7);
 qcp_rvv_read_lane(p,&(r->s8),vl,8);
 qcp_rvv_read_lane(p,&(r->s9),vl,9);
 qcp_rvv_read_lane(p,&(r->s10),vl,10);
 qcp_rvv_read_lane(p,&(r->s11),vl,11);
 qcp_rvv_read_lane(p,&(r->s12),vl,12);
 qcp_rvv_read_lane(p,&(r->s13),vl,13);
 qcp_rvv_read_lane(p,&(r->s14),vl,14);
 qcp_rvv_read_lane(p,&(r->s15),vl,15);
 qcp_rvv_read_lane(p,&(r->s16),vl,16);
 qcp_rvv_read_lane(p,&(r->s17),vl,17);
 qcp_rvv_read_lane(p,&(r->s18),vl,18);
 qcp_rvv_read_lane(p,&(r->s19),vl,19);
 qcp_rvv_read_lane(p,&(r->s20),vl,20);
 qcp_rvv_read_lane(p,&(r->s21),vl,21);
 qcp_rvv_read_lane(p,&(r->s22),vl,22);
 qcp_rvv_read_lane(p,&(r->s23),vl,23);
 qcp_rvv_read_lane(p,&(r->s24),vl,24);
 qcp_rvv_read_lane(p,&(r->s25),vl,25);
 qcp_rvv_read_lane(p,&(r->s26),vl,26);
 qcp_rvv_read_lane(p,&(r->s27),vl,27);
 qcp_rvv_read_lane(p,&(r->s28),vl,28);
 qcp_rvv_read_lane(p,&(r->s29),vl,29);
 qcp_rvv_read_lane(p,&(r->s30),vl,30);
 qcp_rvv_read_lane(p,&(r->s31),vl,31);
}
vfloat32m8_t qcp_byvalue_load(const float *p,unsigned long long vl)
/*@ With (L:list fp32)
 Require 0 <= vl && vl <= 32 && FloatArray::full(p,vl,L)
 Ensure FloatArray::full(p,vl,L) * store(&(__return.s0),float,rvv_read_value(0,vl,L)) * store(&(__return.s1),float,rvv_read_value(1,vl,L)) * store(&(__return.s2),float,rvv_read_value(2,vl,L)) * store(&(__return.s3),float,rvv_read_value(3,vl,L)) * store(&(__return.s4),float,rvv_read_value(4,vl,L)) * store(&(__return.s5),float,rvv_read_value(5,vl,L)) * store(&(__return.s6),float,rvv_read_value(6,vl,L)) * store(&(__return.s7),float,rvv_read_value(7,vl,L)) * store(&(__return.s8),float,rvv_read_value(8,vl,L)) * store(&(__return.s9),float,rvv_read_value(9,vl,L)) * store(&(__return.s10),float,rvv_read_value(10,vl,L)) * store(&(__return.s11),float,rvv_read_value(11,vl,L)) * store(&(__return.s12),float,rvv_read_value(12,vl,L)) * store(&(__return.s13),float,rvv_read_value(13,vl,L)) * store(&(__return.s14),float,rvv_read_value(14,vl,L)) * store(&(__return.s15),float,rvv_read_value(15,vl,L)) * store(&(__return.s16),float,rvv_read_value(16,vl,L)) * store(&(__return.s17),float,rvv_read_value(17,vl,L)) * store(&(__return.s18),float,rvv_read_value(18,vl,L)) * store(&(__return.s19),float,rvv_read_value(19,vl,L)) * store(&(__return.s20),float,rvv_read_value(20,vl,L)) * store(&(__return.s21),float,rvv_read_value(21,vl,L)) * store(&(__return.s22),float,rvv_read_value(22,vl,L)) * store(&(__return.s23),float,rvv_read_value(23,vl,L)) * store(&(__return.s24),float,rvv_read_value(24,vl,L)) * store(&(__return.s25),float,rvv_read_value(25,vl,L)) * store(&(__return.s26),float,rvv_read_value(26,vl,L)) * store(&(__return.s27),float,rvv_read_value(27,vl,L)) * store(&(__return.s28),float,rvv_read_value(28,vl,L)) * store(&(__return.s29),float,rvv_read_value(29,vl,L)) * store(&(__return.s30),float,rvv_read_value(30,vl,L)) * store(&(__return.s31),float,rvv_read_value(31,vl,L)) */
{
 vfloat32m8_t r;
 __riscv_vle32_v_f32m8(&r,p,vl);
 return r;
}
