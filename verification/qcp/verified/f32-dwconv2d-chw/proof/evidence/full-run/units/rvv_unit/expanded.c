typedef signed char int8_t;
typedef unsigned char uint8_t;
typedef int int32_t;
typedef unsigned int uint32_t;
typedef unsigned long long size_t;
typedef unsigned long long uintptr_t;
typedef uint8_t vbool16_t;
struct xnn_f32_minmax_params {struct {float min,max;}scalar;};
typedef struct float32x2_t {
 float s0;
 float s1;
} float32x2_t;
typedef struct float32x4_t {
 float s0;
 float s1;
 float s2;
 float s3;
} float32x4_t;
typedef struct uint32x4_t {
 uint32_t s0;
 uint32_t s1;
 uint32_t s2;
 uint32_t s3;
} uint32x4_t;
typedef struct vfloat32m2_t {
 float s0;
 float s1;
 float s2;
 float s3;
 float s4;
 float s5;
 float s6;
 float s7;
} vfloat32m2_t;
/*@ Import Coq Require Import DwChw.Types */
/*@ Import Coq Require Import DwChw.VectorModel */
/*@ Extern Coq (dw_fp_match:Z -> Z -> fp32 -> fp32 -> Prop) (dw_fp8:fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> Z -> fp32) (dw_mask_bit:Z -> Z -> Z) (dw_ne_value:fp32 -> fp32 -> Z) (dw_mask_matches:Z -> Z -> (Z -> fp32) -> (Z -> fp32) -> Prop) (fp32_max_number:fp32 -> fp32 -> fp32) (fp32_min_number:fp32 -> fp32 -> fp32) (dw_rvv_merge:fp32 -> fp32 -> Z -> fp32) (dw_repaired_max:fp32 -> fp32 -> fp32) (dw_repaired_min:fp32 -> fp32 -> fp32) (dw_vl_allowed:Z -> Z -> Prop) */
vfloat32m2_t __riscv_vfmv_v_f_f32m2(float x,size_t vl)
/*@ Require 0<=vl && vl<=8 && emp
 Ensure exists (r0:fp32) (r1:fp32) (r2:fp32) (r3:fp32) (r4:fp32) (r5:fp32) (r6:fp32) (r7:fp32), dw_fp_match(0,vl,r0,x) && dw_fp_match(1,vl,r1,x) && dw_fp_match(2,vl,r2,x) && dw_fp_match(3,vl,r3,x) && dw_fp_match(4,vl,r4,x) && dw_fp_match(5,vl,r5,x) && dw_fp_match(6,vl,r6,x) && dw_fp_match(7,vl,r7,x) && store(&(__return.s0),float,r0) * store(&(__return.s1),float,r1) * store(&(__return.s2),float,r2) * store(&(__return.s3),float,r3) * store(&(__return.s4),float,r4) * store(&(__return.s5),float,r5) * store(&(__return.s6),float,r6) * store(&(__return.s7),float,r7) */;
vbool16_t __riscv_vmfne_vv_f32m2_b16(vfloat32m2_t a,vfloat32m2_t b,size_t vl)
/*@ With (A:Z -> fp32) (B:Z -> fp32)
 Require 0<=vl && vl<=8 && (exists (a0:fp32) (a1:fp32) (a2:fp32) (a3:fp32) (a4:fp32) (a5:fp32) (a6:fp32) (a7:fp32) (b0:fp32) (b1:fp32) (b2:fp32) (b3:fp32) (b4:fp32) (b5:fp32) (b6:fp32) (b7:fp32), dw_fp_match(0,vl,a0,A(0)) && dw_fp_match(1,vl,a1,A(1)) && dw_fp_match(2,vl,a2,A(2)) && dw_fp_match(3,vl,a3,A(3)) && dw_fp_match(4,vl,a4,A(4)) && dw_fp_match(5,vl,a5,A(5)) && dw_fp_match(6,vl,a6,A(6)) && dw_fp_match(7,vl,a7,A(7)) && dw_fp_match(0,vl,b0,B(0)) && dw_fp_match(1,vl,b1,B(1)) && dw_fp_match(2,vl,b2,B(2)) && dw_fp_match(3,vl,b3,B(3)) && dw_fp_match(4,vl,b4,B(4)) && dw_fp_match(5,vl,b5,B(5)) && dw_fp_match(6,vl,b6,B(6)) && dw_fp_match(7,vl,b7,B(7)) && store(&(a.s0),float,a0) * store(&(a.s1),float,a1) * store(&(a.s2),float,a2) * store(&(a.s3),float,a3) * store(&(a.s4),float,a4) * store(&(a.s5),float,a5) * store(&(a.s6),float,a6) * store(&(a.s7),float,a7) * store(&(b.s0),float,b0) * store(&(b.s1),float,b1) * store(&(b.s2),float,b2) * store(&(b.s3),float,b3) * store(&(b.s4),float,b4) * store(&(b.s5),float,b5) * store(&(b.s6),float,b6) * store(&(b.s7),float,b7))
 Ensure 0<=__return && __return<=255 && dw_mask_matches(vl,__return,A,B) && emp */;
vfloat32m2_t __riscv_vfmax_vf_f32m2(vfloat32m2_t a,float x,size_t vl)
/*@ With (A:Z -> fp32)
 Require 0<=vl && vl<=8 && (exists (a0:fp32) (a1:fp32) (a2:fp32) (a3:fp32) (a4:fp32) (a5:fp32) (a6:fp32) (a7:fp32), dw_fp_match(0,vl,a0,A(0)) && dw_fp_match(1,vl,a1,A(1)) && dw_fp_match(2,vl,a2,A(2)) && dw_fp_match(3,vl,a3,A(3)) && dw_fp_match(4,vl,a4,A(4)) && dw_fp_match(5,vl,a5,A(5)) && dw_fp_match(6,vl,a6,A(6)) && dw_fp_match(7,vl,a7,A(7)) && store(&(a.s0),float,a0) * store(&(a.s1),float,a1) * store(&(a.s2),float,a2) * store(&(a.s3),float,a3) * store(&(a.s4),float,a4) * store(&(a.s5),float,a5) * store(&(a.s6),float,a6) * store(&(a.s7),float,a7))
 Ensure exists (r0:fp32) (r1:fp32) (r2:fp32) (r3:fp32) (r4:fp32) (r5:fp32) (r6:fp32) (r7:fp32), dw_fp_match(0,vl,r0,fp32_max_number(A(0),x)) && dw_fp_match(1,vl,r1,fp32_max_number(A(1),x)) && dw_fp_match(2,vl,r2,fp32_max_number(A(2),x)) && dw_fp_match(3,vl,r3,fp32_max_number(A(3),x)) && dw_fp_match(4,vl,r4,fp32_max_number(A(4),x)) && dw_fp_match(5,vl,r5,fp32_max_number(A(5),x)) && dw_fp_match(6,vl,r6,fp32_max_number(A(6),x)) && dw_fp_match(7,vl,r7,fp32_max_number(A(7),x)) && store(&(__return.s0),float,r0) * store(&(__return.s1),float,r1) * store(&(__return.s2),float,r2) * store(&(__return.s3),float,r3) * store(&(__return.s4),float,r4) * store(&(__return.s5),float,r5) * store(&(__return.s6),float,r6) * store(&(__return.s7),float,r7) */;
vfloat32m2_t __riscv_vfmin_vf_f32m2(vfloat32m2_t a,float x,size_t vl)
/*@ With (A:Z -> fp32)
 Require 0<=vl && vl<=8 && (exists (a0:fp32) (a1:fp32) (a2:fp32) (a3:fp32) (a4:fp32) (a5:fp32) (a6:fp32) (a7:fp32), dw_fp_match(0,vl,a0,A(0)) && dw_fp_match(1,vl,a1,A(1)) && dw_fp_match(2,vl,a2,A(2)) && dw_fp_match(3,vl,a3,A(3)) && dw_fp_match(4,vl,a4,A(4)) && dw_fp_match(5,vl,a5,A(5)) && dw_fp_match(6,vl,a6,A(6)) && dw_fp_match(7,vl,a7,A(7)) && store(&(a.s0),float,a0) * store(&(a.s1),float,a1) * store(&(a.s2),float,a2) * store(&(a.s3),float,a3) * store(&(a.s4),float,a4) * store(&(a.s5),float,a5) * store(&(a.s6),float,a6) * store(&(a.s7),float,a7))
 Ensure exists (r0:fp32) (r1:fp32) (r2:fp32) (r3:fp32) (r4:fp32) (r5:fp32) (r6:fp32) (r7:fp32), dw_fp_match(0,vl,r0,fp32_min_number(A(0),x)) && dw_fp_match(1,vl,r1,fp32_min_number(A(1),x)) && dw_fp_match(2,vl,r2,fp32_min_number(A(2),x)) && dw_fp_match(3,vl,r3,fp32_min_number(A(3),x)) && dw_fp_match(4,vl,r4,fp32_min_number(A(4),x)) && dw_fp_match(5,vl,r5,fp32_min_number(A(5),x)) && dw_fp_match(6,vl,r6,fp32_min_number(A(6),x)) && dw_fp_match(7,vl,r7,fp32_min_number(A(7),x)) && store(&(__return.s0),float,r0) * store(&(__return.s1),float,r1) * store(&(__return.s2),float,r2) * store(&(__return.s3),float,r3) * store(&(__return.s4),float,r4) * store(&(__return.s5),float,r5) * store(&(__return.s6),float,r6) * store(&(__return.s7),float,r7) */;
