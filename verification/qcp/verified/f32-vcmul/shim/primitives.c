#include "types.h"
float qcp_vcmul_mul(float a,float b)
/*@ Require emp Ensure same_fp32(__return,fp32_mul(a,b)) && emp */
{ return a*b; }
float qcp_vcmul_add(float a,float b)
/*@ Require emp Ensure same_fp32(__return,fp32_add(a,b)) && emp */
{ return a+b; }
float qcp_vcmul_sub(float a,float b)
/*@ Require emp Ensure same_fp32(__return,fp32_sub(a,b)) && emp */
{ return a-b; }
float qcp_vcmul_mla(float a,float b,float c)
/*@ Require emp Ensure same_fp32(__return,vcmul_mla(a,b,c)) && emp */
{ float product=b*c; return a+product; }
float qcp_vcmul_mls(float a,float b,float c)
/*@ Require emp Ensure same_fp32(__return,vcmul_mls(a,b,c)) && emp */
{ float product=b*c; return a-product; }
float qcp_vcmul_active_mul(float a,float b,unsigned long long i,unsigned long long vl)
/*@ Require 0<=i && i<16 && 0<=vl && vl<=16 && emp Ensure same_fp32(__return,vcmul_active_mul(i,vl,a,b)) && emp */
{ if(i<vl) return a*b; return 0.0f; }
float qcp_vcmul_active_add(float a,float b,unsigned long long i,unsigned long long vl)
/*@ Require 0<=i && i<16 && 0<=vl && vl<=16 && emp Ensure same_fp32(__return,vcmul_active_add(i,vl,a,b)) && emp */
{ if(i<vl) return a+b; return 0.0f; }
float qcp_vcmul_active_sub(float a,float b,unsigned long long i,unsigned long long vl)
/*@ Require 0<=i && i<16 && 0<=vl && vl<=16 && emp Ensure same_fp32(__return,vcmul_active_sub(i,vl,a,b)) && emp */
{ if(i<vl) return a-b; return 0.0f; }
float32x4_t vmulq_f32(float32x4_t a,float32x4_t b)
/*@ With (a0:fp32) (a1:fp32) (a2:fp32) (a3:fp32) (b0:fp32) (b1:fp32) (b2:fp32) (b3:fp32)
 Require store(&(a.s0),float,a0) * store(&(a.s1),float,a1) * store(&(a.s2),float,a2) * store(&(a.s3),float,a3) * store(&(b.s0),float,b0) * store(&(b.s1),float,b1) * store(&(b.s2),float,b2) * store(&(b.s3),float,b3)
 Ensure store(&(__return.s0),float,fp32_mul(a0,b0)) * store(&(__return.s1),float,fp32_mul(a1,b1)) * store(&(__return.s2),float,fp32_mul(a2,b2)) * store(&(__return.s3),float,fp32_mul(a3,b3)) */
{ float32x4_t r;
 r.s0=qcp_vcmul_mul(a.s0,b.s0);
 r.s1=qcp_vcmul_mul(a.s1,b.s1);
 r.s2=qcp_vcmul_mul(a.s2,b.s2);
 r.s3=qcp_vcmul_mul(a.s3,b.s3);
 return r; }
float32x4_t vmlaq_f32(float32x4_t a,float32x4_t b,float32x4_t c)
/*@ With (a0:fp32) (a1:fp32) (a2:fp32) (a3:fp32) (b0:fp32) (b1:fp32) (b2:fp32) (b3:fp32) (c0:fp32) (c1:fp32) (c2:fp32) (c3:fp32)
 Require store(&(a.s0),float,a0) * store(&(a.s1),float,a1) * store(&(a.s2),float,a2) * store(&(a.s3),float,a3) * store(&(b.s0),float,b0) * store(&(b.s1),float,b1) * store(&(b.s2),float,b2) * store(&(b.s3),float,b3) * store(&(c.s0),float,c0) * store(&(c.s1),float,c1) * store(&(c.s2),float,c2) * store(&(c.s3),float,c3)
 Ensure store(&(__return.s0),float,vcmul_mla(a0,b0,c0)) * store(&(__return.s1),float,vcmul_mla(a1,b1,c1)) * store(&(__return.s2),float,vcmul_mla(a2,b2,c2)) * store(&(__return.s3),float,vcmul_mla(a3,b3,c3)) */
{ float32x4_t r;
 r.s0=qcp_vcmul_mla(a.s0,b.s0,c.s0);
 r.s1=qcp_vcmul_mla(a.s1,b.s1,c.s1);
 r.s2=qcp_vcmul_mla(a.s2,b.s2,c.s2);
 r.s3=qcp_vcmul_mla(a.s3,b.s3,c.s3);
 return r; }
