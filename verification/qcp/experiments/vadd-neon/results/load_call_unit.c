/*@ Import Coq Require Import QcpVadd.VaddBits */
/*@ Extern Coq (fp32_bits_equal : fp32 -> fp32 -> Prop)
               (vadd_vl : Z -> Z)
               (vadd_active_add : Z -> Z -> fp32 -> fp32 -> fp32) */
struct float32x4_t { float s0; float s1; float s2; float s3; };
struct float32x2_t { float s0; float s1; };
float f32_add(float a, float b)
/*@     Require emp
    Ensure fp32_bits_equal(__return,fp32_add(a,b)) */
;
void vld1q_f32(struct float32x4_t *r, const float *p)
/*@ With (x0: fp32) (x1: fp32) (x2: fp32) (x3: fp32)
    Require store(pointer_offset(p,0,float),float,x0) * store(pointer_offset(p,1,float),float,x1) * store(pointer_offset(p,2,float),float,x2) * store(pointer_offset(p,3,float),float,x3) * undef_data_at(&(r->s0),float) * undef_data_at(&(r->s1),float) * undef_data_at(&(r->s2),float) * undef_data_at(&(r->s3),float)
    Ensure store(pointer_offset(p,0,float),float,x0) * store(pointer_offset(p,1,float),float,x1) * store(pointer_offset(p,2,float),float,x2) * store(pointer_offset(p,3,float),float,x3) * store(&(r->s0),float,x0) * store(&(r->s1),float,x1) * store(&(r->s2),float,x2) * store(&(r->s3),float,x3) */
;
void vst1q_f32(float *p, const struct float32x4_t *a)
/*@ With (x0: fp32) (x1: fp32) (x2: fp32) (x3: fp32)
    Require store(&(a->s0),float,x0) * store(&(a->s1),float,x1) * store(&(a->s2),float,x2) * store(&(a->s3),float,x3) * undef_data_at(pointer_offset(p,0,float),float) * undef_data_at(pointer_offset(p,1,float),float) * undef_data_at(pointer_offset(p,2,float),float) * undef_data_at(pointer_offset(p,3,float),float)
    Ensure store(&(a->s0),float,x0) * store(&(a->s1),float,x1) * store(&(a->s2),float,x2) * store(&(a->s3),float,x3) * store(pointer_offset(p,0,float),float,x0) * store(pointer_offset(p,1,float),float,x1) * store(pointer_offset(p,2,float),float,x2) * store(pointer_offset(p,3,float),float,x3) */
;
void vst1_f32(float *p, const struct float32x2_t *a)
/*@ With (x0: fp32) (x1: fp32)
    Require store(&(a->s0),float,x0) * store(&(a->s1),float,x1) * undef_data_at(pointer_offset(p,0,float),float) * undef_data_at(pointer_offset(p,1,float),float)
    Ensure store(&(a->s0),float,x0) * store(&(a->s1),float,x1) * store(pointer_offset(p,0,float),float,x0) * store(pointer_offset(p,1,float),float,x1) */
;
void vaddq_f32(struct float32x4_t *r, const struct float32x4_t *a, const struct float32x4_t *b)
/*@ With (x0: fp32) (y0: fp32) (x1: fp32) (y1: fp32) (x2: fp32) (y2: fp32) (x3: fp32) (y3: fp32)
    Require store(&(a->s0),float,x0) * store(&(a->s1),float,x1) * store(&(a->s2),float,x2) * store(&(a->s3),float,x3) * store(&(b->s0),float,y0) * store(&(b->s1),float,y1) * store(&(b->s2),float,y2) * store(&(b->s3),float,y3) * undef_data_at(&(r->s0),float) * undef_data_at(&(r->s1),float) * undef_data_at(&(r->s2),float) * undef_data_at(&(r->s3),float)
    Ensure store(&(a->s0),float,x0) * store(&(a->s1),float,x1) * store(&(a->s2),float,x2) * store(&(a->s3),float,x3) * store(&(b->s0),float,y0) * store(&(b->s1),float,y1) * store(&(b->s2),float,y2) * store(&(b->s3),float,y3) * store(&(r->s0),float,fp32_add(x0,y0)) * store(&(r->s1),float,fp32_add(x1,y1)) * store(&(r->s2),float,fp32_add(x2,y2)) * store(&(r->s3),float,fp32_add(x3,y3)) */