vfloat32m2_t __riscv_vmerge_vvm_f32m2(vfloat32m2_t a,vfloat32m2_t b,vbool16_t m,size_t vl)
/*@ With (A:Z -> fp32) (B:Z -> fp32)
 Require 0<=vl && vl<=8 && (exists (a0:fp32) (a1:fp32) (a2:fp32) (a3:fp32) (a4:fp32) (a5:fp32) (a6:fp32) (a7:fp32) (b0:fp32) (b1:fp32) (b2:fp32) (b3:fp32) (b4:fp32) (b5:fp32) (b6:fp32) (b7:fp32), dw_fp_match(0,vl,a0,A(0)) && dw_fp_match(1,vl,a1,A(1)) && dw_fp_match(2,vl,a2,A(2)) && dw_fp_match(3,vl,a3,A(3)) && dw_fp_match(4,vl,a4,A(4)) && dw_fp_match(5,vl,a5,A(5)) && dw_fp_match(6,vl,a6,A(6)) && dw_fp_match(7,vl,a7,A(7)) && dw_fp_match(0,vl,b0,B(0)) && dw_fp_match(1,vl,b1,B(1)) && dw_fp_match(2,vl,b2,B(2)) && dw_fp_match(3,vl,b3,B(3)) && dw_fp_match(4,vl,b4,B(4)) && dw_fp_match(5,vl,b5,B(5)) && dw_fp_match(6,vl,b6,B(6)) && dw_fp_match(7,vl,b7,B(7)) && store(&(a.s0),float,a0) * store(&(a.s1),float,a1) * store(&(a.s2),float,a2) * store(&(a.s3),float,a3) * store(&(a.s4),float,a4) * store(&(a.s5),float,a5) * store(&(a.s6),float,a6) * store(&(a.s7),float,a7) * store(&(b.s0),float,b0) * store(&(b.s1),float,b1) * store(&(b.s2),float,b2) * store(&(b.s3),float,b3) * store(&(b.s4),float,b4) * store(&(b.s5),float,b5) * store(&(b.s6),float,b6) * store(&(b.s7),float,b7))
 Ensure exists (r0:fp32) (r1:fp32) (r2:fp32) (r3:fp32) (r4:fp32) (r5:fp32) (r6:fp32) (r7:fp32), dw_fp_match(0,vl,r0,dw_rvv_merge(A(0),B(0),dw_mask_bit(m,0))) && dw_fp_match(1,vl,r1,dw_rvv_merge(A(1),B(1),dw_mask_bit(m,1))) && dw_fp_match(2,vl,r2,dw_rvv_merge(A(2),B(2),dw_mask_bit(m,2))) && dw_fp_match(3,vl,r3,dw_rvv_merge(A(3),B(3),dw_mask_bit(m,3))) && dw_fp_match(4,vl,r4,dw_rvv_merge(A(4),B(4),dw_mask_bit(m,4))) && dw_fp_match(5,vl,r5,dw_rvv_merge(A(5),B(5),dw_mask_bit(m,5))) && dw_fp_match(6,vl,r6,dw_rvv_merge(A(6),B(6),dw_mask_bit(m,6))) && dw_fp_match(7,vl,r7,dw_rvv_merge(A(7),B(7),dw_mask_bit(m,7))) && store(&(__return.s0),float,r0) * store(&(__return.s1),float,r1) * store(&(__return.s2),float,r2) * store(&(__return.s3),float,r3) * store(&(__return.s4),float,r4) * store(&(__return.s5),float,r5) * store(&(__return.s6),float,r6) * store(&(__return.s7),float,r7) */;
vbool16_t dw_borrow_compare(const vfloat32m2_t *p,const vfloat32m2_t *q,size_t vl)
/*@ With (a0:fp32) (a1:fp32) (a2:fp32) (a3:fp32) (a4:fp32) (a5:fp32) (a6:fp32) (a7:fp32) (b0:fp32) (b1:fp32) (b2:fp32) (b3:fp32) (b4:fp32) (b5:fp32) (b6:fp32) (b7:fp32)
 Require 0<=vl && vl<=8 && store(&(p->s0),float,a0) * store(&(p->s1),float,a1) * store(&(p->s2),float,a2) * store(&(p->s3),float,a3) * store(&(p->s4),float,a4) * store(&(p->s5),float,a5) * store(&(p->s6),float,a6) * store(&(p->s7),float,a7) * store(&(q->s0),float,b0) * store(&(q->s1),float,b1) * store(&(q->s2),float,b2) * store(&(q->s3),float,b3) * store(&(q->s4),float,b4) * store(&(q->s5),float,b5) * store(&(q->s6),float,b6) * store(&(q->s7),float,b7)
 Ensure 0<=__return && __return<=255 && dw_mask_matches(vl,__return,dw_fp8(a0,a1,a2,a3,a4,a5,a6,a7),dw_fp8(b0,b1,b2,b3,b4,b5,b6,b7)) && store(&(p->s0),float,a0) * store(&(p->s1),float,a1) * store(&(p->s2),float,a2) * store(&(p->s3),float,a3) * store(&(p->s4),float,a4) * store(&(p->s5),float,a5) * store(&(p->s6),float,a6) * store(&(p->s7),float,a7) * store(&(q->s0),float,b0) * store(&(q->s1),float,b1) * store(&(q->s2),float,b2) * store(&(q->s3),float,b3) * store(&(q->s4),float,b4) * store(&(q->s5),float,b5) * store(&(q->s6),float,b6) * store(&(q->s7),float,b7) */;
vfloat32m2_t dw_borrow_max(const vfloat32m2_t *p,float x,size_t vl)
/*@ With (a0:fp32) (a1:fp32) (a2:fp32) (a3:fp32) (a4:fp32) (a5:fp32) (a6:fp32) (a7:fp32)
 Require 0<=vl && vl<=8 && store(&(p->s0),float,a0) * store(&(p->s1),float,a1) * store(&(p->s2),float,a2) * store(&(p->s3),float,a3) * store(&(p->s4),float,a4) * store(&(p->s5),float,a5) * store(&(p->s6),float,a6) * store(&(p->s7),float,a7)
 Ensure exists (r0:fp32) (r1:fp32) (r2:fp32) (r3:fp32) (r4:fp32) (r5:fp32) (r6:fp32) (r7:fp32), dw_fp_match(0,vl,r0,fp32_max_number(dw_fp8(a0,a1,a2,a3,a4,a5,a6,a7)(0),x)) && dw_fp_match(1,vl,r1,fp32_max_number(dw_fp8(a0,a1,a2,a3,a4,a5,a6,a7)(1),x)) && dw_fp_match(2,vl,r2,fp32_max_number(dw_fp8(a0,a1,a2,a3,a4,a5,a6,a7)(2),x)) && dw_fp_match(3,vl,r3,fp32_max_number(dw_fp8(a0,a1,a2,a3,a4,a5,a6,a7)(3),x)) && dw_fp_match(4,vl,r4,fp32_max_number(dw_fp8(a0,a1,a2,a3,a4,a5,a6,a7)(4),x)) && dw_fp_match(5,vl,r5,fp32_max_number(dw_fp8(a0,a1,a2,a3,a4,a5,a6,a7)(5),x)) && dw_fp_match(6,vl,r6,fp32_max_number(dw_fp8(a0,a1,a2,a3,a4,a5,a6,a7)(6),x)) && dw_fp_match(7,vl,r7,fp32_max_number(dw_fp8(a0,a1,a2,a3,a4,a5,a6,a7)(7),x)) && store(&(p->s0),float,a0) * store(&(p->s1),float,a1) * store(&(p->s2),float,a2) * store(&(p->s3),float,a3) * store(&(p->s4),float,a4) * store(&(p->s5),float,a5) * store(&(p->s6),float,a6) * store(&(p->s7),float,a7) * store(&(__return.s0),float,r0) * store(&(__return.s1),float,r1) * store(&(__return.s2),float,r2) * store(&(__return.s3),float,r3) * store(&(__return.s4),float,r4) * store(&(__return.s5),float,r5) * store(&(__return.s6),float,r6) * store(&(__return.s7),float,r7) */;
