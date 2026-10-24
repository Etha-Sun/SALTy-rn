/* Whole IGEMM candidate. Kernel bodies are not yet proved.
 * The same backing allocation may serve repeated/overlapping input windows.
 * Only table/data/packed/output resources that are actually distinct are separated. */
#include "contracts/model.h"
#include "shim/copy.h"
/*@ Import Coq Require Import Qd8CallerModel.CallerModel */
/*@ Extern Coq (qd8_ret_one:Z -> Prop)
 (FloatArray::missing_i:Z -> Z -> Z -> Z -> list fp32 -> Assertion) */

void test_neon(size_t mr,size_t nc,size_t kc,size_t ks,const int8_t **a,
 const void *w,float *c,size_t cm_stride,size_t cn_stride,size_t a_offset,
 const int8_t *zero,const int8_t *zero_data,const struct xnn_f32_minmax_params *params,
 const struct xnn_qd8_quantization_params *quantization_params)
/*@ With (Entries:list Z) (Refs:list input_reference) (Blocks:list input_block) (Ps:list panel_data) (zp:Z) (inv:fp32) (lo:fp32) (hi:fp32)
 Require mr==1 && 0<nc && nc<=4611686018427387903 && 0<kc && 0<ks && ks%8==0 && igemm_shape(mr,nc,kc,ks,Entries,Refs,Blocks,zero,zero_data,a_offset,Ps) && igemm_capacity(nc,kc,a,w,c,Blocks,Refs) && cn_stride==32 && a!=0 && w!=0 && c!=0 && params!=0 && quantization_params!=0 &&
 PtrArray::full(a,ks/8,Entries) * input_pool(Blocks) * packed_matrix(total_depth(kc,Refs),w,Ps) * FloatArray::undef_full(c,nc) * store(&(params->scalar.min),float,lo) * store(&(params->scalar.max),float,hi) *
 store(&(quantization_params->zero_point),int,zp) * store(&(quantization_params->inv_scale),float,inv)
 Ensure PtrArray::full(a@pre,ks@pre/8,Entries) * input_pool(Blocks) * packed_matrix(total_depth(kc@pre,Refs),w@pre,Ps) *
 qd8_output_ref(c@pre,total_depth(kc@pre,Refs),nc@pre,zp,flat_inputs(Blocks,Refs,kc@pre),Ps,inv,lo,hi) *
 store(&(params->scalar.min),float,lo) * store(&(params->scalar.max),float,hi) *
 store(&(quantization_params->zero_point),int,zp) * store(&(quantization_params->inv_scale),float,inv) */;

void test_rvv(size_t mr,size_t nc,size_t kc,size_t ks,const int8_t **a,
 const void *w,float *c,size_t cm_stride,size_t cn_stride,size_t a_offset,
 const int8_t *zero,const int8_t *zero_data,const struct xnn_f32_minmax_params *params,
 const struct xnn_qd8_quantization_params *quantization_params)
/*@ With (Entries:list Z) (Refs:list input_reference) (Blocks:list input_block) (Ps:list panel_data) (zp:Z) (inv:fp32) (lo:fp32) (hi:fp32)
 Require mr==1 && 0<nc && nc<=4611686018427387903 && 0<kc && 0<ks && ks%8==0 && igemm_shape(mr,nc,kc,ks,Entries,Refs,Blocks,zero,zero_data,a_offset,Ps) && igemm_capacity(nc,kc,a,w,c,Blocks,Refs) && cn_stride==32 && a!=0 && w!=0 && c!=0 && params!=0 && quantization_params!=0 &&
 PtrArray::full(a,ks/8,Entries) * input_pool(Blocks) * packed_matrix(total_depth(kc,Refs),w,Ps) * FloatArray::undef_full(c,nc) * store(&(params->scalar.min),float,lo) * store(&(params->scalar.max),float,hi) *
 store(&(quantization_params->zero_point),int,zp) * store(&(quantization_params->inv_scale),float,inv)
 Ensure PtrArray::full(a@pre,ks@pre/8,Entries) * input_pool(Blocks) * packed_matrix(total_depth(kc@pre,Refs),w@pre,Ps) *
 qd8_output_ref(c@pre,total_depth(kc@pre,Refs),nc@pre,zp,flat_inputs(Blocks,Refs,kc@pre),Ps,inv,lo,hi) *
 store(&(params->scalar.min),float,lo) * store(&(params->scalar.max),float,hi) *
 store(&(quantization_params->zero_point),int,zp) * store(&(quantization_params->inv_scale),float,inv) */;

float qd8_preserve_float(float x)
/*@ Require emp Ensure qd8_bit_same(__return,x) && emp */
{ return x; }

