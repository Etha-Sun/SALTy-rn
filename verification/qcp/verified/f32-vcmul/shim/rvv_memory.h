#ifndef QCP_VCMUL_RVV_MEMORY_H
#define QCP_VCMUL_RVV_MEMORY_H
#include "types.h"
#include "rvv_memory_def.h"
float qcp_vcmul_read_lane(const float *p,size_t i,size_t vl)
/*@ With (base:Z) (count:Z) (idx:Z) (L:list fp32)
 Require 0<=i && i<16 && 0<=vl && vl<=16 && 0<=idx && idx+vl<=count &&
 p==base+4*idx && FloatArray::full(base,count,L)
 Ensure same_fp32(__return,vcmul_read_lane_model(i,vl,idx,L)) && FloatArray::full(base,count,L) */;
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
 store(&(__return.s15),float,vcmul_read_lane_model(15,vl,idx,L)) */;
size_t __riscv_vsetvl_e32m4(size_t n)
/*@ Require emp Ensure __return==vcmul_vl16(n) && emp */;
#endif
