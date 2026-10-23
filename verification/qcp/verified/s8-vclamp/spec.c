/* Public signed-byte clamp call/comparison entry.
 * Inputs: n>0 bytes and seven readable padding bytes; n writable output bytes.
 * Parameters retain all int32_t bit patterns: narrowed min may exceed max.
 * Partial correctness under LP64/little-endian C-shim contracts.
 */
#ifdef QCP_FORMAL
#include "shim/program_model.h"
#else
#include "shim/runtime.h"
#endif
void test_neon(size_t batch,const int8_t *input,int8_t *output,const struct xnn_s8_minmax_params *restrict params) XNN_OOB_READS
/*@ With (A:list Z) (RawLo:Z) (RawHi:Z)
 Require 0<batch && batch<=18446744073709551608 && input!=0 && output!=0 && params!=0 &&
 CharArray::full(input,batch+7,A) * CharArray::undef_full(output,batch) *
 store(&(params->scalar.min),int,RawLo) * store(&(params->scalar.max),int,RawHi)
 Ensure CharArray::full(input,batch+7,A) *
 CharArray::full(output,batch,s8_values(batch,s8_narrow(RawLo),s8_narrow(RawHi),A)) *
 store(&(params->scalar.min),int,RawLo) * store(&(params->scalar.max),int,RawHi) */;

void test_rvv(size_t batch,const int8_t *input,int8_t *output,const struct xnn_s8_minmax_params *restrict params) XNN_OOB_READS
/*@ With (A:list Z) (RawLo:Z) (RawHi:Z)
 Require 0<batch && batch<=18446744073709551608 && input!=0 && output!=0 && params!=0 &&
 CharArray::full(input,batch+7,A) * CharArray::undef_full(output,batch) *
 store(&(params->scalar.min),int,RawLo) * store(&(params->scalar.max),int,RawHi)
 Ensure CharArray::full(input,batch+7,A) *
 CharArray::full(output,batch,s8_values(batch,s8_narrow(RawLo),s8_narrow(RawHi),A)) *
 store(&(params->scalar.min),int,RawLo) * store(&(params->scalar.max),int,RawHi) */;

int compare_outputs(size_t n,const int8_t *left,const int8_t *right)
/*@ With (L:list Z) (R:list Z)
 Require 0<n && n<=18446744073709551608 && s8_outputs_related(L,R) &&
 CharArray::full(left,n,L) * CharArray::full(right,n,R)
 Ensure __return==1 && CharArray::full(left,n,L) * CharArray::full(right,n,R) */
{
  size_t i=0;
  while(i<n) {
    if(left[i]!=right[i])return 0;
    i++;
  }
  return 1;
}
int equivalent(size_t n,const int8_t *input,int8_t *left,int8_t *right,const struct xnn_s8_minmax_params *params)
/*@ With (A:list Z) (RawLo:Z) (RawHi:Z)
 Require 0<n && n<=18446744073709551608 && input!=0 && left!=0 && right!=0 && params!=0 &&
 CharArray::full(input,n+7,A) * CharArray::undef_full(left,n) * CharArray::undef_full(right,n) *
 store(&(params->scalar.min),int,RawLo) * store(&(params->scalar.max),int,RawHi)
 Ensure exists (L:list Z) (R:list Z), __return==1 && s8_outputs_related(L,R) &&
 CharArray::full(input,n+7,A) * CharArray::full(left,n,L) * CharArray::full(right,n,R) *
 store(&(params->scalar.min),int,RawLo) * store(&(params->scalar.max),int,RawHi) */
{
  test_neon(n,input,left,params);
  test_rvv(n,input,right,params);
  return compare_outputs(n,left,right);
}