vfloat32m2_t dw_borrow_min(const vfloat32m2_t *p,float x,size_t vl)
/*@ With (a0:fp32) (a1:fp32) (a2:fp32) (a3:fp32) (a4:fp32) (a5:fp32) (a6:fp32) (a7:fp32)
 Require 0<=vl && vl<=8 && store(&(p->s0),float,a0) * store(&(p->s1),float,a1) * store(&(p->s2),float,a2) * store(&(p->s3),float,a3) * store(&(p->s4),float,a4) * store(&(p->s5),float,a5) * store(&(p->s6),float,a6) * store(&(p->s7),float,a7)
 Ensure exists (r0:fp32) (r1:fp32) (r2:fp32) (r3:fp32) (r4:fp32) (r5:fp32) (r6:fp32) (r7:fp32), dw_fp_match(0,vl,r0,fp32_min_number(dw_fp8(a0,a1,a2,a3,a4,a5,a6,a7)(0),x)) && dw_fp_match(1,vl,r1,fp32_min_number(dw_fp8(a0,a1,a2,a3,a4,a5,a6,a7)(1),x)) && dw_fp_match(2,vl,r2,fp32_min_number(dw_fp8(a0,a1,a2,a3,a4,a5,a6,a7)(2),x)) && dw_fp_match(3,vl,r3,fp32_min_number(dw_fp8(a0,a1,a2,a3,a4,a5,a6,a7)(3),x)) && dw_fp_match(4,vl,r4,fp32_min_number(dw_fp8(a0,a1,a2,a3,a4,a5,a6,a7)(4),x)) && dw_fp_match(5,vl,r5,fp32_min_number(dw_fp8(a0,a1,a2,a3,a4,a5,a6,a7)(5),x)) && dw_fp_match(6,vl,r6,fp32_min_number(dw_fp8(a0,a1,a2,a3,a4,a5,a6,a7)(6),x)) && dw_fp_match(7,vl,r7,fp32_min_number(dw_fp8(a0,a1,a2,a3,a4,a5,a6,a7)(7),x)) && store(&(p->s0),float,a0) * store(&(p->s1),float,a1) * store(&(p->s2),float,a2) * store(&(p->s3),float,a3) * store(&(p->s4),float,a4) * store(&(p->s5),float,a5) * store(&(p->s6),float,a6) * store(&(p->s7),float,a7) * store(&(__return.s0),float,r0) * store(&(__return.s1),float,r1) * store(&(__return.s2),float,r2) * store(&(__return.s3),float,r3) * store(&(__return.s4),float,r4) * store(&(__return.s5),float,r5) * store(&(__return.s6),float,r6) * store(&(__return.s7),float,r7) */;
vfloat32m2_t dw_borrow_merge(const vfloat32m2_t *p,const vfloat32m2_t *q,vbool16_t m,size_t vl)
/*@ With (a0:fp32) (a1:fp32) (a2:fp32) (a3:fp32) (a4:fp32) (a5:fp32) (a6:fp32) (a7:fp32) (b0:fp32) (b1:fp32) (b2:fp32) (b3:fp32) (b4:fp32) (b5:fp32) (b6:fp32) (b7:fp32)
 Require 0<=vl && vl<=8 && store(&(p->s0),float,a0) * store(&(p->s1),float,a1) * store(&(p->s2),float,a2) * store(&(p->s3),float,a3) * store(&(p->s4),float,a4) * store(&(p->s5),float,a5) * store(&(p->s6),float,a6) * store(&(p->s7),float,a7) * store(&(q->s0),float,b0) * store(&(q->s1),float,b1) * store(&(q->s2),float,b2) * store(&(q->s3),float,b3) * store(&(q->s4),float,b4) * store(&(q->s5),float,b5) * store(&(q->s6),float,b6) * store(&(q->s7),float,b7)
 Ensure exists (r0:fp32) (r1:fp32) (r2:fp32) (r3:fp32) (r4:fp32) (r5:fp32) (r6:fp32) (r7:fp32), dw_fp_match(0,vl,r0,dw_rvv_merge(dw_fp8(a0,a1,a2,a3,a4,a5,a6,a7)(0),dw_fp8(b0,b1,b2,b3,b4,b5,b6,b7)(0),dw_mask_bit(m,0))) && dw_fp_match(1,vl,r1,dw_rvv_merge(dw_fp8(a0,a1,a2,a3,a4,a5,a6,a7)(1),dw_fp8(b0,b1,b2,b3,b4,b5,b6,b7)(1),dw_mask_bit(m,1))) && dw_fp_match(2,vl,r2,dw_rvv_merge(dw_fp8(a0,a1,a2,a3,a4,a5,a6,a7)(2),dw_fp8(b0,b1,b2,b3,b4,b5,b6,b7)(2),dw_mask_bit(m,2))) && dw_fp_match(3,vl,r3,dw_rvv_merge(dw_fp8(a0,a1,a2,a3,a4,a5,a6,a7)(3),dw_fp8(b0,b1,b2,b3,b4,b5,b6,b7)(3),dw_mask_bit(m,3))) && dw_fp_match(4,vl,r4,dw_rvv_merge(dw_fp8(a0,a1,a2,a3,a4,a5,a6,a7)(4),dw_fp8(b0,b1,b2,b3,b4,b5,b6,b7)(4),dw_mask_bit(m,4))) && dw_fp_match(5,vl,r5,dw_rvv_merge(dw_fp8(a0,a1,a2,a3,a4,a5,a6,a7)(5),dw_fp8(b0,b1,b2,b3,b4,b5,b6,b7)(5),dw_mask_bit(m,5))) && dw_fp_match(6,vl,r6,dw_rvv_merge(dw_fp8(a0,a1,a2,a3,a4,a5,a6,a7)(6),dw_fp8(b0,b1,b2,b3,b4,b5,b6,b7)(6),dw_mask_bit(m,6))) && dw_fp_match(7,vl,r7,dw_rvv_merge(dw_fp8(a0,a1,a2,a3,a4,a5,a6,a7)(7),dw_fp8(b0,b1,b2,b3,b4,b5,b6,b7)(7),dw_mask_bit(m,7))) && store(&(p->s0),float,a0) * store(&(p->s1),float,a1) * store(&(p->s2),float,a2) * store(&(p->s3),float,a3) * store(&(p->s4),float,a4) * store(&(p->s5),float,a5) * store(&(p->s6),float,a6) * store(&(p->s7),float,a7) * store(&(q->s0),float,b0) * store(&(q->s1),float,b1) * store(&(q->s2),float,b2) * store(&(q->s3),float,b3) * store(&(q->s4),float,b4) * store(&(q->s5),float,b5) * store(&(q->s6),float,b6) * store(&(q->s7),float,b7) * store(&(__return.s0),float,r0) * store(&(__return.s1),float,r1) * store(&(__return.s2),float,r2) * store(&(__return.s3),float,r3) * store(&(__return.s4),float,r4) * store(&(__return.s5),float,r5) * store(&(__return.s6),float,r6) * store(&(__return.s7),float,r7) */;
/* Bare nonvolatile local lvalues only; each source operand is evaluated once. */
vfloat32m2_t dw_chw_propagating_max(vfloat32m2_t a,float b,size_t vl)
/*@ With (A:Z -> fp32)
 Require 0<=vl && vl<=8 && (exists (a0:fp32) (a1:fp32) (a2:fp32) (a3:fp32) (a4:fp32) (a5:fp32) (a6:fp32) (a7:fp32), dw_fp_match(0,vl,a0,A(0)) && dw_fp_match(1,vl,a1,A(1)) && dw_fp_match(2,vl,a2,A(2)) && dw_fp_match(3,vl,a3,A(3)) && dw_fp_match(4,vl,a4,A(4)) && dw_fp_match(5,vl,a5,A(5)) && dw_fp_match(6,vl,a6,A(6)) && dw_fp_match(7,vl,a7,A(7)) && store(&(a.s0),float,a0) * store(&(a.s1),float,a1) * store(&(a.s2),float,a2) * store(&(a.s3),float,a3) * store(&(a.s4),float,a4) * store(&(a.s5),float,a5) * store(&(a.s6),float,a6) * store(&(a.s7),float,a7))
 Ensure exists (r0:fp32) (r1:fp32) (r2:fp32) (r3:fp32) (r4:fp32) (r5:fp32) (r6:fp32) (r7:fp32), dw_fp_match(0,vl,r0,dw_repaired_max(A(0),b)) && dw_fp_match(1,vl,r1,dw_repaired_max(A(1),b)) && dw_fp_match(2,vl,r2,dw_repaired_max(A(2),b)) && dw_fp_match(3,vl,r3,dw_repaired_max(A(3),b)) && dw_fp_match(4,vl,r4,dw_repaired_max(A(4),b)) && dw_fp_match(5,vl,r5,dw_repaired_max(A(5),b)) && dw_fp_match(6,vl,r6,dw_repaired_max(A(6),b)) && dw_fp_match(7,vl,r7,dw_repaired_max(A(7),b)) && store(&(__return.s0),float,r0) * store(&(__return.s1),float,r1) * store(&(__return.s2),float,r2) * store(&(__return.s3),float,r3) * store(&(__return.s4),float,r4) * store(&(__return.s5),float,r5) * store(&(__return.s6),float,r6) * store(&(__return.s7),float,r7) */;
