/*@ Extern Coq (sqrt_model : fp32 -> fp32) (same_bits : fp32 -> fp32 -> Prop) */
float f32_sqrt(float x)
/*@ Require emp Ensure same_bits(__return,sqrt_model(x)) && emp */
{ return __builtin_sqrtf(x); }
