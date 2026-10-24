typedef unsigned long long size_t;
typedef unsigned long long uintptr_t;
typedef signed char int8_t;
typedef unsigned char uint8_t;
typedef short int16_t;
typedef int int32_t;
typedef unsigned int uint32_t;
struct qc4_scalar_bounds {float min;float max;int32_t kernel_zero_point;};
struct xnn_f32_qc4w_minmax_params {struct qc4_scalar_bounds scalar;};
struct xnn_qd8_quantization_params {int32_t zero_point;float inv_scale;};
struct int8x8_t { int8_t s0,s1,s2,s3,s4,s5,s6,s7; };
typedef struct int8x8_t int8x8_t;
struct int16x8_t { int16_t s0,s1,s2,s3,s4,s5,s6,s7; };
typedef struct int16x8_t int16x8_t;
struct int16x4_t { int16_t s0,s1,s2,s3; };
typedef struct int16x4_t int16x4_t;
struct int32x4_t { int32_t s0,s1,s2,s3; };
typedef struct int32x4_t int32x4_t;
struct float32x4_t { float s0,s1,s2,s3; };
typedef struct float32x4_t float32x4_t;
struct float32x2_t { float s0,s1; };
typedef struct float32x2_t float32x2_t;
struct vint8m2_t { int8_t s0,s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12,s13,s14,s15; };
typedef struct vint8m2_t vint8m2_t;
struct vint16m4_t { int16_t s0,s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12,s13,s14,s15; };
typedef struct vint16m4_t vint16m4_t;
struct vint32m8_t { int32_t s0,s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12,s13,s14,s15; };
typedef struct vint32m8_t vint32m8_t;
struct vfloat32m8_t { float s0,s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12,s13,s14,s15; };
typedef struct vfloat32m8_t vfloat32m8_t;
struct vbool4_t { int s0,s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12,s13,s14,s15; };
typedef struct vbool4_t vbool4_t;
/*@ Import Coq Require Import QC4W.PublicModel */
/*@ Extern Coq (qc4_panel :: *) */
/*@ Extern Coq
 (qc4_domain_shape : Z -> Z -> Z -> list qc4_panel -> Prop)
 (qc4_data_capacity : Z -> Z -> Z -> Z -> Z -> Prop)
 (qc4_a_extent : Z -> Z)
 (qc4_packed : Z -> Z -> list qc4_panel -> Assertion)
 (qc4_output_ref : Z -> Z -> Z -> Z -> list Z -> list qc4_panel -> fp32 -> fp32 -> fp32 -> Assertion)
 (qc4_same_value : fp32 -> fp32 -> Prop)
 (qc4_outputs_related : list fp32 -> list fp32 -> Prop)
 (qc4_bit_same : fp32 -> fp32 -> Prop)
 (CharArray::full : Z -> Z -> list Z -> Assertion)
 (FloatArray::full : Z -> Z -> list fp32 -> Assertion)
 (FloatArray::undef_full : Z -> Z -> Assertion) */
/*@ Import Coq Require Import QC4W.ApiModel QC4W.Layouts */
/*@ Extern Coq
 (qc4_zget:Z -> list Z -> Z)
 (qc4_fget:Z -> list fp32 -> fp32)
 (qc4_panel_at:list qc4_panel -> Z -> qc4_panel)
 (qc4_weights:qc4_panel -> list Z)
 (qc4_ks:Z -> Z -> list qc4_panel -> Z)
 (qc4_float_field:Z -> Z -> Z -> list qc4_panel -> fp32)
 (qc4_matrix_wf:Z -> list qc4_panel -> Prop)
 (qc4_wrap_signed:Z -> Z)
 (qc4_mac_signed:Z -> Z -> Z -> Z)
 (low_bitop:Z -> Z)
 (high_bitop:Z -> Z)
 (shifted_accumulator:Z -> Z)
 (rounded_depth:Z -> Z)
 (panel_bytes:Z -> Z)
 (qc4_nan_flag:fp32 -> Z)
 (qc4_merge:fp32 -> fp32 -> Z -> fp32)
 (qc4_fappend:list fp32 -> list fp32 -> list fp32)
 (qc4_write_state:Z -> Z -> Z -> list fp32 -> Assertion)
 (qc4_output_prefix:Z -> Z -> Z -> Z -> Z -> list Z -> list qc4_panel -> fp32 -> fp32 -> fp32 -> Assertion)
 (qc4_values:Z -> Z -> Z -> list Z -> list qc4_panel -> fp32 -> fp32 -> fp32 -> list fp32)
 (qc4_panels:Z -> Z)
 (qc4_active_z:Z -> Z -> Z -> Z -> Prop)
 (qc4_acc_signed:Z -> Z -> Z -> Z -> list Z -> list qc4_panel -> Z)
 (fma_rne:fp32 -> fp32 -> fp32 -> fp32)
 (qc4_fp32_mul:fp32 -> fp32 -> fp32)
 (fp32_min_number:fp32 -> fp32 -> fp32)
 (fp32_max_number:fp32 -> fp32 -> fp32)
 (fp32_of_Z:Z -> fp32)
 (canonical_qnan:fp32)
 (qc4_active16_z:Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Z -> Prop)
 (qc4_active16_f:Z -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> fp32 -> Prop) */
