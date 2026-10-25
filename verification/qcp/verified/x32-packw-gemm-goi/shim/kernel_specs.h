#ifndef X32_PACKW_KERNEL_SPECS_H
#define X32_PACKW_KERNEL_SPECS_H
#include "program_model.h"
void test_neon(size_t g,size_t nc,size_t kc,size_t nr,size_t kr,size_t sr,
 const uint32_t*weights,const uint32_t*bias,const void*scale,
 uint32_t*packed_weights,size_t extra_bytes,const void*params)
/*@ With(F:PWMap)(W:list Z)(G:PWCall)(O:PWOutput) Require g>0 && nc>0 && kc>0 && weights>0 && packed_weights>0 && g==pw_groups(G) && nc==pw_channels(G) && kc==pw_depth(G) && extra_bytes==pw_extra_bytes(G) && nr==2 && kr==1 && sr==1 && pw_program_storage(F,W,G) && weights==pw_weights(G) && bias==pw_bias(G) && packed_weights==pw_output_base(G) && pw_data(F) * pw_output(W,O) Ensure pw_data(F) * pw_output(W,pw_program(F,G,O)) */;
void test_rvv(size_t g,size_t nc,size_t kc,size_t nr,size_t kr,size_t sr,
 const uint32_t*weights,const uint32_t*bias,const void*scale,
 uint32_t*packed_weights,size_t extra_bytes,const void*params)
/*@ With(F:PWMap)(W:list Z)(G:PWCall)(O:PWOutput) Require g>0 && nc>0 && kc>0 && weights>0 && packed_weights>0 && g==pw_groups(G) && nc==pw_channels(G) && kc==pw_depth(G) && extra_bytes==pw_extra_bytes(G) && nr==2 && kr==1 && sr==1 && pw_program_storage(F,W,G) && weights==pw_weights(G) && bias==pw_bias(G) && packed_weights==pw_output_base(G) && pw_data(F) * pw_output(W,O) Ensure pw_data(F) * pw_output(W,pw_program(F,G,O)) */;
#endif
