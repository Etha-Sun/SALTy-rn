#include "load_primitives.h"
int8x8_t vld1_s8(const int8_t *p)
/*@ With (M:RDMap) Require 0<p && p+8<=(18446744073709551615+1) && rd_window(M,p,8) && rd_mem(M) Ensure rd_mem(M) * store(&(__return.s0),char,rd_read_lane(M,p,0,8)) * store(&(__return.s1),char,rd_read_lane(M,p,1,8)) * store(&(__return.s2),char,rd_read_lane(M,p,2,8)) * store(&(__return.s3),char,rd_read_lane(M,p,3,8)) * store(&(__return.s4),char,rd_read_lane(M,p,4,8)) * store(&(__return.s5),char,rd_read_lane(M,p,5,8)) * store(&(__return.s6),char,rd_read_lane(M,p,6,8)) * store(&(__return.s7),char,rd_read_lane(M,p,7,8)) */
{
int8x8_t r;
r.s0=rdsum_read_lane(p,0,8) /*@ where M=M */;
r.s1=rdsum_read_lane(p,1,8) /*@ where M=M */;
r.s2=rdsum_read_lane(p,2,8) /*@ where M=M */;
r.s3=rdsum_read_lane(p,3,8) /*@ where M=M */;
r.s4=rdsum_read_lane(p,4,8) /*@ where M=M */;
r.s5=rdsum_read_lane(p,5,8) /*@ where M=M */;
r.s6=rdsum_read_lane(p,6,8) /*@ where M=M */;
r.s7=rdsum_read_lane(p,7,8) /*@ where M=M */;
return r;
}