/*@ Import Coq Require Import QC4W.ApiModel QC4W.Layouts */
/*@ Extern Coq (UndefStructPredint8x8_t:Z -> Assertion) */
/*@ Extern Coq (UndefStructPredint16x8_t:Z -> Assertion) */
/*@ Extern Coq (UndefStructPredint16x4_t:Z -> Assertion) */
/*@ Extern Coq (UndefStructPredint32x4_t:Z -> Assertion) */
/*@ Extern Coq (UndefStructPredfloat32x4_t:Z -> Assertion) */
/*@ Extern Coq (UndefStructPredfloat32x2_t:Z -> Assertion) */
/*@ Extern Coq (UndefStructPredvint8m2_t:Z -> Assertion) */
/*@ Extern Coq (UndefStructPredvint16m4_t:Z -> Assertion) */
/*@ Extern Coq (UndefStructPredvint32m8_t:Z -> Assertion) */
/*@ Extern Coq (UndefStructPredvfloat32m8_t:Z -> Assertion) */
/*@ Extern Coq (UndefStructPredvbool4_t:Z -> Assertion) */
/*@ Extern Coq (qc4_write_state:Z -> Z -> Z -> list fp32 -> Assertion) */
/*@ include strategies "copy.strategies" */
void qcp_assert(int condition) /*@ Require condition!=0 && emp Ensure emp */;
size_t round_up_po2(size_t n,size_t quantum)
/*@ Require 0<n && n<18446744073709551615 && quantum==2 && emp Ensure __return==rounded_depth(n) && emp */;
float qcp_identity(float x) /*@ Require emp Ensure qc4_bit_same(__return,x) && emp */;
int qcp_isnan(float x) /*@ Require emp Ensure __return==qc4_nan_flag(x) && emp */;
float qcp_nanf(void) /*@ Require emp Ensure qc4_bit_same(__return,canonical_qnan) && emp */;
/*@ Import Coq Require Import QC4W.NeonModel */
/*@ Extern Coq (qc4_char_field:Z -> Z -> Z -> Z -> list Z -> list qc4_panel -> Z)
(qc4_i8_address_ok:Z -> Z -> Z -> Z -> Z -> Z -> Z -> list qc4_panel -> Prop)
(qc4_i16_lane:Z -> Z -> Z -> Z -> Z -> Z)
(qc4_narrow8:Z -> Z)
(fp32_neon_min:fp32 -> fp32 -> fp32) (fp32_neon_max:fp32 -> fp32 -> fp32) */
int8x8_t vld1_s8(const void *p)
/*@ With (K:Z) (ab:Z) (wb:Z) (tile:Z) (j:Z) (mode:Z) (A:list Z) (Ps:list qc4_panel)
 Require 0<K && qc4_matrix_wf(K,Ps) && qc4_i8_address_ok(mode,p,ab,wb,K,tile,j,Ps) && CharArray::full(ab,qc4_a_extent(K),A) * qc4_packed(K,wb,Ps)
 Ensure CharArray::full(ab,qc4_a_extent(K),A) * qc4_packed(K,wb,Ps) * store(&(__return.s0),char,qc4_char_field(mode,tile,j,0,A,Ps)) * store(&(__return.s1),char,qc4_char_field(mode,tile,j,1,A,Ps)) * store(&(__return.s2),char,qc4_char_field(mode,tile,j,2,A,Ps)) * store(&(__return.s3),char,qc4_char_field(mode,tile,j,3,A,Ps)) * store(&(__return.s4),char,qc4_char_field(mode,tile,j,4,A,Ps)) * store(&(__return.s5),char,qc4_char_field(mode,tile,j,5,A,Ps)) * store(&(__return.s6),char,qc4_char_field(mode,tile,j,6,A,Ps)) * store(&(__return.s7),char,qc4_char_field(mode,tile,j,7,A,Ps)) */;
int32x4_t vld1q_s32(const void *p)
/*@ With (K:Z) (wb:Z) (tile:Z) (j:Z) (Ps:list qc4_panel)
 Require 0<K && qc4_matrix_wf(K,Ps) && 0<=tile && tile<Zlength(Ps) && 0<=j && j+4<=16 && p==wb+tile*panel_bytes(K)+4*j && qc4_packed(K,wb,Ps)
 Ensure qc4_packed(K,wb,Ps) * store(&(__return.s0),int,qc4_ks(tile,j+0,Ps)) * store(&(__return.s1),int,qc4_ks(tile,j+1,Ps)) * store(&(__return.s2),int,qc4_ks(tile,j+2,Ps)) * store(&(__return.s3),int,qc4_ks(tile,j+3,Ps)) */;
float32x4_t vld1q_f32(const void *p)
/*@ With (K:Z) (wb:Z) (tile:Z) (kind:Z) (j:Z) (Ps:list qc4_panel)
 Require 0<K && qc4_matrix_wf(K,Ps) && 0<=tile && tile<Zlength(Ps) && 0<=kind && kind<=1 && 0<=j && j+4<=16 && p==wb+tile*panel_bytes(K)+64+8*rounded_depth(K)+64*kind+4*j && qc4_packed(K,wb,Ps)
 Ensure qc4_packed(K,wb,Ps) * store(&(__return.s0),float,qc4_float_field(kind,tile,j+0,Ps)) * store(&(__return.s1),float,qc4_float_field(kind,tile,j+1,Ps)) * store(&(__return.s2),float,qc4_float_field(kind,tile,j+2,Ps)) * store(&(__return.s3),float,qc4_float_field(kind,tile,j+3,Ps)) */;
int32x4_t vld1q_dup_s32(const int *p)
/*@ With (x:Z)
 Require store(p,int,x)
 Ensure store(p,int,x) * store(&(__return.s0),int,x) * store(&(__return.s1),int,x) * store(&(__return.s2),int,x) * store(&(__return.s3),int,x) */;
float32x4_t vld1q_dup_f32(const float *p)
/*@ With (x:fp32)
 Require store(p,float,x)
 Ensure store(p,float,x) * store(&(__return.s0),float,x) * store(&(__return.s1),float,x) * store(&(__return.s2),float,x) * store(&(__return.s3),float,x) */;
float32x4_t vdupq_n_f32(float x)
/*@ Require emp
 Ensure store(&(__return.s0),float,x) * store(&(__return.s1),float,x) * store(&(__return.s2),float,x) * store(&(__return.s3),float,x) */;
int16x4_t vget_low_s16(int16x8_t a)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z)
 Require store(&(a.s0),short,x0) * store(&(a.s1),short,x1) * store(&(a.s2),short,x2) * store(&(a.s3),short,x3) * store(&(a.s4),short,x4) * store(&(a.s5),short,x5) * store(&(a.s6),short,x6) * store(&(a.s7),short,x7)
 Ensure store(&(__return.s0),short,x0) * store(&(__return.s1),short,x1) * store(&(__return.s2),short,x2) * store(&(__return.s3),short,x3) */;
int16x4_t vget_high_s16(int16x8_t a)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z)
 Require store(&(a.s0),short,x0) * store(&(a.s1),short,x1) * store(&(a.s2),short,x2) * store(&(a.s3),short,x3) * store(&(a.s4),short,x4) * store(&(a.s5),short,x5) * store(&(a.s6),short,x6) * store(&(a.s7),short,x7)
 Ensure store(&(__return.s0),short,x4) * store(&(__return.s1),short,x5) * store(&(__return.s2),short,x6) * store(&(__return.s3),short,x7) */;
