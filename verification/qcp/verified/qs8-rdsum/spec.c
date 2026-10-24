#include "shim/program_model.h"
void test_neon(size_t rows,size_t channels,const int8_t *input,size_t input_stride,const int8_t *zero,int32_t *output,const struct xnn_qs8_rsum_params *restrict params)
/*@ With (M:RDMap) (Init:list Z)
 Require 0<rows && rows<=18446744073709551615 && 0<channels && channels<=4611686018427387903 && 0<=input_stride && input_stride<=18446744073709551615 && input>0 && output>0 && rd_inputs(M,input,rows,channels,input_stride) && rd_zero_condition(M,zero,rows,channels) && rd_mem(M) * IntArray::full(output,channels,Init)
 Ensure rd_mem(M) * IntArray::full(output@pre,channels@pre,rd_results(M,input@pre,rows@pre,channels@pre,input_stride@pre,Init)) */;
void test_rvv(size_t rows,size_t channels,const int8_t *input,size_t input_stride,const int8_t *zero,int32_t *output,const struct xnn_qs8_rsum_params *restrict params)
/*@ With (M:RDMap) (Init:list Z)
 Require 0<rows && rows<=18446744073709551615 && 0<channels && channels<=4611686018427387903 && 0<=input_stride && input_stride<=18446744073709551615 && input>0 && output>0 && rd_inputs(M,input,rows,channels,input_stride) && rd_zero_condition(M,zero,rows,channels) && rd_mem(M) * IntArray::full(output,channels,Init)
 Ensure rd_mem(M) * IntArray::full(output@pre,channels@pre,rd_results(M,input@pre,rows@pre,channels@pre,input_stride@pre,Init)) */;
int equivalent(size_t rows,size_t channels,const int8_t *input,size_t input_stride,const int8_t *zero,int32_t *neon_output,int32_t *rvv_output,const struct xnn_qs8_rsum_params *restrict params)
/*@ With (M:RDMap) (Init:list Z)
 Require 0<rows && rows<=18446744073709551615 && 0<channels && channels<=4611686018427387903 && 0<=input_stride && input_stride<=18446744073709551615 && input>0 && neon_output>0 && rvv_output>0 && rd_inputs(M,input,rows,channels,input_stride) && rd_zero_condition(M,zero,rows,channels) && rd_mem(M) * IntArray::full(neon_output,channels,Init) * IntArray::full(rvv_output,channels,Init)
 Ensure __return==1 && rd_mem(M) * IntArray::full(neon_output@pre,channels@pre,rd_results(M,input@pre,rows@pre,channels@pre,input_stride@pre,Init)) * IntArray::full(rvv_output@pre,channels@pre,rd_results(M,input@pre,rows@pre,channels@pre,input_stride@pre,Init)) */
{
 test_neon(rows,channels,input,input_stride,zero,neon_output,params) /*@ where M=M,Init=Init */;
 test_rvv(rows,channels,input,input_stride,zero,rvv_output,params) /*@ where M=M,Init=Init */;
 return rdsum_equal_i32(channels,neon_output,rvv_output) /*@ where L=rd_results(M,input,rows,channels,input_stride,Init) */;
}
