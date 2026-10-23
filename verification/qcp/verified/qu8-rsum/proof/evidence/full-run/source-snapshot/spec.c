#include "shim/program_model.h"
void test_neon(size_t batch,const uint8_t* input,uint32_t* output,const struct xnn_qs8_rsum_params* restrict params)
/*@ With (A:list Z) (Init:Z) (Tag:Z) Require 0<batch && batch<=18446744073709551600 && input!=0 && output!=0 && params!=0 && 0<=Init && Init<=4294967295 && UCharArray::full(input,batch+15,A) * store(output,unsigned int,Init) * store(&(params->_),char,Tag) Ensure UCharArray::full(input@pre,batch@pre+15,A) * store(output@pre,unsigned int,rs_u32(Init+rs_prefix(A,batch@pre))) * store(&(params@pre->_),char,Tag) */;
void test_rvv(size_t batch,const uint8_t* input,uint32_t* output,const struct xnn_qs8_rsum_params* restrict params)
/*@ With (A:list Z) (Init:Z) (Tag:Z) Require 0<batch && batch<=18446744073709551600 && input!=0 && output!=0 && params!=0 && 0<=Init && Init<=4294967295 && UCharArray::full(input,batch+15,A) * store(output,unsigned int,Init) * store(&(params->_),char,Tag) Ensure UCharArray::full(input@pre,batch@pre+15,A) * store(output@pre,unsigned int,rs_u32(Init+rs_prefix(A,batch@pre))) * store(&(params@pre->_),char,Tag) */;
int equivalent(size_t batch,const uint8_t* input,uint32_t* neon_output,uint32_t* rvv_output,const struct xnn_qs8_rsum_params* restrict params)
/*@ With (A:list Z) (Init:Z) (Tag:Z)
 Require 0<batch && batch<=18446744073709551600 && input!=0 && neon_output!=0 && rvv_output!=0 && params!=0 && 0<=Init && Init<=4294967295 &&
 UCharArray::full(input,batch+15,A) * store(neon_output,unsigned int,Init) * store(rvv_output,unsigned int,Init) * store(&(params->_),char,Tag)
 Ensure __return==1 && UCharArray::full(input@pre,batch@pre+15,A) * store(neon_output@pre,unsigned int,rs_u32(Init+rs_prefix(A,batch@pre))) * store(rvv_output@pre,unsigned int,rs_u32(Init+rs_prefix(A,batch@pre))) * store(&(params@pre->_),char,Tag) */
{
 test_neon(batch,input,neon_output,params) /*@ where A=A,Init=Init,Tag=Tag */;
 test_rvv(batch,input,rvv_output,params) /*@ where A=A,Init=Init,Tag=Tag */;
 return *neon_output==*rvv_output;
}
