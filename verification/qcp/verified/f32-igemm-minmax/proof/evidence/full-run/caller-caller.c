/* Full actual IGEMM candidate; proof status is proof/status.json. */
typedef unsigned long long size_t;
typedef unsigned long long uintptr_t;
struct scalar_bounds {float min;float max;};
struct xnn_f32_minmax_params {struct scalar_bounds scalar;};
struct float32x4_t {float s0;float s1;float s2;float s3;};
struct float32x2_t {float s0;float s1;};
typedef struct float32x4_t float32x4_t;
typedef struct float32x2_t float32x2_t;
struct vfloat32m4_t {float s0;float s1;float s2;float s3;float s4;float s5;float s6;float s7;};
struct vbool8_t {int s0;int s1;int s2;int s3;int s4;int s5;int s6;int s7;};
typedef struct vfloat32m4_t vfloat32m4_t;
typedef struct vbool8_t vbool8_t;
/*@ Import Coq Require Import FloatIndirect.ApiModel */
/*@ Extern Coq
 (input_block :: *)
 (input_reference :: *) */
/*@ Extern Coq
 (igemm_shape : Z -> Z -> Z -> Z -> list Z -> list input_reference -> list input_block -> Z -> Z -> list fp32 -> Prop)
 (igemm_capacity : Z -> Z -> Z -> Z -> Z -> list input_block -> list input_reference -> Prop)
 (input_mapping : Z -> Z -> Z -> list Z -> list input_reference -> list input_block -> Prop)
 (input_pool : list input_block -> Assertion)
 (total_depth : Z -> list input_reference -> Z)
 (flat_inputs : list input_block -> list input_reference -> Z -> list fp32)
 (input_window : list input_block -> list input_reference -> Z -> Z -> list fp32)
 (input_address : list input_block -> list input_reference -> Z -> Z)
 (input_window_frame : list input_block -> list input_reference -> Z -> Z -> Assertion)
 (selected_address : Z -> Z -> Z -> Z)
 (select_domain : Z -> Z -> Z -> Prop)
 (ig_output_ref : Z -> Z -> Z -> list fp32 -> list fp32 -> fp32 -> fp32 -> Assertion)
 (ig_output_prefix : Z -> Z -> Z -> Z -> list fp32 -> list fp32 -> fp32 -> fp32 -> Assertion)
 (ig_write_state : Z -> Z -> Z -> list fp32 -> Assertion)
 (ig_fappend : list fp32 -> list fp32 -> list fp32)
 (ig_same_value : fp32 -> fp32 -> Prop)
 (ig_bit_same : fp32 -> fp32 -> Prop)
 (ig_outputs_related : list fp32 -> list fp32 -> Prop)
 (ig_ret_one : Z -> Prop)
 (igemm_acc : Z -> Z -> Z -> list fp32 -> list fp32 -> fp32)
 (igemm_output : Z -> Z -> list fp32 -> list fp32 -> fp32 -> fp32 -> list fp32)
 (panel_count : Z -> Z)
 (packed_length : Z -> Z -> Z)
 (packed_bias_index : Z -> Z -> Z)
 (packed_weight_index : Z -> Z -> Z -> Z)
 (FloatArray::full : Z -> Z -> list fp32 -> Assertion)
 (FloatArray::undef_full : Z -> Z -> Assertion)
 (FloatArray::missing_i : Z -> Z -> Z -> Z -> list fp32 -> Assertion)
 (PtrArray::full : Z -> Z -> list Z -> Assertion)
 (PtrArray::missing_i : Z -> Z -> Z -> Z -> list Z -> Assertion)
 (bit_same : fp32 -> fp32 -> Prop)
 (gget : Z -> list fp32 -> fp32)
 (glane : Z -> fp32 -> fp32 -> fp32)
 (rvv_at : list fp32 -> Z -> fp32)
 (rvv_nanth : fp32 -> Z)
 (rvv_merge : fp32 -> fp32 -> Z -> fp32)
 (fma_rne : fp32 -> fp32 -> fp32 -> fp32)
 (fp32_min_number : fp32 -> fp32 -> fp32)
 (fp32_max_number : fp32 -> fp32 -> fp32)
 (fp32_neon_min : fp32 -> fp32 -> fp32)
 (fp32_neon_max : fp32 -> fp32 -> fp32)
 (canonical_qnan : fp32)
 (active_value : Z -> Z -> fp32 -> fp32 -> Prop)
 (active_mask : Z -> Z -> Z -> Z -> Prop)
 (active8 : Z -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> Prop)
 (mask8 : Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Prop)
 (UndefStructPredfloat32x4_t : Z -> Assertion)
 (UndefStructPredfloat32x2_t : Z -> Assertion)
 (UndefStructPredvfloat32m4_t : Z -> Assertion)
 (UndefStructPredvbool8_t : Z -> Assertion) */
void qcp_assert(int condition) /*@ Require condition!=0 && emp Ensure emp */;
float qcp_identity(float x) /*@ Require emp Ensure bit_same(__return,x) && emp */;
int qcp_isnan(float x) /*@ Require emp Ensure __return==rvv_nanth(x) && emp */;
float qcp_nanf(void) /*@ Require emp Ensure bit_same(__return,canonical_qnan) && emp */;
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
