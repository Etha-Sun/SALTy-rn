/* Repaired QS8 Leaky-ReLU. All four raw int32 parameters are accepted.
 * Positive byte count with seven initialized readable padding bytes; disjoint
 * input/output/parameter resources. Fixed C-shim partial correctness only. */
#ifdef QCP_FORMAL
#include "shim/program_model.h"
#else
#include "shim/runtime.h"
#endif
/*@ Import Coq Require Import Qs8Lrelu.ProgramModel */

void test_neon(size_t batch,const int8_t *input,int8_t *output,
 const struct xnn_qs8_lrelu_params *restrict params)
/*@ With (A:list Z) (RawZ:Z) (PM:Z) (NM:Z) (O:Z)
 Require 0<batch && batch<=18446744073709551608 &&
 input!=0 && output!=0 && params!=0 && (-2147483647-1)<=RawZ && RawZ<=2147483647 && (-2147483647-1)<=PM && PM<=2147483647 && (-2147483647-1)<=NM && NM<=2147483647 && (-2147483647-1)<=O && O<=2147483647 &&
 CharArray::full(input,batch+7,A) * CharArray::undef_full(output,batch) *
 store(&(params->scalar.input_zero_point),int,RawZ) * store(&(params->scalar.positive_multiplier),int,PM) * store(&(params->scalar.negative_multiplier),int,NM) * store(&(params->scalar.output_zero_point),int,O)
 Ensure CharArray::full(input,batch+7,A) * CharArray::full(output,batch,qlr_values(batch,RawZ,PM,NM,O,A)) *
 store(&(params->scalar.input_zero_point),int,RawZ) * store(&(params->scalar.positive_multiplier),int,PM) * store(&(params->scalar.negative_multiplier),int,NM) * store(&(params->scalar.output_zero_point),int,O) */;

void test_rvv(size_t batch,const int8_t *input,int8_t *output,
 const struct xnn_qs8_lrelu_params *restrict params)
/*@ With (A:list Z) (RawZ:Z) (PM:Z) (NM:Z) (O:Z)
 Require 0<batch && batch<=18446744073709551608 &&
 input!=0 && output!=0 && params!=0 && (-2147483647-1)<=RawZ && RawZ<=2147483647 && (-2147483647-1)<=PM && PM<=2147483647 && (-2147483647-1)<=NM && NM<=2147483647 && (-2147483647-1)<=O && O<=2147483647 &&
 CharArray::full(input,batch+7,A) * CharArray::undef_full(output,batch) *
 store(&(params->scalar.input_zero_point),int,RawZ) * store(&(params->scalar.positive_multiplier),int,PM) * store(&(params->scalar.negative_multiplier),int,NM) * store(&(params->scalar.output_zero_point),int,O)
 Ensure CharArray::full(input,batch+7,A) * CharArray::full(output,batch,qlr_values(batch,RawZ,PM,NM,O,A)) *
 store(&(params->scalar.input_zero_point),int,RawZ) * store(&(params->scalar.positive_multiplier),int,PM) * store(&(params->scalar.negative_multiplier),int,NM) * store(&(params->scalar.output_zero_point),int,O) */;

int compare_outputs(size_t n,const int8_t *left,const int8_t *right)
/*@ With (L:list Z)
 Require 0<n && n<=18446744073709551608 &&
 CharArray::full(left,n,L) * CharArray::full(right,n,L)
 Ensure __return==1 && CharArray::full(left,n,L) * CharArray::full(right,n,L) */
{
 size_t i=0;
 while(i<n){
  if(left[i]!=right[i])return 0;
  i++;
 }
 return 1;
}
int equivalent(size_t n,const int8_t *input,int8_t *left,int8_t *right,
 const struct xnn_qs8_lrelu_params *params)
/*@ With (A:list Z) (RawZ:Z) (PM:Z) (NM:Z) (O:Z)
 Require 0<n && n<=18446744073709551608 &&
 input!=0 && left!=0 && right!=0 && params!=0 && (-2147483647-1)<=RawZ && RawZ<=2147483647 && (-2147483647-1)<=PM && PM<=2147483647 && (-2147483647-1)<=NM && NM<=2147483647 && (-2147483647-1)<=O && O<=2147483647 &&
 CharArray::full(input,n+7,A) * CharArray::undef_full(left,n) * CharArray::undef_full(right,n) *
 store(&(params->scalar.input_zero_point),int,RawZ) * store(&(params->scalar.positive_multiplier),int,PM) * store(&(params->scalar.negative_multiplier),int,NM) * store(&(params->scalar.output_zero_point),int,O)
 Ensure __return==1 &&
 CharArray::full(input,n+7,A) *
 CharArray::full(left,n,qlr_values(n,RawZ,PM,NM,O,A)) * CharArray::full(right,n,qlr_values(n,RawZ,PM,NM,O,A)) *
 store(&(params->scalar.input_zero_point),int,RawZ) * store(&(params->scalar.positive_multiplier),int,PM) * store(&(params->scalar.negative_multiplier),int,NM) * store(&(params->scalar.output_zero_point),int,O) */
{
 test_neon(n,input,left,params);
 test_rvv(n,input,right,params);
 return compare_outputs(n,left,right);
}
