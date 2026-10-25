#include <stddef.h>
#include <stdint.h>
#define assert(x) ((void)0)
#define XNN_OOB_READS
#define XNN_UNPREDICTABLE(x) (x)
#define XNN_UNLIKELY(x) (x)
#define XNN_LIKELY(x) (x)
struct xnn_f32_minmax_params {struct {float min,max;}scalar;};
#include <riscv_vector.h>


#line 1 "/srv/home/yuechunsun/tools/qcp-simple-kernels/verification/qcp/candidates/f32-dwconv2d-chw/shim/read_scalar.c"
float dw_read_scalar(const float *p)
/*@ With (F:DwROMap) Require dw_present(F,p) && dw_data(F)
 Ensure dw_same(__return,dw_get(F,p)) && dw_data(F) */
{ return *p; }


#line 1 "/srv/home/yuechunsun/tools/qcp-simple-kernels/verification/qcp/candidates/f32-dwconv2d-chw/shim/propagating.c"
/* Preserve ARM NaN propagation under the public numeric-or-bothNaN observer.
 * Distinct by-value copies retain both original operands without requiring
 * two ownerships of one local vector. No scalar floating self-comparison. */
vfloat32m2_t dw_chw_propagating_max(vfloat32m2_t a,float b,size_t vl) 
/*@ With (A:Z -> fp32)
 Require 0<=vl && vl<=8 && (exists (a0:fp32) (a1:fp32) (a2:fp32) (a3:fp32) (a4:fp32) (a5:fp32) (a6:fp32) (a7:fp32), dw_fp_match(0,vl,a0,A(0)) && dw_fp_match(1,vl,a1,A(1)) && dw_fp_match(2,vl,a2,A(2)) && dw_fp_match(3,vl,a3,A(3)) && dw_fp_match(4,vl,a4,A(4)) && dw_fp_match(5,vl,a5,A(5)) && dw_fp_match(6,vl,a6,A(6)) && dw_fp_match(7,vl,a7,A(7)) && store(&(a.s0),float,a0) * store(&(a.s1),float,a1) * store(&(a.s2),float,a2) * store(&(a.s3),float,a3) * store(&(a.s4),float,a4) * store(&(a.s5),float,a5) * store(&(a.s6),float,a6) * store(&(a.s7),float,a7))
 Ensure exists (r0:fp32) (r1:fp32) (r2:fp32) (r3:fp32) (r4:fp32) (r5:fp32) (r6:fp32) (r7:fp32), dw_fp_match(0,vl,r0,dw_repaired_max(A(0),b)) && dw_fp_match(1,vl,r1,dw_repaired_max(A(1),b)) && dw_fp_match(2,vl,r2,dw_repaired_max(A(2),b)) && dw_fp_match(3,vl,r3,dw_repaired_max(A(3),b)) && dw_fp_match(4,vl,r4,dw_repaired_max(A(4),b)) && dw_fp_match(5,vl,r5,dw_repaired_max(A(5),b)) && dw_fp_match(6,vl,r6,dw_repaired_max(A(6),b)) && dw_fp_match(7,vl,r7,dw_repaired_max(A(7),b)) && store(&(__return.s0),float,r0) * store(&(__return.s1),float,r1) * store(&(__return.s2),float,r2) * store(&(__return.s3),float,r3) * store(&(__return.s4),float,r4) * store(&(__return.s5),float,r5) * store(&(__return.s6),float,r6) * store(&(__return.s7),float,r7) */
{
  vfloat32m2_t acopy=a;
  vfloat32m2_t vb=__riscv_vfmv_v_f_f32m2(b,vl);
  vfloat32m2_t bcopy=vb;
  vbool16_t na=__riscv_vmfne_vv_f32m2_b16(a,acopy,vl);
  vbool16_t nb=__riscv_vmfne_vv_f32m2_b16(vb,bcopy,vl);
  vfloat32m2_t r=__riscv_vfmax_vf_f32m2(a,b,vl);
  r=__riscv_vmerge_vvm_f32m2(r,a,na,vl);
  return __riscv_vmerge_vvm_f32m2(r,vb,nb,vl);
}
vfloat32m2_t dw_chw_propagating_min(vfloat32m2_t a,float b,size_t vl) 
/*@ With (A:Z -> fp32)
 Require 0<=vl && vl<=8 && (exists (a0:fp32) (a1:fp32) (a2:fp32) (a3:fp32) (a4:fp32) (a5:fp32) (a6:fp32) (a7:fp32), dw_fp_match(0,vl,a0,A(0)) && dw_fp_match(1,vl,a1,A(1)) && dw_fp_match(2,vl,a2,A(2)) && dw_fp_match(3,vl,a3,A(3)) && dw_fp_match(4,vl,a4,A(4)) && dw_fp_match(5,vl,a5,A(5)) && dw_fp_match(6,vl,a6,A(6)) && dw_fp_match(7,vl,a7,A(7)) && store(&(a.s0),float,a0) * store(&(a.s1),float,a1) * store(&(a.s2),float,a2) * store(&(a.s3),float,a3) * store(&(a.s4),float,a4) * store(&(a.s5),float,a5) * store(&(a.s6),float,a6) * store(&(a.s7),float,a7))
 Ensure exists (r0:fp32) (r1:fp32) (r2:fp32) (r3:fp32) (r4:fp32) (r5:fp32) (r6:fp32) (r7:fp32), dw_fp_match(0,vl,r0,dw_repaired_min(A(0),b)) && dw_fp_match(1,vl,r1,dw_repaired_min(A(1),b)) && dw_fp_match(2,vl,r2,dw_repaired_min(A(2),b)) && dw_fp_match(3,vl,r3,dw_repaired_min(A(3),b)) && dw_fp_match(4,vl,r4,dw_repaired_min(A(4),b)) && dw_fp_match(5,vl,r5,dw_repaired_min(A(5),b)) && dw_fp_match(6,vl,r6,dw_repaired_min(A(6),b)) && dw_fp_match(7,vl,r7,dw_repaired_min(A(7),b)) && store(&(__return.s0),float,r0) * store(&(__return.s1),float,r1) * store(&(__return.s2),float,r2) * store(&(__return.s3),float,r3) * store(&(__return.s4),float,r4) * store(&(__return.s5),float,r5) * store(&(__return.s6),float,r6) * store(&(__return.s7),float,r7) */
{
  vfloat32m2_t acopy=a;
  vfloat32m2_t vb=__riscv_vfmv_v_f_f32m2(b,vl);
  vfloat32m2_t bcopy=vb;
  vbool16_t na=__riscv_vmfne_vv_f32m2_b16(a,acopy,vl);
  vbool16_t nb=__riscv_vmfne_vv_f32m2_b16(vb,bcopy,vl);
  vfloat32m2_t r=__riscv_vfmin_vf_f32m2(a,b,vl);
  r=__riscv_vmerge_vvm_f32m2(r,a,na,vl);
  return __riscv_vmerge_vvm_f32m2(r,vb,nb,vl);
}


