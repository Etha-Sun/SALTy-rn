/* Full MR1/NR16 QC4W caller candidate. Kernel proofs remain open. */
typedef unsigned long long size_t;
typedef unsigned long long uintptr_t;
typedef signed char int8_t;
typedef unsigned char uint8_t;
typedef short int16_t;
typedef int int32_t;
typedef unsigned int uint32_t;
struct qc4_scalar_bounds {float min;float max;int32_t kernel_zero_point;};
struct xnn_f32_qc4w_minmax_params {struct qc4_scalar_bounds scalar;};
struct xnn_qd8_quantization_params {int32_t zero_point;float inv_scale;};
struct int8x8_t { int8_t s0,s1,s2,s3,s4,s5,s6,s7; };
typedef struct int8x8_t int8x8_t;
struct int16x8_t { int16_t s0,s1,s2,s3,s4,s5,s6,s7; };
typedef struct int16x8_t int16x8_t;
struct int16x4_t { int16_t s0,s1,s2,s3; };
typedef struct int16x4_t int16x4_t;
struct int32x4_t { int32_t s0,s1,s2,s3; };
typedef struct int32x4_t int32x4_t;
struct float32x4_t { float s0,s1,s2,s3; };
typedef struct float32x4_t float32x4_t;
struct float32x2_t { float s0,s1; };
typedef struct float32x2_t float32x2_t;
struct vint8m2_t { int8_t s0,s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12,s13,s14,s15; };
typedef struct vint8m2_t vint8m2_t;
struct vint16m4_t { int16_t s0,s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12,s13,s14,s15; };
typedef struct vint16m4_t vint16m4_t;
struct vint32m8_t { int32_t s0,s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12,s13,s14,s15; };
typedef struct vint32m8_t vint32m8_t;
struct vfloat32m8_t { float s0,s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12,s13,s14,s15; };
typedef struct vfloat32m8_t vfloat32m8_t;
struct vbool4_t { int s0,s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12,s13,s14,s15; };
typedef struct vbool4_t vbool4_t;
/*@ Import Coq Require Import QC4W.PublicModel */
/*@ Extern Coq (qc4_panel :: *) */
/*@ Extern Coq
 (qc4_domain_shape : Z -> Z -> Z -> list qc4_panel -> Prop)
 (qc4_data_capacity : Z -> Z -> Z -> Z -> Z -> Prop)
 (qc4_a_extent : Z -> Z)
 (qc4_packed : Z -> Z -> list qc4_panel -> Assertion)
 (qc4_output_ref : Z -> Z -> Z -> Z -> list Z -> list qc4_panel -> fp32 -> fp32 -> fp32 -> Assertion)
 (qc4_same_value : fp32 -> fp32 -> Prop)
 (qc4_outputs_related : list fp32 -> list fp32 -> Prop)
 (qc4_bit_same : fp32 -> fp32 -> Prop)
 (CharArray::full : Z -> Z -> list Z -> Assertion)
 (FloatArray::full : Z -> Z -> list fp32 -> Assertion)
 (FloatArray::undef_full : Z -> Z -> Assertion) */
/*@ Import Coq Require Import QC4W.PublicModel */
/*@ Extern Coq (qc4_ret_one : Z -> Prop) */
/*@ Extern Coq (FloatArray::missing_i : Z -> Z -> Z -> Z -> list fp32 -> Assertion) */
void test_neon(size_t mr,size_t nc,size_t kc,const int8_t *a,size_t a_stride,
 const void *w,float *c,size_t cm_stride,size_t cn_stride,
 const struct xnn_f32_qc4w_minmax_params *params,
 const struct xnn_qd8_quantization_params *quantization_params)
