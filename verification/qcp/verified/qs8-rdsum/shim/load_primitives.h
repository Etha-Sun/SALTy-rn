#ifndef RDSUM_LOAD_PRIMITIVES_H
#define RDSUM_LOAD_PRIMITIVES_H
#include "formal_types.h"
#include "read_model.h"
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
#endif
