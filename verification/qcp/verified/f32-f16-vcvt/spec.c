#include "shim/program_model.h"
#include "shim/read_array_def.h"

void test_neon(size_t batch,const float* input,uint16_t* output,const void* params)
/*@ With (A:list fp32)
 Require 0 < batch && batch <= 18446744073709551615 && batch % 4 == 0 &&
 input != 0 && output != 0 &&
 FloatArray::full(input,batch/4+3,A) * UShortArray::undef_full(output,batch/4)
 Ensure FloatArray::full(input@pre,batch@pre/4+3,A) *
 UShortArray::full(output@pre,batch@pre/4,f16_values(batch@pre/4,A)) */;
void test_rvv(size_t batch,const float* input,uint16_t* output,const void* params)
/*@ With (A:list fp32)
 Require 0 < batch && batch <= 18446744073709551615 && batch % 4 == 0 &&
 input != 0 && output != 0 &&
 FloatArray::full(input,batch/4+3,A) * UShortArray::undef_full(output,batch/4)
 Ensure FloatArray::full(input@pre,batch@pre/4+3,A) *
 UShortArray::full(output@pre,batch@pre/4,f16_rvv_values(batch@pre/4,A)) */;
uint16_t qcp_f16_read16(const uint16_t* p)
/*@ With (x:Z) Require store(p,unsigned short,x)
 Ensure __return == x && store(p,unsigned short,x) */
{ return *p; }
int qcp_f16_compare(size_t n,const uint16_t* a,const uint16_t* b)
/*@ With (L:list Z)
 Require 0 <= n && n <= 18446744073709551615 &&
 UShortArray::full(a,n,L) * UShortArray::full(b,n,L)
 Ensure __return == 1 && UShortArray::full(a@pre,n@pre,L) * UShortArray::full(b@pre,n@pre,L) */
{
 size_t i=0;
 /*@ Inv Assert 0 <= i && i <= n && n <= 18446744073709551615 &&
 n == n@pre && a == a@pre && b == b@pre &&
 UShortArray::full(a,n,L) * UShortArray::full(b,n,L) */
 for(;i<n;++i) {
  /*@ 0 <= i && i < n && UShortArray::full(a,n,L)
      which implies
      store(pointer_offset(a,i,unsigned short),unsigned short,f16_get(i,L)) *
      UShortArray::missing_i(a,i,0,n,L) */
  uint16_t left=qcp_f16_read16(a+i);
  /*@ 0 <= i && i < n && UShortArray::full(b,n,L)
      which implies
      store(pointer_offset(b,i,unsigned short),unsigned short,f16_get(i,L)) *
      UShortArray::missing_i(b,i,0,n,L) */
  uint16_t right=qcp_f16_read16(b+i);
  if(left!=right) return 0;
 }
 return 1;
}
int equivalent(size_t n,const float* input,uint16_t* left,uint16_t* right,const void* params)
/*@ With (A:list fp32)
 Require 0 < n && n <= 4611686018427387903 && input != 0 && left != 0 && right != 0 &&
 FloatArray::full(input,n+3,A) * UShortArray::undef_full(left,n) * UShortArray::undef_full(right,n)
 Ensure __return == 1 && f16_values(n@pre,A) == f16_rvv_values(n@pre,A) &&
 FloatArray::full(input@pre,n@pre+3,A) *
 UShortArray::full(left@pre,n@pre,f16_values(n@pre,A)) *
 UShortArray::full(right@pre,n@pre,f16_rvv_values(n@pre,A)) */
{
 test_neon(n*sizeof(float),input,left,params);
 test_rvv(n*sizeof(float),input,right,params);
 /*@ Assert n == n@pre && input == input@pre && left == left@pre && right == right@pre && params == params@pre &&
 0 < n && n <= 4611686018427387903 && input != 0 && left != 0 && right != 0 &&
 f16_values(n,A) == f16_rvv_values(n,A) &&
 FloatArray::full(input,n+3,A) * UShortArray::full(left,n,f16_values(n,A)) *
 UShortArray::full(right,n,f16_rvv_values(n,A)) */
 return qcp_f16_compare(n,left,right);
}
