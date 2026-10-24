#include "load_primitives.h"
int8_t rdsum_read_lane(const int8_t *p,size_t i,size_t vl)
/*@ With (M:RDMap)
 Require 0<p && 0<=i && i<32 && 0<=vl && vl<=32 && p+vl<=(18446744073709551615+1) && rd_window(M,p,vl) && rd_mem(M)
 Ensure __return==rd_read_lane(M,p,i,vl) && -128<=__return && __return<=127 && rd_mem(M) */
{
 if(i<vl)return rdsum_read_byte(p+i) /*@ where M=M */;
 return 0;
}
