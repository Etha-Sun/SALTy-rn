/*@ Import Coq Require Import VCMul.Model */
/*@ Extern Coq (same_fp32 : fp32 -> fp32 -> Prop)
 (vcmul_mla : fp32 -> fp32 -> fp32 -> fp32)
 (vcmul_mls : fp32 -> fp32 -> fp32 -> fp32)
 (vcmul_active_mul : Z -> Z -> fp32 -> fp32 -> fp32)
 (vcmul_active_add : Z -> Z -> fp32 -> fp32 -> fp32)
 (vcmul_active_sub : Z -> Z -> fp32 -> fp32 -> fp32) */
typedef unsigned long long size_t;
typedef unsigned long long uintptr_t;
struct xnn_f32_default_params { char _; };
typedef struct float32x4_t { float s0; float s1; float s2; float s3; } float32x4_t;
typedef struct float32x2_t { float s0; float s1; } float32x2_t;
typedef struct vfloat32m4_t { float s0; float s1; float s2; float s3; float s4; float s5; float s6; float s7; float s8; float s9; float s10; float s11; float s12; float s13; float s14; float s15; } vfloat32m4_t;
float qcp_vcmul_mul(float a,float b)
/*@ Require emp Ensure same_fp32(__return,fp32_mul(a,b)) && emp */;
float qcp_vcmul_add(float a,float b)
/*@ Require emp Ensure same_fp32(__return,fp32_add(a,b)) && emp */;
float qcp_vcmul_sub(float a,float b)
/*@ Require emp Ensure same_fp32(__return,fp32_sub(a,b)) && emp */;
float qcp_vcmul_mla(float a,float b,float c)
/*@ Require emp Ensure same_fp32(__return,vcmul_mla(a,b,c)) && emp */;
float qcp_vcmul_mls(float a,float b,float c)
/*@ Require emp Ensure same_fp32(__return,vcmul_mls(a,b,c)) && emp */;
float qcp_vcmul_active_mul(float a,float b,unsigned long long i,unsigned long long vl)
/*@ Require 0<=i && i<16 && 0<=vl && vl<=16 && emp Ensure same_fp32(__return,vcmul_active_mul(i,vl,a,b)) && emp */;
float qcp_vcmul_active_add(float a,float b,unsigned long long i,unsigned long long vl)
/*@ Require 0<=i && i<16 && 0<=vl && vl<=16 && emp Ensure same_fp32(__return,vcmul_active_add(i,vl,a,b)) && emp */;
float qcp_vcmul_active_sub(float a,float b,unsigned long long i,unsigned long long vl)
/*@ Require 0<=i && i<16 && 0<=vl && vl<=16 && emp Ensure same_fp32(__return,vcmul_active_sub(i,vl,a,b)) && emp */;
float32x4_t vmulq_f32(float32x4_t a,float32x4_t b)
/*@ With (a0:fp32) (a1:fp32) (a2:fp32) (a3:fp32) (b0:fp32) (b1:fp32) (b2:fp32) (b3:fp32)
 Require store(&(a.s0),float,a0) * store(&(a.s1),float,a1) * store(&(a.s2),float,a2) * store(&(a.s3),float,a3) * store(&(b.s0),float,b0) * store(&(b.s1),float,b1) * store(&(b.s2),float,b2) * store(&(b.s3),float,b3)
 Ensure store(&(__return.s0),float,fp32_mul(a0,b0)) * store(&(__return.s1),float,fp32_mul(a1,b1)) * store(&(__return.s2),float,fp32_mul(a2,b2)) * store(&(__return.s3),float,fp32_mul(a3,b3)) */;