#line 1 "/srv/home/yuechunsun/tools/qcp-simple-kernels/verification/qcp/candidates/f32-dwconv2d-chw/shim/rvv_extended_borrow.c"
vfloat32m2_t dw_r_fma(const vfloat32m2_t *p_c,float x,const vfloat32m2_t *p_a,size_t vl)
/*@ With (c0:fp32) (c1:fp32) (c2:fp32) (c3:fp32) (c4:fp32) (c5:fp32) (c6:fp32) (c7:fp32) (a0:fp32) (a1:fp32) (a2:fp32) (a3:fp32) (a4:fp32) (a5:fp32) (a6:fp32) (a7:fp32)
 Require 0<=vl && vl<=8 && store(&(p_c->s0),float,c0) * store(&(p_c->s1),float,c1) * store(&(p_c->s2),float,c2) * store(&(p_c->s3),float,c3) * store(&(p_c->s4),float,c4) * store(&(p_c->s5),float,c5) * store(&(p_c->s6),float,c6) * store(&(p_c->s7),float,c7) * store(&(p_a->s0),float,a0) * store(&(p_a->s1),float,a1) * store(&(p_a->s2),float,a2) * store(&(p_a->s3),float,a3) * store(&(p_a->s4),float,a4) * store(&(p_a->s5),float,a5) * store(&(p_a->s6),float,a6) * store(&(p_a->s7),float,a7)
 Ensure exists (r0:fp32) (r1:fp32) (r2:fp32) (r3:fp32) (r4:fp32) (r5:fp32) (r6:fp32) (r7:fp32), dw_fp_match(0,vl,r0,dw_rvv_fma(c0,x,a0)) && dw_fp_match(1,vl,r1,dw_rvv_fma(c1,x,a1)) && dw_fp_match(2,vl,r2,dw_rvv_fma(c2,x,a2)) && dw_fp_match(3,vl,r3,dw_rvv_fma(c3,x,a3)) && dw_fp_match(4,vl,r4,dw_rvv_fma(c4,x,a4)) && dw_fp_match(5,vl,r5,dw_rvv_fma(c5,x,a5)) && dw_fp_match(6,vl,r6,dw_rvv_fma(c6,x,a6)) && dw_fp_match(7,vl,r7,dw_rvv_fma(c7,x,a7)) && store(&(p_c->s0),float,c0) * store(&(p_c->s1),float,c1) * store(&(p_c->s2),float,c2) * store(&(p_c->s3),float,c3) * store(&(p_c->s4),float,c4) * store(&(p_c->s5),float,c5) * store(&(p_c->s6),float,c6) * store(&(p_c->s7),float,c7) * store(&(p_a->s0),float,a0) * store(&(p_a->s1),float,a1) * store(&(p_a->s2),float,a2) * store(&(p_a->s3),float,a3) * store(&(p_a->s4),float,a4) * store(&(p_a->s5),float,a5) * store(&(p_a->s6),float,a6) * store(&(p_a->s7),float,a7) * store(&(__return.s0),float,r0) * store(&(__return.s1),float,r1) * store(&(__return.s2),float,r2) * store(&(__return.s3),float,r3) * store(&(__return.s4),float,r4) * store(&(__return.s5),float,r5) * store(&(__return.s6),float,r6) * store(&(__return.s7),float,r7) */
{
 vfloat32m2_t c=*p_c;
 vfloat32m2_t a=*p_a;
 return __riscv_vfmacc_vf_f32m2(c,x,a,vl) /*@ where c=&c,a=&a,c0=c.s0,c1=c.s1,c2=c.s2,c3=c.s3,c4=c.s4,c5=c.s5,c6=c.s6,c7=c.s7,a0=a.s0,a1=a.s1,a2=a.s2,a3=a.s3,a4=a.s4,a5=a.s5,a6=a.s6,a7=a.s7 */;
}

