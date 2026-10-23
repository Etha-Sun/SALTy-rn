#include "../../../verified/f32-vlrelu/shim/bits.h"
/*@ Import Coq Require Import GemmSpec.FmaModel GemmSpec.IntrinsicModel */
/*@ Extern Coq (bit_same : fp32 -> fp32 -> Prop)
    (fp32_min_number : fp32 -> fp32 -> fp32)
    (fp32_max_number : fp32 -> fp32 -> fp32)
    (fp32_neon_min : fp32 -> fp32 -> fp32)
    (fp32_neon_max : fp32 -> fp32 -> fp32) */
float qcp_minmax_identity(float a)
/*@ Require emp Ensure bit_same(__return,a) && emp */
{ return a; }
float qcp_min_number(float a,float b)
/*@ Require emp Ensure bit_same(__return,fp32_min_number(a,b)) && emp */
{
 float aa=qcp_minmax_identity(a);
 float bb=qcp_minmax_identity(b);
 if(a!=aa){if(b!=bb)return qcp_float_from_bits(2143289344U);return b;}
 if(b!=bb)return a;
 if(a==0.0f){if(b==0.0f)return -((-a)+(-b));}
 if(a<b)return a;
 return b;
}
float qcp_max_number(float a,float b)
/*@ Require emp Ensure bit_same(__return,fp32_max_number(a,b)) && emp */
{
 float aa=qcp_minmax_identity(a);
 float bb=qcp_minmax_identity(b);
 if(a!=aa){if(b!=bb)return qcp_float_from_bits(2143289344U);return b;}
 if(b!=bb)return a;
 if(a==0.0f){if(b==0.0f)return a+b;}
 if(a>b)return a;
 return b;
}
float qcp_neon_min(float a,float b)
/*@ Require emp Ensure bit_same(__return,fp32_neon_min(a,b)) && emp */
{
 float aa=qcp_minmax_identity(a);
 float bb=qcp_minmax_identity(b);
 if(a!=aa)return qcp_float_from_bits(2143289344U);
 if(b!=bb)return qcp_float_from_bits(2143289344U);
 return qcp_min_number(a,b);
}
float qcp_neon_max(float a,float b)
/*@ Require emp Ensure bit_same(__return,fp32_neon_max(a,b)) && emp */
{
 float aa=qcp_minmax_identity(a);
 float bb=qcp_minmax_identity(b);
 if(a!=aa)return qcp_float_from_bits(2143289344U);
 if(b!=bb)return qcp_float_from_bits(2143289344U);
 return qcp_max_number(a,b);
}
