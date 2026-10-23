#include "shim/program_model.h"
void test_neon(size_t batch,const int8_t* input,int32_t* output,const struct xnn_qs8_rsum_params* restrict params)
/*@ With (A:list Z) (Init:Z) (Tag:Z) Require 0<batch && batch<=18446744073709551600 && input!=0 && output!=0 && params!=0 && -2147483648<=Init && Init<=2147483647 && CharArray::full(input,batch+15,A) * store(output,int,Init) * store(&(params->_),char,Tag) Ensure CharArray::full(input@pre,batch@pre+15,A) * store(output@pre,int,rs_s32(Init+rs_prefix(A,batch@pre))) * store(&(params@pre->_),char,Tag) */;
void test_rvv(size_t batch,const int8_t* input,int32_t* output,const struct xnn_qs8_rsum_params* restrict params)
/*@ With (A:list Z) (Init:Z) (Tag:Z) Require 0<batch && batch<=18446744073709551600 && input!=0 && output!=0 && params!=0 && -2147483648<=Init && Init<=2147483647 && CharArray::full(input,batch+15,A) * store(output,int,Init) * store(&(params->_),char,Tag) Ensure CharArray::full(input@pre,batch@pre+15,A) * store(output@pre,int,rs_s32(Init+rs_prefix(A,batch@pre))) * store(&(params@pre->_),char,Tag) */;
int equivalent(size_t batch,const int8_t* input,int32_t* neon_output,int32_t* rvv_output,const struct xnn_qs8_rsum_params* restrict params)
/*@ With (A:list Z) (Init:Z) (Tag:Z)
 Require 0<batch && batch<=18446744073709551600 && input!=0 && neon_output!=0 && rvv_output!=0 && params!=0 && -2147483648<=Init && Init<=2147483647 &&
 CharArray::full(input,batch+15,A) * store(neon_output,int,Init) * store(rvv_output,int,Init) * store(&(params->_),char,Tag)
 Ensure __return==1 && CharArray::full(input@pre,batch@pre+15,A) * store(neon_output@pre,int,rs_s32(Init+rs_prefix(A,batch@pre))) * store(rvv_output@pre,int,rs_s32(Init+rs_prefix(A,batch@pre))) * store(&(params@pre->_),char,Tag) */
{
 test_neon(batch,input,neon_output,params) /*@ where A=A,Init=Init,Tag=Tag */;
 test_rvv(batch,input,rvv_output,params) /*@ where A=A,Init=Init,Tag=Tag */;
 return *neon_output==*rvv_output;
}
