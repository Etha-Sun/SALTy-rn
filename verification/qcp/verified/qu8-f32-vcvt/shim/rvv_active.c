#include "rvv_model.h"
#include "scalar_primitives.h"
#include "unsigned_scalar.h"
int16_t qcp_cvt_active_sext8(uint8_t x,size_t i,size_t vl)
/*@ Require 0<=x && x<=255 && 0<=i && i<32 && 0<=vl && vl<=32 && emp Ensure __return==cvt_active_int(i,vl,x) && -32768<=__return && __return<=32767 && emp */
{ if(i<vl)return qcp_cvt_sext8(x); return 0; }
int32_t qcp_cvt_active_sext16(int16_t x,size_t i,size_t vl)
/*@ Require -32768<=x && x<=32767 && 0<=i && i<32 && 0<=vl && vl<=32 && emp Ensure __return==cvt_active_int(i,vl,x) && -32768<=__return && __return<=32767 && emp */
{ if(i<vl)return qcp_cvt_sext16(x); return 0; }
int16_t qcp_cvt_active_sub16(int16_t a,int16_t b,size_t i,size_t vl)
/*@ Require -32768<=a && a<=32767 && -32768<=b && b<=32767 && 0<=i && i<32 && 0<=vl && vl<=32 && emp Ensure __return==cvt_active_sub16(i,vl,a,b) && -32768<=__return && __return<=32767 && emp */
{ if(i<vl)return qcp_cvt_sub16(a,b); return 0; }
float qcp_cvt_active_float(int32_t x,size_t i,size_t vl)
/*@ Require -2147483648<=x && x<=2147483647 && 0<=i && i<32 && 0<=vl && vl<=32 && emp Ensure cvt_same(__return,cvt_active_float(i,vl,x)) && emp */
{ if(i<vl)return qcp_cvt_to_f32(x); return qcp_cvt_to_f32(0); }
float qcp_cvt_active_mul(float x,float scale,size_t i,size_t vl)
/*@ Require 0<=i && i<32 && 0<=vl && vl<=32 && emp Ensure cvt_same(__return,cvt_active_mul(i,vl,x,scale)) && emp */
{ if(i<vl)return qcp_cvt_mul(x,scale); return qcp_cvt_to_f32(0); }
size_t __riscv_vsetvl_e8m2(size_t n)
/*@ Require 0<=n && n<=18446744073709551615 && emp Ensure __return==cvt_vl(n) && 0<=__return && __return<=32 && __return<=n && (n==0 || 0<__return) && emp */
{ if(n<32)return n; return 32; }

uint16_t qcp_cvt_active_zext8(uint8_t x,size_t i,size_t vl)
/*@ Require 0<=x && x<=255 && 0<=i && i<32 && 0<=vl && vl<=32 && emp Ensure __return==cvt_active_int(i,vl,x) && 0<=__return && __return<=65535 && emp */
{ if(i<vl)return qcp_cvt_zext_u8(x); return 0; }
uint16_t qcp_cvt_active_add_u16(uint16_t a,uint16_t b,size_t i,size_t vl)
/*@ Require 0<=a && a<=65535 && 0<=b && b<=65535 && 0<=i && i<32 && 0<=vl && vl<=32 && emp Ensure __return==cvt_active_add_u16(i,vl,a,b) && 0<=__return && __return<=65535 && emp */
{ if(i<vl)return qcp_cvt_add_u16(a,b); return 0; }
