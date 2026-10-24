/* Repaired unsigned-byte quantized addition. The arbitrary bias field is
 * preserved but unused, matching both actual source bodies. Signed low-byte
 * shift control, all raw int32 parameters and unordered uint8 bounds.
 * Partial correctness under the declared C-shim model; seven padded bytes
 * per input; separate objects are expressed by the separating conjunction. */
#ifdef QCP_FORMAL
#include "shim/program_model.h"
#else
#include "shim/runtime.h"
#endif
/*@ Import Coq Require Import Qu8Add.ProgramModel */

void test_neon(size_t batch,const uint8_t *input_a,const uint8_t *input_b,uint8_t *output,const struct xnn_qu8_add_minmax_params *restrict params)
/*@ With (A:list Z) (B:list Z) (Az:Z) (Bz:Z) (RawBias:Z) (Ma:Z) (Mb:Z) (RawShift:Z) (Oz:Z) (Lo:Z) (Hi:Z)
 Require 0<batch && batch<=18446744073709551608 && input_a!=0 && input_b!=0 && output!=0 && params!=0 && (0)<=Az && Az<=255 && (0)<=Bz && Bz<=255 && (-2147483648)<=RawBias && RawBias<=2147483647 && (-2147483648)<=Ma && Ma<=2147483647 && (-2147483648)<=Mb && Mb<=2147483647 && (-2147483648)<=RawShift && RawShift<=2147483647 && (-32768)<=Oz && Oz<=32767 && (0)<=Lo && Lo<=255 && (0)<=Hi && Hi<=255 &&
 UCharArray::full(input_a,batch+7,A) * UCharArray::full(input_b,batch+7,B) * UCharArray::undef_full(output,batch) * store(&(params->scalar.a_zero_point),unsigned char,Az) * store(&(params->scalar.b_zero_point),unsigned char,Bz) * store(&(params->scalar.bias),int,RawBias) * store(&(params->scalar.a_multiplier),int,Ma) * store(&(params->scalar.b_multiplier),int,Mb) * store(&(params->scalar.shift),int,RawShift) * store(&(params->scalar.output_zero_point),short,Oz) * store(&(params->scalar.output_min),unsigned char,Lo) * store(&(params->scalar.output_max),unsigned char,Hi)
 Ensure UCharArray::full(input_a,batch+7,A) * UCharArray::full(input_b,batch+7,B) * UCharArray::full(output,batch,qu_values(batch,Az,Bz,Ma,Mb,RawShift,Oz,Lo,Hi,A,B)) * store(&(params->scalar.a_zero_point),unsigned char,Az) * store(&(params->scalar.b_zero_point),unsigned char,Bz) * store(&(params->scalar.bias),int,RawBias) * store(&(params->scalar.a_multiplier),int,Ma) * store(&(params->scalar.b_multiplier),int,Mb) * store(&(params->scalar.shift),int,RawShift) * store(&(params->scalar.output_zero_point),short,Oz) * store(&(params->scalar.output_min),unsigned char,Lo) * store(&(params->scalar.output_max),unsigned char,Hi) */;

void test_rvv(size_t batch,const uint8_t *input_a,const uint8_t *input_b,uint8_t *output,const struct xnn_qu8_add_minmax_params *restrict params)
/*@ With (A:list Z) (B:list Z) (Az:Z) (Bz:Z) (RawBias:Z) (Ma:Z) (Mb:Z) (RawShift:Z) (Oz:Z) (Lo:Z) (Hi:Z)
 Require 0<batch && batch<=18446744073709551608 && input_a!=0 && input_b!=0 && output!=0 && params!=0 && (0)<=Az && Az<=255 && (0)<=Bz && Bz<=255 && (-2147483648)<=RawBias && RawBias<=2147483647 && (-2147483648)<=Ma && Ma<=2147483647 && (-2147483648)<=Mb && Mb<=2147483647 && (-2147483648)<=RawShift && RawShift<=2147483647 && (-32768)<=Oz && Oz<=32767 && (0)<=Lo && Lo<=255 && (0)<=Hi && Hi<=255 &&
 UCharArray::full(input_a,batch+7,A) * UCharArray::full(input_b,batch+7,B) * UCharArray::undef_full(output,batch) * store(&(params->scalar.a_zero_point),unsigned char,Az) * store(&(params->scalar.b_zero_point),unsigned char,Bz) * store(&(params->scalar.bias),int,RawBias) * store(&(params->scalar.a_multiplier),int,Ma) * store(&(params->scalar.b_multiplier),int,Mb) * store(&(params->scalar.shift),int,RawShift) * store(&(params->scalar.output_zero_point),short,Oz) * store(&(params->scalar.output_min),unsigned char,Lo) * store(&(params->scalar.output_max),unsigned char,Hi)
 Ensure UCharArray::full(input_a,batch+7,A) * UCharArray::full(input_b,batch+7,B) * UCharArray::full(output,batch,qu_values(batch,Az,Bz,Ma,Mb,RawShift,Oz,Lo,Hi,A,B)) * store(&(params->scalar.a_zero_point),unsigned char,Az) * store(&(params->scalar.b_zero_point),unsigned char,Bz) * store(&(params->scalar.bias),int,RawBias) * store(&(params->scalar.a_multiplier),int,Ma) * store(&(params->scalar.b_multiplier),int,Mb) * store(&(params->scalar.shift),int,RawShift) * store(&(params->scalar.output_zero_point),short,Oz) * store(&(params->scalar.output_min),unsigned char,Lo) * store(&(params->scalar.output_max),unsigned char,Hi) */;

