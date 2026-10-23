#include "lrelu_selection.h"
uint16_t qcp_qlr_cmp16(int16_t a,int16_t b)
/*@ Require -32768<=a && a<=32767 && -32768<=b && b<=32767 && emp
 Ensure __return==qlr_neon_mask(a,b) && 0<=__return && __return<=65535 && emp */
{ if(a<b) return 65535; return 0; }
uint8_t qcp_qlr_cmpbool(int16_t a,int16_t b)
/*@ Require -32768<=a && a<=32767 && -32768<=b && b<=32767 && emp
 Ensure __return==qlr_rvv_mask(a,b) && 0<=__return && __return<=1 && emp */
{ if(a<b) return 1; return 0; }
int16_t qcp_qlr_choose_neon(uint16_t m,int16_t a,int16_t b)
/*@ Require (m==0 || m==65535) && -32768<=a && a<=32767 && -32768<=b && b<=32767 && emp
 Ensure __return==qlr_choose_neon(m,a,b) && -32768<=__return && __return<=32767 && emp */
{ if(m==65535) return a; return b; }
int16_t qcp_qlr_choose_rvv(uint8_t m,int16_t a,int16_t b)
/*@ Require (m==0 || m==1) && -32768<=a && a<=32767 && -32768<=b && b<=32767 && emp
 Ensure __return==qlr_choose_rvv(m,a,b) && -32768<=__return && __return<=32767 && emp */
{ if(m==1) return a; return b; }
