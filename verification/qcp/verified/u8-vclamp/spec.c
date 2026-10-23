typedef unsigned long long size_t;
typedef unsigned char uint8_t;
typedef unsigned int uint32_t;
struct xnn_u8_minmax_params {struct {uint32_t min;uint32_t max;} scalar;};
/*@ Import Coq Require Import FullU8.U8Logic FullU8.U8KernelLogic */
/*@ Extern Coq (UCharArray::full:Z->Z->list Z->Assertion) (UCharArray::seg:Z->Z->Z->list Z->Assertion)
 (UCharArray::undef_full:Z->Z->Assertion) (UCharArray::undef_seg:Z->Z->Z->Assertion)
 (u8_prefix_n:Z->Z) (u8_prefix_list:Z->Z->list Z->list Z) (u8_suffix_list:Z->Z->list Z->list Z)
 (u8_phase_all:Z->Z->Z->list Z->list Z) (u8_bound:Z->Z) */
/*@ include strategies "arrays.strategies" */
/* Modular declarations correspond to the preserved original definitions.
   Their implementation VC closures remain mandatory; declarations alone are not proof. */
void test_neon(size_t batch,const uint8_t*input,uint8_t*output,const struct xnn_u8_minmax_params*restrict params)
/*@ With (A:list Z) (lo:Z) (hi:Z)
 Require 0<batch && batch<=18446744073709551608 && input!=0 && output!=0 && params!=0 &&
 UCharArray::full(input,batch+7,A) * UCharArray::undef_full(output,batch) *
 store(&(params->scalar.min),unsigned int,lo) * store(&(params->scalar.max),unsigned int,hi)
 Ensure UCharArray::full(input@pre,batch@pre+7,A) *
 UCharArray::full(output@pre,batch@pre,u8_phase_all(batch@pre,u8_bound(lo),u8_bound(hi),A)) *
 store(&(params->scalar.min),unsigned int,lo) * store(&(params->scalar.max),unsigned int,hi) */;
void test_rvv(size_t batch,const uint8_t*input,uint8_t*output,const struct xnn_u8_minmax_params*params)
/*@ With (A:list Z) (lo:Z) (hi:Z)
 Require 0<batch && batch<=18446744073709551608 && input!=0 && output!=0 && params!=0 &&
 UCharArray::full(input,batch+7,A) * UCharArray::undef_full(output,batch) *
 store(&(params->scalar.min),unsigned int,lo) * store(&(params->scalar.max),unsigned int,hi)
 Ensure UCharArray::full(input@pre,batch@pre+7,A) *
 UCharArray::full(output@pre,batch@pre,u8_phase_all(batch@pre,u8_bound(lo),u8_bound(hi),A)) *
 store(&(params->scalar.min),unsigned int,lo) * store(&(params->scalar.max),unsigned int,hi) */;
int equivalent(size_t n,const uint8_t*input,uint8_t*left,uint8_t*right,const struct xnn_u8_minmax_params*params)
/*@ With (A:list Z) (lo:Z) (hi:Z)
 Require 0<n && n<=18446744073709551608 && input!=0 && left!=0 && right!=0 && params!=0 &&
 UCharArray::full(input,n+7,A) * UCharArray::undef_full(left,n) * UCharArray::undef_full(right,n) *
 store(&(params->scalar.min),unsigned int,lo) * store(&(params->scalar.max),unsigned int,hi)
 Ensure __return==1 && UCharArray::full(input,n+7,A) *
 UCharArray::full(left,n,u8_phase_all(n,u8_bound(lo),u8_bound(hi),A)) *
 UCharArray::full(right,n,u8_phase_all(n,u8_bound(lo),u8_bound(hi),A)) *
 store(&(params->scalar.min),unsigned int,lo) * store(&(params->scalar.max),unsigned int,hi) */;
int equivalent(size_t n,const uint8_t*input,uint8_t*left,uint8_t*right,const struct xnn_u8_minmax_params*params)
/*@ With (A:list Z) (lo:Z) (hi:Z)
 Require 0<n && n<=18446744073709551608 && input!=0 && left!=0 && right!=0 && params!=0 &&
 UCharArray::full(input,n+7,A) * UCharArray::undef_full(left,n) * UCharArray::undef_full(right,n) *
 store(&(params->scalar.min),unsigned int,lo) * store(&(params->scalar.max),unsigned int,hi)
 Ensure __return==1 && UCharArray::full(input,n+7,A) *
 UCharArray::full(left,n,u8_phase_all(n,u8_bound(lo),u8_bound(hi),A)) *
 UCharArray::full(right,n,u8_phase_all(n,u8_bound(lo),u8_bound(hi),A)) *
 store(&(params->scalar.min),unsigned int,lo) * store(&(params->scalar.max),unsigned int,hi) */
{
 test_neon(n,input,left,params);
 test_rvv(n,input,right,params);
 size_t i;
 /*@ Inv 0<=i && i<=n && n==n@pre && input==input@pre && left==left@pre && right==right@pre && params==params@pre &&
 UCharArray::full(input,n+7,A) *
 UCharArray::full(left,n,u8_phase_all(n,u8_bound(lo),u8_bound(hi),A)) *
 UCharArray::full(right,n,u8_phase_all(n,u8_bound(lo),u8_bound(hi),A)) *
 store(&(params->scalar.min),unsigned int,lo) * store(&(params->scalar.max),unsigned int,hi) */
 for(i=0;i<n;++i){if(left[i]!=right[i])return 0;}
 return 1;
}
