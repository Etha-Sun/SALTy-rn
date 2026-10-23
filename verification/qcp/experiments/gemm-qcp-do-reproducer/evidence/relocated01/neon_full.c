/*@ Import Coq Require Import GemmSpec.FmaModel GemmSpec.IntrinsicModel GemmNeon.KernelModel GemmNeon.LayoutModel GemmNeon.PartialOutput FullDomainRvv.FullModel FullDomainNeon.FullNeonModel FullDomainRvv.FullState FullDomainNeon.NeonStoreState */
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
void qcp_vst1_f32(float *p,const float32x2_t *a)
/*@ With (x0:fp32) (x1:fp32)
 Require store(&(a->s0),float,x0) * store(&(a->s1),float,x1) * FloatArray::undef_full(p,2)
 Ensure store(&(a->s0),float,x0) * store(&(a->s1),float,x1) * FloatArray::full(p,2,cons(x0,cons(x1,nil))) */;
void qcp_vst1_lane_f32(float *p,const float32x2_t *a,int lane)
/*@ With (x0:fp32) (x1:fp32)
 Require lane==0 && store(&(a->s0),float,x0) * store(&(a->s1),float,x1) * FloatArray::undef_full(p,1)
 Ensure store(&(a->s0),float,x0) * store(&(a->s1),float,x1) * FloatArray::full(p,1,cons(x0,nil)) */;
void qcp_assert(int condition)
/*@ Require condition!=0 && emp
 Ensure emp */;
/*
struct xnn_f32_minmax_params {
  struct {
    float min;
    float max;
  } scalar;
};
*/
void test_neon(
    size_t mr,
    size_t nc,
    size_t kc,
    const float* restrict a,
    size_t a_stride,
    const float* restrict w,
    float* restrict c,
    size_t cm_stride,
    size_t cn_stride,
    const struct xnn_f32_minmax_params* restrict params)
