#include "full_neon_shim.c"
typedef unsigned long long size_t;
typedef unsigned int uint32_t;
#define NULL 0
#define XNN_OOB_READS
#define XNN_UNLIKELY(x) (x)
void qcp_assert(int c) /*@ Require emp Ensure c!=0 */ { /*@ Inv c==c@pre */ while(c==0) { } }
#define assert(x) qcp_assert(!!(x))
struct xnn_u8_minmax_params {struct {uint32_t min;uint32_t max;} scalar;};
/*
struct xnn_u8_minmax_params {
  struct {
    uint32_t min;
    uint32_t max;
  } scalar;
};
*/

/*
struct xnn_u8_minmax_params {
  struct {
    uint32_t min;
    uint32_t max;
  } scalar;
};
*/

void test_neon(
    size_t batch,
    const uint8_t* input,
    uint8_t* output,
    const struct xnn_u8_minmax_params* restrict params) XNN_OOB_READS

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

  const uint8x16_t voutput_max = vdupq_n_u8(params->scalar.max);
  const uint8x16_t voutput_min = vdupq_n_u8(params->scalar.min);

  
/*@ Inv Zlength(A) == batch@pre+7 && 0 <= batch && batch <= batch@pre &&
 input == input@pre+(batch@pre-batch) && output == output@pre+(batch@pre-batch) && params == params@pre &&
 
 (batch@pre-batch) <= u8_prefix_n(batch@pre) && (batch@pre-batch) % 64 == 0 &&
 UCharArray::seg(input@pre,0,(batch@pre-batch),sublist(0,(batch@pre-batch),A)) *
 UCharArray::full(input,batch+7,sublist((batch@pre-batch),batch@pre+7,A)) * UCharArray::undef_full(output,batch) * data_at(&(params->scalar.min),unsigned int,lo) * data_at(&(params->scalar.max),unsigned int,hi) * UCharArray::seg(output@pre,0,(batch@pre-batch),u8_prefix_list(u8_bound(lo),u8_bound(hi),sublist(0,(batch@pre-batch),A))) * store(&(voutput_max.low.s0),unsigned char,u8_bound(hi)) * store(&(voutput_max.low.s1),unsigned char,u8_bound(hi)) * store(&(voutput_max.low.s2),unsigned char,u8_bound(hi)) * store(&(voutput_max.low.s3),unsigned char,u8_bound(hi)) * store(&(voutput_max.low.s4),unsigned char,u8_bound(hi)) * store(&(voutput_max.low.s5),unsigned char,u8_bound(hi)) * store(&(voutput_max.low.s6),unsigned char,u8_bound(hi)) * store(&(voutput_max.low.s7),unsigned char,u8_bound(hi)) * store(&(voutput_max.high.s0),unsigned char,u8_bound(hi)) * store(&(voutput_max.high.s1),unsigned char,u8_bound(hi)) * store(&(voutput_max.high.s2),unsigned char,u8_bound(hi)) * store(&(voutput_max.high.s3),unsigned char,u8_bound(hi)) * store(&(voutput_max.high.s4),unsigned char,u8_bound(hi)) * store(&(voutput_max.high.s5),unsigned char,u8_bound(hi)) * store(&(voutput_max.high.s6),unsigned char,u8_bound(hi)) * store(&(voutput_max.high.s7),unsigned char,u8_bound(hi)) * store(&(voutput_min.low.s0),unsigned char,u8_bound(lo)) * store(&(voutput_min.low.s1),unsigned char,u8_bound(lo)) * store(&(voutput_min.low.s2),unsigned char,u8_bound(lo)) * store(&(voutput_min.low.s3),unsigned char,u8_bound(lo)) * store(&(voutput_min.low.s4),unsigned char,u8_bound(lo)) * store(&(voutput_min.low.s5),unsigned char,u8_bound(lo)) * store(&(voutput_min.low.s6),unsigned char,u8_bound(lo)) * store(&(voutput_min.low.s7),unsigned char,u8_bound(lo)) * store(&(voutput_min.high.s0),unsigned char,u8_bound(lo)) * store(&(voutput_min.high.s1),unsigned char,u8_bound(lo)) * store(&(voutput_min.high.s2),unsigned char,u8_bound(lo)) * store(&(voutput_min.high.s3),unsigned char,u8_bound(lo)) * store(&(voutput_min.high.s4),unsigned char,u8_bound(lo)) * store(&(voutput_min.high.s5),unsigned char,u8_bound(lo)) * store(&(voutput_min.high.s6),unsigned char,u8_bound(lo)) * store(&(voutput_min.high.s7),unsigned char,u8_bound(lo)) */
