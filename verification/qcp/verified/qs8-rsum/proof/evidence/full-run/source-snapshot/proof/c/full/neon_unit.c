#include "../../../shim/neon_frontend.h"
/*
struct xnn_qs8_rsum_params {
  char _;  // Dummy member variable to comply with the C standard
};
*/

void test_neon(
    size_t batch,
    const int8_t* input,
    int32_t* output,
    const struct xnn_qs8_rsum_params* restrict params) XNN_OOB_READS
/*@ With (A:list Z) (Init:Z) (Tag:Z) Require 0<batch && batch<=18446744073709551600 && input!=0 && output!=0 && params!=0 && -2147483648<=Init && Init<=2147483647 && CharArray::full(input,batch+15,A) * store(output,int,Init) * store(&(params->_),char,Tag) Ensure CharArray::full(input@pre,batch@pre+15,A) * store(output@pre,int,rs_s32(Init+rs_prefix(A,batch@pre))) * store(&(params@pre->_),char,Tag) */
{
  assert(batch != 0);
  assert(input != NULL);
  assert(output != NULL);
  assert(params != NULL);

  XNN_ALIGN(16) const int8_t onemask_table[32] = {
    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
  };

  int32x4_t vacc0 = vmovq_n_s32(0);

  // 256 int8s may be summed into an int16 before overflowing.
  // Each register has 8 lanes and there are 1 accumulators so batch size is 2048

/*@ Inv Assert exists (c0:Z) (c1:Z) (c2:Z) (c3:Z), 0<batch@pre && batch@pre<=18446744073709551600 && input@pre!=0 && output==output@pre && output!=0 && params==params@pre && params!=0 && 0<=batch && batch<=batch@pre && input==input@pre+(batch@pre-batch) && rs_rem2048(batch)==rs_rem2048(batch@pre) && -2147483648<=c0 && c0<=2147483647 && -2147483648<=c1 && c1<=2147483647 && -2147483648<=c2 && c2<=2147483647 && -2147483648<=c3 && c3<=2147483647 && rs_s32(rs_sum4(c0,c1,c2,c3))==rs_s32(rs_prefix(A,batch@pre-batch)) && CharArray::full(input@pre,batch@pre+15,A) * store(output,int,Init) * store(&(params->_),char,Tag) * CharArray::full(onemask_table,32,rs_onemask) * store(&(vacc0.s0),int,c0) * store(&(vacc0.s1),int,c1) * store(&(vacc0.s2),int,c2) * store(&(vacc0.s3),int,c3) */
  for (; batch >= 2048; batch -= 2048) {
    int16x8_t vacc16_0 = vmovq_n_s16(0);
/*@ Inv Assert exists (c0:Z) (c1:Z) (c2:Z) (c3:Z) (w0:Z) (w1:Z) (w2:Z) (w3:Z) (w4:Z) (w5:Z) (w6:Z) (w7:Z), 0<batch@pre && batch@pre<=18446744073709551600 && input@pre!=0 && output==output@pre && output!=0 && params==params@pre && params!=0 && 2048<=batch && batch<=batch@pre && rs_rem2048(batch)==rs_rem2048(batch@pre) && 0<=current_batch && current_batch<=2048 && rs_mod16(current_batch)==0 && input==input@pre+(batch@pre-batch)+(2048-current_batch) && -2147483648<=c0 && c0<=2147483647 && -2147483648<=c1 && c1<=2147483647 && -2147483648<=c2 && c2<=2147483647 && -2147483648<=c3 && c3<=2147483647 && -256*rs_count16(2048-current_batch)<=w0 && w0<=254*rs_count16(2048-current_batch) && -256*rs_count16(2048-current_batch)<=w1 && w1<=254*rs_count16(2048-current_batch) && -256*rs_count16(2048-current_batch)<=w2 && w2<=254*rs_count16(2048-current_batch) && -256*rs_count16(2048-current_batch)<=w3 && w3<=254*rs_count16(2048-current_batch) && -256*rs_count16(2048-current_batch)<=w4 && w4<=254*rs_count16(2048-current_batch) && -256*rs_count16(2048-current_batch)<=w5 && w5<=254*rs_count16(2048-current_batch) && -256*rs_count16(2048-current_batch)<=w6 && w6<=254*rs_count16(2048-current_batch) && -256*rs_count16(2048-current_batch)<=w7 && w7<=254*rs_count16(2048-current_batch) && rs_s32(rs_sum4(c0,c1,c2,c3))==rs_s32(rs_prefix(A,batch@pre-batch)) && rs_sum8(w0,w1,w2,w3,w4,w5,w6,w7)==rs_prefix(A,batch@pre-batch+(2048-current_batch))-rs_prefix(A,batch@pre-batch) && CharArray::full(input@pre,batch@pre+15,A) * store(output,int,Init) * store(&(params->_),char,Tag) * CharArray::full(onemask_table,32,rs_onemask) * store(&(vacc0.s0),int,c0) * store(&(vacc0.s1),int,c1) * store(&(vacc0.s2),int,c2) * store(&(vacc0.s3),int,c3) * store(&(vacc16_0.s0),short,w0) * store(&(vacc16_0.s1),short,w1) * store(&(vacc16_0.s2),short,w2) * store(&(vacc16_0.s3),short,w3) * store(&(vacc16_0.s4),short,w4) * store(&(vacc16_0.s5),short,w5) * store(&(vacc16_0.s6),short,w6) * store(&(vacc16_0.s7),short,w7) */
    for (size_t current_batch = 2048; current_batch > 0; current_batch -= 16) {
      const int8x16_t vt0 = vld1q_s8(input) /*@ where base=input@pre,count=batch@pre+15,idx=input-input@pre,L=A */; input += 16;
      vacc16_0 = vpadalq_s8(vacc16_0, vt0) /*@ where a=&vacc16_0,b=&vt0 */;
    }
    vacc0 = vpadalq_s16(vacc0, vacc16_0) /*@ where a=&vacc0,b=&vacc16_0 */;
  }

  if (XNN_UNLIKELY(batch != 0)) {
    assert(batch >= 1 && batch < 2048);
    int16x8_t vacc16 = vmovq_n_s16(0);
/*@ Inv Assert exists (c0:Z) (c1:Z) (c2:Z) (c3:Z) (w0:Z) (w1:Z) (w2:Z) (w3:Z) (w4:Z) (w5:Z) (w6:Z) (w7:Z), 0<batch@pre && batch@pre<=18446744073709551600 && input@pre!=0 && output==output@pre && output!=0 && params==params@pre && params!=0 && 0<=batch && batch<=rs_rem2048(batch@pre) && rs_mod16(rs_rem2048(batch@pre)-batch)==0 && input==input@pre+(batch@pre-batch) && -2147483648<=c0 && c0<=2147483647 && -2147483648<=c1 && c1<=2147483647 && -2147483648<=c2 && c2<=2147483647 && -2147483648<=c3 && c3<=2147483647 && -256*rs_count16(rs_rem2048(batch@pre)-batch)<=w0 && w0<=254*rs_count16(rs_rem2048(batch@pre)-batch) && -256*rs_count16(rs_rem2048(batch@pre)-batch)<=w1 && w1<=254*rs_count16(rs_rem2048(batch@pre)-batch) && -256*rs_count16(rs_rem2048(batch@pre)-batch)<=w2 && w2<=254*rs_count16(rs_rem2048(batch@pre)-batch) && -256*rs_count16(rs_rem2048(batch@pre)-batch)<=w3 && w3<=254*rs_count16(rs_rem2048(batch@pre)-batch) && -256*rs_count16(rs_rem2048(batch@pre)-batch)<=w4 && w4<=254*rs_count16(rs_rem2048(batch@pre)-batch) && -256*rs_count16(rs_rem2048(batch@pre)-batch)<=w5 && w5<=254*rs_count16(rs_rem2048(batch@pre)-batch) && -256*rs_count16(rs_rem2048(batch@pre)-batch)<=w6 && w6<=254*rs_count16(rs_rem2048(batch@pre)-batch) && -256*rs_count16(rs_rem2048(batch@pre)-batch)<=w7 && w7<=254*rs_count16(rs_rem2048(batch@pre)-batch) && rs_s32(rs_sum4(c0,c1,c2,c3)+rs_sum8(w0,w1,w2,w3,w4,w5,w6,w7))==rs_s32(rs_prefix(A,batch@pre-batch)) && CharArray::full(input@pre,batch@pre+15,A) * store(output,int,Init) * store(&(params->_),char,Tag) * CharArray::full(onemask_table,32,rs_onemask) * store(&(vacc0.s0),int,c0) * store(&(vacc0.s1),int,c1) * store(&(vacc0.s2),int,c2) * store(&(vacc0.s3),int,c3) * store(&(vacc16.s0),short,w0) * store(&(vacc16.s1),short,w1) * store(&(vacc16.s2),short,w2) * store(&(vacc16.s3),short,w3) * store(&(vacc16.s4),short,w4) * store(&(vacc16.s5),short,w5) * store(&(vacc16.s6),short,w6) * store(&(vacc16.s7),short,w7) */
    for (; batch >= 16; batch -= 16) {
      const int8x16_t vt = vld1q_s8(input) /*@ where base=input@pre,count=batch@pre+15,idx=input-input@pre,L=A */; input += 16;
      vacc16 = vpadalq_s8(vacc16, vt) /*@ where a=&vacc16,b=&vt */;
    }
    if (XNN_UNLIKELY(batch != 0)) {
      const int8x16_t vt = vld1q_s8(input) /*@ where base=input@pre,count=batch@pre+15,idx=input-input@pre,L=A */;
      const int8x16_t vonemask = vld1q_s8(&onemask_table[16 - batch]) /*@ where base=onemask_table,count=32,idx=16-batch,L=rs_onemask */;
      const int8x16_t vtm = vmulq_s8(vt, vonemask) /*@ where a=&vt,b=&vonemask */;
      vacc16 = vpadalq_s8(vacc16, vtm) /*@ where a=&vacc16,b=&vtm */;
    }
    vacc0 = vpadalq_s16(vacc0, vacc16) /*@ where a=&vacc0,b=&vacc16 */;
  }
  #if XNN_ARCH_ARM64
    const int32_t vacc = vaddvq_s32(vacc0) /*@ where a=&vacc0 */;
  #else
    int32x2_t vacc_lo = vadd_s32(vget_low_s32(vacc0), vget_high_s32(vacc0));
    vacc_lo = vpadd_s32(vacc_lo, vacc_lo);
    const int32_t vacc = vget_lane_s32(vacc_lo, 0);
  #endif

  *output = (int32_t)((uint32_t)*output + (uint32_t)vacc);
}