float32x2_t vget_low_f32(float32x4_t a)
/*@ With (x0:fp32) (x1:fp32) (x2:fp32) (x3:fp32)
 Require store(&(a.s0),float,x0) * store(&(a.s1),float,x1) * store(&(a.s2),float,x2) * store(&(a.s3),float,x3)
 Ensure store(&(__return.s0),float,x0) * store(&(__return.s1),float,x1) */;
float32x2_t vget_high_f32(float32x4_t a)
/*@ With (x0:fp32) (x1:fp32) (x2:fp32) (x3:fp32)
 Require store(&(a.s0),float,x0) * store(&(a.s1),float,x1) * store(&(a.s2),float,x2) * store(&(a.s3),float,x3)
 Ensure store(&(__return.s0),float,x2) * store(&(__return.s1),float,x3) */;
int16x8_t vmovl_s8(int8x8_t a)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z)
 Require store(&(a.s0),char,x0) * store(&(a.s1),char,x1) * store(&(a.s2),char,x2) * store(&(a.s3),char,x3) * store(&(a.s4),char,x4) * store(&(a.s5),char,x5) * store(&(a.s6),char,x6) * store(&(a.s7),char,x7)
 Ensure store(&(__return.s0),short,x0) * store(&(__return.s1),short,x1) * store(&(__return.s2),short,x2) * store(&(__return.s3),short,x3) * store(&(__return.s4),short,x4) * store(&(__return.s5),short,x5) * store(&(__return.s6),short,x6) * store(&(__return.s7),short,x7) */;
float32x4_t vcvtq_f32_s32(int32x4_t a)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z)
 Require store(&(a.s0),int,x0) * store(&(a.s1),int,x1) * store(&(a.s2),int,x2) * store(&(a.s3),int,x3)
 Ensure store(&(__return.s0),float,fp32_of_Z(x0)) * store(&(__return.s1),float,fp32_of_Z(x1)) * store(&(__return.s2),float,fp32_of_Z(x2)) * store(&(__return.s3),float,fp32_of_Z(x3)) */;
int32x4_t vmulq_s32(int32x4_t a,int32x4_t b)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) (y0:Z) (y1:Z) (y2:Z) (y3:Z)
 Require store(&(a.s0),int,x0) * store(&(a.s1),int,x1) * store(&(a.s2),int,x2) * store(&(a.s3),int,x3) * store(&(b.s0),int,y0) * store(&(b.s1),int,y1) * store(&(b.s2),int,y2) * store(&(b.s3),int,y3)
 Ensure store(&(__return.s0),int,qc4_wrap_signed(x0*y0)) * store(&(__return.s1),int,qc4_wrap_signed(x1*y1)) * store(&(__return.s2),int,qc4_wrap_signed(x2*y2)) * store(&(__return.s3),int,qc4_wrap_signed(x3*y3)) */;
float32x4_t vmulq_f32(float32x4_t a,float32x4_t b)
/*@ With (x0:fp32) (x1:fp32) (x2:fp32) (x3:fp32) (y0:fp32) (y1:fp32) (y2:fp32) (y3:fp32)
 Require store(&(a.s0),float,x0) * store(&(a.s1),float,x1) * store(&(a.s2),float,x2) * store(&(a.s3),float,x3) * store(&(b.s0),float,y0) * store(&(b.s1),float,y1) * store(&(b.s2),float,y2) * store(&(b.s3),float,y3)
 Ensure store(&(__return.s0),float,qc4_fp32_mul(x0,y0)) * store(&(__return.s1),float,qc4_fp32_mul(x1,y1)) * store(&(__return.s2),float,qc4_fp32_mul(x2,y2)) * store(&(__return.s3),float,qc4_fp32_mul(x3,y3)) */;
float32x4_t vminq_f32(float32x4_t a,float32x4_t b)
/*@ With (x0:fp32) (x1:fp32) (x2:fp32) (x3:fp32) (y0:fp32) (y1:fp32) (y2:fp32) (y3:fp32)
 Require store(&(a.s0),float,x0) * store(&(a.s1),float,x1) * store(&(a.s2),float,x2) * store(&(a.s3),float,x3) * store(&(b.s0),float,y0) * store(&(b.s1),float,y1) * store(&(b.s2),float,y2) * store(&(b.s3),float,y3)
 Ensure store(&(__return.s0),float,fp32_neon_min(x0,y0)) * store(&(__return.s1),float,fp32_neon_min(x1,y1)) * store(&(__return.s2),float,fp32_neon_min(x2,y2)) * store(&(__return.s3),float,fp32_neon_min(x3,y3)) */;
float32x4_t vmaxq_f32(float32x4_t a,float32x4_t b)
/*@ With (x0:fp32) (x1:fp32) (x2:fp32) (x3:fp32) (y0:fp32) (y1:fp32) (y2:fp32) (y3:fp32)
 Require store(&(a.s0),float,x0) * store(&(a.s1),float,x1) * store(&(a.s2),float,x2) * store(&(a.s3),float,x3) * store(&(b.s0),float,y0) * store(&(b.s1),float,y1) * store(&(b.s2),float,y2) * store(&(b.s3),float,y3)
 Ensure store(&(__return.s0),float,fp32_neon_max(x0,y0)) * store(&(__return.s1),float,fp32_neon_max(x1,y1)) * store(&(__return.s2),float,fp32_neon_max(x2,y2)) * store(&(__return.s3),float,fp32_neon_max(x3,y3)) */;
float32x4_t vfmaq_f32(float32x4_t acc,float32x4_t a,float32x4_t b)
/*@ With (x0:fp32) (x1:fp32) (x2:fp32) (x3:fp32) (y0:fp32) (y1:fp32) (y2:fp32) (y3:fp32) (z0:fp32) (z1:fp32) (z2:fp32) (z3:fp32)
 Require store(&(acc.s0),float,z0) * store(&(acc.s1),float,z1) * store(&(acc.s2),float,z2) * store(&(acc.s3),float,z3) * store(&(a.s0),float,x0) * store(&(a.s1),float,x1) * store(&(a.s2),float,x2) * store(&(a.s3),float,x3) * store(&(b.s0),float,y0) * store(&(b.s1),float,y1) * store(&(b.s2),float,y2) * store(&(b.s3),float,y3)
 Ensure store(&(__return.s0),float,fma_rne(x0,y0,z0)) * store(&(__return.s1),float,fma_rne(x1,y1,z1)) * store(&(__return.s2),float,fma_rne(x2,y2,z2)) * store(&(__return.s3),float,fma_rne(x3,y3,z3)) */;
