#ifndef QCP_QU8_UNSIGNED_SCALAR_H
#define QCP_QU8_UNSIGNED_SCALAR_H
#include "scalar.h"
/*@ Import Coq Require Import Qu8Add.UnsignedScalarModel */
/*@ Extern Coq (qu_u16:Z -> Z) (qu_udiff:Z -> Z -> Z) (qu_usat8:Z -> Z)
 (qu_umin:Z -> Z -> Z) (qu_umax:Z -> Z -> Z) (qu_max16zero:Z -> Z) */
uint16_t qcp_qu_u16(int32_t x)
/*@ Require (-2147483647-1)<=x && x<=2147483647 && emp Ensure __return==qu_u16(x) && 0<=__return && __return<=65535 && emp */;
uint16_t qcp_qu_subu8(uint8_t a,uint8_t b)
/*@ Require 0<=a && a<=255 && 0<=b && b<=255 && emp Ensure __return==qu_udiff(a,b) && 0<=__return && __return<=65535 && emp */;
int16_t qcp_qu_from_u16(uint16_t x)
/*@ Require 0<=x && x<=65535 && emp Ensure __return==qu_s16(x) && -32768<=__return && __return<=32767 && emp */;
uint8_t qcp_qu_usat8(int16_t x)
/*@ Require -32768<=x && x<=32767 && emp Ensure __return==qu_usat8(x) && 0<=__return && __return<=255 && emp */;
int16_t qcp_qu_max16_zero(int16_t x)
/*@ Require -32768<=x && x<=32767 && emp Ensure __return==qu_max16zero(x) && 0<=__return && __return<=32767 && emp */;
uint8_t qcp_qu_umin8(uint8_t a,uint8_t b)
/*@ Require 0<=a && a<=255 && 0<=b && b<=255 && emp Ensure __return==qu_umin(a,b) && 0<=__return && __return<=255 && emp */;
uint8_t qcp_qu_umax8(uint8_t a,uint8_t b)
/*@ Require 0<=a && a<=255 && 0<=b && b<=255 && emp Ensure __return==qu_umax(a,b) && 0<=__return && __return<=255 && emp */;
#endif
