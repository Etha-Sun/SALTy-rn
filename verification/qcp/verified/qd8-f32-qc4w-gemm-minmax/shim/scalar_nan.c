#include "../contracts/model.h"
/*@ Import Coq Require Import QC4W.ApiModel */
/*@ Extern Coq (qc4_nan_flag:fp32 -> Z) */
float qcp_identity(float x) /*@ Require emp Ensure qc4_bit_same(__return,x) && emp */ {return x;}
int qcp_isnan(float x) /*@ Require emp Ensure __return==qc4_nan_flag(x) && emp */ {
 float y=qcp_identity(x);if(x!=y)return 1;return 0;
}