/*@ With (A:list fp32) (W:list fp32) (lo:fp32) (hi:fp32)
Require 1<=mr && mr<=4 && 1<=nc && 4<=kc && kc%4==0 && a_stride==kc && cm_stride==4*nc && cn_stride==32 && a!=0 && w!=0 && c!=0 && params!=0 && 4*kc<=18446744073709551615 && (uintptr_t)a+4*kc<=18446744073709551615 && 16*nc<=18446744073709551615 && (uintptr_t)c+16*nc<=18446744073709551615 && 32*(kc/4+1)*panel_count(nc)<=18446744073709551615 && (uintptr_t)w+32*(kc/4+1)*panel_count(nc)<=18446744073709551615 && FloatArray::full(a,kc,A) * FloatArray::full(w,8*(kc/4+1)*panel_count(nc),W) * FloatArray::undef_full(c,4*nc) * store(&(params->scalar.min),float,lo) * store(&(params->scalar.max),float,hi)
Ensure FloatArray::full(a@pre,kc@pre,A) * FloatArray::full(w@pre,8*((kc@pre/4)+1)*panel_count(nc@pre),W) * output_state(c@pre,mr@pre,nc@pre,(kc@pre/4),nc@pre,A,W,lo,hi) * store(&(params->scalar.min),float,lo) * store(&(params->scalar.max),float,hi) */
{
  qcp_assert(mr != 0);
  qcp_assert(mr <= 4);
  qcp_assert(nc != 0);
  qcp_assert(kc != 0);
  qcp_assert(kc % sizeof(float) == 0);
  qcp_assert(a != ((void*)0));
  qcp_assert(w != ((void*)0));
  qcp_assert(c != ((void*)0));
/*@ 1<=mr@pre && mr@pre<=4 && 1<=nc@pre && 4<=kc@pre && kc@pre%4==0 && a_stride@pre==kc@pre && cm_stride@pre==4*nc@pre && cn_stride@pre==32 && a@pre!=0 && w@pre!=0 && c@pre!=0 && params@pre!=0 && 4*kc@pre<=18446744073709551615 && (uintptr_t)a@pre+4*kc@pre<=18446744073709551615 && 16*nc@pre<=18446744073709551615 && (uintptr_t)c@pre+16*nc@pre<=18446744073709551615 && 32*(kc@pre/4+1)*panel_count(nc@pre)<=18446744073709551615 && (uintptr_t)w@pre+32*(kc@pre/4+1)*panel_count(nc@pre)<=18446744073709551615 && FloatArray::undef_full(c@pre,4*nc@pre) which implies 1<=mr@pre && mr@pre<=4 && 1<=nc@pre && 4<=kc@pre && kc@pre%4==0 && a_stride@pre==kc@pre && cm_stride@pre==4*nc@pre && cn_stride@pre==32 && a@pre!=0 && w@pre!=0 && c@pre!=0 && params@pre!=0 && 4*kc@pre<=18446744073709551615 && (uintptr_t)a@pre+4*kc@pre<=18446744073709551615 && 16*nc@pre<=18446744073709551615 && (uintptr_t)c@pre+16*nc@pre<=18446744073709551615 && 32*(kc@pre/4+1)*panel_count(nc@pre)<=18446744073709551615 && (uintptr_t)w@pre+32*(kc@pre/4+1)*panel_count(nc@pre)<=18446744073709551615 && output_state(c@pre,mr@pre,nc@pre,(kc@pre/4),0,A,W,lo,hi) */
  const float* a0 = a;
  float* c0 = c;
  const float* a1 = (const float*) ((uintptr_t) a0 + a_stride);
  float* c1 = (float*) ((uintptr_t) c0 + cm_stride);
  if (mr < 2) {
    a1 = a0;
    c1 = c0;
  }
  const float* a2 = (const float*) ((uintptr_t) a1 + a_stride);
  float* c2 = (float*) ((uintptr_t) c1 + cm_stride);
  if (mr <= 2) {
    a2 = a1;
    c2 = c1;
  }
  const float* a3 = (const float*) ((uintptr_t) a2 + a_stride);
  float* c3 = (float*) ((uintptr_t) c2 + cm_stride);
  if (mr != 4) {
    a3 = a2;
    c3 = c2;
  }
  /*@ Assert 0<nc && 1<=mr@pre && mr@pre<=4 && 1<=nc@pre && 4<=kc@pre && kc@pre%4==0 && a_stride@pre==kc@pre && cm_stride@pre==4*nc@pre && cn_stride@pre==32 && a@pre!=0 && w@pre!=0 && c@pre!=0 && params@pre!=0 && 4*kc@pre<=18446744073709551615 && (uintptr_t)a@pre+4*kc@pre<=18446744073709551615 && 16*nc@pre<=18446744073709551615 && (uintptr_t)c@pre+16*nc@pre<=18446744073709551615 && 32*(kc@pre/4+1)*panel_count(nc@pre)<=18446744073709551615 && (uintptr_t)w@pre+32*(kc@pre/4+1)*panel_count(nc@pre)<=18446744073709551615 && mr==mr@pre && 1<=mr && mr<=4 && kc==kc@pre && params==params@pre && a==a@pre && c==c@pre && a_stride==kc@pre && cm_stride==4*nc@pre && cn_stride==32 && 0<=nc && nc<=nc@pre && fulln_outer_ptrs(nc,mr@pre,nc@pre,kc@pre/4,a@pre,c@pre,a0,a1,a2,a3,c0,c1,c2,c3) && w==w@pre+8*(kc@pre/4+1)*panel_count(nc@pre-nc) &&
FloatArray::full(a@pre,kc@pre,A) * FloatArray::full(w@pre,8*(kc@pre/4+1)*panel_count(nc@pre),W) * output_state(c@pre,mr@pre,nc@pre,(kc@pre/4),(nc@pre-nc),A,W,lo,hi) * store(&(params->scalar.min),float,lo) * store(&(params->scalar.max),float,hi) */
  do {
    float32x4_t vacc0x0 = vld1q_f32(w) /*@ where base=w@pre, n=8*(kc@pre/4+1)*panel_count(nc@pre), L=W, j=(w-w@pre) */; w += 4;
    float32x4_t vacc0x1 = vld1q_f32(w) /*@ where base=w@pre, n=8*(kc@pre/4+1)*panel_count(nc@pre), L=W, j=(w-w@pre) */; w += 4;
    float32x4_t vacc1x0 = vacc0x0;
    float32x4_t vacc1x1 = vacc0x1;
    float32x4_t vacc2x0 = vacc0x0;
    float32x4_t vacc2x1 = vacc0x1;
    float32x4_t vacc3x0 = vacc0x0;
    float32x4_t vacc3x1 = vacc0x1;
    size_t k = kc;
/*@ Inv Assert 1<=mr@pre && mr@pre<=4 && 1<=nc@pre && 4<=kc@pre && kc@pre%4==0 && a_stride@pre==kc@pre && cm_stride@pre==4*nc@pre && cn_stride@pre==32 && a@pre!=0 && w@pre!=0 && c@pre!=0 && params@pre!=0 && 4*kc@pre<=18446744073709551615 && (uintptr_t)a@pre+4*kc@pre<=18446744073709551615 && 16*nc@pre<=18446744073709551615 && (uintptr_t)c@pre+16*nc@pre<=18446744073709551615 && 32*(kc@pre/4+1)*panel_count(nc@pre)<=18446744073709551615 && (uintptr_t)w@pre+32*(kc@pre/4+1)*panel_count(nc@pre)<=18446744073709551615 && mr==mr@pre && 1<=mr && mr<=4 && kc==kc@pre && params==params@pre && a==a@pre && c==c@pre && a_stride==kc@pre && cm_stride==4*nc@pre && cn_stride==32 && 0<nc && nc<=nc@pre && (nc@pre-nc)%8==0 && 0<=(kc@pre-k)/4 && (kc@pre-k)/4<=kc@pre/4 && ((kc@pre-k)/4)%2==0 && 0<=k && k<=kc@pre && k%4==0 && a0==a@pre+row_alias(mr@pre,0)*(kc@pre/4)+((kc@pre-k)/4) && a1==a@pre+row_alias(mr@pre,1)*(kc@pre/4)+((kc@pre-k)/4) && a2==a@pre+row_alias(mr@pre,2)*(kc@pre/4)+((kc@pre-k)/4) && a3==a@pre+row_alias(mr@pre,3)*(kc@pre/4)+((kc@pre-k)/4) && c0==c@pre+row_alias(mr@pre,0)*nc@pre+(nc@pre-nc) && c1==c@pre+row_alias(mr@pre,1)*nc@pre+(nc@pre-nc) && c2==c@pre+row_alias(mr@pre,2)*nc@pre+(nc@pre-nc) && c3==c@pre+row_alias(mr@pre,3)*nc@pre+(nc@pre-nc) && w==w@pre+8*(kc@pre/4+1)*((nc@pre-nc)/8)+8+8*((kc@pre-k)/4) &&
FloatArray::full(a@pre,kc@pre,A) * FloatArray::full(w@pre,8*(kc@pre/4+1)*panel_count(nc@pre),W) * output_state(c@pre,mr@pre,nc@pre,(kc@pre/4),(nc@pre-nc),A,W,lo,hi) * store(&(params->scalar.min),float,lo) * store(&(params->scalar.max),float,hi) * store(&(vacc0x0.s0),float,fulln_acc(((kc@pre-k)/4),kc@pre/4,row_alias(mr@pre,0),(nc@pre-nc)+0,A,W)) * store(&(vacc0x0.s1),float,fulln_acc(((kc@pre-k)/4),kc@pre/4,row_alias(mr@pre,0),(nc@pre-nc)+1,A,W)) * store(&(vacc0x0.s2),float,fulln_acc(((kc@pre-k)/4),kc@pre/4,row_alias(mr@pre,0),(nc@pre-nc)+2,A,W)) * store(&(vacc0x0.s3),float,fulln_acc(((kc@pre-k)/4),kc@pre/4,row_alias(mr@pre,0),(nc@pre-nc)+3,A,W)) * store(&(vacc0x1.s0),float,fulln_acc(((kc@pre-k)/4),kc@pre/4,row_alias(mr@pre,0),(nc@pre-nc)+4,A,W)) * store(&(vacc0x1.s1),float,fulln_acc(((kc@pre-k)/4),kc@pre/4,row_alias(mr@pre,0),(nc@pre-nc)+5,A,W)) * store(&(vacc0x1.s2),float,fulln_acc(((kc@pre-k)/4),kc@pre/4,row_alias(mr@pre,0),(nc@pre-nc)+6,A,W)) * store(&(vacc0x1.s3),float,fulln_acc(((kc@pre-k)/4),kc@pre/4,row_alias(mr@pre,0),(nc@pre-nc)+7,A,W)) * store(&(vacc1x0.s0),float,fulln_acc(((kc@pre-k)/4),kc@pre/4,row_alias(mr@pre,1),(nc@pre-nc)+0,A,W)) * store(&(vacc1x0.s1),float,fulln_acc(((kc@pre-k)/4),kc@pre/4,row_alias(mr@pre,1),(nc@pre-nc)+1,A,W)) * store(&(vacc1x0.s2),float,fulln_acc(((kc@pre-k)/4),kc@pre/4,row_alias(mr@pre,1),(nc@pre-nc)+2,A,W)) * store(&(vacc1x0.s3),float,fulln_acc(((kc@pre-k)/4),kc@pre/4,row_alias(mr@pre,1),(nc@pre-nc)+3,A,W)) * store(&(vacc1x1.s0),float,fulln_acc(((kc@pre-k)/4),kc@pre/4,row_alias(mr@pre,1),(nc@pre-nc)+4,A,W)) * store(&(vacc1x1.s1),float,fulln_acc(((kc@pre-k)/4),kc@pre/4,row_alias(mr@pre,1),(nc@pre-nc)+5,A,W)) * store(&(vacc1x1.s2),float,fulln_acc(((kc@pre-k)/4),kc@pre/4,row_alias(mr@pre,1),(nc@pre-nc)+6,A,W)) * store(&(vacc1x1.s3),float,fulln_acc(((kc@pre-k)/4),kc@pre/4,row_alias(mr@pre,1),(nc@pre-nc)+7,A,W)) * store(&(vacc2x0.s0),float,fulln_acc(((kc@pre-k)/4),kc@pre/4,row_alias(mr@pre,2),(nc@pre-nc)+0,A,W)) * store(&(vacc2x0.s1),float,fulln_acc(((kc@pre-k)/4),kc@pre/4,row_alias(mr@pre,2),(nc@pre-nc)+1,A,W)) * store(&(vacc2x0.s2),float,fulln_acc(((kc@pre-k)/4),kc@pre/4,row_alias(mr@pre,2),(nc@pre-nc)+2,A,W)) * store(&(vacc2x0.s3),float,fulln_acc(((kc@pre-k)/4),kc@pre/4,row_alias(mr@pre,2),(nc@pre-nc)+3,A,W)) * store(&(vacc2x1.s0),float,fulln_acc(((kc@pre-k)/4),kc@pre/4,row_alias(mr@pre,2),(nc@pre-nc)+4,A,W)) * store(&(vacc2x1.s1),float,fulln_acc(((kc@pre-k)/4),kc@pre/4,row_alias(mr@pre,2),(nc@pre-nc)+5,A,W)) * store(&(vacc2x1.s2),float,fulln_acc(((kc@pre-k)/4),kc@pre/4,row_alias(mr@pre,2),(nc@pre-nc)+6,A,W)) * store(&(vacc2x1.s3),float,fulln_acc(((kc@pre-k)/4),kc@pre/4,row_alias(mr@pre,2),(nc@pre-nc)+7,A,W)) * store(&(vacc3x0.s0),float,fulln_acc(((kc@pre-k)/4),kc@pre/4,row_alias(mr@pre,3),(nc@pre-nc)+0,A,W)) * store(&(vacc3x0.s1),float,fulln_acc(((kc@pre-k)/4),kc@pre/4,row_alias(mr@pre,3),(nc@pre-nc)+1,A,W)) * store(&(vacc3x0.s2),float,fulln_acc(((kc@pre-k)/4),kc@pre/4,row_alias(mr@pre,3),(nc@pre-nc)+2,A,W)) * store(&(vacc3x0.s3),float,fulln_acc(((kc@pre-k)/4),kc@pre/4,row_alias(mr@pre,3),(nc@pre-nc)+3,A,W)) * store(&(vacc3x1.s0),float,fulln_acc(((kc@pre-k)/4),kc@pre/4,row_alias(mr@pre,3),(nc@pre-nc)+4,A,W)) * store(&(vacc3x1.s1),float,fulln_acc(((kc@pre-k)/4),kc@pre/4,row_alias(mr@pre,3),(nc@pre-nc)+5,A,W)) * store(&(vacc3x1.s2),float,fulln_acc(((kc@pre-k)/4),kc@pre/4,row_alias(mr@pre,3),(nc@pre-nc)+6,A,W)) * store(&(vacc3x1.s3),float,fulln_acc(((kc@pre-k)/4),kc@pre/4,row_alias(mr@pre,3),(nc@pre-nc)+7,A,W)) */
    for (; k >= 2 * sizeof(float); k -= 2 * sizeof(float)) {
      const float32x2_t va0 = vld1_f32(a0) /*@ where base=a@pre, n=kc@pre, L=A, j=(a0-a@pre) */; a0 += 2;
      const float32x2_t va1 = vld1_f32(a1) /*@ where base=a@pre, n=kc@pre, L=A, j=(a1-a@pre) */; a1 += 2;
      const float32x2_t va2 = vld1_f32(a2) /*@ where base=a@pre, n=kc@pre, L=A, j=(a2-a@pre) */; a2 += 2;
      const float32x2_t va3 = vld1_f32(a3) /*@ where base=a@pre, n=kc@pre, L=A, j=(a3-a@pre) */; a3 += 2;
      const float32x4_t vb0123c0 = vld1q_f32(w) /*@ where base=w@pre, n=8*(kc@pre/4+1)*panel_count(nc@pre), L=W, j=(w-w@pre) */; w += 4;
      const float32x4_t vb4567c0 = vld1q_f32(w) /*@ where base=w@pre, n=8*(kc@pre/4+1)*panel_count(nc@pre), L=W, j=(w-w@pre) */; w += 4;
      const float32x4_t vb0123c1 = vld1q_f32(w) /*@ where base=w@pre, n=8*(kc@pre/4+1)*panel_count(nc@pre), L=W, j=(w-w@pre) */; w += 4;
      const float32x4_t vb4567c1 = vld1q_f32(w) /*@ where base=w@pre, n=8*(kc@pre/4+1)*panel_count(nc@pre), L=W, j=(w-w@pre) */; w += 4;
      const float32x4_t va0c0 = vdupq_lane_f32(va0, 0) /*@ where a=&va0 */;
      const float32x4_t va1c0 = vdupq_lane_f32(va1, 0) /*@ where a=&va1 */;
      const float32x4_t va2c0 = vdupq_lane_f32(va2, 0) /*@ where a=&va2 */;
      const float32x4_t va3c0 = vdupq_lane_f32(va3, 0) /*@ where a=&va3 */;
      vacc0x0 = vfmaq_f32(vacc0x0, va0c0, vb0123c0) /*@ where acc=&vacc0x0, a=&va0c0, b=&vb0123c0 */;
      vacc1x0 = vfmaq_f32(vacc1x0, va1c0, vb0123c0) /*@ where acc=&vacc1x0, a=&va1c0, b=&vb0123c0 */;
      vacc2x0 = vfmaq_f32(vacc2x0, va2c0, vb0123c0) /*@ where acc=&vacc2x0, a=&va2c0, b=&vb0123c0 */;
      vacc3x0 = vfmaq_f32(vacc3x0, va3c0, vb0123c0) /*@ where acc=&vacc3x0, a=&va3c0, b=&vb0123c0 */;
      vacc0x1 = vfmaq_f32(vacc0x1, va0c0, vb4567c0) /*@ where acc=&vacc0x1, a=&va0c0, b=&vb4567c0 */;
      vacc1x1 = vfmaq_f32(vacc1x1, va1c0, vb4567c0) /*@ where acc=&vacc1x1, a=&va1c0, b=&vb4567c0 */;
      vacc2x1 = vfmaq_f32(vacc2x1, va2c0, vb4567c0) /*@ where acc=&vacc2x1, a=&va2c0, b=&vb4567c0 */;
      vacc3x1 = vfmaq_f32(vacc3x1, va3c0, vb4567c0) /*@ where acc=&vacc3x1, a=&va3c0, b=&vb4567c0 */;
      const float32x4_t va0c1 = vdupq_lane_f32(va0, 1) /*@ where a=&va0 */;
      const float32x4_t va1c1 = vdupq_lane_f32(va1, 1) /*@ where a=&va1 */;
      const float32x4_t va2c1 = vdupq_lane_f32(va2, 1) /*@ where a=&va2 */;
      const float32x4_t va3c1 = vdupq_lane_f32(va3, 1) /*@ where a=&va3 */;
      vacc0x0 = vfmaq_f32(vacc0x0, va0c1, vb0123c1) /*@ where acc=&vacc0x0, a=&va0c1, b=&vb0123c1 */;
      vacc1x0 = vfmaq_f32(vacc1x0, va1c1, vb0123c1) /*@ where acc=&vacc1x0, a=&va1c1, b=&vb0123c1 */;
      vacc2x0 = vfmaq_f32(vacc2x0, va2c1, vb0123c1) /*@ where acc=&vacc2x0, a=&va2c1, b=&vb0123c1 */;
      vacc3x0 = vfmaq_f32(vacc3x0, va3c1, vb0123c1) /*@ where acc=&vacc3x0, a=&va3c1, b=&vb0123c1 */;
      vacc0x1 = vfmaq_f32(vacc0x1, va0c1, vb4567c1) /*@ where acc=&vacc0x1, a=&va0c1, b=&vb4567c1 */;
      vacc1x1 = vfmaq_f32(vacc1x1, va1c1, vb4567c1) /*@ where acc=&vacc1x1, a=&va1c1, b=&vb4567c1 */;
      vacc2x1 = vfmaq_f32(vacc2x1, va2c1, vb4567c1) /*@ where acc=&vacc2x1, a=&va2c1, b=&vb4567c1 */;
      vacc3x1 = vfmaq_f32(vacc3x1, va3c1, vb4567c1) /*@ where acc=&vacc3x1, a=&va3c1, b=&vb4567c1 */;
    }
    if (k != 0) {
      const float32x4_t va0 = vld1q_dup_f32(a0) /*@ where base=a@pre, n=kc@pre, L=A, j=(a0-a@pre) */; a0 += 1;
      const float32x4_t va1 = vld1q_dup_f32(a1) /*@ where base=a@pre, n=kc@pre, L=A, j=(a1-a@pre) */; a1 += 1;
      const float32x4_t va2 = vld1q_dup_f32(a2) /*@ where base=a@pre, n=kc@pre, L=A, j=(a2-a@pre) */; a2 += 1;
      const float32x4_t va3 = vld1q_dup_f32(a3) /*@ where base=a@pre, n=kc@pre, L=A, j=(a3-a@pre) */; a3 += 1;
      const float32x4_t vb0123 = vld1q_f32(w) /*@ where base=w@pre, n=8*(kc@pre/4+1)*panel_count(nc@pre), L=W, j=(w-w@pre) */; w += 4;
      const float32x4_t vb4567 = vld1q_f32(w) /*@ where base=w@pre, n=8*(kc@pre/4+1)*panel_count(nc@pre), L=W, j=(w-w@pre) */; w += 4;
      vacc0x0 = vfmaq_f32(vacc0x0, va0, vb0123) /*@ where acc=&vacc0x0, a=&va0, b=&vb0123 */;
      vacc1x0 = vfmaq_f32(vacc1x0, va1, vb0123) /*@ where acc=&vacc1x0, a=&va1, b=&vb0123 */;
      vacc2x0 = vfmaq_f32(vacc2x0, va2, vb0123) /*@ where acc=&vacc2x0, a=&va2, b=&vb0123 */;
      vacc3x0 = vfmaq_f32(vacc3x0, va3, vb0123) /*@ where acc=&vacc3x0, a=&va3, b=&vb0123 */;
      vacc0x1 = vfmaq_f32(vacc0x1, va0, vb4567) /*@ where acc=&vacc0x1, a=&va0, b=&vb4567 */;
      vacc1x1 = vfmaq_f32(vacc1x1, va1, vb4567) /*@ where acc=&vacc1x1, a=&va1, b=&vb4567 */;
      vacc2x1 = vfmaq_f32(vacc2x1, va2, vb4567) /*@ where acc=&vacc2x1, a=&va2, b=&vb4567 */;
      vacc3x1 = vfmaq_f32(vacc3x1, va3, vb4567) /*@ where acc=&vacc3x1, a=&va3, b=&vb4567 */;
    }
    const float32x4_t vmax = vdupq_n_f32(params->scalar.max);
    vacc0x0 = vminq_f32(vacc0x0, vmax) /*@ where a=&vacc0x0, b=&vmax */;
    vacc1x0 = vminq_f32(vacc1x0, vmax) /*@ where a=&vacc1x0, b=&vmax */;
    vacc2x0 = vminq_f32(vacc2x0, vmax) /*@ where a=&vacc2x0, b=&vmax */;
    vacc3x0 = vminq_f32(vacc3x0, vmax) /*@ where a=&vacc3x0, b=&vmax */;
    vacc0x1 = vminq_f32(vacc0x1, vmax) /*@ where a=&vacc0x1, b=&vmax */;
    vacc1x1 = vminq_f32(vacc1x1, vmax) /*@ where a=&vacc1x1, b=&vmax */;
    vacc2x1 = vminq_f32(vacc2x1, vmax) /*@ where a=&vacc2x1, b=&vmax */;
    vacc3x1 = vminq_f32(vacc3x1, vmax) /*@ where a=&vacc3x1, b=&vmax */;
    const float32x4_t vmin = vdupq_n_f32(params->scalar.min);
    vacc0x0 = vmaxq_f32(vacc0x0, vmin) /*@ where a=&vacc0x0, b=&vmin */;
    vacc1x0 = vmaxq_f32(vacc1x0, vmin) /*@ where a=&vacc1x0, b=&vmin */;
    vacc2x0 = vmaxq_f32(vacc2x0, vmin) /*@ where a=&vacc2x0, b=&vmin */;
    vacc3x0 = vmaxq_f32(vacc3x0, vmin) /*@ where a=&vacc3x0, b=&vmin */;
    vacc0x1 = vmaxq_f32(vacc0x1, vmin) /*@ where a=&vacc0x1, b=&vmin */;
    vacc1x1 = vmaxq_f32(vacc1x1, vmin) /*@ where a=&vacc1x1, b=&vmin */;
    vacc2x1 = vmaxq_f32(vacc2x1, vmin) /*@ where a=&vacc2x1, b=&vmin */;
    vacc3x1 = vmaxq_f32(vacc3x1, vmin) /*@ where a=&vacc3x1, b=&vmin */;
/*@ Assert 1<=mr@pre && mr@pre<=4 && 1<=nc@pre && 4<=kc@pre && kc@pre%4==0 && a_stride@pre==kc@pre && cm_stride@pre==4*nc@pre && cn_stride@pre==32 && a@pre!=0 && w@pre!=0 && c@pre!=0 && params@pre!=0 && 4*kc@pre<=18446744073709551615 && (uintptr_t)a@pre+4*kc@pre<=18446744073709551615 && 16*nc@pre<=18446744073709551615 && (uintptr_t)c@pre+16*nc@pre<=18446744073709551615 && 32*(kc@pre/4+1)*panel_count(nc@pre)<=18446744073709551615 && (uintptr_t)w@pre+32*(kc@pre/4+1)*panel_count(nc@pre)<=18446744073709551615 && mr==mr@pre && kc==kc@pre && a==a@pre && c==c@pre && params==params@pre && a_stride==kc@pre && cm_stride==4*nc@pre && cn_stride==32 && 0<nc && nc<=nc@pre && (nc@pre-nc)%8==0 && a0==a@pre+row_alias(mr@pre,0)*(kc@pre/4)+(kc@pre/4) && a1==a@pre+row_alias(mr@pre,1)*(kc@pre/4)+(kc@pre/4) && a2==a@pre+row_alias(mr@pre,2)*(kc@pre/4)+(kc@pre/4) && a3==a@pre+row_alias(mr@pre,3)*(kc@pre/4)+(kc@pre/4) && c0==pointer_offset(c@pre,row_alias(mr@pre,0)*nc@pre+(nc@pre-nc)+0,float) && c1==pointer_offset(c@pre,row_alias(mr@pre,1)*nc@pre+(nc@pre-nc)+0,float) && c2==pointer_offset(c@pre,row_alias(mr@pre,2)*nc@pre+(nc@pre-nc)+0,float) && c3==pointer_offset(c@pre,row_alias(mr@pre,3)*nc@pre+(nc@pre-nc)+0,float) && w==w@pre+8*((kc@pre/4)+1)*(((nc@pre-nc)/8)+1) && FloatArray::full(a@pre,kc@pre,A) * FloatArray::full(w@pre,8*((kc@pre/4)+1)*panel_count(nc@pre),W) * output_state(c@pre,mr@pre,nc@pre,(kc@pre/4),(nc@pre-nc),A,W,lo,hi) * store(&(params->scalar.min),float,lo) * store(&(params->scalar.max),float,hi) * UndefStructPredfloat32x4_t(&vmin) * UndefStructPredfloat32x4_t(&vmax) * store(&(vacc0x0.s0),float,full_cell(A,W,(kc@pre/4),row_alias(mr@pre,0),(nc@pre-nc)+0,lo,hi)) * store(&(vacc0x0.s1),float,full_cell(A,W,(kc@pre/4),row_alias(mr@pre,0),(nc@pre-nc)+1,lo,hi)) * store(&(vacc0x0.s2),float,full_cell(A,W,(kc@pre/4),row_alias(mr@pre,0),(nc@pre-nc)+2,lo,hi)) * store(&(vacc0x0.s3),float,full_cell(A,W,(kc@pre/4),row_alias(mr@pre,0),(nc@pre-nc)+3,lo,hi)) * store(&(vacc0x1.s0),float,full_cell(A,W,(kc@pre/4),row_alias(mr@pre,0),(nc@pre-nc)+4,lo,hi)) * store(&(vacc0x1.s1),float,full_cell(A,W,(kc@pre/4),row_alias(mr@pre,0),(nc@pre-nc)+5,lo,hi)) * store(&(vacc0x1.s2),float,full_cell(A,W,(kc@pre/4),row_alias(mr@pre,0),(nc@pre-nc)+6,lo,hi)) * store(&(vacc0x1.s3),float,full_cell(A,W,(kc@pre/4),row_alias(mr@pre,0),(nc@pre-nc)+7,lo,hi)) * store(&(vacc1x0.s0),float,full_cell(A,W,(kc@pre/4),row_alias(mr@pre,1),(nc@pre-nc)+0,lo,hi)) * store(&(vacc1x0.s1),float,full_cell(A,W,(kc@pre/4),row_alias(mr@pre,1),(nc@pre-nc)+1,lo,hi)) * store(&(vacc1x0.s2),float,full_cell(A,W,(kc@pre/4),row_alias(mr@pre,1),(nc@pre-nc)+2,lo,hi)) * store(&(vacc1x0.s3),float,full_cell(A,W,(kc@pre/4),row_alias(mr@pre,1),(nc@pre-nc)+3,lo,hi)) * store(&(vacc1x1.s0),float,full_cell(A,W,(kc@pre/4),row_alias(mr@pre,1),(nc@pre-nc)+4,lo,hi)) * store(&(vacc1x1.s1),float,full_cell(A,W,(kc@pre/4),row_alias(mr@pre,1),(nc@pre-nc)+5,lo,hi)) * store(&(vacc1x1.s2),float,full_cell(A,W,(kc@pre/4),row_alias(mr@pre,1),(nc@pre-nc)+6,lo,hi)) * store(&(vacc1x1.s3),float,full_cell(A,W,(kc@pre/4),row_alias(mr@pre,1),(nc@pre-nc)+7,lo,hi)) * store(&(vacc2x0.s0),float,full_cell(A,W,(kc@pre/4),row_alias(mr@pre,2),(nc@pre-nc)+0,lo,hi)) * store(&(vacc2x0.s1),float,full_cell(A,W,(kc@pre/4),row_alias(mr@pre,2),(nc@pre-nc)+1,lo,hi)) * store(&(vacc2x0.s2),float,full_cell(A,W,(kc@pre/4),row_alias(mr@pre,2),(nc@pre-nc)+2,lo,hi)) * store(&(vacc2x0.s3),float,full_cell(A,W,(kc@pre/4),row_alias(mr@pre,2),(nc@pre-nc)+3,lo,hi)) * store(&(vacc2x1.s0),float,full_cell(A,W,(kc@pre/4),row_alias(mr@pre,2),(nc@pre-nc)+4,lo,hi)) * store(&(vacc2x1.s1),float,full_cell(A,W,(kc@pre/4),row_alias(mr@pre,2),(nc@pre-nc)+5,lo,hi)) * store(&(vacc2x1.s2),float,full_cell(A,W,(kc@pre/4),row_alias(mr@pre,2),(nc@pre-nc)+6,lo,hi)) * store(&(vacc2x1.s3),float,full_cell(A,W,(kc@pre/4),row_alias(mr@pre,2),(nc@pre-nc)+7,lo,hi)) * store(&(vacc3x0.s0),float,full_cell(A,W,(kc@pre/4),row_alias(mr@pre,3),(nc@pre-nc)+0,lo,hi)) * store(&(vacc3x0.s1),float,full_cell(A,W,(kc@pre/4),row_alias(mr@pre,3),(nc@pre-nc)+1,lo,hi)) * store(&(vacc3x0.s2),float,full_cell(A,W,(kc@pre/4),row_alias(mr@pre,3),(nc@pre-nc)+2,lo,hi)) * store(&(vacc3x0.s3),float,full_cell(A,W,(kc@pre/4),row_alias(mr@pre,3),(nc@pre-nc)+3,lo,hi)) * store(&(vacc3x1.s0),float,full_cell(A,W,(kc@pre/4),row_alias(mr@pre,3),(nc@pre-nc)+4,lo,hi)) * store(&(vacc3x1.s1),float,full_cell(A,W,(kc@pre/4),row_alias(mr@pre,3),(nc@pre-nc)+5,lo,hi)) * store(&(vacc3x1.s2),float,full_cell(A,W,(kc@pre/4),row_alias(mr@pre,3),(nc@pre-nc)+6,lo,hi)) * store(&(vacc3x1.s3),float,full_cell(A,W,(kc@pre/4),row_alias(mr@pre,3),(nc@pre-nc)+7,lo,hi))  * has_permission(&k) */
    if (nc >= 8) {
/*@ 1<=mr@pre && mr@pre<=4 && 0<nc && nc<=nc@pre && nc>=8 && c0==pointer_offset(c@pre,row_alias(mr@pre,0)*nc@pre+(nc@pre-nc)+0,float) && output_state(c@pre,mr@pre,nc@pre,(kc@pre/4),(nc@pre-nc),A,W,lo,hi) which implies 1<=mr@pre && mr@pre<=4 && 0<nc && nc<=nc@pre && nc>=8 && c0==pointer_offset(c@pre,row_alias(mr@pre,0)*nc@pre+(nc@pre-nc)+0,float) && neon_phase_frame(c@pre,mr@pre,nc@pre,(kc@pre/4),(nc@pre-nc),0,8,0,row_alias(mr@pre,0),A,W,lo,hi) * FloatArray::undef_full(c0,4) * FloatArray::undef_full(pointer_offset(c@pre,row_alias(mr@pre,0)*nc@pre+(nc@pre-nc)+0+4,float),4) */
      qcp_vst1q_f32((c0),&(vacc0x0))/*@ where a=&vacc0x0 */;
      qcp_vst1q_f32((c0 + 4),&(vacc0x1))/*@ where a=&vacc0x1 */;
/*@ 1<=mr@pre && mr@pre<=4 && 0<nc && nc<=nc@pre && nc>=8 && c0==pointer_offset(c@pre,row_alias(mr@pre,0)*nc@pre+(nc@pre-nc)+0,float) && neon_phase_frame(c@pre,mr@pre,nc@pre,(kc@pre/4),(nc@pre-nc),0,8,0,row_alias(mr@pre,0),A,W,lo,hi) * FloatArray::full(c0,4,cons(full_cell(A,W,(kc@pre/4),row_alias(mr@pre,0),(nc@pre-nc)+(0+0),lo,hi),cons(full_cell(A,W,(kc@pre/4),row_alias(mr@pre,0),(nc@pre-nc)+(0+1),lo,hi),cons(full_cell(A,W,(kc@pre/4),row_alias(mr@pre,0),(nc@pre-nc)+(0+2),lo,hi),cons(full_cell(A,W,(kc@pre/4),row_alias(mr@pre,0),(nc@pre-nc)+(0+3),lo,hi),nil))))) * FloatArray::full(pointer_offset(c@pre,row_alias(mr@pre,0)*nc@pre+(nc@pre-nc)+0+4,float),4,cons(full_cell(A,W,(kc@pre/4),row_alias(mr@pre,0),(nc@pre-nc)+(4+0),lo,hi),cons(full_cell(A,W,(kc@pre/4),row_alias(mr@pre,0),(nc@pre-nc)+(4+1),lo,hi),cons(full_cell(A,W,(kc@pre/4),row_alias(mr@pre,0),(nc@pre-nc)+(4+2),lo,hi),cons(full_cell(A,W,(kc@pre/4),row_alias(mr@pre,0),(nc@pre-nc)+(4+3),lo,hi),nil))))) which implies 1<=mr@pre && mr@pre<=4 && 0<nc && nc<=nc@pre && nc>=8 && c0==pointer_offset(c@pre,row_alias(mr@pre,0)*nc@pre+(nc@pre-nc)+0,float) && neon_phase_state(c@pre,mr@pre,nc@pre,(kc@pre/4),(nc@pre-nc),0,8,1,A,W,lo,hi) */
      c0 = (float*) ((uintptr_t) c0 + cn_stride);
/*@ 1<=mr@pre && mr@pre<=4 && 0<nc && nc<=nc@pre && nc>=8 && c1==pointer_offset(c@pre,row_alias(mr@pre,1)*nc@pre+(nc@pre-nc)+0,float) && neon_phase_state(c@pre,mr@pre,nc@pre,(kc@pre/4),(nc@pre-nc),0,8,1,A,W,lo,hi) which implies 1<=mr@pre && mr@pre<=4 && 0<nc && nc<=nc@pre && nc>=8 && c1==pointer_offset(c@pre,row_alias(mr@pre,1)*nc@pre+(nc@pre-nc)+0,float) && neon_phase_frame(c@pre,mr@pre,nc@pre,(kc@pre/4),(nc@pre-nc),0,8,1,row_alias(mr@pre,1),A,W,lo,hi) * FloatArray::undef_full(c1,4) * FloatArray::undef_full(pointer_offset(c@pre,row_alias(mr@pre,1)*nc@pre+(nc@pre-nc)+0+4,float),4) */
      qcp_vst1q_f32((c1),&(vacc1x0))/*@ where a=&vacc1x0 */;
      qcp_vst1q_f32((c1 + 4),&(vacc1x1))/*@ where a=&vacc1x1 */;
/*@ 1<=mr@pre && mr@pre<=4 && 0<nc && nc<=nc@pre && nc>=8 && c1==pointer_offset(c@pre,row_alias(mr@pre,1)*nc@pre+(nc@pre-nc)+0,float) && neon_phase_frame(c@pre,mr@pre,nc@pre,(kc@pre/4),(nc@pre-nc),0,8,1,row_alias(mr@pre,1),A,W,lo,hi) * FloatArray::full(c1,4,cons(full_cell(A,W,(kc@pre/4),row_alias(mr@pre,1),(nc@pre-nc)+(0+0),lo,hi),cons(full_cell(A,W,(kc@pre/4),row_alias(mr@pre,1),(nc@pre-nc)+(0+1),lo,hi),cons(full_cell(A,W,(kc@pre/4),row_alias(mr@pre,1),(nc@pre-nc)+(0+2),lo,hi),cons(full_cell(A,W,(kc@pre/4),row_alias(mr@pre,1),(nc@pre-nc)+(0+3),lo,hi),nil))))) * FloatArray::full(pointer_offset(c@pre,row_alias(mr@pre,1)*nc@pre+(nc@pre-nc)+0+4,float),4,cons(full_cell(A,W,(kc@pre/4),row_alias(mr@pre,1),(nc@pre-nc)+(4+0),lo,hi),cons(full_cell(A,W,(kc@pre/4),row_alias(mr@pre,1),(nc@pre-nc)+(4+1),lo,hi),cons(full_cell(A,W,(kc@pre/4),row_alias(mr@pre,1),(nc@pre-nc)+(4+2),lo,hi),cons(full_cell(A,W,(kc@pre/4),row_alias(mr@pre,1),(nc@pre-nc)+(4+3),lo,hi),nil))))) which implies 1<=mr@pre && mr@pre<=4 && 0<nc && nc<=nc@pre && nc>=8 && c1==pointer_offset(c@pre,row_alias(mr@pre,1)*nc@pre+(nc@pre-nc)+0,float) && neon_phase_state(c@pre,mr@pre,nc@pre,(kc@pre/4),(nc@pre-nc),0,8,2,A,W,lo,hi) */
      c1 = (float*) ((uintptr_t) c1 + cn_stride);
/*@ 1<=mr@pre && mr@pre<=4 && 0<nc && nc<=nc@pre && nc>=8 && c2==pointer_offset(c@pre,row_alias(mr@pre,2)*nc@pre+(nc@pre-nc)+0,float) && neon_phase_state(c@pre,mr@pre,nc@pre,(kc@pre/4),(nc@pre-nc),0,8,2,A,W,lo,hi) which implies 1<=mr@pre && mr@pre<=4 && 0<nc && nc<=nc@pre && nc>=8 && c2==pointer_offset(c@pre,row_alias(mr@pre,2)*nc@pre+(nc@pre-nc)+0,float) && neon_phase_frame(c@pre,mr@pre,nc@pre,(kc@pre/4),(nc@pre-nc),0,8,2,row_alias(mr@pre,2),A,W,lo,hi) * FloatArray::undef_full(c2,4) * FloatArray::undef_full(pointer_offset(c@pre,row_alias(mr@pre,2)*nc@pre+(nc@pre-nc)+0+4,float),4) */
      qcp_vst1q_f32((c2),&(vacc2x0))/*@ where a=&vacc2x0 */;
      qcp_vst1q_f32((c2 + 4),&(vacc2x1))/*@ where a=&vacc2x1 */;
/*@ 1<=mr@pre && mr@pre<=4 && 0<nc && nc<=nc@pre && nc>=8 && c2==pointer_offset(c@pre,row_alias(mr@pre,2)*nc@pre+(nc@pre-nc)+0,float) && neon_phase_frame(c@pre,mr@pre,nc@pre,(kc@pre/4),(nc@pre-nc),0,8,2,row_alias(mr@pre,2),A,W,lo,hi) * FloatArray::full(c2,4,cons(full_cell(A,W,(kc@pre/4),row_alias(mr@pre,2),(nc@pre-nc)+(0+0),lo,hi),cons(full_cell(A,W,(kc@pre/4),row_alias(mr@pre,2),(nc@pre-nc)+(0+1),lo,hi),cons(full_cell(A,W,(kc@pre/4),row_alias(mr@pre,2),(nc@pre-nc)+(0+2),lo,hi),cons(full_cell(A,W,(kc@pre/4),row_alias(mr@pre,2),(nc@pre-nc)+(0+3),lo,hi),nil))))) * FloatArray::full(pointer_offset(c@pre,row_alias(mr@pre,2)*nc@pre+(nc@pre-nc)+0+4,float),4,cons(full_cell(A,W,(kc@pre/4),row_alias(mr@pre,2),(nc@pre-nc)+(4+0),lo,hi),cons(full_cell(A,W,(kc@pre/4),row_alias(mr@pre,2),(nc@pre-nc)+(4+1),lo,hi),cons(full_cell(A,W,(kc@pre/4),row_alias(mr@pre,2),(nc@pre-nc)+(4+2),lo,hi),cons(full_cell(A,W,(kc@pre/4),row_alias(mr@pre,2),(nc@pre-nc)+(4+3),lo,hi),nil))))) which implies 1<=mr@pre && mr@pre<=4 && 0<nc && nc<=nc@pre && nc>=8 && c2==pointer_offset(c@pre,row_alias(mr@pre,2)*nc@pre+(nc@pre-nc)+0,float) && neon_phase_state(c@pre,mr@pre,nc@pre,(kc@pre/4),(nc@pre-nc),0,8,3,A,W,lo,hi) */
      c2 = (float*) ((uintptr_t) c2 + cn_stride);
/*@ 1<=mr@pre && mr@pre<=4 && 0<nc && nc<=nc@pre && nc>=8 && c3==pointer_offset(c@pre,row_alias(mr@pre,3)*nc@pre+(nc@pre-nc)+0,float) && neon_phase_state(c@pre,mr@pre,nc@pre,(kc@pre/4),(nc@pre-nc),0,8,3,A,W,lo,hi) which implies 1<=mr@pre && mr@pre<=4 && 0<nc && nc<=nc@pre && nc>=8 && c3==pointer_offset(c@pre,row_alias(mr@pre,3)*nc@pre+(nc@pre-nc)+0,float) && neon_phase_frame(c@pre,mr@pre,nc@pre,(kc@pre/4),(nc@pre-nc),0,8,3,row_alias(mr@pre,3),A,W,lo,hi) * FloatArray::undef_full(c3,4) * FloatArray::undef_full(pointer_offset(c@pre,row_alias(mr@pre,3)*nc@pre+(nc@pre-nc)+0+4,float),4) */
      qcp_vst1q_f32((c3),&(vacc3x0))/*@ where a=&vacc3x0 */;
      qcp_vst1q_f32((c3 + 4),&(vacc3x1))/*@ where a=&vacc3x1 */;
/*@ 1<=mr@pre && mr@pre<=4 && 0<nc && nc<=nc@pre && nc>=8 && c3==pointer_offset(c@pre,row_alias(mr@pre,3)*nc@pre+(nc@pre-nc)+0,float) && neon_phase_frame(c@pre,mr@pre,nc@pre,(kc@pre/4),(nc@pre-nc),0,8,3,row_alias(mr@pre,3),A,W,lo,hi) * FloatArray::full(c3,4,cons(full_cell(A,W,(kc@pre/4),row_alias(mr@pre,3),(nc@pre-nc)+(0+0),lo,hi),cons(full_cell(A,W,(kc@pre/4),row_alias(mr@pre,3),(nc@pre-nc)+(0+1),lo,hi),cons(full_cell(A,W,(kc@pre/4),row_alias(mr@pre,3),(nc@pre-nc)+(0+2),lo,hi),cons(full_cell(A,W,(kc@pre/4),row_alias(mr@pre,3),(nc@pre-nc)+(0+3),lo,hi),nil))))) * FloatArray::full(pointer_offset(c@pre,row_alias(mr@pre,3)*nc@pre+(nc@pre-nc)+0+4,float),4,cons(full_cell(A,W,(kc@pre/4),row_alias(mr@pre,3),(nc@pre-nc)+(4+0),lo,hi),cons(full_cell(A,W,(kc@pre/4),row_alias(mr@pre,3),(nc@pre-nc)+(4+1),lo,hi),cons(full_cell(A,W,(kc@pre/4),row_alias(mr@pre,3),(nc@pre-nc)+(4+2),lo,hi),cons(full_cell(A,W,(kc@pre/4),row_alias(mr@pre,3),(nc@pre-nc)+(4+3),lo,hi),nil))))) which implies 1<=mr@pre && mr@pre<=4 && 0<nc && nc<=nc@pre && nc>=8 && c3==pointer_offset(c@pre,row_alias(mr@pre,3)*nc@pre+(nc@pre-nc)+0,float) && neon_phase_state(c@pre,mr@pre,nc@pre,(kc@pre/4),(nc@pre-nc),0,8,4,A,W,lo,hi) */
      c3 = (float*) ((uintptr_t) c3 + cn_stride);
      a0 = (const float*) ((uintptr_t) a0 - kc);
      a1 = (const float*) ((uintptr_t) a1 - kc);
      a2 = (const float*) ((uintptr_t) a2 - kc);
      a3 = (const float*) ((uintptr_t) a3 - kc);
/*@ neon_phase_state(c@pre,mr@pre,nc@pre,(kc@pre/4),(nc@pre-nc),0,8,4,A,W,lo,hi) which implies output_state(c@pre,mr@pre,nc@pre,(kc@pre/4),(nc@pre-nc)+8,A,W,lo,hi) */
      nc -= 8;
    } else {
      if (nc & 4) {
/*@ 1<=mr@pre && mr@pre<=4 && 0<nc && nc<=nc@pre && nc<8 && (nc&4)!=0 && c0==pointer_offset(c@pre,row_alias(mr@pre,0)*nc@pre+(nc@pre-nc)+0,float) && output_state(c@pre,mr@pre,nc@pre,(kc@pre/4),(nc@pre-nc),A,W,lo,hi) which implies 1<=mr@pre && mr@pre<=4 && 0<nc && nc<=nc@pre && nc<8 && (nc&4)!=0 && c0==pointer_offset(c@pre,row_alias(mr@pre,0)*nc@pre+(nc@pre-nc)+0,float) && neon_phase_frame(c@pre,mr@pre,nc@pre,(kc@pre/4),(nc@pre-nc),0,4,0,row_alias(mr@pre,0),A,W,lo,hi) * FloatArray::undef_full(c0,4) */
        qcp_vst1q_f32((c0),&(vacc0x0))/*@ where a=&vacc0x0 */;
/*@ 1<=mr@pre && mr@pre<=4 && 0<nc && nc<=nc@pre && nc<8 && (nc&4)!=0 && c0==pointer_offset(c@pre,row_alias(mr@pre,0)*nc@pre+(nc@pre-nc)+0,float) && neon_phase_frame(c@pre,mr@pre,nc@pre,(kc@pre/4),(nc@pre-nc),0,4,0,row_alias(mr@pre,0),A,W,lo,hi) * FloatArray::full(c0,4,cons(full_cell(A,W,(kc@pre/4),row_alias(mr@pre,0),(nc@pre-nc)+(0+0),lo,hi),cons(full_cell(A,W,(kc@pre/4),row_alias(mr@pre,0),(nc@pre-nc)+(0+1),lo,hi),cons(full_cell(A,W,(kc@pre/4),row_alias(mr@pre,0),(nc@pre-nc)+(0+2),lo,hi),cons(full_cell(A,W,(kc@pre/4),row_alias(mr@pre,0),(nc@pre-nc)+(0+3),lo,hi),nil))))) which implies 1<=mr@pre && mr@pre<=4 && 0<nc && nc<=nc@pre && nc<8 && (nc&4)!=0 && c0==pointer_offset(c@pre,row_alias(mr@pre,0)*nc@pre+(nc@pre-nc)+0,float) && neon_phase_state(c@pre,mr@pre,nc@pre,(kc@pre/4),(nc@pre-nc),0,4,1,A,W,lo,hi) */
 c0 += 4;
/*@ 1<=mr@pre && mr@pre<=4 && 0<nc && nc<=nc@pre && nc<8 && (nc&4)!=0 && c1==pointer_offset(c@pre,row_alias(mr@pre,1)*nc@pre+(nc@pre-nc)+0,float) && neon_phase_state(c@pre,mr@pre,nc@pre,(kc@pre/4),(nc@pre-nc),0,4,1,A,W,lo,hi) which implies 1<=mr@pre && mr@pre<=4 && 0<nc && nc<=nc@pre && nc<8 && (nc&4)!=0 && c1==pointer_offset(c@pre,row_alias(mr@pre,1)*nc@pre+(nc@pre-nc)+0,float) && neon_phase_frame(c@pre,mr@pre,nc@pre,(kc@pre/4),(nc@pre-nc),0,4,1,row_alias(mr@pre,1),A,W,lo,hi) * FloatArray::undef_full(c1,4) */
        qcp_vst1q_f32((c1),&(vacc1x0))/*@ where a=&vacc1x0 */;
/*@ 1<=mr@pre && mr@pre<=4 && 0<nc && nc<=nc@pre && nc<8 && (nc&4)!=0 && c1==pointer_offset(c@pre,row_alias(mr@pre,1)*nc@pre+(nc@pre-nc)+0,float) && neon_phase_frame(c@pre,mr@pre,nc@pre,(kc@pre/4),(nc@pre-nc),0,4,1,row_alias(mr@pre,1),A,W,lo,hi) * FloatArray::full(c1,4,cons(full_cell(A,W,(kc@pre/4),row_alias(mr@pre,1),(nc@pre-nc)+(0+0),lo,hi),cons(full_cell(A,W,(kc@pre/4),row_alias(mr@pre,1),(nc@pre-nc)+(0+1),lo,hi),cons(full_cell(A,W,(kc@pre/4),row_alias(mr@pre,1),(nc@pre-nc)+(0+2),lo,hi),cons(full_cell(A,W,(kc@pre/4),row_alias(mr@pre,1),(nc@pre-nc)+(0+3),lo,hi),nil))))) which implies 1<=mr@pre && mr@pre<=4 && 0<nc && nc<=nc@pre && nc<8 && (nc&4)!=0 && c1==pointer_offset(c@pre,row_alias(mr@pre,1)*nc@pre+(nc@pre-nc)+0,float) && neon_phase_state(c@pre,mr@pre,nc@pre,(kc@pre/4),(nc@pre-nc),0,4,2,A,W,lo,hi) */
 c1 += 4;
/*@ 1<=mr@pre && mr@pre<=4 && 0<nc && nc<=nc@pre && nc<8 && (nc&4)!=0 && c2==pointer_offset(c@pre,row_alias(mr@pre,2)*nc@pre+(nc@pre-nc)+0,float) && neon_phase_state(c@pre,mr@pre,nc@pre,(kc@pre/4),(nc@pre-nc),0,4,2,A,W,lo,hi) which implies 1<=mr@pre && mr@pre<=4 && 0<nc && nc<=nc@pre && nc<8 && (nc&4)!=0 && c2==pointer_offset(c@pre,row_alias(mr@pre,2)*nc@pre+(nc@pre-nc)+0,float) && neon_phase_frame(c@pre,mr@pre,nc@pre,(kc@pre/4),(nc@pre-nc),0,4,2,row_alias(mr@pre,2),A,W,lo,hi) * FloatArray::undef_full(c2,4) */
        qcp_vst1q_f32((c2),&(vacc2x0))/*@ where a=&vacc2x0 */;
/*@ 1<=mr@pre && mr@pre<=4 && 0<nc && nc<=nc@pre && nc<8 && (nc&4)!=0 && c2==pointer_offset(c@pre,row_alias(mr@pre,2)*nc@pre+(nc@pre-nc)+0,float) && neon_phase_frame(c@pre,mr@pre,nc@pre,(kc@pre/4),(nc@pre-nc),0,4,2,row_alias(mr@pre,2),A,W,lo,hi) * FloatArray::full(c2,4,cons(full_cell(A,W,(kc@pre/4),row_alias(mr@pre,2),(nc@pre-nc)+(0+0),lo,hi),cons(full_cell(A,W,(kc@pre/4),row_alias(mr@pre,2),(nc@pre-nc)+(0+1),lo,hi),cons(full_cell(A,W,(kc@pre/4),row_alias(mr@pre,2),(nc@pre-nc)+(0+2),lo,hi),cons(full_cell(A,W,(kc@pre/4),row_alias(mr@pre,2),(nc@pre-nc)+(0+3),lo,hi),nil))))) which implies 1<=mr@pre && mr@pre<=4 && 0<nc && nc<=nc@pre && nc<8 && (nc&4)!=0 && c2==pointer_offset(c@pre,row_alias(mr@pre,2)*nc@pre+(nc@pre-nc)+0,float) && neon_phase_state(c@pre,mr@pre,nc@pre,(kc@pre/4),(nc@pre-nc),0,4,3,A,W,lo,hi) */
 c2 += 4;
/*@ 1<=mr@pre && mr@pre<=4 && 0<nc && nc<=nc@pre && nc<8 && (nc&4)!=0 && c3==pointer_offset(c@pre,row_alias(mr@pre,3)*nc@pre+(nc@pre-nc)+0,float) && neon_phase_state(c@pre,mr@pre,nc@pre,(kc@pre/4),(nc@pre-nc),0,4,3,A,W,lo,hi) which implies 1<=mr@pre && mr@pre<=4 && 0<nc && nc<=nc@pre && nc<8 && (nc&4)!=0 && c3==pointer_offset(c@pre,row_alias(mr@pre,3)*nc@pre+(nc@pre-nc)+0,float) && neon_phase_frame(c@pre,mr@pre,nc@pre,(kc@pre/4),(nc@pre-nc),0,4,3,row_alias(mr@pre,3),A,W,lo,hi) * FloatArray::undef_full(c3,4) */
        qcp_vst1q_f32((c3),&(vacc3x0))/*@ where a=&vacc3x0 */;
/*@ 1<=mr@pre && mr@pre<=4 && 0<nc && nc<=nc@pre && nc<8 && (nc&4)!=0 && c3==pointer_offset(c@pre,row_alias(mr@pre,3)*nc@pre+(nc@pre-nc)+0,float) && neon_phase_frame(c@pre,mr@pre,nc@pre,(kc@pre/4),(nc@pre-nc),0,4,3,row_alias(mr@pre,3),A,W,lo,hi) * FloatArray::full(c3,4,cons(full_cell(A,W,(kc@pre/4),row_alias(mr@pre,3),(nc@pre-nc)+(0+0),lo,hi),cons(full_cell(A,W,(kc@pre/4),row_alias(mr@pre,3),(nc@pre-nc)+(0+1),lo,hi),cons(full_cell(A,W,(kc@pre/4),row_alias(mr@pre,3),(nc@pre-nc)+(0+2),lo,hi),cons(full_cell(A,W,(kc@pre/4),row_alias(mr@pre,3),(nc@pre-nc)+(0+3),lo,hi),nil))))) which implies 1<=mr@pre && mr@pre<=4 && 0<nc && nc<=nc@pre && nc<8 && (nc&4)!=0 && c3==pointer_offset(c@pre,row_alias(mr@pre,3)*nc@pre+(nc@pre-nc)+0,float) && neon_phase_state(c@pre,mr@pre,nc@pre,(kc@pre/4),(nc@pre-nc),0,4,4,A,W,lo,hi) */
/*@ neon_phase_state(c@pre,mr@pre,nc@pre,(kc@pre/4),(nc@pre-nc),0,4,4,A,W,lo,hi) which implies output_state(c@pre,mr@pre,nc@pre,(kc@pre/4),(nc@pre-nc)+0+4,A,W,lo,hi) */
 c3 += 4;
        vacc0x0 = vacc0x1;
        vacc1x0 = vacc1x1;
        vacc2x0 = vacc2x1;
        vacc3x0 = vacc3x1;
      }
/*@ Assert 1<=mr@pre && mr@pre<=4 && 1<=nc@pre && 4<=kc@pre && kc@pre%4==0 && a_stride@pre==kc@pre && cm_stride@pre==4*nc@pre && cn_stride@pre==32 && a@pre!=0 && w@pre!=0 && c@pre!=0 && params@pre!=0 && 4*kc@pre<=18446744073709551615 && (uintptr_t)a@pre+4*kc@pre<=18446744073709551615 && 16*nc@pre<=18446744073709551615 && (uintptr_t)c@pre+16*nc@pre<=18446744073709551615 && 32*(kc@pre/4+1)*panel_count(nc@pre)<=18446744073709551615 && (uintptr_t)w@pre+32*(kc@pre/4+1)*panel_count(nc@pre)<=18446744073709551615 && mr==mr@pre && kc==kc@pre && a==a@pre && c==c@pre && params==params@pre && a_stride==kc@pre && cm_stride==4*nc@pre && cn_stride==32 && 0<nc && nc<=nc@pre && (nc@pre-nc)%8==0 && nc<8 && a0==a@pre+row_alias(mr@pre,0)*(kc@pre/4)+(kc@pre/4) && a1==a@pre+row_alias(mr@pre,1)*(kc@pre/4)+(kc@pre/4) && a2==a@pre+row_alias(mr@pre,2)*(kc@pre/4)+(kc@pre/4) && a3==a@pre+row_alias(mr@pre,3)*(kc@pre/4)+(kc@pre/4) && c0==pointer_offset(c@pre,row_alias(mr@pre,0)*nc@pre+(nc@pre-nc)+(nc&4),float) && c1==pointer_offset(c@pre,row_alias(mr@pre,1)*nc@pre+(nc@pre-nc)+(nc&4),float) && c2==pointer_offset(c@pre,row_alias(mr@pre,2)*nc@pre+(nc@pre-nc)+(nc&4),float) && c3==pointer_offset(c@pre,row_alias(mr@pre,3)*nc@pre+(nc@pre-nc)+(nc&4),float) && w==w@pre+8*((kc@pre/4)+1)*(((nc@pre-nc)/8)+1) && FloatArray::full(a@pre,kc@pre,A) * FloatArray::full(w@pre,8*((kc@pre/4)+1)*panel_count(nc@pre),W) * output_state(c@pre,mr@pre,nc@pre,(kc@pre/4),(nc@pre-nc)+(nc&4),A,W,lo,hi) * store(&(params->scalar.min),float,lo) * store(&(params->scalar.max),float,hi) * UndefStructPredfloat32x4_t(&vmin) * UndefStructPredfloat32x4_t(&vmax) * store(&(vacc0x0.s0),float,full_cell(A,W,(kc@pre/4),row_alias(mr@pre,0),(nc@pre-nc)+(nc&4)+0,lo,hi)) * store(&(vacc0x0.s1),float,full_cell(A,W,(kc@pre/4),row_alias(mr@pre,0),(nc@pre-nc)+(nc&4)+1,lo,hi)) * store(&(vacc0x0.s2),float,full_cell(A,W,(kc@pre/4),row_alias(mr@pre,0),(nc@pre-nc)+(nc&4)+2,lo,hi)) * store(&(vacc0x0.s3),float,full_cell(A,W,(kc@pre/4),row_alias(mr@pre,0),(nc@pre-nc)+(nc&4)+3,lo,hi)) * UndefStructPredfloat32x4_t(&vacc0x1) * store(&(vacc1x0.s0),float,full_cell(A,W,(kc@pre/4),row_alias(mr@pre,1),(nc@pre-nc)+(nc&4)+0,lo,hi)) * store(&(vacc1x0.s1),float,full_cell(A,W,(kc@pre/4),row_alias(mr@pre,1),(nc@pre-nc)+(nc&4)+1,lo,hi)) * store(&(vacc1x0.s2),float,full_cell(A,W,(kc@pre/4),row_alias(mr@pre,1),(nc@pre-nc)+(nc&4)+2,lo,hi)) * store(&(vacc1x0.s3),float,full_cell(A,W,(kc@pre/4),row_alias(mr@pre,1),(nc@pre-nc)+(nc&4)+3,lo,hi)) * UndefStructPredfloat32x4_t(&vacc1x1) * store(&(vacc2x0.s0),float,full_cell(A,W,(kc@pre/4),row_alias(mr@pre,2),(nc@pre-nc)+(nc&4)+0,lo,hi)) * store(&(vacc2x0.s1),float,full_cell(A,W,(kc@pre/4),row_alias(mr@pre,2),(nc@pre-nc)+(nc&4)+1,lo,hi)) * store(&(vacc2x0.s2),float,full_cell(A,W,(kc@pre/4),row_alias(mr@pre,2),(nc@pre-nc)+(nc&4)+2,lo,hi)) * store(&(vacc2x0.s3),float,full_cell(A,W,(kc@pre/4),row_alias(mr@pre,2),(nc@pre-nc)+(nc&4)+3,lo,hi)) * UndefStructPredfloat32x4_t(&vacc2x1) * store(&(vacc3x0.s0),float,full_cell(A,W,(kc@pre/4),row_alias(mr@pre,3),(nc@pre-nc)+(nc&4)+0,lo,hi)) * store(&(vacc3x0.s1),float,full_cell(A,W,(kc@pre/4),row_alias(mr@pre,3),(nc@pre-nc)+(nc&4)+1,lo,hi)) * store(&(vacc3x0.s2),float,full_cell(A,W,(kc@pre/4),row_alias(mr@pre,3),(nc@pre-nc)+(nc&4)+2,lo,hi)) * store(&(vacc3x0.s3),float,full_cell(A,W,(kc@pre/4),row_alias(mr@pre,3),(nc@pre-nc)+(nc&4)+3,lo,hi)) * UndefStructPredfloat32x4_t(&vacc3x1)  * has_permission(&k) */
      float32x2_t vacc0 = vget_low_f32(vacc0x0) /*@ where a=&vacc0x0 */;
      float32x2_t vacc1 = vget_low_f32(vacc1x0) /*@ where a=&vacc1x0 */;
      float32x2_t vacc2 = vget_low_f32(vacc2x0) /*@ where a=&vacc2x0 */;
      float32x2_t vacc3 = vget_low_f32(vacc3x0) /*@ where a=&vacc3x0 */;
      if (nc & 2) {
/*@ 1<=mr@pre && mr@pre<=4 && 0<nc && nc<=nc@pre && nc<8 && (nc&2)!=0 && c0==pointer_offset(c@pre,row_alias(mr@pre,0)*nc@pre+(nc@pre-nc)+(nc&4),float) && output_state(c@pre,mr@pre,nc@pre,(kc@pre/4),(nc@pre-nc)+(nc&4),A,W,lo,hi) which implies 1<=mr@pre && mr@pre<=4 && 0<nc && nc<=nc@pre && nc<8 && (nc&2)!=0 && c0==pointer_offset(c@pre,row_alias(mr@pre,0)*nc@pre+(nc@pre-nc)+(nc&4),float) && neon_phase_frame(c@pre,mr@pre,nc@pre,(kc@pre/4),(nc@pre-nc),(nc&4),2,0,row_alias(mr@pre,0),A,W,lo,hi) * FloatArray::undef_full(c0,2) */
        qcp_vst1_f32((c0),&(vacc0))/*@ where a=&vacc0 */;
/*@ 1<=mr@pre && mr@pre<=4 && 0<nc && nc<=nc@pre && nc<8 && (nc&2)!=0 && c0==pointer_offset(c@pre,row_alias(mr@pre,0)*nc@pre+(nc@pre-nc)+(nc&4),float) && neon_phase_frame(c@pre,mr@pre,nc@pre,(kc@pre/4),(nc@pre-nc),(nc&4),2,0,row_alias(mr@pre,0),A,W,lo,hi) * FloatArray::full(c0,2,cons(full_cell(A,W,(kc@pre/4),row_alias(mr@pre,0),(nc@pre-nc)+((nc&4)+0),lo,hi),cons(full_cell(A,W,(kc@pre/4),row_alias(mr@pre,0),(nc@pre-nc)+((nc&4)+1),lo,hi),nil))) which implies 1<=mr@pre && mr@pre<=4 && 0<nc && nc<=nc@pre && nc<8 && (nc&2)!=0 && c0==pointer_offset(c@pre,row_alias(mr@pre,0)*nc@pre+(nc@pre-nc)+(nc&4),float) && neon_phase_state(c@pre,mr@pre,nc@pre,(kc@pre/4),(nc@pre-nc),(nc&4),2,1,A,W,lo,hi) */
 c0 += 2;
/*@ 1<=mr@pre && mr@pre<=4 && 0<nc && nc<=nc@pre && nc<8 && (nc&2)!=0 && c1==pointer_offset(c@pre,row_alias(mr@pre,1)*nc@pre+(nc@pre-nc)+(nc&4),float) && neon_phase_state(c@pre,mr@pre,nc@pre,(kc@pre/4),(nc@pre-nc),(nc&4),2,1,A,W,lo,hi) which implies 1<=mr@pre && mr@pre<=4 && 0<nc && nc<=nc@pre && nc<8 && (nc&2)!=0 && c1==pointer_offset(c@pre,row_alias(mr@pre,1)*nc@pre+(nc@pre-nc)+(nc&4),float) && neon_phase_frame(c@pre,mr@pre,nc@pre,(kc@pre/4),(nc@pre-nc),(nc&4),2,1,row_alias(mr@pre,1),A,W,lo,hi) * FloatArray::undef_full(c1,2) */
        qcp_vst1_f32((c1),&(vacc1))/*@ where a=&vacc1 */;
/*@ 1<=mr@pre && mr@pre<=4 && 0<nc && nc<=nc@pre && nc<8 && (nc&2)!=0 && c1==pointer_offset(c@pre,row_alias(mr@pre,1)*nc@pre+(nc@pre-nc)+(nc&4),float) && neon_phase_frame(c@pre,mr@pre,nc@pre,(kc@pre/4),(nc@pre-nc),(nc&4),2,1,row_alias(mr@pre,1),A,W,lo,hi) * FloatArray::full(c1,2,cons(full_cell(A,W,(kc@pre/4),row_alias(mr@pre,1),(nc@pre-nc)+((nc&4)+0),lo,hi),cons(full_cell(A,W,(kc@pre/4),row_alias(mr@pre,1),(nc@pre-nc)+((nc&4)+1),lo,hi),nil))) which implies 1<=mr@pre && mr@pre<=4 && 0<nc && nc<=nc@pre && nc<8 && (nc&2)!=0 && c1==pointer_offset(c@pre,row_alias(mr@pre,1)*nc@pre+(nc@pre-nc)+(nc&4),float) && neon_phase_state(c@pre,mr@pre,nc@pre,(kc@pre/4),(nc@pre-nc),(nc&4),2,2,A,W,lo,hi) */
 c1 += 2;
/*@ 1<=mr@pre && mr@pre<=4 && 0<nc && nc<=nc@pre && nc<8 && (nc&2)!=0 && c2==pointer_offset(c@pre,row_alias(mr@pre,2)*nc@pre+(nc@pre-nc)+(nc&4),float) && neon_phase_state(c@pre,mr@pre,nc@pre,(kc@pre/4),(nc@pre-nc),(nc&4),2,2,A,W,lo,hi) which implies 1<=mr@pre && mr@pre<=4 && 0<nc && nc<=nc@pre && nc<8 && (nc&2)!=0 && c2==pointer_offset(c@pre,row_alias(mr@pre,2)*nc@pre+(nc@pre-nc)+(nc&4),float) && neon_phase_frame(c@pre,mr@pre,nc@pre,(kc@pre/4),(nc@pre-nc),(nc&4),2,2,row_alias(mr@pre,2),A,W,lo,hi) * FloatArray::undef_full(c2,2) */
        qcp_vst1_f32((c2),&(vacc2))/*@ where a=&vacc2 */;
/*@ 1<=mr@pre && mr@pre<=4 && 0<nc && nc<=nc@pre && nc<8 && (nc&2)!=0 && c2==pointer_offset(c@pre,row_alias(mr@pre,2)*nc@pre+(nc@pre-nc)+(nc&4),float) && neon_phase_frame(c@pre,mr@pre,nc@pre,(kc@pre/4),(nc@pre-nc),(nc&4),2,2,row_alias(mr@pre,2),A,W,lo,hi) * FloatArray::full(c2,2,cons(full_cell(A,W,(kc@pre/4),row_alias(mr@pre,2),(nc@pre-nc)+((nc&4)+0),lo,hi),cons(full_cell(A,W,(kc@pre/4),row_alias(mr@pre,2),(nc@pre-nc)+((nc&4)+1),lo,hi),nil))) which implies 1<=mr@pre && mr@pre<=4 && 0<nc && nc<=nc@pre && nc<8 && (nc&2)!=0 && c2==pointer_offset(c@pre,row_alias(mr@pre,2)*nc@pre+(nc@pre-nc)+(nc&4),float) && neon_phase_state(c@pre,mr@pre,nc@pre,(kc@pre/4),(nc@pre-nc),(nc&4),2,3,A,W,lo,hi) */
 c2 += 2;
/*@ 1<=mr@pre && mr@pre<=4 && 0<nc && nc<=nc@pre && nc<8 && (nc&2)!=0 && c3==pointer_offset(c@pre,row_alias(mr@pre,3)*nc@pre+(nc@pre-nc)+(nc&4),float) && neon_phase_state(c@pre,mr@pre,nc@pre,(kc@pre/4),(nc@pre-nc),(nc&4),2,3,A,W,lo,hi) which implies 1<=mr@pre && mr@pre<=4 && 0<nc && nc<=nc@pre && nc<8 && (nc&2)!=0 && c3==pointer_offset(c@pre,row_alias(mr@pre,3)*nc@pre+(nc@pre-nc)+(nc&4),float) && neon_phase_frame(c@pre,mr@pre,nc@pre,(kc@pre/4),(nc@pre-nc),(nc&4),2,3,row_alias(mr@pre,3),A,W,lo,hi) * FloatArray::undef_full(c3,2) */
        qcp_vst1_f32((c3),&(vacc3))/*@ where a=&vacc3 */;
/*@ 1<=mr@pre && mr@pre<=4 && 0<nc && nc<=nc@pre && nc<8 && (nc&2)!=0 && c3==pointer_offset(c@pre,row_alias(mr@pre,3)*nc@pre+(nc@pre-nc)+(nc&4),float) && neon_phase_frame(c@pre,mr@pre,nc@pre,(kc@pre/4),(nc@pre-nc),(nc&4),2,3,row_alias(mr@pre,3),A,W,lo,hi) * FloatArray::full(c3,2,cons(full_cell(A,W,(kc@pre/4),row_alias(mr@pre,3),(nc@pre-nc)+((nc&4)+0),lo,hi),cons(full_cell(A,W,(kc@pre/4),row_alias(mr@pre,3),(nc@pre-nc)+((nc&4)+1),lo,hi),nil))) which implies 1<=mr@pre && mr@pre<=4 && 0<nc && nc<=nc@pre && nc<8 && (nc&2)!=0 && c3==pointer_offset(c@pre,row_alias(mr@pre,3)*nc@pre+(nc@pre-nc)+(nc&4),float) && neon_phase_state(c@pre,mr@pre,nc@pre,(kc@pre/4),(nc@pre-nc),(nc&4),2,4,A,W,lo,hi) */
/*@ neon_phase_state(c@pre,mr@pre,nc@pre,(kc@pre/4),(nc@pre-nc),(nc&4),2,4,A,W,lo,hi) which implies output_state(c@pre,mr@pre,nc@pre,(kc@pre/4),(nc@pre-nc)+(nc&4)+2,A,W,lo,hi) */
 c3 += 2;
        vacc0 = vget_high_f32(vacc0x0) /*@ where a=&vacc0x0 */;
        vacc1 = vget_high_f32(vacc1x0) /*@ where a=&vacc1x0 */;
        vacc2 = vget_high_f32(vacc2x0) /*@ where a=&vacc2x0 */;
        vacc3 = vget_high_f32(vacc3x0) /*@ where a=&vacc3x0 */;
      }
/*@ Assert 1<=mr@pre && mr@pre<=4 && 1<=nc@pre && 4<=kc@pre && kc@pre%4==0 && a_stride@pre==kc@pre && cm_stride@pre==4*nc@pre && cn_stride@pre==32 && a@pre!=0 && w@pre!=0 && c@pre!=0 && params@pre!=0 && 4*kc@pre<=18446744073709551615 && (uintptr_t)a@pre+4*kc@pre<=18446744073709551615 && 16*nc@pre<=18446744073709551615 && (uintptr_t)c@pre+16*nc@pre<=18446744073709551615 && 32*(kc@pre/4+1)*panel_count(nc@pre)<=18446744073709551615 && (uintptr_t)w@pre+32*(kc@pre/4+1)*panel_count(nc@pre)<=18446744073709551615 && mr==mr@pre && kc==kc@pre && a==a@pre && c==c@pre && params==params@pre && a_stride==kc@pre && cm_stride==4*nc@pre && cn_stride==32 && 0<nc && nc<=nc@pre && (nc@pre-nc)%8==0 && nc<8 && a0==a@pre+row_alias(mr@pre,0)*(kc@pre/4)+(kc@pre/4) && a1==a@pre+row_alias(mr@pre,1)*(kc@pre/4)+(kc@pre/4) && a2==a@pre+row_alias(mr@pre,2)*(kc@pre/4)+(kc@pre/4) && a3==a@pre+row_alias(mr@pre,3)*(kc@pre/4)+(kc@pre/4) && c0==pointer_offset(c@pre,row_alias(mr@pre,0)*nc@pre+(nc@pre-nc)+((nc&4)+(nc&2)),float) && c1==pointer_offset(c@pre,row_alias(mr@pre,1)*nc@pre+(nc@pre-nc)+((nc&4)+(nc&2)),float) && c2==pointer_offset(c@pre,row_alias(mr@pre,2)*nc@pre+(nc@pre-nc)+((nc&4)+(nc&2)),float) && c3==pointer_offset(c@pre,row_alias(mr@pre,3)*nc@pre+(nc@pre-nc)+((nc&4)+(nc&2)),float) && w==w@pre+8*((kc@pre/4)+1)*(((nc@pre-nc)/8)+1) && FloatArray::full(a@pre,kc@pre,A) * FloatArray::full(w@pre,8*((kc@pre/4)+1)*panel_count(nc@pre),W) * output_state(c@pre,mr@pre,nc@pre,(kc@pre/4),(nc@pre-nc)+((nc&4)+(nc&2)),A,W,lo,hi) * store(&(params->scalar.min),float,lo) * store(&(params->scalar.max),float,hi) * UndefStructPredfloat32x4_t(&vmin) * UndefStructPredfloat32x4_t(&vmax) * UndefStructPredfloat32x4_t(&vacc0x0) * UndefStructPredfloat32x4_t(&vacc0x1) * store(&(vacc0.s0),float,full_cell(A,W,(kc@pre/4),row_alias(mr@pre,0),(nc@pre-nc)+((nc&4)+(nc&2))+0,lo,hi)) * store(&(vacc0.s1),float,full_cell(A,W,(kc@pre/4),row_alias(mr@pre,0),(nc@pre-nc)+((nc&4)+(nc&2))+1,lo,hi)) * UndefStructPredfloat32x4_t(&vacc1x0) * UndefStructPredfloat32x4_t(&vacc1x1) * store(&(vacc1.s0),float,full_cell(A,W,(kc@pre/4),row_alias(mr@pre,1),(nc@pre-nc)+((nc&4)+(nc&2))+0,lo,hi)) * store(&(vacc1.s1),float,full_cell(A,W,(kc@pre/4),row_alias(mr@pre,1),(nc@pre-nc)+((nc&4)+(nc&2))+1,lo,hi)) * UndefStructPredfloat32x4_t(&vacc2x0) * UndefStructPredfloat32x4_t(&vacc2x1) * store(&(vacc2.s0),float,full_cell(A,W,(kc@pre/4),row_alias(mr@pre,2),(nc@pre-nc)+((nc&4)+(nc&2))+0,lo,hi)) * store(&(vacc2.s1),float,full_cell(A,W,(kc@pre/4),row_alias(mr@pre,2),(nc@pre-nc)+((nc&4)+(nc&2))+1,lo,hi)) * UndefStructPredfloat32x4_t(&vacc3x0) * UndefStructPredfloat32x4_t(&vacc3x1) * store(&(vacc3.s0),float,full_cell(A,W,(kc@pre/4),row_alias(mr@pre,3),(nc@pre-nc)+((nc&4)+(nc&2))+0,lo,hi)) * store(&(vacc3.s1),float,full_cell(A,W,(kc@pre/4),row_alias(mr@pre,3),(nc@pre-nc)+((nc&4)+(nc&2))+1,lo,hi))  * has_permission(&k) */
      if (nc & 1) {
/*@ 1<=mr@pre && mr@pre<=4 && 0<nc && nc<=nc@pre && nc<8 && (nc&1)!=0 && c0==pointer_offset(c@pre,row_alias(mr@pre,0)*nc@pre+(nc@pre-nc)+((nc&4)+(nc&2)),float) && output_state(c@pre,mr@pre,nc@pre,(kc@pre/4),(nc@pre-nc)+((nc&4)+(nc&2)),A,W,lo,hi) which implies 1<=mr@pre && mr@pre<=4 && 0<nc && nc<=nc@pre && nc<8 && (nc&1)!=0 && c0==pointer_offset(c@pre,row_alias(mr@pre,0)*nc@pre+(nc@pre-nc)+((nc&4)+(nc&2)),float) && neon_phase_frame(c@pre,mr@pre,nc@pre,(kc@pre/4),(nc@pre-nc),((nc&4)+(nc&2)),1,0,row_alias(mr@pre,0),A,W,lo,hi) * FloatArray::undef_full(c0,1) */
        qcp_vst1_lane_f32((c0),&(vacc0),(0))/*@ where a=&vacc0 */;
/*@ 1<=mr@pre && mr@pre<=4 && 0<nc && nc<=nc@pre && nc<8 && (nc&1)!=0 && c0==pointer_offset(c@pre,row_alias(mr@pre,0)*nc@pre+(nc@pre-nc)+((nc&4)+(nc&2)),float) && neon_phase_frame(c@pre,mr@pre,nc@pre,(kc@pre/4),(nc@pre-nc),((nc&4)+(nc&2)),1,0,row_alias(mr@pre,0),A,W,lo,hi) * FloatArray::full(c0,1,cons(full_cell(A,W,(kc@pre/4),row_alias(mr@pre,0),(nc@pre-nc)+(((nc&4)+(nc&2))+0),lo,hi),nil)) which implies 1<=mr@pre && mr@pre<=4 && 0<nc && nc<=nc@pre && nc<8 && (nc&1)!=0 && c0==pointer_offset(c@pre,row_alias(mr@pre,0)*nc@pre+(nc@pre-nc)+((nc&4)+(nc&2)),float) && neon_phase_state(c@pre,mr@pre,nc@pre,(kc@pre/4),(nc@pre-nc),((nc&4)+(nc&2)),1,1,A,W,lo,hi) */
/*@ 1<=mr@pre && mr@pre<=4 && 0<nc && nc<=nc@pre && nc<8 && (nc&1)!=0 && c1==pointer_offset(c@pre,row_alias(mr@pre,1)*nc@pre+(nc@pre-nc)+((nc&4)+(nc&2)),float) && neon_phase_state(c@pre,mr@pre,nc@pre,(kc@pre/4),(nc@pre-nc),((nc&4)+(nc&2)),1,1,A,W,lo,hi) which implies 1<=mr@pre && mr@pre<=4 && 0<nc && nc<=nc@pre && nc<8 && (nc&1)!=0 && c1==pointer_offset(c@pre,row_alias(mr@pre,1)*nc@pre+(nc@pre-nc)+((nc&4)+(nc&2)),float) && neon_phase_frame(c@pre,mr@pre,nc@pre,(kc@pre/4),(nc@pre-nc),((nc&4)+(nc&2)),1,1,row_alias(mr@pre,1),A,W,lo,hi) * FloatArray::undef_full(c1,1) */
        qcp_vst1_lane_f32((c1),&(vacc1),(0))/*@ where a=&vacc1 */;
/*@ 1<=mr@pre && mr@pre<=4 && 0<nc && nc<=nc@pre && nc<8 && (nc&1)!=0 && c1==pointer_offset(c@pre,row_alias(mr@pre,1)*nc@pre+(nc@pre-nc)+((nc&4)+(nc&2)),float) && neon_phase_frame(c@pre,mr@pre,nc@pre,(kc@pre/4),(nc@pre-nc),((nc&4)+(nc&2)),1,1,row_alias(mr@pre,1),A,W,lo,hi) * FloatArray::full(c1,1,cons(full_cell(A,W,(kc@pre/4),row_alias(mr@pre,1),(nc@pre-nc)+(((nc&4)+(nc&2))+0),lo,hi),nil)) which implies 1<=mr@pre && mr@pre<=4 && 0<nc && nc<=nc@pre && nc<8 && (nc&1)!=0 && c1==pointer_offset(c@pre,row_alias(mr@pre,1)*nc@pre+(nc@pre-nc)+((nc&4)+(nc&2)),float) && neon_phase_state(c@pre,mr@pre,nc@pre,(kc@pre/4),(nc@pre-nc),((nc&4)+(nc&2)),1,2,A,W,lo,hi) */
/*@ 1<=mr@pre && mr@pre<=4 && 0<nc && nc<=nc@pre && nc<8 && (nc&1)!=0 && c2==pointer_offset(c@pre,row_alias(mr@pre,2)*nc@pre+(nc@pre-nc)+((nc&4)+(nc&2)),float) && neon_phase_state(c@pre,mr@pre,nc@pre,(kc@pre/4),(nc@pre-nc),((nc&4)+(nc&2)),1,2,A,W,lo,hi) which implies 1<=mr@pre && mr@pre<=4 && 0<nc && nc<=nc@pre && nc<8 && (nc&1)!=0 && c2==pointer_offset(c@pre,row_alias(mr@pre,2)*nc@pre+(nc@pre-nc)+((nc&4)+(nc&2)),float) && neon_phase_frame(c@pre,mr@pre,nc@pre,(kc@pre/4),(nc@pre-nc),((nc&4)+(nc&2)),1,2,row_alias(mr@pre,2),A,W,lo,hi) * FloatArray::undef_full(c2,1) */
        qcp_vst1_lane_f32((c2),&(vacc2),(0))/*@ where a=&vacc2 */;
/*@ 1<=mr@pre && mr@pre<=4 && 0<nc && nc<=nc@pre && nc<8 && (nc&1)!=0 && c2==pointer_offset(c@pre,row_alias(mr@pre,2)*nc@pre+(nc@pre-nc)+((nc&4)+(nc&2)),float) && neon_phase_frame(c@pre,mr@pre,nc@pre,(kc@pre/4),(nc@pre-nc),((nc&4)+(nc&2)),1,2,row_alias(mr@pre,2),A,W,lo,hi) * FloatArray::full(c2,1,cons(full_cell(A,W,(kc@pre/4),row_alias(mr@pre,2),(nc@pre-nc)+(((nc&4)+(nc&2))+0),lo,hi),nil)) which implies 1<=mr@pre && mr@pre<=4 && 0<nc && nc<=nc@pre && nc<8 && (nc&1)!=0 && c2==pointer_offset(c@pre,row_alias(mr@pre,2)*nc@pre+(nc@pre-nc)+((nc&4)+(nc&2)),float) && neon_phase_state(c@pre,mr@pre,nc@pre,(kc@pre/4),(nc@pre-nc),((nc&4)+(nc&2)),1,3,A,W,lo,hi) */
/*@ 1<=mr@pre && mr@pre<=4 && 0<nc && nc<=nc@pre && nc<8 && (nc&1)!=0 && c3==pointer_offset(c@pre,row_alias(mr@pre,3)*nc@pre+(nc@pre-nc)+((nc&4)+(nc&2)),float) && neon_phase_state(c@pre,mr@pre,nc@pre,(kc@pre/4),(nc@pre-nc),((nc&4)+(nc&2)),1,3,A,W,lo,hi) which implies 1<=mr@pre && mr@pre<=4 && 0<nc && nc<=nc@pre && nc<8 && (nc&1)!=0 && c3==pointer_offset(c@pre,row_alias(mr@pre,3)*nc@pre+(nc@pre-nc)+((nc&4)+(nc&2)),float) && neon_phase_frame(c@pre,mr@pre,nc@pre,(kc@pre/4),(nc@pre-nc),((nc&4)+(nc&2)),1,3,row_alias(mr@pre,3),A,W,lo,hi) * FloatArray::undef_full(c3,1) */
        qcp_vst1_lane_f32((c3),&(vacc3),(0))/*@ where a=&vacc3 */;
/*@ 1<=mr@pre && mr@pre<=4 && 0<nc && nc<=nc@pre && nc<8 && (nc&1)!=0 && c3==pointer_offset(c@pre,row_alias(mr@pre,3)*nc@pre+(nc@pre-nc)+((nc&4)+(nc&2)),float) && neon_phase_frame(c@pre,mr@pre,nc@pre,(kc@pre/4),(nc@pre-nc),((nc&4)+(nc&2)),1,3,row_alias(mr@pre,3),A,W,lo,hi) * FloatArray::full(c3,1,cons(full_cell(A,W,(kc@pre/4),row_alias(mr@pre,3),(nc@pre-nc)+(((nc&4)+(nc&2))+0),lo,hi),nil)) which implies 1<=mr@pre && mr@pre<=4 && 0<nc && nc<=nc@pre && nc<8 && (nc&1)!=0 && c3==pointer_offset(c@pre,row_alias(mr@pre,3)*nc@pre+(nc@pre-nc)+((nc&4)+(nc&2)),float) && neon_phase_state(c@pre,mr@pre,nc@pre,(kc@pre/4),(nc@pre-nc),((nc&4)+(nc&2)),1,4,A,W,lo,hi) */
/*@ neon_phase_state(c@pre,mr@pre,nc@pre,(kc@pre/4),(nc@pre-nc),((nc&4)+(nc&2)),1,4,A,W,lo,hi) which implies output_state(c@pre,mr@pre,nc@pre,(kc@pre/4),(nc@pre-nc)+((nc&4)+(nc&2))+1,A,W,lo,hi) */
      }
/*@ Assert 1<=mr@pre && mr@pre<=4 && 1<=nc@pre && 4<=kc@pre && kc@pre%4==0 && a_stride@pre==kc@pre && cm_stride@pre==4*nc@pre && cn_stride@pre==32 && a@pre!=0 && w@pre!=0 && c@pre!=0 && params@pre!=0 && 4*kc@pre<=18446744073709551615 && (uintptr_t)a@pre+4*kc@pre<=18446744073709551615 && 16*nc@pre<=18446744073709551615 && (uintptr_t)c@pre+16*nc@pre<=18446744073709551615 && 32*(kc@pre/4+1)*panel_count(nc@pre)<=18446744073709551615 && (uintptr_t)w@pre+32*(kc@pre/4+1)*panel_count(nc@pre)<=18446744073709551615 && mr==mr@pre && kc==kc@pre && a==a@pre && c==c@pre && params==params@pre && a_stride==kc@pre && cm_stride==4*nc@pre && cn_stride==32 && 0<nc && nc<=nc@pre && (nc@pre-nc)%8==0 && nc<8 && a0==a@pre+row_alias(mr@pre,0)*(kc@pre/4)+(kc@pre/4) && a1==a@pre+row_alias(mr@pre,1)*(kc@pre/4)+(kc@pre/4) && a2==a@pre+row_alias(mr@pre,2)*(kc@pre/4)+(kc@pre/4) && a3==a@pre+row_alias(mr@pre,3)*(kc@pre/4)+(kc@pre/4) && c0==pointer_offset(c@pre,row_alias(mr@pre,0)*nc@pre+(nc@pre-nc)+((nc&4)+(nc&2)),float) && c1==pointer_offset(c@pre,row_alias(mr@pre,1)*nc@pre+(nc@pre-nc)+((nc&4)+(nc&2)),float) && c2==pointer_offset(c@pre,row_alias(mr@pre,2)*nc@pre+(nc@pre-nc)+((nc&4)+(nc&2)),float) && c3==pointer_offset(c@pre,row_alias(mr@pre,3)*nc@pre+(nc@pre-nc)+((nc&4)+(nc&2)),float) && w==w@pre+8*((kc@pre/4)+1)*(((nc@pre-nc)/8)+1) && FloatArray::full(a@pre,kc@pre,A) * FloatArray::full(w@pre,8*((kc@pre/4)+1)*panel_count(nc@pre),W) * output_state(c@pre,mr@pre,nc@pre,(kc@pre/4),(nc@pre-nc)+nc,A,W,lo,hi) * store(&(params->scalar.min),float,lo) * store(&(params->scalar.max),float,hi) * UndefStructPredfloat32x4_t(&vmin) * UndefStructPredfloat32x4_t(&vmax) * UndefStructPredfloat32x4_t(&vacc0x0) * UndefStructPredfloat32x4_t(&vacc0x1) * UndefStructPredfloat32x2_t(&vacc0) * UndefStructPredfloat32x4_t(&vacc1x0) * UndefStructPredfloat32x4_t(&vacc1x1) * UndefStructPredfloat32x2_t(&vacc1) * UndefStructPredfloat32x4_t(&vacc2x0) * UndefStructPredfloat32x4_t(&vacc2x1) * UndefStructPredfloat32x2_t(&vacc2) * UndefStructPredfloat32x4_t(&vacc3x0) * UndefStructPredfloat32x4_t(&vacc3x1) * UndefStructPredfloat32x2_t(&vacc3)  * has_permission(&k) */
      nc = 0;
    }
  } /*@ Inv Assert 1<=mr@pre && mr@pre<=4 && 1<=nc@pre && 4<=kc@pre && kc@pre%4==0 && a_stride@pre==kc@pre && cm_stride@pre==4*nc@pre && cn_stride@pre==32 && a@pre!=0 && w@pre!=0 && c@pre!=0 && params@pre!=0 && 4*kc@pre<=18446744073709551615 && (uintptr_t)a@pre+4*kc@pre<=18446744073709551615 && 16*nc@pre<=18446744073709551615 && (uintptr_t)c@pre+16*nc@pre<=18446744073709551615 && 32*(kc@pre/4+1)*panel_count(nc@pre)<=18446744073709551615 && (uintptr_t)w@pre+32*(kc@pre/4+1)*panel_count(nc@pre)<=18446744073709551615 && mr==mr@pre && 1<=mr && mr<=4 && kc==kc@pre && params==params@pre && a==a@pre && c==c@pre && a_stride==kc@pre && cm_stride==4*nc@pre && cn_stride==32 && 0<=nc && nc<=nc@pre && fulln_outer_ptrs(nc,mr@pre,nc@pre,kc@pre/4,a@pre,c@pre,a0,a1,a2,a3,c0,c1,c2,c3) && w==w@pre+8*(kc@pre/4+1)*panel_count(nc@pre-nc) &&
FloatArray::full(a@pre,kc@pre,A) * FloatArray::full(w@pre,8*(kc@pre/4+1)*panel_count(nc@pre),W) * output_state(c@pre,mr@pre,nc@pre,(kc@pre/4),(nc@pre-nc),A,W,lo,hi) * store(&(params->scalar.min),float,lo) * store(&(params->scalar.max),float,hi) */ while (nc != 0);
}
