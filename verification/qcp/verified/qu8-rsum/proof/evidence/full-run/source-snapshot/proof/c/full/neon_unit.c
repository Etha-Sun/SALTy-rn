#include "../../../shim/neon_frontend.h"
/*
struct xnn_qs8_rsum_params {
  char _;  // Dummy member variable to comply with the C standard
};
*/

void test_neon(
    size_t batch,
    const uint8_t* input,
    uint32_t* output,
    const struct xnn_qs8_rsum_params* restrict params) XNN_OOB_READS
/*@ With (A:list Z) (Init:Z) (Tag:Z) Require 0<batch && batch<=18446744073709551600 && input!=0 && output!=0 && params!=0 && 0<=Init && Init<=4294967295 && UCharArray::full(input,batch+15,A) * store(output,unsigned int,Init) * store(&(params->_),char,Tag) Ensure UCharArray::full(input@pre,batch@pre+15,A) * store(output@pre,unsigned int,rs_u32(Init+rs_prefix(A,batch@pre))) * store(&(params@pre->_),char,Tag) */
{
  assert(batch != 0);
  assert(input != NULL);
  assert(output != NULL);
  assert(params != NULL);

  XNN_ALIGN(16) const uint8_t onemask_table[32] = {
    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
  };

  uint32x4_t vacc0 = vmovq_n_u32(0);

  // 256 uint8s may be summed into an uint16 before overflowing.
  // Each register has 8 lanes and there are 1 accumulators so batch size is 2048

/*@ Inv Assert exists (c0:Z) (c1:Z) (c2:Z) (c3:Z), 0<batch@pre && batch@pre<=18446744073709551600 && input@pre!=0 && output==output@pre && output!=0 && params==params@pre && params!=0 && 0<=batch && batch<=batch@pre && input==input@pre+(batch@pre-batch) && rs_rem2048(batch)==rs_rem2048(batch@pre) && 0<=c0 && c0<=4294967295 && 0<=c1 && c1<=4294967295 && 0<=c2 && c2<=4294967295 && 0<=c3 && c3<=4294967295 && rs_u32(rs_sum4(c0,c1,c2,c3))==rs_u32(rs_prefix(A,batch@pre-batch)) && UCharArray::full(input@pre,batch@pre+15,A) * store(output,unsigned int,Init) * store(&(params->_),char,Tag) * UCharArray::full(onemask_table,32,rs_onemask) * store(&(vacc0.s0),unsigned int,c0) * store(&(vacc0.s1),unsigned int,c1) * store(&(vacc0.s2),unsigned int,c2) * store(&(vacc0.s3),unsigned int,c3) */
  for (; batch >= 2048; batch -= 2048) {
    uint16x8_t vacc16_0 = vmovq_n_u16(0);
/*@ Inv Assert exists (c0:Z) (c1:Z) (c2:Z) (c3:Z) (w0:Z) (w1:Z) (w2:Z) (w3:Z) (w4:Z) (w5:Z) (w6:Z) (w7:Z), 0<batch@pre && batch@pre<=18446744073709551600 && input@pre!=0 && output==output@pre && output!=0 && params==params@pre && params!=0 && 2048<=batch && batch<=batch@pre && rs_rem2048(batch)==rs_rem2048(batch@pre) && 0<=current_batch && current_batch<=2048 && rs_mod16(current_batch)==0 && input==input@pre+(batch@pre-batch)+(2048-current_batch) && 0<=c0 && c0<=4294967295 && 0<=c1 && c1<=4294967295 && 0<=c2 && c2<=4294967295 && 0<=c3 && c3<=4294967295 && 0*rs_count16(2048-current_batch)<=w0 && w0<=510*rs_count16(2048-current_batch) && 0*rs_count16(2048-current_batch)<=w1 && w1<=510*rs_count16(2048-current_batch) && 0*rs_count16(2048-current_batch)<=w2 && w2<=510*rs_count16(2048-current_batch) && 0*rs_count16(2048-current_batch)<=w3 && w3<=510*rs_count16(2048-current_batch) && 0*rs_count16(2048-current_batch)<=w4 && w4<=510*rs_count16(2048-current_batch) && 0*rs_count16(2048-current_batch)<=w5 && w5<=510*rs_count16(2048-current_batch) && 0*rs_count16(2048-current_batch)<=w6 && w6<=510*rs_count16(2048-current_batch) && 0*rs_count16(2048-current_batch)<=w7 && w7<=510*rs_count16(2048-current_batch) && rs_u32(rs_sum4(c0,c1,c2,c3))==rs_u32(rs_prefix(A,batch@pre-batch)) && rs_sum8(w0,w1,w2,w3,w4,w5,w6,w7)==rs_prefix(A,batch@pre-batch+(2048-current_batch))-rs_prefix(A,batch@pre-batch) && UCharArray::full(input@pre,batch@pre+15,A) * store(output,unsigned int,Init) * store(&(params->_),char,Tag) * UCharArray::full(onemask_table,32,rs_onemask) * store(&(vacc0.s0),unsigned int,c0) * store(&(vacc0.s1),unsigned int,c1) * store(&(vacc0.s2),unsigned int,c2) * store(&(vacc0.s3),unsigned int,c3) * store(&(vacc16_0.s0),unsigned short,w0) * store(&(vacc16_0.s1),unsigned short,w1) * store(&(vacc16_0.s2),unsigned short,w2) * store(&(vacc16_0.s3),unsigned short,w3) * store(&(vacc16_0.s4),unsigned short,w4) * store(&(vacc16_0.s5),unsigned short,w5) * store(&(vacc16_0.s6),unsigned short,w6) * store(&(vacc16_0.s7),unsigned short,w7) */
    for (size_t current_batch = 2048; current_batch > 0; current_batch -= 16) {
      const uint8x16_t vt0 = vld1q_u8(input) /*@ where base=input@pre,count=batch@pre+15,idx=input-input@pre,L=A */; input += 16;
      vacc16_0 = vpadalq_u8(vacc16_0, vt0) /*@ where a=&vacc16_0,b=&vt0 */;
    }
    vacc0 = vpadalq_u16(vacc0, vacc16_0) /*@ where a=&vacc0,b=&vacc16_0 */;
  }

  if (XNN_UNLIKELY(batch != 0)) {
    assert(batch >= 1 && batch < 2048);
    uint16x8_t vacc16 = vmovq_n_u16(0);
/*@ Inv Assert exists (c0:Z) (c1:Z) (c2:Z) (c3:Z) (w0:Z) (w1:Z) (w2:Z) (w3:Z) (w4:Z) (w5:Z) (w6:Z) (w7:Z), 0<batch@pre && batch@pre<=18446744073709551600 && input@pre!=0 && output==output@pre && output!=0 && params==params@pre && params!=0 && 0<=batch && batch<=rs_rem2048(batch@pre) && rs_mod16(rs_rem2048(batch@pre)-batch)==0 && input==input@pre+(batch@pre-batch) && 0<=c0 && c0<=4294967295 && 0<=c1 && c1<=4294967295 && 0<=c2 && c2<=4294967295 && 0<=c3 && c3<=4294967295 && 0*rs_count16(rs_rem2048(batch@pre)-batch)<=w0 && w0<=510*rs_count16(rs_rem2048(batch@pre)-batch) && 0*rs_count16(rs_rem2048(batch@pre)-batch)<=w1 && w1<=510*rs_count16(rs_rem2048(batch@pre)-batch) && 0*rs_count16(rs_rem2048(batch@pre)-batch)<=w2 && w2<=510*rs_count16(rs_rem2048(batch@pre)-batch) && 0*rs_count16(rs_rem2048(batch@pre)-batch)<=w3 && w3<=510*rs_count16(rs_rem2048(batch@pre)-batch) && 0*rs_count16(rs_rem2048(batch@pre)-batch)<=w4 && w4<=510*rs_count16(rs_rem2048(batch@pre)-batch) && 0*rs_count16(rs_rem2048(batch@pre)-batch)<=w5 && w5<=510*rs_count16(rs_rem2048(batch@pre)-batch) && 0*rs_count16(rs_rem2048(batch@pre)-batch)<=w6 && w6<=510*rs_count16(rs_rem2048(batch@pre)-batch) && 0*rs_count16(rs_rem2048(batch@pre)-batch)<=w7 && w7<=510*rs_count16(rs_rem2048(batch@pre)-batch) && rs_u32(rs_sum4(c0,c1,c2,c3)+rs_sum8(w0,w1,w2,w3,w4,w5,w6,w7))==rs_u32(rs_prefix(A,batch@pre-batch)) && UCharArray::full(input@pre,batch@pre+15,A) * store(output,unsigned int,Init) * store(&(params->_),char,Tag) * UCharArray::full(onemask_table,32,rs_onemask) * store(&(vacc0.s0),unsigned int,c0) * store(&(vacc0.s1),unsigned int,c1) * store(&(vacc0.s2),unsigned int,c2) * store(&(vacc0.s3),unsigned int,c3) * store(&(vacc16.s0),unsigned short,w0) * store(&(vacc16.s1),unsigned short,w1) * store(&(vacc16.s2),unsigned short,w2) * store(&(vacc16.s3),unsigned short,w3) * store(&(vacc16.s4),unsigned short,w4) * store(&(vacc16.s5),unsigned short,w5) * store(&(vacc16.s6),unsigned short,w6) * store(&(vacc16.s7),unsigned short,w7) */
    for (; batch >= 16; batch -= 16) {
      const uint8x16_t vt = vld1q_u8(input) /*@ where base=input@pre,count=batch@pre+15,idx=input-input@pre,L=A */; input += 16;
      vacc16 = vpadalq_u8(vacc16, vt) /*@ where a=&vacc16,b=&vt */;
    }
    if (XNN_UNLIKELY(batch != 0)) {
      const uint8x16_t vt = vld1q_u8(input) /*@ where base=input@pre,count=batch@pre+15,idx=input-input@pre,L=A */;
      const uint8x16_t vonemask = vld1q_u8(&onemask_table[16 - batch]) /*@ where base=onemask_table,count=32,idx=16-batch,L=rs_onemask */;
      const uint8x16_t vtm = vmulq_u8(vt, vonemask) /*@ where a=&vt,b=&vonemask */;
      vacc16 = vpadalq_u8(vacc16, vtm) /*@ where a=&vacc16,b=&vtm */;
    }
    vacc0 = vpadalq_u16(vacc0, vacc16) /*@ where a=&vacc0,b=&vacc16 */;
  }
  #if XNN_ARCH_ARM64
    const uint32_t vacc = vaddvq_u32(vacc0) /*@ where a=&vacc0 */;
  #else
    uint32x2_t vacc_lo = vadd_u32(vget_low_u32(vacc0), vget_high_u32(vacc0));
    vacc_lo = vpadd_u32(vacc_lo, vacc_lo);
    const uint32_t vacc = vget_lane_u32(vacc_lo, 0);
  #endif

  *output += vacc;
}
