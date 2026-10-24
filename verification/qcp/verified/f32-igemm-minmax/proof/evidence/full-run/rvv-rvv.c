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
vfloat32m4_t __riscv_vle32_v_f32m4(const float*p,size_t vl)
/*@ With (base:Z) (n:Z) (j:Z) (L:list fp32) Require p==base+4*j && 0<=j && j+vl<=n && 1 <= vl && vl <= 8 && FloatArray::full(base,n,L) Ensure exists z0 z1 z2 z3 z4 z5 z6 z7, active8(vl,z0,z1,z2,z3,z4,z5,z6,z7,rvv_at(L,j+0),rvv_at(L,j+1),rvv_at(L,j+2),rvv_at(L,j+3),rvv_at(L,j+4),rvv_at(L,j+5),rvv_at(L,j+6),rvv_at(L,j+7)) && FloatArray::full(base,n,L) * store(&(__return.s0),float,z0) * store(&(__return.s1),float,z1) * store(&(__return.s2),float,z2) * store(&(__return.s3),float,z3) * store(&(__return.s4),float,z4) * store(&(__return.s5),float,z5) * store(&(__return.s6),float,z6) * store(&(__return.s7),float,z7) */;
vfloat32m4_t __riscv_vfmacc_vf_f32m4(vfloat32m4_t a,float scalar,vfloat32m4_t b,size_t vl)
/*@ With (x0:fp32) (x1:fp32) (x2:fp32) (x3:fp32) (x4:fp32) (x5:fp32) (x6:fp32) (x7:fp32) (y0:fp32) (y1:fp32) (y2:fp32) (y3:fp32) (y4:fp32) (y5:fp32) (y6:fp32) (y7:fp32) Require 1 <= vl && vl <= 8 && store(&(a.s0),float,x0) * store(&(a.s1),float,x1) * store(&(a.s2),float,x2) * store(&(a.s3),float,x3) * store(&(a.s4),float,x4) * store(&(a.s5),float,x5) * store(&(a.s6),float,x6) * store(&(a.s7),float,x7) * store(&(b.s0),float,y0) * store(&(b.s1),float,y1) * store(&(b.s2),float,y2) * store(&(b.s3),float,y3) * store(&(b.s4),float,y4) * store(&(b.s5),float,y5) * store(&(b.s6),float,y6) * store(&(b.s7),float,y7) Ensure exists z0 z1 z2 z3 z4 z5 z6 z7, active8(vl,z0,z1,z2,z3,z4,z5,z6,z7,fma_rne(scalar,y0,x0),fma_rne(scalar,y1,x1),fma_rne(scalar,y2,x2),fma_rne(scalar,y3,x3),fma_rne(scalar,y4,x4),fma_rne(scalar,y5,x5),fma_rne(scalar,y6,x6),fma_rne(scalar,y7,x7)) && store(&(__return.s0),float,z0) * store(&(__return.s1),float,z1) * store(&(__return.s2),float,z2) * store(&(__return.s3),float,z3) * store(&(__return.s4),float,z4) * store(&(__return.s5),float,z5) * store(&(__return.s6),float,z6) * store(&(__return.s7),float,z7) */;
vfloat32m4_t __riscv_vfmin_vf_f32m4(vfloat32m4_t a,float scalar,size_t vl)
/*@ With (x0:fp32) (x1:fp32) (x2:fp32) (x3:fp32) (x4:fp32) (x5:fp32) (x6:fp32) (x7:fp32) Require 1 <= vl && vl <= 8 && store(&(a.s0),float,x0) * store(&(a.s1),float,x1) * store(&(a.s2),float,x2) * store(&(a.s3),float,x3) * store(&(a.s4),float,x4) * store(&(a.s5),float,x5) * store(&(a.s6),float,x6) * store(&(a.s7),float,x7) Ensure exists z0 z1 z2 z3 z4 z5 z6 z7, active8(vl,z0,z1,z2,z3,z4,z5,z6,z7,fp32_min_number(x0,scalar),fp32_min_number(x1,scalar),fp32_min_number(x2,scalar),fp32_min_number(x3,scalar),fp32_min_number(x4,scalar),fp32_min_number(x5,scalar),fp32_min_number(x6,scalar),fp32_min_number(x7,scalar)) && store(&(__return.s0),float,z0) * store(&(__return.s1),float,z1) * store(&(__return.s2),float,z2) * store(&(__return.s3),float,z3) * store(&(__return.s4),float,z4) * store(&(__return.s5),float,z5) * store(&(__return.s6),float,z6) * store(&(__return.s7),float,z7) */;
vfloat32m4_t __riscv_vfmax_vf_f32m4(vfloat32m4_t a,float scalar,size_t vl)
/*@ With (x0:fp32) (x1:fp32) (x2:fp32) (x3:fp32) (x4:fp32) (x5:fp32) (x6:fp32) (x7:fp32) Require 1 <= vl && vl <= 8 && store(&(a.s0),float,x0) * store(&(a.s1),float,x1) * store(&(a.s2),float,x2) * store(&(a.s3),float,x3) * store(&(a.s4),float,x4) * store(&(a.s5),float,x5) * store(&(a.s6),float,x6) * store(&(a.s7),float,x7) Ensure exists z0 z1 z2 z3 z4 z5 z6 z7, active8(vl,z0,z1,z2,z3,z4,z5,z6,z7,fp32_max_number(x0,scalar),fp32_max_number(x1,scalar),fp32_max_number(x2,scalar),fp32_max_number(x3,scalar),fp32_max_number(x4,scalar),fp32_max_number(x5,scalar),fp32_max_number(x6,scalar),fp32_max_number(x7,scalar)) && store(&(__return.s0),float,z0) * store(&(__return.s1),float,z1) * store(&(__return.s2),float,z2) * store(&(__return.s3),float,z3) * store(&(__return.s4),float,z4) * store(&(__return.s5),float,z5) * store(&(__return.s6),float,z6) * store(&(__return.s7),float,z7) */;
vfloat32m4_t __riscv_vfmv_v_f_f32m4(float scalar,size_t vl)
/*@ Require 1 <= vl && vl <= 8 && emp Ensure exists z0 z1 z2 z3 z4 z5 z6 z7, active8(vl,z0,z1,z2,z3,z4,z5,z6,z7,scalar,scalar,scalar,scalar,scalar,scalar,scalar,scalar) && store(&(__return.s0),float,z0) * store(&(__return.s1),float,z1) * store(&(__return.s2),float,z2) * store(&(__return.s3),float,z3) * store(&(__return.s4),float,z4) * store(&(__return.s5),float,z5) * store(&(__return.s6),float,z6) * store(&(__return.s7),float,z7) */;
vbool8_t qcp_nanmask(const vfloat32m4_t*a,const vfloat32m4_t*b,size_t vl)
/*@ With (x0:fp32) (x1:fp32) (x2:fp32) (x3:fp32) (x4:fp32) (x5:fp32) (x6:fp32) (x7:fp32) Require 1 <= vl && vl <= 8 && a == b && store(&(a->s0),float,x0) * store(&(a->s1),float,x1) * store(&(a->s2),float,x2) * store(&(a->s3),float,x3) * store(&(a->s4),float,x4) * store(&(a->s5),float,x5) * store(&(a->s6),float,x6) * store(&(a->s7),float,x7) Ensure exists m0 m1 m2 m3 m4 m5 m6 m7, mask8(vl,m0,m1,m2,m3,m4,m5,m6,m7,rvv_nanth(x0),rvv_nanth(x1),rvv_nanth(x2),rvv_nanth(x3),rvv_nanth(x4),rvv_nanth(x5),rvv_nanth(x6),rvv_nanth(x7)) && store(&(a->s0),float,x0) * store(&(a->s1),float,x1) * store(&(a->s2),float,x2) * store(&(a->s3),float,x3) * store(&(a->s4),float,x4) * store(&(a->s5),float,x5) * store(&(a->s6),float,x6) * store(&(a->s7),float,x7) * store(&(__return.s0),int,m0) * store(&(__return.s1),int,m1) * store(&(__return.s2),int,m2) * store(&(__return.s3),int,m3) * store(&(__return.s4),int,m4) * store(&(__return.s5),int,m5) * store(&(__return.s6),int,m6) * store(&(__return.s7),int,m7) */;
vfloat32m4_t __riscv_vfmerge_vfm_f32m4(vfloat32m4_t a,float scalar,vbool8_t mask,size_t vl)
/*@ With (x0:fp32) (x1:fp32) (x2:fp32) (x3:fp32) (x4:fp32) (x5:fp32) (x6:fp32) (x7:fp32) (m0:Z) (m1:Z) (m2:Z) (m3:Z) (m4:Z) (m5:Z) (m6:Z) (m7:Z) Require 1 <= vl && vl <= 8 && store(&(a.s0),float,x0) * store(&(a.s1),float,x1) * store(&(a.s2),float,x2) * store(&(a.s3),float,x3) * store(&(a.s4),float,x4) * store(&(a.s5),float,x5) * store(&(a.s6),float,x6) * store(&(a.s7),float,x7) * store(&(mask.s0),int,m0) * store(&(mask.s1),int,m1) * store(&(mask.s2),int,m2) * store(&(mask.s3),int,m3) * store(&(mask.s4),int,m4) * store(&(mask.s5),int,m5) * store(&(mask.s6),int,m6) * store(&(mask.s7),int,m7) Ensure exists z0 z1 z2 z3 z4 z5 z6 z7, active8(vl,z0,z1,z2,z3,z4,z5,z6,z7,rvv_merge(x0,scalar,m0),rvv_merge(x1,scalar,m1),rvv_merge(x2,scalar,m2),rvv_merge(x3,scalar,m3),rvv_merge(x4,scalar,m4),rvv_merge(x5,scalar,m5),rvv_merge(x6,scalar,m6),rvv_merge(x7,scalar,m7)) && store(&(__return.s0),float,z0) * store(&(__return.s1),float,z1) * store(&(__return.s2),float,z2) * store(&(__return.s3),float,z3) * store(&(__return.s4),float,z4) * store(&(__return.s5),float,z5) * store(&(__return.s6),float,z6) * store(&(__return.s7),float,z7) */;
void qcp_store(float *p,const vfloat32m4_t *a,size_t vl)
/*@ With (base:Z) (N:Z) (done:Z) (L:list fp32) (x0:fp32) (x1:fp32) (x2:fp32) (x3:fp32) (x4:fp32) (x5:fp32) (x6:fp32) (x7:fp32)
 Require 1<=vl && vl<=8 && 0<=done && done+vl<=N && p==base+4*done && store(&(a->s0),float,x0) * store(&(a->s1),float,x1) * store(&(a->s2),float,x2) * store(&(a->s3),float,x3) * store(&(a->s4),float,x4) * store(&(a->s5),float,x5) * store(&(a->s6),float,x6) * store(&(a->s7),float,x7) * ig_write_state(base,N,done,L)
 Ensure store(&(a->s0),float,x0) * store(&(a->s1),float,x1) * store(&(a->s2),float,x2) * store(&(a->s3),float,x3) * store(&(a->s4),float,x4) * store(&(a->s5),float,x5) * store(&(a->s6),float,x6) * store(&(a->s7),float,x7) * ig_write_state(base,N,done+vl,ig_fappend(L,sublist(0,vl,cons(x0,cons(x1,cons(x2,cons(x3,cons(x4,cons(x5,cons(x6,cons(x7,nil))))))))))) */;
