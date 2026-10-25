#include "formal_types.h"
/*@ Import Coq Require Import X32Transpose.ArithmeticModel */
/*@ Extern Coq (xt_doz:Z->Z->Z) (xt_round_down:Z->Z->Z) */
size_t doz(size_t a,size_t b)
/*@ Require emp Ensure __return==xt_doz(a,b) && emp */
{
 if(a>b) return a-b;
 return 0;
}
/* All original kernel calls useq=2. The body is ordinary unsignedC. */
size_t round_down_po2(size_t n,size_t q)
/*@ Require q>0 && emp Ensure __return==xt_round_down(n,q) && emp */
{
 return n-(n%q);
}
