#ifndef QCP_QCV_RVV_ACTIVE_H
#define QCP_QCV_RVV_ACTIVE_H
#include "types_def.h"
/*@ Import Coq Require Import Qs8I8Cvt.RvvModel */
/*@ Extern Coq (qcv_vl:Z -> Z) (qcv_active_sext:Z -> Z -> Z -> Z) (qcv_active_rsub:Z -> Z -> Z -> Z -> Z) (qcv_active_shl7:Z -> Z -> Z -> Z) (qcv_active_mul:Z -> Z -> Z -> Z -> Z) (qcv_active_clip15:Z -> Z -> Z -> Z) (qcv_active_add:Z -> Z -> Z -> Z -> Z) (qcv_active_clip8:Z -> Z -> Z -> Z) */
int16_t qcp_qcv_active_sext(int8_t x,size_t i,size_t vl)
/*@ Require -128<=x && x<=127 && 0<=i && i<32 && 0<=vl && vl<=32 && emp Ensure __return==qcv_active_sext(i,vl,x) && -128<=__return && __return<=127 && emp */;
int16_t qcp_qcv_active_rsub(int16_t a,int16_t b,size_t i,size_t vl)
/*@ Require -32768<=a && a<=32767 && -32768<=b && b<=32767 && 0<=i && i<32 && 0<=vl && vl<=32 && emp Ensure __return==qcv_active_rsub(i,vl,a,b) && -32768<=__return && __return<=32767 && emp */;
int16_t qcp_qcv_active_shl7(int16_t a,size_t i,size_t vl)
/*@ Require -32768<=a && a<=32767 && 0<=i && i<32 && 0<=vl && vl<=32 && emp Ensure __return==qcv_active_shl7(i,vl,a) && -32768<=__return && __return<=32767 && emp */;
int32_t qcp_qcv_active_mul(int16_t a,int16_t b,size_t i,size_t vl)
/*@ Require -32768<=a && a<=32767 && -32768<=b && b<=32767 && 0<=i && i<32 && 0<=vl && vl<=32 && emp Ensure __return==qcv_active_mul(i,vl,a,b) && -2147483648<=__return && __return<=2147483647 && emp */;
int16_t qcp_qcv_active_clip15(int32_t a,size_t i,size_t vl)
/*@ Require -2147483648<=a && a<=2147483647 && 0<=i && i<32 && 0<=vl && vl<=32 && emp Ensure __return==qcv_active_clip15(i,vl,a) && -32768<=__return && __return<=32767 && emp */;
int16_t qcp_qcv_active_add(int16_t a,int16_t b,size_t i,size_t vl)
/*@ Require -32768<=a && a<=32767 && -32768<=b && b<=32767 && 0<=i && i<32 && 0<=vl && vl<=32 && emp Ensure __return==qcv_active_add(i,vl,a,b) && -32768<=__return && __return<=32767 && emp */;
int8_t qcp_qcv_active_clip8(int16_t a,size_t i,size_t vl)
/*@ Require -32768<=a && a<=32767 && 0<=i && i<32 && 0<=vl && vl<=32 && emp Ensure __return==qcv_active_clip8(i,vl,a) && -128<=__return && __return<=127 && emp */;
size_t __riscv_vsetvl_e8m2(size_t n)
/*@ Require 0<=n && n<=18446744073709551615 && emp Ensure __return==qcv_vl(n) && 0<=__return && __return<=32 && __return<=n && (n==0 || 0<__return) && emp */;
#endif