vfloat32m2_t dw_chw_propagating_min(vfloat32m2_t a,float b,size_t vl)
/*@ With (A:Z -> fp32)
 Require 0<=vl && vl<=8 && (exists (a0:fp32) (a1:fp32) (a2:fp32) (a3:fp32) (a4:fp32) (a5:fp32) (a6:fp32) (a7:fp32), dw_fp_match(0,vl,a0,A(0)) && dw_fp_match(1,vl,a1,A(1)) && dw_fp_match(2,vl,a2,A(2)) && dw_fp_match(3,vl,a3,A(3)) && dw_fp_match(4,vl,a4,A(4)) && dw_fp_match(5,vl,a5,A(5)) && dw_fp_match(6,vl,a6,A(6)) && dw_fp_match(7,vl,a7,A(7)) && store(&(a.s0),float,a0) * store(&(a.s1),float,a1) * store(&(a.s2),float,a2) * store(&(a.s3),float,a3) * store(&(a.s4),float,a4) * store(&(a.s5),float,a5) * store(&(a.s6),float,a6) * store(&(a.s7),float,a7))
 Ensure exists (r0:fp32) (r1:fp32) (r2:fp32) (r3:fp32) (r4:fp32) (r5:fp32) (r6:fp32) (r7:fp32), dw_fp_match(0,vl,r0,dw_repaired_min(A(0),b)) && dw_fp_match(1,vl,r1,dw_repaired_min(A(1),b)) && dw_fp_match(2,vl,r2,dw_repaired_min(A(2),b)) && dw_fp_match(3,vl,r3,dw_repaired_min(A(3),b)) && dw_fp_match(4,vl,r4,dw_repaired_min(A(4),b)) && dw_fp_match(5,vl,r5,dw_repaired_min(A(5),b)) && dw_fp_match(6,vl,r6,dw_repaired_min(A(6),b)) && dw_fp_match(7,vl,r7,dw_repaired_min(A(7),b)) && store(&(__return.s0),float,r0) * store(&(__return.s1),float,r1) * store(&(__return.s2),float,r2) * store(&(__return.s3),float,r3) * store(&(__return.s4),float,r4) * store(&(__return.s5),float,r5) * store(&(__return.s6),float,r6) * store(&(__return.s7),float,r7) */;
/*@ Import Coq Require Import DwChw.Types */
/*@ Import Coq Require Import DwChw.TerminalModel */
/*@ Extern Coq (DwROMap :: *) */
/*@ Extern Coq (dw_load:DwROMap->Z->Z->fp32) (dw_data:DwROMap->Assertion) (dw_get:DwROMap->Z->fp32) (dw_window:DwROMap->Z->Z->Prop)
 (dw_fp2:fp32->fp32->Z->fp32) (dw_fp4:fp32->fp32->fp32->fp32->Z->fp32) (dw_u4:Z->Z->Z->Z->Z->Z)
 (dw_arm_ext:(Z->fp32)->(Z->fp32)->Z->Z->fp32) (dw_arm_fma:fp32->fp32->fp32->fp32)
 (dw_arm_max:fp32->fp32->fp32) (dw_arm_min:fp32->fp32->fp32)
 (dw_arm_and:(Z->Z)->(Z->Z)->Z->Z) (bits_of_fp32:fp32->Z) (fp32_of_bits:Z->fp32) */
/*@ Import Coq Require Import DwChw.Types */
/*@ Import Coq Require Import DwChw.MemoryFacts DwChw.OutputInterface */
/*@ Extern Coq (DwROMap :: *) (DwOutput :: *) */
/*@ Extern Coq (dw_data:DwROMap->Assertion) (dw_get:DwROMap->Z->fp32) (dw_present:DwROMap->Z->Prop) (dw_pop:DwROMap->Z->DwROMap)
 (dw_same:fp32->fp32->Prop) (dw_distinct:list Z->Prop)
 (dw_output:list Z->DwOutput->Assertion) (dw_write_window:list Z->Z->Z->Prop)
 (dw_output_put:DwOutput->Z->fp32->DwOutput) (dw_write_values:DwOutput->Z->list fp32->DwOutput)
 (dw_pack2:fp32->fp32->list fp32) (dw_pack4:fp32->fp32->fp32->fp32->list fp32) */
/*@ Import Coq Require Import DwChw.MemoryViewFacts */
/*@ Extern Coq (dw_load_allowed:DwROMap->Z->Z->Prop) (dw_store_allowed:list Z->Z->Z->Prop) */
/*@ Extern Coq (dw_rvv_fma:fp32->fp32->fp32->fp32) (dw_rvv_slide_up:(Z->fp32)->fp32->Z->fp32) (dw_rvv_slide_down:(Z->fp32)->fp32->Z->Z->fp32) */
vfloat32m2_t __riscv_vfmacc_vf_f32m2(vfloat32m2_t c,float x,vfloat32m2_t a,size_t vl)
/*@ With (c0:fp32) (c1:fp32) (c2:fp32) (c3:fp32) (c4:fp32) (c5:fp32) (c6:fp32) (c7:fp32) (a0:fp32) (a1:fp32) (a2:fp32) (a3:fp32) (a4:fp32) (a5:fp32) (a6:fp32) (a7:fp32)
 Require 0<=vl && vl<=8 && store(&(c.s0),float,c0) * store(&(c.s1),float,c1) * store(&(c.s2),float,c2) * store(&(c.s3),float,c3) * store(&(c.s4),float,c4) * store(&(c.s5),float,c5) * store(&(c.s6),float,c6) * store(&(c.s7),float,c7) * store(&(a.s0),float,a0) * store(&(a.s1),float,a1) * store(&(a.s2),float,a2) * store(&(a.s3),float,a3) * store(&(a.s4),float,a4) * store(&(a.s5),float,a5) * store(&(a.s6),float,a6) * store(&(a.s7),float,a7)
 Ensure exists (r0:fp32) (r1:fp32) (r2:fp32) (r3:fp32) (r4:fp32) (r5:fp32) (r6:fp32) (r7:fp32), dw_fp_match(0,vl,r0,dw_rvv_fma(c0,x,a0)) && dw_fp_match(1,vl,r1,dw_rvv_fma(c1,x,a1)) && dw_fp_match(2,vl,r2,dw_rvv_fma(c2,x,a2)) && dw_fp_match(3,vl,r3,dw_rvv_fma(c3,x,a3)) && dw_fp_match(4,vl,r4,dw_rvv_fma(c4,x,a4)) && dw_fp_match(5,vl,r5,dw_rvv_fma(c5,x,a5)) && dw_fp_match(6,vl,r6,dw_rvv_fma(c6,x,a6)) && dw_fp_match(7,vl,r7,dw_rvv_fma(c7,x,a7)) && store(&(__return.s0),float,r0) * store(&(__return.s1),float,r1) * store(&(__return.s2),float,r2) * store(&(__return.s3),float,r3) * store(&(__return.s4),float,r4) * store(&(__return.s5),float,r5) * store(&(__return.s6),float,r6) * store(&(__return.s7),float,r7) */;
vfloat32m2_t __riscv_vfslide1up_vf_f32m2(vfloat32m2_t a,float x,size_t vl)
/*@ With (a0:fp32) (a1:fp32) (a2:fp32) (a3:fp32) (a4:fp32) (a5:fp32) (a6:fp32) (a7:fp32)
 Require 0<=vl && vl<=8 && store(&(a.s0),float,a0) * store(&(a.s1),float,a1) * store(&(a.s2),float,a2) * store(&(a.s3),float,a3) * store(&(a.s4),float,a4) * store(&(a.s5),float,a5) * store(&(a.s6),float,a6) * store(&(a.s7),float,a7)
 Ensure exists (r0:fp32) (r1:fp32) (r2:fp32) (r3:fp32) (r4:fp32) (r5:fp32) (r6:fp32) (r7:fp32), dw_fp_match(0,vl,r0,dw_rvv_slide_up(dw_fp8(a0,a1,a2,a3,a4,a5,a6,a7),x,0)) && dw_fp_match(1,vl,r1,dw_rvv_slide_up(dw_fp8(a0,a1,a2,a3,a4,a5,a6,a7),x,1)) && dw_fp_match(2,vl,r2,dw_rvv_slide_up(dw_fp8(a0,a1,a2,a3,a4,a5,a6,a7),x,2)) && dw_fp_match(3,vl,r3,dw_rvv_slide_up(dw_fp8(a0,a1,a2,a3,a4,a5,a6,a7),x,3)) && dw_fp_match(4,vl,r4,dw_rvv_slide_up(dw_fp8(a0,a1,a2,a3,a4,a5,a6,a7),x,4)) && dw_fp_match(5,vl,r5,dw_rvv_slide_up(dw_fp8(a0,a1,a2,a3,a4,a5,a6,a7),x,5)) && dw_fp_match(6,vl,r6,dw_rvv_slide_up(dw_fp8(a0,a1,a2,a3,a4,a5,a6,a7),x,6)) && dw_fp_match(7,vl,r7,dw_rvv_slide_up(dw_fp8(a0,a1,a2,a3,a4,a5,a6,a7),x,7)) && store(&(__return.s0),float,r0) * store(&(__return.s1),float,r1) * store(&(__return.s2),float,r2) * store(&(__return.s3),float,r3) * store(&(__return.s4),float,r4) * store(&(__return.s5),float,r5) * store(&(__return.s6),float,r6) * store(&(__return.s7),float,r7) */;
