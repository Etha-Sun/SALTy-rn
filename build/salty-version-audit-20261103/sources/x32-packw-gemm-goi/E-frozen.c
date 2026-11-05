#include "../shim/rvv_header.h"
#include "../shim/rvv_pair.h"
#include "../shim/rvv_odd.h"
void test_rvv(size_t g,size_t nc,size_t kc,size_t nr,size_t kr,size_t sr,
 const uint32_t*weights,const uint32_t*bias,const void*scale,
 uint32_t*packed_weights,size_t extra_bytes,const void*params)
/*@ With(F:PWMap)(W:list Z)(G:PWCall)(O:PWOutput) Require g>0 && nc>0 && kc>0 && weights>0 && packed_weights>0 && g==pw_groups(G) && nc==pw_channels(G) && kc==pw_depth(G) && extra_bytes==pw_extra_bytes(G) && nr==2 && kr==1 && sr==1 && pw_program_storage(F,W,G) && weights==pw_weights(G) && bias==pw_bias(G) && packed_weights==pw_output_base(G) && pw_data(F) * pw_output(W,O) Ensure pw_data(F) * pw_output(W,pw_program(F,G,O)) */
{
 assert(g!=0);assert(nc!=0);assert(kc!=0);
 assert(nr==2);assert(kr==1);assert(sr==1);
 assert(weights!=NULL);assert(packed_weights!=NULL);
 size_t group=0;
 /*@ Inv Assert scale==scale@pre && params==params@pre && g==pw_groups(G) && nc==pw_channels(G) && kc==pw_depth(G) && extra_bytes==pw_extra_bytes(G) && nr==2 && kr==1 && sr==1 && pw_program_storage(F,W,G) && 0<=group && group<=g && weights==pw_group_weight(G,group) && bias==pw_bias_at(G,group,0) && packed_weights==pw_tile_output(G,group,0) && pw_data(F) * pw_output(W,pw_group_state(F,G,O,group)) */
 while(group<g){
  const uint32_t*w0=weights;
  size_t n=nc;
  size_t tile=0;
  /*@ Inv Assert scale==scale@pre && params==params@pre && g==pw_groups(G) && nc==pw_channels(G) && kc==pw_depth(G) && extra_bytes==pw_extra_bytes(G) && nr==2 && kr==1 && sr==1 && pw_program_storage(F,W,G) && 0<=group && group<g && 0<=tile && tile<=pw_tiles(G) && n==nc-2*tile && 0<=n && n<=nc && weights==pw_group_weight(G,group) && w0==pw_tile_weight(G,group,tile) && bias==pw_bias_at(G,group,2*tile) && packed_weights==pw_tile_output(G,group,tile) && pw_data(F) * pw_output(W,pw_tile_state(F,G,O,group,tile)) */
  while(n>=2){
   pw_rvv_header(bias,packed_weights,2);
   if(bias!=NULL)bias+=2;
   packed_weights+=2;
   const uint32_t*w1=w0+kc;
   pw_rvv_pair(kc,w0,w1,packed_weights);
   packed_weights+=2*kc;
   packed_weights=(uint32_t*)((uintptr_t)packed_weights+extra_bytes);
   w0=w1+kc;
   n-=2;
   tile+=1;
  }
  if(n!=0){
   pw_rvv_header(bias,packed_weights,1);
   if(bias!=NULL)bias+=1;
   packed_weights+=2;
   pw_rvv_odd(kc,w0,packed_weights);
   packed_weights+=2*kc;
   packed_weights=(uint32_t*)((uintptr_t)packed_weights+extra_bytes);
   tile+=1;
  }
  weights+=nc*kc;
  group+=1;
 }
}
