/*@ Import Coq Require Import F32F16.Bits */
/*@ Extern Coq (same_bits : fp32 -> fp32 -> Prop)
 (bits_of_fp32 : fp32 -> Z)
 (fp32_of_bits : Z -> fp32)
 (word32 : Z -> Z -> Z -> Z -> Z -> Prop)
 (aligned_4 : Z -> Prop) */
unsigned int qcp_float_bits(float x)
/*@ Require emp
 Ensure __return == bits_of_fp32(x) && emp */;
float qcp_float_from_bits(unsigned int bits)
/*@ Require emp
 Ensure same_bits(__return,fp32_of_bits(bits)) && emp */;
/*@ Import Coq Require Import F32F16.Model */
/*@ Extern Coq (f16_same_bits : fp32 -> fp32 -> Prop)
 (f16_abs : fp32 -> fp32)
 (f16_sign : fp32 -> fp32 -> fp32)
 (f16_select : Z -> fp32 -> fp32 -> fp32)
 (f16_quiet : fp32 -> fp32)
 (f16_abs_bits : Z -> Z)
 (f16_nan_bits : Z -> Z)
 (f16_snan_bits : Z -> Z)
 (f16_key : Z -> Z)
 (f16_gt_bits : Z -> Z -> Z)
 (f16_abs_lt_bits : Z -> Z -> Z)
 (f16_ne_bits : Z -> Z -> Z)
 (f16_gt : fp32 -> fp32 -> Z)
 (f16_abs_lt : fp32 -> fp32 -> Z)
 (f16_ne : fp32 -> fp32 -> Z)
 (f16_arm_nan : fp32 -> fp32 -> Z)
 (f16_arm_add : fp32 -> fp32 -> fp32)
 (f16_arm_sub : fp32 -> fp32 -> fp32)
 (f16_rvv_add : fp32 -> fp32 -> fp32)
 (f16_rvv_sub : fp32 -> fp32 -> fp32)
 (f16_arm_mul : fp32 -> fp32 -> fp32)
 (f16_rvv_mul : fp32 -> fp32 -> fp32) */
float qcp_f16_abs(float x)
/*@ Require emp Ensure f16_same_bits(__return,f16_abs(x)) && emp */;
float qcp_f16_sign(float a,float b)
/*@ Require emp Ensure f16_same_bits(__return,f16_sign(a,b)) && emp */;
float qcp_f16_select(unsigned int m,float a,float b)
/*@ Require emp Ensure f16_same_bits(__return,f16_select(m,a,b)) && emp */;
float qcp_f16_quiet(float x)
/*@ Require emp Ensure f16_same_bits(__return,f16_quiet(x)) && emp */;
unsigned int qcp_f16_abs_bits(unsigned int u)
/*@ Require emp Ensure __return == f16_abs_bits(u) && emp */;
int qcp_f16_nan_bits(unsigned int u)
/*@ Require emp Ensure __return == f16_nan_bits(u) && emp */;
int qcp_f16_snan_bits(unsigned int u)
/*@ Require emp Ensure __return == f16_snan_bits(u) && emp */;
unsigned int qcp_f16_key(unsigned int u)
/*@ Require emp Ensure __return == f16_key(u) && emp */;
int qcp_f16_gt_bits(unsigned int a,unsigned int b)
/*@ Require emp Ensure __return == f16_gt_bits(a,b) && emp */;
int qcp_f16_gt(float a,float b)
/*@ Require emp Ensure __return == f16_gt(a,b) && emp */;
unsigned int qcp_f16_abs_lt_bits(unsigned int a,unsigned int b)
/*@ Require emp Ensure __return == f16_abs_lt_bits(a,b) && emp */;
unsigned int qcp_f16_abs_lt(float a,float b)
/*@ Require emp Ensure __return == f16_abs_lt(a,b) && emp */;
int qcp_f16_ne_bits(unsigned int a,unsigned int b)
/*@ Require emp Ensure __return == f16_ne_bits(a,b) && emp */;
int qcp_f16_ne(float a,float b)
/*@ Require emp Ensure __return == f16_ne(a,b) && emp */;
unsigned int qcp_f16_arm_nan(float a,float b)
/*@ Require emp Ensure __return == f16_arm_nan(a,b) && emp */;
float qcp_f16_arm_add(float a,float b)
/*@ Require emp Ensure f16_same_bits(__return,f16_arm_add(a,b)) && emp */;
float qcp_f16_arm_sub(float a,float b)
/*@ Require emp Ensure f16_same_bits(__return,f16_arm_sub(a,b)) && emp */;
float qcp_f16_rvv_add(float a,float b)
/*@ Require emp Ensure f16_same_bits(__return,f16_rvv_add(a,b)) && emp */;
float qcp_f16_rvv_sub(float a,float b)
/*@ Require emp Ensure f16_same_bits(__return,f16_rvv_sub(a,b)) && emp */;
float qcp_f16_arm_mul(float a,float b)
/*@ Require emp Ensure f16_same_bits(__return,f16_arm_mul(a,b)) && emp */;
float qcp_f16_rvv_mul(float a,float b)
/*@ Require emp Ensure f16_same_bits(__return,f16_rvv_mul(a,b)) && emp */;
/*@ Import Coq Require Import F32F16.LiteralModel */
/*@ Extern Coq (f16_scale_hi : fp32) (f16_scale_lo : fp32) */
float qcp_f16_scale_hi(void) /*@ Require emp Ensure f16_same_bits(__return,f16_scale_hi) && emp */;
float qcp_f16_scale_lo(void) /*@ Require emp Ensure f16_same_bits(__return,f16_scale_lo) && emp */;
float qcp_f16_scale_hi(void) /*@ Require emp Ensure f16_same_bits(__return,f16_scale_hi) && emp */ { return 5192296858534827628530496329220096.0f; }
float qcp_f16_scale_lo(void) /*@ Require emp Ensure f16_same_bits(__return,f16_scale_lo) && emp */ { return 0.00000000000000000000000000000000077037197775489434122239117703397092741524065928615527809597551822662353515625f; }
