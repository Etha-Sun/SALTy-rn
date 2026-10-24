#include "scalar.h"
float qcp_f16_abs(float x)
/*@ Require emp Ensure f16_same_bits(__return,f16_abs(x)) && emp */
{ unsigned int b=qcp_float_bits(x); return qcp_float_from_bits(b & 2147483647u); }
float qcp_f16_sign(float a,float b)
/*@ Require emp Ensure f16_same_bits(__return,f16_sign(a,b)) && emp */
{ unsigned int ua=qcp_float_bits(a); unsigned int ub=qcp_float_bits(b); return qcp_float_from_bits((ua & 2147483647u) | (ub & 2147483648u)); }
float qcp_f16_select(unsigned int m,float a,float b)
/*@ Require emp Ensure f16_same_bits(__return,f16_select(m,a,b)) && emp */
{ unsigned int ua=qcp_float_bits(a); unsigned int ub=qcp_float_bits(b); return qcp_float_from_bits((m & ua) | ((m ^ 4294967295u) & ub)); }
float qcp_f16_quiet(float x)
/*@ Require emp Ensure f16_same_bits(__return,f16_quiet(x)) && emp */
{ unsigned int b=qcp_float_bits(x); return qcp_float_from_bits(b | 4194304u); }
unsigned int qcp_f16_abs_bits(unsigned int u)
/*@ Require emp Ensure __return == f16_abs_bits(u) && emp */
{ return u & 2147483647u; }
int qcp_f16_nan_bits(unsigned int u)
/*@ Require emp Ensure __return == f16_nan_bits(u) && emp */
{ if(qcp_f16_abs_bits(u)>2139095040u) return 1; return 0; }
int qcp_f16_snan_bits(unsigned int u)
/*@ Require emp Ensure __return == f16_snan_bits(u) && emp */
{ if(qcp_f16_nan_bits(u)==1) {if((u & 4194304u)==0) return 1;} return 0; }
unsigned int qcp_f16_key(unsigned int u)
/*@ Require emp Ensure __return == f16_key(u) && emp */
{ if((u & 2147483648u)==0) return u ^ 2147483648u; return u ^ 4294967295u; }
int qcp_f16_gt_bits(unsigned int a,unsigned int b)
/*@ Require emp Ensure __return == f16_gt_bits(a,b) && emp */
{ if(qcp_f16_nan_bits(a)==1 || qcp_f16_nan_bits(b)==1) return 0; if(qcp_f16_abs_bits(a)==0 && qcp_f16_abs_bits(b)==0) return 0; unsigned int ka=qcp_f16_key(a),kb=qcp_f16_key(b); if(kb<ka) return 1; return 0; }
int qcp_f16_gt(float a,float b)
/*@ Require emp Ensure __return == f16_gt(a,b) && emp */
{ unsigned int ua=qcp_float_bits(a),ub=qcp_float_bits(b); return qcp_f16_gt_bits(ua,ub); }
unsigned int qcp_f16_abs_lt_bits(unsigned int a,unsigned int b)
/*@ Require emp Ensure __return == f16_abs_lt_bits(a,b) && emp */
{ if(qcp_f16_nan_bits(a)==1 || qcp_f16_nan_bits(b)==1) return 0u; if(qcp_f16_abs_bits(a)<qcp_f16_abs_bits(b)) return 4294967295u; return 0u; }
unsigned int qcp_f16_abs_lt(float a,float b)
/*@ Require emp Ensure __return == f16_abs_lt(a,b) && emp */
{ unsigned int ua=qcp_float_bits(a),ub=qcp_float_bits(b); return qcp_f16_abs_lt_bits(ua,ub); }
int qcp_f16_ne_bits(unsigned int a,unsigned int b)
/*@ Require emp Ensure __return == f16_ne_bits(a,b) && emp */
{ if(qcp_f16_nan_bits(a)==1 || qcp_f16_nan_bits(b)==1) return 1; if(qcp_f16_abs_bits(a)==0 && qcp_f16_abs_bits(b)==0) return 0; if(a==b) return 0; return 1; }
int qcp_f16_ne(float a,float b)
/*@ Require emp Ensure __return == f16_ne(a,b) && emp */
{ unsigned int ua=qcp_float_bits(a),ub=qcp_float_bits(b); return qcp_f16_ne_bits(ua,ub); }
unsigned int qcp_f16_arm_nan(float a,float b)
/*@ Require emp Ensure __return == f16_arm_nan(a,b) && emp */
{ unsigned int ua=qcp_float_bits(a),ub=qcp_float_bits(b); if(qcp_f16_snan_bits(ua)==1) return ua | 4194304u; if(qcp_f16_snan_bits(ub)==1) return ub | 4194304u; if(qcp_f16_nan_bits(ua)==1) return ua; return ub; }
float qcp_f16_arm_add(float a,float b)
/*@ Require emp Ensure f16_same_bits(__return,f16_arm_add(a,b)) && emp */
{ unsigned int ua=qcp_float_bits(a),ub=qcp_float_bits(b); if(qcp_f16_nan_bits(ua)==1 || qcp_f16_nan_bits(ub)==1) return qcp_float_from_bits(qcp_f16_arm_nan(a,b)); float r=a+b; unsigned int ur=qcp_float_bits(r); if(qcp_f16_nan_bits(ur)==1) return qcp_float_from_bits(2143289344u); return r; }
float qcp_f16_arm_sub(float a,float b)
/*@ Require emp Ensure f16_same_bits(__return,f16_arm_sub(a,b)) && emp */
{ unsigned int ua=qcp_float_bits(a),ub=qcp_float_bits(b); if(qcp_f16_nan_bits(ua)==1 || qcp_f16_nan_bits(ub)==1) return qcp_float_from_bits(qcp_f16_arm_nan(a,b)); float r=a-b; unsigned int ur=qcp_float_bits(r); if(qcp_f16_nan_bits(ur)==1) return qcp_float_from_bits(2143289344u); return r; }
float qcp_f16_rvv_add(float a,float b)
/*@ Require emp Ensure f16_same_bits(__return,f16_rvv_add(a,b)) && emp */
{ float r=a+b; unsigned int ur=qcp_float_bits(r); if(qcp_f16_nan_bits(ur)==1) return qcp_float_from_bits(2143289344u); return r; }
float qcp_f16_rvv_sub(float a,float b)
/*@ Require emp Ensure f16_same_bits(__return,f16_rvv_sub(a,b)) && emp */
{ float r=a-b; unsigned int ur=qcp_float_bits(r); if(qcp_f16_nan_bits(ur)==1) return qcp_float_from_bits(2143289344u); return r; }
float qcp_f16_arm_mul(float a,float b)
/*@ Require emp Ensure f16_same_bits(__return,f16_arm_mul(a,b)) && emp */
{ unsigned int ua=qcp_float_bits(a),ub=qcp_float_bits(b); if(qcp_f16_nan_bits(ua)==1 || qcp_f16_nan_bits(ub)==1) return qcp_float_from_bits(qcp_f16_arm_nan(a,b)); float r=a*b; unsigned int ur=qcp_float_bits(r); if(qcp_f16_nan_bits(ur)==1) return qcp_float_from_bits(2143289344u); return r; }
float qcp_f16_rvv_mul(float a,float b)
/*@ Require emp Ensure f16_same_bits(__return,f16_rvv_mul(a,b)) && emp */
{ float r=a*b; unsigned int ur=qcp_float_bits(r); if(qcp_f16_nan_bits(ur)==1) return qcp_float_from_bits(2143289344u); return r; }
