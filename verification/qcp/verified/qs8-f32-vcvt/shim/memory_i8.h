#ifndef QS8_F32_MEMORY_I8_H
#define QS8_F32_MEMORY_I8_H
#include "array_model.h"
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
#endif
