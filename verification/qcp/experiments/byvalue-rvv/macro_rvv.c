#include "macro_shim.h"
#include "../vadd-rvv/rvv_loop_def.h"
/*@ include strategies "rvv_arrays.strategies" */
/*@ include strategies "rvv_store.strategies" */
/*@ include strategies "rvv_loop.strategies" */
typedef unsigned long long size_t;
struct xnn_f32_default_params { char unused; };
#define NULL ((void *)0)
#define assert(x) qcp_assert(x)
void qcp_assert(int condition)
/*@ Require condition != 0 && emp Ensure emp */
{ return; }
size_t __riscv_vsetvl_e32m8(size_t n)
/*@ Require emp Ensure __return == vadd_vl(n) && emp */
{ return n < 32 ? n : 32; }
void test_rvv(
    size_t batch,
    const float* input_a,
    const float* input_b,
    float* output,
    const struct xnn_f32_default_params* restrict params)
/*@ With (A:list fp32) (B:list fp32)
 Require 0 < batch && batch <= 18446744073709551603 && batch % 4 == 0 &&
 params != 0 && input_a != 0 && input_b != 0 && output != 0 &&
 FloatArray::full(input_a,batch/4+3,A) * FloatArray::full(input_b,batch/4+3,B) * FloatArray::undef_full(output,batch/4)
 Ensure FloatArray::full(input_a,batch/4+3,A) * FloatArray::full(input_b,batch/4+3,B) * FloatArray::full(output,batch/4,vadd_values(batch/4,A,B)) */
{
  assert(batch != 0);
  assert(batch % sizeof(float) == 0);
  assert(input_a != NULL);
  assert(input_b != NULL);
  assert(output != NULL);

  size_t n = batch / sizeof(float);
/*@ Assert batch == batch@pre && params == params@pre && 0 < batch@pre/4 && batch@pre/4 <= 4611686018427387900 && input_a == input_a@pre && input_b == input_b@pre && output == output@pre && n == batch@pre/4 && rvv_length(A) == batch@pre/4+3 && rvv_length(B) == batch@pre/4+3 && FloatArray::full(input_a@pre,(batch@pre/4)+3,A) * FloatArray::full(input_b@pre,(batch@pre/4)+3,B) * FloatArray::undef_full(output,batch@pre/4) */
/*@ Inv batch == batch@pre && params == params@pre && 0 < (batch@pre/4) && (batch@pre/4) <= 4611686018427387900 && 0 <= n && n <= (batch@pre/4) && rvv_length(A) == (batch@pre/4)+3 && rvv_length(B) == (batch@pre/4)+3 &&
 input_a == pointer_offset(input_a@pre,((batch@pre/4)-n),float) && input_b == pointer_offset(input_b@pre,((batch@pre/4)-n),float) && output == pointer_offset(output@pre,((batch@pre/4)-n),float) &&
 FloatArray::full(input_a@pre,(batch@pre/4)+3,A) * FloatArray::full(input_b@pre,(batch@pre/4)+3,B) *
 FloatArray::seg(output@pre,0,((batch@pre/4)-n),vadd_values(((batch@pre/4)-n),A,B)) * FloatArray::undef_seg(output@pre,((batch@pre/4)-n),(batch@pre/4)) */
  while (n > 0) {
    size_t vl = __riscv_vsetvl_e32m8(n);
/*@ Assert batch == batch@pre && params == params@pre && 0 < (batch@pre/4) && (batch@pre/4) <= 4611686018427387900 && 0 <= n && n <= (batch@pre/4) && rvv_length(A) == (batch@pre/4)+3 && rvv_length(B) == (batch@pre/4)+3 &&
 input_a == pointer_offset(input_a@pre,((batch@pre/4)-n),float) && input_b == pointer_offset(input_b@pre,((batch@pre/4)-n),float) && output == pointer_offset(output@pre,((batch@pre/4)-n),float) && 0 < n && 0 < vl && vl <= 32 && vl <= n && vl == vadd_vl(n) &&
 FloatArray::seg(input_a@pre,0,((batch@pre/4)-n),rvv_slice(0,((batch@pre/4)-n),A)) *
 FloatArray::full(input_a,vl,rvv_slice(((batch@pre/4)-n),(((batch@pre/4)-n)+vl),A)) *
 FloatArray::seg(input_a@pre,(((batch@pre/4)-n)+vl),(batch@pre/4)+3,rvv_slice((((batch@pre/4)-n)+vl),(batch@pre/4)+3,A)) *
 FloatArray::seg(input_b@pre,0,((batch@pre/4)-n),rvv_slice(0,((batch@pre/4)-n),B)) *
 FloatArray::full(input_b,vl,rvv_slice(((batch@pre/4)-n),(((batch@pre/4)-n)+vl),B)) *
 FloatArray::seg(input_b@pre,(((batch@pre/4)-n)+vl),(batch@pre/4)+3,rvv_slice((((batch@pre/4)-n)+vl),(batch@pre/4)+3,B)) *
 FloatArray::seg(output@pre,0,((batch@pre/4)-n),vadd_values(((batch@pre/4)-n),A,B)) *
 FloatArray::undef_full(output,vl) *
 FloatArray::undef_seg(output@pre,(((batch@pre/4)-n)+vl),(batch@pre/4)) */
    vfloat32m8_t va = __riscv_vle32_v_f32m8(input_a, vl);
    vfloat32m8_t vb = __riscv_vle32_v_f32m8(input_b, vl);
    
    vfloat32m8_t vacc = __riscv_vfadd_vv_f32m8(va, vb, vl) /*@ where a = &va,b = &vb */;
    
    __riscv_vse32_v_f32m8(output, vacc, vl) /*@ where a = &vacc */;
    
    input_a += vl;
    input_b += vl;
    output += vl;
    n -= vl;
  }
}