vfloat32m2_t __riscv_vfslide1down_vf_f32m2(vfloat32m2_t a,float x,size_t vl)
/*@ With (a0:fp32) (a1:fp32) (a2:fp32) (a3:fp32) (a4:fp32) (a5:fp32) (a6:fp32) (a7:fp32)
 Require 0<=vl && vl<=8 && store(&(a.s0),float,a0) * store(&(a.s1),float,a1) * store(&(a.s2),float,a2) * store(&(a.s3),float,a3) * store(&(a.s4),float,a4) * store(&(a.s5),float,a5) * store(&(a.s6),float,a6) * store(&(a.s7),float,a7)
 Ensure exists (r0:fp32) (r1:fp32) (r2:fp32) (r3:fp32) (r4:fp32) (r5:fp32) (r6:fp32) (r7:fp32), dw_fp_match(0,vl,r0,dw_rvv_slide_down(dw_fp8(a0,a1,a2,a3,a4,a5,a6,a7),x,vl,0)) && dw_fp_match(1,vl,r1,dw_rvv_slide_down(dw_fp8(a0,a1,a2,a3,a4,a5,a6,a7),x,vl,1)) && dw_fp_match(2,vl,r2,dw_rvv_slide_down(dw_fp8(a0,a1,a2,a3,a4,a5,a6,a7),x,vl,2)) && dw_fp_match(3,vl,r3,dw_rvv_slide_down(dw_fp8(a0,a1,a2,a3,a4,a5,a6,a7),x,vl,3)) && dw_fp_match(4,vl,r4,dw_rvv_slide_down(dw_fp8(a0,a1,a2,a3,a4,a5,a6,a7),x,vl,4)) && dw_fp_match(5,vl,r5,dw_rvv_slide_down(dw_fp8(a0,a1,a2,a3,a4,a5,a6,a7),x,vl,5)) && dw_fp_match(6,vl,r6,dw_rvv_slide_down(dw_fp8(a0,a1,a2,a3,a4,a5,a6,a7),x,vl,6)) && dw_fp_match(7,vl,r7,dw_rvv_slide_down(dw_fp8(a0,a1,a2,a3,a4,a5,a6,a7),x,vl,7)) && store(&(__return.s0),float,r0) * store(&(__return.s1),float,r1) * store(&(__return.s2),float,r2) * store(&(__return.s3),float,r3) * store(&(__return.s4),float,r4) * store(&(__return.s5),float,r5) * store(&(__return.s6),float,r6) * store(&(__return.s7),float,r7) */;
size_t __riscv_vsetvl_e32m2(size_t avl)
/*@ Require 0<=avl && avl<=18446744073709551615 && emp Ensure 0<=__return && __return<=8 && dw_vl_allowed(avl,__return) && emp */;
vfloat32m2_t __riscv_vle32_v_f32m2(const float *p,size_t vl)
/*@ With (F:DwROMap) Require 0<=vl && vl<=8 && dw_load_allowed(F,p,vl) && dw_data(F) Ensure exists (r0:fp32) (r1:fp32) (r2:fp32) (r3:fp32) (r4:fp32) (r5:fp32) (r6:fp32) (r7:fp32), dw_fp_match(0,vl,r0,dw_load(F,p,0)) && dw_fp_match(1,vl,r1,dw_load(F,p,1)) && dw_fp_match(2,vl,r2,dw_load(F,p,2)) && dw_fp_match(3,vl,r3,dw_load(F,p,3)) && dw_fp_match(4,vl,r4,dw_load(F,p,4)) && dw_fp_match(5,vl,r5,dw_load(F,p,5)) && dw_fp_match(6,vl,r6,dw_load(F,p,6)) && dw_fp_match(7,vl,r7,dw_load(F,p,7)) && dw_data(F) * store(&(__return.s0),float,r0) * store(&(__return.s1),float,r1) * store(&(__return.s2),float,r2) * store(&(__return.s3),float,r3) * store(&(__return.s4),float,r4) * store(&(__return.s5),float,r5) * store(&(__return.s6),float,r6) * store(&(__return.s7),float,r7) */;
vfloat32m2_t dw_r_fma(const vfloat32m2_t *p_c,float x,const vfloat32m2_t *p_a,size_t vl)
/*@ With (c0:fp32) (c1:fp32) (c2:fp32) (c3:fp32) (c4:fp32) (c5:fp32) (c6:fp32) (c7:fp32) (a0:fp32) (a1:fp32) (a2:fp32) (a3:fp32) (a4:fp32) (a5:fp32) (a6:fp32) (a7:fp32)
 Require 0<=vl && vl<=8 && store(&(p_c->s0),float,c0) * store(&(p_c->s1),float,c1) * store(&(p_c->s2),float,c2) * store(&(p_c->s3),float,c3) * store(&(p_c->s4),float,c4) * store(&(p_c->s5),float,c5) * store(&(p_c->s6),float,c6) * store(&(p_c->s7),float,c7) * store(&(p_a->s0),float,a0) * store(&(p_a->s1),float,a1) * store(&(p_a->s2),float,a2) * store(&(p_a->s3),float,a3) * store(&(p_a->s4),float,a4) * store(&(p_a->s5),float,a5) * store(&(p_a->s6),float,a6) * store(&(p_a->s7),float,a7)
 Ensure exists (r0:fp32) (r1:fp32) (r2:fp32) (r3:fp32) (r4:fp32) (r5:fp32) (r6:fp32) (r7:fp32), dw_fp_match(0,vl,r0,dw_rvv_fma(c0,x,a0)) && dw_fp_match(1,vl,r1,dw_rvv_fma(c1,x,a1)) && dw_fp_match(2,vl,r2,dw_rvv_fma(c2,x,a2)) && dw_fp_match(3,vl,r3,dw_rvv_fma(c3,x,a3)) && dw_fp_match(4,vl,r4,dw_rvv_fma(c4,x,a4)) && dw_fp_match(5,vl,r5,dw_rvv_fma(c5,x,a5)) && dw_fp_match(6,vl,r6,dw_rvv_fma(c6,x,a6)) && dw_fp_match(7,vl,r7,dw_rvv_fma(c7,x,a7)) && store(&(p_c->s0),float,c0) * store(&(p_c->s1),float,c1) * store(&(p_c->s2),float,c2) * store(&(p_c->s3),float,c3) * store(&(p_c->s4),float,c4) * store(&(p_c->s5),float,c5) * store(&(p_c->s6),float,c6) * store(&(p_c->s7),float,c7) * store(&(p_a->s0),float,a0) * store(&(p_a->s1),float,a1) * store(&(p_a->s2),float,a2) * store(&(p_a->s3),float,a3) * store(&(p_a->s4),float,a4) * store(&(p_a->s5),float,a5) * store(&(p_a->s6),float,a6) * store(&(p_a->s7),float,a7) * store(&(__return.s0),float,r0) * store(&(__return.s1),float,r1) * store(&(__return.s2),float,r2) * store(&(__return.s3),float,r3) * store(&(__return.s4),float,r4) * store(&(__return.s5),float,r5) * store(&(__return.s6),float,r6) * store(&(__return.s7),float,r7) */;
vfloat32m2_t dw_r_up(const vfloat32m2_t *p_a,float x,size_t vl)
/*@ With (a0:fp32) (a1:fp32) (a2:fp32) (a3:fp32) (a4:fp32) (a5:fp32) (a6:fp32) (a7:fp32)
 Require 0<=vl && vl<=8 && store(&(p_a->s0),float,a0) * store(&(p_a->s1),float,a1) * store(&(p_a->s2),float,a2) * store(&(p_a->s3),float,a3) * store(&(p_a->s4),float,a4) * store(&(p_a->s5),float,a5) * store(&(p_a->s6),float,a6) * store(&(p_a->s7),float,a7)
 Ensure exists (r0:fp32) (r1:fp32) (r2:fp32) (r3:fp32) (r4:fp32) (r5:fp32) (r6:fp32) (r7:fp32), dw_fp_match(0,vl,r0,dw_rvv_slide_up(dw_fp8(a0,a1,a2,a3,a4,a5,a6,a7),x,0)) && dw_fp_match(1,vl,r1,dw_rvv_slide_up(dw_fp8(a0,a1,a2,a3,a4,a5,a6,a7),x,1)) && dw_fp_match(2,vl,r2,dw_rvv_slide_up(dw_fp8(a0,a1,a2,a3,a4,a5,a6,a7),x,2)) && dw_fp_match(3,vl,r3,dw_rvv_slide_up(dw_fp8(a0,a1,a2,a3,a4,a5,a6,a7),x,3)) && dw_fp_match(4,vl,r4,dw_rvv_slide_up(dw_fp8(a0,a1,a2,a3,a4,a5,a6,a7),x,4)) && dw_fp_match(5,vl,r5,dw_rvv_slide_up(dw_fp8(a0,a1,a2,a3,a4,a5,a6,a7),x,5)) && dw_fp_match(6,vl,r6,dw_rvv_slide_up(dw_fp8(a0,a1,a2,a3,a4,a5,a6,a7),x,6)) && dw_fp_match(7,vl,r7,dw_rvv_slide_up(dw_fp8(a0,a1,a2,a3,a4,a5,a6,a7),x,7)) && store(&(p_a->s0),float,a0) * store(&(p_a->s1),float,a1) * store(&(p_a->s2),float,a2) * store(&(p_a->s3),float,a3) * store(&(p_a->s4),float,a4) * store(&(p_a->s5),float,a5) * store(&(p_a->s6),float,a6) * store(&(p_a->s7),float,a7) * store(&(__return.s0),float,r0) * store(&(__return.s1),float,r1) * store(&(__return.s2),float,r2) * store(&(__return.s3),float,r3) * store(&(__return.s4),float,r4) * store(&(__return.s5),float,r5) * store(&(__return.s6),float,r6) * store(&(__return.s7),float,r7) */;
