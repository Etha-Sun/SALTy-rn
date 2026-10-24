/* Kernel body interface views. The six FullConsequence theorems connect these
 * to the public caller contracts below; no additional caller restriction. */
#if defined(QCP_KERNEL_BODY_VIEW)
void test_neon(size_t mr,size_t nc,size_t kc,const float *a,size_t a_stride,
 const float *w,float *c,size_t cm_stride,size_t cn_stride,
 const struct xnn_f32_minmax_params *params)
/*@ With (A:list fp32) (W:list fp32) (lo:fp32) (hi:fp32)
Require 1<=mr && mr<=4 && 1<=nc && 4<=kc && kc%4==0 && a_stride==kc && cm_stride==4*nc && cn_stride==32 && a!=0 && w!=0 && c!=0 && params!=0 && 4*kc<=18446744073709551615 && (uintptr_t)a+4*kc<=18446744073709551615 && 16*nc<=18446744073709551615 && (uintptr_t)c+16*nc<=18446744073709551615 && 32*(kc/4+1)*panel_count(nc)<=18446744073709551615 && (uintptr_t)w+32*(kc/4+1)*panel_count(nc)<=18446744073709551615 && FloatArray::full(a,kc,A) * FloatArray::full(w,8*(kc/4+1)*panel_count(nc),W) * FloatArray::undef_full(c,4*nc) * store(&(params->scalar.min),float,lo) * store(&(params->scalar.max),float,hi)
Ensure FloatArray::full(a@pre,kc@pre,A) * FloatArray::full(w@pre,8*((kc@pre/4)+1)*panel_count(nc@pre),W) * output_state(c@pre,mr@pre,nc@pre,(kc@pre/4),nc@pre,A,W,lo,hi) * store(&(params->scalar.min),float,lo) * store(&(params->scalar.max),float,hi) */;
void test_rvv(size_t mr,size_t nc,size_t kc,const float *a,size_t a_stride,
 const float *w,float *c,size_t cm_stride,size_t cn_stride,
 const struct xnn_f32_minmax_params *params)
/*@ With (A:list fp32) (W:list fp32) (lo:fp32) (hi:fp32)
 Require 1 <= mr && mr <= 4 && 0 < nc && 0 < kc && kc % 4 == 0 && a_stride == kc && cm_stride == 4*nc && cn_stride == 32 && machine_capacity(a,w,c,params,kc,nc) && a != 0 && w != 0 && c != 0 && params != 0 && FloatArray::full(a,4*(kc/4),A) * FloatArray::full(w,panel_count(nc)*8*((kc/4)+1),W) * FloatArray::undef_full(c,4*nc) * store(&(params->scalar.min),float,lo) * store(&(params->scalar.max),float,hi)
 Ensure FloatArray::full(a@pre,4*(kc/4),A) * FloatArray::full(w@pre,(panel_count(nc@pre)*8*((kc/4)+1)),W) * output_state(c@pre,mr,nc@pre,(kc/4),nc@pre,A,W,lo,hi) * store(&(params->scalar.min),float,lo) * store(&(params->scalar.max),float,hi) */;
#else
/* Full-geometry review candidate. Kernel C bodies are still proof dependencies.
 * mr=1..4; positive nc/K; mapper strides 4K/4nc/32 bytes; all fp32.
 * Outputs need writable, initially undefined storage. Observe active mr*nc.
 * Intrinsic specifications, source correspondence and ISA remain explicit.
 */
#include "contracts/caller.h"
/*@ include strategies "shim/comparator/comparator.strategies" */
#ifndef QCP_GEMM_NATIVE_TYPES
typedef unsigned long long size_t;
struct bounds { float min; float max; };
struct xnn_f32_minmax_params { struct bounds scalar; };
#endif

void test_neon(size_t mr,size_t nc,size_t kc,const float *a,size_t a_stride,
 const float *w,float *c,size_t cm_stride,size_t cn_stride,
 const struct xnn_f32_minmax_params *params)
