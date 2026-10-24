#ifndef QCP_QU_RVV_ACTIVE_H
#define QCP_QU_RVV_ACTIVE_H
#include "neon_arithmetic.h"
#include "unsigned_scalar.h"
/*@ Import Coq Require Import Qu8Add.RvvActiveModel */
/*@ Extern Coq (qu_uclip8:Z -> Z) */
uint8_t qcp_qu_rvv_usat16(uint16_t a)
/*@ Require 0<=a && a<=65535 && emp Ensure __return==qu_uclip8(a) && 0<=__return && __return<=255 && emp */;
/*@ Extern Coq (qu_active_subu:Z -> Z -> Z -> Z -> Z) */
uint16_t qcp_qu_active_subu(uint8_t a,uint8_t b,size_t i,size_t vl)
/*@ Require 0<=i && i<32 && 0<=vl && vl<=32 && 0<=a && a<=255 && 0<=b && b<=255 && emp
 Ensure __return==qu_active_subu(i,vl,a,b) && 0<=__return && __return<=65535 && emp */;
/*@ Extern Coq (qu_active_sext:Z -> Z -> Z -> Z) */
int32_t qcp_qu_active_sext(int16_t a,size_t i,size_t vl)
/*@ Require 0<=i && i<32 && 0<=vl && vl<=32 && -32768<=a && a<=32767 && emp
 Ensure __return==qu_active_sext(i,vl,a) && -2147483648<=__return && __return<=2147483647 && emp */;
/*@ Extern Coq (qu_active_mul:Z -> Z -> Z -> Z -> Z) */
int32_t qcp_qu_active_mul(int32_t a,int32_t b,size_t i,size_t vl)
/*@ Require 0<=i && i<32 && 0<=vl && vl<=32 && -2147483648<=a && a<=2147483647 && -2147483648<=b && b<=2147483647 && emp
 Ensure __return==qu_active_mul(i,vl,a,b) && -2147483648<=__return && __return<=2147483647 && emp */;
/*@ Extern Coq (qu_active_macc:Z -> Z -> Z -> Z -> Z -> Z) */
int32_t qcp_qu_active_macc(int32_t a,int32_t c,int32_t b,size_t i,size_t vl)
/*@ Require 0<=i && i<32 && 0<=vl && vl<=32 && -2147483648<=a && a<=2147483647 && -2147483648<=c && c<=2147483647 && -2147483648<=b && b<=2147483647 && emp
 Ensure __return==qu_active_macc(i,vl,a,c,b) && -2147483648<=__return && __return<=2147483647 && emp */;
/*@ Extern Coq (qu_active_mov:Z -> Z -> Z -> Z) */
int32_t qcp_qu_active_mov(int32_t b,size_t i,size_t vl)
/*@ Require 0<=i && i<32 && 0<=vl && vl<=32 && -2147483648<=b && b<=2147483647 && emp
 Ensure __return==qu_active_mov(i,vl,b) && -2147483648<=__return && __return<=2147483647 && emp */;
/*@ Extern Coq (qu_active_rnu:Z -> Z -> Z -> Z -> Z) */
int32_t qcp_qu_active_rnu(int32_t a,size_t d,size_t i,size_t vl)
/*@ Require 0<=i && i<32 && 0<=vl && vl<=32 && -2147483648<=a && a<=2147483647 && 0<=d && d<=31 && emp
 Ensure __return==qu_active_rnu(i,vl,a,d) && -2147483648<=__return && __return<=2147483647 && emp */;
/*@ Extern Coq (qu_active_sll:Z -> Z -> Z -> Z -> Z) */
int32_t qcp_qu_active_sll(int32_t a,size_t d,size_t i,size_t vl)
/*@ Require 0<=i && i<32 && 0<=vl && vl<=32 && -2147483648<=a && a<=2147483647 && 0<=d && d<=31 && emp
 Ensure __return==qu_active_sll(i,vl,a,d) && -2147483648<=__return && __return<=2147483647 && emp */;
/*@ Extern Coq (qu_active_clip16:Z -> Z -> Z -> Z) */
int16_t qcp_qu_active_clip16(int32_t a,size_t i,size_t vl)
/*@ Require 0<=i && i<32 && 0<=vl && vl<=32 && -2147483648<=a && a<=2147483647 && emp
 Ensure __return==qu_active_clip16(i,vl,a) && -32768<=__return && __return<=32767 && emp */;
/*@ Extern Coq (qu_active_add:Z -> Z -> Z -> Z -> Z) */
int16_t qcp_qu_active_add(int16_t a,int16_t b,size_t i,size_t vl)
/*@ Require 0<=i && i<32 && 0<=vl && vl<=32 && -32768<=a && a<=32767 && -32768<=b && b<=32767 && emp
 Ensure __return==qu_active_add(i,vl,a,b) && -32768<=__return && __return<=32767 && emp */;
/*@ Extern Coq (qu_active_max16:Z -> Z -> Z -> Z) */
int16_t qcp_qu_active_max16(int16_t a,size_t i,size_t vl)
/*@ Require 0<=i && i<32 && 0<=vl && vl<=32 && -32768<=a && a<=32767 && emp
 Ensure __return==qu_active_max16(i,vl,a) && -32768<=__return && __return<=32767 && emp */;
/*@ Extern Coq (qu_active_clipu8:Z -> Z -> Z -> Z) */
uint8_t qcp_qu_active_clipu8(uint16_t a,size_t i,size_t vl)
/*@ Require 0<=i && i<32 && 0<=vl && vl<=32 && 0<=a && a<=65535 && emp
 Ensure __return==qu_active_clipu8(i,vl,a) && 0<=__return && __return<=255 && emp */;
/*@ Extern Coq (qu_active_max:Z -> Z -> Z -> Z -> Z) */
uint8_t qcp_qu_active_max(uint8_t a,uint8_t b,size_t i,size_t vl)
/*@ Require 0<=i && i<32 && 0<=vl && vl<=32 && 0<=a && a<=255 && 0<=b && b<=255 && emp
 Ensure __return==qu_active_max(i,vl,a,b) && 0<=__return && __return<=255 && emp */;
/*@ Extern Coq (qu_active_min:Z -> Z -> Z -> Z -> Z) */
uint8_t qcp_qu_active_min(uint8_t a,uint8_t b,size_t i,size_t vl)
/*@ Require 0<=i && i<32 && 0<=vl && vl<=32 && 0<=a && a<=255 && 0<=b && b<=255 && emp
 Ensure __return==qu_active_min(i,vl,a,b) && 0<=__return && __return<=255 && emp */;
#endif