float32x4_t vmlaq_f32(float32x4_t a,float32x4_t b,float32x4_t c)
/*@ With (a0:fp32) (a1:fp32) (a2:fp32) (a3:fp32) (b0:fp32) (b1:fp32) (b2:fp32) (b3:fp32) (c0:fp32) (c1:fp32) (c2:fp32) (c3:fp32)
 Require store(&(a.s0),float,a0) * store(&(a.s1),float,a1) * store(&(a.s2),float,a2) * store(&(a.s3),float,a3) * store(&(b.s0),float,b0) * store(&(b.s1),float,b1) * store(&(b.s2),float,b2) * store(&(b.s3),float,b3) * store(&(c.s0),float,c0) * store(&(c.s1),float,c1) * store(&(c.s2),float,c2) * store(&(c.s3),float,c3)
 Ensure store(&(__return.s0),float,vcmul_mla(a0,b0,c0)) * store(&(__return.s1),float,vcmul_mla(a1,b1,c1)) * store(&(__return.s2),float,vcmul_mla(a2,b2,c2)) * store(&(__return.s3),float,vcmul_mla(a3,b3,c3)) */;
float32x4_t vmlsq_f32(float32x4_t a,float32x4_t b,float32x4_t c)
/*@ With (a0:fp32) (a1:fp32) (a2:fp32) (a3:fp32) (b0:fp32) (b1:fp32) (b2:fp32) (b3:fp32) (c0:fp32) (c1:fp32) (c2:fp32) (c3:fp32)
 Require store(&(a.s0),float,a0) * store(&(a.s1),float,a1) * store(&(a.s2),float,a2) * store(&(a.s3),float,a3) * store(&(b.s0),float,b0) * store(&(b.s1),float,b1) * store(&(b.s2),float,b2) * store(&(b.s3),float,b3) * store(&(c.s0),float,c0) * store(&(c.s1),float,c1) * store(&(c.s2),float,c2) * store(&(c.s3),float,c3)
 Ensure store(&(__return.s0),float,vcmul_mls(a0,b0,c0)) * store(&(__return.s1),float,vcmul_mls(a1,b1,c1)) * store(&(__return.s2),float,vcmul_mls(a2,b2,c2)) * store(&(__return.s3),float,vcmul_mls(a3,b3,c3)) */;
vfloat32m4_t __riscv_vfmul_vv_f32m4(vfloat32m4_t a,vfloat32m4_t b,size_t vl)
/*@ With (a0:fp32) (a1:fp32) (a2:fp32) (a3:fp32) (a4:fp32) (a5:fp32) (a6:fp32) (a7:fp32) (a8:fp32) (a9:fp32) (a10:fp32) (a11:fp32) (a12:fp32) (a13:fp32) (a14:fp32) (a15:fp32) (b0:fp32) (b1:fp32) (b2:fp32) (b3:fp32) (b4:fp32) (b5:fp32) (b6:fp32) (b7:fp32) (b8:fp32) (b9:fp32) (b10:fp32) (b11:fp32) (b12:fp32) (b13:fp32) (b14:fp32) (b15:fp32)
 Require 0<=vl && vl<=16 && store(&(a.s0),float,a0) * store(&(a.s1),float,a1) * store(&(a.s2),float,a2) * store(&(a.s3),float,a3) * store(&(a.s4),float,a4) * store(&(a.s5),float,a5) * store(&(a.s6),float,a6) * store(&(a.s7),float,a7) * store(&(a.s8),float,a8) * store(&(a.s9),float,a9) * store(&(a.s10),float,a10) * store(&(a.s11),float,a11) * store(&(a.s12),float,a12) * store(&(a.s13),float,a13) * store(&(a.s14),float,a14) * store(&(a.s15),float,a15) * store(&(b.s0),float,b0) * store(&(b.s1),float,b1) * store(&(b.s2),float,b2) * store(&(b.s3),float,b3) * store(&(b.s4),float,b4) * store(&(b.s5),float,b5) * store(&(b.s6),float,b6) * store(&(b.s7),float,b7) * store(&(b.s8),float,b8) * store(&(b.s9),float,b9) * store(&(b.s10),float,b10) * store(&(b.s11),float,b11) * store(&(b.s12),float,b12) * store(&(b.s13),float,b13) * store(&(b.s14),float,b14) * store(&(b.s15),float,b15)
 Ensure store(&(__return.s0),float,vcmul_active_mul(0,vl,a0,b0)) * store(&(__return.s1),float,vcmul_active_mul(1,vl,a1,b1)) * store(&(__return.s2),float,vcmul_active_mul(2,vl,a2,b2)) * store(&(__return.s3),float,vcmul_active_mul(3,vl,a3,b3)) * store(&(__return.s4),float,vcmul_active_mul(4,vl,a4,b4)) * store(&(__return.s5),float,vcmul_active_mul(5,vl,a5,b5)) * store(&(__return.s6),float,vcmul_active_mul(6,vl,a6,b6)) * store(&(__return.s7),float,vcmul_active_mul(7,vl,a7,b7)) * store(&(__return.s8),float,vcmul_active_mul(8,vl,a8,b8)) * store(&(__return.s9),float,vcmul_active_mul(9,vl,a9,b9)) * store(&(__return.s10),float,vcmul_active_mul(10,vl,a10,b10)) * store(&(__return.s11),float,vcmul_active_mul(11,vl,a11,b11)) * store(&(__return.s12),float,vcmul_active_mul(12,vl,a12,b12)) * store(&(__return.s13),float,vcmul_active_mul(13,vl,a13,b13)) * store(&(__return.s14),float,vcmul_active_mul(14,vl,a14,b14)) * store(&(__return.s15),float,vcmul_active_mul(15,vl,a15,b15)) */;
