#include "/srv/home/yuechunsun/tools/qcp-simple-kernels/verification/qcp/candidates/qs8-vadd-minmax/shim/scalar.h"
/*@ Extern Coq (qa_negword:Z -> Z) (qa_ctrl:Z -> Z) */
int32_t probe_negword(int32_t x)
/*@ Require (-2147483647-1)<=x && x<=2147483647 && emp Ensure __return==qa_negword(x) && emp */
{const int64_t wide=x;const int64_t neg=-wide;return(int32_t)neg;}
int32_t probe_ctrl(int32_t x)
/*@ Require (-2147483647-1)<=x && x<=2147483647 && emp Ensure __return==qa_ctrl(x) && emp */
{const int64_t wide=x;const int64_t neg=-wide;return(int8_t)neg;}
