#include "shim/neon_specs.h"
void xt_zip_split_probe(const uint32_t*p,const uint32_t*q,uint32_t*lo,uint32_t*hi)
/*@ With(F:XTMap)(W:list Z)(O:XTOutput)
 Require xt_window(F,p,2) && xt_window(F,q,2) && xt_write_window(W,lo,2) && xt_write_window(W,hi,2) && xt_data(F) * xt_output(W,O)
 Ensure xt_data(F) * xt_output(W,xt_write_pair(xt_write_pair(O,hi,xt_load_lane(F,p,1),xt_load_lane(F,q,1)),lo,xt_load_lane(F,p,0),xt_load_lane(F,q,0))) */
{
 const uint32x2_t a=vld1_u32(p);
 const uint32x2_t b=vld1_u32(q);
 const uint32x2_t low=vzip1_u32(a,b);
 const uint32x2_t high=vzip2_u32(a,b);
 vst1_u32(hi,high);
 vst1_u32(lo,low);
}
