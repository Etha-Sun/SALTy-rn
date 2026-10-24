typedef unsigned long long size_t;
typedef unsigned long long uintptr_t;
struct scalar_bounds {float min;float max;};
struct xnn_f32_minmax_params {struct scalar_bounds scalar;};
struct float32x4_t {float s0;float s1;float s2;float s3;};
struct float32x2_t {float s0;float s1;};
typedef struct float32x4_t float32x4_t;
typedef struct float32x2_t float32x2_t;
struct vfloat32m4_t {float s0;float s1;float s2;float s3;float s4;float s5;float s6;float s7;};
struct vbool8_t {int s0;int s1;int s2;int s3;int s4;int s5;int s6;int s7;};
typedef struct vfloat32m4_t vfloat32m4_t;
typedef struct vbool8_t vbool8_t;
/*@ Import Coq Require Import FloatIndirect.ApiModel */
/*@ Extern Coq
 (input_block :: *)
 (input_reference :: *) */
/*@ Extern Coq
 (igemm_shape : Z -> Z -> Z -> Z -> list Z -> list input_reference -> list input_block -> Z -> Z -> list fp32 -> Prop)
 (igemm_capacity : Z -> Z -> Z -> Z -> Z -> list input_block -> list input_reference -> Prop)
 (input_mapping : Z -> Z -> Z -> list Z -> list input_reference -> list input_block -> Prop)
 (input_pool : list input_block -> Assertion)
 (total_depth : Z -> list input_reference -> Z)
 (flat_inputs : list input_block -> list input_reference -> Z -> list fp32)
 (input_window : list input_block -> list input_reference -> Z -> Z -> list fp32)
 (input_address : list input_block -> list input_reference -> Z -> Z)
 (input_window_frame : list input_block -> list input_reference -> Z -> Z -> Assertion)
 (selected_address : Z -> Z -> Z -> Z)
 (select_domain : Z -> Z -> Z -> Prop)
 (ig_output_ref : Z -> Z -> Z -> list fp32 -> list fp32 -> fp32 -> fp32 -> Assertion)
 (ig_output_prefix : Z -> Z -> Z -> Z -> list fp32 -> list fp32 -> fp32 -> fp32 -> Assertion)
 (ig_write_state : Z -> Z -> Z -> list fp32 -> Assertion)
 (ig_fappend : list fp32 -> list fp32 -> list fp32)
 (ig_same_value : fp32 -> fp32 -> Prop)
 (ig_bit_same : fp32 -> fp32 -> Prop)
 (ig_outputs_related : list fp32 -> list fp32 -> Prop)
 (ig_ret_one : Z -> Prop)
 (igemm_acc : Z -> Z -> Z -> list fp32 -> list fp32 -> fp32)
 (igemm_output : Z -> Z -> list fp32 -> list fp32 -> fp32 -> fp32 -> list fp32)
 (panel_count : Z -> Z)
 (packed_length : Z -> Z -> Z)
 (packed_bias_index : Z -> Z -> Z)
 (packed_weight_index : Z -> Z -> Z -> Z)
 (FloatArray::full : Z -> Z -> list fp32 -> Assertion)
 (FloatArray::undef_full : Z -> Z -> Assertion)
 (FloatArray::missing_i : Z -> Z -> Z -> Z -> list fp32 -> Assertion)
 (PtrArray::full : Z -> Z -> list Z -> Assertion)
 (PtrArray::missing_i : Z -> Z -> Z -> Z -> list Z -> Assertion)
 (bit_same : fp32 -> fp32 -> Prop)
 (gget : Z -> list fp32 -> fp32)
 (glane : Z -> fp32 -> fp32 -> fp32)
 (rvv_at : list fp32 -> Z -> fp32)
 (rvv_nanth : fp32 -> Z)
 (rvv_merge : fp32 -> fp32 -> Z -> fp32)
 (fma_rne : fp32 -> fp32 -> fp32 -> fp32)
 (fp32_min_number : fp32 -> fp32 -> fp32)
 (fp32_max_number : fp32 -> fp32 -> fp32)
 (fp32_neon_min : fp32 -> fp32 -> fp32)
 (fp32_neon_max : fp32 -> fp32 -> fp32)
 (canonical_qnan : fp32)
 (active_value : Z -> Z -> fp32 -> fp32 -> Prop)
 (active_mask : Z -> Z -> Z -> Z -> Prop)
 (active8 : Z -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> Prop)
 (mask8 : Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Prop)
 (UndefStructPredfloat32x4_t : Z -> Assertion)
 (UndefStructPredfloat32x2_t : Z -> Assertion)
 (UndefStructPredvfloat32m4_t : Z -> Assertion)
 (UndefStructPredvbool8_t : Z -> Assertion) */