for (; batch >= 64; batch -= 64) {
    uint8x16_t vacc0 = vld1q_u8(input)
/*@ where n=batch+7-0 */
; input += 16;
    uint8x16_t vacc1 = vld1q_u8(input)
/*@ where n=batch+7-16 */
; input += 16;
    uint8x16_t vacc2 = vld1q_u8(input)
/*@ where n=batch+7-32 */
; input += 16;
    uint8x16_t vacc3 = vld1q_u8(input)
/*@ where n=batch+7-48 */
; input += 16;

    vacc0 = vmaxq_u8(vacc0, voutput_min)
/*@ where a=&vacc0,b=&voutput_min */
;
    vacc1 = vmaxq_u8(vacc1, voutput_min)
/*@ where a=&vacc1,b=&voutput_min */
;
    vacc2 = vmaxq_u8(vacc2, voutput_min)
/*@ where a=&vacc2,b=&voutput_min */
;
    vacc3 = vmaxq_u8(vacc3, voutput_min)
/*@ where a=&vacc3,b=&voutput_min */
;

    vacc0 = vminq_u8(vacc0, voutput_max)
/*@ where a=&vacc0,b=&voutput_max */
;
    vacc1 = vminq_u8(vacc1, voutput_max)
/*@ where a=&vacc1,b=&voutput_max */
;
    vacc2 = vminq_u8(vacc2, voutput_max)
/*@ where a=&vacc2,b=&voutput_max */
;
    vacc3 = vminq_u8(vacc3, voutput_max)
/*@ where a=&vacc3,b=&voutput_max */
;

    vst1q_u8(output, vacc0); output += 16;
    vst1q_u8(output, vacc1); output += 16;
    vst1q_u8(output, vacc2); output += 16;
    vst1q_u8(output, vacc3); output += 16;
  }
  
