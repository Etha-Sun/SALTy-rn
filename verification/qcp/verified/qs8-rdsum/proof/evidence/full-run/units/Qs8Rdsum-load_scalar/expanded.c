typedef signed char int8_t;
typedef unsigned char uint8_t;
typedef signed short int16_t;
typedef unsigned short uint16_t;
typedef signed int int32_t;
typedef unsigned int uint32_t;
typedef signed long long int64_t;
typedef unsigned long long uint64_t;
typedef unsigned long long size_t;
/*@ Import Coq Require Import Qs8Rdsum.Model */
/*@ Extern Coq (rs_s16 : Z -> Z) (rs_u16 : Z -> Z)
 (rs_s32 : Z -> Z) (rs_u32 : Z -> Z)
 (rs_add_s32 : Z -> Z -> Z) (rs_add_u32 : Z -> Z -> Z)
 (rs_pair_s8 : Z -> Z -> Z -> Z) (rs_pair_u8 : Z -> Z -> Z -> Z)
 (rs_pair_s16 : Z -> Z -> Z -> Z) (rs_pair_u16 : Z -> Z -> Z -> Z) */
typedef unsigned long long uintptr_t;
/*@ Import Coq Require Import Qs8Rdsum.Types */
typedef struct int8x8_t { int8_t s0;int8_t s1;int8_t s2;int8_t s3;int8_t s4;int8_t s5;int8_t s6;int8_t s7; } int8x8_t;
/*@ Extern Coq (UndefStructPredint8x8_t : Z -> Assertion) */
typedef struct int16x8_t { int16_t s0;int16_t s1;int16_t s2;int16_t s3;int16_t s4;int16_t s5;int16_t s6;int16_t s7; } int16x8_t;
/*@ Extern Coq (UndefStructPredint16x8_t : Z -> Assertion) */
typedef struct int32x2_t { int32_t s0;int32_t s1; } int32x2_t;
/*@ Extern Coq (UndefStructPredint32x2_t : Z -> Assertion) */
typedef struct int32x4_t { int32_t s0;int32_t s1;int32_t s2;int32_t s3; } int32x4_t;
/*@ Extern Coq (UndefStructPredint32x4_t : Z -> Assertion) */
typedef struct vint8m2_t { int8_t s0;int8_t s1;int8_t s2;int8_t s3;int8_t s4;int8_t s5;int8_t s6;int8_t s7;int8_t s8;int8_t s9;int8_t s10;int8_t s11;int8_t s12;int8_t s13;int8_t s14;int8_t s15;int8_t s16;int8_t s17;int8_t s18;int8_t s19;int8_t s20;int8_t s21;int8_t s22;int8_t s23;int8_t s24;int8_t s25;int8_t s26;int8_t s27;int8_t s28;int8_t s29;int8_t s30;int8_t s31; } vint8m2_t;
/*@ Extern Coq (UndefStructPredvint8m2_t : Z -> Assertion) */
typedef struct vint16m4_t { int16_t s0;int16_t s1;int16_t s2;int16_t s3;int16_t s4;int16_t s5;int16_t s6;int16_t s7;int16_t s8;int16_t s9;int16_t s10;int16_t s11;int16_t s12;int16_t s13;int16_t s14;int16_t s15;int16_t s16;int16_t s17;int16_t s18;int16_t s19;int16_t s20;int16_t s21;int16_t s22;int16_t s23;int16_t s24;int16_t s25;int16_t s26;int16_t s27;int16_t s28;int16_t s29;int16_t s30;int16_t s31; } vint16m4_t;
/*@ Extern Coq (UndefStructPredvint16m4_t : Z -> Assertion) */
typedef struct vint32m8_t { int32_t s0;int32_t s1;int32_t s2;int32_t s3;int32_t s4;int32_t s5;int32_t s6;int32_t s7;int32_t s8;int32_t s9;int32_t s10;int32_t s11;int32_t s12;int32_t s13;int32_t s14;int32_t s15;int32_t s16;int32_t s17;int32_t s18;int32_t s19;int32_t s20;int32_t s21;int32_t s22;int32_t s23;int32_t s24;int32_t s25;int32_t s26;int32_t s27;int32_t s28;int32_t s29;int32_t s30;int32_t s31; } vint32m8_t;
/*@ Extern Coq (UndefStructPredvint32m8_t : Z -> Assertion) */
struct xnn_qs8_rsum_params { char _; };
typedef unsigned long long uintptr_t;
/*@ Import Coq Require Import Qs8Rdsum.MemoryModel */
/*@ Extern Coq (RDMap :: *) */
/*@ Extern Coq (rd_mem:RDMap -> Assertion)
 (rd_get:RDMap -> Z -> Z)
 (rd_present:RDMap -> Z -> Prop)
 (rd_remove:RDMap -> Z -> RDMap)
 (rd_window:RDMap -> Z -> Z -> Prop) */