void test_rvv(
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
  (void) cm_stride;
  float* c0 = c;
  do {
    size_t vl = nc > 8 ? 8 : nc;
    vfloat32m4_t vacc = __riscv_vle32_v_f32m4(w, vl)
/*@ where base=w@pre,n=packed_length(nc@pre,total_depth((kc@pre/4),Refs)),j=8*(total_depth((kc@pre/4),Refs)+1)*((nc@pre-nc)/8),L=W */
;
    w += 8;
    size_t p = ks;
    do {
/*@ a==pointer_offset(a@pre,((ks@pre-p)/8),float*) && 0<=((ks@pre-p)/8) && ((ks@pre-p)/8)<ks@pre/8 && PtrArray::full(a@pre,ks@pre/8,Entries) which implies a==pointer_offset(a@pre,((ks@pre-p)/8),float*) && 0<=((ks@pre-p)/8) && ((ks@pre-p)/8)<ks@pre/8 && PtrArray::missing_i(a@pre,((ks@pre-p)/8),0,ks@pre/8,Entries) * store(a,float*,Entries[((ks@pre-p)/8)]) */
const float* restrict a0 = a[0];
/*@ igemm_shape(mr@pre,nc@pre,(kc@pre/4),ks@pre,Entries,Refs,Blocks,zero@pre,a_offset@pre,W) && 0<=((ks@pre-p)/8) && ((ks@pre-p)/8)<ks@pre/8 && emp which implies igemm_shape(mr@pre,nc@pre,(kc@pre/4),ks@pre,Entries,Refs,Blocks,zero@pre,a_offset@pre,W) && 0<=((ks@pre-p)/8) && ((ks@pre-p)/8)<ks@pre/8 && input_mapping((kc@pre/4),zero@pre,a_offset@pre,Entries,Refs,Blocks) && Entries[((ks@pre-p)/8)]!=0 && emp */
qcp_assert(a0 != ((void*)0));
/*@ a==pointer_offset(a@pre,((ks@pre-p)/8),float*) && 0<=((ks@pre-p)/8) && ((ks@pre-p)/8)<ks@pre/8 && PtrArray::missing_i(a@pre,((ks@pre-p)/8),0,ks@pre/8,Entries) * store(a,float*,Entries[((ks@pre-p)/8)]) which implies a==pointer_offset(a@pre,((ks@pre-p)/8),float*) && 0<=((ks@pre-p)/8) && ((ks@pre-p)/8)<ks@pre/8 && PtrArray::full(a@pre,ks@pre/8,Entries) */
if(a0 != zero) {
        a0 = (const float*) ((uintptr_t) a0 + a_offset);
      }
/*@ input_mapping((kc@pre/4),zero@pre,a_offset@pre,Entries,Refs,Blocks) && 0<=((ks@pre-p)/8) && ((ks@pre-p)/8)<Zlength(Refs) && a0==selected_address(Entries[((ks@pre-p)/8)],zero@pre,a_offset@pre) && input_pool(Blocks) which implies input_mapping((kc@pre/4),zero@pre,a_offset@pre,Entries,Refs,Blocks) && 0<=((ks@pre-p)/8) && ((ks@pre-p)/8)<Zlength(Refs) && a0==input_address(Blocks,Refs,((ks@pre-p)/8)) && FloatArray::full(input_address(Blocks,Refs,((ks@pre-p)/8)),(kc@pre/4),input_window(Blocks,Refs,(kc@pre/4),((ks@pre-p)/8))) * input_window_frame(Blocks,Refs,(kc@pre/4),((ks@pre-p)/8)) */
a += 1;
      size_t k = kc;
/*@ Inv Assert exists (z0:fp32) (z1:fp32) (z2:fp32) (z3:fp32) (z4:fp32) (z5:fp32) (z6:fp32) (z7:fp32), mr==mr@pre && kc==kc@pre && ks==ks@pre && c==c@pre && params==params@pre && cm_stride==cm_stride@pre && a_offset==a_offset@pre && zero==zero@pre && cn_stride==32 && mr==1 && 0<nc@pre && nc@pre<=4611686018427387903 && 0<kc@pre && kc@pre%4==0 && 0<ks@pre && ks@pre%8==0 && a_offset@pre%4==0 && Zlength(Refs)==ks@pre/8 && Zlength(Entries)==Zlength(Refs) && Zlength(W)==packed_length(nc@pre,total_depth((kc@pre/4),Refs)) && igemm_shape(mr@pre,nc@pre,(kc@pre/4),ks@pre,Entries,Refs,Blocks,zero@pre,a_offset@pre,W) && input_mapping((kc@pre/4),zero@pre,a_offset@pre,Entries,Refs,Blocks) && igemm_capacity(nc@pre,(kc@pre/4),a@pre,w@pre,c@pre,Blocks,Refs) && sizeof(float)==4 && sizeof(void*)==8 && 0<=nc && nc<=nc@pre && 0<nc && (nc@pre-nc)%8==0 && 0<=((nc@pre-nc)/8) && ((nc@pre-nc)/8)<panel_count(nc@pre) && c0==pointer_offset(c@pre,(nc@pre-nc),float) && 1<=vl && vl<=8 && vl<=nc && (vl==8 || vl==nc) && 0<p && p<=ks@pre && p%8==0 && 0<=((ks@pre-p)/8) && ((ks@pre-p)/8)<Zlength(Refs) && a==pointer_offset(a@pre,((ks@pre-p)/8)+1,float*) && 0<=k && k<=kc@pre && k%4==0 && a0==pointer_offset(input_address(Blocks,Refs,((ks@pre-p)/8)),((kc@pre-k)/4),float) && w==pointer_offset(w@pre,8*(total_depth((kc@pre/4),Refs)+1)*((nc@pre-nc)/8)+8+8*(((ks@pre-p)/8)*(kc@pre/4)+((kc@pre-k)/4)),float) && active_value(vl,0,z0,igemm_acc(((ks@pre-p)/8)*(kc@pre/4)+((kc@pre-k)/4),total_depth((kc@pre/4),Refs),(nc@pre-nc)+0,flat_inputs(Blocks,Refs,(kc@pre/4)),W)) && active_value(vl,1,z1,igemm_acc(((ks@pre-p)/8)*(kc@pre/4)+((kc@pre-k)/4),total_depth((kc@pre/4),Refs),(nc@pre-nc)+1,flat_inputs(Blocks,Refs,(kc@pre/4)),W)) && active_value(vl,2,z2,igemm_acc(((ks@pre-p)/8)*(kc@pre/4)+((kc@pre-k)/4),total_depth((kc@pre/4),Refs),(nc@pre-nc)+2,flat_inputs(Blocks,Refs,(kc@pre/4)),W)) && active_value(vl,3,z3,igemm_acc(((ks@pre-p)/8)*(kc@pre/4)+((kc@pre-k)/4),total_depth((kc@pre/4),Refs),(nc@pre-nc)+3,flat_inputs(Blocks,Refs,(kc@pre/4)),W)) && active_value(vl,4,z4,igemm_acc(((ks@pre-p)/8)*(kc@pre/4)+((kc@pre-k)/4),total_depth((kc@pre/4),Refs),(nc@pre-nc)+4,flat_inputs(Blocks,Refs,(kc@pre/4)),W)) && active_value(vl,5,z5,igemm_acc(((ks@pre-p)/8)*(kc@pre/4)+((kc@pre-k)/4),total_depth((kc@pre/4),Refs),(nc@pre-nc)+5,flat_inputs(Blocks,Refs,(kc@pre/4)),W)) && active_value(vl,6,z6,igemm_acc(((ks@pre-p)/8)*(kc@pre/4)+((kc@pre-k)/4),total_depth((kc@pre/4),Refs),(nc@pre-nc)+6,flat_inputs(Blocks,Refs,(kc@pre/4)),W)) && active_value(vl,7,z7,igemm_acc(((ks@pre-p)/8)*(kc@pre/4)+((kc@pre-k)/4),total_depth((kc@pre/4),Refs),(nc@pre-nc)+7,flat_inputs(Blocks,Refs,(kc@pre/4)),W)) && FloatArray::full(input_address(Blocks,Refs,((ks@pre-p)/8)),(kc@pre/4),input_window(Blocks,Refs,(kc@pre/4),((ks@pre-p)/8))) * input_window_frame(Blocks,Refs,(kc@pre/4),((ks@pre-p)/8)) * PtrArray::full(a@pre,ks@pre/8,Entries) * FloatArray::full(w@pre,packed_length(nc@pre,total_depth((kc@pre/4),Refs)),W) * ig_output_prefix(c@pre,nc@pre,(nc@pre-nc),total_depth((kc@pre/4),Refs),flat_inputs(Blocks,Refs,(kc@pre/4)),W,lo,hi) * store(&(params->scalar.min),float,lo) * store(&(params->scalar.max),float,hi) * store(&(vacc.s0),float,z0) * store(&(vacc.s1),float,z1) * store(&(vacc.s2),float,z2) * store(&(vacc.s3),float,z3) * store(&(vacc.s4),float,z4) * store(&(vacc.s5),float,z5) * store(&(vacc.s6),float,z6) * store(&(vacc.s7),float,z7) */
while (k > 0) {
/*@ a0==pointer_offset(input_address(Blocks,Refs,((ks@pre-p)/8)),((kc@pre-k)/4),float) && 0<=((kc@pre-k)/4) && ((kc@pre-k)/4)<(kc@pre/4) && FloatArray::full(input_address(Blocks,Refs,((ks@pre-p)/8)),(kc@pre/4),input_window(Blocks,Refs,(kc@pre/4),((ks@pre-p)/8))) which implies a0==pointer_offset(input_address(Blocks,Refs,((ks@pre-p)/8)),((kc@pre-k)/4),float) && 0<=((kc@pre-k)/4) && ((kc@pre-k)/4)<(kc@pre/4) && FloatArray::missing_i(input_address(Blocks,Refs,((ks@pre-p)/8)),((kc@pre-k)/4),0,(kc@pre/4),input_window(Blocks,Refs,(kc@pre/4),((ks@pre-p)/8))) * store(a0,float,input_window(Blocks,Refs,(kc@pre/4),((ks@pre-p)/8))[((kc@pre-k)/4)]) */
float va = *a0;
/*@ a0==pointer_offset(input_address(Blocks,Refs,((ks@pre-p)/8)),((kc@pre-k)/4),float) && 0<=((kc@pre-k)/4) && ((kc@pre-k)/4)<(kc@pre/4) && FloatArray::missing_i(input_address(Blocks,Refs,((ks@pre-p)/8)),((kc@pre-k)/4),0,(kc@pre/4),input_window(Blocks,Refs,(kc@pre/4),((ks@pre-p)/8))) * store(a0,float,input_window(Blocks,Refs,(kc@pre/4),((ks@pre-p)/8))[((kc@pre-k)/4)]) which implies a0==pointer_offset(input_address(Blocks,Refs,((ks@pre-p)/8)),((kc@pre-k)/4),float) && 0<=((kc@pre-k)/4) && ((kc@pre-k)/4)<(kc@pre/4) && FloatArray::full(input_address(Blocks,Refs,((ks@pre-p)/8)),(kc@pre/4),input_window(Blocks,Refs,(kc@pre/4),((ks@pre-p)/8))) */
a0++;
        vfloat32m4_t vb = __riscv_vle32_v_f32m4(w, vl)
/*@ where base=w@pre,n=packed_length(nc@pre,total_depth((kc@pre/4),Refs)),j=8*(total_depth((kc@pre/4),Refs)+1)*((nc@pre-nc)/8)+8+8*(((ks@pre-p)/8)*(kc@pre/4)+((kc@pre-k)/4)),L=W */
;
        w += 8;
        vacc = __riscv_vfmacc_vf_f32m4(vacc, va, vb, vl)
/*@ where a=&vacc, b=&vb */
;
        k -= sizeof(float);
      }
/*@ input_mapping((kc@pre/4),zero@pre,a_offset@pre,Entries,Refs,Blocks) && 0<=((ks@pre-p)/8) && ((ks@pre-p)/8)<Zlength(Refs) && FloatArray::full(input_address(Blocks,Refs,((ks@pre-p)/8)),(kc@pre/4),input_window(Blocks,Refs,(kc@pre/4),((ks@pre-p)/8))) * input_window_frame(Blocks,Refs,(kc@pre/4),((ks@pre-p)/8)) which implies input_mapping((kc@pre/4),zero@pre,a_offset@pre,Entries,Refs,Blocks) && 0<=((ks@pre-p)/8) && ((ks@pre-p)/8)<Zlength(Refs) && input_pool(Blocks) */
p -= 1 * sizeof(void*);
    }
/*@ Inv Assert exists (z0:fp32) (z1:fp32) (z2:fp32) (z3:fp32) (z4:fp32) (z5:fp32) (z6:fp32) (z7:fp32), mr==mr@pre && kc==kc@pre && ks==ks@pre && c==c@pre && params==params@pre && cm_stride==cm_stride@pre && a_offset==a_offset@pre && zero==zero@pre && cn_stride==32 && mr==1 && 0<nc@pre && nc@pre<=4611686018427387903 && 0<kc@pre && kc@pre%4==0 && 0<ks@pre && ks@pre%8==0 && a_offset@pre%4==0 && Zlength(Refs)==ks@pre/8 && Zlength(Entries)==Zlength(Refs) && Zlength(W)==packed_length(nc@pre,total_depth((kc@pre/4),Refs)) && igemm_shape(mr@pre,nc@pre,(kc@pre/4),ks@pre,Entries,Refs,Blocks,zero@pre,a_offset@pre,W) && input_mapping((kc@pre/4),zero@pre,a_offset@pre,Entries,Refs,Blocks) && igemm_capacity(nc@pre,(kc@pre/4),a@pre,w@pre,c@pre,Blocks,Refs) && sizeof(float)==4 && sizeof(void*)==8 && 0<=nc && nc<=nc@pre && 0<nc && (nc@pre-nc)%8==0 && 0<=((nc@pre-nc)/8) && ((nc@pre-nc)/8)<panel_count(nc@pre) && c0==pointer_offset(c@pre,(nc@pre-nc),float) && 1<=vl && vl<=8 && vl<=nc && (vl==8 || vl==nc) && 0<=p && p<=ks@pre && p%8==0 && a==pointer_offset(a@pre,((ks@pre-p)/8),float*) && w==pointer_offset(w@pre,8*(total_depth((kc@pre/4),Refs)+1)*((nc@pre-nc)/8)+8+8*(((ks@pre-p)/8)*(kc@pre/4)),float) && active_value(vl,0,z0,igemm_acc(((ks@pre-p)/8)*(kc@pre/4),total_depth((kc@pre/4),Refs),(nc@pre-nc)+0,flat_inputs(Blocks,Refs,(kc@pre/4)),W)) && active_value(vl,1,z1,igemm_acc(((ks@pre-p)/8)*(kc@pre/4),total_depth((kc@pre/4),Refs),(nc@pre-nc)+1,flat_inputs(Blocks,Refs,(kc@pre/4)),W)) && active_value(vl,2,z2,igemm_acc(((ks@pre-p)/8)*(kc@pre/4),total_depth((kc@pre/4),Refs),(nc@pre-nc)+2,flat_inputs(Blocks,Refs,(kc@pre/4)),W)) && active_value(vl,3,z3,igemm_acc(((ks@pre-p)/8)*(kc@pre/4),total_depth((kc@pre/4),Refs),(nc@pre-nc)+3,flat_inputs(Blocks,Refs,(kc@pre/4)),W)) && active_value(vl,4,z4,igemm_acc(((ks@pre-p)/8)*(kc@pre/4),total_depth((kc@pre/4),Refs),(nc@pre-nc)+4,flat_inputs(Blocks,Refs,(kc@pre/4)),W)) && active_value(vl,5,z5,igemm_acc(((ks@pre-p)/8)*(kc@pre/4),total_depth((kc@pre/4),Refs),(nc@pre-nc)+5,flat_inputs(Blocks,Refs,(kc@pre/4)),W)) && active_value(vl,6,z6,igemm_acc(((ks@pre-p)/8)*(kc@pre/4),total_depth((kc@pre/4),Refs),(nc@pre-nc)+6,flat_inputs(Blocks,Refs,(kc@pre/4)),W)) && active_value(vl,7,z7,igemm_acc(((ks@pre-p)/8)*(kc@pre/4),total_depth((kc@pre/4),Refs),(nc@pre-nc)+7,flat_inputs(Blocks,Refs,(kc@pre/4)),W)) && input_pool(Blocks) * PtrArray::full(a@pre,ks@pre/8,Entries) * FloatArray::full(w@pre,packed_length(nc@pre,total_depth((kc@pre/4),Refs)),W) * ig_output_prefix(c@pre,nc@pre,(nc@pre-nc),total_depth((kc@pre/4),Refs),flat_inputs(Blocks,Refs,(kc@pre/4)),W,lo,hi) * store(&(params->scalar.min),float,lo) * store(&(params->scalar.max),float,hi) * store(&(vacc.s0),float,z0) * store(&(vacc.s1),float,z1) * store(&(vacc.s2),float,z2) * store(&(vacc.s3),float,z3) * store(&(vacc.s4),float,z4) * store(&(vacc.s5),float,z5) * store(&(vacc.s6),float,z6) * store(&(vacc.s7),float,z7) */
while (p != 0);
    if (qcp_isnan(params->scalar.max) || qcp_isnan(params->scalar.min)) {
      vacc = __riscv_vfmv_v_f_f32m4(qcp_nanf(), vl);
    } else {
      vbool8_t was_nan = qcp_nanmask(&(vacc),&(vacc),(vl));
      vacc = __riscv_vfmin_vf_f32m4(vacc, params->scalar.max, vl)
/*@ where a=&vacc */
;
      vacc = __riscv_vfmax_vf_f32m4(vacc, params->scalar.min, vl)
/*@ where a=&vacc */
;
      vacc = __riscv_vfmerge_vfm_f32m4(vacc, qcp_nanf(), was_nan, vl)
/*@ where a=&vacc, mask=&was_nan */
;
    }
/*@ ig_output_prefix(c@pre,nc@pre,(nc@pre-nc),total_depth((kc@pre/4),Refs),flat_inputs(Blocks,Refs,(kc@pre/4)),W,lo,hi) which implies ig_write_state(c@pre,nc@pre,(nc@pre-nc),igemm_output((nc@pre-nc),total_depth((kc@pre/4),Refs),flat_inputs(Blocks,Refs,(kc@pre/4)),W,lo,hi)) */
qcp_store((c0),&(vacc),(vl))
/*@ where base=c@pre,N=nc@pre,done=(nc@pre-nc) */
;
    c0 = (float*) ((uintptr_t) c0 + cn_stride);
    a = (const float**) ((uintptr_t) a - ks);
    nc -= vl;
  }
/*@ Inv Assert exists (wp:Z) (cp:Z), mr==mr@pre && kc==kc@pre && ks==ks@pre && c==c@pre && params==params@pre && cm_stride==cm_stride@pre && a_offset==a_offset@pre && zero==zero@pre && cn_stride==32 && mr==1 && 0<nc@pre && nc@pre<=4611686018427387903 && 0<kc@pre && kc@pre%4==0 && 0<ks@pre && ks@pre%8==0 && a_offset@pre%4==0 && Zlength(Refs)==ks@pre/8 && Zlength(Entries)==Zlength(Refs) && Zlength(W)==packed_length(nc@pre,total_depth((kc@pre/4),Refs)) && igemm_shape(mr@pre,nc@pre,(kc@pre/4),ks@pre,Entries,Refs,Blocks,zero@pre,a_offset@pre,W) && input_mapping((kc@pre/4),zero@pre,a_offset@pre,Entries,Refs,Blocks) && igemm_capacity(nc@pre,(kc@pre/4),a@pre,w@pre,c@pre,Blocks,Refs) && sizeof(float)==4 && sizeof(void*)==8 && 0<=nc && nc<=nc@pre && a==a@pre && w==wp && c0==cp && (nc==0 || (0<nc && (nc@pre-nc)%8==0 && 0<=((nc@pre-nc)/8) && ((nc@pre-nc)/8)<panel_count(nc@pre) && cp==pointer_offset(c@pre,(nc@pre-nc),float) && wp==pointer_offset(w@pre,8*(total_depth((kc@pre/4),Refs)+1)*((nc@pre-nc)/8),float))) && input_pool(Blocks) * PtrArray::full(a@pre,ks@pre/8,Entries) * FloatArray::full(w@pre,packed_length(nc@pre,total_depth((kc@pre/4),Refs)),W) * ig_output_prefix(c@pre,nc@pre,(nc@pre-nc),total_depth((kc@pre/4),Refs),flat_inputs(Blocks,Refs,(kc@pre/4)),W,lo,hi) * store(&(params->scalar.min),float,lo) * store(&(params->scalar.max),float,hi) */
while (nc != 0);
}
