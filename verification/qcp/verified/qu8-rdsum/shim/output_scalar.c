#include "output_model.h"
uint32_t rdsum_get_i32(const uint32_t *p,size_t i)
/*@ With (base:Z) (count:Z) (idx:Z) (L:list Z)
 Require 0<=idx && 0<=i && idx+i<count && p==base+idx*4 && UIntArray::full(base,count,L)
 Ensure __return==L[idx+i] && 0<=__return && __return<=4294967295 && UIntArray::full(base,count,L) */
{
 /*@ Assert p==p@pre && i==i@pre && p==base+idx*4 && 0<=idx && 0<=i && idx+i<count && UIntArray::missing_i(base,idx+i,0,count,L) * store(pointer_offset(p,i,unsigned int),unsigned int,L[idx+i]) */
 uint32_t value=p[i];
 /*@ Assert p==p@pre && i==i@pre && p==base+idx*4 && 0<=idx && 0<=i && idx+i<count && 0<=L[idx+i] && L[idx+i]<=4294967295 && UIntArray::full(base,count,L) * store(&value,unsigned int,L[idx+i]) */
 return value;
}
void rdsum_put_i32(uint32_t *p,size_t i,uint32_t v)
/*@ With (base:Z) (count:Z) (idx:Z) (L:list Z)
 Require 0<=idx && 0<=i && idx+i<count && p==base+idx*4 && 0<=v && v<=4294967295 && UIntArray::full(base,count,L)
 Ensure UIntArray::full(base,count,replace_Znth(idx+i,v,L)) */
{
 /*@ Assert p==p@pre && i==i@pre && v==v@pre && p==base+idx*4 && 0<=idx && 0<=i && idx+i<count && 0<=v && v<=4294967295 && UIntArray::missing_i(base,idx+i,0,count,L) * store(pointer_offset(p,i,unsigned int),unsigned int,L[idx+i]) */
 p[i]=v;
 /*@ Assert p==p@pre && i==i@pre && v==v@pre && p==base+idx*4 && 0<=idx && 0<=i && idx+i<count && UIntArray::full(base,count,replace_Znth(idx+i,v,L)) */
}
