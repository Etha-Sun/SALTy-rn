/* Repaired signed-byte requantization. Full signed16 zero points and full
 * signed32 multiplier, including INT32_MIN; no order or positivity assumption.
 * Positive byte count, seven readable padding bytes, separate output objects.
 * Partial correctness under the C-shim semantics in proof/semantics.json.
 */
#ifdef QCP_FORMAL
#include "shim/program_model.h"
#else
#include "shim/runtime.h"
#endif
/*@ Import Coq Require Import Qs8I8Cvt.ProgramModel */

void test_neon(size_t batch,const int8_t *input,int8_t *output,
 const struct xnn_qs8_cvt_params *restrict params)
/*@ With (A:list Z) (RawZ:Z) (M:Z) (O:Z)
 Require 0<batch && batch<=18446744073709551608 &&
 input!=0 && output!=0 && params!=0 && (-32768)<=RawZ && RawZ<=32767 && (-2147483647-1)<=M && M<=2147483647 && (-32768)<=O && O<=32767 &&
 CharArray::full(input,batch+7,A) * CharArray::undef_full(output,batch) *
 store(&(params->scalar.input_zero_point),short,RawZ) * store(&(params->scalar.multiplier),int,M) * store(&(params->scalar.output_zero_point),short,O)
 Ensure CharArray::full(input,batch+7,A) * CharArray::full(output,batch,qcv_values(batch,RawZ,M,O,A)) *
 store(&(params->scalar.input_zero_point),short,RawZ) * store(&(params->scalar.multiplier),int,M) * store(&(params->scalar.output_zero_point),short,O) */;

void test_rvv(size_t batch,const int8_t *input,int8_t *output,
 const struct xnn_qs8_cvt_params *restrict params)
/*@ With (A:list Z) (RawZ:Z) (M:Z) (O:Z)
 Require 0<batch && batch<=18446744073709551608 &&
 input!=0 && output!=0 && params!=0 && (-32768)<=RawZ && RawZ<=32767 && (-2147483647-1)<=M && M<=2147483647 && (-32768)<=O && O<=32767 &&
 CharArray::full(input,batch+7,A) * CharArray::undef_full(output,batch) *
 store(&(params->scalar.input_zero_point),short,RawZ) * store(&(params->scalar.multiplier),int,M) * store(&(params->scalar.output_zero_point),short,O)
 Ensure CharArray::full(input,batch+7,A) * CharArray::full(output,batch,qcv_values(batch,RawZ,M,O,A)) *
 store(&(params->scalar.input_zero_point),short,RawZ) * store(&(params->scalar.multiplier),int,M) * store(&(params->scalar.output_zero_point),short,O) */;

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
 const struct xnn_qs8_cvt_params *params)
/*@ With (A:list Z) (RawZ:Z) (M:Z) (O:Z)
 Require 0<n && n<=18446744073709551608 &&
 input!=0 && left!=0 && right!=0 && params!=0 && (-32768)<=RawZ && RawZ<=32767 && (-2147483647-1)<=M && M<=2147483647 && (-32768)<=O && O<=32767 &&
 CharArray::full(input,n+7,A) * CharArray::undef_full(left,n) * CharArray::undef_full(right,n) *
 store(&(params->scalar.input_zero_point),short,RawZ) * store(&(params->scalar.multiplier),int,M) * store(&(params->scalar.output_zero_point),short,O)
 Ensure __return==1 &&
 CharArray::full(input,n+7,A) *
 CharArray::full(left,n,qcv_values(n,RawZ,M,O,A)) * CharArray::full(right,n,qcv_values(n,RawZ,M,O,A)) *
 store(&(params->scalar.input_zero_point),short,RawZ) * store(&(params->scalar.multiplier),int,M) * store(&(params->scalar.output_zero_point),short,O) */
{
 test_neon(n,input,left,params);
 test_rvv(n,input,right,params);
 return compare_outputs(n,left,right);
}