vfloat32m2_t dw_r_up(const vfloat32m2_t *p_a,float x,size_t vl)
/*@ With (a0:fp32) (a1:fp32) (a2:fp32) (a3:fp32) (a4:fp32) (a5:fp32) (a6:fp32) (a7:fp32)
 Require 0<=vl && vl<=8 && store(&(p_a->s0),float,a0) * store(&(p_a->s1),float,a1) * store(&(p_a->s2),float,a2) * store(&(p_a->s3),float,a3) * store(&(p_a->s4),float,a4) * store(&(p_a->s5),float,a5) * store(&(p_a->s6),float,a6) * store(&(p_a->s7),float,a7)
 Ensure exists (r0:fp32) (r1:fp32) (r2:fp32) (r3:fp32) (r4:fp32) (r5:fp32) (r6:fp32) (r7:fp32), dw_fp_match(0,vl,r0,dw_rvv_slide_up(dw_fp8(a0,a1,a2,a3,a4,a5,a6,a7),x,0)) && dw_fp_match(1,vl,r1,dw_rvv_slide_up(dw_fp8(a0,a1,a2,a3,a4,a5,a6,a7),x,1)) && dw_fp_match(2,vl,r2,dw_rvv_slide_up(dw_fp8(a0,a1,a2,a3,a4,a5,a6,a7),x,2)) && dw_fp_match(3,vl,r3,dw_rvv_slide_up(dw_fp8(a0,a1,a2,a3,a4,a5,a6,a7),x,3)) && dw_fp_match(4,vl,r4,dw_rvv_slide_up(dw_fp8(a0,a1,a2,a3,a4,a5,a6,a7),x,4)) && dw_fp_match(5,vl,r5,dw_rvv_slide_up(dw_fp8(a0,a1,a2,a3,a4,a5,a6,a7),x,5)) && dw_fp_match(6,vl,r6,dw_rvv_slide_up(dw_fp8(a0,a1,a2,a3,a4,a5,a6,a7),x,6)) && dw_fp_match(7,vl,r7,dw_rvv_slide_up(dw_fp8(a0,a1,a2,a3,a4,a5,a6,a7),x,7)) && store(&(p_a->s0),float,a0) * store(&(p_a->s1),float,a1) * store(&(p_a->s2),float,a2) * store(&(p_a->s3),float,a3) * store(&(p_a->s4),float,a4) * store(&(p_a->s5),float,a5) * store(&(p_a->s6),float,a6) * store(&(p_a->s7),float,a7) * store(&(__return.s0),float,r0) * store(&(__return.s1),float,r1) * store(&(__return.s2),float,r2) * store(&(__return.s3),float,r3) * store(&(__return.s4),float,r4) * store(&(__return.s5),float,r5) * store(&(__return.s6),float,r6) * store(&(__return.s7),float,r7) */
{
 vfloat32m2_t a=*p_a;
 return __riscv_vfslide1up_vf_f32m2(a,x,vl) /*@ where a=&a,a0=a.s0,a1=a.s1,a2=a.s2,a3=a.s3,a4=a.s4,a5=a.s5,a6=a.s6,a7=a.s7 */;
}

