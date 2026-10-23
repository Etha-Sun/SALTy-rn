#ifndef QCP_QLR_ACTIVE_H
#define QCP_QLR_ACTIVE_H
#include "lrelu_selection.h"
#include "rvv_active.h"
/*@ Import Coq Require Import Qs8Lrelu.LreluActiveModel */
/*@ Extern Coq (qlr_active_mask:Z -> Z -> Z -> Z -> Z)
 (qlr_active_splat:Z -> Z -> Z -> Z)
 (qlr_active_merge:Z -> Z -> Z -> Z -> Z -> Z) */
uint8_t qcp_qlr_active_mask(int16_t a,int16_t b,size_t k,size_t vl)
/*@ Require -32768<=a && a<=32767 && -32768<=b && b<=32767 && 0<=k && k<=31 && 0<=vl && vl<=32 && emp
 Ensure __return==qlr_active_mask(a,b,k,vl) && 0<=__return && __return<=1 && emp */;
int16_t qcp_qlr_active_splat(int16_t b,size_t k,size_t vl)
/*@ Require -32768<=b && b<=32767 && 0<=k && k<=31 && 0<=vl && vl<=32 && emp
 Ensure __return==qlr_active_splat(b,k,vl) && -32768<=__return && __return<=32767 && emp */;
int16_t qcp_qlr_active_merge(int16_t a,int16_t b,uint8_t m,size_t k,size_t vl)
/*@ Require -32768<=a && a<=32767 && -32768<=b && b<=32767 && 0<=m && m<=1 && 0<=k && k<=31 && 0<=vl && vl<=32 && emp
 Ensure __return==qlr_active_merge(a,b,m,k,vl) && -32768<=__return && __return<=32767 && emp */;
/* Inactive C fields use zero and are unobserved by the kernel. This is
 a fixed C-shim convention, not an architectural tail policy claim. */
#endif