int qd8_same_lane(float x,float y)
/*@ Require qd8_same_value(x,y) && emp Ensure qd8_ret_one(__return) && emp */
{
 float xc=qd8_preserve_float(x);
 float yc=qd8_preserve_float(y);
 if(x==y) return 1;
 if(x!=xc && y!=yc) return 1;
 return 0;
}

int qd8_compare_outputs(size_t n,const float *left,const float *right)
/*@ With (L:list fp32) (R:list fp32)
 Require 0<n && n<=4611686018427387903 && qd8_outputs_related(L,R) &&
 FloatArray::full(left,n,L) * FloatArray::full(right,n,R)
 Ensure qd8_ret_one(__return) && FloatArray::full(left,n,L) * FloatArray::full(right,n,R) */
{
 size_t i=0;
 /*@ Inv n==n@pre && left==left@pre && right==right@pre &&
 0<n && n<=4611686018427387903 && 0<=i && i<=n &&
 Zlength(L)==n && qd8_outputs_related(L,R) &&
 FloatArray::full(left,n,L) * FloatArray::full(right,n,R) */
 while(i<n) {
  /*@ 0<=i && i<n && qd8_outputs_related(L,R) &&
 FloatArray::full(left,n,L) * FloatArray::full(right,n,R)
 which implies qd8_same_value(L[i],R[i]) && 0<=i && i<n &&
 FloatArray::missing_i(left,i,0,n,L) * store(left+i,float,L[i]) *
 FloatArray::missing_i(right,i,0,n,R) * store(right+i,float,R[i]) */
 float x=left[i];
  float y=right[i];
  /*@ 0<=i && i<n && FloatArray::missing_i(left,i,0,n,L) * store(left+i,float,L[i]) *
  FloatArray::missing_i(right,i,0,n,R) * store(right+i,float,R[i])
  which implies 0<=i && i<n && FloatArray::full(left,n,L) * FloatArray::full(right,n,R) */
  if(!qd8_same_lane(x,y)) return 0;
  i++;
 }
 return 1;
}

int equivalent(size_t mr,size_t nc,size_t kc,size_t ks,const int8_t **a,const void *w,
 float *left,float *right,size_t a_offset,const int8_t *zero,const int8_t *zero_data,
 const struct xnn_f32_minmax_params *params,
 const struct xnn_qd8_quantization_params *quantization_params)
/*@ With (Entries:list Z) (Refs:list input_reference) (Blocks:list input_block) (Ps:list panel_data) (zp:Z) (inv:fp32) (lo:fp32) (hi:fp32)
 Require mr==1 && 0<nc && nc<=4611686018427387903 && 0<kc && 0<ks && ks%8==0 && igemm_shape(mr,nc,kc,ks,Entries,Refs,Blocks,zero,zero_data,a_offset,Ps) && igemm_capacity(nc,kc,a,w,left,Blocks,Refs) && igemm_capacity(nc,kc,a,w,right,Blocks,Refs) && a!=0 && w!=0 && left!=0 && right!=0 && params!=0 && quantization_params!=0 &&
 PtrArray::full(a,ks/8,Entries) * input_pool(Blocks) * packed_matrix(total_depth(kc,Refs),w,Ps) * FloatArray::undef_full(left,nc) * FloatArray::undef_full(right,nc) * store(&(params->scalar.min),float,lo) * store(&(params->scalar.max),float,hi) *
 store(&(quantization_params->zero_point),int,zp) * store(&(quantization_params->inv_scale),float,inv)
 Ensure exists (L:list fp32) (R:list fp32), __return==1 && qd8_outputs_related(L,R) &&
 PtrArray::full(a,ks/8,Entries) * input_pool(Blocks) * packed_matrix(total_depth(kc,Refs),w,Ps) * FloatArray::full(left,nc,L) * FloatArray::full(right,nc,R) * store(&(params->scalar.min),float,lo) * store(&(params->scalar.max),float,hi) *
 store(&(quantization_params->zero_point),int,zp) * store(&(quantization_params->inv_scale),float,inv) */
{
 test_neon(mr,nc,kc,ks,a,w,left,0,32,a_offset,zero,zero_data,params,quantization_params);
 test_rvv(mr,nc,kc,ks,a,w,right,0,32,a_offset,zero,zero_data,params,quantization_params);
 /*@ 0<kc && qd8_output_ref(left,total_depth(kc,Refs),nc,zp,flat_inputs(Blocks,Refs,kc),Ps,inv,lo,hi) *
 qd8_output_ref(right,total_depth(kc,Refs),nc,zp,flat_inputs(Blocks,Refs,kc),Ps,inv,lo,hi) which implies
 exists (L:list fp32) (R:list fp32), 0<kc && qd8_outputs_related(L,R) &&
 FloatArray::full(left,nc,L) * FloatArray::full(right,nc,R) */
 return qd8_compare_outputs(nc,left,right);
}