float32x4_t vmlsq_f32(float32x4_t a,float32x4_t b,float32x4_t c)
/*@ With (a0:fp32) (a1:fp32) (a2:fp32) (a3:fp32) (b0:fp32) (b1:fp32) (b2:fp32) (b3:fp32) (c0:fp32) (c1:fp32) (c2:fp32) (c3:fp32)
 Require store(&(a.s0),float,a0) * store(&(a.s1),float,a1) * store(&(a.s2),float,a2) * store(&(a.s3),float,a3) * store(&(b.s0),float,b0) * store(&(b.s1),float,b1) * store(&(b.s2),float,b2) * store(&(b.s3),float,b3) * store(&(c.s0),float,c0) * store(&(c.s1),float,c1) * store(&(c.s2),float,c2) * store(&(c.s3),float,c3)
 Ensure store(&(__return.s0),float,vcmul_mls(a0,b0,c0)) * store(&(__return.s1),float,vcmul_mls(a1,b1,c1)) * store(&(__return.s2),float,vcmul_mls(a2,b2,c2)) * store(&(__return.s3),float,vcmul_mls(a3,b3,c3)) */
{ float32x4_t r;
 r.s0=qcp_vcmul_mls(a.s0,b.s0,c.s0);
 r.s1=qcp_vcmul_mls(a.s1,b.s1,c.s1);
 r.s2=qcp_vcmul_mls(a.s2,b.s2,c.s2);
 r.s3=qcp_vcmul_mls(a.s3,b.s3,c.s3);
 return r; }
