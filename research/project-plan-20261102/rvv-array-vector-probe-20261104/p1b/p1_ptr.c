#include "int_array_def.h"

/* Probe 1: RVV-style vector as a struct with ONE array field, accessed through pointers.
   VLMAX = 1024 lanes (VLEN512, e32m8). */
struct vint32m8_t { int s[1024]; };

void vload(struct vint32m8_t *r, int *p, int vl)
/*@ With (L: list Z)
    Require 0 <= vl && vl <= 1024 && IntArray::full(p, vl, L) * IntArray::undef_full(r->s, 1024)
    Ensure IntArray::full(p, vl, L) * IntArray::seg(r->s, 0, vl, L) * IntArray::undef_seg(r->s, vl, 1024) */
{
  int i;
  /*@ Inv 0 <= i && i <= vl@pre &&
          IntArray::full(p@pre, vl@pre, L) *
          IntArray::seg(r@pre->s, 0, i, sublist(0, i, L)) *
          IntArray::undef_seg(r@pre->s, i, 1024) */
  for (i = 0; i < vl; ++i) {
    r->s[i] = p[i];
  }
}

void vstore(int *p, struct vint32m8_t *a, int vl)
/*@ With (L: list Z)
    Require 0 <= vl && vl <= 1024 && IntArray::undef_full(p, vl) * IntArray::seg(a->s, 0, vl, L) * IntArray::undef_seg(a->s, vl, 1024)
    Ensure IntArray::full(p, vl, L) * IntArray::seg(a->s, 0, vl, L) * IntArray::undef_seg(a->s, vl, 1024) */
{
  int i;
  /*@ Inv 0 <= i && i <= vl@pre &&
          IntArray::seg(p@pre, 0, i, sublist(0, i, L)) * IntArray::undef_seg(p@pre, i, vl@pre) *
          IntArray::seg(a@pre->s, 0, vl@pre, L) * IntArray::undef_seg(a@pre->s, vl@pre, 1024) */
  for (i = 0; i < vl; ++i) {
    p[i] = a->s[i];
  }
}
