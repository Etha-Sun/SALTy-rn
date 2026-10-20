#include "spec.h"
int equivalent(size_t h,size_t w,size_t channels,const float *input,const float *weights,const float *zero,float *left,float *right,float lower,float upper) {
  struct xnn_f32_minmax_params params={{lower,upper}};
  size_t oh=(h+1)/2,ow=(w+1)/2;
  test_neon(h,w,0,oh,input,zero,weights,left,1,channels,ow*4,oh*ow*4,&params);
  test_rvv(h,w,0,oh,input,zero,weights,right,1,channels,ow*4,oh*ow*4,&params);
  /*@ loop invariant 0<=i<=channels*oh*ow;
      loop invariant \forall integer j; 0<=j<i ==> (\eq_float(left[j],right[j]) || (\is_NaN(left[j]) && \is_NaN(right[j])));
      loop assigns i;
      loop variant channels*oh*ow-i;
  */
  for(size_t i=0;i<channels*oh*ow;i++)if(!(left[i]==right[i] || (left[i]!=left[i] && right[i]!=right[i])))return 0;
  return 1;
}

/*@ lemma cv_progress_before{L}: \forall float *I,*Z,*WT;\forall integer H,W,pad,y,x,c,t;
 0<=t<=cv_neon_steps(W,x) ==> ext_same(cv_progress(I,Z,WT,H,W,pad,y,x,c,t),cv_fold(I,Z,WT,H,W,pad,y,x,c,t));
 lemma cv_progress_done{L}: \forall float *I,*Z,*WT;\forall integer H,W,pad,y,x,c,t;
 t>=cv_neon_steps(W,x) ==> ext_same(cv_progress(I,Z,WT,H,W,pad,y,x,c,t),cv_fold(I,Z,WT,H,W,pad,y,x,c,cv_neon_steps(W,x)));
 lemma cv_progress_skip{L}: \forall float *I,*Z,*WT;\forall integer H,W,pad,y,x,c,t;
 t>=cv_neon_steps(W,x) ==> ext_same(cv_progress(I,Z,WT,H,W,pad,y,x,c,t+1),cv_progress(I,Z,WT,H,W,pad,y,x,c,t));
*/
/*@ \wp::strategy CvPointSolve: \prover("cvc5",10), \prover("z3",10);
    \wp::strategy CvPointFilter: \tactic("Wp.filter",\children(CvPointSolve)), CvPointSolve;
    \wp::proof CvPointFilter: equivalent;
    \wp::strategy CvHelperSolve: \prover("cvc5",5), \prover("z3",5);
    \wp::strategy CvHelperFilter: \tactic("Wp.filter",\children(CvHelperSolve)), CvHelperSolve;
    \wp::proof CvHelperFilter: canonical_nan;
    \wp::proof CvHelperFilter: vminq_f32; \wp::proof CvHelperFilter: vmaxq_f32; \wp::proof CvHelperFilter: vmin_f32; \wp::proof CvHelperFilter: vmax_f32;
    \wp::proof CvHelperFilter: vst1q_f32; \wp::proof CvHelperFilter: vst1_f32; \wp::proof CvHelperFilter: vld2q_dup_f32; \wp::proof CvHelperFilter: vld2_dup_f32;
    \wp::proof CvHelperFilter: vextq_f32; \wp::proof CvHelperFilter: vzip2q_f32;
    \wp::proof CvHelperFilter: vfmaq_lane_f32; \wp::proof CvHelperFilter: vfmaq_laneq_f32; \wp::proof CvHelperFilter: vfma_f32;
    \wp::proof CvHelperFilter: __riscv_vse32_v_f32m1;
    \wp::proof CvHelperFilter: __riscv_vfmacc_vf_f32m1; \wp::proof CvHelperFilter: __riscv_vfmacc_vv_f32m1;
    \wp::proof CvHelperFilter: __riscv_vmerge_vvm_f32m1; \wp::proof CvHelperFilter: __riscv_vmand_mm_b32;
    \wp::proof CvHelperFilter: __riscv_vfslide1up_vf_f32m1; \wp::proof CvHelperFilter: __riscv_vfslide1down_vf_f32m1;
    \wp::strategy CvLemmaSolve: \prover("z3",30), \prover("cvc5",30);
    \wp::proof CvLemmaSolve: ci_u32_sub_cast; \wp::proof CvLemmaSolve: ci_u32_add_cast;
*/
