#include "lrelu_active.h"
uint8_t qcp_qlr_active_mask(int16_t a,int16_t b,size_t k,size_t vl)
/*@ Require -32768<=a && a<=32767 && -32768<=b && b<=32767 && 0<=k && k<=31 && 0<=vl && vl<=32 && emp
 Ensure __return==qlr_active_mask(a,b,k,vl) && 0<=__return && __return<=1 && emp */
{ if(k<vl) return qcp_qlr_cmpbool(a,b); return 0; }
int16_t qcp_qlr_active_splat(int16_t b,size_t k,size_t vl)
/*@ Require -32768<=b && b<=32767 && 0<=k && k<=31 && 0<=vl && vl<=32 && emp
 Ensure __return==qlr_active_splat(b,k,vl) && -32768<=__return && __return<=32767 && emp */
{ if(k<vl) return b; return 0; }
int16_t qcp_qlr_active_merge(int16_t a,int16_t b,uint8_t m,size_t k,size_t vl)
/*@ Require -32768<=a && a<=32767 && -32768<=b && b<=32767 && 0<=m && m<=1 && 0<=k && k<=31 && 0<=vl && vl<=32 && emp
 Ensure __return==qlr_active_merge(a,b,m,k,vl) && -32768<=__return && __return<=32767 && emp */
{ if(k<vl) return qcp_qlr_choose_rvv(m,b,a); return 0; }
