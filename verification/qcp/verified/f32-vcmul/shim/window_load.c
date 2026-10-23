#include "window_load.h"
float32x4_t qcp_vcmul_load4(const float *p)
/*@ With (base:Z) (n:Z) (idx:Z) (L:list fp32)
 Require 0<=idx && idx+4<=n && p==base+4*idx && FloatArray::full(base,n,L)
 Ensure FloatArray::full(base,n,L) *
 store(&(__return.s0),float,L[idx]) * store(&(__return.s1),float,L[idx+1]) *
 store(&(__return.s2),float,L[idx+2]) * store(&(__return.s3),float,L[idx+3]) */
{
 float32x4_t r;
 /*@ Assert p==p@pre && 0<=idx && idx+4<=n && p==base+4*idx &&
 FloatArray::missing_i(base,idx+0,0,n,L) *
 store(pointer_offset(p,0,float),float,L[idx+0]) *
 undef_data_at(&(r.s0),float) *
 undef_data_at(&(r.s1),float) *
 undef_data_at(&(r.s2),float) *
 undef_data_at(&(r.s3),float) */
 r.s0=p[0];
 /*@ Assert p==p@pre && 0<=idx && idx+4<=n && p==base+4*idx &&
 FloatArray::full(base,n,L) *
 store(&(r.s0),float,L[idx+0]) *
 undef_data_at(&(r.s1),float) *
 undef_data_at(&(r.s2),float) *
 undef_data_at(&(r.s3),float) */
 /*@ Assert p==p@pre && 0<=idx && idx+4<=n && p==base+4*idx &&
 FloatArray::missing_i(base,idx+1,0,n,L) *
 store(pointer_offset(p,1,float),float,L[idx+1]) *
 store(&(r.s0),float,L[idx+0]) *
 undef_data_at(&(r.s1),float) *
 undef_data_at(&(r.s2),float) *
 undef_data_at(&(r.s3),float) */
 r.s1=p[1];
 /*@ Assert p==p@pre && 0<=idx && idx+4<=n && p==base+4*idx &&
 FloatArray::full(base,n,L) *
 store(&(r.s0),float,L[idx+0]) *
 store(&(r.s1),float,L[idx+1]) *
 undef_data_at(&(r.s2),float) *
 undef_data_at(&(r.s3),float) */
 /*@ Assert p==p@pre && 0<=idx && idx+4<=n && p==base+4*idx &&
 FloatArray::missing_i(base,idx+2,0,n,L) *
 store(pointer_offset(p,2,float),float,L[idx+2]) *
 store(&(r.s0),float,L[idx+0]) *
 store(&(r.s1),float,L[idx+1]) *
 undef_data_at(&(r.s2),float) *
 undef_data_at(&(r.s3),float) */
 r.s2=p[2];
 /*@ Assert p==p@pre && 0<=idx && idx+4<=n && p==base+4*idx &&
 FloatArray::full(base,n,L) *
 store(&(r.s0),float,L[idx+0]) *
 store(&(r.s1),float,L[idx+1]) *
 store(&(r.s2),float,L[idx+2]) *
 undef_data_at(&(r.s3),float) */
 /*@ Assert p==p@pre && 0<=idx && idx+4<=n && p==base+4*idx &&
 FloatArray::missing_i(base,idx+3,0,n,L) *
 store(pointer_offset(p,3,float),float,L[idx+3]) *
 store(&(r.s0),float,L[idx+0]) *
 store(&(r.s1),float,L[idx+1]) *
 store(&(r.s2),float,L[idx+2]) *
 undef_data_at(&(r.s3),float) */
 r.s3=p[3];
 /*@ Assert p==p@pre && 0<=idx && idx+4<=n && p==base+4*idx &&
 FloatArray::full(base,n,L) *
 store(&(r.s0),float,L[idx+0]) *
 store(&(r.s1),float,L[idx+1]) *
 store(&(r.s2),float,L[idx+2]) *
 store(&(r.s3),float,L[idx+3]) */
 return r;
}
