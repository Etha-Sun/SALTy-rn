#include "vector_ops.h"
vfloat32m8_t __riscv_vreinterpret_v_u32m8_f32m8(vuint32m8_t a)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z) (x8:Z) (x9:Z) (x10:Z) (x11:Z) (x12:Z) (x13:Z) (x14:Z) (x15:Z) (x16:Z) (x17:Z) (x18:Z) (x19:Z) (x20:Z) (x21:Z) (x22:Z) (x23:Z) (x24:Z) (x25:Z) (x26:Z) (x27:Z) (x28:Z) (x29:Z) (x30:Z) (x31:Z)
 Require store(&(a.s0),unsigned int,x0) * store(&(a.s1),unsigned int,x1) * store(&(a.s2),unsigned int,x2) * store(&(a.s3),unsigned int,x3) * store(&(a.s4),unsigned int,x4) * store(&(a.s5),unsigned int,x5) * store(&(a.s6),unsigned int,x6) * store(&(a.s7),unsigned int,x7) * store(&(a.s8),unsigned int,x8) * store(&(a.s9),unsigned int,x9) * store(&(a.s10),unsigned int,x10) * store(&(a.s11),unsigned int,x11) * store(&(a.s12),unsigned int,x12) * store(&(a.s13),unsigned int,x13) * store(&(a.s14),unsigned int,x14) * store(&(a.s15),unsigned int,x15) * store(&(a.s16),unsigned int,x16) * store(&(a.s17),unsigned int,x17) * store(&(a.s18),unsigned int,x18) * store(&(a.s19),unsigned int,x19) * store(&(a.s20),unsigned int,x20) * store(&(a.s21),unsigned int,x21) * store(&(a.s22),unsigned int,x22) * store(&(a.s23),unsigned int,x23) * store(&(a.s24),unsigned int,x24) * store(&(a.s25),unsigned int,x25) * store(&(a.s26),unsigned int,x26) * store(&(a.s27),unsigned int,x27) * store(&(a.s28),unsigned int,x28) * store(&(a.s29),unsigned int,x29) * store(&(a.s30),unsigned int,x30) * store(&(a.s31),unsigned int,x31)
 Ensure store(&(__return.s0),float,fp32_of_bits(x0)) * store(&(__return.s1),float,fp32_of_bits(x1)) * store(&(__return.s2),float,fp32_of_bits(x2)) * store(&(__return.s3),float,fp32_of_bits(x3)) * store(&(__return.s4),float,fp32_of_bits(x4)) * store(&(__return.s5),float,fp32_of_bits(x5)) * store(&(__return.s6),float,fp32_of_bits(x6)) * store(&(__return.s7),float,fp32_of_bits(x7)) * store(&(__return.s8),float,fp32_of_bits(x8)) * store(&(__return.s9),float,fp32_of_bits(x9)) * store(&(__return.s10),float,fp32_of_bits(x10)) * store(&(__return.s11),float,fp32_of_bits(x11)) * store(&(__return.s12),float,fp32_of_bits(x12)) * store(&(__return.s13),float,fp32_of_bits(x13)) * store(&(__return.s14),float,fp32_of_bits(x14)) * store(&(__return.s15),float,fp32_of_bits(x15)) * store(&(__return.s16),float,fp32_of_bits(x16)) * store(&(__return.s17),float,fp32_of_bits(x17)) * store(&(__return.s18),float,fp32_of_bits(x18)) * store(&(__return.s19),float,fp32_of_bits(x19)) * store(&(__return.s20),float,fp32_of_bits(x20)) * store(&(__return.s21),float,fp32_of_bits(x21)) * store(&(__return.s22),float,fp32_of_bits(x22)) * store(&(__return.s23),float,fp32_of_bits(x23)) * store(&(__return.s24),float,fp32_of_bits(x24)) * store(&(__return.s25),float,fp32_of_bits(x25)) * store(&(__return.s26),float,fp32_of_bits(x26)) * store(&(__return.s27),float,fp32_of_bits(x27)) * store(&(__return.s28),float,fp32_of_bits(x28)) * store(&(__return.s29),float,fp32_of_bits(x29)) * store(&(__return.s30),float,fp32_of_bits(x30)) * store(&(__return.s31),float,fp32_of_bits(x31)) */
{
 vfloat32m8_t r;
 r.s0=qcp_float_from_bits(a.s0);
 r.s1=qcp_float_from_bits(a.s1);
 r.s2=qcp_float_from_bits(a.s2);
 r.s3=qcp_float_from_bits(a.s3);
 r.s4=qcp_float_from_bits(a.s4);
 r.s5=qcp_float_from_bits(a.s5);
 r.s6=qcp_float_from_bits(a.s6);
 r.s7=qcp_float_from_bits(a.s7);
 r.s8=qcp_float_from_bits(a.s8);
 r.s9=qcp_float_from_bits(a.s9);
 r.s10=qcp_float_from_bits(a.s10);
 r.s11=qcp_float_from_bits(a.s11);
 r.s12=qcp_float_from_bits(a.s12);
 r.s13=qcp_float_from_bits(a.s13);
 r.s14=qcp_float_from_bits(a.s14);
 r.s15=qcp_float_from_bits(a.s15);
 r.s16=qcp_float_from_bits(a.s16);
 r.s17=qcp_float_from_bits(a.s17);
 r.s18=qcp_float_from_bits(a.s18);
 r.s19=qcp_float_from_bits(a.s19);
 r.s20=qcp_float_from_bits(a.s20);
 r.s21=qcp_float_from_bits(a.s21);
 r.s22=qcp_float_from_bits(a.s22);
 r.s23=qcp_float_from_bits(a.s23);
 r.s24=qcp_float_from_bits(a.s24);
 r.s25=qcp_float_from_bits(a.s25);
 r.s26=qcp_float_from_bits(a.s26);
 r.s27=qcp_float_from_bits(a.s27);
 r.s28=qcp_float_from_bits(a.s28);
 r.s29=qcp_float_from_bits(a.s29);
 r.s30=qcp_float_from_bits(a.s30);
 r.s31=qcp_float_from_bits(a.s31);
 return r;
}
