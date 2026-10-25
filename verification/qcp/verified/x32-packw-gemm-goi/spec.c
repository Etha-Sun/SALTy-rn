#include "shim/kernel_specs.h"
#include "shim/observe.h"
/* Both real kernels execute on the same live output buffer. The first
   observed UInt32 is held in an actual C local across the second call.
   Unwritten None cells are retained by the full state theorem; observation
   itself requires an initialized word, rather than assigning a default. */
int test_equivalence(size_t g,size_t nc,size_t kc,size_t nr,size_t kr,size_t sr,
 const uint32_t*weights,const uint32_t*bias,const void*scale,
 uint32_t*packed_weights,size_t extra_bytes,const void*params,const uint32_t*address)
/*@ With(F:PWMap)(W:list Z)(G:PWCall)(O:PWOutput)(x:Z)
 Require g>0 && nc>0 && kc>0 && weights>0 && packed_weights>0 && g==pw_groups(G) && nc==pw_channels(G) && kc==pw_depth(G) && extra_bytes==pw_extra_bytes(G) && nr==2 && kr==1 && sr==1 && pw_program_storage(F,W,G) && weights==pw_weights(G) && bias==pw_bias(G) && packed_weights==pw_output_base(G) && address>0 && In(address,W) && pw_observation(F,G,O,address,x) && pw_data(F) * pw_output(W,O)
 Ensure __return==1 && pw_data(F) * pw_output(W,pw_program(F,G,O)) */
{
 test_neon(g,nc,kc,nr,kr,sr,weights,bias,scale,packed_weights,extra_bytes,params) /*@ where F=F,W=W,G=G */;
 const uint32_t left=pw_read_output(address) /*@ where W=W,x=x */;
 test_rvv(g,nc,kc,nr,kr,sr,weights,bias,scale,packed_weights,extra_bytes,params) /*@ where F=F,W=W,G=G */;
 const uint32_t right=pw_read_output(address) /*@ where W=W,x=x */;
 return left==right;
}
