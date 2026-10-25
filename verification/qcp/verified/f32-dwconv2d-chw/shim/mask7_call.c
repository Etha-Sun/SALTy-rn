#include "intrinsic_mask_view.h"
uint32x4_t dw_mask7_call(const int32_t *p,size_t k)
/*@ Require 0<=k && k<=3 && store(p+0,int,-1) * store(p+1,int,-1) * store(p+2,int,-1) * store(p+3,int,-1) * store(p+4,int,0) * store(p+5,int,0) * store(p+6,int,0) Ensure store(p+0,int,-1) * store(p+1,int,-1) * store(p+2,int,-1) * store(p+3,int,-1) * store(p+4,int,0) * store(p+5,int,0) * store(p+6,int,0) * store(&(__return.s0),unsigned int,dw_mask7_word(k,0)) * store(&(__return.s1),unsigned int,dw_mask7_word(k,1)) * store(&(__return.s2),unsigned int,dw_mask7_word(k,2)) * store(&(__return.s3),unsigned int,dw_mask7_word(k,3)) */
{ return dw_isa_mask7((const uint32_t*)(p+k)) /*@ where base=p,index=k */; }
