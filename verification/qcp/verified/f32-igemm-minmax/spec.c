/* Full actual IGEMM candidate; proof status is proof/status.json. */
#include "contracts/model.h"
void test_neon(size_t mr,size_t nc,size_t kc,size_t ks,const float **a,const float *w,float *c,size_t cm_stride,size_t cn_stride,size_t a_offset,const float *zero,const struct xnn_f32_minmax_params *params)
/*@ With (Entries:list Z) (Refs:list input_reference) (Blocks:list input_block) (W:list fp32) (lo:fp32) (hi:fp32)
 Require mr==1 && 0<nc && nc<=4611686018427387903 && 0<kc && kc%4==0 && 0<ks && ks%8==0 && a_offset%4==0 && igemm_shape(mr,nc,kc/4,ks,Entries,Refs,Blocks,zero,a_offset,W) && igemm_capacity(nc,kc/4,a,w,c,Blocks,Refs) && cn_stride==32 && a!=0 && w!=0 && c!=0 && params!=0 &&
 PtrArray::full(a,ks/8,Entries) * input_pool(Blocks) * FloatArray::full(w,packed_length(nc,total_depth(kc/4,Refs)),W) * FloatArray::undef_full(c,nc) * store(&(params->scalar.min),float,lo) * store(&(params->scalar.max),float,hi)
 Ensure PtrArray::full(a@pre,ks@pre/8,Entries) * input_pool(Blocks) * FloatArray::full(w@pre,packed_length(nc@pre,total_depth(kc@pre/4,Refs)),W) * ig_output_ref(c@pre,total_depth(kc@pre/4,Refs),nc@pre,flat_inputs(Blocks,Refs,kc@pre/4),W,lo,hi) * store(&(params->scalar.min),float,lo) * store(&(params->scalar.max),float,hi) */;

void test_rvv(size_t mr,size_t nc,size_t kc,size_t ks,const float **a,const float *w,float *c,size_t cm_stride,size_t cn_stride,size_t a_offset,const float *zero,const struct xnn_f32_minmax_params *params)
/*@ With (Entries:list Z) (Refs:list input_reference) (Blocks:list input_block) (W:list fp32) (lo:fp32) (hi:fp32)
 Require mr==1 && 0<nc && nc<=4611686018427387903 && 0<kc && kc%4==0 && 0<ks && ks%8==0 && a_offset%4==0 && igemm_shape(mr,nc,kc/4,ks,Entries,Refs,Blocks,zero,a_offset,W) && igemm_capacity(nc,kc/4,a,w,c,Blocks,Refs) && cn_stride==32 && a!=0 && w!=0 && c!=0 && params!=0 &&
 PtrArray::full(a,ks/8,Entries) * input_pool(Blocks) * FloatArray::full(w,packed_length(nc,total_depth(kc/4,Refs)),W) * FloatArray::undef_full(c,nc) * store(&(params->scalar.min),float,lo) * store(&(params->scalar.max),float,hi)
 Ensure PtrArray::full(a@pre,ks@pre/8,Entries) * input_pool(Blocks) * FloatArray::full(w@pre,packed_length(nc@pre,total_depth(kc@pre/4,Refs)),W) * ig_output_ref(c@pre,total_depth(kc@pre/4,Refs),nc@pre,flat_inputs(Blocks,Refs,kc@pre/4),W,lo,hi) * store(&(params->scalar.min),float,lo) * store(&(params->scalar.max),float,hi) */;

float ig_preserve_float(float x)
/*@ Require emp Ensure ig_bit_same(__return,x) && emp */
{ return x; }

int ig_same_lane(float x,float y)
/*@ Require ig_same_value(x,y) && emp Ensure ig_ret_one(__return) && emp */
{
 float xc=ig_preserve_float(x);
 float yc=ig_preserve_float(y);
 if(x==y) return 1;
 if(x!=xc && y!=yc) return 1;
 return 0;
}

