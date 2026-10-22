#ifndef QCP_VADD_PUBLIC_SPEC_H
#define QCP_VADD_PUBLIC_SPEC_H
#include "../../shared/runtime/shim.h"
/* QCP proof frontend imports these predicates from the checked shared library. */
/*@ Extern Coq (FloatArray::full : Z -> Z -> list fp32 -> Assertion)
               (FloatArray::undef_full : Z -> Z -> Assertion) */
int equivalent(size_t n, const float *input_a, const float *input_b,
               float *left, float *right)
/*@ With (A: list fp32) (B: list fp32)
    Require 0 < n && n <= 4611686018427387900 &&
            input_a != 0 && input_b != 0 && left != 0 && right != 0 &&
            FloatArray::full(input_a,n+3,A) * FloatArray::full(input_b,n+3,B) *
            FloatArray::undef_full(left,n) * FloatArray::undef_full(right,n)
    Ensure exists (L: list fp32) (R: list fp32), __return == 1 &&
           FloatArray::full(input_a,n+3,A) * FloatArray::full(input_b,n+3,B) *
           FloatArray::full(left,n,L) * FloatArray::full(right,n,R) */
;
#endif