void qcp_assert(int condition) /*@ Require condition!=0 && emp Ensure emp */;
float qcp_identity(float x) /*@ Require emp Ensure bit_same(__return,x) && emp */;
int qcp_isnan(float x) /*@ Require emp Ensure __return==rvv_nanth(x) && emp */;
float qcp_nanf(void) /*@ Require emp Ensure bit_same(__return,canonical_qnan) && emp */;
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
/*@ With (x0:fp32) (x1:fp32) (x2:fp32) (x3:fp32) (base:Z) (N:Z) (done:Z) (L:list fp32)
 Require 0<=done && done+4<=N && p==base+4*done && store(&(a->s0),float,x0) * store(&(a->s1),float,x1) * store(&(a->s2),float,x2) * store(&(a->s3),float,x3) * ig_write_state(base,N,done,L)
 Ensure store(&(a->s0),float,x0) * store(&(a->s1),float,x1) * store(&(a->s2),float,x2) * store(&(a->s3),float,x3) * ig_write_state(base,N,done+4,ig_fappend(L,cons(x0,cons(x1,cons(x2,cons(x3,nil)))))) */;
void qcp_vst1_f32(float *p,const float32x2_t *a)
/*@ With (x0:fp32) (x1:fp32) (base:Z) (N:Z) (done:Z) (L:list fp32)
 Require 0<=done && done+2<=N && p==base+4*done && store(&(a->s0),float,x0) * store(&(a->s1),float,x1) * ig_write_state(base,N,done,L)
 Ensure store(&(a->s0),float,x0) * store(&(a->s1),float,x1) * ig_write_state(base,N,done+2,ig_fappend(L,cons(x0,cons(x1,nil)))) */;
void qcp_vst1_lane_f32(float *p,const float32x2_t *a,int lane)
/*@ With (x0:fp32) (x1:fp32) (base:Z) (N:Z) (done:Z) (L:list fp32)
 Require lane==0 && 0<=done && done+1<=N && p==base+4*done && store(&(a->s0),float,x0) * store(&(a->s1),float,x1) * ig_write_state(base,N,done,L)
 Ensure store(&(a->s0),float,x0) * store(&(a->s1),float,x1) * ig_write_state(base,N,done+1,ig_fappend(L,cons(x0,nil))) */;
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
    size_t ks,
    const float** restrict a,
    const float* restrict w,
    float* restrict c,
    size_t cm_stride,
    size_t cn_stride,
    size_t a_offset,
    const float* zero,
    const struct xnn_f32_minmax_params* restrict params)
