#include "rvv_header.h"
void pw_rvv_header(const uint32_t*b,uint32_t*p,size_t count)
/*@ With(F:PWMap)(W:list Z)(O:PWOutput) Require pw_header_pre(F,W,b,p,count) && pw_data(F) * pw_output(W,O) Ensure pw_data(F) * pw_output(W,pw_header_run(F,b,p,count,O)) */
{
 if(b!=0){
  if(count==2){
   vuint32m1_t v=__riscv_vle32_v_u32m1(b,2);
   __riscv_vse32_v_u32m1(p,v,2);
  }else{
   uint32_t x=pw_read_word(b);
   pw_write_word(p,x);
  }
 }else{
  vuint32m1_t z=__riscv_vmv_v_x_u32m1(0,2);
  __riscv_vse32_v_u32m1(p,z,2);
 }
}
