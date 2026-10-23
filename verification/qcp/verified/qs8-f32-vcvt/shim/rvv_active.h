#ifndef QS8_F32_RVV_ACTIVE_H
#define QS8_F32_RVV_ACTIVE_H
#include "rvv_model.h"
int16_t qcp_cvt_active_sext8(int8_t x,size_t i,size_t vl)
/*@ Require -128<=x && x<=127 && 0<=i && i<32 && 0<=vl && vl<=32 && emp Ensure __return==cvt_active_int(i,vl,x) && -32768<=__return && __return<=32767 && emp */
;
int32_t qcp_cvt_active_sext16(int16_t x,size_t i,size_t vl)
/*@ Require -32768<=x && x<=32767 && 0<=i && i<32 && 0<=vl && vl<=32 && emp Ensure __return==cvt_active_int(i,vl,x) && -32768<=__return && __return<=32767 && emp */
;
int16_t qcp_cvt_active_sub16(int16_t a,int16_t b,size_t i,size_t vl)
/*@ Require -32768<=a && a<=32767 && -32768<=b && b<=32767 && 0<=i && i<32 && 0<=vl && vl<=32 && emp Ensure __return==cvt_active_sub16(i,vl,a,b) && -32768<=__return && __return<=32767 && emp */
;
float qcp_cvt_active_float(int32_t x,size_t i,size_t vl)
/*@ Require -2147483648<=x && x<=2147483647 && 0<=i && i<32 && 0<=vl && vl<=32 && emp Ensure cvt_same(__return,cvt_active_float(i,vl,x)) && emp */
;
float qcp_cvt_active_mul(float x,float scale,size_t i,size_t vl)
/*@ Require 0<=i && i<32 && 0<=vl && vl<=32 && emp Ensure cvt_same(__return,cvt_active_mul(i,vl,x,scale)) && emp */
;
size_t __riscv_vsetvl_e8m2(size_t n)
/*@ Require 0<=n && n<=18446744073709551615 && emp Ensure __return==cvt_vl(n) && 0<=__return && __return<=32 && __return<=n && (n==0 || 0<__return) && emp */
;
#endif
