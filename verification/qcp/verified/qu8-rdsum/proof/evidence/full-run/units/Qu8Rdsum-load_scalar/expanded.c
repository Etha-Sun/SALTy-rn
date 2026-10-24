typedef signed char int8_t;
typedef unsigned char uint8_t;
typedef signed short int16_t;
typedef unsigned short uint16_t;
typedef signed int int32_t;
typedef unsigned int uint32_t;
typedef signed long long int64_t;
typedef unsigned long long uint64_t;
typedef unsigned long long size_t;
/*@ Import Coq Require Import Qu8Rdsum.Model */
/*@ Extern Coq (rs_s16 : Z -> Z) (rs_u16 : Z -> Z)
 (rs_s32 : Z -> Z) (rs_u32 : Z -> Z)
 (rs_add_s32 : Z -> Z -> Z) (rs_add_u32 : Z -> Z -> Z)
 (rs_pair_s8 : Z -> Z -> Z -> Z) (rs_pair_u8 : Z -> Z -> Z -> Z)
 (rs_pair_s16 : Z -> Z -> Z -> Z) (rs_pair_u16 : Z -> Z -> Z -> Z) */
typedef unsigned long long uintptr_t;
/*@ Import Coq Require Import Qu8Rdsum.Types */
typedef struct uint8x8_t { uint8_t s0;uint8_t s1;uint8_t s2;uint8_t s3;uint8_t s4;uint8_t s5;uint8_t s6;uint8_t s7; } uint8x8_t;
/*@ Extern Coq (UndefStructPreduint8x8_t : Z -> Assertion) */
typedef struct uint8x16_t { uint8_t s0;uint8_t s1;uint8_t s2;uint8_t s3;uint8_t s4;uint8_t s5;uint8_t s6;uint8_t s7;uint8_t s8;uint8_t s9;uint8_t s10;uint8_t s11;uint8_t s12;uint8_t s13;uint8_t s14;uint8_t s15; } uint8x16_t;
/*@ Extern Coq (UndefStructPreduint8x16_t : Z -> Assertion) */
typedef struct uint16x8_t { uint16_t s0;uint16_t s1;uint16_t s2;uint16_t s3;uint16_t s4;uint16_t s5;uint16_t s6;uint16_t s7; } uint16x8_t;
/*@ Extern Coq (UndefStructPreduint16x8_t : Z -> Assertion) */
typedef struct uint32x2_t { uint32_t s0;uint32_t s1; } uint32x2_t;
/*@ Extern Coq (UndefStructPreduint32x2_t : Z -> Assertion) */
typedef struct uint32x4_t { uint32_t s0;uint32_t s1;uint32_t s2;uint32_t s3; } uint32x4_t;
/*@ Extern Coq (UndefStructPreduint32x4_t : Z -> Assertion) */
typedef struct vuint8m2_t { uint8_t s0;uint8_t s1;uint8_t s2;uint8_t s3;uint8_t s4;uint8_t s5;uint8_t s6;uint8_t s7;uint8_t s8;uint8_t s9;uint8_t s10;uint8_t s11;uint8_t s12;uint8_t s13;uint8_t s14;uint8_t s15;uint8_t s16;uint8_t s17;uint8_t s18;uint8_t s19;uint8_t s20;uint8_t s21;uint8_t s22;uint8_t s23;uint8_t s24;uint8_t s25;uint8_t s26;uint8_t s27;uint8_t s28;uint8_t s29;uint8_t s30;uint8_t s31; } vuint8m2_t;
/*@ Extern Coq (UndefStructPredvuint8m2_t : Z -> Assertion) */
typedef struct vuint16m4_t { uint16_t s0;uint16_t s1;uint16_t s2;uint16_t s3;uint16_t s4;uint16_t s5;uint16_t s6;uint16_t s7;uint16_t s8;uint16_t s9;uint16_t s10;uint16_t s11;uint16_t s12;uint16_t s13;uint16_t s14;uint16_t s15;uint16_t s16;uint16_t s17;uint16_t s18;uint16_t s19;uint16_t s20;uint16_t s21;uint16_t s22;uint16_t s23;uint16_t s24;uint16_t s25;uint16_t s26;uint16_t s27;uint16_t s28;uint16_t s29;uint16_t s30;uint16_t s31; } vuint16m4_t;
/*@ Extern Coq (UndefStructPredvuint16m4_t : Z -> Assertion) */
typedef struct vuint32m8_t { uint32_t s0;uint32_t s1;uint32_t s2;uint32_t s3;uint32_t s4;uint32_t s5;uint32_t s6;uint32_t s7;uint32_t s8;uint32_t s9;uint32_t s10;uint32_t s11;uint32_t s12;uint32_t s13;uint32_t s14;uint32_t s15;uint32_t s16;uint32_t s17;uint32_t s18;uint32_t s19;uint32_t s20;uint32_t s21;uint32_t s22;uint32_t s23;uint32_t s24;uint32_t s25;uint32_t s26;uint32_t s27;uint32_t s28;uint32_t s29;uint32_t s30;uint32_t s31; } vuint32m8_t;
/*@ Extern Coq (UndefStructPredvuint32m8_t : Z -> Assertion) */
struct xnn_qs8_rsum_params { char _; };
typedef unsigned long long uintptr_t;
/*@ Import Coq Require Import Qu8Rdsum.MemoryModel */
/*@ Extern Coq (RDMap :: *) */
/*@ Extern Coq (rd_mem:RDMap -> Assertion)
 (rd_get:RDMap -> Z -> Z)
 (rd_present:RDMap -> Z -> Prop)
 (rd_remove:RDMap -> Z -> RDMap)
 (rd_window:RDMap -> Z -> Z -> Prop) */
