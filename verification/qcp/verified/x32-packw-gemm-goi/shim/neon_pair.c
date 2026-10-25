#include "neon_pair.h"
void pw_neon_pair(size_t kc,const uint32_t*a,const uint32_t*b,uint32_t*p)
/*@ With(F:PWMap)(W:list Z)(O:PWOutput) Require pw_pair_pre(F,W,a,b,p,kc) && pw_data(F) * pw_output(W,O) Ensure pw_data(F) * pw_output(W,pw_pair_run(kc,F,a,b,p,O)) */
{
 uint32x2_t v0=vdup_n_u32(0);
 uint32x2_t v1=vdup_n_u32(0);
 size_t k=kc;
 /*@ Inv Assert exists (x00:Z)(x01:Z)(x10:Z)(x11:Z), kc==kc@pre && pw_pair_pre(F,W,a@pre,b@pre,p@pre,kc@pre) && a==pw_offset(a@pre,4*(kc@pre-k)) && b==pw_offset(b@pre,4*(kc@pre-k)) && p==pw_offset(p@pre,8*(kc@pre-k)) && 0<=k && k<=kc@pre && pw_data(F) * pw_output(W,pw_pair_run(kc@pre-k,F,a@pre,b@pre,p@pre,O)) * store(&(v0.s0),unsigned int,x00) * store(&(v0.s1),unsigned int,x01) * store(&(v1.s0),unsigned int,x10) * store(&(v1.s1),unsigned int,x11) */
 while(k>=2){
  v0=vld1_lane_u32(a,v0,0);
  v1=vld1_lane_u32(a+1,v1,0);
  a+=2;
  v0=vld1_lane_u32(b,v0,1);
  v1=vld1_lane_u32(b+1,v1,1);
  b+=2;
  vst1_u32(p,v0);
  vst1_u32(p+2,v1);
  p+=4;
  k-=2;
 }
 /*@ Inv Assert exists (x00:Z)(x01:Z)(x10:Z)(x11:Z), kc==kc@pre && pw_pair_pre(F,W,a@pre,b@pre,p@pre,kc@pre) && a==pw_offset(a@pre,4*(kc@pre-k)) && b==pw_offset(b@pre,4*(kc@pre-k)) && p==pw_offset(p@pre,8*(kc@pre-k)) && 0<=k && k<=kc@pre && pw_data(F) * pw_output(W,pw_pair_run(kc@pre-k,F,a@pre,b@pre,p@pre,O)) * store(&(v0.s0),unsigned int,x00) * store(&(v0.s1),unsigned int,x01) * store(&(v1.s0),unsigned int,x10) * store(&(v1.s1),unsigned int,x11) */
 while(k!=0){
  v0=vld1_lane_u32(a,v0,0);a+=1;
  v0=vld1_lane_u32(b,v0,1);b+=1;
  vst1_u32(p,v0);p+=2;
  k-=1;
 }
}
