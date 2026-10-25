#include "/srv/home/yuechunsun/tools/qcp-simple-kernels/verification/qcp/candidates/qs8-vmul-minmax-fp32/shim/intrinsic_model.h"
/*@ Import Coq Require Import Qs8Mul.ScalarCompareFacts */
/*@ Extern Coq (qm_ne:fp32 -> fp32 -> Z) */
int qm_scalar_nan_probe(float scale)
/*@ Require emp
 Ensure (__return==0 && qm_ne(scale,scale)==0) || (__return==1 && qm_ne(scale,scale)==1) */
{ if(scale!=scale)return 1;return 0; }