vfloat32m4_t __riscv_vfadd_vv_f32m4(vfloat32m4_t a,vfloat32m4_t b,size_t vl)
/*@ With (a0:fp32) (a1:fp32) (a2:fp32) (a3:fp32) (a4:fp32) (a5:fp32) (a6:fp32) (a7:fp32) (a8:fp32) (a9:fp32) (a10:fp32) (a11:fp32) (a12:fp32) (a13:fp32) (a14:fp32) (a15:fp32) (b0:fp32) (b1:fp32) (b2:fp32) (b3:fp32) (b4:fp32) (b5:fp32) (b6:fp32) (b7:fp32) (b8:fp32) (b9:fp32) (b10:fp32) (b11:fp32) (b12:fp32) (b13:fp32) (b14:fp32) (b15:fp32)
 Require 0<=vl && vl<=16 && store(&(a.s0),float,a0) * store(&(a.s1),float,a1) * store(&(a.s2),float,a2) * store(&(a.s3),float,a3) * store(&(a.s4),float,a4) * store(&(a.s5),float,a5) * store(&(a.s6),float,a6) * store(&(a.s7),float,a7) * store(&(a.s8),float,a8) * store(&(a.s9),float,a9) * store(&(a.s10),float,a10) * store(&(a.s11),float,a11) * store(&(a.s12),float,a12) * store(&(a.s13),float,a13) * store(&(a.s14),float,a14) * store(&(a.s15),float,a15) * store(&(b.s0),float,b0) * store(&(b.s1),float,b1) * store(&(b.s2),float,b2) * store(&(b.s3),float,b3) * store(&(b.s4),float,b4) * store(&(b.s5),float,b5) * store(&(b.s6),float,b6) * store(&(b.s7),float,b7) * store(&(b.s8),float,b8) * store(&(b.s9),float,b9) * store(&(b.s10),float,b10) * store(&(b.s11),float,b11) * store(&(b.s12),float,b12) * store(&(b.s13),float,b13) * store(&(b.s14),float,b14) * store(&(b.s15),float,b15)
 Ensure store(&(__return.s0),float,vcmul_active_add(0,vl,a0,b0)) * store(&(__return.s1),float,vcmul_active_add(1,vl,a1,b1)) * store(&(__return.s2),float,vcmul_active_add(2,vl,a2,b2)) * store(&(__return.s3),float,vcmul_active_add(3,vl,a3,b3)) * store(&(__return.s4),float,vcmul_active_add(4,vl,a4,b4)) * store(&(__return.s5),float,vcmul_active_add(5,vl,a5,b5)) * store(&(__return.s6),float,vcmul_active_add(6,vl,a6,b6)) * store(&(__return.s7),float,vcmul_active_add(7,vl,a7,b7)) * store(&(__return.s8),float,vcmul_active_add(8,vl,a8,b8)) * store(&(__return.s9),float,vcmul_active_add(9,vl,a9,b9)) * store(&(__return.s10),float,vcmul_active_add(10,vl,a10,b10)) * store(&(__return.s11),float,vcmul_active_add(11,vl,a11,b11)) * store(&(__return.s12),float,vcmul_active_add(12,vl,a12,b12)) * store(&(__return.s13),float,vcmul_active_add(13,vl,a13,b13)) * store(&(__return.s14),float,vcmul_active_add(14,vl,a14,b14)) * store(&(__return.s15),float,vcmul_active_add(15,vl,a15,b15)) */;