int compare_outputs(size_t n,const uint8_t *left,const uint8_t *right)
/*@ With (L:list Z)
 Require 0<n && n<=18446744073709551608 && UCharArray::full(left,n,L) * UCharArray::full(right,n,L)
 Ensure __return==1 && UCharArray::full(left,n,L) * UCharArray::full(right,n,L) */
{
 size_t i=0;
 while(i<n){
  if(left[i]!=right[i])return 0;
  i++;
 }
 return 1;
}
int equivalent(size_t n,const uint8_t *input_a,const uint8_t *input_b,uint8_t *left,uint8_t *right,const struct xnn_qu8_add_minmax_params *params)
/*@ With (A:list Z) (B:list Z) (Az:Z) (Bz:Z) (RawBias:Z) (Ma:Z) (Mb:Z) (RawShift:Z) (Oz:Z) (Lo:Z) (Hi:Z)
 Require 0<n && n<=18446744073709551608 && input_a!=0 && input_b!=0 && left!=0 && right!=0 && params!=0 && (0)<=Az && Az<=255 && (0)<=Bz && Bz<=255 && (-2147483648)<=RawBias && RawBias<=2147483647 && (-2147483648)<=Ma && Ma<=2147483647 && (-2147483648)<=Mb && Mb<=2147483647 && (-2147483648)<=RawShift && RawShift<=2147483647 && (-32768)<=Oz && Oz<=32767 && (0)<=Lo && Lo<=255 && (0)<=Hi && Hi<=255 &&
 UCharArray::full(input_a,n+7,A) * UCharArray::full(input_b,n+7,B) * UCharArray::undef_full(left,n) * UCharArray::undef_full(right,n) * store(&(params->scalar.a_zero_point),unsigned char,Az) * store(&(params->scalar.b_zero_point),unsigned char,Bz) * store(&(params->scalar.bias),int,RawBias) * store(&(params->scalar.a_multiplier),int,Ma) * store(&(params->scalar.b_multiplier),int,Mb) * store(&(params->scalar.shift),int,RawShift) * store(&(params->scalar.output_zero_point),short,Oz) * store(&(params->scalar.output_min),unsigned char,Lo) * store(&(params->scalar.output_max),unsigned char,Hi)
 Ensure __return==1 && UCharArray::full(input_a,n+7,A) * UCharArray::full(input_b,n+7,B) * UCharArray::full(left,n,qu_values(n,Az,Bz,Ma,Mb,RawShift,Oz,Lo,Hi,A,B)) * UCharArray::full(right,n,qu_values(n,Az,Bz,Ma,Mb,RawShift,Oz,Lo,Hi,A,B)) * store(&(params->scalar.a_zero_point),unsigned char,Az) * store(&(params->scalar.b_zero_point),unsigned char,Bz) * store(&(params->scalar.bias),int,RawBias) * store(&(params->scalar.a_multiplier),int,Ma) * store(&(params->scalar.b_multiplier),int,Mb) * store(&(params->scalar.shift),int,RawShift) * store(&(params->scalar.output_zero_point),short,Oz) * store(&(params->scalar.output_min),unsigned char,Lo) * store(&(params->scalar.output_max),unsigned char,Hi) */
{
 test_neon(n,input_a,input_b,left,params);
 test_rvv(n,input_a,input_b,right,params);
 return compare_outputs(n,left,right);
}