vfloat32m2_t dw_r_down(const vfloat32m2_t *p_a,float x,size_t vl)
/*@ With (a0:fp32) (a1:fp32) (a2:fp32) (a3:fp32) (a4:fp32) (a5:fp32) (a6:fp32) (a7:fp32)
 Require 0<=vl && vl<=8 && store(&(p_a->s0),float,a0) * store(&(p_a->s1),float,a1) * store(&(p_a->s2),float,a2) * store(&(p_a->s3),float,a3) * store(&(p_a->s4),float,a4) * store(&(p_a->s5),float,a5) * store(&(p_a->s6),float,a6) * store(&(p_a->s7),float,a7)
 Ensure exists (r0:fp32) (r1:fp32) (r2:fp32) (r3:fp32) (r4:fp32) (r5:fp32) (r6:fp32) (r7:fp32), dw_fp_match(0,vl,r0,dw_rvv_slide_down(dw_fp8(a0,a1,a2,a3,a4,a5,a6,a7),x,vl,0)) && dw_fp_match(1,vl,r1,dw_rvv_slide_down(dw_fp8(a0,a1,a2,a3,a4,a5,a6,a7),x,vl,1)) && dw_fp_match(2,vl,r2,dw_rvv_slide_down(dw_fp8(a0,a1,a2,a3,a4,a5,a6,a7),x,vl,2)) && dw_fp_match(3,vl,r3,dw_rvv_slide_down(dw_fp8(a0,a1,a2,a3,a4,a5,a6,a7),x,vl,3)) && dw_fp_match(4,vl,r4,dw_rvv_slide_down(dw_fp8(a0,a1,a2,a3,a4,a5,a6,a7),x,vl,4)) && dw_fp_match(5,vl,r5,dw_rvv_slide_down(dw_fp8(a0,a1,a2,a3,a4,a5,a6,a7),x,vl,5)) && dw_fp_match(6,vl,r6,dw_rvv_slide_down(dw_fp8(a0,a1,a2,a3,a4,a5,a6,a7),x,vl,6)) && dw_fp_match(7,vl,r7,dw_rvv_slide_down(dw_fp8(a0,a1,a2,a3,a4,a5,a6,a7),x,vl,7)) && store(&(p_a->s0),float,a0) * store(&(p_a->s1),float,a1) * store(&(p_a->s2),float,a2) * store(&(p_a->s3),float,a3) * store(&(p_a->s4),float,a4) * store(&(p_a->s5),float,a5) * store(&(p_a->s6),float,a6) * store(&(p_a->s7),float,a7) * store(&(__return.s0),float,r0) * store(&(__return.s1),float,r1) * store(&(__return.s2),float,r2) * store(&(__return.s3),float,r3) * store(&(__return.s4),float,r4) * store(&(__return.s5),float,r5) * store(&(__return.s6),float,r6) * store(&(__return.s7),float,r7) */;
/*@ Import Coq Require Import DwChw.Types */
/*@ Import Coq Require Import DwChw.ControlModel */
/*@ Extern Coq (dw_doz_model:Z -> Z -> Z) (unsigned_last_nbits:Z -> Z -> Z) */
uint32x4_t dw_mask_words(const int32_t *p)
/*@ With (a0:Z) (a1:Z) (a2:Z) (a3:Z)
 Require store(p+0,int,a0) * store(p+1,int,a1) * store(p+2,int,a2) * store(p+3,int,a3)
 Ensure store(p+0,int,a0) * store(p+1,int,a1) * store(p+2,int,a2) * store(p+3,int,a3) * store(&(__return.s0),unsigned int,unsigned_last_nbits(a0,32)) * store(&(__return.s1),unsigned int,unsigned_last_nbits(a1,32)) * store(&(__return.s2),unsigned int,unsigned_last_nbits(a2,32)) * store(&(__return.s3),unsigned int,unsigned_last_nbits(a3,32)) */;
void dw_assert(int b)
/*@ Require b!=0 && emp Ensure emp */;
size_t dw_round_up_po2(size_t n,size_t q)
/*@ Require 0<=n && q==16 && n<=18446744073709551600 && emp
 Ensure __return==((n+15)/16)*16 && emp */;
size_t dw_doz(size_t n,size_t q)
/*@ Require 0<=n && n<=18446744073709551615 && q==3 && emp
 Ensure __return==dw_doz_model(n,q) && emp */;
/*@ Import Coq Require Import DwChw.Store8Model */
/*@ Extern Coq (dw_same:fp32->fp32->Prop)
 (dw_values8:fp32->fp32->fp32->fp32->fp32->fp32->fp32->fp32->Z->list fp32)
 (FloatArray::full:Z->Z->list fp32->Assertion)
 (FloatArray::undef_full:Z->Z->Assertion)
 (FloatArray::undef_seg:Z->Z->Z->Assertion) */
void __riscv_vse32_v_f32m2(float *p,vfloat32m2_t a,size_t vl)
/*@ With (a0:fp32) (a1:fp32) (a2:fp32) (a3:fp32) (a4:fp32) (a5:fp32) (a6:fp32) (a7:fp32) Require 0<=vl && vl<=8 && FloatArray::undef_full(p,vl) * store(&(a.s0),float,a0) * store(&(a.s1),float,a1) * store(&(a.s2),float,a2) * store(&(a.s3),float,a3) * store(&(a.s4),float,a4) * store(&(a.s5),float,a5) * store(&(a.s6),float,a6) * store(&(a.s7),float,a7) Ensure FloatArray::full(p,vl,dw_values8(a0,a1,a2,a3,a4,a5,a6,a7,vl)) */;
/*@ include strategies "../proof/c/float_store.strategies" */
float dw_get8(const vfloat32m2_t *v,size_t k)
/*@ With (a0:fp32) (a1:fp32) (a2:fp32) (a3:fp32) (a4:fp32) (a5:fp32) (a6:fp32) (a7:fp32)
 Require 0<=k && k<8 && store(&(v->s0),float,a0) * store(&(v->s1),float,a1) * store(&(v->s2),float,a2) * store(&(v->s3),float,a3) * store(&(v->s4),float,a4) * store(&(v->s5),float,a5) * store(&(v->s6),float,a6) * store(&(v->s7),float,a7)
 Ensure dw_same(__return,dw_fp8(a0,a1,a2,a3,a4,a5,a6,a7,k)) && store(&(v->s0),float,a0) * store(&(v->s1),float,a1) * store(&(v->s2),float,a2) * store(&(v->s3),float,a3) * store(&(v->s4),float,a4) * store(&(v->s5),float,a5) * store(&(v->s6),float,a6) * store(&(v->s7),float,a7) */;
void dw_store8(float *out,const vfloat32m2_t *v,size_t vl)
/*@ With (a0:fp32) (a1:fp32) (a2:fp32) (a3:fp32) (a4:fp32) (a5:fp32) (a6:fp32) (a7:fp32)
 Require 0<=vl && vl<=8 && store(&(v->s0),float,a0) * store(&(v->s1),float,a1) * store(&(v->s2),float,a2) * store(&(v->s3),float,a3) * store(&(v->s4),float,a4) * store(&(v->s5),float,a5) * store(&(v->s6),float,a6) * store(&(v->s7),float,a7) * FloatArray::undef_full(out,vl)
 Ensure store(&(v->s0),float,a0) * store(&(v->s1),float,a1) * store(&(v->s2),float,a2) * store(&(v->s3),float,a3) * store(&(v->s4),float,a4) * store(&(v->s5),float,a5) * store(&(v->s6),float,a6) * store(&(v->s7),float,a7) * FloatArray::full(out,vl,dw_values8(a0,a1,a2,a3,a4,a5,a6,a7,vl)) */;
/*@ include strategies "../proof/c/dw_maps.strategies" */
/*@ include strategies "../proof/c/dw_output.strategies" */
/* Original-ISA store boundary, source-reviewed for final human approval.
 * Pointer arguments are semantic vector views, not a claimed physical ABI.
 * These declarations have no C helper implementation or body-proof credit.
 * Each active store lane updates one shared owner; no output alias is excluded. */
void dw_isa_store4(float *p,const float32x4_t *v)
/*@ With (W:list Z) (O:DwOutput) (a0:fp32) (a1:fp32) (a2:fp32) (a3:fp32)
 Require dw_distinct(W) && dw_write_window(W,p,4) && store(&(v->s0),float,a0) * store(&(v->s1),float,a1) * store(&(v->s2),float,a2) * store(&(v->s3),float,a3) * dw_output(W,O)
 Ensure store(&(v->s0),float,a0) * store(&(v->s1),float,a1) * store(&(v->s2),float,a2) * store(&(v->s3),float,a3) * dw_output(W,dw_write_values(O,p,dw_pack4(a0,a1,a2,a3))) */;
