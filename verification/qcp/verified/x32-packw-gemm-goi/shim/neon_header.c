#include "neon_header.h"
void pw_neon_header(const uint32_t*b,uint32_t*p,size_t count)
/*@ With(F:PWMap)(W:list Z)(O:PWOutput) Require pw_header_pre(F,W,b,p,count) && pw_data(F) * pw_output(W,O) Ensure pw_data(F) * pw_output(W,pw_header_run(F,b,p,count,O)) */
{
 if(b!=0){
  if(count==2){
   uint32x2_t v=vld1_u32(b);
   vst1_u32(p,v);
  }else{
   uint32_t x=pw_read_word(b);
   pw_write_word(p,x);
  }
 }else{
  uint32x2_t z=vmov_n_u32(0);
  vst1_u32(p,z);
 }
}
