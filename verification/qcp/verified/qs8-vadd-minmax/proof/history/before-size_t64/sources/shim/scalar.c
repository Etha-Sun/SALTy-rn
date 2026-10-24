#include "scalar.h"
int8_t qcp_qa_s8(int32_t x)
/*@ Require -2147483648<=x && x<=2147483647 && emp Ensure __return==qa_s8(x) && -128<=__return && __return<=127 && emp */
{ return (int8_t)x; }
int16_t qcp_qa_s16(int32_t x)
/*@ Require -2147483648<=x && x<=2147483647 && emp Ensure __return==qa_s16(x) && -32768<=__return && __return<=32767 && emp */
{ return (int16_t)x; }
int32_t qcp_qa_s32(int64_t x)
/*@ Require -9223372036854775807-1<=x && x<=9223372036854775807 && emp Ensure __return==qa_s32(x) && -2147483648<=__return && __return<=2147483647 && emp */
{ return (int32_t)x; }
int64_t qcp_qa_pow2(int32_t d)
/*@ Require 0<=d && d<=31 && emp Ensure __return==qa_pow2(d) && 1<=__return && __return<=2147483648 && emp */
{ return (int64_t)(1u << d); }
int64_t qcp_qa_floor(int64_t x,int64_t p)
/*@ Require -4294967296<=x && x<=4294967296 && 1<=p && p<=2147483648 && emp Ensure __return==qa_floor(x,p) && emp */
{ if(x<0) return -((-x+p-1)/p); return x/p; }
int16_t qcp_qa_sat16(int64_t x)
/*@ Require -9223372036854775807-1<=x && x<=9223372036854775807 && emp Ensure __return==qa_sat16(x) && -32768<=__return && __return<=32767 && emp */
{ if(x < -32768) return -32768; if(x > 32767) return 32767; return (int16_t)x; }
int8_t qcp_qa_sat8(int16_t x)
/*@ Require -32768<=x && x<=32767 && emp Ensure __return==qa_sat8(x) && -128<=__return && __return<=127 && emp */
{ if(x < -128) return -128; if(x > 127) return 127; return (int8_t)x; }
int32_t qcp_qa_neon_mul(int32_t a,int32_t b)
/*@ Require -2147483648<=a && a<=2147483647 && -2147483648<=b && b<=2147483647 && emp Ensure __return==qa_neon_mul(a,b) && -2147483648<=__return && __return<=2147483647 && emp */
{ return qcp_qa_s32((int64_t)a*(int64_t)b); }
int32_t qcp_qa_rvv_mul(int32_t a,int32_t b)
/*@ Require -2147483648<=a && a<=2147483647 && -2147483648<=b && b<=2147483647 && emp Ensure __return==qa_rvv_mul(a,b) && -2147483648<=__return && __return<=2147483647 && emp */
{ return qcp_qa_s32((int64_t)a*(int64_t)b); }
int32_t qcp_qa_neon_mla(int32_t a,int32_t b,int32_t c)
/*@ Require -2147483648<=a && a<=2147483647 && -2147483648<=b && b<=2147483647 && -2147483648<=c && c<=2147483647 && emp Ensure __return==qa_neon_mla(a,b,c) && -2147483648<=__return && __return<=2147483647 && emp */
{ int32_t low=qcp_qa_s32((int64_t)b*(int64_t)c);return qcp_qa_s32((int64_t)a+(int64_t)low); }
int32_t qcp_qa_rvv_macc(int32_t a,int32_t b,int32_t c)
/*@ Require -2147483648<=a && a<=2147483647 && -2147483648<=b && b<=2147483647 && -2147483648<=c && c<=2147483647 && emp Ensure __return==qa_rvv_macc(a,b,c) && -2147483648<=__return && __return<=2147483647 && emp */
{ return qcp_qa_s32((int64_t)a+(int64_t)b*(int64_t)c); }
int32_t qcp_qa_neon_shift(int32_t a,int32_t b)
/*@ Require -2147483648<=a && a<=2147483647 && -2147483648<=b && b<=2147483647 && emp Ensure __return==qa_neon_shift(a,b) && -2147483648<=__return && __return<=2147483647 && emp */
{ int8_t d=qcp_qa_s8(b);if(d<=-32 || d>=32) return 0;if(d<0){int64_t p=qcp_qa_pow2(-(int32_t)d);int64_t num=(int64_t)a+p/2;int64_t y=qcp_qa_floor(num,p);return (int32_t)y;}int64_t p=qcp_qa_pow2((int32_t)d);return qcp_qa_s32((int64_t)a*p); }
int32_t qcp_qa_rvv_rnu(int32_t a,int32_t d)
/*@ Require -2147483648<=a && a<=2147483647 && 0<=d && d<=31 && emp Ensure __return==qa_rvv_rnu(a,d) && -2147483648<=__return && __return<=2147483647 && emp */
{ int64_t p=qcp_qa_pow2(d);int64_t num=(int64_t)a+p/2;int64_t y=qcp_qa_floor(num,p);return (int32_t)y; }
int32_t qcp_qa_rvv_sll(int32_t a,int32_t d)
/*@ Require -2147483648<=a && a<=2147483647 && 0<=d && d<=31 && emp Ensure __return==qa_rvv_sll(a,d) && -2147483648<=__return && __return<=2147483647 && emp */
{ int64_t p=qcp_qa_pow2(d);return qcp_qa_s32((int64_t)a*p); }
int16_t qcp_qa_neon_add16(int16_t a,int16_t b)
/*@ Require -32768<=a && a<=32767 && -32768<=b && b<=32767 && emp Ensure __return==qa_neon_add16(a,b) && -32768<=__return && __return<=32767 && emp */
{ return qcp_qa_sat16((int64_t)a+(int64_t)b); }
int16_t qcp_qa_rvv_add16(int16_t a,int16_t b)
/*@ Require -32768<=a && a<=32767 && -32768<=b && b<=32767 && emp Ensure __return==qa_rvv_add16(a,b) && -32768<=__return && __return<=32767 && emp */
{ return qcp_qa_sat16((int64_t)a+(int64_t)b); }
int16_t qcp_qa_sub8(int8_t a,int8_t b)
/*@ Require -128<=a && a<=127 && -128<=b && b<=127 && emp Ensure __return==qa_s16(a-b) && -32768<=__return && __return<=32767 && emp */
{ return qcp_qa_s16((int32_t)a-(int32_t)b); }
