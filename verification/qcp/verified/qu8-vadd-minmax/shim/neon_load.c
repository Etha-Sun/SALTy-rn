#include "array_model.h"
uint8_t qcp_u8_read_lane(const uint8_t *p,size_t i,size_t vl)
/*@ With (base:Z) (count:Z) (idx:Z) (L:list Z)
 Require 0<=i && i<128 && 0<=vl && vl<=128 && 0<=idx && idx+vl<=count && p==base+idx && UCharArray::full(base,count,L)
 Ensure __return==u8_read_lane(i,vl,idx,L) && UCharArray::full(base,count,L) */
{
 if(i<vl) {
  /*@ Assert p==p@pre && i==i@pre && vl==vl@pre && 0<=i && i<128 && 0<=vl && vl<=128 && i<vl && 0<=idx && idx+vl<=count && p==base+idx && UCharArray::missing_i(base,idx+i,0,count,L) * store(pointer_offset(p,i,unsigned char),unsigned char,L[idx+i]) */
  uint8_t value=p[i];
  /*@ Assert p==p@pre && i==i@pre && vl==vl@pre && 0<=i && i<128 && 0<=vl && vl<=128 && i<vl && 0<=idx && idx+vl<=count && p==base+idx && UCharArray::full(base,count,L) * store(&value,unsigned char,L[idx+i]) */
  return value;
 }
 return 0;
}

uint8x8_t qcp_u8_load8(const uint8_t *p)
/*@ With (base:Z) (count:Z) (idx:Z) (L:list Z)
 Require 0<=idx && idx+8<=count && p==base+idx && UCharArray::full(base,count,L)
 Ensure UCharArray::full(base,count,L) * store(&(__return.s0),unsigned char,L[idx+0]) * store(&(__return.s1),unsigned char,L[idx+1]) * store(&(__return.s2),unsigned char,L[idx+2]) * store(&(__return.s3),unsigned char,L[idx+3]) * store(&(__return.s4),unsigned char,L[idx+4]) * store(&(__return.s5),unsigned char,L[idx+5]) * store(&(__return.s6),unsigned char,L[idx+6]) * store(&(__return.s7),unsigned char,L[idx+7]) */
{
 uint8x8_t r;
 r.s0=qcp_u8_read_lane(p,0,8) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s1=qcp_u8_read_lane(p,1,8) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s2=qcp_u8_read_lane(p,2,8) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s3=qcp_u8_read_lane(p,3,8) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s4=qcp_u8_read_lane(p,4,8) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s5=qcp_u8_read_lane(p,5,8) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s6=qcp_u8_read_lane(p,6,8) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s7=qcp_u8_read_lane(p,7,8) /*@ where base=base,count=count,idx=idx,L=L */;
 return r;
}

uint8x16_t qcp_u8_load16(const uint8_t *p)
/*@ With (base:Z) (count:Z) (idx:Z) (L:list Z)
 Require 0<=idx && idx+16<=count && p==base+idx && UCharArray::full(base,count,L)
 Ensure UCharArray::full(base,count,L) * store(&(__return.s0),unsigned char,L[idx+0]) * store(&(__return.s1),unsigned char,L[idx+1]) * store(&(__return.s2),unsigned char,L[idx+2]) * store(&(__return.s3),unsigned char,L[idx+3]) * store(&(__return.s4),unsigned char,L[idx+4]) * store(&(__return.s5),unsigned char,L[idx+5]) * store(&(__return.s6),unsigned char,L[idx+6]) * store(&(__return.s7),unsigned char,L[idx+7]) * store(&(__return.s8),unsigned char,L[idx+8]) * store(&(__return.s9),unsigned char,L[idx+9]) * store(&(__return.s10),unsigned char,L[idx+10]) * store(&(__return.s11),unsigned char,L[idx+11]) * store(&(__return.s12),unsigned char,L[idx+12]) * store(&(__return.s13),unsigned char,L[idx+13]) * store(&(__return.s14),unsigned char,L[idx+14]) * store(&(__return.s15),unsigned char,L[idx+15]) */
{
 uint8x16_t r;
 r.s0=qcp_u8_read_lane(p,0,16) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s1=qcp_u8_read_lane(p,1,16) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s2=qcp_u8_read_lane(p,2,16) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s3=qcp_u8_read_lane(p,3,16) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s4=qcp_u8_read_lane(p,4,16) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s5=qcp_u8_read_lane(p,5,16) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s6=qcp_u8_read_lane(p,6,16) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s7=qcp_u8_read_lane(p,7,16) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s8=qcp_u8_read_lane(p,8,16) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s9=qcp_u8_read_lane(p,9,16) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s10=qcp_u8_read_lane(p,10,16) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s11=qcp_u8_read_lane(p,11,16) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s12=qcp_u8_read_lane(p,12,16) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s13=qcp_u8_read_lane(p,13,16) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s14=qcp_u8_read_lane(p,14,16) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s15=qcp_u8_read_lane(p,15,16) /*@ where base=base,count=count,idx=idx,L=L */;
 return r;
}
