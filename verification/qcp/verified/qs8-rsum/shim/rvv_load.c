#include "array_model.h"
vint8m2_t rsum_rvv_load32(const int8_t *p,size_t vl)
/*@ With (base:Z) (count:Z) (idx:Z) (L:list Z)
 Require 0<=vl && vl<=32 && 0<=idx && idx+vl<=count && p==base+idx && CharArray::full(base,count,L)
 Ensure CharArray::full(base,count,L) * store(&(__return.s0),char,rs_read_lane(0,vl,idx,L)) * store(&(__return.s1),char,rs_read_lane(1,vl,idx,L)) * store(&(__return.s2),char,rs_read_lane(2,vl,idx,L)) * store(&(__return.s3),char,rs_read_lane(3,vl,idx,L)) * store(&(__return.s4),char,rs_read_lane(4,vl,idx,L)) * store(&(__return.s5),char,rs_read_lane(5,vl,idx,L)) * store(&(__return.s6),char,rs_read_lane(6,vl,idx,L)) * store(&(__return.s7),char,rs_read_lane(7,vl,idx,L)) * store(&(__return.s8),char,rs_read_lane(8,vl,idx,L)) * store(&(__return.s9),char,rs_read_lane(9,vl,idx,L)) * store(&(__return.s10),char,rs_read_lane(10,vl,idx,L)) * store(&(__return.s11),char,rs_read_lane(11,vl,idx,L)) * store(&(__return.s12),char,rs_read_lane(12,vl,idx,L)) * store(&(__return.s13),char,rs_read_lane(13,vl,idx,L)) * store(&(__return.s14),char,rs_read_lane(14,vl,idx,L)) * store(&(__return.s15),char,rs_read_lane(15,vl,idx,L)) * store(&(__return.s16),char,rs_read_lane(16,vl,idx,L)) * store(&(__return.s17),char,rs_read_lane(17,vl,idx,L)) * store(&(__return.s18),char,rs_read_lane(18,vl,idx,L)) * store(&(__return.s19),char,rs_read_lane(19,vl,idx,L)) * store(&(__return.s20),char,rs_read_lane(20,vl,idx,L)) * store(&(__return.s21),char,rs_read_lane(21,vl,idx,L)) * store(&(__return.s22),char,rs_read_lane(22,vl,idx,L)) * store(&(__return.s23),char,rs_read_lane(23,vl,idx,L)) * store(&(__return.s24),char,rs_read_lane(24,vl,idx,L)) * store(&(__return.s25),char,rs_read_lane(25,vl,idx,L)) * store(&(__return.s26),char,rs_read_lane(26,vl,idx,L)) * store(&(__return.s27),char,rs_read_lane(27,vl,idx,L)) * store(&(__return.s28),char,rs_read_lane(28,vl,idx,L)) * store(&(__return.s29),char,rs_read_lane(29,vl,idx,L)) * store(&(__return.s30),char,rs_read_lane(30,vl,idx,L)) * store(&(__return.s31),char,rs_read_lane(31,vl,idx,L)) */
{ vint8m2_t r;
r.s0=rsum_read_lane(p,0,vl) /*@ where base=base,count=count,idx=idx,L=L */;
r.s1=rsum_read_lane(p,1,vl) /*@ where base=base,count=count,idx=idx,L=L */;
r.s2=rsum_read_lane(p,2,vl) /*@ where base=base,count=count,idx=idx,L=L */;
r.s3=rsum_read_lane(p,3,vl) /*@ where base=base,count=count,idx=idx,L=L */;
r.s4=rsum_read_lane(p,4,vl) /*@ where base=base,count=count,idx=idx,L=L */;
r.s5=rsum_read_lane(p,5,vl) /*@ where base=base,count=count,idx=idx,L=L */;
r.s6=rsum_read_lane(p,6,vl) /*@ where base=base,count=count,idx=idx,L=L */;
r.s7=rsum_read_lane(p,7,vl) /*@ where base=base,count=count,idx=idx,L=L */;
r.s8=rsum_read_lane(p,8,vl) /*@ where base=base,count=count,idx=idx,L=L */;
r.s9=rsum_read_lane(p,9,vl) /*@ where base=base,count=count,idx=idx,L=L */;
r.s10=rsum_read_lane(p,10,vl) /*@ where base=base,count=count,idx=idx,L=L */;
r.s11=rsum_read_lane(p,11,vl) /*@ where base=base,count=count,idx=idx,L=L */;
r.s12=rsum_read_lane(p,12,vl) /*@ where base=base,count=count,idx=idx,L=L */;
r.s13=rsum_read_lane(p,13,vl) /*@ where base=base,count=count,idx=idx,L=L */;
r.s14=rsum_read_lane(p,14,vl) /*@ where base=base,count=count,idx=idx,L=L */;
r.s15=rsum_read_lane(p,15,vl) /*@ where base=base,count=count,idx=idx,L=L */;
r.s16=rsum_read_lane(p,16,vl) /*@ where base=base,count=count,idx=idx,L=L */;
r.s17=rsum_read_lane(p,17,vl) /*@ where base=base,count=count,idx=idx,L=L */;
r.s18=rsum_read_lane(p,18,vl) /*@ where base=base,count=count,idx=idx,L=L */;
r.s19=rsum_read_lane(p,19,vl) /*@ where base=base,count=count,idx=idx,L=L */;
r.s20=rsum_read_lane(p,20,vl) /*@ where base=base,count=count,idx=idx,L=L */;
r.s21=rsum_read_lane(p,21,vl) /*@ where base=base,count=count,idx=idx,L=L */;
r.s22=rsum_read_lane(p,22,vl) /*@ where base=base,count=count,idx=idx,L=L */;
r.s23=rsum_read_lane(p,23,vl) /*@ where base=base,count=count,idx=idx,L=L */;
r.s24=rsum_read_lane(p,24,vl) /*@ where base=base,count=count,idx=idx,L=L */;
r.s25=rsum_read_lane(p,25,vl) /*@ where base=base,count=count,idx=idx,L=L */;
r.s26=rsum_read_lane(p,26,vl) /*@ where base=base,count=count,idx=idx,L=L */;
r.s27=rsum_read_lane(p,27,vl) /*@ where base=base,count=count,idx=idx,L=L */;
r.s28=rsum_read_lane(p,28,vl) /*@ where base=base,count=count,idx=idx,L=L */;
r.s29=rsum_read_lane(p,29,vl) /*@ where base=base,count=count,idx=idx,L=L */;
r.s30=rsum_read_lane(p,30,vl) /*@ where base=base,count=count,idx=idx,L=L */;
r.s31=rsum_read_lane(p,31,vl) /*@ where base=base,count=count,idx=idx,L=L */;
return r;
}