;
void vget_low_f32(struct float32x2_t *r, const struct float32x4_t *a)
/*@ With (x0: fp32) (x1: fp32) (x2: fp32) (x3: fp32)
    Require store(&(a->s0),float,x0) * store(&(a->s1),float,x1) * store(&(a->s2),float,x2) * store(&(a->s3),float,x3) * undef_data_at(&(r->s0),float) * undef_data_at(&(r->s1),float)
    Ensure store(&(a->s0),float,x0) * store(&(a->s1),float,x1) * store(&(a->s2),float,x2) * store(&(a->s3),float,x3) * store(&(r->s0),float,x0) * store(&(r->s1),float,x1) */
;
void vget_high_f32(struct float32x2_t *r, const struct float32x4_t *a)
/*@ With (x0: fp32) (x1: fp32) (x2: fp32) (x3: fp32)
    Require store(&(a->s0),float,x0) * store(&(a->s1),float,x1) * store(&(a->s2),float,x2) * store(&(a->s3),float,x3) * undef_data_at(&(r->s0),float) * undef_data_at(&(r->s1),float)
    Ensure store(&(a->s0),float,x0) * store(&(a->s1),float,x1) * store(&(a->s2),float,x2) * store(&(a->s3),float,x3) * store(&(r->s0),float,x2) * store(&(r->s1),float,x3) */
;
void vst1_lane_f32(float *p, const struct float32x2_t *a, int lane)
/*@ With (x0: fp32) (x1: fp32) (z: fp32)
    Require ((lane == 0 && fp32_bits_equal(z,x0)) || (lane == 1 && fp32_bits_equal(z,x1))) && store(&(a->s0),float,x0) * store(&(a->s1),float,x1) * undef_data_at(p,float)
    Ensure store(&(a->s0),float,x0) * store(&(a->s1),float,x1) * store(p,float,z) */
;
void qcp_vadd_block4(struct float32x4_t *va, struct float32x4_t *vb, struct float32x4_t *vc, const float *a, const float *b, float *out)
/*@ With (x0: fp32) (y0: fp32) (x1: fp32) (y1: fp32) (x2: fp32) (y2: fp32) (x3: fp32) (y3: fp32)
    Require store(pointer_offset(a,0,float),float,x0) * store(pointer_offset(a,1,float),float,x1) * store(pointer_offset(a,2,float),float,x2) * store(pointer_offset(a,3,float),float,x3) * store(pointer_offset(b,0,float),float,y0) * store(pointer_offset(b,1,float),float,y1) * store(pointer_offset(b,2,float),float,y2) * store(pointer_offset(b,3,float),float,y3) * undef_data_at(pointer_offset(out,0,float),float) * undef_data_at(pointer_offset(out,1,float),float) * undef_data_at(pointer_offset(out,2,float),float) * undef_data_at(pointer_offset(out,3,float),float) * undef_data_at(&(va->s0),float) * undef_data_at(&(va->s1),float) * undef_data_at(&(va->s2),float) * undef_data_at(&(va->s3),float) * undef_data_at(&(vb->s0),float) * undef_data_at(&(vb->s1),float) * undef_data_at(&(vb->s2),float) * undef_data_at(&(vb->s3),float) * undef_data_at(&(vc->s0),float) * undef_data_at(&(vc->s1),float) * undef_data_at(&(vc->s2),float) * undef_data_at(&(vc->s3),float)
    Ensure store(pointer_offset(a,0,float),float,x0) * store(pointer_offset(a,1,float),float,x1) * store(pointer_offset(a,2,float),float,x2) * store(pointer_offset(a,3,float),float,x3) * store(pointer_offset(b,0,float),float,y0) * store(pointer_offset(b,1,float),float,y1) * store(pointer_offset(b,2,float),float,y2) * store(pointer_offset(b,3,float),float,y3) * store(pointer_offset(out,0,float),float,fp32_add(x0,y0)) * store(pointer_offset(out,1,float),float,fp32_add(x1,y1)) * store(pointer_offset(out,2,float),float,fp32_add(x2,y2)) * store(pointer_offset(out,3,float),float,fp32_add(x3,y3)) * store(&(va->s0),float,x0) * store(&(va->s1),float,x1) * store(&(va->s2),float,x2) * store(&(va->s3),float,x3) * store(&(vb->s0),float,y0) * store(&(vb->s1),float,y1) * store(&(vb->s2),float,y2) * store(&(vb->s3),float,y3) * store(&(vc->s0),float,fp32_add(x0,y0)) * store(&(vc->s1),float,fp32_add(x1,y1)) * store(&(vc->s2),float,fp32_add(x2,y2)) * store(&(vc->s3),float,fp32_add(x3,y3)) */
