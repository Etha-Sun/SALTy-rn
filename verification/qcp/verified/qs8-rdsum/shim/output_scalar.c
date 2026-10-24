#include "output_model.h"
int32_t rdsum_get_i32(const int32_t *p,size_t i)
/*@ With (base:Z) (count:Z) (idx:Z) (L:list Z)
 Require 0<=idx && 0<=i && idx+i<count && p==base+idx*4 && IntArray::full(base,count,L)
 Ensure __return==L[idx+i] && -2147483648<=__return && __return<=2147483647 && IntArray::full(base,count,L) */
{
 /*@ Assert p==p@pre && i==i@pre && p==base+idx*4 && 0<=idx && 0<=i && idx+i<count && IntArray::missing_i(base,idx+i,0,count,L) * store(pointer_offset(p,i,int),int,L[idx+i]) */
 int32_t value=p[i];
 /*@ Assert p==p@pre && i==i@pre && p==base+idx*4 && 0<=idx && 0<=i && idx+i<count && -2147483648<=L[idx+i] && L[idx+i]<=2147483647 && IntArray::full(base,count,L) * store(&value,int,L[idx+i]) */
 return value;
}
void rdsum_put_i32(int32_t *p,size_t i,int32_t v)
/*@ With (base:Z) (count:Z) (idx:Z) (L:list Z)
 Require 0<=idx && 0<=i && idx+i<count && p==base+idx*4 && -2147483648<=v && v<=2147483647 && IntArray::full(base,count,L)
 Ensure IntArray::full(base,count,replace_Znth(idx+i,v,L)) */
{
 /*@ Assert p==p@pre && i==i@pre && v==v@pre && p==base+idx*4 && 0<=idx && 0<=i && idx+i<count && -2147483648<=v && v<=2147483647 && IntArray::missing_i(base,idx+i,0,count,L) * store(pointer_offset(p,i,int),int,L[idx+i]) */
 p[i]=v;
 /*@ Assert p==p@pre && i==i@pre && v==v@pre && p==base+idx*4 && 0<=idx && 0<=i && idx+i<count && IntArray::full(base,count,replace_Znth(idx+i,v,L)) */
}