vfloat32m4_t __riscv_vfmul_vv_f32m4(vfloat32m4_t a,vfloat32m4_t b,size_t vl)
/*@ With (a0:fp32) (a1:fp32) (a2:fp32) (a3:fp32) (a4:fp32) (a5:fp32) (a6:fp32) (a7:fp32) (a8:fp32) (a9:fp32) (a10:fp32) (a11:fp32) (a12:fp32) (a13:fp32) (a14:fp32) (a15:fp32) (b0:fp32) (b1:fp32) (b2:fp32) (b3:fp32) (b4:fp32) (b5:fp32) (b6:fp32) (b7:fp32) (b8:fp32) (b9:fp32) (b10:fp32) (b11:fp32) (b12:fp32) (b13:fp32) (b14:fp32) (b15:fp32)
 Require 0<=vl && vl<=16 && store(&(a.s0),float,a0) * store(&(a.s1),float,a1) * store(&(a.s2),float,a2) * store(&(a.s3),float,a3) * store(&(a.s4),float,a4) * store(&(a.s5),float,a5) * store(&(a.s6),float,a6) * store(&(a.s7),float,a7) * store(&(a.s8),float,a8) * store(&(a.s9),float,a9) * store(&(a.s10),float,a10) * store(&(a.s11),float,a11) * store(&(a.s12),float,a12) * store(&(a.s13),float,a13) * store(&(a.s14),float,a14) * store(&(a.s15),float,a15) * store(&(b.s0),float,b0) * store(&(b.s1),float,b1) * store(&(b.s2),float,b2) * store(&(b.s3),float,b3) * store(&(b.s4),float,b4) * store(&(b.s5),float,b5) * store(&(b.s6),float,b6) * store(&(b.s7),float,b7) * store(&(b.s8),float,b8) * store(&(b.s9),float,b9) * store(&(b.s10),float,b10) * store(&(b.s11),float,b11) * store(&(b.s12),float,b12) * store(&(b.s13),float,b13) * store(&(b.s14),float,b14) * store(&(b.s15),float,b15)
 Ensure store(&(__return.s0),float,vcmul_active_mul(0,vl,a0,b0)) * store(&(__return.s1),float,vcmul_active_mul(1,vl,a1,b1)) * store(&(__return.s2),float,vcmul_active_mul(2,vl,a2,b2)) * store(&(__return.s3),float,vcmul_active_mul(3,vl,a3,b3)) * store(&(__return.s4),float,vcmul_active_mul(4,vl,a4,b4)) * store(&(__return.s5),float,vcmul_active_mul(5,vl,a5,b5)) * store(&(__return.s6),float,vcmul_active_mul(6,vl,a6,b6)) * store(&(__return.s7),float,vcmul_active_mul(7,vl,a7,b7)) * store(&(__return.s8),float,vcmul_active_mul(8,vl,a8,b8)) * store(&(__return.s9),float,vcmul_active_mul(9,vl,a9,b9)) * store(&(__return.s10),float,vcmul_active_mul(10,vl,a10,b10)) * store(&(__return.s11),float,vcmul_active_mul(11,vl,a11,b11)) * store(&(__return.s12),float,vcmul_active_mul(12,vl,a12,b12)) * store(&(__return.s13),float,vcmul_active_mul(13,vl,a13,b13)) * store(&(__return.s14),float,vcmul_active_mul(14,vl,a14,b14)) * store(&(__return.s15),float,vcmul_active_mul(15,vl,a15,b15)) */
{ vfloat32m4_t r;
 r.s0=qcp_vcmul_active_mul(a.s0,b.s0,0,vl);
 r.s1=qcp_vcmul_active_mul(a.s1,b.s1,1,vl);
 r.s2=qcp_vcmul_active_mul(a.s2,b.s2,2,vl);
 r.s3=qcp_vcmul_active_mul(a.s3,b.s3,3,vl);
 r.s4=qcp_vcmul_active_mul(a.s4,b.s4,4,vl);
 r.s5=qcp_vcmul_active_mul(a.s5,b.s5,5,vl);
 r.s6=qcp_vcmul_active_mul(a.s6,b.s6,6,vl);
 r.s7=qcp_vcmul_active_mul(a.s7,b.s7,7,vl);
 r.s8=qcp_vcmul_active_mul(a.s8,b.s8,8,vl);
 r.s9=qcp_vcmul_active_mul(a.s9,b.s9,9,vl);
 r.s10=qcp_vcmul_active_mul(a.s10,b.s10,10,vl);
 r.s11=qcp_vcmul_active_mul(a.s11,b.s11,11,vl);
 r.s12=qcp_vcmul_active_mul(a.s12,b.s12,12,vl);
 r.s13=qcp_vcmul_active_mul(a.s13,b.s13,13,vl);
 r.s14=qcp_vcmul_active_mul(a.s14,b.s14,14,vl);
 r.s15=qcp_vcmul_active_mul(a.s15,b.s15,15,vl);
 return r; }
