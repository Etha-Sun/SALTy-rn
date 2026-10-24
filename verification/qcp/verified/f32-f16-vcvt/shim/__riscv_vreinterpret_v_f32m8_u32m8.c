#include "vector_ops.h"
vuint32m8_t __riscv_vreinterpret_v_f32m8_u32m8(vfloat32m8_t a)
/*@ With (x0:fp32) (x1:fp32) (x2:fp32) (x3:fp32) (x4:fp32) (x5:fp32) (x6:fp32) (x7:fp32) (x8:fp32) (x9:fp32) (x10:fp32) (x11:fp32) (x12:fp32) (x13:fp32) (x14:fp32) (x15:fp32) (x16:fp32) (x17:fp32) (x18:fp32) (x19:fp32) (x20:fp32) (x21:fp32) (x22:fp32) (x23:fp32) (x24:fp32) (x25:fp32) (x26:fp32) (x27:fp32) (x28:fp32) (x29:fp32) (x30:fp32) (x31:fp32)
 Require store(&(a.s0),float,x0) * store(&(a.s1),float,x1) * store(&(a.s2),float,x2) * store(&(a.s3),float,x3) * store(&(a.s4),float,x4) * store(&(a.s5),float,x5) * store(&(a.s6),float,x6) * store(&(a.s7),float,x7) * store(&(a.s8),float,x8) * store(&(a.s9),float,x9) * store(&(a.s10),float,x10) * store(&(a.s11),float,x11) * store(&(a.s12),float,x12) * store(&(a.s13),float,x13) * store(&(a.s14),float,x14) * store(&(a.s15),float,x15) * store(&(a.s16),float,x16) * store(&(a.s17),float,x17) * store(&(a.s18),float,x18) * store(&(a.s19),float,x19) * store(&(a.s20),float,x20) * store(&(a.s21),float,x21) * store(&(a.s22),float,x22) * store(&(a.s23),float,x23) * store(&(a.s24),float,x24) * store(&(a.s25),float,x25) * store(&(a.s26),float,x26) * store(&(a.s27),float,x27) * store(&(a.s28),float,x28) * store(&(a.s29),float,x29) * store(&(a.s30),float,x30) * store(&(a.s31),float,x31)
 Ensure store(&(__return.s0),unsigned int,bits_of_fp32(x0)) * store(&(__return.s1),unsigned int,bits_of_fp32(x1)) * store(&(__return.s2),unsigned int,bits_of_fp32(x2)) * store(&(__return.s3),unsigned int,bits_of_fp32(x3)) * store(&(__return.s4),unsigned int,bits_of_fp32(x4)) * store(&(__return.s5),unsigned int,bits_of_fp32(x5)) * store(&(__return.s6),unsigned int,bits_of_fp32(x6)) * store(&(__return.s7),unsigned int,bits_of_fp32(x7)) * store(&(__return.s8),unsigned int,bits_of_fp32(x8)) * store(&(__return.s9),unsigned int,bits_of_fp32(x9)) * store(&(__return.s10),unsigned int,bits_of_fp32(x10)) * store(&(__return.s11),unsigned int,bits_of_fp32(x11)) * store(&(__return.s12),unsigned int,bits_of_fp32(x12)) * store(&(__return.s13),unsigned int,bits_of_fp32(x13)) * store(&(__return.s14),unsigned int,bits_of_fp32(x14)) * store(&(__return.s15),unsigned int,bits_of_fp32(x15)) * store(&(__return.s16),unsigned int,bits_of_fp32(x16)) * store(&(__return.s17),unsigned int,bits_of_fp32(x17)) * store(&(__return.s18),unsigned int,bits_of_fp32(x18)) * store(&(__return.s19),unsigned int,bits_of_fp32(x19)) * store(&(__return.s20),unsigned int,bits_of_fp32(x20)) * store(&(__return.s21),unsigned int,bits_of_fp32(x21)) * store(&(__return.s22),unsigned int,bits_of_fp32(x22)) * store(&(__return.s23),unsigned int,bits_of_fp32(x23)) * store(&(__return.s24),unsigned int,bits_of_fp32(x24)) * store(&(__return.s25),unsigned int,bits_of_fp32(x25)) * store(&(__return.s26),unsigned int,bits_of_fp32(x26)) * store(&(__return.s27),unsigned int,bits_of_fp32(x27)) * store(&(__return.s28),unsigned int,bits_of_fp32(x28)) * store(&(__return.s29),unsigned int,bits_of_fp32(x29)) * store(&(__return.s30),unsigned int,bits_of_fp32(x30)) * store(&(__return.s31),unsigned int,bits_of_fp32(x31)) */
{
 vuint32m8_t r;
 r.s0=qcp_float_bits(a.s0);
 r.s1=qcp_float_bits(a.s1);
 r.s2=qcp_float_bits(a.s2);
 r.s3=qcp_float_bits(a.s3);
 r.s4=qcp_float_bits(a.s4);
 r.s5=qcp_float_bits(a.s5);
 r.s6=qcp_float_bits(a.s6);
 r.s7=qcp_float_bits(a.s7);
 r.s8=qcp_float_bits(a.s8);
 r.s9=qcp_float_bits(a.s9);
 r.s10=qcp_float_bits(a.s10);
 r.s11=qcp_float_bits(a.s11);
 r.s12=qcp_float_bits(a.s12);
 r.s13=qcp_float_bits(a.s13);
 r.s14=qcp_float_bits(a.s14);
 r.s15=qcp_float_bits(a.s15);
 r.s16=qcp_float_bits(a.s16);
 r.s17=qcp_float_bits(a.s17);
 r.s18=qcp_float_bits(a.s18);
 r.s19=qcp_float_bits(a.s19);
 r.s20=qcp_float_bits(a.s20);
 r.s21=qcp_float_bits(a.s21);
 r.s22=qcp_float_bits(a.s22);
 r.s23=qcp_float_bits(a.s23);
 r.s24=qcp_float_bits(a.s24);
 r.s25=qcp_float_bits(a.s25);
 r.s26=qcp_float_bits(a.s26);
 r.s27=qcp_float_bits(a.s27);
 r.s28=qcp_float_bits(a.s28);
 r.s29=qcp_float_bits(a.s29);
 r.s30=qcp_float_bits(a.s30);
 r.s31=qcp_float_bits(a.s31);
 return r;
}