/*@ With (A:list Z) (Ps:list qc4_panel) (zp:Z) (inv:fp32) (lo:fp32) (hi:fp32)
 Require qc4_domain_shape(mr,nc,kc,Ps) && qc4_data_capacity(nc,kc,a,w,c) &&
 cn_stride==64 && a!=0 && w!=0 && c!=0 && params!=0 && quantization_params!=0 &&
 CharArray::full(a,qc4_a_extent(kc),A) * qc4_packed(kc,w,Ps) *
 FloatArray::undef_full(c,nc) *
 store(&(params->scalar.min),float,lo) * store(&(params->scalar.max),float,hi) *
 store(field_addr(pointer_offset(quantization_params,0,struct xnn_qd8_quantization_params),xnn_qd8_quantization_params,zero_point),int,zp) * store(field_addr(pointer_offset(quantization_params,0,struct xnn_qd8_quantization_params),xnn_qd8_quantization_params,inv_scale),float,inv)
 Ensure CharArray::full(a@pre,qc4_a_extent(kc@pre),A) * qc4_packed(kc@pre,w@pre,Ps) *
 qc4_output_ref(c@pre,kc@pre,nc@pre,zp,A,Ps,inv,lo,hi) *
 store(&(params->scalar.min),float,lo) * store(&(params->scalar.max),float,hi) *
 store(field_addr(pointer_offset(quantization_params,0,struct xnn_qd8_quantization_params),xnn_qd8_quantization_params,zero_point),int,zp) * store(field_addr(pointer_offset(quantization_params,0,struct xnn_qd8_quantization_params),xnn_qd8_quantization_params,inv_scale),float,inv) */;
void test_rvv(size_t mr,size_t nc,size_t kc,const int8_t *a,size_t a_stride,
 const void *w,float *c,size_t cm_stride,size_t cn_stride,
 const struct xnn_f32_qc4w_minmax_params *params,
 const struct xnn_qd8_quantization_params *quantization_params)
/*@ With (A:list Z) (Ps:list qc4_panel) (zp:Z) (inv:fp32) (lo:fp32) (hi:fp32)
 Require qc4_domain_shape(mr,nc,kc,Ps) && qc4_data_capacity(nc,kc,a,w,c) &&
 cn_stride==64 && a!=0 && w!=0 && c!=0 && params!=0 && quantization_params!=0 &&
 CharArray::full(a,qc4_a_extent(kc),A) * qc4_packed(kc,w,Ps) *
 FloatArray::undef_full(c,nc) *
 store(&(params->scalar.min),float,lo) * store(&(params->scalar.max),float,hi) *
 store(field_addr(pointer_offset(quantization_params,0,struct xnn_qd8_quantization_params),xnn_qd8_quantization_params,zero_point),int,zp) * store(field_addr(pointer_offset(quantization_params,0,struct xnn_qd8_quantization_params),xnn_qd8_quantization_params,inv_scale),float,inv)
 Ensure CharArray::full(a@pre,qc4_a_extent(kc@pre),A) * qc4_packed(kc@pre,w@pre,Ps) *
 qc4_output_ref(c@pre,kc@pre,nc@pre,zp,A,Ps,inv,lo,hi) *
 store(&(params->scalar.min),float,lo) * store(&(params->scalar.max),float,hi) *
 store(field_addr(pointer_offset(quantization_params,0,struct xnn_qd8_quantization_params),xnn_qd8_quantization_params,zero_point),int,zp) * store(field_addr(pointer_offset(quantization_params,0,struct xnn_qd8_quantization_params),xnn_qd8_quantization_params,inv_scale),float,inv) */;
