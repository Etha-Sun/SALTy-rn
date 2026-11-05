#include "int_array_def.h"

/* Probe 3: by-value loads/ops + pointer-borrowing store macro; RVV-style vector, ONE array field, VLMAX = 128 lanes (VLEN512, e32m8).
   QCP record copy requires every lane defined, so the shim body defines tail lanes,
   while the contract only exposes an existentially quantified tail T (tail-agnostic). */
struct vint32m8_t { int s[128]; };

void vload(struct vint32m8_t *r, int *p, int vl)
/*@ With (L: list Z)
    Require 0 <= vl && vl <= 128 && IntArray::full(p, vl, L) * IntArray::undef_full(r->s, 128)
    Ensure exists T, Zlength(T) == 128 - vl && IntArray::full(p, vl, L) * IntArray::full(r->s, 128, app(L, T)) */
{
  int i;
  /*@ Inv 0 <= i && i <= 128 && 0 <= vl@pre && vl@pre <= 128 &&
          IntArray::full(p@pre, vl@pre, L) *
          IntArray::seg(r@pre->s, 0, i, sublist(0, i, app(L, zeros(128 - vl@pre)))) *
          IntArray::undef_seg(r@pre->s, i, 128) */
  for (i = 0; i < 128; ++i) {
    if (i < vl) {
      r->s[i] = p[i];
    } else {
      r->s[i] = 0;
    }
  }
}

void vstore(int *p, struct vint32m8_t *a, int vl)
/*@ With (V: list Z)
    Require 0 <= vl && vl <= 128 && IntArray::undef_full(p, vl) * IntArray::full(a->s, 128, V)
    Ensure IntArray::full(p, vl, sublist(0, vl, V)) * IntArray::full(a->s, 128, V) */
{
  int i;
  /*@ Inv 0 <= i && i <= vl@pre && vl@pre <= 128 &&
          IntArray::seg(p@pre, 0, i, sublist(0, i, V)) * IntArray::undef_seg(p@pre, i, vl@pre) *
          IntArray::full(a@pre->s, 128, V) */
  for (i = 0; i < vl; ++i) {
    p[i] = a->s[i];
  }
}

struct vint32m8_t vload_v(int *p, int vl)
/*@ With (L: list Z)
    Require 0 <= vl && vl <= 128 && IntArray::full(p, vl, L)
    Ensure exists T, Zlength(T) == 128 - vl && IntArray::full(p, vl, L) * IntArray::full(__return.s, 128, app(L, T)) */
{
  struct vint32m8_t r;
  vload(&r, p, vl);
  return r;
}

/* lane-wise op on unsigned-free ints: lane max (no overflow side conditions) */
void vmax(struct vint32m8_t *r, struct vint32m8_t *a, struct vint32m8_t *b)
/*@ With (A: list Z) (B: list Z)
    Require IntArray::full(a->s, 128, A) * IntArray::full(b->s, 128, B) * IntArray::undef_full(r->s, 128)
    Ensure exists R, Zlength(R) == 128 && IntArray::full(a->s, 128, A) * IntArray::full(b->s, 128, B) * IntArray::full(r->s, 128, R) */
;

struct vint32m8_t vmax_v(struct vint32m8_t a, struct vint32m8_t b)
/*@ With (A: list Z) (B: list Z)
    Require IntArray::full(a.s, 128, A) * IntArray::full(b.s, 128, B)
    Ensure exists R, Zlength(R) == 128 && IntArray::full(__return.s, 128, R) */
{
  struct vint32m8_t r;
  vmax(&r, &a, &b);
  return r;
}

#define vstore_m(p, v, vl) vstore((p), &(v), (vl))

void max_kernel(int *dst, int *src, int vl)
/*@ With (L: list Z)
    Require 0 <= vl && vl <= 128 && IntArray::full(src, vl, L) * IntArray::undef_full(dst, vl)
    Ensure exists D, IntArray::full(src, vl, L) * IntArray::full(dst, vl, D) */
{
  struct vint32m8_t v = vload_v(src, vl);
  struct vint32m8_t u = vload_v(src, vl);
  struct vint32m8_t w = vmax_v(v, u) /*@ where a = &v, b = &u */;
  vstore_m(dst, w, vl);
}
