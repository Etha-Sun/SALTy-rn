#ifndef RDSUM_VECTOR_SCALAR_H
#define RDSUM_VECTOR_SCALAR_H
#include "scalar_primitives.h"
/*@ Import Coq Require Import Qu8Rdsum.VectorModel */
/*@ Extern Coq (rd_wadd16:Z -> Z -> Z) (rd_active_wadd16:Z -> Z -> Z -> Z -> Z) (rd_active_wadd32:Z -> Z -> Z -> Z -> Z) (rd_splat:Z -> Z -> Z -> Z) */
uint16_t rdsum_wadd16(uint16_t a,uint8_t b)
/*@ Require 0<=a && a<=65535 && 0<=b && b<=255 && emp Ensure __return==rd_wadd16(a,b) && 0<=__return && __return<=65535 && emp */;
uint16_t rdsum_active_wadd16(uint16_t a,uint8_t b,size_t i,size_t vl)
/*@ Require 0<=a && a<=65535 && 0<=b && b<=255 && 0<=i && i<=18446744073709551615 && 0<=vl && vl<=18446744073709551615 && emp Ensure __return==rd_active_wadd16(a,b,i,vl) && 0<=__return && __return<=65535 && emp */;
uint32_t rdsum_active_wadd32(uint32_t a,uint16_t b,size_t i,size_t vl)
/*@ Require 0<=a && a<=4294967295 && 0<=b && b<=65535 && 0<=i && i<=18446744073709551615 && 0<=vl && vl<=18446744073709551615 && emp Ensure __return==rd_active_wadd32(a,b,i,vl) && 0<=__return && __return<=4294967295 && emp */;
uint32_t rdsum_active_add32(uint32_t a,uint32_t b,size_t i,size_t vl)
/*@ Require 0<=a && a<=4294967295 && 0<=b && b<=4294967295 && 0<=i && i<=18446744073709551615 && 0<=vl && vl<=18446744073709551615 && emp Ensure __return==rd_active_wadd32(a,b,i,vl) && 0<=__return && __return<=4294967295 && emp */;
uint16_t rdsum_splat16(uint16_t x,size_t i,size_t vl)
/*@ Require 0<=x && x<=65535 && 0<=i && i<=18446744073709551615 && 0<=vl && vl<=18446744073709551615 && emp Ensure __return==rd_splat(x,i,vl) && 0<=__return && __return<=65535 && emp */;
uint32_t rdsum_splat32(uint32_t x,size_t i,size_t vl)
/*@ Require 0<=x && x<=4294967295 && 0<=i && i<=18446744073709551615 && 0<=vl && vl<=18446744073709551615 && emp Ensure __return==rd_splat(x,i,vl) && 0<=__return && __return<=4294967295 && emp */;
#endif