vfloat32m4_t __riscv_vfsub_vv_f32m4(vfloat32m4_t a,vfloat32m4_t b,size_t vl)
/*@ With (a0:fp32) (a1:fp32) (a2:fp32) (a3:fp32) (a4:fp32) (a5:fp32) (a6:fp32) (a7:fp32) (a8:fp32) (a9:fp32) (a10:fp32) (a11:fp32) (a12:fp32) (a13:fp32) (a14:fp32) (a15:fp32) (b0:fp32) (b1:fp32) (b2:fp32) (b3:fp32) (b4:fp32) (b5:fp32) (b6:fp32) (b7:fp32) (b8:fp32) (b9:fp32) (b10:fp32) (b11:fp32) (b12:fp32) (b13:fp32) (b14:fp32) (b15:fp32)
 Require 0<=vl && vl<=16 && store(&(a.s0),float,a0) * store(&(a.s1),float,a1) * store(&(a.s2),float,a2) * store(&(a.s3),float,a3) * store(&(a.s4),float,a4) * store(&(a.s5),float,a5) * store(&(a.s6),float,a6) * store(&(a.s7),float,a7) * store(&(a.s8),float,a8) * store(&(a.s9),float,a9) * store(&(a.s10),float,a10) * store(&(a.s11),float,a11) * store(&(a.s12),float,a12) * store(&(a.s13),float,a13) * store(&(a.s14),float,a14) * store(&(a.s15),float,a15) * store(&(b.s0),float,b0) * store(&(b.s1),float,b1) * store(&(b.s2),float,b2) * store(&(b.s3),float,b3) * store(&(b.s4),float,b4) * store(&(b.s5),float,b5) * store(&(b.s6),float,b6) * store(&(b.s7),float,b7) * store(&(b.s8),float,b8) * store(&(b.s9),float,b9) * store(&(b.s10),float,b10) * store(&(b.s11),float,b11) * store(&(b.s12),float,b12) * store(&(b.s13),float,b13) * store(&(b.s14),float,b14) * store(&(b.s15),float,b15)
 Ensure store(&(__return.s0),float,vcmul_active_sub(0,vl,a0,b0)) * store(&(__return.s1),float,vcmul_active_sub(1,vl,a1,b1)) * store(&(__return.s2),float,vcmul_active_sub(2,vl,a2,b2)) * store(&(__return.s3),float,vcmul_active_sub(3,vl,a3,b3)) * store(&(__return.s4),float,vcmul_active_sub(4,vl,a4,b4)) * store(&(__return.s5),float,vcmul_active_sub(5,vl,a5,b5)) * store(&(__return.s6),float,vcmul_active_sub(6,vl,a6,b6)) * store(&(__return.s7),float,vcmul_active_sub(7,vl,a7,b7)) * store(&(__return.s8),float,vcmul_active_sub(8,vl,a8,b8)) * store(&(__return.s9),float,vcmul_active_sub(9,vl,a9,b9)) * store(&(__return.s10),float,vcmul_active_sub(10,vl,a10,b10)) * store(&(__return.s11),float,vcmul_active_sub(11,vl,a11,b11)) * store(&(__return.s12),float,vcmul_active_sub(12,vl,a12,b12)) * store(&(__return.s13),float,vcmul_active_sub(13,vl,a13,b13)) * store(&(__return.s14),float,vcmul_active_sub(14,vl,a14,b14)) * store(&(__return.s15),float,vcmul_active_sub(15,vl,a15,b15)) */;
