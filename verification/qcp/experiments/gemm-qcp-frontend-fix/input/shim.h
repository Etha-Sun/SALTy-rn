/*@ Import Coq Require Import GemmSpec.FmaModel GemmSpec.IntrinsicModel GemmNeon.KernelModel GemmNeon.LayoutModel FullDomainRvv.FullModel FullDomainNeon.FullNeonModel FullDomainRvv.FullState FullDomainNeon.NeonStoreState */
/*@ Extern Coq
 (FloatArray::undef_full:Z -> Z -> Assertion)
 (output_state:Z -> Z -> Z -> Z -> Z -> list fp32 -> list fp32 -> fp32 -> fp32 -> Assertion)
 (full_cell:list fp32 -> list fp32 -> Z -> Z -> Z -> fp32 -> fp32 -> fp32)
 (neon_phase_state:Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> list fp32 -> list fp32 -> fp32 -> fp32 -> Assertion)
 (neon_phase_frame:Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> list fp32 -> list fp32 -> fp32 -> fp32 -> Assertion)
 (fulln_outer_ptrs: Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Prop)
 (row_alias: Z -> Z -> Z) (panel_count: Z -> Z)
 (fulln_acc: Z -> Z -> Z -> Z -> list fp32 -> list fp32 -> fp32)
 (fulln_prefix: Z -> Z -> Z -> Z -> list fp32 -> list fp32 -> fp32 -> fp32 -> list fp32 -> list fp32)
 (fulln_result: Z -> Z -> Z -> list fp32 -> list fp32 -> fp32 -> fp32 -> list fp32 -> list fp32) (UndefStructPredfloat32x4_t:Z -> Assertion) (UndefStructPredfloat32x2_t:Z -> Assertion) (FloatArray::full : Z -> Z -> list fp32 -> Assertion)
 (gpartial : Z -> Z -> list fp32 -> list fp32 -> fp32 -> fp32 -> list fp32 -> list fp32) (gget : Z -> list fp32 -> fp32) (gacc : Z -> Z -> list fp32 -> list fp32 -> fp32)
 (gout : Z -> list fp32 -> list fp32 -> fp32 -> fp32 -> list fp32)
 (gput : Z -> fp32 -> list fp32 -> list fp32)
 (glane : Z -> fp32 -> fp32 -> fp32) (gbit : fp32 -> fp32 -> Prop)
 (fma_rne : fp32 -> fp32 -> fp32 -> fp32)
 (fp32_neon_min : fp32 -> fp32 -> fp32) (fp32_neon_max : fp32 -> fp32 -> fp32) */
typedef unsigned long long size_t;
typedef unsigned long long uintptr_t;
struct bounds { float min; float max; };
struct xnn_f32_minmax_params { struct bounds scalar; };
struct float32x4_t { float s0;float s1;float s2;float s3; };
struct float32x2_t { float s0;float s1; };
typedef struct float32x4_t float32x4_t;
typedef struct float32x2_t float32x2_t;
/*@ include strategies "copy.strategies" */
float32x4_t vld1q_f32(const float *p)
/*@ With (base:Z) (n:Z) (j:Z) (L:list fp32)
 Require p == pointer_offset(base,j,float) && 0<=j && j+4<=n && FloatArray::full(base,n,L)
 Ensure FloatArray::full(base,n,L) * store(&(__return.s0),float,gget(j+0,L)) * store(&(__return.s1),float,gget(j+1,L)) * store(&(__return.s2),float,gget(j+2,L)) * store(&(__return.s3),float,gget(j+3,L)) */;

float32x2_t vld1_f32(const float *p)
/*@ With (base:Z) (n:Z) (j:Z) (L:list fp32)
 Require p == pointer_offset(base,j,float) && 0<=j && j+2<=n && FloatArray::full(base,n,L)
 Ensure FloatArray::full(base,n,L) * store(&(__return.s0),float,gget(j+0,L)) * store(&(__return.s1),float,gget(j+1,L)) */;

float32x4_t vld1q_dup_f32(const float *p)
/*@ With (base:Z) (n:Z) (j:Z) (L:list fp32)
 Require p == pointer_offset(base,j,float) && 0<=j && j+1<=n && FloatArray::full(base,n,L)
 Ensure FloatArray::full(base,n,L) * store(&(__return.s0),float,gget(j+0,L)) * store(&(__return.s1),float,gget(j+0,L)) * store(&(__return.s2),float,gget(j+0,L)) * store(&(__return.s3),float,gget(j+0,L)) */;

float32x4_t vdupq_n_f32(float a)
/*@ Require emp
 Ensure store(&(__return.s0),float,a) * store(&(__return.s1),float,a) * store(&(__return.s2),float,a) * store(&(__return.s3),float,a) */;

float32x4_t vdupq_lane_f32(float32x2_t a,int lane)
/*@ With (x0:fp32) (x1:fp32)
 Require 0<=lane && lane<=1 && store(&(a.s0),float,x0) * store(&(a.s1),float,x1)
 Ensure store(&(__return.s0),float,glane(lane,x0,x1)) * store(&(__return.s1),float,glane(lane,x0,x1)) * store(&(__return.s2),float,glane(lane,x0,x1)) * store(&(__return.s3),float,glane(lane,x0,x1)) */;