vfloat32m2_t dw_r_down(const vfloat32m2_t *p_a,float x,size_t vl)
/*@ With (a0:fp32) (a1:fp32) (a2:fp32) (a3:fp32) (a4:fp32) (a5:fp32) (a6:fp32) (a7:fp32)
 Require 0<=vl && vl<=8 && store(&(p_a->s0),float,a0) * store(&(p_a->s1),float,a1) * store(&(p_a->s2),float,a2) * store(&(p_a->s3),float,a3) * store(&(p_a->s4),float,a4) * store(&(p_a->s5),float,a5) * store(&(p_a->s6),float,a6) * store(&(p_a->s7),float,a7)
 Ensure exists (r0:fp32) (r1:fp32) (r2:fp32) (r3:fp32) (r4:fp32) (r5:fp32) (r6:fp32) (r7:fp32), dw_fp_match(0,vl,r0,dw_rvv_slide_down(dw_fp8(a0,a1,a2,a3,a4,a5,a6,a7),x,vl,0)) && dw_fp_match(1,vl,r1,dw_rvv_slide_down(dw_fp8(a0,a1,a2,a3,a4,a5,a6,a7),x,vl,1)) && dw_fp_match(2,vl,r2,dw_rvv_slide_down(dw_fp8(a0,a1,a2,a3,a4,a5,a6,a7),x,vl,2)) && dw_fp_match(3,vl,r3,dw_rvv_slide_down(dw_fp8(a0,a1,a2,a3,a4,a5,a6,a7),x,vl,3)) && dw_fp_match(4,vl,r4,dw_rvv_slide_down(dw_fp8(a0,a1,a2,a3,a4,a5,a6,a7),x,vl,4)) && dw_fp_match(5,vl,r5,dw_rvv_slide_down(dw_fp8(a0,a1,a2,a3,a4,a5,a6,a7),x,vl,5)) && dw_fp_match(6,vl,r6,dw_rvv_slide_down(dw_fp8(a0,a1,a2,a3,a4,a5,a6,a7),x,vl,6)) && dw_fp_match(7,vl,r7,dw_rvv_slide_down(dw_fp8(a0,a1,a2,a3,a4,a5,a6,a7),x,vl,7)) && store(&(p_a->s0),float,a0) * store(&(p_a->s1),float,a1) * store(&(p_a->s2),float,a2) * store(&(p_a->s3),float,a3) * store(&(p_a->s4),float,a4) * store(&(p_a->s5),float,a5) * store(&(p_a->s6),float,a6) * store(&(p_a->s7),float,a7) * store(&(__return.s0),float,r0) * store(&(__return.s1),float,r1) * store(&(__return.s2),float,r2) * store(&(__return.s3),float,r3) * store(&(__return.s4),float,r4) * store(&(__return.s5),float,r5) * store(&(__return.s6),float,r6) * store(&(__return.s7),float,r7) */
{
 vfloat32m2_t a=*p_a;
 return __riscv_vfslide1down_vf_f32m2(a,x,vl) /*@ where a=&a,a0=a.s0,a1=a.s1,a2=a.s2,a3=a.s3,a4=a.s4,a5=a.s5,a6=a.s6,a7=a.s7 */;
}


