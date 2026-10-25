#include "helpers.h"
float qcp_identity(float x)
/*@ Require emp Ensure bit_same(__return,x) && emp */
{ return x; }
void qcp_assert(int condition)
/*@ Require condition!=0 && emp Ensure emp */
{ }
/* Literal body of the selected upstream GNU branch. */
void xnn_prefetch_to_l1(const void *address)
/*@ Require emp Ensure emp */
{ __builtin_prefetch(address); }
