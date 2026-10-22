#include "../../shared/vadd/intrinsics.h"
#include "bridge_def.h"
/*@ include strategies "neon_bridge.strategies" */
void load_call(struct float32x4_t *r,const float *p,unsigned long long n)
/*@ With (L:list fp32)
Require 4 <= n && FloatArray::full(p,n,L) *
undef_data_at(&(r->s0),float) * undef_data_at(&(r->s1),float) *
undef_data_at(&(r->s2),float) * undef_data_at(&(r->s3),float)
Ensure FloatArray::seg(p,4,n,fp32_slice(4,n,L)) *
store(pointer_offset(p,0,float),float,L[0]) * store(pointer_offset(p,1,float),float,L[1]) *
store(pointer_offset(p,2,float),float,L[2]) * store(pointer_offset(p,3,float),float,L[3]) *
store(&(r->s0),float,L[0]) * store(&(r->s1),float,L[1]) *
store(&(r->s2),float,L[2]) * store(&(r->s3),float,L[3]) */
{ vld1q_f32(r,p); }
void load_local(const float *p,float *out,unsigned long long n)
/*@ With (L:list fp32)
Require 4 <= n && FloatArray::full(p,n,L) * undef_data_at(out,float)
Ensure FloatArray::seg(p,4,n,fp32_slice(4,n,L)) *
store(pointer_offset(p,0,float),float,L[0]) * store(pointer_offset(p,1,float),float,L[1]) *
store(pointer_offset(p,2,float),float,L[2]) * store(pointer_offset(p,3,float),float,L[3]) *
store(out,float,L[0]) */
{ struct float32x4_t va; vld1q_f32(&va,p); *out=va.s0; }
void store_call(float *p,const struct float32x4_t *a,unsigned long long n)
/*@ With (x0:fp32) (x1:fp32) (x2:fp32) (x3:fp32)
Require 4 <= n && FloatArray::undef_full(p,n) *
store(&(a->s0),float,x0) * store(&(a->s1),float,x1) *
store(&(a->s2),float,x2) * store(&(a->s3),float,x3)
Ensure FloatArray::undef_seg(p,4,n) *
store(pointer_offset(p,0,float),float,x0) * store(pointer_offset(p,1,float),float,x1) *
store(pointer_offset(p,2,float),float,x2) * store(pointer_offset(p,3,float),float,x3) *
store(&(a->s0),float,x0) * store(&(a->s1),float,x1) *
store(&(a->s2),float,x2) * store(&(a->s3),float,x3) */
{ vst1q_f32(p,a); }
