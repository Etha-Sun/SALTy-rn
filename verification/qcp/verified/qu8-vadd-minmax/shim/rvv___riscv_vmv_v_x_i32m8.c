#include "rvv_arithmetic.h"
vint32m8_t __riscv_vmv_v_x_i32m8(int32_t b,size_t vl)
/*@ Require 0<=vl && vl<=32 && -2147483648<=b && b<=2147483647 && emp
 Ensure store(&(__return.s0),int,qu_active_mov(0,vl,b)) * store(&(__return.s1),int,qu_active_mov(1,vl,b)) * store(&(__return.s2),int,qu_active_mov(2,vl,b)) * store(&(__return.s3),int,qu_active_mov(3,vl,b)) * store(&(__return.s4),int,qu_active_mov(4,vl,b)) * store(&(__return.s5),int,qu_active_mov(5,vl,b)) * store(&(__return.s6),int,qu_active_mov(6,vl,b)) * store(&(__return.s7),int,qu_active_mov(7,vl,b)) * store(&(__return.s8),int,qu_active_mov(8,vl,b)) * store(&(__return.s9),int,qu_active_mov(9,vl,b)) * store(&(__return.s10),int,qu_active_mov(10,vl,b)) * store(&(__return.s11),int,qu_active_mov(11,vl,b)) * store(&(__return.s12),int,qu_active_mov(12,vl,b)) * store(&(__return.s13),int,qu_active_mov(13,vl,b)) * store(&(__return.s14),int,qu_active_mov(14,vl,b)) * store(&(__return.s15),int,qu_active_mov(15,vl,b)) * store(&(__return.s16),int,qu_active_mov(16,vl,b)) * store(&(__return.s17),int,qu_active_mov(17,vl,b)) * store(&(__return.s18),int,qu_active_mov(18,vl,b)) * store(&(__return.s19),int,qu_active_mov(19,vl,b)) * store(&(__return.s20),int,qu_active_mov(20,vl,b)) * store(&(__return.s21),int,qu_active_mov(21,vl,b)) * store(&(__return.s22),int,qu_active_mov(22,vl,b)) * store(&(__return.s23),int,qu_active_mov(23,vl,b)) * store(&(__return.s24),int,qu_active_mov(24,vl,b)) * store(&(__return.s25),int,qu_active_mov(25,vl,b)) * store(&(__return.s26),int,qu_active_mov(26,vl,b)) * store(&(__return.s27),int,qu_active_mov(27,vl,b)) * store(&(__return.s28),int,qu_active_mov(28,vl,b)) * store(&(__return.s29),int,qu_active_mov(29,vl,b)) * store(&(__return.s30),int,qu_active_mov(30,vl,b)) * store(&(__return.s31),int,qu_active_mov(31,vl,b)) */
{
 vint32m8_t r;
 r.s0=qcp_qu_active_mov(b,0,vl);
 r.s1=qcp_qu_active_mov(b,1,vl);
 r.s2=qcp_qu_active_mov(b,2,vl);
 r.s3=qcp_qu_active_mov(b,3,vl);
 r.s4=qcp_qu_active_mov(b,4,vl);
 r.s5=qcp_qu_active_mov(b,5,vl);
 r.s6=qcp_qu_active_mov(b,6,vl);
 r.s7=qcp_qu_active_mov(b,7,vl);
 r.s8=qcp_qu_active_mov(b,8,vl);
 r.s9=qcp_qu_active_mov(b,9,vl);
 r.s10=qcp_qu_active_mov(b,10,vl);
 r.s11=qcp_qu_active_mov(b,11,vl);
 r.s12=qcp_qu_active_mov(b,12,vl);
 r.s13=qcp_qu_active_mov(b,13,vl);
 r.s14=qcp_qu_active_mov(b,14,vl);
 r.s15=qcp_qu_active_mov(b,15,vl);
 r.s16=qcp_qu_active_mov(b,16,vl);
 r.s17=qcp_qu_active_mov(b,17,vl);
 r.s18=qcp_qu_active_mov(b,18,vl);
 r.s19=qcp_qu_active_mov(b,19,vl);
 r.s20=qcp_qu_active_mov(b,20,vl);
 r.s21=qcp_qu_active_mov(b,21,vl);
 r.s22=qcp_qu_active_mov(b,22,vl);
 r.s23=qcp_qu_active_mov(b,23,vl);
 r.s24=qcp_qu_active_mov(b,24,vl);
 r.s25=qcp_qu_active_mov(b,25,vl);
 r.s26=qcp_qu_active_mov(b,26,vl);
 r.s27=qcp_qu_active_mov(b,27,vl);
 r.s28=qcp_qu_active_mov(b,28,vl);
 r.s29=qcp_qu_active_mov(b,29,vl);
 r.s30=qcp_qu_active_mov(b,30,vl);
 r.s31=qcp_qu_active_mov(b,31,vl);
 return r;
}
