#include "load_primitives.h"
vint8m2_t __riscv_vle8_v_i8m2(const int8_t *p,size_t vl)
/*@ With (M:RDMap) Require 0<p && 0<=vl && vl<=32 && p+vl<=(18446744073709551615+1) && rd_window(M,p,vl) && rd_mem(M) Ensure rd_mem(M) * store(&(__return.s0),char,rd_read_lane(M,p,0,vl)) * store(&(__return.s1),char,rd_read_lane(M,p,1,vl)) * store(&(__return.s2),char,rd_read_lane(M,p,2,vl)) * store(&(__return.s3),char,rd_read_lane(M,p,3,vl)) * store(&(__return.s4),char,rd_read_lane(M,p,4,vl)) * store(&(__return.s5),char,rd_read_lane(M,p,5,vl)) * store(&(__return.s6),char,rd_read_lane(M,p,6,vl)) * store(&(__return.s7),char,rd_read_lane(M,p,7,vl)) * store(&(__return.s8),char,rd_read_lane(M,p,8,vl)) * store(&(__return.s9),char,rd_read_lane(M,p,9,vl)) * store(&(__return.s10),char,rd_read_lane(M,p,10,vl)) * store(&(__return.s11),char,rd_read_lane(M,p,11,vl)) * store(&(__return.s12),char,rd_read_lane(M,p,12,vl)) * store(&(__return.s13),char,rd_read_lane(M,p,13,vl)) * store(&(__return.s14),char,rd_read_lane(M,p,14,vl)) * store(&(__return.s15),char,rd_read_lane(M,p,15,vl)) * store(&(__return.s16),char,rd_read_lane(M,p,16,vl)) * store(&(__return.s17),char,rd_read_lane(M,p,17,vl)) * store(&(__return.s18),char,rd_read_lane(M,p,18,vl)) * store(&(__return.s19),char,rd_read_lane(M,p,19,vl)) * store(&(__return.s20),char,rd_read_lane(M,p,20,vl)) * store(&(__return.s21),char,rd_read_lane(M,p,21,vl)) * store(&(__return.s22),char,rd_read_lane(M,p,22,vl)) * store(&(__return.s23),char,rd_read_lane(M,p,23,vl)) * store(&(__return.s24),char,rd_read_lane(M,p,24,vl)) * store(&(__return.s25),char,rd_read_lane(M,p,25,vl)) * store(&(__return.s26),char,rd_read_lane(M,p,26,vl)) * store(&(__return.s27),char,rd_read_lane(M,p,27,vl)) * store(&(__return.s28),char,rd_read_lane(M,p,28,vl)) * store(&(__return.s29),char,rd_read_lane(M,p,29,vl)) * store(&(__return.s30),char,rd_read_lane(M,p,30,vl)) * store(&(__return.s31),char,rd_read_lane(M,p,31,vl)) */
{
vint8m2_t r;
r.s0=rdsum_read_lane(p,0,vl) /*@ where M=M */;
r.s1=rdsum_read_lane(p,1,vl) /*@ where M=M */;
r.s2=rdsum_read_lane(p,2,vl) /*@ where M=M */;
r.s3=rdsum_read_lane(p,3,vl) /*@ where M=M */;
r.s4=rdsum_read_lane(p,4,vl) /*@ where M=M */;
r.s5=rdsum_read_lane(p,5,vl) /*@ where M=M */;
r.s6=rdsum_read_lane(p,6,vl) /*@ where M=M */;
r.s7=rdsum_read_lane(p,7,vl) /*@ where M=M */;
r.s8=rdsum_read_lane(p,8,vl) /*@ where M=M */;
r.s9=rdsum_read_lane(p,9,vl) /*@ where M=M */;
r.s10=rdsum_read_lane(p,10,vl) /*@ where M=M */;
r.s11=rdsum_read_lane(p,11,vl) /*@ where M=M */;
r.s12=rdsum_read_lane(p,12,vl) /*@ where M=M */;
r.s13=rdsum_read_lane(p,13,vl) /*@ where M=M */;
r.s14=rdsum_read_lane(p,14,vl) /*@ where M=M */;
r.s15=rdsum_read_lane(p,15,vl) /*@ where M=M */;
r.s16=rdsum_read_lane(p,16,vl) /*@ where M=M */;
r.s17=rdsum_read_lane(p,17,vl) /*@ where M=M */;
r.s18=rdsum_read_lane(p,18,vl) /*@ where M=M */;
r.s19=rdsum_read_lane(p,19,vl) /*@ where M=M */;
r.s20=rdsum_read_lane(p,20,vl) /*@ where M=M */;
r.s21=rdsum_read_lane(p,21,vl) /*@ where M=M */;
r.s22=rdsum_read_lane(p,22,vl) /*@ where M=M */;
r.s23=rdsum_read_lane(p,23,vl) /*@ where M=M */;
r.s24=rdsum_read_lane(p,24,vl) /*@ where M=M */;
r.s25=rdsum_read_lane(p,25,vl) /*@ where M=M */;
r.s26=rdsum_read_lane(p,26,vl) /*@ where M=M */;
r.s27=rdsum_read_lane(p,27,vl) /*@ where M=M */;
r.s28=rdsum_read_lane(p,28,vl) /*@ where M=M */;
r.s29=rdsum_read_lane(p,29,vl) /*@ where M=M */;
r.s30=rdsum_read_lane(p,30,vl) /*@ where M=M */;
r.s31=rdsum_read_lane(p,31,vl) /*@ where M=M */;
return r;
}
