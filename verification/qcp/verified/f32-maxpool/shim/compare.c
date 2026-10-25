#include "compare.h"
/* Ordinary actual C: only the three original NEON primitives are specification
   exceptions. Unobserved padding may be unknown; lane0 is known initialized. */
unsigned int mp_output_bits_at(const float*p)
/*@ With (W:list Z) (O:MPOutput) (v:fp32)
 Require p!=0 && mp_write_window(W,p,4) && mp_out_known(O,p,v) && mp_out(W,O)
 Ensure __return==bits_of_fp32(v) && mp_out(W,O) */
{
  float32x4_t a=vld1q_f32(p) /*@ where (output_map) W=W,O=O */;
  uint32x4_t b=vreinterpretq_u32_f32(a) /*@ where a=&a */;
  return vgetq_lane_u32(b,0) /*@ where a=&b */;
}
int mp_same_output_at(const float*a,const float*b)
/*@ With (W1:list Z) (W2:list Z) (O1:MPOutput) (O2:MPOutput) (v1:fp32) (v2:fp32)
 Require a!=0 && b!=0 && mp_write_window(W1,a,4) && mp_write_window(W2,b,4) && mp_out_known(O1,a,v1) && mp_out_known(O2,b,v2) && mp_out(W1,O1) * mp_out(W2,O2)
 Ensure __return==mp_word_equal(bits_of_fp32(v1),bits_of_fp32(v2)) && mp_out(W1,O1) * mp_out(W2,O2) */
{
  unsigned int x=mp_output_bits_at(a) /*@ where W=W1,O=O1,v=v1 */;
  unsigned int y=mp_output_bits_at(b) /*@ where W=W2,O=O2,v=v2 */;
  return x==y;
}