int ig_compare_outputs(size_t n,const float *left,const float *right)
/*@ With (L:list fp32) (R:list fp32)
 Require 0<n && n<=4611686018427387903 && ig_outputs_related(L,R) &&
 FloatArray::full(left,n,L) * FloatArray::full(right,n,R)
 Ensure ig_ret_one(__return) && FloatArray::full(left,n,L) * FloatArray::full(right,n,R) */
{
 size_t i=0;
 /*@ Inv n==n@pre && left==left@pre && right==right@pre &&
 0<n && n<=4611686018427387903 && 0<=i && i<=n &&
 Zlength(L)==n && ig_outputs_related(L,R) &&
 FloatArray::full(left,n,L) * FloatArray::full(right,n,R) */
 while(i<n) {
  /*@ 0<=i && i<n && ig_outputs_related(L,R) &&
 FloatArray::full(left,n,L) * FloatArray::full(right,n,R)
 which implies ig_same_value(L[i],R[i]) && 0<=i && i<n &&
 FloatArray::missing_i(left,i,0,n,L) * store(left+i,float,L[i]) *
 FloatArray::missing_i(right,i,0,n,R) * store(right+i,float,R[i]) */
 float x=left[i];
  float y=right[i];
  /*@ 0<=i && i<n && FloatArray::missing_i(left,i,0,n,L) * store(left+i,float,L[i]) *
  FloatArray::missing_i(right,i,0,n,R) * store(right+i,float,R[i])
  which implies 0<=i && i<n && FloatArray::full(left,n,L) * FloatArray::full(right,n,R) */
  if(!ig_same_lane(x,y)) return 0;
  i++;
 }
 return 1;
}

int equivalent(size_t mr,size_t nc,size_t kc,size_t ks,const float **a,const float *w,
 float *left,float *right,size_t a_offset,const float *zero,const struct xnn_f32_minmax_params *params)
/*@ With (Entries:list Z) (Refs:list input_reference) (Blocks:list input_block) (W:list fp32) (lo:fp32) (hi:fp32)
 Require mr==1 && 0<nc && nc<=4611686018427387903 && 0<kc && kc%4==0 && 0<ks && ks%8==0 && a_offset%4==0 && igemm_shape(mr,nc,kc/4,ks,Entries,Refs,Blocks,zero,a_offset,W) && igemm_capacity(nc,kc/4,a,w,left,Blocks,Refs) && igemm_capacity(nc,kc/4,a,w,right,Blocks,Refs) && a!=0 && w!=0 && left!=0 && right!=0 && params!=0 &&
 PtrArray::full(a,ks/8,Entries) * input_pool(Blocks) * FloatArray::full(w,packed_length(nc,total_depth(kc/4,Refs)),W) * FloatArray::undef_full(left,nc) * FloatArray::undef_full(right,nc) * store(&(params->scalar.min),float,lo) * store(&(params->scalar.max),float,hi)
 Ensure exists (L:list fp32) (R:list fp32), __return==1 && ig_outputs_related(L,R) &&
 PtrArray::full(a,ks/8,Entries) * input_pool(Blocks) * FloatArray::full(w,packed_length(nc,total_depth(kc/4,Refs)),W) * FloatArray::full(left,nc,L) * FloatArray::full(right,nc,R) * store(&(params->scalar.min),float,lo) * store(&(params->scalar.max),float,hi) */
{
 test_neon(mr,nc,kc,ks,a,w,left,0,32,a_offset,zero,params);
 test_rvv(mr,nc,kc,ks,a,w,right,0,32,a_offset,zero,params);
 /*@ 0<kc && ig_output_ref(left,total_depth(kc/4,Refs),nc,flat_inputs(Blocks,Refs,kc/4),W,lo,hi) *
 ig_output_ref(right,total_depth(kc/4,Refs),nc,flat_inputs(Blocks,Refs,kc/4),W,lo,hi) which implies
 exists (L:list fp32) (R:list fp32), 0<kc && ig_outputs_related(L,R) &&
 FloatArray::full(left,nc,L) * FloatArray::full(right,nc,R) */
 return ig_compare_outputs(nc,left,right);
}
