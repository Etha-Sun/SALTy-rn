#include "../../../../shared/c-shim/f32/QcpVadd/float_array_def.h"
/*@ include strategies "float_array.strategies" */
typedef unsigned long long size_t;
void qcp_vadd_read(const float *p, float *out, size_t n, size_t i)
/*@ With (L: list fp32)
    Require 0 < n && 0 <= i && i < n && FloatArray::full(p,n,L) * undef_data_at(out,float)
    Ensure FloatArray::seg(p,0,n,L) * store(out,float,L[i]) */
{ *out = p[i]; }