float qc4_preserve_float(float x)
/*@ Require emp Ensure qc4_bit_same(__return,x) && emp */
{ return x; }
int qc4_same_lane(float x,float y)
/*@ Require qc4_same_value(x,y) && emp Ensure qc4_ret_one(__return) && emp */
{
 float xc=qc4_preserve_float(x);
 float yc=qc4_preserve_float(y);
 if(x==y) return 1;
 if(x!=xc && y!=yc) return 1;
 return 0;
}
int qc4_compare_outputs(size_t n,const float *left,const float *right)
/*@ With (L:list fp32) (R:list fp32)
 Require 0<n && n<=4611686018427387903 && qc4_outputs_related(L,R) &&
 FloatArray::full(left,n,L) * FloatArray::full(right,n,R)
 Ensure qc4_ret_one(__return) && FloatArray::full(left,n,L) * FloatArray::full(right,n,R) */
{
 size_t i=0;
 /*@ Inv n==n@pre && left==left@pre && right==right@pre &&
 0<n && n<=4611686018427387903 && 0<=i && i<=n &&
 Zlength(L)==n && qc4_outputs_related(L,R) &&
 FloatArray::full(left,n,L) * FloatArray::full(right,n,R) */
 while(i<n) {
  /*@ 0<=i && i<n && qc4_outputs_related(L,R) &&
 FloatArray::full(left,n,L) * FloatArray::full(right,n,R)
 which implies qc4_same_value(L[i],R[i]) && 0<=i && i<n &&
 FloatArray::missing_i(left,i,0,n,L) * store(left+i,float,L[i]) *
 FloatArray::missing_i(right,i,0,n,R) * store(right+i,float,R[i]) */
 float x=left[i];
  float y=right[i];
  /*@ 0<=i && i<n && FloatArray::missing_i(left,i,0,n,L) * store(left+i,float,L[i]) *
  FloatArray::missing_i(right,i,0,n,R) * store(right+i,float,R[i])
  which implies 0<=i && i<n && FloatArray::full(left,n,L) * FloatArray::full(right,n,R) */
  if(!qc4_same_lane(x,y)) return 0;
  i++;
 }
 return 1;
}
int equivalent(size_t mr,size_t nc,size_t kc,const int8_t *a,const void *w,
 float *left,float *right,const struct xnn_f32_qc4w_minmax_params *params,
 const struct xnn_qd8_quantization_params *quantization_params)
/*@ With (A:list Z) (Ps:list qc4_panel) (zp:Z) (inv:fp32) (lo:fp32) (hi:fp32)
 Require qc4_domain_shape(mr,nc,kc,Ps) && qc4_data_capacity(nc,kc,a,w,left) &&
 qc4_data_capacity(nc,kc,a,w,right) && a!=0 && w!=0 && left!=0 && right!=0 &&
 params!=0 && quantization_params!=0 &&
 CharArray::full(a,qc4_a_extent(kc),A) * qc4_packed(kc,w,Ps) *
 FloatArray::undef_full(left,nc) * FloatArray::undef_full(right,nc) *
 store(&(params->scalar.min),float,lo) * store(&(params->scalar.max),float,hi) *
 store(field_addr(pointer_offset(quantization_params,0,struct xnn_qd8_quantization_params),xnn_qd8_quantization_params,zero_point),int,zp) * store(field_addr(pointer_offset(quantization_params,0,struct xnn_qd8_quantization_params),xnn_qd8_quantization_params,inv_scale),float,inv)
 Ensure exists (L:list fp32) (R:list fp32), __return==1 && qc4_outputs_related(L,R) &&
 CharArray::full(a,qc4_a_extent(kc),A) * qc4_packed(kc,w,Ps) *
 FloatArray::full(left,nc,L) * FloatArray::full(right,nc,R) *
 store(&(params->scalar.min),float,lo) * store(&(params->scalar.max),float,hi) *
 store(field_addr(pointer_offset(quantization_params,0,struct xnn_qd8_quantization_params),xnn_qd8_quantization_params,zero_point),int,zp) * store(field_addr(pointer_offset(quantization_params,0,struct xnn_qd8_quantization_params),xnn_qd8_quantization_params,inv_scale),float,inv) */
{
 test_neon(mr,nc,kc,a,0,w,left,0,64,params,quantization_params);
 test_rvv(mr,nc,kc,a,0,w,right,0,64,params,quantization_params);
 /*@ 0<kc && qc4_output_ref(left,kc,nc,zp,A,Ps,inv,lo,hi) *
 qc4_output_ref(right,kc,nc,zp,A,Ps,inv,lo,hi) which implies
 exists (L:list fp32) (R:list fp32), 0<kc && qc4_outputs_related(L,R) &&
 FloatArray::full(left,nc,L) * FloatArray::full(right,nc,R) */
 return qc4_compare_outputs(nc,left,right);
}