int32x4_t vmlal_lane_s16(int32x4_t acc,int16x4_t b,int16x4_t a,int lane)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) (y0:Z) (y1:Z) (y2:Z) (y3:Z) (z0:Z) (z1:Z) (z2:Z) (z3:Z)
 Require 0<=lane && lane<4 && store(&(acc.s0),int,z0) * store(&(acc.s1),int,z1) * store(&(acc.s2),int,z2) * store(&(acc.s3),int,z3) * store(&(b.s0),short,y0) * store(&(b.s1),short,y1) * store(&(b.s2),short,y2) * store(&(b.s3),short,y3) * store(&(a.s0),short,x0) * store(&(a.s1),short,x1) * store(&(a.s2),short,x2) * store(&(a.s3),short,x3)
 Ensure store(&(__return.s0),int,qc4_mac_signed(z0,y0,qc4_i16_lane(lane,x0,x1,x2,x3))) * store(&(__return.s1),int,qc4_mac_signed(z1,y1,qc4_i16_lane(lane,x0,x1,x2,x3))) * store(&(__return.s2),int,qc4_mac_signed(z2,y2,qc4_i16_lane(lane,x0,x1,x2,x3))) * store(&(__return.s3),int,qc4_mac_signed(z3,y3,qc4_i16_lane(lane,x0,x1,x2,x3))) */;
void qcp_vst1q_f32(float *p,const float32x4_t *a)
/*@ With (x0:fp32) (x1:fp32) (x2:fp32) (x3:fp32) (base:Z) (N:Z) (done:Z) (L:list fp32)
 Require 0<=done && done+4<=N && p==base+4*done && store(&(a->s0),float,x0) * store(&(a->s1),float,x1) * store(&(a->s2),float,x2) * store(&(a->s3),float,x3) * qc4_write_state(base,N,done,L)
 Ensure store(&(a->s0),float,x0) * store(&(a->s1),float,x1) * store(&(a->s2),float,x2) * store(&(a->s3),float,x3) * qc4_write_state(base,N,done+4,qc4_fappend(L,cons(x0,cons(x1,cons(x2,cons(x3,nil)))))) */;
void qcp_vst1_f32(float *p,const float32x2_t *a)
/*@ With (x0:fp32) (x1:fp32) (base:Z) (N:Z) (done:Z) (L:list fp32)
 Require 0<=done && done+2<=N && p==base+4*done && store(&(a->s0),float,x0) * store(&(a->s1),float,x1) * qc4_write_state(base,N,done,L)
 Ensure store(&(a->s0),float,x0) * store(&(a->s1),float,x1) * qc4_write_state(base,N,done+2,qc4_fappend(L,cons(x0,cons(x1,nil)))) */;
void qcp_vst1_lane_f32(float *p,const float32x2_t *a,int lane)
/*@ With (x0:fp32) (x1:fp32) (base:Z) (N:Z) (done:Z) (L:list fp32)
 Require lane==0 && 0<=done && done+1<=N && p==base+4*done && store(&(a->s0),float,x0) * store(&(a->s1),float,x1) * qc4_write_state(base,N,done,L)
 Ensure store(&(a->s0),float,x0) * store(&(a->s1),float,x1) * qc4_write_state(base,N,done+1,qc4_fappend(L,cons(x0,nil))) */;
int8x8_t vmov_n_s8(int value)
/*@ Require emp
 Ensure store(&(__return.s0),char,qc4_narrow8(value)) * store(&(__return.s1),char,qc4_narrow8(value)) * store(&(__return.s2),char,qc4_narrow8(value)) * store(&(__return.s3),char,qc4_narrow8(value)) * store(&(__return.s4),char,qc4_narrow8(value)) * store(&(__return.s5),char,qc4_narrow8(value)) * store(&(__return.s6),char,qc4_narrow8(value)) * store(&(__return.s7),char,qc4_narrow8(value)) */;
int8x8_t vshl_n_s8(int8x8_t a,int shift)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z)
 Require shift==4 && store(&(a.s0),char,x0) * store(&(a.s1),char,x1) * store(&(a.s2),char,x2) * store(&(a.s3),char,x3) * store(&(a.s4),char,x4) * store(&(a.s5),char,x5) * store(&(a.s6),char,x6) * store(&(a.s7),char,x7)
 Ensure store(&(__return.s0),char,low_bitop(x0)) * store(&(__return.s1),char,low_bitop(x1)) * store(&(__return.s2),char,low_bitop(x2)) * store(&(__return.s3),char,low_bitop(x3)) * store(&(__return.s4),char,low_bitop(x4)) * store(&(__return.s5),char,low_bitop(x5)) * store(&(__return.s6),char,low_bitop(x6)) * store(&(__return.s7),char,low_bitop(x7)) */;
int8x8_t vand_s8(int8x8_t a,int8x8_t b)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z) (y0:Z) (y1:Z) (y2:Z) (y3:Z) (y4:Z) (y5:Z) (y6:Z) (y7:Z)
 Require y0==(-16) && y1==(-16) && y2==(-16) && y3==(-16) && y4==(-16) && y5==(-16) && y6==(-16) && y7==(-16) && store(&(a.s0),char,x0) * store(&(a.s1),char,x1) * store(&(a.s2),char,x2) * store(&(a.s3),char,x3) * store(&(a.s4),char,x4) * store(&(a.s5),char,x5) * store(&(a.s6),char,x6) * store(&(a.s7),char,x7) * store(&(b.s0),char,y0) * store(&(b.s1),char,y1) * store(&(b.s2),char,y2) * store(&(b.s3),char,y3) * store(&(b.s4),char,y4) * store(&(b.s5),char,y5) * store(&(b.s6),char,y6) * store(&(b.s7),char,y7)
 Ensure store(&(__return.s0),char,high_bitop(x0)) * store(&(__return.s1),char,high_bitop(x1)) * store(&(__return.s2),char,high_bitop(x2)) * store(&(__return.s3),char,high_bitop(x3)) * store(&(__return.s4),char,high_bitop(x4)) * store(&(__return.s5),char,high_bitop(x5)) * store(&(__return.s6),char,high_bitop(x6)) * store(&(__return.s7),char,high_bitop(x7)) */;