/*@ With (A:list fp32) (W:list fp32) (lo:fp32) (hi:fp32)
 Require 1<=mr && mr<=4 && 0<nc && 0<kc && kc%4==0 &&
 a_stride==kc && cm_stride==4*nc && cn_stride==32 &&
 machine_capacity(a,w,c,params,kc,nc) && a!=0 && w!=0 && c!=0 && params!=0 &&
 FloatArray::full(a,4*(kc/4),A) * FloatArray::full(w,panel_count(nc)*8*(kc/4+1),W) *
 FloatArray::undef_full(c,4*nc) * store(&(params->scalar.min),float,lo) * store(&(params->scalar.max),float,hi)
 Ensure FloatArray::full(a@pre,4*(kc/4),A) * FloatArray::full(w@pre,panel_count(nc@pre)*8*(kc/4+1),W) *
 output_state(c@pre,mr,nc@pre,kc/4,nc@pre,A,W,lo,hi) *
 store(&(params->scalar.min),float,lo) * store(&(params->scalar.max),float,hi) */;

void test_rvv(size_t mr,size_t nc,size_t kc,const float *a,size_t a_stride,
 const float *w,float *c,size_t cm_stride,size_t cn_stride,
 const struct xnn_f32_minmax_params *params)
/*@ With (A:list fp32) (W:list fp32) (lo:fp32) (hi:fp32)
 Require 1<=mr && mr<=4 && 0<nc && 0<kc && kc%4==0 &&
 a_stride==kc && cm_stride==4*nc && cn_stride==32 &&
 machine_capacity(a,w,c,params,kc,nc) && a!=0 && w!=0 && c!=0 && params!=0 &&
 FloatArray::full(a,4*(kc/4),A) * FloatArray::full(w,panel_count(nc)*8*(kc/4+1),W) *
 FloatArray::undef_full(c,4*nc) * store(&(params->scalar.min),float,lo) * store(&(params->scalar.max),float,hi)
 Ensure FloatArray::full(a@pre,4*(kc/4),A) * FloatArray::full(w@pre,panel_count(nc@pre)*8*(kc/4+1),W) *
 output_state(c@pre,mr,nc@pre,kc/4,nc@pre,A,W,lo,hi) *
 store(&(params->scalar.min),float,lo) * store(&(params->scalar.max),float,hi) */;

/* Bodies below reuse the checked generic read/NaN/comparison functions. */
void qcp_vadd_read(const float *p,float *out,size_t n,size_t i)
/*@ With (L:list fp32)
 Require 0<n && 0<=i && i<n && FloatArray::full(p,n,L) * undef_data_at(out,float)
 Ensure FloatArray::seg(p,0,n,L) * store(out,float,L[i]) */
{ *out=p[i]; }

float preserve_float(float x)
/*@ Require emp Ensure bit_same(__return,x) && emp */
{ return x; }

int check_observation(float x,float y)
/*@ Require same_value(x,y) && emp Ensure returned_one(__return) && emp */
{
 float xc=preserve_float(x);
 float yc=preserve_float(y);
 if(x==y) return 1;
 if(x!=xc && y!=yc) return 1;
 return 0;
}

int same_lane(float x,float y)
/*@ Require same_value(x,y) && emp Ensure __return==1 && emp */
{ return check_observation(x,y); }

int compare_outputs(size_t n,const float *left,const float *right)
/*@ With (L:list fp32) (R:list fp32)
 Require 0<n && n<=4611686018427387900 && outputs_related(L,R) &&
 FloatArray::full(left,n,L) * FloatArray::full(right,n,R)
 Ensure __return==1 && FloatArray::full(left,n,L) * FloatArray::full(right,n,R) */
{
 size_t i=0;
 /*@ Inv n==n@pre && left==left@pre && right==right@pre && 0<n &&
 n<=4611686018427387900 && 0<=i && i<=n && Zlength(L)==n && outputs_related(L,R) &&
 FloatArray::full(left,n,L) * FloatArray::full(right,n,R) */
 while(i<n) {
  float x;
  float y;
  qcp_vadd_read(left,&x,n,i);
  qcp_vadd_read(right,&y,n,i);
  if(!same_lane(x,y)) return 0;
  i++;
 }
 return 1;
}

