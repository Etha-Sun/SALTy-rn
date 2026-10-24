#include "vector_ops.h"
vuint32m8_t __riscv_vmaxu_vx_u32m8(vuint32m8_t a,unsigned int b,size_t vl)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z) (x8:Z) (x9:Z) (x10:Z) (x11:Z) (x12:Z) (x13:Z) (x14:Z) (x15:Z) (x16:Z) (x17:Z) (x18:Z) (x19:Z) (x20:Z) (x21:Z) (x22:Z) (x23:Z) (x24:Z) (x25:Z) (x26:Z) (x27:Z) (x28:Z) (x29:Z) (x30:Z) (x31:Z)
 Require 0 <= vl && vl <= 32 && store(&(a.s0),unsigned int,x0) * store(&(a.s1),unsigned int,x1) * store(&(a.s2),unsigned int,x2) * store(&(a.s3),unsigned int,x3) * store(&(a.s4),unsigned int,x4) * store(&(a.s5),unsigned int,x5) * store(&(a.s6),unsigned int,x6) * store(&(a.s7),unsigned int,x7) * store(&(a.s8),unsigned int,x8) * store(&(a.s9),unsigned int,x9) * store(&(a.s10),unsigned int,x10) * store(&(a.s11),unsigned int,x11) * store(&(a.s12),unsigned int,x12) * store(&(a.s13),unsigned int,x13) * store(&(a.s14),unsigned int,x14) * store(&(a.s15),unsigned int,x15) * store(&(a.s16),unsigned int,x16) * store(&(a.s17),unsigned int,x17) * store(&(a.s18),unsigned int,x18) * store(&(a.s19),unsigned int,x19) * store(&(a.s20),unsigned int,x20) * store(&(a.s21),unsigned int,x21) * store(&(a.s22),unsigned int,x22) * store(&(a.s23),unsigned int,x23) * store(&(a.s24),unsigned int,x24) * store(&(a.s25),unsigned int,x25) * store(&(a.s26),unsigned int,x26) * store(&(a.s27),unsigned int,x27) * store(&(a.s28),unsigned int,x28) * store(&(a.s29),unsigned int,x29) * store(&(a.s30),unsigned int,x30) * store(&(a.s31),unsigned int,x31)
 Ensure store(&(__return.s0),unsigned int,f16_active___riscv_vmaxu_vx_u32m8(0,vl,x0,b)) * store(&(__return.s1),unsigned int,f16_active___riscv_vmaxu_vx_u32m8(1,vl,x1,b)) * store(&(__return.s2),unsigned int,f16_active___riscv_vmaxu_vx_u32m8(2,vl,x2,b)) * store(&(__return.s3),unsigned int,f16_active___riscv_vmaxu_vx_u32m8(3,vl,x3,b)) * store(&(__return.s4),unsigned int,f16_active___riscv_vmaxu_vx_u32m8(4,vl,x4,b)) * store(&(__return.s5),unsigned int,f16_active___riscv_vmaxu_vx_u32m8(5,vl,x5,b)) * store(&(__return.s6),unsigned int,f16_active___riscv_vmaxu_vx_u32m8(6,vl,x6,b)) * store(&(__return.s7),unsigned int,f16_active___riscv_vmaxu_vx_u32m8(7,vl,x7,b)) * store(&(__return.s8),unsigned int,f16_active___riscv_vmaxu_vx_u32m8(8,vl,x8,b)) * store(&(__return.s9),unsigned int,f16_active___riscv_vmaxu_vx_u32m8(9,vl,x9,b)) * store(&(__return.s10),unsigned int,f16_active___riscv_vmaxu_vx_u32m8(10,vl,x10,b)) * store(&(__return.s11),unsigned int,f16_active___riscv_vmaxu_vx_u32m8(11,vl,x11,b)) * store(&(__return.s12),unsigned int,f16_active___riscv_vmaxu_vx_u32m8(12,vl,x12,b)) * store(&(__return.s13),unsigned int,f16_active___riscv_vmaxu_vx_u32m8(13,vl,x13,b)) * store(&(__return.s14),unsigned int,f16_active___riscv_vmaxu_vx_u32m8(14,vl,x14,b)) * store(&(__return.s15),unsigned int,f16_active___riscv_vmaxu_vx_u32m8(15,vl,x15,b)) * store(&(__return.s16),unsigned int,f16_active___riscv_vmaxu_vx_u32m8(16,vl,x16,b)) * store(&(__return.s17),unsigned int,f16_active___riscv_vmaxu_vx_u32m8(17,vl,x17,b)) * store(&(__return.s18),unsigned int,f16_active___riscv_vmaxu_vx_u32m8(18,vl,x18,b)) * store(&(__return.s19),unsigned int,f16_active___riscv_vmaxu_vx_u32m8(19,vl,x19,b)) * store(&(__return.s20),unsigned int,f16_active___riscv_vmaxu_vx_u32m8(20,vl,x20,b)) * store(&(__return.s21),unsigned int,f16_active___riscv_vmaxu_vx_u32m8(21,vl,x21,b)) * store(&(__return.s22),unsigned int,f16_active___riscv_vmaxu_vx_u32m8(22,vl,x22,b)) * store(&(__return.s23),unsigned int,f16_active___riscv_vmaxu_vx_u32m8(23,vl,x23,b)) * store(&(__return.s24),unsigned int,f16_active___riscv_vmaxu_vx_u32m8(24,vl,x24,b)) * store(&(__return.s25),unsigned int,f16_active___riscv_vmaxu_vx_u32m8(25,vl,x25,b)) * store(&(__return.s26),unsigned int,f16_active___riscv_vmaxu_vx_u32m8(26,vl,x26,b)) * store(&(__return.s27),unsigned int,f16_active___riscv_vmaxu_vx_u32m8(27,vl,x27,b)) * store(&(__return.s28),unsigned int,f16_active___riscv_vmaxu_vx_u32m8(28,vl,x28,b)) * store(&(__return.s29),unsigned int,f16_active___riscv_vmaxu_vx_u32m8(29,vl,x29,b)) * store(&(__return.s30),unsigned int,f16_active___riscv_vmaxu_vx_u32m8(30,vl,x30,b)) * store(&(__return.s31),unsigned int,f16_active___riscv_vmaxu_vx_u32m8(31,vl,x31,b)) */
{
 vuint32m8_t r;
 r.s0=qcp_f16_active___riscv_vmaxu_vx_u32m8(a.s0,b,0,vl);
 r.s1=qcp_f16_active___riscv_vmaxu_vx_u32m8(a.s1,b,1,vl);
 r.s2=qcp_f16_active___riscv_vmaxu_vx_u32m8(a.s2,b,2,vl);
 r.s3=qcp_f16_active___riscv_vmaxu_vx_u32m8(a.s3,b,3,vl);
 r.s4=qcp_f16_active___riscv_vmaxu_vx_u32m8(a.s4,b,4,vl);
 r.s5=qcp_f16_active___riscv_vmaxu_vx_u32m8(a.s5,b,5,vl);
 r.s6=qcp_f16_active___riscv_vmaxu_vx_u32m8(a.s6,b,6,vl);
 r.s7=qcp_f16_active___riscv_vmaxu_vx_u32m8(a.s7,b,7,vl);
 r.s8=qcp_f16_active___riscv_vmaxu_vx_u32m8(a.s8,b,8,vl);
 r.s9=qcp_f16_active___riscv_vmaxu_vx_u32m8(a.s9,b,9,vl);
 r.s10=qcp_f16_active___riscv_vmaxu_vx_u32m8(a.s10,b,10,vl);
 r.s11=qcp_f16_active___riscv_vmaxu_vx_u32m8(a.s11,b,11,vl);
 r.s12=qcp_f16_active___riscv_vmaxu_vx_u32m8(a.s12,b,12,vl);
 r.s13=qcp_f16_active___riscv_vmaxu_vx_u32m8(a.s13,b,13,vl);
 r.s14=qcp_f16_active___riscv_vmaxu_vx_u32m8(a.s14,b,14,vl);
 r.s15=qcp_f16_active___riscv_vmaxu_vx_u32m8(a.s15,b,15,vl);
 r.s16=qcp_f16_active___riscv_vmaxu_vx_u32m8(a.s16,b,16,vl);
 r.s17=qcp_f16_active___riscv_vmaxu_vx_u32m8(a.s17,b,17,vl);
 r.s18=qcp_f16_active___riscv_vmaxu_vx_u32m8(a.s18,b,18,vl);
 r.s19=qcp_f16_active___riscv_vmaxu_vx_u32m8(a.s19,b,19,vl);
 r.s20=qcp_f16_active___riscv_vmaxu_vx_u32m8(a.s20,b,20,vl);
 r.s21=qcp_f16_active___riscv_vmaxu_vx_u32m8(a.s21,b,21,vl);
 r.s22=qcp_f16_active___riscv_vmaxu_vx_u32m8(a.s22,b,22,vl);
 r.s23=qcp_f16_active___riscv_vmaxu_vx_u32m8(a.s23,b,23,vl);
 r.s24=qcp_f16_active___riscv_vmaxu_vx_u32m8(a.s24,b,24,vl);
 r.s25=qcp_f16_active___riscv_vmaxu_vx_u32m8(a.s25,b,25,vl);
 r.s26=qcp_f16_active___riscv_vmaxu_vx_u32m8(a.s26,b,26,vl);
 r.s27=qcp_f16_active___riscv_vmaxu_vx_u32m8(a.s27,b,27,vl);
 r.s28=qcp_f16_active___riscv_vmaxu_vx_u32m8(a.s28,b,28,vl);
 r.s29=qcp_f16_active___riscv_vmaxu_vx_u32m8(a.s29,b,29,vl);
 r.s30=qcp_f16_active___riscv_vmaxu_vx_u32m8(a.s30,b,30,vl);
 r.s31=qcp_f16_active___riscv_vmaxu_vx_u32m8(a.s31,b,31,vl);
 return r;
}
