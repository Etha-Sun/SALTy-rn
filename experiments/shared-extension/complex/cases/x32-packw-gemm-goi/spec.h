#ifndef PACK_SPEC_H
#define PACK_SPEC_H
#include "u32_shim.h"
void test_neon(size_t,size_t,size_t,size_t,size_t,size_t,const uint32_t*,const uint32_t*,const void*,uint32_t*,size_t,const void*);
void test_rvv(size_t,size_t,size_t,size_t,size_t,size_t,const uint32_t*,const uint32_t*,const void*,uint32_t*,size_t,const void*);
/* nr=2, kr=sr=1 are the original assertions, not a proof simplification.
   extra is padding in uint32 words. Compare the whole output allocation,
   including reserved odd-channel/padding slots, from equal initial memories. */
/*@ requires groups: 0<g<=SIZE_MAX/32;
    requires channels: 0<nc<=SIZE_MAX/32;
    requires reduction: 0<kc<=SIZE_MAX/32;
    requires padding: extra<=SIZE_MAX/32;
    requires weights_extent: g*nc*kc<=SIZE_MAX/8;
    requires output_extent: g*((nc+1)/2)*(2+2*kc+extra)<=SIZE_MAX/8;
    requires weights_memory: \valid_read(weights+(0..g*nc*kc-1));
    requires bias_memory: bias==\null || \valid_read(bias+(0..g*nc-1));
    requires left_memory: \valid(left+(0..g*((nc+1)/2)*(2+2*kc+extra)-1));
    requires right_memory: \valid(right+(0..g*((nc+1)/2)*(2+2*kc+extra)-1));
    requires disjoint: \separated(weights+(0..g*nc*kc-1),left+(0..g*((nc+1)/2)*(2+2*kc+extra)-1),right+(0..g*((nc+1)/2)*(2+2*kc+extra)-1));
    requires bias_disjoint: bias==\null || \separated(bias+(0..g*nc-1),left+(0..g*((nc+1)/2)*(2+2*kc+extra)-1),right+(0..g*((nc+1)/2)*(2+2*kc+extra)-1));
    requires initial: \forall integer i; 0<=i<g*((nc+1)/2)*(2+2*kc+extra) ==> left[i]==right[i];
    terminates \true;
    assigns left[0..g*((nc+1)/2)*(2+2*kc+extra)-1],right[0..g*((nc+1)/2)*(2+2*kc+extra)-1];
    ensures equal: \result==1;
*/
int equivalent(size_t g,size_t nc,size_t kc,size_t extra,const uint32_t *weights,const uint32_t *bias,uint32_t *left,uint32_t *right);
#endif
