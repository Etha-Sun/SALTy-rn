#include "array_model.h"
int8_t rsum_read_lane(const int8_t *p,size_t i,size_t vl)
/*@ With (base:Z) (count:Z) (idx:Z) (L:list Z)
 Require 0<=i && i<128 && 0<=vl && vl<=128 && 0<=idx && idx+vl<=count && p==base+idx && CharArray::full(base,count,L)
 Ensure __return==rs_read_lane(i,vl,idx,L) && CharArray::full(base,count,L) */
{
 if(i<vl) {
  /*@ Assert p==p@pre && i==i@pre && vl==vl@pre && 0<=i && i<128 && 0<=vl && vl<=128 && i<vl && 0<=idx && idx+vl<=count && p==base+idx && CharArray::missing_i(base,idx+i,0,count,L) * store(pointer_offset(p,i,char),char,L[idx+i]) */
  int8_t value=p[i];
  /*@ Assert p==p@pre && i==i@pre && vl==vl@pre && 0<=i && i<128 && 0<=vl && vl<=128 && i<vl && 0<=idx && idx+vl<=count && p==base+idx && CharArray::full(base,count,L) * store(&value,char,L[idx+i]) */
  return value;
 }
 return 0;
}

int8x16_t vld1q_s8(const int8_t *p)
/*@ With (base:Z) (count:Z) (idx:Z) (L:list Z)
 Require 0<=idx && idx+16<=count && p==base+idx && CharArray::full(base,count,L)
 Ensure CharArray::full(base,count,L) * store(&(__return.s0),char,L[idx+0]) * store(&(__return.s1),char,L[idx+1]) * store(&(__return.s2),char,L[idx+2]) * store(&(__return.s3),char,L[idx+3]) * store(&(__return.s4),char,L[idx+4]) * store(&(__return.s5),char,L[idx+5]) * store(&(__return.s6),char,L[idx+6]) * store(&(__return.s7),char,L[idx+7]) * store(&(__return.s8),char,L[idx+8]) * store(&(__return.s9),char,L[idx+9]) * store(&(__return.s10),char,L[idx+10]) * store(&(__return.s11),char,L[idx+11]) * store(&(__return.s12),char,L[idx+12]) * store(&(__return.s13),char,L[idx+13]) * store(&(__return.s14),char,L[idx+14]) * store(&(__return.s15),char,L[idx+15]) */
{
 int8x16_t r;
 r.s0=rsum_read_lane(p,0,16) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s1=rsum_read_lane(p,1,16) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s2=rsum_read_lane(p,2,16) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s3=rsum_read_lane(p,3,16) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s4=rsum_read_lane(p,4,16) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s5=rsum_read_lane(p,5,16) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s6=rsum_read_lane(p,6,16) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s7=rsum_read_lane(p,7,16) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s8=rsum_read_lane(p,8,16) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s9=rsum_read_lane(p,9,16) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s10=rsum_read_lane(p,10,16) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s11=rsum_read_lane(p,11,16) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s12=rsum_read_lane(p,12,16) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s13=rsum_read_lane(p,13,16) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s14=rsum_read_lane(p,14,16) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s15=rsum_read_lane(p,15,16) /*@ where base=base,count=count,idx=idx,L=L */;
 return r;
}