uint8_t rdsum_read_byte(const uint8_t *p)
/*@ With (M:RDMap)
 Require p!=0 && rd_present(M,p) && rd_mem(M)
 Ensure __return==rd_get(M,p) && 0<=__return && __return<=255 && rd_mem(M) */;
/*@ Import Coq Require Import Qu8Rdsum.LoadModel */
/*@ Extern Coq (rd_read_lane:RDMap -> Z -> Z -> Z -> Z) */
uint8_t rdsum_read_lane(const uint8_t *p,size_t i,size_t vl)
/*@ With (M:RDMap)
 Require 0<p && 0<=i && i<32 && 0<=vl && vl<=32 && p+vl<=(18446744073709551615+1) && rd_window(M,p,vl) && rd_mem(M)
 Ensure __return==rd_read_lane(M,p,i,vl) && 0<=__return && __return<=255 && rd_mem(M) */;
uint8x8_t vld1_u8(const uint8_t *p)
/*@ With (M:RDMap) Require 0<p && p+8<=(18446744073709551615+1) && rd_window(M,p,8) && rd_mem(M) Ensure rd_mem(M) * store(&(__return.s0),unsigned char,rd_read_lane(M,p,0,8)) * store(&(__return.s1),unsigned char,rd_read_lane(M,p,1,8)) * store(&(__return.s2),unsigned char,rd_read_lane(M,p,2,8)) * store(&(__return.s3),unsigned char,rd_read_lane(M,p,3,8)) * store(&(__return.s4),unsigned char,rd_read_lane(M,p,4,8)) * store(&(__return.s5),unsigned char,rd_read_lane(M,p,5,8)) * store(&(__return.s6),unsigned char,rd_read_lane(M,p,6,8)) * store(&(__return.s7),unsigned char,rd_read_lane(M,p,7,8)) */;
uint8x16_t vld1q_u8(const uint8_t *p)
/*@ With (M:RDMap) Require 0<p && p+16<=(18446744073709551615+1) && rd_window(M,p,16) && rd_mem(M) Ensure rd_mem(M) * store(&(__return.s0),unsigned char,rd_read_lane(M,p,0,16)) * store(&(__return.s1),unsigned char,rd_read_lane(M,p,1,16)) * store(&(__return.s2),unsigned char,rd_read_lane(M,p,2,16)) * store(&(__return.s3),unsigned char,rd_read_lane(M,p,3,16)) * store(&(__return.s4),unsigned char,rd_read_lane(M,p,4,16)) * store(&(__return.s5),unsigned char,rd_read_lane(M,p,5,16)) * store(&(__return.s6),unsigned char,rd_read_lane(M,p,6,16)) * store(&(__return.s7),unsigned char,rd_read_lane(M,p,7,16)) * store(&(__return.s8),unsigned char,rd_read_lane(M,p,8,16)) * store(&(__return.s9),unsigned char,rd_read_lane(M,p,9,16)) * store(&(__return.s10),unsigned char,rd_read_lane(M,p,10,16)) * store(&(__return.s11),unsigned char,rd_read_lane(M,p,11,16)) * store(&(__return.s12),unsigned char,rd_read_lane(M,p,12,16)) * store(&(__return.s13),unsigned char,rd_read_lane(M,p,13,16)) * store(&(__return.s14),unsigned char,rd_read_lane(M,p,14,16)) * store(&(__return.s15),unsigned char,rd_read_lane(M,p,15,16)) */;
vuint8m2_t __riscv_vle8_v_u8m2(const uint8_t *p,size_t vl)
/*@ With (M:RDMap) Require 0<p && 0<=vl && vl<=32 && p+vl<=(18446744073709551615+1) && rd_window(M,p,vl) && rd_mem(M) Ensure rd_mem(M) * store(&(__return.s0),unsigned char,rd_read_lane(M,p,0,vl)) * store(&(__return.s1),unsigned char,rd_read_lane(M,p,1,vl)) * store(&(__return.s2),unsigned char,rd_read_lane(M,p,2,vl)) * store(&(__return.s3),unsigned char,rd_read_lane(M,p,3,vl)) * store(&(__return.s4),unsigned char,rd_read_lane(M,p,4,vl)) * store(&(__return.s5),unsigned char,rd_read_lane(M,p,5,vl)) * store(&(__return.s6),unsigned char,rd_read_lane(M,p,6,vl)) * store(&(__return.s7),unsigned char,rd_read_lane(M,p,7,vl)) * store(&(__return.s8),unsigned char,rd_read_lane(M,p,8,vl)) * store(&(__return.s9),unsigned char,rd_read_lane(M,p,9,vl)) * store(&(__return.s10),unsigned char,rd_read_lane(M,p,10,vl)) * store(&(__return.s11),unsigned char,rd_read_lane(M,p,11,vl)) * store(&(__return.s12),unsigned char,rd_read_lane(M,p,12,vl)) * store(&(__return.s13),unsigned char,rd_read_lane(M,p,13,vl)) * store(&(__return.s14),unsigned char,rd_read_lane(M,p,14,vl)) * store(&(__return.s15),unsigned char,rd_read_lane(M,p,15,vl)) * store(&(__return.s16),unsigned char,rd_read_lane(M,p,16,vl)) * store(&(__return.s17),unsigned char,rd_read_lane(M,p,17,vl)) * store(&(__return.s18),unsigned char,rd_read_lane(M,p,18,vl)) * store(&(__return.s19),unsigned char,rd_read_lane(M,p,19,vl)) * store(&(__return.s20),unsigned char,rd_read_lane(M,p,20,vl)) * store(&(__return.s21),unsigned char,rd_read_lane(M,p,21,vl)) * store(&(__return.s22),unsigned char,rd_read_lane(M,p,22,vl)) * store(&(__return.s23),unsigned char,rd_read_lane(M,p,23,vl)) * store(&(__return.s24),unsigned char,rd_read_lane(M,p,24,vl)) * store(&(__return.s25),unsigned char,rd_read_lane(M,p,25,vl)) * store(&(__return.s26),unsigned char,rd_read_lane(M,p,26,vl)) * store(&(__return.s27),unsigned char,rd_read_lane(M,p,27,vl)) * store(&(__return.s28),unsigned char,rd_read_lane(M,p,28,vl)) * store(&(__return.s29),unsigned char,rd_read_lane(M,p,29,vl)) * store(&(__return.s30),unsigned char,rd_read_lane(M,p,30,vl)) * store(&(__return.s31),unsigned char,rd_read_lane(M,p,31,vl)) */;
uint8_t rdsum_read_lane(const uint8_t *p,size_t i,size_t vl)
/*@ With (M:RDMap)
 Require 0<p && 0<=i && i<32 && 0<=vl && vl<=32 && p+vl<=(18446744073709551615+1) && rd_window(M,p,vl) && rd_mem(M)
 Ensure __return==rd_read_lane(M,p,i,vl) && 0<=__return && __return<=255 && rd_mem(M) */
{
 if(i<vl)return rdsum_read_byte(p+i) /*@ where M=M */;
 return 0;
}
