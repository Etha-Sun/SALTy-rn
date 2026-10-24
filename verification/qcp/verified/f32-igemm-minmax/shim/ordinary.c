#include "../contracts/model.h"
void qcp_assert(int condition) /*@ Require condition!=0 && emp Ensure emp */ { }
float qcp_identity(float x) /*@ Require emp Ensure bit_same(__return,x) && emp */ { return x; }
int qcp_isnan(float x) /*@ Require emp Ensure __return==rvv_nanth(x) && emp */ {
 float y=qcp_identity(x);
 if(x!=y) return 1;
 return 0;
}
