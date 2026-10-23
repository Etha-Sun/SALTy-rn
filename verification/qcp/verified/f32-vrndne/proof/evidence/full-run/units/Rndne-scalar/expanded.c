/*@ Import Coq Require Import Rndne.Bits */
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
float qcp_rnd_abs(float x)
/*@ Require emp Ensure rndne_same_bits(__return,rndne_abs(x)) && emp */
{ unsigned int b=qcp_float_bits(x); return qcp_float_from_bits(b & 2147483647u); }
float qcp_rnd_sign(float a,float b)
/*@ Require emp Ensure rndne_same_bits(__return,rndne_sign(a,b)) && emp */
{ unsigned int ua=qcp_float_bits(a); unsigned int ub=qcp_float_bits(b); return qcp_float_from_bits((ua & 2147483647u) | (ub & 2147483648u)); }
float qcp_rnd_select(unsigned int m,float a,float b)
/*@ Require emp Ensure rndne_same_bits(__return,rndne_select(m,a,b)) && emp */
{ unsigned int ua=qcp_float_bits(a); unsigned int ub=qcp_float_bits(b); return qcp_float_from_bits((m & ua) | ((m ^ 4294967295u) & ub)); }
float qcp_rnd_quiet(float x)
/*@ Require emp Ensure rndne_same_bits(__return,rndne_quiet(x)) && emp */
{ unsigned int b=qcp_float_bits(x); return qcp_float_from_bits(b | 4194304u); }
unsigned int qcp_rnd_abs_bits(unsigned int u)
/*@ Require emp Ensure __return == rndne_abs_bits(u) && emp */
{ return u & 2147483647u; }
int qcp_rnd_nan_bits(unsigned int u)
/*@ Require emp Ensure __return == rndne_nan_bits(u) && emp */
{ if(qcp_rnd_abs_bits(u)>2139095040u) return 1; return 0; }
int qcp_rnd_snan_bits(unsigned int u)
/*@ Require emp Ensure __return == rndne_snan_bits(u) && emp */
{ if(qcp_rnd_nan_bits(u)==1) {if((u & 4194304u)==0) return 1;} return 0; }
unsigned int qcp_rnd_key(unsigned int u)
/*@ Require emp Ensure __return == rndne_key(u) && emp */
{ if((u & 2147483648u)==0) return u ^ 2147483648u; return u ^ 4294967295u; }
int qcp_rnd_gt_bits(unsigned int a,unsigned int b)
/*@ Require emp Ensure __return == rndne_gt_bits(a,b) && emp */
{ if(qcp_rnd_nan_bits(a)==1 || qcp_rnd_nan_bits(b)==1) return 0; if(qcp_rnd_abs_bits(a)==0 && qcp_rnd_abs_bits(b)==0) return 0; unsigned int ka=qcp_rnd_key(a),kb=qcp_rnd_key(b); if(kb<ka) return 1; return 0; }
int qcp_rnd_gt(float a,float b)
/*@ Require emp Ensure __return == rndne_gt(a,b) && emp */
{ unsigned int ua=qcp_float_bits(a),ub=qcp_float_bits(b); return qcp_rnd_gt_bits(ua,ub); }
unsigned int qcp_rnd_abs_lt_bits(unsigned int a,unsigned int b)
/*@ Require emp Ensure __return == rndne_abs_lt_bits(a,b) && emp */
{ if(qcp_rnd_nan_bits(a)==1 || qcp_rnd_nan_bits(b)==1) return 0u; if(qcp_rnd_abs_bits(a)<qcp_rnd_abs_bits(b)) return 4294967295u; return 0u; }
unsigned int qcp_rnd_abs_lt(float a,float b)
/*@ Require emp Ensure __return == rndne_abs_lt(a,b) && emp */
{ unsigned int ua=qcp_float_bits(a),ub=qcp_float_bits(b); return qcp_rnd_abs_lt_bits(ua,ub); }
int qcp_rnd_ne_bits(unsigned int a,unsigned int b)
/*@ Require emp Ensure __return == rndne_ne_bits(a,b) && emp */
{ if(qcp_rnd_nan_bits(a)==1 || qcp_rnd_nan_bits(b)==1) return 1; if(qcp_rnd_abs_bits(a)==0 && qcp_rnd_abs_bits(b)==0) return 0; if(a==b) return 0; return 1; }
int qcp_rnd_ne(float a,float b)
/*@ Require emp Ensure __return == rndne_ne(a,b) && emp */
{ unsigned int ua=qcp_float_bits(a),ub=qcp_float_bits(b); return qcp_rnd_ne_bits(ua,ub); }
unsigned int qcp_rnd_arm_nan(float a,float b)
/*@ Require emp Ensure __return == rndne_arm_nan(a,b) && emp */
{ unsigned int ua=qcp_float_bits(a),ub=qcp_float_bits(b); if(qcp_rnd_snan_bits(ua)==1) return ua | 4194304u; if(qcp_rnd_snan_bits(ub)==1) return ub | 4194304u; if(qcp_rnd_nan_bits(ua)==1) return ua; return ub; }
float qcp_rnd_arm_add(float a,float b)
/*@ Require emp Ensure rndne_same_bits(__return,rndne_arm_add(a,b)) && emp */
{ unsigned int ua=qcp_float_bits(a),ub=qcp_float_bits(b); if(qcp_rnd_nan_bits(ua)==1 || qcp_rnd_nan_bits(ub)==1) return qcp_float_from_bits(qcp_rnd_arm_nan(a,b)); float r=a+b; unsigned int ur=qcp_float_bits(r); if(qcp_rnd_nan_bits(ur)==1) return qcp_float_from_bits(2143289344u); return r; }
float qcp_rnd_arm_sub(float a,float b)
/*@ Require emp Ensure rndne_same_bits(__return,rndne_arm_sub(a,b)) && emp */
{ unsigned int ua=qcp_float_bits(a),ub=qcp_float_bits(b); if(qcp_rnd_nan_bits(ua)==1 || qcp_rnd_nan_bits(ub)==1) return qcp_float_from_bits(qcp_rnd_arm_nan(a,b)); float r=a-b; unsigned int ur=qcp_float_bits(r); if(qcp_rnd_nan_bits(ur)==1) return qcp_float_from_bits(2143289344u); return r; }
float qcp_rnd_rvv_add(float a,float b)
/*@ Require emp Ensure rndne_same_bits(__return,rndne_rvv_add(a,b)) && emp */
{ float r=a+b; unsigned int ur=qcp_float_bits(r); if(qcp_rnd_nan_bits(ur)==1) return qcp_float_from_bits(2143289344u); return r; }
float qcp_rnd_rvv_sub(float a,float b)
/*@ Require emp Ensure rndne_same_bits(__return,rndne_rvv_sub(a,b)) && emp */
{ float r=a-b; unsigned int ur=qcp_float_bits(r); if(qcp_rnd_nan_bits(ur)==1) return qcp_float_from_bits(2143289344u); return r; }
