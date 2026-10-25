#include "neon_odd.h"
void pw_neon_odd(size_t kc,const uint32_t*a,uint32_t*p)
/*@ With(F:PWMap)(W:list Z)(O:PWOutput)
 Require pw_map_nodup(F) && pw_odd_pre(F,W,a,p,kc) && pw_data(F) * pw_output(W,O)
 Ensure pw_data(F) * pw_output(W,pw_odd_run(kc,F,a,p,O)) */
{
 size_t k=kc;
 /*@ Inv Assert kc==kc@pre && pw_map_nodup(F) && pw_odd_pre(F,W,a@pre,p@pre,kc@pre) && a==pw_offset(a@pre,4*(kc@pre-k)) && p==pw_offset(p@pre,8*(kc@pre-k)) && 0<=k && k<=kc@pre && pw_data(F) * pw_output(W,pw_odd_run(kc@pre-k,F,a@pre,p@pre,O)) */
 while(k!=0){
  uint32_t x=pw_read_word(a);
  a+=1;
  pw_write_word(p,x);
  p+=2;
  k-=1;
 }
}