vfloat32m4_t __riscv_vfadd_vv_f32m4(vfloat32m4_t a,vfloat32m4_t b,size_t vl)
/*@ With (a0:fp32) (a1:fp32) (a2:fp32) (a3:fp32) (a4:fp32) (a5:fp32) (a6:fp32) (a7:fp32) (a8:fp32) (a9:fp32) (a10:fp32) (a11:fp32) (a12:fp32) (a13:fp32) (a14:fp32) (a15:fp32) (b0:fp32) (b1:fp32) (b2:fp32) (b3:fp32) (b4:fp32) (b5:fp32) (b6:fp32) (b7:fp32) (b8:fp32) (b9:fp32) (b10:fp32) (b11:fp32) (b12:fp32) (b13:fp32) (b14:fp32) (b15:fp32)
 Require 0<=vl && vl<=16 && store(&(a.s0),float,a0) * store(&(a.s1),float,a1) * store(&(a.s2),float,a2) * store(&(a.s3),float,a3) * store(&(a.s4),float,a4) * store(&(a.s5),float,a5) * store(&(a.s6),float,a6) * store(&(a.s7),float,a7) * store(&(a.s8),float,a8) * store(&(a.s9),float,a9) * store(&(a.s10),float,a10) * store(&(a.s11),float,a11) * store(&(a.s12),float,a12) * store(&(a.s13),float,a13) * store(&(a.s14),float,a14) * store(&(a.s15),float,a15) * store(&(b.s0),float,b0) * store(&(b.s1),float,b1) * store(&(b.s2),float,b2) * store(&(b.s3),float,b3) * store(&(b.s4),float,b4) * store(&(b.s5),float,b5) * store(&(b.s6),float,b6) * store(&(b.s7),float,b7) * store(&(b.s8),float,b8) * store(&(b.s9),float,b9) * store(&(b.s10),float,b10) * store(&(b.s11),float,b11) * store(&(b.s12),float,b12) * store(&(b.s13),float,b13) * store(&(b.s14),float,b14) * store(&(b.s15),float,b15)
 Ensure store(&(__return.s0),float,vcmul_active_add(0,vl,a0,b0)) * store(&(__return.s1),float,vcmul_active_add(1,vl,a1,b1)) * store(&(__return.s2),float,vcmul_active_add(2,vl,a2,b2)) * store(&(__return.s3),float,vcmul_active_add(3,vl,a3,b3)) * store(&(__return.s4),float,vcmul_active_add(4,vl,a4,b4)) * store(&(__return.s5),float,vcmul_active_add(5,vl,a5,b5)) * store(&(__return.s6),float,vcmul_active_add(6,vl,a6,b6)) * store(&(__return.s7),float,vcmul_active_add(7,vl,a7,b7)) * store(&(__return.s8),float,vcmul_active_add(8,vl,a8,b8)) * store(&(__return.s9),float,vcmul_active_add(9,vl,a9,b9)) * store(&(__return.s10),float,vcmul_active_add(10,vl,a10,b10)) * store(&(__return.s11),float,vcmul_active_add(11,vl,a11,b11)) * store(&(__return.s12),float,vcmul_active_add(12,vl,a12,b12)) * store(&(__return.s13),float,vcmul_active_add(13,vl,a13,b13)) * store(&(__return.s14),float,vcmul_active_add(14,vl,a14,b14)) * store(&(__return.s15),float,vcmul_active_add(15,vl,a15,b15)) */
{ vfloat32m4_t r;
 r.s0=qcp_vcmul_active_add(a.s0,b.s0,0,vl);
 r.s1=qcp_vcmul_active_add(a.s1,b.s1,1,vl);
 r.s2=qcp_vcmul_active_add(a.s2,b.s2,2,vl);
 r.s3=qcp_vcmul_active_add(a.s3,b.s3,3,vl);
 r.s4=qcp_vcmul_active_add(a.s4,b.s4,4,vl);
 r.s5=qcp_vcmul_active_add(a.s5,b.s5,5,vl);
 r.s6=qcp_vcmul_active_add(a.s6,b.s6,6,vl);
 r.s7=qcp_vcmul_active_add(a.s7,b.s7,7,vl);
 r.s8=qcp_vcmul_active_add(a.s8,b.s8,8,vl);
 r.s9=qcp_vcmul_active_add(a.s9,b.s9,9,vl);
 r.s10=qcp_vcmul_active_add(a.s10,b.s10,10,vl);
 r.s11=qcp_vcmul_active_add(a.s11,b.s11,11,vl);
 r.s12=qcp_vcmul_active_add(a.s12,b.s12,12,vl);
 r.s13=qcp_vcmul_active_add(a.s13,b.s13,13,vl);
 r.s14=qcp_vcmul_active_add(a.s14,b.s14,14,vl);
 r.s15=qcp_vcmul_active_add(a.s15,b.s15,15,vl);
 return r; }
