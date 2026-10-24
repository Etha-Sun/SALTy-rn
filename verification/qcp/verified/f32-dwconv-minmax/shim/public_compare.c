#include "public_compare.h"
int compare_outputs(size_t channels,size_t output_width,const float *left,const float *right,size_t output_increment)
/*@ With (D:DwProgram) (out2:Z) (W1:list Z) (W2:list Z) (O1:DwOutput) (O2:DwOutput) Require channels==dw_channels(D) && output_width==dw_width(D) && output_increment==dw_out_increment(D) && 0<channels && 0<output_width && dw_distinct(W1) && dw_distinct(W2) && dw_output_domain(W1,D) && dw_output_domain(W2,dw_rebase(D,out2)) && dw_pair_observed(D,out2,O1,O2) && left==dw_out(D) && right==out2 && dw_output(W1,O1) * dw_output(W2,O2) Ensure __return==1 && dw_output(W1,O1) * dw_output(W2,O2) */
{
  size_t pixels=output_width;
  /*@ Inv Assert channels==dw_channels(D) && output_width==dw_width(D) && output_increment==dw_out_increment(D) && 0<channels && 0<output_width && dw_distinct(W1) && dw_distinct(W2) && dw_output_domain(W1,D) && dw_output_domain(W2,dw_rebase(D,out2)) && dw_pair_observed(D,out2,O1,O2) && 0<=pixels && pixels<=output_width && left==dw_output_at(D,(output_width-pixels)) && right==dw_output_at(dw_rebase(D,out2),(output_width-pixels)) && dw_output(W1,O1) * dw_output(W2,O2) */
  while(pixels!=0){
    size_t remaining=channels;
    /*@ Inv Assert channels==dw_channels(D) && output_width==dw_width(D) && output_increment==dw_out_increment(D) && 0<channels && 0<output_width && dw_distinct(W1) && dw_distinct(W2) && dw_output_domain(W1,D) && dw_output_domain(W2,dw_rebase(D,out2)) && dw_pair_observed(D,out2,O1,O2) && 0<pixels && pixels<=output_width && 0<=remaining && remaining<=channels && left==dw_output_at(D,(output_width-pixels))+4*(channels-remaining) && right==dw_output_at(dw_rebase(D,out2),(output_width-pixels))+4*(channels-remaining) && dw_output(W1,O1) * dw_output(W2,O2) */
    while(remaining!=0){
      /*@ Assert channels==dw_channels(D) && output_width==dw_width(D) && output_increment==dw_out_increment(D) && 0<channels && 0<output_width && dw_distinct(W1) && dw_distinct(W2) && dw_output_domain(W1,D) && dw_output_domain(W2,dw_rebase(D,out2)) && dw_pair_observed(D,out2,O1,O2) && 0<pixels && pixels<=output_width && 0<=remaining && remaining<=channels && left==dw_output_at(D,(output_width-pixels))+4*(channels-remaining) && right==dw_output_at(dw_rebase(D,out2),(output_width-pixels))+4*(channels-remaining) && 0<remaining && left!=0 && right!=0 && dw_owned(W1,left) && dw_owned(W2,right) && dw_output_ready(O1,left) && dw_output_ready(O2,right) && dw_observed_pair(O1,O2,left,right) && dw_output(W1,O1) * dw_output(W2,O2) */
      float x=dw_read_written(left) /*@ where W=W1,O=O1 */;
      float y=dw_read_written(right) /*@ where W=W2,O=O2 */;
      if(!same_lane(x,y)) return 0;
      left++;
      right++;
      --remaining;
    }
    left=(const float*)((uintptr_t)left+output_increment);
    right=(const float*)((uintptr_t)right+output_increment);
    --pixels;
  }
  return 1;
}
