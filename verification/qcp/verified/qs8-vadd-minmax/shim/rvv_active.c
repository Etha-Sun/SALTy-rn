#include "rvv_active.h"
int16_t qcp_qa_active_sub(int8_t a,int8_t b,size_t i,size_t vl)
/*@ Require 0<=i && i<32 && 0<=vl && vl<=32 && -128<=a && a<=127 && -128<=b && b<=127 && emp
 Ensure __return==qa_active_sub(i,vl,a,b) && -32768<=__return && __return<=32767 && emp */
{if(i<vl)return qcp_qa_sub8(a,b);return 0;}
int32_t qcp_qa_active_sext(int16_t a,size_t i,size_t vl)
/*@ Require 0<=i && i<32 && 0<=vl && vl<=32 && -32768<=a && a<=32767 && emp
 Ensure __return==qa_active_sext(i,vl,a) && -2147483648<=__return && __return<=2147483647 && emp */
{if(i<vl)return a;return 0;}
int32_t qcp_qa_active_mul(int32_t a,int32_t b,size_t i,size_t vl)
/*@ Require 0<=i && i<32 && 0<=vl && vl<=32 && -2147483648<=a && a<=2147483647 && -2147483648<=b && b<=2147483647 && emp
 Ensure __return==qa_active_mul(i,vl,a,b) && -2147483648<=__return && __return<=2147483647 && emp */
{if(i<vl)return qcp_qa_rvv_mul(a,b);return 0;}
int32_t qcp_qa_active_macc(int32_t a,int32_t c,int32_t b,size_t i,size_t vl)
/*@ Require 0<=i && i<32 && 0<=vl && vl<=32 && -2147483648<=a && a<=2147483647 && -2147483648<=c && c<=2147483647 && -2147483648<=b && b<=2147483647 && emp
 Ensure __return==qa_active_macc(i,vl,a,c,b) && -2147483648<=__return && __return<=2147483647 && emp */
{if(i<vl)return qcp_qa_rvv_macc(a,b,c);return 0;}
int32_t qcp_qa_active_mov(int32_t b,size_t i,size_t vl)
/*@ Require 0<=i && i<32 && 0<=vl && vl<=32 && -2147483648<=b && b<=2147483647 && emp
 Ensure __return==qa_active_mov(i,vl,b) && -2147483648<=__return && __return<=2147483647 && emp */
{if(i<vl)return b;return 0;}
int32_t qcp_qa_active_rnu(int32_t a,size_t d,size_t i,size_t vl)
/*@ Require 0<=i && i<32 && 0<=vl && vl<=32 && -2147483648<=a && a<=2147483647 && 0<=d && d<=31 && emp
 Ensure __return==qa_active_rnu(i,vl,a,d) && -2147483648<=__return && __return<=2147483647 && emp */
{if(i<vl)return qcp_qa_rvv_rnu(a,(int32_t)d);return 0;}
int32_t qcp_qa_active_sll(int32_t a,size_t d,size_t i,size_t vl)
/*@ Require 0<=i && i<32 && 0<=vl && vl<=32 && -2147483648<=a && a<=2147483647 && 0<=d && d<=31 && emp
 Ensure __return==qa_active_sll(i,vl,a,d) && -2147483648<=__return && __return<=2147483647 && emp */
{if(i<vl)return qcp_qa_rvv_sll(a,(int32_t)d);return 0;}
int16_t qcp_qa_active_clip16(int32_t a,size_t i,size_t vl)
/*@ Require 0<=i && i<32 && 0<=vl && vl<=32 && -2147483648<=a && a<=2147483647 && emp
 Ensure __return==qa_active_clip16(i,vl,a) && -32768<=__return && __return<=32767 && emp */
{if(i<vl)return qcp_qa_sat16(a);return 0;}
int16_t qcp_qa_active_add(int16_t a,int16_t b,size_t i,size_t vl)
/*@ Require 0<=i && i<32 && 0<=vl && vl<=32 && -32768<=a && a<=32767 && -32768<=b && b<=32767 && emp
 Ensure __return==qa_active_add(i,vl,a,b) && -32768<=__return && __return<=32767 && emp */
{if(i<vl)return qcp_qa_rvv_add16(a,b);return 0;}
int8_t qcp_qa_active_clip8(int16_t a,size_t i,size_t vl)
/*@ Require 0<=i && i<32 && 0<=vl && vl<=32 && -32768<=a && a<=32767 && emp
 Ensure __return==qa_active_clip8(i,vl,a) && -128<=__return && __return<=127 && emp */
{if(i<vl)return qcp_qa_sat8(a);return 0;}
int8_t qcp_qa_active_max(int8_t a,int8_t b,size_t i,size_t vl)
/*@ Require 0<=i && i<32 && 0<=vl && vl<=32 && -128<=a && a<=127 && -128<=b && b<=127 && emp
 Ensure __return==qa_active_max(i,vl,a,b) && -128<=__return && __return<=127 && emp */
{if(i<vl)return qcp_qa_max8(a,b);return 0;}
int8_t qcp_qa_active_min(int8_t a,int8_t b,size_t i,size_t vl)
/*@ Require 0<=i && i<32 && 0<=vl && vl<=32 && -128<=a && a<=127 && -128<=b && b<=127 && emp
 Ensure __return==qa_active_min(i,vl,a,b) && -128<=__return && __return<=127 && emp */
{if(i<vl)return qcp_qa_min8(a,b);return 0;}
