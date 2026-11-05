#include "int_array_def.h"

/* Probe 4 (control): same call shape as probe 3, but a FLAT 4-field struct (old framework style). */
struct v4 { int s0; int s1; int s2; int s3; };

struct v4 load4(int *p)
/*@ With (L: list Z)
    Require IntArray::full(p, 4, L)
    Ensure IntArray::full(p, 4, L) *
           store(&(__return.s0), int, L[0]) * store(&(__return.s1), int, L[1]) *
           store(&(__return.s2), int, L[2]) * store(&(__return.s3), int, L[3]) */
{
  struct v4 r;
  r.s0 = p[0]; r.s1 = p[1]; r.s2 = p[2]; r.s3 = p[3];
  return r;
}

void use_kernel(int *src)
/*@ With (L: list Z)
    Require IntArray::full(src, 4, L)
    Ensure IntArray::full(src, 4, L) */
{
  struct v4 v = load4(src);
}
