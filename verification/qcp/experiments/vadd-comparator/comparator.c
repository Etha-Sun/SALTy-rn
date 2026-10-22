#include "comparator_def.h"
/*@ include strategies "comparator.strategies" */
typedef unsigned long long size_t;
void qcp_vadd_read(const float *p, float *out, size_t n, size_t i)
/*@ With (L: list fp32)
    Require 0 < n && 0 <= i && i < n && FloatArray::full(p,n,L) * undef_data_at(out,float)
    Ensure FloatArray::seg(p,0,n,L) * store(out,float,L[i]) */;
int same_lane(float x,float y)
/*@ Require same_value(x,y) && emp Ensure __return == 1 && emp */;
int compare_outputs(size_t n, const float *left, const float *right)
/*@ With (L: list fp32) (R: list fp32)
    Require 0 < n && n <= 4611686018427387900 &&
            outputs_related(L,R) && FloatArray::full(left,n,L) * FloatArray::full(right,n,R)
    Ensure __return == 1 && FloatArray::full(left,n,L) * FloatArray::full(right,n,R) */
{
  size_t i = 0;
  /*@ Inv n == n@pre && left == left@pre && right == right@pre &&
          0 < n && n <= 4611686018427387900 && 0 <= i && i <= n &&
          Zlength(L) == n && outputs_related(L,R) &&
          FloatArray::full(left,n,L) * FloatArray::full(right,n,R) */
  while (i < n) {
    float x;
    float y;
    qcp_vadd_read(left,&x,n,i);
    qcp_vadd_read(right,&y,n,i);
    if (!same_lane(x,y)) return 0;
    i++;
  }
  return 1;
}
