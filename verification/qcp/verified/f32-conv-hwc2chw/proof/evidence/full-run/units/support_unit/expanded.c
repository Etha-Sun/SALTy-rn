/* Explicit formal LP64 frontend widths, audited with actual sizeof probes later. */
typedef unsigned long long size_t;
typedef unsigned long long uintptr_t;
typedef long long ptrdiff_t;
/*@ Import Coq Require Import HwcConv.Types */
/*@ Import Coq Require Import HwcConv.SupportModel */
/*@ Extern Coq (hc_doz_model : Z -> Z -> Z) (hc_round_model : Z -> Z) */
size_t hc_round_down4(size_t n)
/*@ Require emp Ensure __return == hc_round_model(n) && emp */
{return n & ~(size_t)3;}
size_t hc_doz(size_t a,size_t b)
/*@ Require emp Ensure __return == hc_doz_model(a,b) && emp */
{return a>b?a-b:0;}
