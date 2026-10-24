#include "output_vector.h"
int32_t rdsum_output_lane(const int32_t *p,size_t i,size_t vl)
/*@ With (base:Z) (count:Z) (idx:Z) (L:list Z)
 Require 0<=idx && 0<=i && i<32 && 0<=vl && vl<=32 && idx+vl<=count && p==base+idx*4 && IntArray::full(base,count,L)
 Ensure __return==rd_out_lane(L,idx,i,vl) && -2147483648<=__return && __return<=2147483647 && IntArray::full(base,count,L) */
{if(i<vl)return rdsum_get_i32(p,i) /*@ where base=base,count=count,idx=idx,L=L */;return 0;}
void rdsum_store_lane(int32_t *p,size_t i,int32_t value,size_t vl)
/*@ With (base:Z) (count:Z) (idx:Z) (L:list Z)
 Require 0<=idx && 0<=i && i<32 && 0<=vl && vl<=32 && idx+vl<=count && p==base+idx*4 && -2147483648<=value && value<=2147483647 && IntArray::full(base,count,L)
 Ensure IntArray::full(base,count,rd_store_lane(L,idx,i,value,vl)) */
{if(i<vl)rdsum_put_i32(p,i,value) /*@ where base=base,count=count,idx=idx,L=L */;}