/*@ Import Coq Require Import VCMul.RvvMemoryModel */
/*@ Extern Coq (FloatArray::full : Z -> Z -> list fp32 -> Assertion)
 (FloatArray::missing_i : Z -> Z -> Z -> Z -> list fp32 -> Assertion)
 (vcmul_read_lane_model : Z -> Z -> Z -> list fp32 -> fp32)
 (vcmul_vl16 : Z -> Z) */
float qcp_vcmul_read_lane(const float *p,size_t i,size_t vl)
/*@ With (base:Z) (count:Z) (idx:Z) (L:list fp32)
 Require 0<=i && i<16 && 0<=vl && vl<=16 && 0<=idx && idx+vl<=count &&
 p==base+4*idx && FloatArray::full(base,count,L)
 Ensure same_fp32(__return,vcmul_read_lane_model(i,vl,idx,L)) && FloatArray::full(base,count,L) */;
vfloat32m4_t qcp_vcmul_load16(const float *p,size_t vl)
/*@ With (base:Z) (count:Z) (idx:Z) (L:list fp32)
 Require 0<=vl && vl<=16 && 0<=idx && idx+vl<=count && p==base+4*idx && FloatArray::full(base,count,L)
 Ensure FloatArray::full(base,count,L) *
 store(&(__return.s0),float,vcmul_read_lane_model(0,vl,idx,L)) *
 store(&(__return.s1),float,vcmul_read_lane_model(1,vl,idx,L)) *
 store(&(__return.s2),float,vcmul_read_lane_model(2,vl,idx,L)) *
 store(&(__return.s3),float,vcmul_read_lane_model(3,vl,idx,L)) *
 store(&(__return.s4),float,vcmul_read_lane_model(4,vl,idx,L)) *
 store(&(__return.s5),float,vcmul_read_lane_model(5,vl,idx,L)) *
 store(&(__return.s6),float,vcmul_read_lane_model(6,vl,idx,L)) *
 store(&(__return.s7),float,vcmul_read_lane_model(7,vl,idx,L)) *
 store(&(__return.s8),float,vcmul_read_lane_model(8,vl,idx,L)) *
 store(&(__return.s9),float,vcmul_read_lane_model(9,vl,idx,L)) *
 store(&(__return.s10),float,vcmul_read_lane_model(10,vl,idx,L)) *
 store(&(__return.s11),float,vcmul_read_lane_model(11,vl,idx,L)) *
 store(&(__return.s12),float,vcmul_read_lane_model(12,vl,idx,L)) *
 store(&(__return.s13),float,vcmul_read_lane_model(13,vl,idx,L)) *
 store(&(__return.s14),float,vcmul_read_lane_model(14,vl,idx,L)) *
 store(&(__return.s15),float,vcmul_read_lane_model(15,vl,idx,L)) */;
size_t __riscv_vsetvl_e32m4(size_t n)
/*@ Require emp Ensure __return==vcmul_vl16(n) && emp */;
/*@ Import Coq Require Import VCMul.RvvStoreModel */
/*@ Extern Coq
 (FloatArray::full : Z -> Z -> list fp32 -> Assertion)
 (FloatArray::undef_full : Z -> Z -> Assertion)
 (FloatArray::seg : Z -> Z -> Z -> list fp32 -> Assertion)
 (FloatArray::undef_seg : Z -> Z -> Z -> Assertion)
 (rvv_take : Z -> list fp32 -> list fp32)
 (rvv_get : Z -> list fp32 -> fp32)
 (rvv_snoc : list fp32 -> fp32 -> list fp32)
 (rvv_length : list fp32 -> Z)
 (vcmul_pack16 : fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> list fp32) */
