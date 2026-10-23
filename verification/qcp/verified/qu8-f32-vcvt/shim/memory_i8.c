#include "array_model.h"
uint8_t qcp_cvt_read_lane(const uint8_t *p,size_t i,size_t vl)
/*@ With (base:Z) (count:Z) (idx:Z) (L:list Z)
 Require 0<=i && i<32 && 0<=vl && vl<=32 && 0<=idx && idx+vl<=count && p==base+idx && UCharArray::full(base,count,L)
 Ensure __return==cvt_read_lane(i,vl,idx,L) && UCharArray::full(base,count,L) */
{
 if(i<vl) {
  /*@ Assert p==p@pre && i==i@pre && vl==vl@pre && 0<=i && i<32 && 0<=vl && vl<=32 && i<vl && 0<=idx && idx+vl<=count && p==base+idx && UCharArray::missing_i(base,idx+i,0,count,L) * store(pointer_offset(p,i,unsigned char),unsigned char,L[idx+i]) */
  uint8_t value=p[i];
  /*@ Assert p==p@pre && i==i@pre && vl==vl@pre && 0<=i && i<32 && 0<=vl && vl<=32 && i<vl && 0<=idx && idx+vl<=count && p==base+idx && UCharArray::full(base,count,L) * store(&value,unsigned char,L[idx+i]) */
  return value;
 }
 return 0;
}

uint8x8_t vld1_u8(const uint8_t *p)
/*@ With (base:Z) (count:Z) (idx:Z) (L:list Z)
 Require 0<=idx && idx+8<=count && p==base+idx && UCharArray::full(base,count,L)
 Ensure UCharArray::full(base,count,L) * store(&(__return.s0),unsigned char,L[idx+0]) * store(&(__return.s1),unsigned char,L[idx+1]) * store(&(__return.s2),unsigned char,L[idx+2]) * store(&(__return.s3),unsigned char,L[idx+3]) * store(&(__return.s4),unsigned char,L[idx+4]) * store(&(__return.s5),unsigned char,L[idx+5]) * store(&(__return.s6),unsigned char,L[idx+6]) * store(&(__return.s7),unsigned char,L[idx+7]) */
{
 uint8x8_t r;
 r.s0=qcp_cvt_read_lane(p,0,8) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s1=qcp_cvt_read_lane(p,1,8) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s2=qcp_cvt_read_lane(p,2,8) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s3=qcp_cvt_read_lane(p,3,8) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s4=qcp_cvt_read_lane(p,4,8) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s5=qcp_cvt_read_lane(p,5,8) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s6=qcp_cvt_read_lane(p,6,8) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s7=qcp_cvt_read_lane(p,7,8) /*@ where base=base,count=count,idx=idx,L=L */;
 return r;
}
