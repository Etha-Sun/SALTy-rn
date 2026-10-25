#include "rvv_pair.h"
void pw_rvv_pair(size_t kc,const uint32_t*a,const uint32_t*b,uint32_t*p)
/*@ With(F:PWMap)(W:list Z)(O:PWOutput) Require pw_pair_pre(F,W,a,b,p,kc) && pw_data(F) * pw_output(W,O) Ensure pw_data(F) * pw_output(W,pw_pair_run(kc,F,a,b,p,O)) */
{
 size_t k=kc;
 /*@ Inv Assert kc==kc@pre && pw_pair_pre(F,W,a@pre,b@pre,p@pre,kc@pre) && a==pw_offset(a@pre,4*(kc@pre-k)) && b==pw_offset(b@pre,4*(kc@pre-k)) && p==pw_offset(p@pre,8*(kc@pre-k)) && 0<=k && k<=kc@pre && pw_data(F) * pw_output(W,pw_pair_run(kc@pre-k,F,a@pre,b@pre,p@pre,O)) */
 while(k>0){
  size_t vl=__riscv_vsetvl_e32m4(k);
  vuint32m4_t va=__riscv_vle32_v_u32m4(a,vl);
  vuint32m4_t vb=__riscv_vle32_v_u32m4(b,vl);
  pw_store_pair_vectors(p,&va,&vb,vl);
  a+=vl;
  b+=vl;
  p+=2*vl;
  k-=vl;
 }
}