/*@ With (Entries:list Z) (Refs:list input_reference) (Blocks:list input_block) (W:list fp32) (lo:fp32) (hi:fp32)
 Require mr==1 && 0<nc && nc<=4611686018427387903 && 0<kc && kc%4==0 && 0<ks && ks%8==0 && a_offset%4==0 && igemm_shape(mr,nc,kc/4,ks,Entries,Refs,Blocks,zero,a_offset,W) && igemm_capacity(nc,kc/4,a,w,c,Blocks,Refs) && cn_stride==32 && a!=0 && w!=0 && c!=0 && params!=0 &&
 PtrArray::full(a,ks/8,Entries) * input_pool(Blocks) * FloatArray::full(w,packed_length(nc,total_depth(kc/4,Refs)),W) * FloatArray::undef_full(c,nc) * store(&(params->scalar.min),float,lo) * store(&(params->scalar.max),float,hi)
 Ensure PtrArray::full(a@pre,ks@pre/8,Entries) * input_pool(Blocks) * FloatArray::full(w@pre,packed_length(nc@pre,total_depth(kc@pre/4,Refs)),W) * ig_output_ref(c@pre,total_depth(kc@pre/4,Refs),nc@pre,flat_inputs(Blocks,Refs,kc@pre/4),W,lo,hi) * store(&(params->scalar.min),float,lo) * store(&(params->scalar.max),float,hi) */
{
  qcp_assert(mr != 0);
  qcp_assert(mr <= 1);
  qcp_assert(nc != 0);
  qcp_assert(kc != 0);
/*@ emp which implies sizeof(float)==4 && sizeof(void*)==8 && emp */
qcp_assert(kc % sizeof(float) == 0);
  qcp_assert(ks != 0);
  qcp_assert(ks % (1 * sizeof(void*)) == 0);
  qcp_assert(a_offset % sizeof(float) == 0);
  qcp_assert(a != ((void*)0));
  qcp_assert(w != ((void*)0));
  qcp_assert(c != ((void*)0));
  float* c0 = c;
/*@ Inv Assert exists (ap:Z) (wp:Z) (cp:Z), mr==mr@pre && kc==kc@pre && ks==ks@pre && c==c@pre && params==params@pre && cm_stride==cm_stride@pre && a_offset==a_offset@pre && zero==zero@pre && cn_stride==32 && mr==1 && 0<nc@pre && nc@pre<=4611686018427387903 && 0<kc@pre && kc@pre%4==0 && 0<ks@pre && ks@pre%8==0 && a_offset@pre%4==0 && Zlength(Refs)==ks@pre/8 && Zlength(Entries)==Zlength(Refs) && Zlength(W)==packed_length(nc@pre,total_depth((kc@pre/4),Refs)) && igemm_shape(mr@pre,nc@pre,(kc@pre/4),ks@pre,Entries,Refs,Blocks,zero@pre,a_offset@pre,W) && input_mapping((kc@pre/4),zero@pre,a_offset@pre,Entries,Refs,Blocks) && igemm_capacity(nc@pre,(kc@pre/4),a@pre,w@pre,c@pre,Blocks,Refs) && sizeof(float)==4 && sizeof(void*)==8 && 0<=nc && nc<=nc@pre && a==ap && w==wp && c0==cp && (nc==0 || (0<nc && (nc@pre-nc)%8==0 && 0<=((nc@pre-nc)/8) && ((nc@pre-nc)/8)<panel_count(nc@pre) && ap==a@pre && cp==pointer_offset(c@pre,(nc@pre-nc),float) && wp==pointer_offset(w@pre,8*(total_depth((kc@pre/4),Refs)+1)*((nc@pre-nc)/8),float))) && input_pool(Blocks) * PtrArray::full(a@pre,ks@pre/8,Entries) * FloatArray::full(w@pre,packed_length(nc@pre,total_depth((kc@pre/4),Refs)),W) * ig_output_prefix(c@pre,nc@pre,(nc@pre-nc),total_depth((kc@pre/4),Refs),flat_inputs(Blocks,Refs,(kc@pre/4)),W,lo,hi) * store(&(params->scalar.min),float,lo) * store(&(params->scalar.max),float,hi) */
while (nc != 0) {
    float32x4_t vacc0x0 = vld1q_f32(w)
/*@ where base=w@pre,n=packed_length(nc@pre,total_depth((kc@pre/4),Refs)),j=8*(total_depth((kc@pre/4),Refs)+1)*((nc@pre-nc)/8)+0,L=W */
; w += 4;
    float32x4_t vacc0x1 = vld1q_f32(w)
/*@ where base=w@pre,n=packed_length(nc@pre,total_depth((kc@pre/4),Refs)),j=8*(total_depth((kc@pre/4),Refs)+1)*((nc@pre-nc)/8)+4,L=W */
; w += 4;
    size_t p = ks;
/*@ Inv Assert exists (z0:fp32) (z1:fp32) (z2:fp32) (z3:fp32) (z4:fp32) (z5:fp32) (z6:fp32) (z7:fp32), mr==mr@pre && kc==kc@pre && ks==ks@pre && c==c@pre && params==params@pre && cm_stride==cm_stride@pre && a_offset==a_offset@pre && zero==zero@pre && cn_stride==32 && mr==1 && 0<nc@pre && nc@pre<=4611686018427387903 && 0<kc@pre && kc@pre%4==0 && 0<ks@pre && ks@pre%8==0 && a_offset@pre%4==0 && Zlength(Refs)==ks@pre/8 && Zlength(Entries)==Zlength(Refs) && Zlength(W)==packed_length(nc@pre,total_depth((kc@pre/4),Refs)) && igemm_shape(mr@pre,nc@pre,(kc@pre/4),ks@pre,Entries,Refs,Blocks,zero@pre,a_offset@pre,W) && input_mapping((kc@pre/4),zero@pre,a_offset@pre,Entries,Refs,Blocks) && igemm_capacity(nc@pre,(kc@pre/4),a@pre,w@pre,c@pre,Blocks,Refs) && sizeof(float)==4 && sizeof(void*)==8 && 0<=nc && nc<=nc@pre && 0<nc && (nc@pre-nc)%8==0 && 0<=((nc@pre-nc)/8) && ((nc@pre-nc)/8)<panel_count(nc@pre) && c0==pointer_offset(c@pre,(nc@pre-nc),float) && 0<=p && p<=ks@pre && p%8==0 && a==pointer_offset(a@pre,((ks@pre-p)/8),float*) && w==pointer_offset(w@pre,8*(total_depth((kc@pre/4),Refs)+1)*((nc@pre-nc)/8)+8+8*(((ks@pre-p)/8)*(kc@pre/4)),float) && bit_same(z0,igemm_acc(((ks@pre-p)/8)*(kc@pre/4),total_depth((kc@pre/4),Refs),(nc@pre-nc)+0,flat_inputs(Blocks,Refs,(kc@pre/4)),W)) && bit_same(z1,igemm_acc(((ks@pre-p)/8)*(kc@pre/4),total_depth((kc@pre/4),Refs),(nc@pre-nc)+1,flat_inputs(Blocks,Refs,(kc@pre/4)),W)) && bit_same(z2,igemm_acc(((ks@pre-p)/8)*(kc@pre/4),total_depth((kc@pre/4),Refs),(nc@pre-nc)+2,flat_inputs(Blocks,Refs,(kc@pre/4)),W)) && bit_same(z3,igemm_acc(((ks@pre-p)/8)*(kc@pre/4),total_depth((kc@pre/4),Refs),(nc@pre-nc)+3,flat_inputs(Blocks,Refs,(kc@pre/4)),W)) && bit_same(z4,igemm_acc(((ks@pre-p)/8)*(kc@pre/4),total_depth((kc@pre/4),Refs),(nc@pre-nc)+4,flat_inputs(Blocks,Refs,(kc@pre/4)),W)) && bit_same(z5,igemm_acc(((ks@pre-p)/8)*(kc@pre/4),total_depth((kc@pre/4),Refs),(nc@pre-nc)+5,flat_inputs(Blocks,Refs,(kc@pre/4)),W)) && bit_same(z6,igemm_acc(((ks@pre-p)/8)*(kc@pre/4),total_depth((kc@pre/4),Refs),(nc@pre-nc)+6,flat_inputs(Blocks,Refs,(kc@pre/4)),W)) && bit_same(z7,igemm_acc(((ks@pre-p)/8)*(kc@pre/4),total_depth((kc@pre/4),Refs),(nc@pre-nc)+7,flat_inputs(Blocks,Refs,(kc@pre/4)),W)) && input_pool(Blocks) * PtrArray::full(a@pre,ks@pre/8,Entries) * FloatArray::full(w@pre,packed_length(nc@pre,total_depth((kc@pre/4),Refs)),W) * ig_output_prefix(c@pre,nc@pre,(nc@pre-nc),total_depth((kc@pre/4),Refs),flat_inputs(Blocks,Refs,(kc@pre/4)),W,lo,hi) * store(&(params->scalar.min),float,lo) * store(&(params->scalar.max),float,hi) * store(&(vacc0x0.s0),float,z0) * store(&(vacc0x0.s1),float,z1) * store(&(vacc0x0.s2),float,z2) * store(&(vacc0x0.s3),float,z3) * store(&(vacc0x1.s0),float,z4) * store(&(vacc0x1.s1),float,z5) * store(&(vacc0x1.s2),float,z6) * store(&(vacc0x1.s3),float,z7) */
while (p != 0) {
/*@ a==pointer_offset(a@pre,((ks@pre-p)/8),float*) && 0<=((ks@pre-p)/8) && ((ks@pre-p)/8)<ks@pre/8 && PtrArray::full(a@pre,ks@pre/8,Entries) which implies a==pointer_offset(a@pre,((ks@pre-p)/8),float*) && 0<=((ks@pre-p)/8) && ((ks@pre-p)/8)<ks@pre/8 && PtrArray::missing_i(a@pre,((ks@pre-p)/8),0,ks@pre/8,Entries) * store(a,float*,Entries[((ks@pre-p)/8)]) */
const float* restrict a0 = a[0];
/*@ igemm_shape(mr@pre,nc@pre,(kc@pre/4),ks@pre,Entries,Refs,Blocks,zero@pre,a_offset@pre,W) && 0<=((ks@pre-p)/8) && ((ks@pre-p)/8)<ks@pre/8 && emp which implies igemm_shape(mr@pre,nc@pre,(kc@pre/4),ks@pre,Entries,Refs,Blocks,zero@pre,a_offset@pre,W) && 0<=((ks@pre-p)/8) && ((ks@pre-p)/8)<ks@pre/8 && input_mapping((kc@pre/4),zero@pre,a_offset@pre,Entries,Refs,Blocks) && Entries[((ks@pre-p)/8)]!=0 && emp */
qcp_assert(a0 != ((void*)0));
/*@ a==pointer_offset(a@pre,((ks@pre-p)/8),float*) && 0<=((ks@pre-p)/8) && ((ks@pre-p)/8)<ks@pre/8 && PtrArray::missing_i(a@pre,((ks@pre-p)/8),0,ks@pre/8,Entries) * store(a,float*,Entries[((ks@pre-p)/8)]) which implies a==pointer_offset(a@pre,((ks@pre-p)/8),float*) && 0<=((ks@pre-p)/8) && ((ks@pre-p)/8)<ks@pre/8 && PtrArray::full(a@pre,ks@pre/8,Entries) */
if (a0 != zero) {
        a0 = (const float*) ((uintptr_t) a0 + a_offset);
      }
/*@ input_mapping((kc@pre/4),zero@pre,a_offset@pre,Entries,Refs,Blocks) && 0<=((ks@pre-p)/8) && ((ks@pre-p)/8)<Zlength(Refs) && a0==selected_address(Entries[((ks@pre-p)/8)],zero@pre,a_offset@pre) && input_pool(Blocks) which implies input_mapping((kc@pre/4),zero@pre,a_offset@pre,Entries,Refs,Blocks) && 0<=((ks@pre-p)/8) && ((ks@pre-p)/8)<Zlength(Refs) && a0==input_address(Blocks,Refs,((ks@pre-p)/8)) && FloatArray::full(input_address(Blocks,Refs,((ks@pre-p)/8)),(kc@pre/4),input_window(Blocks,Refs,(kc@pre/4),((ks@pre-p)/8))) * input_window_frame(Blocks,Refs,(kc@pre/4),((ks@pre-p)/8)) */
a += 1;
      size_t k = kc;
/*@ Inv Assert exists (z0:fp32) (z1:fp32) (z2:fp32) (z3:fp32) (z4:fp32) (z5:fp32) (z6:fp32) (z7:fp32), mr==mr@pre && kc==kc@pre && ks==ks@pre && c==c@pre && params==params@pre && cm_stride==cm_stride@pre && a_offset==a_offset@pre && zero==zero@pre && cn_stride==32 && mr==1 && 0<nc@pre && nc@pre<=4611686018427387903 && 0<kc@pre && kc@pre%4==0 && 0<ks@pre && ks@pre%8==0 && a_offset@pre%4==0 && Zlength(Refs)==ks@pre/8 && Zlength(Entries)==Zlength(Refs) && Zlength(W)==packed_length(nc@pre,total_depth((kc@pre/4),Refs)) && igemm_shape(mr@pre,nc@pre,(kc@pre/4),ks@pre,Entries,Refs,Blocks,zero@pre,a_offset@pre,W) && input_mapping((kc@pre/4),zero@pre,a_offset@pre,Entries,Refs,Blocks) && igemm_capacity(nc@pre,(kc@pre/4),a@pre,w@pre,c@pre,Blocks,Refs) && sizeof(float)==4 && sizeof(void*)==8 && 0<=nc && nc<=nc@pre && 0<nc && (nc@pre-nc)%8==0 && 0<=((nc@pre-nc)/8) && ((nc@pre-nc)/8)<panel_count(nc@pre) && c0==pointer_offset(c@pre,(nc@pre-nc),float) && 0<p && p<=ks@pre && p%8==0 && 0<=((ks@pre-p)/8) && ((ks@pre-p)/8)<Zlength(Refs) && a==pointer_offset(a@pre,((ks@pre-p)/8)+1,float*) && 0<=k && k<=kc@pre && k%4==0 && (kc@pre-k)%8==0 && a0==pointer_offset(input_address(Blocks,Refs,((ks@pre-p)/8)),((kc@pre-k)/4),float) && w==pointer_offset(w@pre,8*(total_depth((kc@pre/4),Refs)+1)*((nc@pre-nc)/8)+8+8*(((ks@pre-p)/8)*(kc@pre/4)+((kc@pre-k)/4)),float) && bit_same(z0,igemm_acc(((ks@pre-p)/8)*(kc@pre/4)+((kc@pre-k)/4),total_depth((kc@pre/4),Refs),(nc@pre-nc)+0,flat_inputs(Blocks,Refs,(kc@pre/4)),W)) && bit_same(z1,igemm_acc(((ks@pre-p)/8)*(kc@pre/4)+((kc@pre-k)/4),total_depth((kc@pre/4),Refs),(nc@pre-nc)+1,flat_inputs(Blocks,Refs,(kc@pre/4)),W)) && bit_same(z2,igemm_acc(((ks@pre-p)/8)*(kc@pre/4)+((kc@pre-k)/4),total_depth((kc@pre/4),Refs),(nc@pre-nc)+2,flat_inputs(Blocks,Refs,(kc@pre/4)),W)) && bit_same(z3,igemm_acc(((ks@pre-p)/8)*(kc@pre/4)+((kc@pre-k)/4),total_depth((kc@pre/4),Refs),(nc@pre-nc)+3,flat_inputs(Blocks,Refs,(kc@pre/4)),W)) && bit_same(z4,igemm_acc(((ks@pre-p)/8)*(kc@pre/4)+((kc@pre-k)/4),total_depth((kc@pre/4),Refs),(nc@pre-nc)+4,flat_inputs(Blocks,Refs,(kc@pre/4)),W)) && bit_same(z5,igemm_acc(((ks@pre-p)/8)*(kc@pre/4)+((kc@pre-k)/4),total_depth((kc@pre/4),Refs),(nc@pre-nc)+5,flat_inputs(Blocks,Refs,(kc@pre/4)),W)) && bit_same(z6,igemm_acc(((ks@pre-p)/8)*(kc@pre/4)+((kc@pre-k)/4),total_depth((kc@pre/4),Refs),(nc@pre-nc)+6,flat_inputs(Blocks,Refs,(kc@pre/4)),W)) && bit_same(z7,igemm_acc(((ks@pre-p)/8)*(kc@pre/4)+((kc@pre-k)/4),total_depth((kc@pre/4),Refs),(nc@pre-nc)+7,flat_inputs(Blocks,Refs,(kc@pre/4)),W)) && FloatArray::full(input_address(Blocks,Refs,((ks@pre-p)/8)),(kc@pre/4),input_window(Blocks,Refs,(kc@pre/4),((ks@pre-p)/8))) * input_window_frame(Blocks,Refs,(kc@pre/4),((ks@pre-p)/8)) * PtrArray::full(a@pre,ks@pre/8,Entries) * FloatArray::full(w@pre,packed_length(nc@pre,total_depth((kc@pre/4),Refs)),W) * ig_output_prefix(c@pre,nc@pre,(nc@pre-nc),total_depth((kc@pre/4),Refs),flat_inputs(Blocks,Refs,(kc@pre/4)),W,lo,hi) * store(&(params->scalar.min),float,lo) * store(&(params->scalar.max),float,hi) * store(&(vacc0x0.s0),float,z0) * store(&(vacc0x0.s1),float,z1) * store(&(vacc0x0.s2),float,z2) * store(&(vacc0x0.s3),float,z3) * store(&(vacc0x1.s0),float,z4) * store(&(vacc0x1.s1),float,z5) * store(&(vacc0x1.s2),float,z6) * store(&(vacc0x1.s3),float,z7) */
for (; k >= 2 * sizeof(float); k -= 2 * sizeof(float)) {
        const float32x2_t va0 = vld1_f32(a0)
/*@ where base=input_address(Blocks,Refs,((ks@pre-p)/8)),n=(kc@pre/4),j=((kc@pre-k)/4),L=input_window(Blocks,Refs,(kc@pre/4),((ks@pre-p)/8)) */
; a0 += 2;
        const float32x4_t vb0123c0 = vld1q_f32(w)
/*@ where base=w@pre,n=packed_length(nc@pre,total_depth((kc@pre/4),Refs)),j=8*(total_depth((kc@pre/4),Refs)+1)*((nc@pre-nc)/8)+8+8*(((ks@pre-p)/8)*(kc@pre/4)+((kc@pre-k)/4))+0,L=W */
; w += 4;
        const float32x4_t vb4567c0 = vld1q_f32(w)
/*@ where base=w@pre,n=packed_length(nc@pre,total_depth((kc@pre/4),Refs)),j=8*(total_depth((kc@pre/4),Refs)+1)*((nc@pre-nc)/8)+8+8*(((ks@pre-p)/8)*(kc@pre/4)+((kc@pre-k)/4))+4,L=W */
; w += 4;
        const float32x4_t va0c0 = vdupq_lane_f32(va0, 0)
/*@ where a=&va0 */
;
        vacc0x0 = vfmaq_f32(vacc0x0, va0c0, vb0123c0)
/*@ where acc=&vacc0x0, a=&va0c0, b=&vb0123c0 */
;
        vacc0x1 = vfmaq_f32(vacc0x1, va0c0, vb4567c0)
/*@ where acc=&vacc0x1, a=&va0c0, b=&vb4567c0 */
;
        const float32x4_t vb0123c1 = vld1q_f32(w)
/*@ where base=w@pre,n=packed_length(nc@pre,total_depth((kc@pre/4),Refs)),j=8*(total_depth((kc@pre/4),Refs)+1)*((nc@pre-nc)/8)+8+8*(((ks@pre-p)/8)*(kc@pre/4)+((kc@pre-k)/4))+8,L=W */
; w += 4;
        const float32x4_t vb4567c1 = vld1q_f32(w)
/*@ where base=w@pre,n=packed_length(nc@pre,total_depth((kc@pre/4),Refs)),j=8*(total_depth((kc@pre/4),Refs)+1)*((nc@pre-nc)/8)+8+8*(((ks@pre-p)/8)*(kc@pre/4)+((kc@pre-k)/4))+12,L=W */
; w += 4;
        const float32x4_t va0c1 = vdupq_lane_f32(va0, 1)
/*@ where a=&va0 */
;
        vacc0x0 = vfmaq_f32(vacc0x0, va0c1, vb0123c1)
/*@ where acc=&vacc0x0, a=&va0c1, b=&vb0123c1 */
;
        vacc0x1 = vfmaq_f32(vacc0x1, va0c1, vb4567c1)
/*@ where acc=&vacc0x1, a=&va0c1, b=&vb4567c1 */
;
      }
      if (k != 0) {
        const float32x4_t va0 = vld1q_dup_f32(a0)
/*@ where base=input_address(Blocks,Refs,((ks@pre-p)/8)),n=(kc@pre/4),j=((kc@pre-k)/4),L=input_window(Blocks,Refs,(kc@pre/4),((ks@pre-p)/8)) */
;
        const float32x4_t vb0123 = vld1q_f32(w)
/*@ where base=w@pre,n=packed_length(nc@pre,total_depth((kc@pre/4),Refs)),j=8*(total_depth((kc@pre/4),Refs)+1)*((nc@pre-nc)/8)+8+8*(((ks@pre-p)/8)*(kc@pre/4)+((kc@pre-k)/4))+0,L=W */
; w += 4;
        const float32x4_t vb4567 = vld1q_f32(w)
/*@ where base=w@pre,n=packed_length(nc@pre,total_depth((kc@pre/4),Refs)),j=8*(total_depth((kc@pre/4),Refs)+1)*((nc@pre-nc)/8)+8+8*(((ks@pre-p)/8)*(kc@pre/4)+((kc@pre-k)/4))+4,L=W */
; w += 4;
        vacc0x0 = vfmaq_f32(vacc0x0, va0, vb0123)
/*@ where acc=&vacc0x0, a=&va0, b=&vb0123 */
;
        vacc0x1 = vfmaq_f32(vacc0x1, va0, vb4567)
/*@ where acc=&vacc0x1, a=&va0, b=&vb4567 */
;
      }
/*@ input_mapping((kc@pre/4),zero@pre,a_offset@pre,Entries,Refs,Blocks) && 0<=((ks@pre-p)/8) && ((ks@pre-p)/8)<Zlength(Refs) && FloatArray::full(input_address(Blocks,Refs,((ks@pre-p)/8)),(kc@pre/4),input_window(Blocks,Refs,(kc@pre/4),((ks@pre-p)/8))) * input_window_frame(Blocks,Refs,(kc@pre/4),((ks@pre-p)/8)) which implies input_mapping((kc@pre/4),zero@pre,a_offset@pre,Entries,Refs,Blocks) && 0<=((ks@pre-p)/8) && ((ks@pre-p)/8)<Zlength(Refs) && input_pool(Blocks) */
p -= 1 * sizeof(void*);
    }
    const float32x4_t vmax = vdupq_n_f32(params->scalar.max);
    vacc0x0 = vminq_f32(vacc0x0, vmax)
/*@ where a=&vacc0x0, b=&vmax */
;
    vacc0x1 = vminq_f32(vacc0x1, vmax)
/*@ where a=&vacc0x1, b=&vmax */
;
    const float32x4_t vmin = vdupq_n_f32(params->scalar.min);
    vacc0x0 = vmaxq_f32(vacc0x0, vmin)
/*@ where a=&vacc0x0, b=&vmin */
;
    vacc0x1 = vmaxq_f32(vacc0x1, vmin)
/*@ where a=&vacc0x1, b=&vmin */
;
/*@ ig_output_prefix(c@pre,nc@pre,(nc@pre-nc),total_depth((kc@pre/4),Refs),flat_inputs(Blocks,Refs,(kc@pre/4)),W,lo,hi) which implies ig_write_state(c@pre,nc@pre,(nc@pre-nc),igemm_output((nc@pre-nc),total_depth((kc@pre/4),Refs),flat_inputs(Blocks,Refs,(kc@pre/4)),W,lo,hi)) */
if (nc >= 8) {
      qcp_vst1q_f32((c0),&(vacc0x0))
/*@ where base=c@pre,N=nc@pre,done=(nc@pre-nc) */
;
      qcp_vst1q_f32((c0 + 4),&(vacc0x1))
/*@ where base=c@pre,N=nc@pre,done=(nc@pre-nc)+4 */
;
      c0 = (float*) ((uintptr_t) c0 + cn_stride);
      a = (const float**) ((uintptr_t) a - ks);
      nc -= 8;
    } else {
      if (nc & 4) {
        qcp_vst1q_f32((c0),&(vacc0x0))
/*@ where base=c@pre,N=nc@pre,done=(nc@pre-nc) */
; c0 += 4;
        vacc0x0 = vacc0x1;
      }
      float32x2_t vacc0 = vget_low_f32(vacc0x0)
/*@ where a=&vacc0x0 */
;
      if (nc & 2) {
        qcp_vst1_f32((c0),&(vacc0))
/*@ where base=c@pre,N=nc@pre */
; c0 += 2;
        vacc0 = vget_high_f32(vacc0x0)
/*@ where a=&vacc0x0 */
;
      }
      if (nc & 1) {
        qcp_vst1_lane_f32((c0),&(vacc0),(0))
/*@ where base=c@pre,N=nc@pre */
;
      }
      nc = 0;
    }
  }
}
