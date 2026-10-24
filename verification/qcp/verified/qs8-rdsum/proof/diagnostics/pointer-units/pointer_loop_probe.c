#include "probe_model.h"
void rdsum_pointer_probe(size_t n,const int8_t *input,size_t stride,const int8_t *zero,int32_t *output)
/*@ With (M:RDMap) (Init:list Z)
 Require 0<n && n<=4611686018427387903 && input>0 && output>0 && zero>0 && 0<=stride && stride<=18446744073709551615 && rd_inputs(M,input,2,n,stride) && rd_present(M,zero) && rd_mem(M) * IntArray::full(output,n,Init)
 Ensure rd_mem(M) * IntArray::full(output@pre,n@pre,rd_probe_values(M,input@pre,n@pre,stride@pre,zero@pre,Init)) */
{
 /*@ Inv Assert 0<n@pre && n@pre<=4611686018427387903 && 0<=n && n<=n@pre && input@pre>0 && output@pre>0 && zero==zero@pre && zero>0 && stride==stride@pre && 0<=stride && stride<=18446744073709551615 && Zlength(Init)==n@pre && input==input@pre+(n@pre-n) && output==output@pre+(n@pre-n) && rd_inputs(M,input@pre,2,n@pre,stride@pre) && rd_present(M,zero) && rd_mem(M) * IntArray::full(output@pre,n@pre,rd_probe_partial(M,input@pre,n@pre,stride@pre,zero@pre,n@pre-n,Init)) */
 while(n>0){
  {
  int8_t a=rdsum_read_byte(input) /*@ where M=M */;
  const int8_t *next=(const int8_t*)((uintptr_t)input+stride);
  int8_t b=rdsum_read_byte(next) /*@ where M=M */;
  int8_t z=rdsum_read_byte(zero) /*@ where M=M */;
  int32_t old=rdsum_get_i32(output,0) /*@ where base=output@pre,count=n@pre,idx=n@pre-n,L=rd_probe_partial(M,input@pre,n@pre,stride@pre,zero@pre,n@pre-n,Init) */;
  int32_t value=rsum_add_s32(old,(int32_t)a+(int32_t)b+(int32_t)z);
  rdsum_put_i32(output,0,value) /*@ where base=output@pre,count=n@pre,idx=n@pre-n,L=rd_probe_partial(M,input@pre,n@pre,stride@pre,zero@pre,n@pre-n,Init) */;
  }
  /*@ Assert 0<n@pre && n@pre<=4611686018427387903 && 0<n && n<=n@pre && input@pre>0 && output@pre>0 && zero==zero@pre && zero>0 && stride==stride@pre && 0<=stride && stride<=18446744073709551615 && Zlength(Init)==n@pre && input==input@pre+(n@pre-n) && output==output@pre+(n@pre-n) && rd_inputs(M,input@pre,2,n@pre,stride@pre) && rd_present(M,zero) && rd_mem(M) * IntArray::full(output@pre,n@pre,rd_probe_partial(M,input@pre,n@pre,stride@pre,zero@pre,n@pre-n+1,Init)) */
  output++;
  input++;
  n--;
 }
}

/* Exact scalar tail cast from the repaired signed NEON implementation. */
void rdsum_scalar_tail_probe(int32_t *output,int32_t value)
/*@ With (Init:Z)
 Require output!=0 && -2147483648<=Init && Init<=2147483647 && -2147483648<=value && value<=2147483647 && store(output,int,Init)
 Ensure store(output,int,rs_s32(Init+value)) */
{
 *output=(int32_t)((uint32_t)*output+(uint32_t)value);
}