void dw_isa_store2(float *p,const float32x2_t *v)
/*@ With (W:list Z) (O:DwOutput) (a0:fp32) (a1:fp32)
 Require dw_distinct(W) && dw_write_window(W,p,2) && store(&(v->s0),float,a0) * store(&(v->s1),float,a1) * dw_output(W,O)
 Ensure store(&(v->s0),float,a0) * store(&(v->s1),float,a1) * dw_output(W,dw_write_values(O,p,dw_pack2(a0,a1))) */;
void dw_isa_store1(float *p,const float32x2_t *v,int lane)
/*@ With (W:list Z) (O:DwOutput) (a0:fp32) (a1:fp32)
 Require 0<=lane && lane<2 && dw_distinct(W) && dw_write_window(W,p,1) && store(&(v->s0),float,a0) * store(&(v->s1),float,a1) * dw_output(W,O)
 Ensure store(&(v->s0),float,a0) * store(&(v->s1),float,a1) * dw_output(W,dw_output_put(O,p,dw_fp2(a0,a1,lane))) */;
void dw_isa_storervv(float *p,const vfloat32m2_t *v,size_t vl)
/*@ With (W:list Z) (O:DwOutput) (a0:fp32) (a1:fp32) (a2:fp32) (a3:fp32) (a4:fp32) (a5:fp32) (a6:fp32) (a7:fp32)
 Require 0<=vl && vl<=8 && dw_distinct(W) && dw_store_allowed(W,p,vl) && store(&(v->s0),float,a0) * store(&(v->s1),float,a1) * store(&(v->s2),float,a2) * store(&(v->s3),float,a3) * store(&(v->s4),float,a4) * store(&(v->s5),float,a5) * store(&(v->s6),float,a6) * store(&(v->s7),float,a7) * dw_output(W,O)
 Ensure store(&(v->s0),float,a0) * store(&(v->s1),float,a1) * store(&(v->s2),float,a2) * store(&(v->s3),float,a3) * store(&(v->s4),float,a4) * store(&(v->s5),float,a5) * store(&(v->s6),float,a6) * store(&(v->s7),float,a7) * dw_output(W,dw_write_values(O,p,dw_values8(a0,a1,a2,a3,a4,a5,a6,a7,vl))) */;
/*@ Import Coq Require Import DwChw.ProgressModel */
/*@ Extern Coq (dw_inputs:DwROMap->Z->Z->Z->Z->Z->Z->Prop)
 (dw_footprint:Z->Z->Prop) (dw_addresses:Z->Z->Z->list Z)
 (dw_row_base:Z->Z->Z->Z->Z->Z) (dw_store_row:Z->Z->Z->Z)
 (dw_prev:DwROMap->Z->Z->fp32)
 (dw_neon_results:DwROMap->Z->Z->Z->Z->Z->fp32->fp32->Z->fp32)
 (dw_rvv_results:DwROMap->Z->Z->Z->Z->Z->fp32->fp32->Z->fp32)
 (dw_progress:(Z->fp32)->DwOutput->Z->Z->Z->Z->Z->DwOutput)
 (dw_outer_pointers:Z->Z->Z->Z->Z->Z->Z->Z->Z->Z->Z->Z->Z->Z->Prop) */
float dw_read_scalar(const float *p)
/*@ With (F:DwROMap) Require dw_present(F,p) && dw_data(F)
 Ensure dw_same(__return,dw_get(F,p)) && dw_data(F) */;
/*@ Import Coq Require Import DwChw.VectorPixelModel */
/*@ Extern Coq (dw_vector_pixel:DwROMap->Z->(Z->fp32)->(Z->fp32)->(Z->fp32)->fp32->fp32->fp32->fp32->fp32->fp32->fp32->fp32->Z->Z->fp32) (dw_vector_match8:Z->fp32->fp32->fp32->fp32->fp32->fp32->fp32->fp32->(Z->fp32)->Prop) */
vfloat32m2_t dw_vector_pixel_compute(const vfloat32m2_t*p0,const vfloat32m2_t*p1,const vfloat32m2_t*p2,const float*weights,float prev0,float prev1,float prev2,float next0,float next1,float next2,float lo,float hi,size_t vl)
/*@ With (F:DwROMap) (a00:fp32) (a01:fp32) (a02:fp32) (a03:fp32) (a04:fp32) (a05:fp32) (a06:fp32) (a07:fp32) (a10:fp32) (a11:fp32) (a12:fp32) (a13:fp32) (a14:fp32) (a15:fp32) (a16:fp32) (a17:fp32) (a20:fp32) (a21:fp32) (a22:fp32) (a23:fp32) (a24:fp32) (a25:fp32) (a26:fp32) (a27:fp32) Require 0<=vl && vl<=8 && dw_window(F,weights,10) && dw_data(F) * store(&(p0->s0),float,a00) * store(&(p0->s1),float,a01) * store(&(p0->s2),float,a02) * store(&(p0->s3),float,a03) * store(&(p0->s4),float,a04) * store(&(p0->s5),float,a05) * store(&(p0->s6),float,a06) * store(&(p0->s7),float,a07) * store(&(p1->s0),float,a10) * store(&(p1->s1),float,a11) * store(&(p1->s2),float,a12) * store(&(p1->s3),float,a13) * store(&(p1->s4),float,a14) * store(&(p1->s5),float,a15) * store(&(p1->s6),float,a16) * store(&(p1->s7),float,a17) * store(&(p2->s0),float,a20) * store(&(p2->s1),float,a21) * store(&(p2->s2),float,a22) * store(&(p2->s3),float,a23) * store(&(p2->s4),float,a24) * store(&(p2->s5),float,a25) * store(&(p2->s6),float,a26) * store(&(p2->s7),float,a27) Ensure exists (r0:fp32) (r1:fp32) (r2:fp32) (r3:fp32) (r4:fp32) (r5:fp32) (r6:fp32) (r7:fp32), dw_vector_match8(vl,r0,r1,r2,r3,r4,r5,r6,r7,dw_vector_pixel(F,weights,dw_fp8(a00,a01,a02,a03,a04,a05,a06,a07),dw_fp8(a10,a11,a12,a13,a14,a15,a16,a17),dw_fp8(a20,a21,a22,a23,a24,a25,a26,a27),prev0,prev1,prev2,next0,next1,next2,lo,hi,vl)) && dw_data(F) * store(&(p0->s0),float,a00) * store(&(p0->s1),float,a01) * store(&(p0->s2),float,a02) * store(&(p0->s3),float,a03) * store(&(p0->s4),float,a04) * store(&(p0->s5),float,a05) * store(&(p0->s6),float,a06) * store(&(p0->s7),float,a07) * store(&(p1->s0),float,a10) * store(&(p1->s1),float,a11) * store(&(p1->s2),float,a12) * store(&(p1->s3),float,a13) * store(&(p1->s4),float,a14) * store(&(p1->s5),float,a15) * store(&(p1->s6),float,a16) * store(&(p1->s7),float,a17) * store(&(p2->s0),float,a20) * store(&(p2->s1),float,a21) * store(&(p2->s2),float,a22) * store(&(p2->s3),float,a23) * store(&(p2->s4),float,a24) * store(&(p2->s5),float,a25) * store(&(p2->s6),float,a26) * store(&(p2->s7),float,a27) * store(&(__return.s0),float,r0) * store(&(__return.s1),float,r1) * store(&(__return.s2),float,r2) * store(&(__return.s3),float,r3) * store(&(__return.s4),float,r4) * store(&(__return.s5),float,r5) * store(&(__return.s6),float,r6) * store(&(__return.s7),float,r7) */;
void test_rvv(
    size_t input_height,
    size_t input_width,
    const float* input,
    const float* weights,
    const float* zero,
    float* output,
    uint32_t padding_top,
    const struct xnn_f32_minmax_params* restrict params)
