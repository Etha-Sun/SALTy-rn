#include "control_model.h"
int rdsum_min252(size_t r)
/*@ Require 0<=r && r<=18446744073709551615 && emp Ensure __return==rd_min252(r) && 0<=__return && __return<=252 && emp */
{ if(r<252)return (int)r;return 252; }
size_t rdsum_ceil252(size_t r)
/*@ Require 0<=r && r<=18446744073709551615 && emp Ensure __return==rd_ceil252(r) && 0<=__return && __return<=r && emp */
{ size_t q=r/252;if(r%252!=0)q=q+1;return q; }