;
unsigned long long __riscv_vsetvl_e32m8(unsigned long long n)
/*@     Require emp
    Ensure __return == vadd_vl(n) && emp */
;
float qcp_rvv_add_lane32(float a, float b, unsigned long long i, unsigned long long vl)
/*@     Require 0 <= i && i < 32 && 0 <= vl && vl <= 32 && emp
    Ensure fp32_bits_equal(__return,vadd_active_add(i,vl,a,b)) && emp */
;
void qcp_assert(int condition)
/*@     Require condition != 0 && emp
    Ensure emp */
;
/*@ Import Coq Require Import QcpNeon.NeonBridge */
/*@ Extern Coq (FloatArray::undef_full : Z -> Z -> Assertion)
               (FloatArray::undef_seg : Z -> Z -> Z -> Assertion)
               (fp32_slice : Z -> Z -> list fp32 -> list fp32)
               (FloatArray::full : Z -> Z -> list fp32 -> Assertion)
               (FloatArray::seg : Z -> Z -> Z -> list fp32 -> Assertion)
               (UndefStructPredfloat32x4_t : Z -> Assertion)
               (UndefStructPredfloat32x2_t : Z -> Assertion) */
/*@ include strategies "neon_bridge.strategies" */
void load_call(struct float32x4_t *r,const float *p,unsigned long long n)
/*@ With (L:list fp32)
Require 4 <= n && FloatArray::full(p,n,L) *
undef_data_at(&(r->s0),float) * undef_data_at(&(r->s1),float) *
undef_data_at(&(r->s2),float) * undef_data_at(&(r->s3),float)
Ensure FloatArray::seg(p,4,n,fp32_slice(4,n,L)) *
store(pointer_offset(p,0,float),float,L[0]) * store(pointer_offset(p,1,float),float,L[1]) *
store(pointer_offset(p,2,float),float,L[2]) * store(pointer_offset(p,3,float),float,L[3]) *
store(&(r->s0),float,L[0]) * store(&(r->s1),float,L[1]) *
store(&(r->s2),float,L[2]) * store(&(r->s3),float,L[3]) */
{ vld1q_f32(r,p); }
void load_local(const float *p,float *out,unsigned long long n)
/*@ With (L:list fp32)
Require 4 <= n && FloatArray::full(p,n,L) * undef_data_at(out,float)
Ensure FloatArray::seg(p,4,n,fp32_slice(4,n,L)) *
store(pointer_offset(p,0,float),float,L[0]) * store(pointer_offset(p,1,float),float,L[1]) *
store(pointer_offset(p,2,float),float,L[2]) * store(pointer_offset(p,3,float),float,L[3]) *
store(out,float,L[0]) */
{ struct float32x4_t va; vld1q_f32(&va,p); *out=va.s0; }
void store_call(float *p,const struct float32x4_t *a,unsigned long long n)
/*@ With (x0:fp32) (x1:fp32) (x2:fp32) (x3:fp32)
Require 4 <= n && FloatArray::undef_full(p,n) *
store(&(a->s0),float,x0) * store(&(a->s1),float,x1) *
store(&(a->s2),float,x2) * store(&(a->s3),float,x3)
Ensure FloatArray::undef_seg(p,4,n) *
store(pointer_offset(p,0,float),float,x0) * store(pointer_offset(p,1,float),float,x1) *
store(pointer_offset(p,2,float),float,x2) * store(pointer_offset(p,3,float),float,x3) *
store(&(a->s0),float,x0) * store(&(a->s1),float,x1) *
store(&(a->s2),float,x2) * store(&(a->s3),float,x3) */
{ vst1q_f32(p,a); }