/* kc is a byte count, exactly as in both original kernels; K=kc/4. */
int equivalent(size_t mr,size_t nc,size_t kc,const float *a,const float *w,
 float *left,float *right,const struct xnn_f32_minmax_params *params)
/*@ With (A:list fp32) (W:list fp32) (lo:fp32) (hi:fp32)
 Require 1<=mr && mr<=4 && 0<nc && 4<=kc && kc%4==0 && a!=0 && w!=0 && left!=0 && right!=0 && params!=0 &&
 machine_capacity(a,w,left,params,kc,nc) && machine_capacity(a,w,right,params,kc,nc) &&
 FloatArray::full(a,4*(kc/4),A) * FloatArray::full(w,panel_count(nc)*8*(kc/4+1),W) *
 FloatArray::undef_full(left,4*nc) * FloatArray::undef_full(right,4*nc) *
 store(&(params->scalar.min),float,lo) * store(&(params->scalar.max),float,hi)
 Ensure exists (L:list fp32) (R:list fp32), __return==1 && outputs_related(L,R) &&
 FloatArray::full(a,4*(kc/4),A) * FloatArray::full(w,panel_count(nc)*8*(kc/4+1),W) *
 FloatArray::full(left,mr*nc,L) * FloatArray::undef_seg(left,mr*nc,4*nc) *
 FloatArray::full(right,mr*nc,R) * FloatArray::undef_seg(right,mr*nc,4*nc) *
 store(&(params->scalar.min),float,lo) * store(&(params->scalar.max),float,hi) */
{
 size_t cm_stride=nc*sizeof(float);
 size_t observed=mr*nc;
 /*@ Assert mr==mr@pre && nc==nc@pre && kc==kc@pre &&
 a==a@pre && w==w@pre && left==left@pre && right==right@pre && params==params@pre &&
 1<=mr && mr<=4 && 0<nc && 4<=kc &&
 nc<=1152921504606846975 && cm_stride==4*nc && observed==mr*nc &&
 kc%4==0 && 0<kc &&
 0<observed && observed<=4611686018427387900 &&
 a!=0 && w!=0 && left!=0 && right!=0 && params!=0 &&
 machine_capacity(a,w,left,params,kc,nc) && machine_capacity(a,w,right,params,kc,nc) &&
 FloatArray::full(a,4*(kc/4),A) * FloatArray::full(w,panel_count(nc)*8*(kc/4+1),W) *
 FloatArray::undef_full(left,4*nc) * FloatArray::undef_full(right,4*nc) *
 store(&(params->scalar.min),float,lo) * store(&(params->scalar.max),float,hi) */
 test_neon(mr,nc,kc,a,kc,w,left,cm_stride,32,params);
 /*@ 1<=mr && mr<=4 && 0<nc && output_state(left,mr,nc,kc/4,nc,A,W,lo,hi) which implies
 1<=mr && mr<=4 && 0<nc && FloatArray::full(left,mr*nc,completed_values(A,W,kc/4,mr,nc,lo,hi)) * FloatArray::undef_seg(left,mr*nc,4*nc) */
 test_rvv(mr,nc,kc,a,kc,w,right,cm_stride,32,params);
 /*@ 1<=mr && mr<=4 && 0<nc && output_state(right,mr,nc,kc/4,nc,A,W,lo,hi) which implies
 1<=mr && mr<=4 && 0<nc && FloatArray::full(right,mr*nc,completed_values(A,W,kc/4,mr,nc,lo,hi)) * FloatArray::undef_seg(right,mr*nc,4*nc) */
 return compare_outputs(observed,left,right);
}

#endif
