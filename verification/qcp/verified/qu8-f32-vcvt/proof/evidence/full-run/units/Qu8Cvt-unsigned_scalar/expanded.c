typedef unsigned char uint8_t;
typedef signed short int16_t;
typedef unsigned short uint16_t;
typedef signed int int32_t;
typedef unsigned int uint32_t;
/*@ Import Coq Require Import Qu8Cvt.Model */
/*@ Extern Coq (cvt_s16 : Z -> Z) (cvt_seed : Z -> Z)
 (cvt_addw : Z -> Z -> Z) (cvt_sub16 : Z -> Z -> Z)
 (cvt_same : fp32 -> fp32 -> Prop) */
int16_t qcp_cvt_narrow16(int32_t x)
/*@ Require -2147483648<=x && x<=2147483647 && emp
 Ensure __return==cvt_s16(x) && -32768<=__return && __return<=32767 && emp */;
int16_t qcp_cvt_seed(int32_t z)
/*@ Require -2147483648<=z && z<=2147483647 && emp
 Ensure __return==cvt_seed(z) && -32768<=__return && __return<=32767 && emp */;
int16_t qcp_cvt_addw(int16_t a,uint8_t b)
/*@ Require -32768<=a && a<=32767 && 0<=b && b<=255 && emp
 Ensure __return==cvt_addw(a,b) && -32768<=__return && __return<=32767 && emp */;
int16_t qcp_cvt_sub16(int16_t a,int16_t b)
/*@ Require -32768<=a && a<=32767 && -32768<=b && b<=32767 && emp
 Ensure __return==cvt_sub16(a,b) && -32768<=__return && __return<=32767 && emp */;
int16_t qcp_cvt_sext8(uint8_t x)
/*@ Require 0<=x && x<=255 && emp Ensure __return==x && -32768<=__return && __return<=32767 && emp */;
int32_t qcp_cvt_sext16(int16_t x)
/*@ Require -32768<=x && x<=32767 && emp Ensure __return==x && emp */;
float qcp_cvt_to_f32(int32_t x)
/*@ Require -2147483648<=x && x<=2147483647 && emp
 Ensure cvt_same(__return,Z_to_fp32(x)) && emp */;
float qcp_cvt_mul(float a,float b)
/*@ Require emp Ensure cvt_same(__return,fp32_mul(a,b)) && emp */;
/*@ Import Coq Require Import Qu8Cvt.UnsignedModel */
/*@ Extern Coq (cvt_u16:Z -> Z)(cvt_add_u16:Z -> Z -> Z)(cvt_seed_u16:Z -> Z) */
uint16_t qcp_cvt_u16(int32_t x)
/*@ Require -2147483648<=x && x<=2147483647 && emp Ensure __return==cvt_u16(x) && 0<=__return && __return<=65535 && emp */;
uint16_t qcp_cvt_add_u16(uint16_t a,uint16_t b)
/*@ Require 0<=a && a<=65535 && 0<=b && b<=65535 && emp Ensure __return==cvt_add_u16(a,b) && 0<=__return && __return<=65535 && emp */;
int16_t qcp_cvt_as_s16(uint16_t x)
/*@ Require 0<=x && x<=65535 && emp Ensure __return==cvt_s16(x) && -32768<=__return && __return<=32767 && emp */;
uint16_t qcp_cvt_as_u16(int16_t x)
/*@ Require -32768<=x && x<=32767 && emp Ensure __return==cvt_u16(x) && 0<=__return && __return<=65535 && emp */;
uint16_t qcp_cvt_seed_u16(int32_t z)
/*@ Require -2147483648<=z && z<=2147483647 && emp Ensure __return==cvt_seed_u16(z) && 0<=__return && __return<=65535 && emp */;
uint16_t qcp_cvt_zext_u8(uint8_t x)
/*@ Require 0<=x && x<=255 && emp Ensure __return==x && 0<=__return && __return<=65535 && emp */;
uint16_t qcp_cvt_u16(int32_t x)
/*@ Require -2147483648<=x && x<=2147483647 && emp Ensure __return==cvt_u16(x) && 0<=__return && __return<=65535 && emp */
{ return (uint16_t)x; }
uint16_t qcp_cvt_add_u16(uint16_t a,uint16_t b)
/*@ Require 0<=a && a<=65535 && 0<=b && b<=65535 && emp Ensure __return==cvt_add_u16(a,b) && 0<=__return && __return<=65535 && emp */
{ return qcp_cvt_u16((int32_t)a+(int32_t)b); }
int16_t qcp_cvt_as_s16(uint16_t x)
/*@ Require 0<=x && x<=65535 && emp Ensure __return==cvt_s16(x) && -32768<=__return && __return<=32767 && emp */
{ return qcp_cvt_narrow16((int32_t)x); }
uint16_t qcp_cvt_as_u16(int16_t x)
/*@ Require -32768<=x && x<=32767 && emp Ensure __return==cvt_u16(x) && 0<=__return && __return<=65535 && emp */
{ return qcp_cvt_u16((int32_t)x); }
uint16_t qcp_cvt_seed_u16(int32_t z)
/*@ Require -2147483648<=z && z<=2147483647 && emp Ensure __return==cvt_seed_u16(z) && 0<=__return && __return<=65535 && emp */
{ return (uint16_t)(0U-(uint32_t)z); }
uint16_t qcp_cvt_zext_u8(uint8_t x)
/*@ Require 0<=x && x<=255 && emp Ensure __return==x && 0<=__return && __return<=65535 && emp */
{ return x; }
