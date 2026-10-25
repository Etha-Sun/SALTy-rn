#ifndef SPmm_HELPERS_H
#define SPmm_HELPERS_H
/*@ Import Coq Require Import GemmSpec.FmaModel */
/*@ Extern Coq (bit_same:fp32 -> fp32 -> Prop) */
float qcp_identity(float x)
/*@ Require emp Ensure bit_same(__return,x) && emp */;
void qcp_assert(int condition)
/*@ Require condition!=0 && emp Ensure emp */;
/* Source-reviewed GNU builtin. Cache/performance effects are not data-memory
   observations; the caller still proves evaluation of its address expression. */
void __builtin_prefetch(const void *address)
/*@ Require emp Ensure emp */;
void xnn_prefetch_to_l1(const void *address)
/*@ Require emp Ensure emp */;
#endif
