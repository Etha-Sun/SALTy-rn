#include "scalar_nan.h"
int qm_scale_is_nan(float scale)
/*@ Require emp Ensure __return==qm_ne(scale,scale) && emp */
{
vfloat32m8_t f=__riscv_vfmv_v_f_f32m8(scale,1);
vint32m8_t b=__riscv_vreinterpret_v_f32m8_i32m8(f) /*@ where a=&f,vl=1,A=qm_fpvec32(f.s0,f.s1,f.s2,f.s3,f.s4,f.s5,f.s6,f.s7,f.s8,f.s9,f.s10,f.s11,f.s12,f.s13,f.s14,f.s15,f.s16,f.s17,f.s18,f.s19,f.s20,f.s21,f.s22,f.s23,f.s24,f.s25,f.s26,f.s27,f.s28,f.s29,f.s30,f.s31) */;
int32_t word=__riscv_vmv_x_s_i32m8_i32(b) /*@ where a=&b,A=qm_vec32(b.s0,b.s1,b.s2,b.s3,b.s4,b.s5,b.s6,b.s7,b.s8,b.s9,b.s10,b.s11,b.s12,b.s13,b.s14,b.s15,b.s16,b.s17,b.s18,b.s19,b.s20,b.s21,b.s22,b.s23,b.s24,b.s25,b.s26,b.s27,b.s28,b.s29,b.s30,b.s31) */;
return (word & INT32_C(0x7FFFFFFF)) > INT32_C(0x7F800000);
}
