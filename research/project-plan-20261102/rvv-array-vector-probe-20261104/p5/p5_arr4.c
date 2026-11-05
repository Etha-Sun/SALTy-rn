#include "int_array_def.h"

/* Probe 5 (control): identical to probe 4 except the struct holds ONE array field int s[4]. */
struct v4a { int s[4]; };

struct v4a load4a(int *p)
/*@ With (L: list Z)
    Require IntArray::full(p, 4, L)
    Ensure IntArray::full(p, 4, L) * IntArray::full(__return.s, 4, L) */
{
  struct v4a r;
  r.s[0] = p[0]; r.s[1] = p[1]; r.s[2] = p[2]; r.s[3] = p[3];
  /*@ Assert IntArray::full(p@pre, 4, L) * IntArray::full(r.s, 4, L) */
  return r;
}

void use_kernel(int *src)
/*@ With (L: list Z)
    Require IntArray::full(src, 4, L)
    Ensure IntArray::full(src, 4, L) */
{
  struct v4a v = load4a(src);
}
