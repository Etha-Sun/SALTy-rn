#ifndef QCP_S8_RVV_MEMORY_H
#define QCP_S8_RVV_MEMORY_H
#include "rvv_model.h"
int8_t qcp_s8_read_lane(const int8_t *p,size_t i,size_t vl)
/*@ With (base:Z) (count:Z) (idx:Z) (L:list Z)
 Require 0<=i && i<128 && 0<=vl && vl<=128 && 0<=idx && idx+vl<=count && p==base+idx && CharArray::full(base,count,L)
 Ensure __return==s8_read_lane(i,vl,idx,L) && CharArray::full(base,count,L) */;
#define __riscv_vse8_v_i8m8(p,a,vl) qcp_s8_rvv_store128((p),&(a),(vl))
#endif
