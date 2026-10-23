#include "rvv_memory.h"
float qcp_vcmul_read_lane(const float *p,size_t i,size_t vl)
/*@ With (base:Z) (count:Z) (idx:Z) (L:list fp32)
 Require 0<=i && i<16 && 0<=vl && vl<=16 && 0<=idx && idx+vl<=count &&
 p==base+4*idx && FloatArray::full(base,count,L)
 Ensure same_fp32(__return,vcmul_read_lane_model(i,vl,idx,L)) && FloatArray::full(base,count,L) */
{
 if(i<vl){
  /*@ Assert p==p@pre && i==i@pre && vl==vl@pre &&
  0<=i && i<16 && 0<=vl && vl<=16 && i<vl && 0<=idx && idx+vl<=count && p==base+4*idx &&
  FloatArray::missing_i(base,idx+i,0,count,L) * store(pointer_offset(p,i,float),float,L[idx+i]) */
  float value=p[i];
  /*@ Assert p==p@pre && i==i@pre && vl==vl@pre &&
  0<=i && i<16 && 0<=vl && vl<=16 && i<vl && 0<=idx && idx+vl<=count && p==base+4*idx &&
  FloatArray::full(base,count,L) * store(&value,float,L[idx+i]) */
  return value;
 }
 return 0.0f;
}
vfloat32m4_t qcp_vcmul_load16(const float *p,size_t vl)
/*@ With (base:Z) (count:Z) (idx:Z) (L:list fp32)
 Require 0<=vl && vl<=16 && 0<=idx && idx+vl<=count && p==base+4*idx && FloatArray::full(base,count,L)
 Ensure FloatArray::full(base,count,L) *
 store(&(__return.s0),float,vcmul_read_lane_model(0,vl,idx,L)) *
 store(&(__return.s1),float,vcmul_read_lane_model(1,vl,idx,L)) *
 store(&(__return.s2),float,vcmul_read_lane_model(2,vl,idx,L)) *
 store(&(__return.s3),float,vcmul_read_lane_model(3,vl,idx,L)) *
 store(&(__return.s4),float,vcmul_read_lane_model(4,vl,idx,L)) *
 store(&(__return.s5),float,vcmul_read_lane_model(5,vl,idx,L)) *
 store(&(__return.s6),float,vcmul_read_lane_model(6,vl,idx,L)) *
 store(&(__return.s7),float,vcmul_read_lane_model(7,vl,idx,L)) *
 store(&(__return.s8),float,vcmul_read_lane_model(8,vl,idx,L)) *
 store(&(__return.s9),float,vcmul_read_lane_model(9,vl,idx,L)) *
 store(&(__return.s10),float,vcmul_read_lane_model(10,vl,idx,L)) *
 store(&(__return.s11),float,vcmul_read_lane_model(11,vl,idx,L)) *
 store(&(__return.s12),float,vcmul_read_lane_model(12,vl,idx,L)) *
 store(&(__return.s13),float,vcmul_read_lane_model(13,vl,idx,L)) *
 store(&(__return.s14),float,vcmul_read_lane_model(14,vl,idx,L)) *
 store(&(__return.s15),float,vcmul_read_lane_model(15,vl,idx,L)) */
{
 vfloat32m4_t r;
 r.s0=qcp_vcmul_read_lane(p,0,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s1=qcp_vcmul_read_lane(p,1,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s2=qcp_vcmul_read_lane(p,2,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s3=qcp_vcmul_read_lane(p,3,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s4=qcp_vcmul_read_lane(p,4,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s5=qcp_vcmul_read_lane(p,5,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s6=qcp_vcmul_read_lane(p,6,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s7=qcp_vcmul_read_lane(p,7,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s8=qcp_vcmul_read_lane(p,8,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s9=qcp_vcmul_read_lane(p,9,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s10=qcp_vcmul_read_lane(p,10,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s11=qcp_vcmul_read_lane(p,11,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s12=qcp_vcmul_read_lane(p,12,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s13=qcp_vcmul_read_lane(p,13,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s14=qcp_vcmul_read_lane(p,14,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 r.s15=qcp_vcmul_read_lane(p,15,vl) /*@ where base=base,count=count,idx=idx,L=L */;
 return r;
}
size_t __riscv_vsetvl_e32m4(size_t n)
/*@ Require emp Ensure __return==vcmul_vl16(n) && emp */
{ return n<16?n:16; }
