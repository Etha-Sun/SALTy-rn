#include "rvv_odd.h"
void pw_rvv_odd(size_t kc,const uint32_t*a,uint32_t*p)
/*@ With(F:PWMap)(W:list Z)(O:PWOutput) Require pw_odd_pre(F,W,a,p,kc) && pw_data(F) * pw_output(W,O) Ensure pw_data(F) * pw_output(W,pw_odd_run(kc,F,a,p,O)) */
{
 size_t k=kc;
 /*@ Inv Assert kc==kc@pre && pw_odd_pre(F,W,a@pre,p@pre,kc@pre) && a==pw_offset(a@pre,4*(kc@pre-k)) && p==pw_offset(p@pre,8*(kc@pre-k)) && 0<=k && k<=kc@pre && pw_data(F) * pw_output(W,pw_odd_run(kc@pre-k,F,a@pre,p@pre,O)) */
 while(k>0){
  size_t vl=__riscv_vsetvl_e32m4(k);
  vuint32m4_t va=__riscv_vle32_v_u32m4(a,vl);
  __riscv_vsse32_v_u32m4(p,8,va,vl);
  a+=vl;
  p+=2*vl;
  k-=vl;
 }
}