vfloat32m4_t __riscv_vfsub_vv_f32m4(vfloat32m4_t a,vfloat32m4_t b,size_t vl)
/*@ With (a0:fp32) (a1:fp32) (a2:fp32) (a3:fp32) (a4:fp32) (a5:fp32) (a6:fp32) (a7:fp32) (a8:fp32) (a9:fp32) (a10:fp32) (a11:fp32) (a12:fp32) (a13:fp32) (a14:fp32) (a15:fp32) (b0:fp32) (b1:fp32) (b2:fp32) (b3:fp32) (b4:fp32) (b5:fp32) (b6:fp32) (b7:fp32) (b8:fp32) (b9:fp32) (b10:fp32) (b11:fp32) (b12:fp32) (b13:fp32) (b14:fp32) (b15:fp32)
 Require 0<=vl && vl<=16 && store(&(a.s0),float,a0) * store(&(a.s1),float,a1) * store(&(a.s2),float,a2) * store(&(a.s3),float,a3) * store(&(a.s4),float,a4) * store(&(a.s5),float,a5) * store(&(a.s6),float,a6) * store(&(a.s7),float,a7) * store(&(a.s8),float,a8) * store(&(a.s9),float,a9) * store(&(a.s10),float,a10) * store(&(a.s11),float,a11) * store(&(a.s12),float,a12) * store(&(a.s13),float,a13) * store(&(a.s14),float,a14) * store(&(a.s15),float,a15) * store(&(b.s0),float,b0) * store(&(b.s1),float,b1) * store(&(b.s2),float,b2) * store(&(b.s3),float,b3) * store(&(b.s4),float,b4) * store(&(b.s5),float,b5) * store(&(b.s6),float,b6) * store(&(b.s7),float,b7) * store(&(b.s8),float,b8) * store(&(b.s9),float,b9) * store(&(b.s10),float,b10) * store(&(b.s11),float,b11) * store(&(b.s12),float,b12) * store(&(b.s13),float,b13) * store(&(b.s14),float,b14) * store(&(b.s15),float,b15)
 Ensure store(&(__return.s0),float,vcmul_active_sub(0,vl,a0,b0)) * store(&(__return.s1),float,vcmul_active_sub(1,vl,a1,b1)) * store(&(__return.s2),float,vcmul_active_sub(2,vl,a2,b2)) * store(&(__return.s3),float,vcmul_active_sub(3,vl,a3,b3)) * store(&(__return.s4),float,vcmul_active_sub(4,vl,a4,b4)) * store(&(__return.s5),float,vcmul_active_sub(5,vl,a5,b5)) * store(&(__return.s6),float,vcmul_active_sub(6,vl,a6,b6)) * store(&(__return.s7),float,vcmul_active_sub(7,vl,a7,b7)) * store(&(__return.s8),float,vcmul_active_sub(8,vl,a8,b8)) * store(&(__return.s9),float,vcmul_active_sub(9,vl,a9,b9)) * store(&(__return.s10),float,vcmul_active_sub(10,vl,a10,b10)) * store(&(__return.s11),float,vcmul_active_sub(11,vl,a11,b11)) * store(&(__return.s12),float,vcmul_active_sub(12,vl,a12,b12)) * store(&(__return.s13),float,vcmul_active_sub(13,vl,a13,b13)) * store(&(__return.s14),float,vcmul_active_sub(14,vl,a14,b14)) * store(&(__return.s15),float,vcmul_active_sub(15,vl,a15,b15)) */
{ vfloat32m4_t r;
 r.s0=qcp_vcmul_active_sub(a.s0,b.s0,0,vl);
 r.s1=qcp_vcmul_active_sub(a.s1,b.s1,1,vl);
 r.s2=qcp_vcmul_active_sub(a.s2,b.s2,2,vl);
 r.s3=qcp_vcmul_active_sub(a.s3,b.s3,3,vl);
 r.s4=qcp_vcmul_active_sub(a.s4,b.s4,4,vl);
 r.s5=qcp_vcmul_active_sub(a.s5,b.s5,5,vl);
 r.s6=qcp_vcmul_active_sub(a.s6,b.s6,6,vl);
 r.s7=qcp_vcmul_active_sub(a.s7,b.s7,7,vl);
 r.s8=qcp_vcmul_active_sub(a.s8,b.s8,8,vl);
 r.s9=qcp_vcmul_active_sub(a.s9,b.s9,9,vl);
 r.s10=qcp_vcmul_active_sub(a.s10,b.s10,10,vl);
 r.s11=qcp_vcmul_active_sub(a.s11,b.s11,11,vl);
 r.s12=qcp_vcmul_active_sub(a.s12,b.s12,12,vl);
 r.s13=qcp_vcmul_active_sub(a.s13,b.s13,13,vl);
 r.s14=qcp_vcmul_active_sub(a.s14,b.s14,14,vl);
 r.s15=qcp_vcmul_active_sub(a.s15,b.s15,15,vl);
 return r; }
