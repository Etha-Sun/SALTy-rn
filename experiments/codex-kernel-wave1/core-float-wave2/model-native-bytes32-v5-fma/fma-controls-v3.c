#include <math.h>
/*@ assigns errno; ensures \eq_float(\result,(float)5.0); */
float fma_five_control(void) { return fmaf(1.0f,2.0f,3.0f); }
/*@ assigns errno; ensures \eq_float(\result,(float)(-1.0/70368744177664.0)); */
float fused_rounding_control(void) { return fmaf(0x1.000002p0f,0x1.fffffcp-1f,-1.0f); }
/*@ assigns errno; ensures \eq_float(\result,(float)0.0); */
float wrong_unfused_control(void) { return fmaf(0x1.000002p0f,0x1.fffffcp-1f,-1.0f); }
/*@ assigns \nothing; ensures \false; */
void impossible_fma_control(void) {}