/*@ With (F:DwROMap) (O:DwOutput) (W:list Z) (H:Z) (N:Z) (Input:Z) (Zero:Z) (Weights:Z) (Output:Z) (Params:Z) (Lo:fp32) (Hi:fp32) Require 0<H && 0<N && H<=18446744073709551615 && 4*N<=18446744073709551615 && input_width%4==0 && input_height==H && input_width==4*N && input==Input && zero==Zero && weights==Weights && output==Output && params==Params && padding_top==1 && dw_inputs(F,Input,Zero,Weights,Params,H,N) && dw_present(F,&(params->scalar.min)) && dw_present(F,&(params->scalar.max)) && dw_same(dw_get(F,&(params->scalar.min)),Lo) && dw_same(dw_get(F,&(params->scalar.max)),Hi) && W==dw_addresses(Output,H,N) && dw_distinct(W) && dw_footprint(Output,H*N) && dw_data(F) * dw_output(W,O) Ensure dw_data(F) * dw_output(W,dw_progress(dw_rvv_results(F,Input,Zero,Weights,H,N,Lo,Hi),O,Output,H,N,H,0)) */
{
  dw_assert(input_height != 0);
  dw_assert(input_width != 0);
  dw_assert(input_width % sizeof(float) == 0);
  dw_assert(padding_top == 1);
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
    if (output_height < 2) {
      i2 = zero;
      o1 = o0;
    }
    if (output_height < 3) {
      i3 = zero;
      o2 = o1;
    }
    if (output_height < 4) {
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
    /*@ Inv Assert 0<H && 0<N && H<=18446744073709551615 && 4*N<=18446744073709551615 && input_width%4==0 && input_height==H && input_width==4*N && input==Input && zero==Zero && weights==Weights && output==Output && params==Params && padding_top==1 && dw_inputs(F,Input,Zero,Weights,Params,H,N) && dw_present(F,&(params->scalar.min)) && dw_present(F,&(params->scalar.max)) && dw_same(dw_get(F,&(params->scalar.min)),Lo) && dw_same(dw_get(F,&(params->scalar.max)),Hi) && W==dw_addresses(Output,H,N) && dw_distinct(W) && dw_footprint(Output,H*N) && 0<output_height && output_height<=H && 0<=w && w<=N && orig_i3==dw_row_base(Input,Zero,H,N,H-output_height+2) && orig_i4==dw_row_base(Input,Zero,H,N,H-output_height+3) && i0==dw_row_base(Input,Zero,H,N,H-output_height-1)+4*(N-w) && dw_same(prev_i0,dw_prev(F,dw_row_base(Input,Zero,H,N,H-output_height-1),N-w)) && i1==dw_row_base(Input,Zero,H,N,H-output_height+0)+4*(N-w) && dw_same(prev_i1,dw_prev(F,dw_row_base(Input,Zero,H,N,H-output_height+0),N-w)) && i2==dw_row_base(Input,Zero,H,N,H-output_height+1)+4*(N-w) && dw_same(prev_i2,dw_prev(F,dw_row_base(Input,Zero,H,N,H-output_height+1),N-w)) && i3==dw_row_base(Input,Zero,H,N,H-output_height+2)+4*(N-w) && dw_same(prev_i3,dw_prev(F,dw_row_base(Input,Zero,H,N,H-output_height+2),N-w)) && i4==dw_row_base(Input,Zero,H,N,H-output_height+3)+4*(N-w) && dw_same(prev_i4,dw_prev(F,dw_row_base(Input,Zero,H,N,H-output_height+3),N-w)) && o0==Output+4*(dw_store_row(H,H-output_height,0)*N+N-w) && o1==Output+4*(dw_store_row(H,H-output_height,1)*N+N-w) && o2==Output+4*(dw_store_row(H,H-output_height,2)*N+N-w) && dw_data(F) * dw_output(W,dw_progress(dw_rvv_results(F,Input,Zero,Weights,H,N,Lo,Hi),O,Output,H,N,H-output_height,N-w)) */
    while (w > 0) {
      size_t vl = __riscv_vsetvl_e32m2(w);
      vfloat32m2_t vi0 = __riscv_vle32_v_f32m2(i0, vl) /*@ where F=F */;
      vfloat32m2_t vi1 = __riscv_vle32_v_f32m2(i1, vl) /*@ where F=F */;
      vfloat32m2_t vi2 = __riscv_vle32_v_f32m2(i2, vl) /*@ where F=F */;
      vfloat32m2_t vi3 = __riscv_vle32_v_f32m2(i3, vl) /*@ where F=F */;
      vfloat32m2_t vi4 = __riscv_vle32_v_f32m2(i4, vl) /*@ where F=F */;
      const float next_i0 = (w > vl) ? dw_read_scalar(&(i0[vl])) /*@ where F=F */ : 0.0f;
      const float next_i1 = (w > vl) ? dw_read_scalar(&(i1[vl])) /*@ where F=F */ : 0.0f;
      const float next_i2 = (w > vl) ? dw_read_scalar(&(i2[vl])) /*@ where F=F */ : 0.0f;
      const float next_i3 = (w > vl) ? dw_read_scalar(&(i3[vl])) /*@ where F=F */ : 0.0f;
      const float next_i4 = (w > vl) ? dw_read_scalar(&(i4[vl])) /*@ where F=F */ : 0.0f;
      vfloat32m2_t vo0 = dw_vector_pixel_compute(&vi0,&vi1,&vi2,weights,prev_i0,prev_i1,prev_i2,next_i0,next_i1,next_i2,dw_read_scalar(&(params->scalar.min)) /*@ where F=F */,dw_read_scalar(&(params->scalar.max)) /*@ where F=F */,vl) /*@ where F=F,a00=vi0.s0,a01=vi0.s1,a02=vi0.s2,a03=vi0.s3,a04=vi0.s4,a05=vi0.s5,a06=vi0.s6,a07=vi0.s7,a10=vi1.s0,a11=vi1.s1,a12=vi1.s2,a13=vi1.s3,a14=vi1.s4,a15=vi1.s5,a16=vi1.s6,a17=vi1.s7,a20=vi2.s0,a21=vi2.s1,a22=vi2.s2,a23=vi2.s3,a24=vi2.s4,a25=vi2.s5,a26=vi2.s6,a27=vi2.s7 */;
      vfloat32m2_t vo1 = dw_vector_pixel_compute(&vi1,&vi2,&vi3,weights,prev_i1,prev_i2,prev_i3,next_i1,next_i2,next_i3,dw_read_scalar(&(params->scalar.min)) /*@ where F=F */,dw_read_scalar(&(params->scalar.max)) /*@ where F=F */,vl) /*@ where F=F,a00=vi1.s0,a01=vi1.s1,a02=vi1.s2,a03=vi1.s3,a04=vi1.s4,a05=vi1.s5,a06=vi1.s6,a07=vi1.s7,a10=vi2.s0,a11=vi2.s1,a12=vi2.s2,a13=vi2.s3,a14=vi2.s4,a15=vi2.s5,a16=vi2.s6,a17=vi2.s7,a20=vi3.s0,a21=vi3.s1,a22=vi3.s2,a23=vi3.s3,a24=vi3.s4,a25=vi3.s5,a26=vi3.s6,a27=vi3.s7 */;
      vfloat32m2_t vo2 = dw_vector_pixel_compute(&vi2,&vi3,&vi4,weights,prev_i2,prev_i3,prev_i4,next_i2,next_i3,next_i4,dw_read_scalar(&(params->scalar.min)) /*@ where F=F */,dw_read_scalar(&(params->scalar.max)) /*@ where F=F */,vl) /*@ where F=F,a00=vi2.s0,a01=vi2.s1,a02=vi2.s2,a03=vi2.s3,a04=vi2.s4,a05=vi2.s5,a06=vi2.s6,a07=vi2.s7,a10=vi3.s0,a11=vi3.s1,a12=vi3.s2,a13=vi3.s3,a14=vi3.s4,a15=vi3.s5,a16=vi3.s6,a17=vi3.s7,a20=vi4.s0,a21=vi4.s1,a22=vi4.s2,a23=vi4.s3,a24=vi4.s4,a25=vi4.s5,a26=vi4.s6,a27=vi4.s7 */;
      dw_isa_storervv((o2),&(vo2),(vl)) /*@ where W=W,v=&vo2,a0=vo2.s0,a1=vo2.s1,a2=vo2.s2,a3=vo2.s3,a4=vo2.s4,a5=vo2.s5,a6=vo2.s6,a7=vo2.s7 */;
      dw_isa_storervv((o1),&(vo1),(vl)) /*@ where W=W,v=&vo1,a0=vo1.s0,a1=vo1.s1,a2=vo1.s2,a3=vo1.s3,a4=vo1.s4,a5=vo1.s5,a6=vo1.s6,a7=vo1.s7 */;
      dw_isa_storervv((o0),&(vo0),(vl)) /*@ where W=W,v=&vo0,a0=vo0.s0,a1=vo0.s1,a2=vo0.s2,a3=vo0.s3,a4=vo0.s4,a5=vo0.s5,a6=vo0.s6,a7=vo0.s7 */;
      prev_i0 = dw_read_scalar(&(i0[vl - 1])) /*@ where F=F */;
      prev_i1 = dw_read_scalar(&(i1[vl - 1])) /*@ where F=F */;
      prev_i2 = dw_read_scalar(&(i2[vl - 1])) /*@ where F=F */;
      prev_i3 = dw_read_scalar(&(i3[vl - 1])) /*@ where F=F */;
      prev_i4 = dw_read_scalar(&(i4[vl - 1])) /*@ where F=F */;
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
  } /*@ Inv Assert 0<H && 0<N && H<=18446744073709551615 && 4*N<=18446744073709551615 && input_width%4==0 && input_height==H && input_width==4*N && input==Input && zero==Zero && weights==Weights && output==Output && params==Params && padding_top==1 && dw_inputs(F,Input,Zero,Weights,Params,H,N) && dw_present(F,&(params->scalar.min)) && dw_present(F,&(params->scalar.max)) && dw_same(dw_get(F,&(params->scalar.min)),Lo) && dw_same(dw_get(F,&(params->scalar.max)),Hi) && W==dw_addresses(Output,H,N) && dw_distinct(W) && dw_footprint(Output,H*N) && 0<=output_height && output_height<=H && dw_outer_pointers(Input,Zero,Output,H,N,output_height,i0,i1,i2,i3,i4,o0,o1,o2) && dw_data(F) * dw_output(W,dw_progress(dw_rvv_results(F,Input,Zero,Weights,H,N,Lo,Hi),O,Output,H,N,H-output_height,0)) */ while (output_height != 0);
}
