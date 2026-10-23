#ifndef QCP_VCMUL_WINDOW_LOAD_H
#define QCP_VCMUL_WINDOW_LOAD_H
#include "types.h"
#include "window_def.h"
float32x4_t qcp_vcmul_load4(const float *p)
/*@ With (base:Z) (n:Z) (idx:Z) (L:list fp32)
 Require 0<=idx && idx+4<=n && p==base+4*idx && FloatArray::full(base,n,L)
 Ensure FloatArray::full(base,n,L) *
 store(&(__return.s0),float,L[idx]) * store(&(__return.s1),float,L[idx+1]) *
 store(&(__return.s2),float,L[idx+2]) * store(&(__return.s3),float,L[idx+3]) */;
#endif
