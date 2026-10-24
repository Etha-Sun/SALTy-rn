#include "output_vector.h"
vuint32m8_t __riscv_vle32_v_u32m8(const uint32_t *p,size_t vl)
/*@ With (base:Z) (count:Z) (idx:Z) (L:list Z) Require 0<=idx && 0<=vl && vl<=32 && idx+vl<=count && p==base+idx*4 && UIntArray::full(base,count,L) Ensure UIntArray::full(base,count,L) * store(&(__return.s0),unsigned int,rd_out_lane(L,idx,0,vl)) * store(&(__return.s1),unsigned int,rd_out_lane(L,idx,1,vl)) * store(&(__return.s2),unsigned int,rd_out_lane(L,idx,2,vl)) * store(&(__return.s3),unsigned int,rd_out_lane(L,idx,3,vl)) * store(&(__return.s4),unsigned int,rd_out_lane(L,idx,4,vl)) * store(&(__return.s5),unsigned int,rd_out_lane(L,idx,5,vl)) * store(&(__return.s6),unsigned int,rd_out_lane(L,idx,6,vl)) * store(&(__return.s7),unsigned int,rd_out_lane(L,idx,7,vl)) * store(&(__return.s8),unsigned int,rd_out_lane(L,idx,8,vl)) * store(&(__return.s9),unsigned int,rd_out_lane(L,idx,9,vl)) * store(&(__return.s10),unsigned int,rd_out_lane(L,idx,10,vl)) * store(&(__return.s11),unsigned int,rd_out_lane(L,idx,11,vl)) * store(&(__return.s12),unsigned int,rd_out_lane(L,idx,12,vl)) * store(&(__return.s13),unsigned int,rd_out_lane(L,idx,13,vl)) * store(&(__return.s14),unsigned int,rd_out_lane(L,idx,14,vl)) * store(&(__return.s15),unsigned int,rd_out_lane(L,idx,15,vl)) * store(&(__return.s16),unsigned int,rd_out_lane(L,idx,16,vl)) * store(&(__return.s17),unsigned int,rd_out_lane(L,idx,17,vl)) * store(&(__return.s18),unsigned int,rd_out_lane(L,idx,18,vl)) * store(&(__return.s19),unsigned int,rd_out_lane(L,idx,19,vl)) * store(&(__return.s20),unsigned int,rd_out_lane(L,idx,20,vl)) * store(&(__return.s21),unsigned int,rd_out_lane(L,idx,21,vl)) * store(&(__return.s22),unsigned int,rd_out_lane(L,idx,22,vl)) * store(&(__return.s23),unsigned int,rd_out_lane(L,idx,23,vl)) * store(&(__return.s24),unsigned int,rd_out_lane(L,idx,24,vl)) * store(&(__return.s25),unsigned int,rd_out_lane(L,idx,25,vl)) * store(&(__return.s26),unsigned int,rd_out_lane(L,idx,26,vl)) * store(&(__return.s27),unsigned int,rd_out_lane(L,idx,27,vl)) * store(&(__return.s28),unsigned int,rd_out_lane(L,idx,28,vl)) * store(&(__return.s29),unsigned int,rd_out_lane(L,idx,29,vl)) * store(&(__return.s30),unsigned int,rd_out_lane(L,idx,30,vl)) * store(&(__return.s31),unsigned int,rd_out_lane(L,idx,31,vl)) */
{
vuint32m8_t r;
r.s0=rdsum_output_lane(p,0,vl) /*@ where base=base,count=count,idx=idx,L=L */;
r.s1=rdsum_output_lane(p,1,vl) /*@ where base=base,count=count,idx=idx,L=L */;
r.s2=rdsum_output_lane(p,2,vl) /*@ where base=base,count=count,idx=idx,L=L */;
r.s3=rdsum_output_lane(p,3,vl) /*@ where base=base,count=count,idx=idx,L=L */;
r.s4=rdsum_output_lane(p,4,vl) /*@ where base=base,count=count,idx=idx,L=L */;
r.s5=rdsum_output_lane(p,5,vl) /*@ where base=base,count=count,idx=idx,L=L */;
r.s6=rdsum_output_lane(p,6,vl) /*@ where base=base,count=count,idx=idx,L=L */;
r.s7=rdsum_output_lane(p,7,vl) /*@ where base=base,count=count,idx=idx,L=L */;
r.s8=rdsum_output_lane(p,8,vl) /*@ where base=base,count=count,idx=idx,L=L */;
r.s9=rdsum_output_lane(p,9,vl) /*@ where base=base,count=count,idx=idx,L=L */;
r.s10=rdsum_output_lane(p,10,vl) /*@ where base=base,count=count,idx=idx,L=L */;
r.s11=rdsum_output_lane(p,11,vl) /*@ where base=base,count=count,idx=idx,L=L */;
r.s12=rdsum_output_lane(p,12,vl) /*@ where base=base,count=count,idx=idx,L=L */;
r.s13=rdsum_output_lane(p,13,vl) /*@ where base=base,count=count,idx=idx,L=L */;
r.s14=rdsum_output_lane(p,14,vl) /*@ where base=base,count=count,idx=idx,L=L */;
r.s15=rdsum_output_lane(p,15,vl) /*@ where base=base,count=count,idx=idx,L=L */;
r.s16=rdsum_output_lane(p,16,vl) /*@ where base=base,count=count,idx=idx,L=L */;
r.s17=rdsum_output_lane(p,17,vl) /*@ where base=base,count=count,idx=idx,L=L */;
r.s18=rdsum_output_lane(p,18,vl) /*@ where base=base,count=count,idx=idx,L=L */;
r.s19=rdsum_output_lane(p,19,vl) /*@ where base=base,count=count,idx=idx,L=L */;
r.s20=rdsum_output_lane(p,20,vl) /*@ where base=base,count=count,idx=idx,L=L */;
r.s21=rdsum_output_lane(p,21,vl) /*@ where base=base,count=count,idx=idx,L=L */;
r.s22=rdsum_output_lane(p,22,vl) /*@ where base=base,count=count,idx=idx,L=L */;
r.s23=rdsum_output_lane(p,23,vl) /*@ where base=base,count=count,idx=idx,L=L */;
r.s24=rdsum_output_lane(p,24,vl) /*@ where base=base,count=count,idx=idx,L=L */;
r.s25=rdsum_output_lane(p,25,vl) /*@ where base=base,count=count,idx=idx,L=L */;
r.s26=rdsum_output_lane(p,26,vl) /*@ where base=base,count=count,idx=idx,L=L */;
r.s27=rdsum_output_lane(p,27,vl) /*@ where base=base,count=count,idx=idx,L=L */;
r.s28=rdsum_output_lane(p,28,vl) /*@ where base=base,count=count,idx=idx,L=L */;
r.s29=rdsum_output_lane(p,29,vl) /*@ where base=base,count=count,idx=idx,L=L */;
r.s30=rdsum_output_lane(p,30,vl) /*@ where base=base,count=count,idx=idx,L=L */;
r.s31=rdsum_output_lane(p,31,vl) /*@ where base=base,count=count,idx=idx,L=L */;
return r;
}