int32x4_t vshrq_n_s32(int32x4_t a,int shift)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z)
 Require shift==4 && store(&(a.s0),int,x0) * store(&(a.s1),int,x1) * store(&(a.s2),int,x2) * store(&(a.s3),int,x3)
 Ensure store(&(__return.s0),int,shifted_accumulator(x0)) * store(&(__return.s1),int,shifted_accumulator(x1)) * store(&(__return.s2),int,shifted_accumulator(x2)) * store(&(__return.s3),int,shifted_accumulator(x3)) */;
/*
struct xnn_f32_qc4w_minmax_params {
  struct {
    float min;
    float max;
    int32_t kernel_zero_point;
  } scalar;
};
*/
void test_neon(
    size_t mr,
    size_t nc,
    size_t kc,
    const int8_t* restrict a,
    size_t a_stride,
    const void* restrict w,
    float* restrict c,
    size_t cm_stride,
    size_t cn_stride,
    const struct xnn_f32_qc4w_minmax_params* restrict params,
    const struct xnn_qd8_quantization_params* restrict quantization_params)
{
  qcp_assert(mr != 0);
  qcp_assert(mr <= 1);
  qcp_assert(nc != 0);
  qcp_assert(kc != 0);
  qcp_assert(kc % sizeof(int8_t) == 0);
  qcp_assert(a != ((void*)0));
  qcp_assert(w != ((void*)0));
  qcp_assert(c != ((void*)0));
  const int8_t* a0 = a;
  float* c0 = c;
  const int8x8_t vmask = vmov_n_s8(0xF0);
  kc = round_up_po2(kc, 2);
  do {
    int32x4_t vksum0123 = vld1q_s32(w); w = (const int32_t*) w + 4;
    int32x4_t vksum4567 = vld1q_s32(w); w = (const int32_t*) w + 4;
    int32x4_t vksum89AB = vld1q_s32(w); w = (const int32_t*) w + 4;
    int32x4_t vksumCDEF = vld1q_s32(w); w = (const int32_t*) w + 4;
    const int32x4_t vzp0 = vld1q_dup_s32(&quantization_params[0].zero_point);
    int32x4_t vacc0x0123 = vmulq_s32(vksum0123, vzp0);
    int32x4_t vacc0x4567 = vmulq_s32(vksum4567, vzp0);
    int32x4_t vacc0x89AB = vmulq_s32(vksum89AB, vzp0);
    int32x4_t vacc0xCDEF = vmulq_s32(vksumCDEF, vzp0);
    size_t k = kc;
    while (k >= 8 * sizeof(int8_t)) {
      const int8x8_t va0 = vld1_s8(a0); a0 += 8;
      const int16x8_t vxa0 = vmovl_s8(va0);
      const int8x8_t vb01234567c01 = vld1_s8(w); w = (const uint8_t*) w + 8;
      const int8x8_t vb89ABCDEFc01 = vld1_s8(w); w = (const uint8_t*) w + 8;
      const int8x8_t vb01234567c23 = vld1_s8(w); w = (const uint8_t*) w + 8;
      const int8x8_t vb89ABCDEFc23 = vld1_s8(w); w = (const uint8_t*) w + 8;
      const int8x8_t vb01234567c45 = vld1_s8(w); w = (const uint8_t*) w + 8;
      const int8x8_t vb89ABCDEFc45 = vld1_s8(w); w = (const uint8_t*) w + 8;
      const int8x8_t vb01234567c67 = vld1_s8(w); w = (const uint8_t*) w + 8;
      const int8x8_t vb89ABCDEFc67 = vld1_s8(w); w = (const uint8_t*) w + 8;
      const int8x8_t vb01234567c0 = vshl_n_s8(vb01234567c01, 4);
      const int8x8_t vb01234567c1 = vand_s8(vb01234567c01, vmask);
      const int8x8_t vb89ABCDEFc0 = vshl_n_s8(vb89ABCDEFc01, 4);
      const int8x8_t vb89ABCDEFc1 = vand_s8(vb89ABCDEFc01, vmask);
      const int8x8_t vb01234567c2 = vshl_n_s8(vb01234567c23, 4);
      const int8x8_t vb01234567c3 = vand_s8(vb01234567c23, vmask);
      const int8x8_t vb89ABCDEFc2 = vshl_n_s8(vb89ABCDEFc23, 4);
      const int8x8_t vb89ABCDEFc3 = vand_s8(vb89ABCDEFc23, vmask);
      const int8x8_t vb01234567c4 = vshl_n_s8(vb01234567c45, 4);
      const int8x8_t vb01234567c5 = vand_s8(vb01234567c45, vmask);
      const int8x8_t vb89ABCDEFc4 = vshl_n_s8(vb89ABCDEFc45, 4);
      const int8x8_t vb89ABCDEFc5 = vand_s8(vb89ABCDEFc45, vmask);
      const int8x8_t vb01234567c6 = vshl_n_s8(vb01234567c67, 4);
      const int8x8_t vb01234567c7 = vand_s8(vb01234567c67, vmask);
      const int8x8_t vb89ABCDEFc6 = vshl_n_s8(vb89ABCDEFc67, 4);
      const int8x8_t vb89ABCDEFc7 = vand_s8(vb89ABCDEFc67, vmask);
      const int16x8_t vxb01234567c0 = vmovl_s8(vb01234567c0);
      const int16x8_t vxb89ABCDEFc0 = vmovl_s8(vb89ABCDEFc0);
      const int16x8_t vxb01234567c1 = vmovl_s8(vb01234567c1);
      const int16x8_t vxb89ABCDEFc1 = vmovl_s8(vb89ABCDEFc1);
      const int16x8_t vxb01234567c2 = vmovl_s8(vb01234567c2);
      const int16x8_t vxb89ABCDEFc2 = vmovl_s8(vb89ABCDEFc2);
      const int16x8_t vxb01234567c3 = vmovl_s8(vb01234567c3);
      const int16x8_t vxb89ABCDEFc3 = vmovl_s8(vb89ABCDEFc3);
      const int16x8_t vxb01234567c4 = vmovl_s8(vb01234567c4);
      const int16x8_t vxb89ABCDEFc4 = vmovl_s8(vb89ABCDEFc4);
      const int16x8_t vxb01234567c5 = vmovl_s8(vb01234567c5);
      const int16x8_t vxb89ABCDEFc5 = vmovl_s8(vb89ABCDEFc5);
      const int16x8_t vxb01234567c6 = vmovl_s8(vb01234567c6);
      const int16x8_t vxb89ABCDEFc6 = vmovl_s8(vb89ABCDEFc6);
      const int16x8_t vxb01234567c7 = vmovl_s8(vb01234567c7);
      const int16x8_t vxb89ABCDEFc7 = vmovl_s8(vb89ABCDEFc7);
      vacc0x0123 = vmlal_lane_s16(vacc0x0123, vget_low_s16(vxb01234567c0), vget_low_s16(vxa0), 0);
      vacc0x4567 = vmlal_lane_s16(vacc0x4567, vget_high_s16(vxb01234567c0), vget_low_s16(vxa0), 0);
      vacc0x89AB = vmlal_lane_s16(vacc0x89AB, vget_low_s16(vxb89ABCDEFc0), vget_low_s16(vxa0), 0);
      vacc0xCDEF = vmlal_lane_s16(vacc0xCDEF, vget_high_s16(vxb89ABCDEFc0), vget_low_s16(vxa0), 0);
      vacc0x0123 = vmlal_lane_s16(vacc0x0123, vget_low_s16(vxb01234567c1), vget_low_s16(vxa0), 1);
      vacc0x4567 = vmlal_lane_s16(vacc0x4567, vget_high_s16(vxb01234567c1), vget_low_s16(vxa0), 1);
      vacc0x89AB = vmlal_lane_s16(vacc0x89AB, vget_low_s16(vxb89ABCDEFc1), vget_low_s16(vxa0), 1);
      vacc0xCDEF = vmlal_lane_s16(vacc0xCDEF, vget_high_s16(vxb89ABCDEFc1), vget_low_s16(vxa0), 1);
      vacc0x0123 = vmlal_lane_s16(vacc0x0123, vget_low_s16(vxb01234567c2), vget_low_s16(vxa0), 2);
      vacc0x4567 = vmlal_lane_s16(vacc0x4567, vget_high_s16(vxb01234567c2), vget_low_s16(vxa0), 2);
      vacc0x89AB = vmlal_lane_s16(vacc0x89AB, vget_low_s16(vxb89ABCDEFc2), vget_low_s16(vxa0), 2);
      vacc0xCDEF = vmlal_lane_s16(vacc0xCDEF, vget_high_s16(vxb89ABCDEFc2), vget_low_s16(vxa0), 2);
      vacc0x0123 = vmlal_lane_s16(vacc0x0123, vget_low_s16(vxb01234567c3), vget_low_s16(vxa0), 3);
      vacc0x4567 = vmlal_lane_s16(vacc0x4567, vget_high_s16(vxb01234567c3), vget_low_s16(vxa0), 3);
      vacc0x89AB = vmlal_lane_s16(vacc0x89AB, vget_low_s16(vxb89ABCDEFc3), vget_low_s16(vxa0), 3);
      vacc0xCDEF = vmlal_lane_s16(vacc0xCDEF, vget_high_s16(vxb89ABCDEFc3), vget_low_s16(vxa0), 3);
      vacc0x0123 = vmlal_lane_s16(vacc0x0123, vget_low_s16(vxb01234567c4), vget_high_s16(vxa0), 0);
      vacc0x4567 = vmlal_lane_s16(vacc0x4567, vget_high_s16(vxb01234567c4), vget_high_s16(vxa0), 0);
      vacc0x89AB = vmlal_lane_s16(vacc0x89AB, vget_low_s16(vxb89ABCDEFc4), vget_high_s16(vxa0), 0);
      vacc0xCDEF = vmlal_lane_s16(vacc0xCDEF, vget_high_s16(vxb89ABCDEFc4), vget_high_s16(vxa0), 0);
      vacc0x0123 = vmlal_lane_s16(vacc0x0123, vget_low_s16(vxb01234567c5), vget_high_s16(vxa0), 1);
      vacc0x4567 = vmlal_lane_s16(vacc0x4567, vget_high_s16(vxb01234567c5), vget_high_s16(vxa0), 1);
      vacc0x89AB = vmlal_lane_s16(vacc0x89AB, vget_low_s16(vxb89ABCDEFc5), vget_high_s16(vxa0), 1);
      vacc0xCDEF = vmlal_lane_s16(vacc0xCDEF, vget_high_s16(vxb89ABCDEFc5), vget_high_s16(vxa0), 1);
      vacc0x0123 = vmlal_lane_s16(vacc0x0123, vget_low_s16(vxb01234567c6), vget_high_s16(vxa0), 2);
      vacc0x4567 = vmlal_lane_s16(vacc0x4567, vget_high_s16(vxb01234567c6), vget_high_s16(vxa0), 2);
      vacc0x89AB = vmlal_lane_s16(vacc0x89AB, vget_low_s16(vxb89ABCDEFc6), vget_high_s16(vxa0), 2);
      vacc0xCDEF = vmlal_lane_s16(vacc0xCDEF, vget_high_s16(vxb89ABCDEFc6), vget_high_s16(vxa0), 2);
      vacc0x0123 = vmlal_lane_s16(vacc0x0123, vget_low_s16(vxb01234567c7), vget_high_s16(vxa0), 3);
      vacc0x4567 = vmlal_lane_s16(vacc0x4567, vget_high_s16(vxb01234567c7), vget_high_s16(vxa0), 3);
      vacc0x89AB = vmlal_lane_s16(vacc0x89AB, vget_low_s16(vxb89ABCDEFc7), vget_high_s16(vxa0), 3);
      vacc0xCDEF = vmlal_lane_s16(vacc0xCDEF, vget_high_s16(vxb89ABCDEFc7), vget_high_s16(vxa0), 3);
      k -= 8 * sizeof(int8_t);
    }
    if (k != 0) {
      const int8x8_t va0 = vld1_s8(a0); a0 = (const int8_t*) ((uintptr_t) a0 + k);
      const int16x8_t vxa0 = vmovl_s8(va0);
      const int8x8_t vb01234567c01 = vld1_s8(w); w = (const int8_t*) w + 8;
      const int8x8_t vb89ABCDEFc01 = vld1_s8(w); w = (const int8_t*) w + 8;
      const int8x8_t vb01234567c0 = vshl_n_s8(vb01234567c01, 4);
      const int8x8_t vb01234567c1 = vand_s8(vb01234567c01, vmask);
      const int8x8_t vb89ABCDEFc0 = vshl_n_s8(vb89ABCDEFc01, 4);
      const int8x8_t vb89ABCDEFc1 = vand_s8(vb89ABCDEFc01, vmask);
      const int16x8_t vxb01234567c0 = vmovl_s8(vb01234567c0);
      const int16x8_t vxb89ABCDEFc0 = vmovl_s8(vb89ABCDEFc0);
      vacc0x0123 = vmlal_lane_s16(vacc0x0123, vget_low_s16(vxb01234567c0), vget_low_s16(vxa0), 0);
      vacc0x4567 = vmlal_lane_s16(vacc0x4567, vget_high_s16(vxb01234567c0), vget_low_s16(vxa0), 0);
      vacc0x89AB = vmlal_lane_s16(vacc0x89AB, vget_low_s16(vxb89ABCDEFc0), vget_low_s16(vxa0), 0);
      vacc0xCDEF = vmlal_lane_s16(vacc0xCDEF, vget_high_s16(vxb89ABCDEFc0), vget_low_s16(vxa0), 0);
      if (k >= 2 * sizeof(int8_t)) {
        const int16x8_t vxb01234567c1 = vmovl_s8(vb01234567c1);
        const int16x8_t vxb89ABCDEFc1 = vmovl_s8(vb89ABCDEFc1);
        vacc0x0123 = vmlal_lane_s16(vacc0x0123, vget_low_s16(vxb01234567c1), vget_low_s16(vxa0), 1);
        vacc0x4567 = vmlal_lane_s16(vacc0x4567, vget_high_s16(vxb01234567c1), vget_low_s16(vxa0), 1);
        vacc0x89AB = vmlal_lane_s16(vacc0x89AB, vget_low_s16(vxb89ABCDEFc1), vget_low_s16(vxa0), 1);
        vacc0xCDEF = vmlal_lane_s16(vacc0xCDEF, vget_high_s16(vxb89ABCDEFc1), vget_low_s16(vxa0), 1);
        if (k > 2 * sizeof(int8_t)) {
          const int8x8_t vb01234567c23 = vld1_s8(w); w = (const int8_t*) w + 8;
          const int8x8_t vb89ABCDEFc23 = vld1_s8(w); w = (const int8_t*) w + 8;
          const int8x8_t vb01234567c2 = vshl_n_s8(vb01234567c23, 4);
          const int8x8_t vb01234567c3 = vand_s8(vb01234567c23, vmask);
          const int8x8_t vb89ABCDEFc2 = vshl_n_s8(vb89ABCDEFc23, 4);
          const int8x8_t vb89ABCDEFc3 = vand_s8(vb89ABCDEFc23, vmask);
          const int16x8_t vxb01234567c2 = vmovl_s8(vb01234567c2);
          const int16x8_t vxb89ABCDEFc2 = vmovl_s8(vb89ABCDEFc2);
          vacc0x0123 = vmlal_lane_s16(vacc0x0123, vget_low_s16(vxb01234567c2), vget_low_s16(vxa0), 2);
          vacc0x4567 = vmlal_lane_s16(vacc0x4567, vget_high_s16(vxb01234567c2), vget_low_s16(vxa0), 2);
          vacc0x89AB = vmlal_lane_s16(vacc0x89AB, vget_low_s16(vxb89ABCDEFc2), vget_low_s16(vxa0), 2);
          vacc0xCDEF = vmlal_lane_s16(vacc0xCDEF, vget_high_s16(vxb89ABCDEFc2), vget_low_s16(vxa0), 2);
          if (k >= 4 * sizeof(int8_t)) {
            const int16x8_t vxb01234567c3 = vmovl_s8(vb01234567c3);
            const int16x8_t vxb89ABCDEFc3 = vmovl_s8(vb89ABCDEFc3);
            vacc0x0123 = vmlal_lane_s16(vacc0x0123, vget_low_s16(vxb01234567c3), vget_low_s16(vxa0), 3);
            vacc0x4567 = vmlal_lane_s16(vacc0x4567, vget_high_s16(vxb01234567c3), vget_low_s16(vxa0), 3);
            vacc0x89AB = vmlal_lane_s16(vacc0x89AB, vget_low_s16(vxb89ABCDEFc3), vget_low_s16(vxa0), 3);
            vacc0xCDEF = vmlal_lane_s16(vacc0xCDEF, vget_high_s16(vxb89ABCDEFc3), vget_low_s16(vxa0), 3);
            if (k > 4 * sizeof(int8_t)) {
              const int8x8_t vb01234567c45 = vld1_s8(w); w = (const int8_t*) w + 8;
              const int8x8_t vb89ABCDEFc45 = vld1_s8(w); w = (const int8_t*) w + 8;
              const int8x8_t vb01234567c4 = vshl_n_s8(vb01234567c45, 4);
              const int8x8_t vb01234567c5 = vand_s8(vb01234567c45, vmask);
              const int8x8_t vb89ABCDEFc4 = vshl_n_s8(vb89ABCDEFc45, 4);
              const int8x8_t vb89ABCDEFc5 = vand_s8(vb89ABCDEFc45, vmask);
              const int16x8_t vxb01234567c4 = vmovl_s8(vb01234567c4);
              const int16x8_t vxb89ABCDEFc4 = vmovl_s8(vb89ABCDEFc4);
              vacc0x0123 = vmlal_lane_s16(vacc0x0123, vget_low_s16(vxb01234567c4), vget_high_s16(vxa0), 0);
              vacc0x4567 = vmlal_lane_s16(vacc0x4567, vget_high_s16(vxb01234567c4), vget_high_s16(vxa0), 0);
              vacc0x89AB = vmlal_lane_s16(vacc0x89AB, vget_low_s16(vxb89ABCDEFc4), vget_high_s16(vxa0), 0);
              vacc0xCDEF = vmlal_lane_s16(vacc0xCDEF, vget_high_s16(vxb89ABCDEFc4), vget_high_s16(vxa0), 0);
              if (k >= 6 * sizeof(int8_t)) {
                const int16x8_t vxb01234567c5 = vmovl_s8(vb01234567c5);
                const int16x8_t vxb89ABCDEFc5 = vmovl_s8(vb89ABCDEFc5);
                vacc0x0123 = vmlal_lane_s16(vacc0x0123, vget_low_s16(vxb01234567c5), vget_high_s16(vxa0), 1);
                vacc0x4567 = vmlal_lane_s16(vacc0x4567, vget_high_s16(vxb01234567c5), vget_high_s16(vxa0), 1);
                vacc0x89AB = vmlal_lane_s16(vacc0x89AB, vget_low_s16(vxb89ABCDEFc5), vget_high_s16(vxa0), 1);
                vacc0xCDEF = vmlal_lane_s16(vacc0xCDEF, vget_high_s16(vxb89ABCDEFc5), vget_high_s16(vxa0), 1);
              }
            }
          }
        }
      }
    }
    // Shift-then-convert, recipe-aligned with the RVV target (vsra+vfcvt); bit-equal
    // to vcvtq_n_f32_s32(.,4) under the packer invariant acc ≡ 0 (mod 16).
    // float32x4_t vout0x0123 = vcvtq_n_f32_s32(vacc0x0123, 4);
    // float32x4_t vout0x4567 = vcvtq_n_f32_s32(vacc0x4567, 4);
    // float32x4_t vout0x89AB = vcvtq_n_f32_s32(vacc0x89AB, 4);
    // float32x4_t vout0xCDEF = vcvtq_n_f32_s32(vacc0xCDEF, 4);
    float32x4_t vout0x0123 = vcvtq_f32_s32(vshrq_n_s32(vacc0x0123, 4));
    float32x4_t vout0x4567 = vcvtq_f32_s32(vshrq_n_s32(vacc0x4567, 4));
    float32x4_t vout0x89AB = vcvtq_f32_s32(vshrq_n_s32(vacc0x89AB, 4));
    float32x4_t vout0xCDEF = vcvtq_f32_s32(vshrq_n_s32(vacc0xCDEF, 4));
    const float32x4_t vinput_scale0 = vld1q_dup_f32(&quantization_params[0].inv_scale);
    vout0x0123 = vmulq_f32(vout0x0123, vinput_scale0);
    vout0x4567 = vmulq_f32(vout0x4567, vinput_scale0);
    vout0x89AB = vmulq_f32(vout0x89AB, vinput_scale0);
    vout0xCDEF = vmulq_f32(vout0xCDEF, vinput_scale0);
    const float32x4_t vfilter_output_scale0123 = vld1q_f32(w); w = (const float*) w + 4;
    const float32x4_t vfilter_output_scale4567 = vld1q_f32(w); w = (const float*) w + 4;
    const float32x4_t vfilter_output_scale89AB = vld1q_f32(w); w = (const float*) w + 4;
    const float32x4_t vfilter_output_scaleCDEF = vld1q_f32(w); w = (const float*) w + 4;
    const float32x4_t vbias0123 = vld1q_f32(w); w = (const float*) w + 4;
      vout0x0123 = vfmaq_f32(vbias0123, vout0x0123, vfilter_output_scale0123);
    const float32x4_t vbias4567 = vld1q_f32(w); w = (const float*) w + 4;
      vout0x4567 = vfmaq_f32(vbias4567, vout0x4567, vfilter_output_scale4567);
    const float32x4_t vbias89AB = vld1q_f32(w); w = (const float*) w + 4;
      vout0x89AB = vfmaq_f32(vbias89AB, vout0x89AB, vfilter_output_scale89AB);
    const float32x4_t vbiasCDEF = vld1q_f32(w); w = (const float*) w + 4;
      vout0xCDEF = vfmaq_f32(vbiasCDEF, vout0xCDEF, vfilter_output_scaleCDEF);
    const float32x4_t voutput_min = vdupq_n_f32(params->scalar.min);
    vout0x0123 = vmaxq_f32(vout0x0123, voutput_min);
    vout0x4567 = vmaxq_f32(vout0x4567, voutput_min);
    vout0x89AB = vmaxq_f32(vout0x89AB, voutput_min);
    vout0xCDEF = vmaxq_f32(vout0xCDEF, voutput_min);
    const float32x4_t voutput_max = vdupq_n_f32(params->scalar.max);
    vout0x0123 = vminq_f32(vout0x0123, voutput_max);
    vout0x4567 = vminq_f32(vout0x4567, voutput_max);
    vout0x89AB = vminq_f32(vout0x89AB, voutput_max);
    vout0xCDEF = vminq_f32(vout0xCDEF, voutput_max);
    if (nc >= 16) {
      qcp_vst1q_f32((&c0[0]),&(vout0x0123));
      qcp_vst1q_f32((&c0[4]),&(vout0x4567));
      qcp_vst1q_f32((&c0[8]),&(vout0x89AB));
      qcp_vst1q_f32((&c0[12]),&(vout0xCDEF));
      a0 = (const int8_t*) ((uintptr_t) a0 - kc);
      c0 = (float*) ((uintptr_t) c0 + cn_stride);
      nc -= 16;
    } else {
      if (nc & 8) {
        qcp_vst1q_f32((c0),&(vout0x0123)); c0 += 4;
        vout0x0123 = vout0x89AB;
        qcp_vst1q_f32((c0),&(vout0x4567)); c0 += 4;
        vout0x4567 = vout0xCDEF;
      }
      if (nc & 4) {
        qcp_vst1q_f32((c0),&(vout0x0123)); c0 += 4;
        vout0x0123 = vout0x4567;
      }
      float32x2_t vout0x01 = vget_low_f32(vout0x0123);
      if (nc & 2) {
        qcp_vst1_f32((c0),&(vout0x01)); c0 += 2;
        vout0x01 = vget_high_f32(vout0x0123);
      }
      if (nc & 1) {
        qcp_vst1_lane_f32((c0),&(vout0x01),(0));
      }
      nc = 0;
    }
  } while (nc != 0);
}
