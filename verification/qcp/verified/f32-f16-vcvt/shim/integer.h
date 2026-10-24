#ifndef QCP_F32F16_INTEGER_H
#define QCP_F32F16_INTEGER_H
/*@ Import Coq Require Import F32F16.IntegerModel */
/*@ Extern Coq 
 (f16_narrow16 : Z -> Z)
 (f16_add32 : Z -> Z -> Z)
 (f16_and32 : Z -> Z -> Z)
 (f16_or32 : Z -> Z -> Z)
 (f16_max32 : Z -> Z -> Z)
 (f16_gt32 : Z -> Z -> Z)
 (f16_add16 : Z -> Z -> Z)
 (f16_and16 : Z -> Z -> Z)
 (f16_or16 : Z -> Z -> Z)
 (f16_select16 : Z -> Z -> Z -> Z)
 (f16_shrn13 : Z -> Z)
 (f16_shrn16 : Z -> Z) */
unsigned short qcp_f16_narrow16(unsigned int x)
/*@ Require emp Ensure __return == f16_narrow16(x) && emp */;
unsigned int qcp_f16_add32(unsigned int a,unsigned int b)
/*@ Require emp Ensure __return == f16_add32(a,b) && emp */;
unsigned int qcp_f16_and32(unsigned int a,unsigned int b)
/*@ Require emp Ensure __return == f16_and32(a,b) && emp */;
unsigned int qcp_f16_or32(unsigned int a,unsigned int b)
/*@ Require emp Ensure __return == f16_or32(a,b) && emp */;
unsigned int qcp_f16_max32(unsigned int a,unsigned int b)
/*@ Require emp Ensure __return == f16_max32(a,b) && emp */;
unsigned int qcp_f16_gt32(unsigned int a,unsigned int b)
/*@ Require emp Ensure __return == f16_gt32(a,b) && emp */;
unsigned short qcp_f16_add16(unsigned short a,unsigned short b)
/*@ Require emp Ensure __return == f16_add16(a,b) && emp */;
unsigned short qcp_f16_and16(unsigned short a,unsigned short b)
/*@ Require emp Ensure __return == f16_and16(a,b) && emp */;
unsigned short qcp_f16_or16(unsigned short a,unsigned short b)
/*@ Require emp Ensure __return == f16_or16(a,b) && emp */;
unsigned short qcp_f16_select16(unsigned short m,unsigned short a,unsigned short b)
/*@ Require emp Ensure __return == f16_select16(m,a,b) && emp */;
unsigned short qcp_f16_shrn13(unsigned int a)
/*@ Require emp Ensure __return == f16_shrn13(a) && emp */;
unsigned short qcp_f16_shrn16(unsigned int a)
/*@ Require emp Ensure __return == f16_shrn16(a) && emp */;
#endif
