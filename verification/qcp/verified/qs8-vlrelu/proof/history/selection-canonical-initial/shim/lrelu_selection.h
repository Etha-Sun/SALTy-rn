#ifndef QCP_QLR_SELECTION_H
#define QCP_QLR_SELECTION_H
#include "types_def.h"
/*@ Import Coq Require Import Qs8Lrelu.LreluModel */
/*@ Extern Coq (qlr_neon_mask:Z -> Z -> Z) (qlr_rvv_mask:Z -> Z -> Z)
 (qlr_choose_neon:Z -> Z -> Z -> Z) (qlr_choose_rvv:Z -> Z -> Z -> Z) */
uint16_t qcp_qlr_cmp16(int16_t a,int16_t b)
/*@ Require -32768<=a && a<=32767 && -32768<=b && b<=32767 && emp
 Ensure __return==qlr_neon_mask(a,b) && 0<=__return && __return<=65535 && emp */;
uint8_t qcp_qlr_cmpbool(int16_t a,int16_t b)
/*@ Require -32768<=a && a<=32767 && -32768<=b && b<=32767 && emp
 Ensure __return==qlr_rvv_mask(a,b) && 0<=__return && __return<=1 && emp */;
int16_t qcp_qlr_choose_neon(uint16_t m,int16_t a,int16_t b)
/*@ Require (m==0 || m==65535) && -32768<=a && a<=32767 && -32768<=b && b<=32767 && emp
 Ensure __return==qlr_choose_neon(m,a,b) && -32768<=__return && __return<=32767 && emp */;
int16_t qcp_qlr_choose_rvv(uint8_t m,int16_t a,int16_t b)
/*@ Require (m==0 || m==1) && -32768<=a && a<=32767 && -32768<=b && b<=32767 && emp
 Ensure __return==qlr_choose_rvv(m,a,b) && -32768<=__return && __return<=32767 && emp */;
/* Selection helpers model the canonical masks produced by the compared
   lanes in this kernel. They are not a full-domain ISA bit-select model. */
#endif
