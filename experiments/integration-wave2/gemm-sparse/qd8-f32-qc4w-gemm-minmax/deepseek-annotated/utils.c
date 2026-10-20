#include "fp_primitives.h"

/*@ assigns \nothing; */
void xnn_prefetch_to_l1(const void *p) { (void)p; }

/*@ assigns \nothing; ensures \result==(n & (size_t)~(size_t)(q-1)); */
size_t round_down_po2(size_t n,size_t q) { return n & ~(q-1); }

/*@ assigns \nothing; ensures \result==((size_t)((size_t)(n+q)-1) & (size_t)~(size_t)(q-1)); */
size_t round_up_po2(size_t n,size_t q) { return (n+q-1)&~(q-1); }

/*@ assigns \nothing; ensures \result==(n>d?n-d:0); */
size_t doz(size_t n,size_t d) { return n>d?n-d:0; }
