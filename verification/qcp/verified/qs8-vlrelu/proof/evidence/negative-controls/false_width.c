#include "/srv/home/yuechunsun/tools/qcp-simple-kernels/verification/qcp/candidates/qs8-vlrelu/shim/scalar.h"
int false_width(void)
/*@ Require emp Ensure __return==4 && emp */
{return sizeof(size_t);}
