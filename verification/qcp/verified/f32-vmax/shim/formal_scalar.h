#ifndef QCP_FMAX_FORMAL_SCALAR_H
#define QCP_FMAX_FORMAL_SCALAR_H
#include "formal_model.h"
unsigned int qcp_fmax_abs_bits(unsigned int u)
/*@ Require emp Ensure __return == mm_abs_bits(u) && emp */;
int qcp_fmax_nan_bits(unsigned int u)
/*@ Require emp Ensure __return == mm_nan_bits(u) && emp */;
int qcp_fmax_snan_bits(unsigned int u)
/*@ Require emp Ensure __return == mm_snan_bits(u) && emp */;
unsigned int qcp_fmax_order_key(unsigned int u)
/*@ Require emp Ensure __return == mm_order_key(u) && emp */;
unsigned int qcp_fmax_ordered_bits(unsigned int a,unsigned int b)
/*@ Require emp Ensure __return == mm_ordered_bits(a,b) && emp */;
unsigned int qcp_fmax_arm_bits(unsigned int a,unsigned int b)
/*@ Require emp Ensure __return == mm_arm_bits(a,b) && emp */;
unsigned int qcp_fmax_rvv_bits(unsigned int a,unsigned int b)
/*@ Require emp Ensure __return == mm_rvv_bits(a,b) && emp */;
float qcp_fmax_arm(float a,float b)
/*@ Require emp Ensure same_bits(__return,mm_arm(a,b)) && emp */;
float qcp_fmax_rvv(float a,float b)
/*@ Require emp Ensure same_bits(__return,mm_rvv(a,b)) && emp */;
float qcp_fmax_rvv_add(float a,float b)
/*@ Require emp Ensure same_bits(__return,mm_rvv_add(a,b)) && emp */;
int qcp_fmax_rvv_ne(float a,float b)
/*@ Require emp Ensure __return == mm_rvv_ne(a,b) && emp */;
#endif