float qcp_vcmul_get16(const struct vfloat32m4_t *a,size_t i)
/*@ With (L:list fp32) (x0:fp32) (x1:fp32) (x2:fp32) (x3:fp32) (x4:fp32) (x5:fp32) (x6:fp32) (x7:fp32) (x8:fp32) (x9:fp32) (x10:fp32) (x11:fp32) (x12:fp32) (x13:fp32) (x14:fp32) (x15:fp32)
 Require 0<=i && i<16 && L==vcmul_pack16(x0,x1,x2,x3,x4,x5,x6,x7,x8,x9,x10,x11,x12,x13,x14,x15) && store(&(a->s0),float,x0) * store(&(a->s1),float,x1) * store(&(a->s2),float,x2) * store(&(a->s3),float,x3) * store(&(a->s4),float,x4) * store(&(a->s5),float,x5) * store(&(a->s6),float,x6) * store(&(a->s7),float,x7) * store(&(a->s8),float,x8) * store(&(a->s9),float,x9) * store(&(a->s10),float,x10) * store(&(a->s11),float,x11) * store(&(a->s12),float,x12) * store(&(a->s13),float,x13) * store(&(a->s14),float,x14) * store(&(a->s15),float,x15)
 Ensure same_fp32(__return,rvv_get(i,L)) && store(&(a->s0),float,x0) * store(&(a->s1),float,x1) * store(&(a->s2),float,x2) * store(&(a->s3),float,x3) * store(&(a->s4),float,x4) * store(&(a->s5),float,x5) * store(&(a->s6),float,x6) * store(&(a->s7),float,x7) * store(&(a->s8),float,x8) * store(&(a->s9),float,x9) * store(&(a->s10),float,x10) * store(&(a->s11),float,x11) * store(&(a->s12),float,x12) * store(&(a->s13),float,x13) * store(&(a->s14),float,x14) * store(&(a->s15),float,x15) */;
void qcp_vcmul_store_next(float *p,size_t vl,size_t i,float value)
/*@ With (P:list fp32)
 Require 0<=i && i<vl && vl<=16 && FloatArray::seg(p,0,i,P) * FloatArray::undef_seg(p,i,vl)
 Ensure FloatArray::seg(p,0,i+1,rvv_snoc(P,value)) * FloatArray::undef_seg(p,i+1,vl) */;
void __riscv_vse32_v_f32m4(float *p,const struct vfloat32m4_t *a,size_t vl)
/*@ With (L:list fp32) (x0:fp32) (x1:fp32) (x2:fp32) (x3:fp32) (x4:fp32) (x5:fp32) (x6:fp32) (x7:fp32) (x8:fp32) (x9:fp32) (x10:fp32) (x11:fp32) (x12:fp32) (x13:fp32) (x14:fp32) (x15:fp32)
 Require 0<=vl && vl<=16 && L==vcmul_pack16(x0,x1,x2,x3,x4,x5,x6,x7,x8,x9,x10,x11,x12,x13,x14,x15) && store(&(a->s0),float,x0) * store(&(a->s1),float,x1) * store(&(a->s2),float,x2) * store(&(a->s3),float,x3) * store(&(a->s4),float,x4) * store(&(a->s5),float,x5) * store(&(a->s6),float,x6) * store(&(a->s7),float,x7) * store(&(a->s8),float,x8) * store(&(a->s9),float,x9) * store(&(a->s10),float,x10) * store(&(a->s11),float,x11) * store(&(a->s12),float,x12) * store(&(a->s13),float,x13) * store(&(a->s14),float,x14) * store(&(a->s15),float,x15) * FloatArray::undef_full(p,vl)
 Ensure store(&(a->s0),float,x0) * store(&(a->s1),float,x1) * store(&(a->s2),float,x2) * store(&(a->s3),float,x3) * store(&(a->s4),float,x4) * store(&(a->s5),float,x5) * store(&(a->s6),float,x6) * store(&(a->s7),float,x7) * store(&(a->s8),float,x8) * store(&(a->s9),float,x9) * store(&(a->s10),float,x10) * store(&(a->s11),float,x11) * store(&(a->s12),float,x12) * store(&(a->s13),float,x13) * store(&(a->s14),float,x14) * store(&(a->s15),float,x15) * FloatArray::full(p,vl,rvv_take(vl,L)) */;