#line 1 "/srv/home/yuechunsun/tools/qcp-simple-kernels/verification/qcp/candidates/f32-dwconv2d-chw/shim/vector_pixel.c"
#define DWCHW_VECTOR_PIXEL_BODY 1
vfloat32m2_t dw_vector_pixel_compute(const vfloat32m2_t*p0,const vfloat32m2_t*p1,const vfloat32m2_t*p2,const float*weights,float prev0,float prev1,float prev2,float next0,float next1,float next2,float lo,float hi,size_t vl)
/*@ With (F:DwROMap) (a00:fp32) (a01:fp32) (a02:fp32) (a03:fp32) (a04:fp32) (a05:fp32) (a06:fp32) (a07:fp32) (a10:fp32) (a11:fp32) (a12:fp32) (a13:fp32) (a14:fp32) (a15:fp32) (a16:fp32) (a17:fp32) (a20:fp32) (a21:fp32) (a22:fp32) (a23:fp32) (a24:fp32) (a25:fp32) (a26:fp32) (a27:fp32) Require 0<=vl && vl<=8 && dw_window(F,weights,10) && dw_data(F) * store(&(p0->s0),float,a00) * store(&(p0->s1),float,a01) * store(&(p0->s2),float,a02) * store(&(p0->s3),float,a03) * store(&(p0->s4),float,a04) * store(&(p0->s5),float,a05) * store(&(p0->s6),float,a06) * store(&(p0->s7),float,a07) * store(&(p1->s0),float,a10) * store(&(p1->s1),float,a11) * store(&(p1->s2),float,a12) * store(&(p1->s3),float,a13) * store(&(p1->s4),float,a14) * store(&(p1->s5),float,a15) * store(&(p1->s6),float,a16) * store(&(p1->s7),float,a17) * store(&(p2->s0),float,a20) * store(&(p2->s1),float,a21) * store(&(p2->s2),float,a22) * store(&(p2->s3),float,a23) * store(&(p2->s4),float,a24) * store(&(p2->s5),float,a25) * store(&(p2->s6),float,a26) * store(&(p2->s7),float,a27) Ensure exists (r0:fp32) (r1:fp32) (r2:fp32) (r3:fp32) (r4:fp32) (r5:fp32) (r6:fp32) (r7:fp32), dw_vector_match8(vl,r0,r1,r2,r3,r4,r5,r6,r7,dw_vector_pixel(F,weights,dw_fp8(a00,a01,a02,a03,a04,a05,a06,a07),dw_fp8(a10,a11,a12,a13,a14,a15,a16,a17),dw_fp8(a20,a21,a22,a23,a24,a25,a26,a27),prev0,prev1,prev2,next0,next1,next2,lo,hi,vl)) && dw_data(F) * store(&(p0->s0),float,a00) * store(&(p0->s1),float,a01) * store(&(p0->s2),float,a02) * store(&(p0->s3),float,a03) * store(&(p0->s4),float,a04) * store(&(p0->s5),float,a05) * store(&(p0->s6),float,a06) * store(&(p0->s7),float,a07) * store(&(p1->s0),float,a10) * store(&(p1->s1),float,a11) * store(&(p1->s2),float,a12) * store(&(p1->s3),float,a13) * store(&(p1->s4),float,a14) * store(&(p1->s5),float,a15) * store(&(p1->s6),float,a16) * store(&(p1->s7),float,a17) * store(&(p2->s0),float,a20) * store(&(p2->s1),float,a21) * store(&(p2->s2),float,a22) * store(&(p2->s3),float,a23) * store(&(p2->s4),float,a24) * store(&(p2->s5),float,a25) * store(&(p2->s6),float,a26) * store(&(p2->s7),float,a27) * store(&(__return.s0),float,r0) * store(&(__return.s1),float,r1) * store(&(__return.s2),float,r2) * store(&(__return.s3),float,r3) * store(&(__return.s4),float,r4) * store(&(__return.s5),float,r5) * store(&(__return.s6),float,r6) * store(&(__return.s7),float,r7) */
{
vfloat32m2_t c0=*p0;vfloat32m2_t c1=*p1;vfloat32m2_t c2=*p2;
vfloat32m2_t out=__riscv_vfmv_v_f_f32m2(dw_read_scalar(&(weights[0])) /*@ where F=F */,vl);
out=dw_r_fma(&out,dw_read_scalar(&(weights[2])) /*@ where F=F */,&c0,vl) /*@ where p_c=&out,c0=out.s0,c1=out.s1,c2=out.s2,c3=out.s3,c4=out.s4,c5=out.s5,c6=out.s6,c7=out.s7,p_a=&c0,a0=c0.s0,a1=c0.s1,a2=c0.s2,a3=c0.s3,a4=c0.s4,a5=c0.s5,a6=c0.s6,a7=c0.s7 */;
out=dw_r_fma(&out,dw_read_scalar(&(weights[5])) /*@ where F=F */,&c1,vl) /*@ where p_c=&out,c0=out.s0,c1=out.s1,c2=out.s2,c3=out.s3,c4=out.s4,c5=out.s5,c6=out.s6,c7=out.s7,p_a=&c1,a0=c1.s0,a1=c1.s1,a2=c1.s2,a3=c1.s3,a4=c1.s4,a5=c1.s5,a6=c1.s6,a7=c1.s7 */;
out=dw_r_fma(&out,dw_read_scalar(&(weights[8])) /*@ where F=F */,&c2,vl) /*@ where p_c=&out,c0=out.s0,c1=out.s1,c2=out.s2,c3=out.s3,c4=out.s4,c5=out.s5,c6=out.s6,c7=out.s7,p_a=&c2,a0=c2.s0,a1=c2.s1,a2=c2.s2,a3=c2.s3,a4=c2.s4,a5=c2.s5,a6=c2.s6,a7=c2.s7 */;
vfloat32m2_t v_left0=dw_r_up(&c0,prev0,vl) /*@ where p_a=&c0,a0=c0.s0,a1=c0.s1,a2=c0.s2,a3=c0.s3,a4=c0.s4,a5=c0.s5,a6=c0.s6,a7=c0.s7 */;
out=dw_r_fma(&out,dw_read_scalar(&(weights[1])) /*@ where F=F */,&v_left0,vl) /*@ where p_c=&out,c0=out.s0,c1=out.s1,c2=out.s2,c3=out.s3,c4=out.s4,c5=out.s5,c6=out.s6,c7=out.s7,p_a=&v_left0,a0=v_left0.s0,a1=v_left0.s1,a2=v_left0.s2,a3=v_left0.s3,a4=v_left0.s4,a5=v_left0.s5,a6=v_left0.s6,a7=v_left0.s7 */;
vfloat32m2_t v_left1=dw_r_up(&c1,prev1,vl) /*@ where p_a=&c1,a0=c1.s0,a1=c1.s1,a2=c1.s2,a3=c1.s3,a4=c1.s4,a5=c1.s5,a6=c1.s6,a7=c1.s7 */;
out=dw_r_fma(&out,dw_read_scalar(&(weights[4])) /*@ where F=F */,&v_left1,vl) /*@ where p_c=&out,c0=out.s0,c1=out.s1,c2=out.s2,c3=out.s3,c4=out.s4,c5=out.s5,c6=out.s6,c7=out.s7,p_a=&v_left1,a0=v_left1.s0,a1=v_left1.s1,a2=v_left1.s2,a3=v_left1.s3,a4=v_left1.s4,a5=v_left1.s5,a6=v_left1.s6,a7=v_left1.s7 */;
vfloat32m2_t v_left2=dw_r_up(&c2,prev2,vl) /*@ where p_a=&c2,a0=c2.s0,a1=c2.s1,a2=c2.s2,a3=c2.s3,a4=c2.s4,a5=c2.s5,a6=c2.s6,a7=c2.s7 */;
out=dw_r_fma(&out,dw_read_scalar(&(weights[7])) /*@ where F=F */,&v_left2,vl) /*@ where p_c=&out,c0=out.s0,c1=out.s1,c2=out.s2,c3=out.s3,c4=out.s4,c5=out.s5,c6=out.s6,c7=out.s7,p_a=&v_left2,a0=v_left2.s0,a1=v_left2.s1,a2=v_left2.s2,a3=v_left2.s3,a4=v_left2.s4,a5=v_left2.s5,a6=v_left2.s6,a7=v_left2.s7 */;
vfloat32m2_t v_right0=dw_r_down(&c0,next0,vl) /*@ where p_a=&c0,a0=c0.s0,a1=c0.s1,a2=c0.s2,a3=c0.s3,a4=c0.s4,a5=c0.s5,a6=c0.s6,a7=c0.s7 */;
out=dw_r_fma(&out,dw_read_scalar(&(weights[3])) /*@ where F=F */,&v_right0,vl) /*@ where p_c=&out,c0=out.s0,c1=out.s1,c2=out.s2,c3=out.s3,c4=out.s4,c5=out.s5,c6=out.s6,c7=out.s7,p_a=&v_right0,a0=v_right0.s0,a1=v_right0.s1,a2=v_right0.s2,a3=v_right0.s3,a4=v_right0.s4,a5=v_right0.s5,a6=v_right0.s6,a7=v_right0.s7 */;
vfloat32m2_t v_right1=dw_r_down(&c1,next1,vl) /*@ where p_a=&c1,a0=c1.s0,a1=c1.s1,a2=c1.s2,a3=c1.s3,a4=c1.s4,a5=c1.s5,a6=c1.s6,a7=c1.s7 */;
out=dw_r_fma(&out,dw_read_scalar(&(weights[6])) /*@ where F=F */,&v_right1,vl) /*@ where p_c=&out,c0=out.s0,c1=out.s1,c2=out.s2,c3=out.s3,c4=out.s4,c5=out.s5,c6=out.s6,c7=out.s7,p_a=&v_right1,a0=v_right1.s0,a1=v_right1.s1,a2=v_right1.s2,a3=v_right1.s3,a4=v_right1.s4,a5=v_right1.s5,a6=v_right1.s6,a7=v_right1.s7 */;
vfloat32m2_t v_right2=dw_r_down(&c2,next2,vl) /*@ where p_a=&c2,a0=c2.s0,a1=c2.s1,a2=c2.s2,a3=c2.s3,a4=c2.s4,a5=c2.s5,a6=c2.s6,a7=c2.s7 */;
out=dw_r_fma(&out,dw_read_scalar(&(weights[9])) /*@ where F=F */,&v_right2,vl) /*@ where p_c=&out,c0=out.s0,c1=out.s1,c2=out.s2,c3=out.s3,c4=out.s4,c5=out.s5,c6=out.s6,c7=out.s7,p_a=&v_right2,a0=v_right2.s0,a1=v_right2.s1,a2=v_right2.s2,a3=v_right2.s3,a4=v_right2.s4,a5=v_right2.s5,a6=v_right2.s6,a7=v_right2.s7 */;
out=dw_chw_propagating_max(out,lo,vl) /*@ where a=&out,A=dw_fp8(out.s0,out.s1,out.s2,out.s3,out.s4,out.s5,out.s6,out.s7) */;
out=dw_chw_propagating_min(out,hi,vl) /*@ where a=&out,A=dw_fp8(out.s0,out.s1,out.s2,out.s3,out.s4,out.s5,out.s6,out.s7) */;
return out;
}


