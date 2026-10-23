#include "packed.h"
#define NULL 0
void qcp_assert(int c) /*@ Require emp Ensure c!=0 */ { /*@ Inv c==c@pre */ while(c==0){} }
#define assert(x) qcp_assert(!!(x))
struct xnn_u8_minmax_params {struct {uint32_t min;uint32_t max;} scalar;};
void test_rvv(
    size_t batch,
    const uint8_t* input,
    uint8_t* output,
    const struct xnn_u8_minmax_params* params)

/*@ With (A:list Z) (lo:Z) (hi:Z)
 Require 0<batch && batch<=18446744073709551608 && input!=0 && output!=0 && params!=0 &&
 UCharArray::full(input,batch+7,A) * UCharArray::undef_full(output,batch) *
 store(&(params->scalar.min),unsigned int,lo) * store(&(params->scalar.max),unsigned int,hi)
 Ensure UCharArray::full(input@pre,batch@pre+7,A) *
 UCharArray::full(output@pre,batch@pre,u8_phase_all(batch@pre,u8_bound(lo),u8_bound(hi),A)) *
 store(&(params->scalar.min),unsigned int,lo) * store(&(params->scalar.max),unsigned int,hi) */
{
  assert(batch != 0);
  assert(batch % sizeof(uint8_t) == 0);
  assert(input != NULL);
  assert(output != NULL);

  const uint8_t voutput_min = (uint8_t) params->scalar.min;
  const uint8_t voutput_max = (uint8_t) params->scalar.max;

  size_t batch64 = batch & ~((size_t)63);
  
/*@ Inv Zlength(A) == batch@pre+7 && 0 <= batch64 && batch64 == u8_prefix_n(batch@pre)-(batch@pre-batch) && 0 <= (batch@pre-batch) && (batch@pre-batch) <= u8_prefix_n(batch@pre) &&
 0 <= batch && batch <= batch@pre &&
 input == input@pre+(batch@pre-batch) && output == output@pre+(batch@pre-batch) &&
 params == params@pre && voutput_min == u8_bound(lo) && voutput_max == u8_bound(hi) &&
 UCharArray::seg(input@pre,0,(batch@pre-batch),sublist(0,(batch@pre-batch),A)) *
 UCharArray::full(input,batch+7,sublist((batch@pre-batch),batch@pre+7,A)) *
 UCharArray::undef_full(output,batch) * data_at(&(params->scalar.min),unsigned int,lo) * data_at(&(params->scalar.max),unsigned int,hi) * UCharArray::seg(output@pre,0,(batch@pre-batch),u8_prefix_list(u8_bound(lo),u8_bound(hi),sublist(0,(batch@pre-batch),A))) */
while (batch64 > 0) {
    size_t vl = __riscv_vsetvl_e8m8(batch64);
    
    vuint8m8_t vacc = __riscv_vle8_v_u8m8(input, vl)
/*@ where n=batch+7 */
;
    
    vacc = __riscv_vmaxu_vx_u8m8(vacc, voutput_min, vl)
/*@ where a=&vacc */
;
    vacc = __riscv_vminu_vx_u8m8(vacc, voutput_max, vl)
/*@ where a=&vacc */
;
    
    __riscv_vse8_v_u8m8(output, vacc, vl);
    
    input += vl;
    output += vl;
    batch -= vl;
    batch64 -= vl;
  }

  
/*@ Inv Zlength(A) == batch@pre+7 && batch64 == 0 && u8_prefix_n(batch@pre) <= (batch@pre-batch) && (batch@pre-batch) <= batch@pre &&
 0 <= batch && batch <= batch@pre &&
 input == input@pre+(batch@pre-batch) && output == output@pre+(batch@pre-batch) &&
 params == params@pre && voutput_min == u8_bound(lo) && voutput_max == u8_bound(hi) &&
 UCharArray::seg(input@pre,0,(batch@pre-batch),sublist(0,(batch@pre-batch),A)) *
 UCharArray::full(input,batch+7,sublist((batch@pre-batch),batch@pre+7,A)) *
 UCharArray::undef_full(output,batch) * data_at(&(params->scalar.min),unsigned int,lo) * data_at(&(params->scalar.max),unsigned int,hi) *
 UCharArray::seg(output@pre,0,(batch@pre-batch),app(u8_prefix_list(u8_bound(lo),u8_bound(hi),sublist(0,u8_prefix_n(batch@pre),A)),u8_suffix_list(u8_bound(lo),u8_bound(hi),sublist(u8_prefix_n(batch@pre),(batch@pre-batch),A)))) */
while (batch > 0) {
    size_t vl = __riscv_vsetvl_e8m8(batch);
    
    vuint8m8_t vacc = __riscv_vle8_v_u8m8(input, vl)
/*@ where n=batch+7 */
;
    
    vacc = __riscv_vminu_vx_u8m8(vacc, voutput_max, vl)
/*@ where a=&vacc */
;
    vacc = __riscv_vmaxu_vx_u8m8(vacc, voutput_min, vl)
/*@ where a=&vacc */
;
    
    __riscv_vse8_v_u8m8(output, vacc, vl);
    
    input += vl;
    output += vl;
    batch -= vl;
  }
}