/*@ Import Coq Require Import VCMul.ComplexModel */
/*@ Extern Coq (FloatArray::full : Z -> Z -> list fp32 -> Assertion)
 (FloatArray::seg : Z -> Z -> Z -> list fp32 -> Assertion)
 (FloatArray::undef_full : Z -> Z -> Assertion)
 (complex_real_prefix : Z -> Z -> list fp32 -> list fp32 -> list fp32)
 (complex_imag_prefix : Z -> Z -> list fp32 -> list fp32 -> list fp32)
 (vcmul_values : Z -> list fp32 -> list fp32 -> list fp32) */
/*@ Import Coq Require Import QcpNeonLoop.InvariantFacts */
/*@ Extern Coq (fp32_length : list fp32 -> Z) */
/*@ include strategies "neon_vcmul.strategies" */
void qcp_assert(int condition)
/*@ Require condition!=0 && emp Ensure emp */;
void test_rvv(
    size_t batch,
    const float* input_a,
    const float* input_b,
    float* output,
    const struct xnn_f32_default_params* restrict params)
/*@ With (A:list fp32) (B:list fp32) (p:Z)
 Require 0<batch && batch<=9223372036854775788 && batch%4==0 &&
 input_a!=0 && input_b!=0 && output!=0 && params!=0 &&
 FloatArray::full(input_a,batch/2+3,A) * FloatArray::full(input_b,batch/2+3,B) *
 store(&(params->_),char,p) * FloatArray::undef_full(output,batch/2)
 Ensure FloatArray::full(input_a,batch/2+3,A) * FloatArray::full(input_b,batch/2+3,B) *
 store(&(params->_),char,p) * FloatArray::full(output,batch/2,vcmul_values(batch/4,A,B)) */
{
  qcp_assert(batch != 0);
  qcp_assert(batch % sizeof(float) == 0);
  qcp_assert(input_a != ((void *)0));
  qcp_assert(input_b != ((void *)0));
  qcp_assert(output != ((void *)0));
  const float* ar = input_a;
  const float* ai = (const float*) ((uintptr_t) input_a + batch);
  const float* br = input_b;
  const float* bi = (const float*) ((uintptr_t) input_b + batch);
  float* out_r = output;
  float* out_i = (float*) ((uintptr_t) output + batch);
  size_t n = batch / sizeof(float);
/*@ Inv Assert exists (k:Z),
fp32_length(A)==batch@pre/2+3 && fp32_length(B)==batch@pre/2+3 &&
0<batch@pre && batch@pre<=9223372036854775788 && batch@pre%4==0 &&
batch==batch@pre && 0<=k && 0<=n && n<=batch@pre/4 && k+n==batch@pre/4 &&
input_a==input_a@pre && input_b==input_b@pre && output==output@pre && params==params@pre &&
input_a!=0 && input_b!=0 && output!=0 && params!=0 &&
ar==input_a@pre+k && ai==input_a@pre+batch@pre/4+k &&
br==input_b@pre+k && bi==input_b@pre+batch@pre/4+k &&
out_r==output@pre+k && out_i==output@pre+batch@pre/4+k &&
ar!=0 && ai!=0 && br!=0 && bi!=0 && out_r!=0 && out_i!=0 &&
FloatArray::full(input_a@pre,batch@pre/2+3,A) *
FloatArray::full(input_b@pre,batch@pre/2+3,B) *
store(&(params->_),char,p) *
FloatArray::full(output@pre,k,complex_real_prefix(k,batch@pre/4,A,B)) *
FloatArray::undef_full(out_r,n) *
FloatArray::full(output@pre+batch@pre/4,k,complex_imag_prefix(k,batch@pre/4,A,B)) *
FloatArray::undef_full(out_i,n) */
  while (n > 0) {
    size_t vl = __riscv_vsetvl_e32m4(n);
/*@ Assert exists (k:Z),
fp32_length(A)==batch@pre/2+3 && fp32_length(B)==batch@pre/2+3 &&
0<batch@pre && batch@pre<=9223372036854775788 && batch@pre%4==0 &&
batch==batch@pre && 0<=k && 0<=n && n<=batch@pre/4 && k+n==batch@pre/4 &&
input_a==input_a@pre && input_b==input_b@pre && output==output@pre && params==params@pre &&
input_a!=0 && input_b!=0 && output!=0 && params!=0 &&
ar==input_a@pre+k && ai==input_a@pre+batch@pre/4+k &&
br==input_b@pre+k && bi==input_b@pre+batch@pre/4+k &&
out_r==output@pre+k && out_i==output@pre+batch@pre/4+k &&
ar!=0 && ai!=0 && br!=0 && bi!=0 && out_r!=0 && out_i!=0 && n>0 && 0<vl && vl<=n && vl<=16 && vl==vcmul_vl16(n) &&
FloatArray::full(input_a@pre,batch@pre/2+3,A) *
FloatArray::full(input_b@pre,batch@pre/2+3,B) *
store(&(params->_),char,p) *
FloatArray::full(output@pre,k,complex_real_prefix(k,batch@pre/4,A,B)) *
FloatArray::undef_full(out_r,vl) *
FloatArray::undef_full(out_r+vl,n-vl) *
FloatArray::full(output@pre+batch@pre/4,k,complex_imag_prefix(k,batch@pre/4,A,B)) *
FloatArray::undef_full(out_i,vl) *
FloatArray::undef_full(out_i+vl,n-vl) */
    vfloat32m4_t var = qcp_vcmul_load16((ar),(vl)) /*@ where base=input_a,count=batch/2+3,idx=batch/4-n,L=A */;
    vfloat32m4_t vai = qcp_vcmul_load16((ai),(vl)) /*@ where base=input_a,count=batch/2+3,idx=batch/4+batch/4-n,L=A */;
    vfloat32m4_t vbr = qcp_vcmul_load16((br),(vl)) /*@ where base=input_b,count=batch/2+3,idx=batch/4-n,L=B */;
    vfloat32m4_t vbi = qcp_vcmul_load16((bi),(vl)) /*@ where base=input_b,count=batch/2+3,idx=batch/4+batch/4-n,L=B */;
    vfloat32m4_t vaccr = __riscv_vfmul_vv_f32m4(var, vbr, vl) /*@ where a=&var,b=&vbr */;
    vfloat32m4_t vacci = __riscv_vfmul_vv_f32m4(var, vbi, vl) /*@ where a=&var,b=&vbi */;
    vfloat32m4_t temp_r = __riscv_vfmul_vv_f32m4(vai, vbi, vl) /*@ where a=&vai,b=&vbi */;
    vaccr = __riscv_vfsub_vv_f32m4(vaccr, temp_r, vl) /*@ where a=&vaccr,b=&temp_r */;
    vfloat32m4_t temp_i = __riscv_vfmul_vv_f32m4(vai, vbr, vl) /*@ where a=&vai,b=&vbr */;
    vacci = __riscv_vfadd_vv_f32m4(vacci, temp_i, vl) /*@ where a=&vacci,b=&temp_i */;
    __riscv_vse32_v_f32m4((out_r),&(vaccr),(vl)) /*@ where a=&vaccr */;
    __riscv_vse32_v_f32m4((out_i),&(vacci),(vl)) /*@ where a=&vacci */;
    ar += vl;
    ai += vl;
    br += vl;
    bi += vl;
    out_r += vl;
    out_i += vl;
    n -= vl;
  }
}
