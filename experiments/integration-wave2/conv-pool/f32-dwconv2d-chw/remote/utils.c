#include "fp_primitives.h"

void xnn_prefetch_to_l1(const void *p) { (void)p; }

size_t round_down_po2(size_t n,size_t q) { return n & ~(q-1); }

size_t round_up_po2(size_t n,size_t q) { return (n+q-1)&~(q-1); }

/*@ ensures next_doz_exact: \result==(n>d?n-d:0);
*/
size_t doz(size_t n,size_t d) { return n>d?n-d:0; }