int8_t rdsum_read_byte(const int8_t *p)
/*@ With (M:RDMap)
 Require p!=0 && rd_present(M,p) && rd_mem(M)
 Ensure __return==rd_get(M,p) && -128<=__return && __return<=127 && rd_mem(M) */;
/*@ Import Coq Require Import Qs8Rdsum.LoadModel */
/*@ Extern Coq (rd_read_lane:RDMap -> Z -> Z -> Z -> Z) */
int8_t rdsum_read_lane(const int8_t *p,size_t i,size_t vl)
/*@ With (M:RDMap)
 Require 0<p && 0<=i && i<32 && 0<=vl && vl<=32 && p+vl<=(18446744073709551615+1) && rd_window(M,p,vl) && rd_mem(M)
 Ensure __return==rd_read_lane(M,p,i,vl) && -128<=__return && __return<=127 && rd_mem(M) */;
int8x8_t vld1_s8(const int8_t *p)
/*@ With (M:RDMap) Require 0<p && p+8<=(18446744073709551615+1) && rd_window(M,p,8) && rd_mem(M) Ensure rd_mem(M) * store(&(__return.s0),char,rd_read_lane(M,p,0,8)) * store(&(__return.s1),char,rd_read_lane(M,p,1,8)) * store(&(__return.s2),char,rd_read_lane(M,p,2,8)) * store(&(__return.s3),char,rd_read_lane(M,p,3,8)) * store(&(__return.s4),char,rd_read_lane(M,p,4,8)) * store(&(__return.s5),char,rd_read_lane(M,p,5,8)) * store(&(__return.s6),char,rd_read_lane(M,p,6,8)) * store(&(__return.s7),char,rd_read_lane(M,p,7,8)) */;
vint8m2_t __riscv_vle8_v_i8m2(const int8_t *p,size_t vl)
/*@ With (M:RDMap) Require 0<p && 0<=vl && vl<=32 && p+vl<=(18446744073709551615+1) && rd_window(M,p,vl) && rd_mem(M) Ensure rd_mem(M) * store(&(__return.s0),char,rd_read_lane(M,p,0,vl)) * store(&(__return.s1),char,rd_read_lane(M,p,1,vl)) * store(&(__return.s2),char,rd_read_lane(M,p,2,vl)) * store(&(__return.s3),char,rd_read_lane(M,p,3,vl)) * store(&(__return.s4),char,rd_read_lane(M,p,4,vl)) * store(&(__return.s5),char,rd_read_lane(M,p,5,vl)) * store(&(__return.s6),char,rd_read_lane(M,p,6,vl)) * store(&(__return.s7),char,rd_read_lane(M,p,7,vl)) * store(&(__return.s8),char,rd_read_lane(M,p,8,vl)) * store(&(__return.s9),char,rd_read_lane(M,p,9,vl)) * store(&(__return.s10),char,rd_read_lane(M,p,10,vl)) * store(&(__return.s11),char,rd_read_lane(M,p,11,vl)) * store(&(__return.s12),char,rd_read_lane(M,p,12,vl)) * store(&(__return.s13),char,rd_read_lane(M,p,13,vl)) * store(&(__return.s14),char,rd_read_lane(M,p,14,vl)) * store(&(__return.s15),char,rd_read_lane(M,p,15,vl)) * store(&(__return.s16),char,rd_read_lane(M,p,16,vl)) * store(&(__return.s17),char,rd_read_lane(M,p,17,vl)) * store(&(__return.s18),char,rd_read_lane(M,p,18,vl)) * store(&(__return.s19),char,rd_read_lane(M,p,19,vl)) * store(&(__return.s20),char,rd_read_lane(M,p,20,vl)) * store(&(__return.s21),char,rd_read_lane(M,p,21,vl)) * store(&(__return.s22),char,rd_read_lane(M,p,22,vl)) * store(&(__return.s23),char,rd_read_lane(M,p,23,vl)) * store(&(__return.s24),char,rd_read_lane(M,p,24,vl)) * store(&(__return.s25),char,rd_read_lane(M,p,25,vl)) * store(&(__return.s26),char,rd_read_lane(M,p,26,vl)) * store(&(__return.s27),char,rd_read_lane(M,p,27,vl)) * store(&(__return.s28),char,rd_read_lane(M,p,28,vl)) * store(&(__return.s29),char,rd_read_lane(M,p,29,vl)) * store(&(__return.s30),char,rd_read_lane(M,p,30,vl)) * store(&(__return.s31),char,rd_read_lane(M,p,31,vl)) */;
int8_t rdsum_read_lane(const int8_t *p,size_t i,size_t vl)
/*@ With (M:RDMap)
 Require 0<p && 0<=i && i<32 && 0<=vl && vl<=32 && p+vl<=(18446744073709551615+1) && rd_window(M,p,vl) && rd_mem(M)
 Ensure __return==rd_read_lane(M,p,i,vl) && -128<=__return && __return<=127 && rd_mem(M) */
{
 if(i<vl)return rdsum_read_byte(p+i) /*@ where M=M */;
 return 0;
}
