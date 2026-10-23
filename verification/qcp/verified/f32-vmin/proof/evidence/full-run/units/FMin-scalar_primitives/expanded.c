/* Public C implementations of separate Arm/RVV reference operations.
 * IEEE binary32, DN=0/FZ=0/AH=0 for Arm; RVV canonical NaNs, RNE.
 * Floating exception flags/traps remain outside the observation. */
/*@ Import Coq Require Import FMin.Bits */
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
/*@ Import Coq Require Import FMin.Model */
/*@ Extern Coq
 (mm_abs_bits : Z -> Z) (mm_nan_bits : Z -> Z)
 (mm_snan_bits : Z -> Z) (mm_order_key : Z -> Z)
 (mm_ordered_bits : Z -> Z -> Z)
 (mm_arm_bits : Z -> Z -> Z) (mm_rvv_bits : Z -> Z -> Z)
 (mm_arm : fp32 -> fp32 -> fp32) (mm_rvv : fp32 -> fp32 -> fp32)
 (mm_canonical_nan : fp32) (mm_rvv_add : fp32 -> fp32 -> fp32)
 (mm_rvv_ne : fp32 -> fp32 -> Z) */
unsigned int qcp_fmin_abs_bits(unsigned int u)
/*@ Require emp Ensure __return == mm_abs_bits(u) && emp */
{ return u & 2147483647U; }
int qcp_fmin_nan_bits(unsigned int u)
/*@ Require emp Ensure __return == mm_nan_bits(u) && emp */
{ if (qcp_fmin_abs_bits(u) > 2139095040U) return 1; return 0; }
int qcp_fmin_snan_bits(unsigned int u)
/*@ Require emp Ensure __return == mm_snan_bits(u) && emp */
{
 if (qcp_fmin_nan_bits(u) == 1) {
  if ((u & 4194304U) == 0) return 1;
 }
 return 0;
}
unsigned int qcp_fmin_order_key(unsigned int u)
/*@ Require emp Ensure __return == mm_order_key(u) && emp */
{
 if ((u & 2147483648U) == 0) return u ^ 2147483648U;
 return u ^ 4294967295U;
}
unsigned int qcp_fmin_ordered_bits(unsigned int a,unsigned int b)
/*@ Require emp Ensure __return == mm_ordered_bits(a,b) && emp */
{
 if (qcp_fmin_abs_bits(a) == 0 && qcp_fmin_abs_bits(b) == 0) return a | b;
 unsigned int ka=qcp_fmin_order_key(a),kb=qcp_fmin_order_key(b);
 if (ka < kb) return a;
 return b;
}
unsigned int qcp_fmin_arm_bits(unsigned int a,unsigned int b)
/*@ Require emp Ensure __return == mm_arm_bits(a,b) && emp */
{
 if (qcp_fmin_snan_bits(a) == 1) return a | 4194304U;
 if (qcp_fmin_snan_bits(b) == 1) return b | 4194304U;
 if (qcp_fmin_nan_bits(a) == 1) return a;
 if (qcp_fmin_nan_bits(b) == 1) return b;
 return qcp_fmin_ordered_bits(a,b);
}
unsigned int qcp_fmin_rvv_bits(unsigned int a,unsigned int b)
/*@ Require emp Ensure __return == mm_rvv_bits(a,b) && emp */
{
 if (qcp_fmin_nan_bits(a) == 1) {
  if (qcp_fmin_nan_bits(b) == 1) return 2143289344U;
  return b;
 }
 if (qcp_fmin_nan_bits(b) == 1) return a;
 return qcp_fmin_ordered_bits(a,b);
}
float qcp_fmin_arm(float a,float b)
/*@ Require emp Ensure same_bits(__return,mm_arm(a,b)) && emp */
{
 unsigned int ua=qcp_float_bits(a),ub=qcp_float_bits(b);
 unsigned int result=qcp_fmin_arm_bits(ua,ub);
 return qcp_float_from_bits(result);
}
float qcp_fmin_rvv(float a,float b)
/*@ Require emp Ensure same_bits(__return,mm_rvv(a,b)) && emp */
{
 unsigned int ua=qcp_float_bits(a),ub=qcp_float_bits(b);
 unsigned int result=qcp_fmin_rvv_bits(ua,ub);
 return qcp_float_from_bits(result);
}
float qcp_fmin_rvv_add(float a,float b)
/*@ Require emp Ensure same_bits(__return,mm_rvv_add(a,b)) && emp */
{
 unsigned int ua=qcp_float_bits(a),ub=qcp_float_bits(b);
 if (qcp_fmin_nan_bits(ua) == 1 || qcp_fmin_nan_bits(ub) == 1)
  return qcp_float_from_bits(2143289344U);
 float result=a+b;
 unsigned int bits=qcp_float_bits(result);
 if (qcp_fmin_nan_bits(bits) == 1) return qcp_float_from_bits(2143289344U);
 return result;
}
int qcp_fmin_rvv_ne(float a,float b)
/*@ Require emp Ensure __return == mm_rvv_ne(a,b) && emp */
{
 unsigned int ua=qcp_float_bits(a),ub=qcp_float_bits(b);
 if (qcp_fmin_nan_bits(ua) == 1 || qcp_fmin_nan_bits(ub) == 1) return 1;
 if (qcp_fmin_abs_bits(ua) == 0 && qcp_fmin_abs_bits(ub) == 0) return 0;
 if (ua == ub) return 0;
 return 1;
}
