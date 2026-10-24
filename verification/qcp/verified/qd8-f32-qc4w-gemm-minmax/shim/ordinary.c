/* Ordinary C helpers, outside the intrinsic-spec exception. */
typedef unsigned long long size_t;
/*@ Import Coq Require Import QC4W.NibbleModel */
/*@ Extern Coq (rounded_depth:Z -> Z) */
size_t round_up_po2(size_t n,size_t quantum)
/*@ Require 0<n && n<18446744073709551615 && quantum==2 && emp
 Ensure __return==rounded_depth(n) && emp */
{
 size_t mask=quantum-1;
 return (n+mask)&~mask;
}
void qcp_assert(int condition)
/*@ Require condition!=0 && emp Ensure emp */
{}