float32x4_t vfmaq_f32(float32x4_t acc,float32x4_t a,float32x4_t b)
/*@ With (x0:fp32) (x1:fp32) (x2:fp32) (x3:fp32) (y0:fp32) (y1:fp32) (y2:fp32) (y3:fp32) (z0:fp32) (z1:fp32) (z2:fp32) (z3:fp32)
 Require store(&(acc.s0),float,z0) * store(&(acc.s1),float,z1) * store(&(acc.s2),float,z2) * store(&(acc.s3),float,z3) * store(&(a.s0),float,x0) * store(&(a.s1),float,x1) * store(&(a.s2),float,x2) * store(&(a.s3),float,x3) * store(&(b.s0),float,y0) * store(&(b.s1),float,y1) * store(&(b.s2),float,y2) * store(&(b.s3),float,y3)
 Ensure store(&(__return.s0),float,fma_rne(x0,y0,z0)) * store(&(__return.s1),float,fma_rne(x1,y1,z1)) * store(&(__return.s2),float,fma_rne(x2,y2,z2)) * store(&(__return.s3),float,fma_rne(x3,y3,z3)) */;

float32x4_t vminq_f32(float32x4_t a,float32x4_t b)
/*@ With (x0:fp32) (x1:fp32) (x2:fp32) (x3:fp32) (y0:fp32) (y1:fp32) (y2:fp32) (y3:fp32)
 Require store(&(a.s0),float,x0) * store(&(a.s1),float,x1) * store(&(a.s2),float,x2) * store(&(a.s3),float,x3) * store(&(b.s0),float,y0) * store(&(b.s1),float,y1) * store(&(b.s2),float,y2) * store(&(b.s3),float,y3)
 Ensure store(&(__return.s0),float,fp32_neon_min(x0,y0)) * store(&(__return.s1),float,fp32_neon_min(x1,y1)) * store(&(__return.s2),float,fp32_neon_min(x2,y2)) * store(&(__return.s3),float,fp32_neon_min(x3,y3)) */;

float32x4_t vmaxq_f32(float32x4_t a,float32x4_t b)
/*@ With (x0:fp32) (x1:fp32) (x2:fp32) (x3:fp32) (y0:fp32) (y1:fp32) (y2:fp32) (y3:fp32)
 Require store(&(a.s0),float,x0) * store(&(a.s1),float,x1) * store(&(a.s2),float,x2) * store(&(a.s3),float,x3) * store(&(b.s0),float,y0) * store(&(b.s1),float,y1) * store(&(b.s2),float,y2) * store(&(b.s3),float,y3)
 Ensure store(&(__return.s0),float,fp32_neon_max(x0,y0)) * store(&(__return.s1),float,fp32_neon_max(x1,y1)) * store(&(__return.s2),float,fp32_neon_max(x2,y2)) * store(&(__return.s3),float,fp32_neon_max(x3,y3)) */;

float32x2_t vget_low_f32(float32x4_t a)
/*@ With (x0:fp32) (x1:fp32) (x2:fp32) (x3:fp32)
 Require store(&(a.s0),float,x0) * store(&(a.s1),float,x1) * store(&(a.s2),float,x2) * store(&(a.s3),float,x3)
 Ensure store(&(__return.s0),float,x0) * store(&(__return.s1),float,x1) */;

float32x2_t vget_high_f32(float32x4_t a)
/*@ With (x0:fp32) (x1:fp32) (x2:fp32) (x3:fp32)
 Require store(&(a.s0),float,x0) * store(&(a.s1),float,x1) * store(&(a.s2),float,x2) * store(&(a.s3),float,x3)
 Ensure store(&(__return.s0),float,x2) * store(&(__return.s1),float,x3) */;

void qcp_vst1q_f32(float *p,const float32x4_t *a)
/*@ With (x0:fp32) (x1:fp32) (x2:fp32) (x3:fp32)
 Require store(&(a->s0),float,x0) * store(&(a->s1),float,x1) * store(&(a->s2),float,x2) * store(&(a->s3),float,x3) * FloatArray::undef_full(p,4)
 Ensure store(&(a->s0),float,x0) * store(&(a->s1),float,x1) * store(&(a->s2),float,x2) * store(&(a->s3),float,x3) * FloatArray::full(p,4,cons(x0,cons(x1,cons(x2,cons(x3,nil))))) */;
#define vst1q_f32(p,a) qcp_vst1q_f32((p),&(a))
void qcp_vst1_f32(float *p,const float32x2_t *a)
/*@ With (x0:fp32) (x1:fp32)
 Require store(&(a->s0),float,x0) * store(&(a->s1),float,x1) * FloatArray::undef_full(p,2)
 Ensure store(&(a->s0),float,x0) * store(&(a->s1),float,x1) * FloatArray::full(p,2,cons(x0,cons(x1,nil))) */;
#define vst1_f32(p,a) qcp_vst1_f32((p),&(a))
void qcp_vst1_lane_f32(float *p,const float32x2_t *a,int lane)
/*@ With (x0:fp32) (x1:fp32)
 Require lane==0 && store(&(a->s0),float,x0) * store(&(a->s1),float,x1) * FloatArray::undef_full(p,1)
 Ensure store(&(a->s0),float,x0) * store(&(a->s1),float,x1) * FloatArray::full(p,1,cons(x0,nil)) */;
#define vst1_lane_f32(p,a,lane) qcp_vst1_lane_f32((p),&(a),(lane))

void qcp_assert(int condition)
/*@ Require condition!=0 && emp
 Ensure emp */;
