#ifndef QCP_RNDNE_SCALAR_H
#define QCP_RNDNE_SCALAR_H
#include "bits.h"
/*@ Import Coq Require Import Rndne.Model */
/*@ Extern Coq (rndne_same_bits : fp32 -> fp32 -> Prop)
 (rndne_abs : fp32 -> fp32)
 (rndne_sign : fp32 -> fp32 -> fp32)
 (rndne_select : Z -> fp32 -> fp32 -> fp32)
 (rndne_quiet : fp32 -> fp32)
 (rndne_abs_bits : Z -> Z)
 (rndne_nan_bits : Z -> Z)
 (rndne_snan_bits : Z -> Z)
 (rndne_key : Z -> Z)
 (rndne_gt_bits : Z -> Z -> Z)
 (rndne_abs_lt_bits : Z -> Z -> Z)
 (rndne_ne_bits : Z -> Z -> Z)
 (rndne_gt : fp32 -> fp32 -> Z)
 (rndne_abs_lt : fp32 -> fp32 -> Z)
 (rndne_ne : fp32 -> fp32 -> Z)
 (rndne_arm_nan : fp32 -> fp32 -> Z)
 (rndne_arm_add : fp32 -> fp32 -> fp32)
 (rndne_arm_sub : fp32 -> fp32 -> fp32)
 (rndne_rvv_add : fp32 -> fp32 -> fp32)
 (rndne_rvv_sub : fp32 -> fp32 -> fp32) */
float qcp_rnd_abs(float x)
/*@ Require emp Ensure rndne_same_bits(__return,rndne_abs(x)) && emp */;
float qcp_rnd_sign(float a,float b)
/*@ Require emp Ensure rndne_same_bits(__return,rndne_sign(a,b)) && emp */;
float qcp_rnd_select(unsigned int m,float a,float b)
/*@ Require emp Ensure rndne_same_bits(__return,rndne_select(m,a,b)) && emp */;
float qcp_rnd_quiet(float x)
/*@ Require emp Ensure rndne_same_bits(__return,rndne_quiet(x)) && emp */;
unsigned int qcp_rnd_abs_bits(unsigned int u)
/*@ Require emp Ensure __return == rndne_abs_bits(u) && emp */;
int qcp_rnd_nan_bits(unsigned int u)
/*@ Require emp Ensure __return == rndne_nan_bits(u) && emp */;
int qcp_rnd_snan_bits(unsigned int u)
/*@ Require emp Ensure __return == rndne_snan_bits(u) && emp */;
unsigned int qcp_rnd_key(unsigned int u)
/*@ Require emp Ensure __return == rndne_key(u) && emp */;
int qcp_rnd_gt_bits(unsigned int a,unsigned int b)
/*@ Require emp Ensure __return == rndne_gt_bits(a,b) && emp */;
int qcp_rnd_gt(float a,float b)
/*@ Require emp Ensure __return == rndne_gt(a,b) && emp */;
unsigned int qcp_rnd_abs_lt_bits(unsigned int a,unsigned int b)
/*@ Require emp Ensure __return == rndne_abs_lt_bits(a,b) && emp */;
unsigned int qcp_rnd_abs_lt(float a,float b)
/*@ Require emp Ensure __return == rndne_abs_lt(a,b) && emp */;
int qcp_rnd_ne_bits(unsigned int a,unsigned int b)
/*@ Require emp Ensure __return == rndne_ne_bits(a,b) && emp */;
int qcp_rnd_ne(float a,float b)
/*@ Require emp Ensure __return == rndne_ne(a,b) && emp */;
unsigned int qcp_rnd_arm_nan(float a,float b)
/*@ Require emp Ensure __return == rndne_arm_nan(a,b) && emp */;
float qcp_rnd_arm_add(float a,float b)
/*@ Require emp Ensure rndne_same_bits(__return,rndne_arm_add(a,b)) && emp */;
float qcp_rnd_arm_sub(float a,float b)
/*@ Require emp Ensure rndne_same_bits(__return,rndne_arm_sub(a,b)) && emp */;
float qcp_rnd_rvv_add(float a,float b)
/*@ Require emp Ensure rndne_same_bits(__return,rndne_rvv_add(a,b)) && emp */;
float qcp_rnd_rvv_sub(float a,float b)
/*@ Require emp Ensure rndne_same_bits(__return,rndne_rvv_sub(a,b)) && emp */;
#endif
