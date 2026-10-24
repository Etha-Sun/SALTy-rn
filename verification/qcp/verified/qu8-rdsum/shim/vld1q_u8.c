#include "load_primitives.h"
uint8x16_t vld1q_u8(const uint8_t *p)
/*@ With (M:RDMap) Require 0<p && p+16<=(18446744073709551615+1) && rd_window(M,p,16) && rd_mem(M) Ensure rd_mem(M) * store(&(__return.s0),unsigned char,rd_read_lane(M,p,0,16)) * store(&(__return.s1),unsigned char,rd_read_lane(M,p,1,16)) * store(&(__return.s2),unsigned char,rd_read_lane(M,p,2,16)) * store(&(__return.s3),unsigned char,rd_read_lane(M,p,3,16)) * store(&(__return.s4),unsigned char,rd_read_lane(M,p,4,16)) * store(&(__return.s5),unsigned char,rd_read_lane(M,p,5,16)) * store(&(__return.s6),unsigned char,rd_read_lane(M,p,6,16)) * store(&(__return.s7),unsigned char,rd_read_lane(M,p,7,16)) * store(&(__return.s8),unsigned char,rd_read_lane(M,p,8,16)) * store(&(__return.s9),unsigned char,rd_read_lane(M,p,9,16)) * store(&(__return.s10),unsigned char,rd_read_lane(M,p,10,16)) * store(&(__return.s11),unsigned char,rd_read_lane(M,p,11,16)) * store(&(__return.s12),unsigned char,rd_read_lane(M,p,12,16)) * store(&(__return.s13),unsigned char,rd_read_lane(M,p,13,16)) * store(&(__return.s14),unsigned char,rd_read_lane(M,p,14,16)) * store(&(__return.s15),unsigned char,rd_read_lane(M,p,15,16)) */
{
uint8x16_t r;
r.s0=rdsum_read_lane(p,0,16) /*@ where M=M */;
r.s1=rdsum_read_lane(p,1,16) /*@ where M=M */;
r.s2=rdsum_read_lane(p,2,16) /*@ where M=M */;
r.s3=rdsum_read_lane(p,3,16) /*@ where M=M */;
r.s4=rdsum_read_lane(p,4,16) /*@ where M=M */;
r.s5=rdsum_read_lane(p,5,16) /*@ where M=M */;
r.s6=rdsum_read_lane(p,6,16) /*@ where M=M */;
r.s7=rdsum_read_lane(p,7,16) /*@ where M=M */;
r.s8=rdsum_read_lane(p,8,16) /*@ where M=M */;
r.s9=rdsum_read_lane(p,9,16) /*@ where M=M */;
r.s10=rdsum_read_lane(p,10,16) /*@ where M=M */;
r.s11=rdsum_read_lane(p,11,16) /*@ where M=M */;
r.s12=rdsum_read_lane(p,12,16) /*@ where M=M */;
r.s13=rdsum_read_lane(p,13,16) /*@ where M=M */;
r.s14=rdsum_read_lane(p,14,16) /*@ where M=M */;
r.s15=rdsum_read_lane(p,15,16) /*@ where M=M */;
return r;
}