#line 1 "/srv/home/yuechunsun/tools/qcp-simple-kernels/verification/qcp/candidates/f32-dwconv2d-chw/impl/testRVV.c"
void test_rvv(
    size_t input_height,
    size_t input_width,
    const float* input,
    const float* weights,
    const float* zero,
    float* output,
    uint32_t padding_top,
    const struct xnn_f32_minmax_params* restrict params) XNN_OOB_READS
{
  assert(input_height != 0);
  assert(input_width != 0);
  assert(input_width % sizeof(float) == 0);
  assert(padding_top == 1);

  const float* i0 = zero;
  const float* i1 = input;
  const float* i2 = (const float*) ((uintptr_t) i1 + input_width);
  const float* i3 = (const float*) ((uintptr_t) i2 + input_width);
  const float* i4 = (const float*) ((uintptr_t) i3 + input_width);

  float* o0 = output;
  float* o1 = (float*) ((uintptr_t) o0 + input_width);
  float* o2 = (float*) ((uintptr_t) o1 + input_width);

  size_t output_height = input_height;
  do {
    if XNN_UNPREDICTABLE(output_height < 2) {
      i2 = zero;
      o1 = o0;
    }
    if XNN_UNPREDICTABLE(output_height < 3) {
      i3 = zero;
      o2 = o1;
    }
    if XNN_UNPREDICTABLE(output_height < 4) {
      i4 = zero;
    }

    const float* orig_i3 = i3;
    const float* orig_i4 = i4;

    size_t w = input_width / sizeof(float);
    float prev_i0 = 0.0f;
    float prev_i1 = 0.0f;
    float prev_i2 = 0.0f;
    float prev_i3 = 0.0f;
    float prev_i4 = 0.0f;

    while (w > 0) {
      size_t vl = __riscv_vsetvl_e32m2(w);

      vfloat32m2_t vi0 = __riscv_vle32_v_f32m2(i0, vl);
      vfloat32m2_t vi1 = __riscv_vle32_v_f32m2(i1, vl);
      vfloat32m2_t vi2 = __riscv_vle32_v_f32m2(i2, vl);
      vfloat32m2_t vi3 = __riscv_vle32_v_f32m2(i3, vl);
      vfloat32m2_t vi4 = __riscv_vle32_v_f32m2(i4, vl);

      const float next_i0 = (w > vl) ? dw_read_scalar(&(i0[vl])) : 0.0f;
      const float next_i1 = (w > vl) ? dw_read_scalar(&(i1[vl])) : 0.0f;
      const float next_i2 = (w > vl) ? dw_read_scalar(&(i2[vl])) : 0.0f;
      const float next_i3 = (w > vl) ? dw_read_scalar(&(i3[vl])) : 0.0f;
      const float next_i4 = (w > vl) ? dw_read_scalar(&(i4[vl])) : 0.0f;
      vfloat32m2_t vo0 = dw_vector_pixel_compute(&vi0,&vi1,&vi2,weights,prev_i0,prev_i1,prev_i2,next_i0,next_i1,next_i2,dw_read_scalar(&(params->scalar.min)),dw_read_scalar(&(params->scalar.max)),vl);
      vfloat32m2_t vo1 = dw_vector_pixel_compute(&vi1,&vi2,&vi3,weights,prev_i1,prev_i2,prev_i3,next_i1,next_i2,next_i3,dw_read_scalar(&(params->scalar.min)),dw_read_scalar(&(params->scalar.max)),vl);
      vfloat32m2_t vo2 = dw_vector_pixel_compute(&vi2,&vi3,&vi4,weights,prev_i2,prev_i3,prev_i4,next_i2,next_i3,next_i4,dw_read_scalar(&(params->scalar.min)),dw_read_scalar(&(params->scalar.max)),vl);

      __riscv_vse32_v_f32m2(o2, vo2, vl);
      __riscv_vse32_v_f32m2(o1, vo1, vl);
      __riscv_vse32_v_f32m2(o0, vo0, vl);

      prev_i0 = dw_read_scalar(&(i0[vl - 1]));
      prev_i1 = dw_read_scalar(&(i1[vl - 1]));
      prev_i2 = dw_read_scalar(&(i2[vl - 1]));
      prev_i3 = dw_read_scalar(&(i3[vl - 1]));
      prev_i4 = dw_read_scalar(&(i4[vl - 1]));

      i0 += vl;
      i1 += vl;
      i2 += vl;
      i3 += vl;
      i4 += vl;
      o0 += vl;
      o1 += vl;
      o2 += vl;
      w -= vl;
    }

    i0 = orig_i3;
    i1 = orig_i4;
    i2 = (const float*) ((uintptr_t) i1 + input_width);
    i3 = (const float*) ((uintptr_t) i2 + input_width);
    i4 = (const float*) ((uintptr_t) i3 + input_width);

    o0 = o2;
    o1 = (float*) ((uintptr_t) o0 + input_width);
    o2 = (float*) ((uintptr_t) o1 + input_width);

    output_height = output_height > 3 ? output_height - 3 : 0;
  } while (output_height != 0);
}