#ifdef QCP_FORMAL
#include "shim/program_model.h"
#else
#ifndef QS8_MUL_NATIVE_ISA_ARRAYS_H
#include "shim/public_types.h"
#endif
#endif
void test_neon(size_t batch,const int8_t *input_a,const int8_t *input_b,int8_t *output,const union xnn_qs8_mul_minmax_params *restrict params)
/*@ With (M:RDMap) (AZ:Z) (BZ:Z) (Scale:fp32) (OZ:Z) (Lo:Z) (Hi:Z)
 Require 0<batch && batch<=18446744073709551615 && input_a!=0 && input_b!=0 && output!=0 && params!=0 &&
 -128<=AZ && AZ<=127 && -128<=BZ && BZ<=127 && -32768<=OZ && OZ<=32767 &&
 -128<=Lo && Lo<=127 && -128<=Hi && Hi<=127 && qm_inputs(M,input_a,input_b,batch) &&
 rd_mem(M) * CharArray::undef_full(output,batch) * store(&(params->scalar.a_zero_point),char,AZ) * store(&(params->scalar.b_zero_point),char,BZ) * store(&(params->scalar.scale),float,Scale) * store(&(params->scalar.output_zero_point),short,OZ) * store(&(params->scalar.output_min),char,Lo) * store(&(params->scalar.output_max),char,Hi)
 Ensure rd_mem(M) * CharArray::full(output,batch,qm_values(batch,M,input_a,input_b,AZ,BZ,Scale,OZ,Lo,Hi)) * store(&(params->scalar.a_zero_point),char,AZ) * store(&(params->scalar.b_zero_point),char,BZ) * store(&(params->scalar.scale),float,Scale) * store(&(params->scalar.output_zero_point),short,OZ) * store(&(params->scalar.output_min),char,Lo) * store(&(params->scalar.output_max),char,Hi) */
;
void test_rvv(size_t batch,const int8_t *input_a,const int8_t *input_b,int8_t *output,const union xnn_qs8_mul_minmax_params *restrict params)
/*@ With (M:RDMap) (AZ:Z) (BZ:Z) (Scale:fp32) (OZ:Z) (Lo:Z) (Hi:Z)
 Require 0<batch && batch<=18446744073709551615 && input_a!=0 && input_b!=0 && output!=0 && params!=0 &&
 -128<=AZ && AZ<=127 && -128<=BZ && BZ<=127 && -32768<=OZ && OZ<=32767 &&
 -128<=Lo && Lo<=127 && -128<=Hi && Hi<=127 && qm_inputs(M,input_a,input_b,batch) &&
 rd_mem(M) * CharArray::undef_full(output,batch) * store(&(params->scalar.a_zero_point),char,AZ) * store(&(params->scalar.b_zero_point),char,BZ) * store(&(params->scalar.scale),float,Scale) * store(&(params->scalar.output_zero_point),short,OZ) * store(&(params->scalar.output_min),char,Lo) * store(&(params->scalar.output_max),char,Hi)
 Ensure rd_mem(M) * CharArray::full(output,batch,qm_values(batch,M,input_a,input_b,AZ,BZ,Scale,OZ,Lo,Hi)) * store(&(params->scalar.a_zero_point),char,AZ) * store(&(params->scalar.b_zero_point),char,BZ) * store(&(params->scalar.scale),float,Scale) * store(&(params->scalar.output_zero_point),short,OZ) * store(&(params->scalar.output_min),char,Lo) * store(&(params->scalar.output_max),char,Hi) */
;

int compare_outputs(size_t n,const int8_t *left,const int8_t *right)
/*@ With (L:list Z)
 Require 0<n && n<=18446744073709551615 &&
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

int equivalent(size_t n,const int8_t *input_a,const int8_t *input_b,int8_t *left,int8_t *right,const union xnn_qs8_mul_minmax_params *params)
/*@ With (M:RDMap) (AZ:Z) (BZ:Z) (Scale:fp32) (OZ:Z) (Lo:Z) (Hi:Z)
 Require 0<n && n<=18446744073709551615 && input_a!=0 && input_b!=0 && left!=0 && right!=0 && params!=0 &&
 -128<=AZ && AZ<=127 && -128<=BZ && BZ<=127 && -32768<=OZ && OZ<=32767 &&
 -128<=Lo && Lo<=127 && -128<=Hi && Hi<=127 && qm_inputs(M,input_a,input_b,n) &&
 rd_mem(M) * CharArray::undef_full(left,n) * CharArray::undef_full(right,n) * store(&(params->scalar.a_zero_point),char,AZ) * store(&(params->scalar.b_zero_point),char,BZ) * store(&(params->scalar.scale),float,Scale) * store(&(params->scalar.output_zero_point),short,OZ) * store(&(params->scalar.output_min),char,Lo) * store(&(params->scalar.output_max),char,Hi)
 Ensure __return==1 && rd_mem(M) * CharArray::full(left,n,qm_values(n,M,input_a,input_b,AZ,BZ,Scale,OZ,Lo,Hi)) * CharArray::full(right,n,qm_values(n,M,input_a,input_b,AZ,BZ,Scale,OZ,Lo,Hi)) * store(&(params->scalar.a_zero_point),char,AZ) * store(&(params->scalar.b_zero_point),char,BZ) * store(&(params->scalar.scale),float,Scale) * store(&(params->scalar.output_zero_point),short,OZ) * store(&(params->scalar.output_min),char,Lo) * store(&(params->scalar.output_max),char,Hi) */
{
 test_neon(n,input_a,input_b,left,params);
 test_rvv(n,input_a,input_b,right,params);
 return compare_outputs(n,left,right);
}