/*@ Inv Zlength(A) == batch@pre+7 && 0 <= batch && batch <= batch@pre &&
 input == input@pre+(batch@pre-batch) && output == output@pre+(batch@pre-batch) && params == params@pre &&
 
 batch < 64 && u8_prefix_n(batch@pre) <= (batch@pre-batch) && (batch@pre-batch) <= batch@pre &&
 UCharArray::seg(input@pre,0,(batch@pre-batch),sublist(0,(batch@pre-batch),A)) *
 UCharArray::full(input,batch+7,sublist((batch@pre-batch),batch@pre+7,A)) * UCharArray::undef_full(output,batch) * data_at(&(params->scalar.min),unsigned int,lo) * data_at(&(params->scalar.max),unsigned int,hi) * UCharArray::seg(output@pre,0,(batch@pre-batch),app(u8_prefix_list(u8_bound(lo),u8_bound(hi),sublist(0,u8_prefix_n(batch@pre),A)),u8_suffix_list(u8_bound(lo),u8_bound(hi),sublist(u8_prefix_n(batch@pre),(batch@pre-batch),A)))) * store(&(voutput_max.low.s0),unsigned char,u8_bound(hi)) * store(&(voutput_max.low.s1),unsigned char,u8_bound(hi)) * store(&(voutput_max.low.s2),unsigned char,u8_bound(hi)) * store(&(voutput_max.low.s3),unsigned char,u8_bound(hi)) * store(&(voutput_max.low.s4),unsigned char,u8_bound(hi)) * store(&(voutput_max.low.s5),unsigned char,u8_bound(hi)) * store(&(voutput_max.low.s6),unsigned char,u8_bound(hi)) * store(&(voutput_max.low.s7),unsigned char,u8_bound(hi)) * store(&(voutput_max.high.s0),unsigned char,u8_bound(hi)) * store(&(voutput_max.high.s1),unsigned char,u8_bound(hi)) * store(&(voutput_max.high.s2),unsigned char,u8_bound(hi)) * store(&(voutput_max.high.s3),unsigned char,u8_bound(hi)) * store(&(voutput_max.high.s4),unsigned char,u8_bound(hi)) * store(&(voutput_max.high.s5),unsigned char,u8_bound(hi)) * store(&(voutput_max.high.s6),unsigned char,u8_bound(hi)) * store(&(voutput_max.high.s7),unsigned char,u8_bound(hi)) * store(&(voutput_min.low.s0),unsigned char,u8_bound(lo)) * store(&(voutput_min.low.s1),unsigned char,u8_bound(lo)) * store(&(voutput_min.low.s2),unsigned char,u8_bound(lo)) * store(&(voutput_min.low.s3),unsigned char,u8_bound(lo)) * store(&(voutput_min.low.s4),unsigned char,u8_bound(lo)) * store(&(voutput_min.low.s5),unsigned char,u8_bound(lo)) * store(&(voutput_min.low.s6),unsigned char,u8_bound(lo)) * store(&(voutput_min.low.s7),unsigned char,u8_bound(lo)) * store(&(voutput_min.high.s0),unsigned char,u8_bound(lo)) * store(&(voutput_min.high.s1),unsigned char,u8_bound(lo)) * store(&(voutput_min.high.s2),unsigned char,u8_bound(lo)) * store(&(voutput_min.high.s3),unsigned char,u8_bound(lo)) * store(&(voutput_min.high.s4),unsigned char,u8_bound(lo)) * store(&(voutput_min.high.s5),unsigned char,u8_bound(lo)) * store(&(voutput_min.high.s6),unsigned char,u8_bound(lo)) * store(&(voutput_min.high.s7),unsigned char,u8_bound(lo)) */
for (; batch >= 8; batch -= 8) {
    uint8x8_t vacc = vld1_u8(input)
/*@ where n=batch+7 */
; input += 8;

    vacc = vmin_u8(vacc, vget_low_u8(voutput_max))
/*@ where a=&vacc,b=&voutput_max.low */
;
    vacc = vmax_u8(vacc, vget_low_u8(voutput_min))
/*@ where a=&vacc,b=&voutput_min.low */
;

    vst1_u8(output, vacc); output += 8;
  }
  if XNN_UNLIKELY(batch != 0) {
    uint8x8_t vacc = vld1_u8(input)
/*@ where n=batch+7 */
; input += 8;

    vacc = vmin_u8(vacc, vget_low_u8(voutput_max))
/*@ where a=&vacc,b=&voutput_max.low */
;
    vacc = vmax_u8(vacc, vget_low_u8(voutput_min))
/*@ where a=&vacc,b=&voutput_min.low */
;

    if (batch & 4) {
      vst1_lane_u32((void*) output, vreinterpret_u32_u8(vacc)
/*@ where a=&vacc */
, 0); output += 4;
      vacc = vext_u8(vacc, vacc, 4);
    }
    if (batch & 2) {
      vst1_lane_u16((void*) output, vreinterpret_u16_u8(vacc)
/*@ where a=&vacc */
, 0); output += 2;
      vacc = vext_u8(vacc, vacc, 2);
    }
    if (batch & 1) {
      vst1_lane_u8(output, vacc, 0);
    }
  }
}
