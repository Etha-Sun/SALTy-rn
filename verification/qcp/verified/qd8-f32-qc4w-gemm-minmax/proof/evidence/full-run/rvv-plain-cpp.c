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
vint32m8_t __riscv_vmul_vx_i32m8(vint32m8_t a,int scalar,size_t vl)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z) (x8:Z) (x9:Z) (x10:Z) (x11:Z) (x12:Z) (x13:Z) (x14:Z) (x15:Z)
 Require 1<=vl && vl<=16 && store(&(a.s0),int,x0) * store(&(a.s1),int,x1) * store(&(a.s2),int,x2) * store(&(a.s3),int,x3) * store(&(a.s4),int,x4) * store(&(a.s5),int,x5) * store(&(a.s6),int,x6) * store(&(a.s7),int,x7) * store(&(a.s8),int,x8) * store(&(a.s9),int,x9) * store(&(a.s10),int,x10) * store(&(a.s11),int,x11) * store(&(a.s12),int,x12) * store(&(a.s13),int,x13) * store(&(a.s14),int,x14) * store(&(a.s15),int,x15)
 Ensure exists r0 r1 r2 r3 r4 r5 r6 r7 r8 r9 r10 r11 r12 r13 r14 r15, qc4_active16_z(vl,r0,r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,r11,r12,r13,r14,r15,qc4_wrap_signed(x0*scalar),qc4_wrap_signed(x1*scalar),qc4_wrap_signed(x2*scalar),qc4_wrap_signed(x3*scalar),qc4_wrap_signed(x4*scalar),qc4_wrap_signed(x5*scalar),qc4_wrap_signed(x6*scalar),qc4_wrap_signed(x7*scalar),qc4_wrap_signed(x8*scalar),qc4_wrap_signed(x9*scalar),qc4_wrap_signed(x10*scalar),qc4_wrap_signed(x11*scalar),qc4_wrap_signed(x12*scalar),qc4_wrap_signed(x13*scalar),qc4_wrap_signed(x14*scalar),qc4_wrap_signed(x15*scalar)) && store(&(__return.s0),int,r0) * store(&(__return.s1),int,r1) * store(&(__return.s2),int,r2) * store(&(__return.s3),int,r3) * store(&(__return.s4),int,r4) * store(&(__return.s5),int,r5) * store(&(__return.s6),int,r6) * store(&(__return.s7),int,r7) * store(&(__return.s8),int,r8) * store(&(__return.s9),int,r9) * store(&(__return.s10),int,r10) * store(&(__return.s11),int,r11) * store(&(__return.s12),int,r12) * store(&(__return.s13),int,r13) * store(&(__return.s14),int,r14) * store(&(__return.s15),int,r15) */;
vint8m2_t __riscv_vsll_vx_i8m2(vint8m2_t a,size_t shift,size_t vl)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z) (x8:Z) (x9:Z) (x10:Z) (x11:Z) (x12:Z) (x13:Z) (x14:Z) (x15:Z)
 Require 1<=vl && vl<=16 && shift==4 && store(&(a.s0),char,x0) * store(&(a.s1),char,x1) * store(&(a.s2),char,x2) * store(&(a.s3),char,x3) * store(&(a.s4),char,x4) * store(&(a.s5),char,x5) * store(&(a.s6),char,x6) * store(&(a.s7),char,x7) * store(&(a.s8),char,x8) * store(&(a.s9),char,x9) * store(&(a.s10),char,x10) * store(&(a.s11),char,x11) * store(&(a.s12),char,x12) * store(&(a.s13),char,x13) * store(&(a.s14),char,x14) * store(&(a.s15),char,x15)
 Ensure exists r0 r1 r2 r3 r4 r5 r6 r7 r8 r9 r10 r11 r12 r13 r14 r15, qc4_active16_z(vl,r0,r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,r11,r12,r13,r14,r15,low_bitop(x0),low_bitop(x1),low_bitop(x2),low_bitop(x3),low_bitop(x4),low_bitop(x5),low_bitop(x6),low_bitop(x7),low_bitop(x8),low_bitop(x9),low_bitop(x10),low_bitop(x11),low_bitop(x12),low_bitop(x13),low_bitop(x14),low_bitop(x15)) && store(&(__return.s0),char,r0) * store(&(__return.s1),char,r1) * store(&(__return.s2),char,r2) * store(&(__return.s3),char,r3) * store(&(__return.s4),char,r4) * store(&(__return.s5),char,r5) * store(&(__return.s6),char,r6) * store(&(__return.s7),char,r7) * store(&(__return.s8),char,r8) * store(&(__return.s9),char,r9) * store(&(__return.s10),char,r10) * store(&(__return.s11),char,r11) * store(&(__return.s12),char,r12) * store(&(__return.s13),char,r13) * store(&(__return.s14),char,r14) * store(&(__return.s15),char,r15) */;
vint8m2_t __riscv_vand_vx_i8m2(vint8m2_t a,int8_t mask,size_t vl)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z) (x8:Z) (x9:Z) (x10:Z) (x11:Z) (x12:Z) (x13:Z) (x14:Z) (x15:Z)
 Require 1<=vl && vl<=16 && mask==(-16) && store(&(a.s0),char,x0) * store(&(a.s1),char,x1) * store(&(a.s2),char,x2) * store(&(a.s3),char,x3) * store(&(a.s4),char,x4) * store(&(a.s5),char,x5) * store(&(a.s6),char,x6) * store(&(a.s7),char,x7) * store(&(a.s8),char,x8) * store(&(a.s9),char,x9) * store(&(a.s10),char,x10) * store(&(a.s11),char,x11) * store(&(a.s12),char,x12) * store(&(a.s13),char,x13) * store(&(a.s14),char,x14) * store(&(a.s15),char,x15)
 Ensure exists r0 r1 r2 r3 r4 r5 r6 r7 r8 r9 r10 r11 r12 r13 r14 r15, qc4_active16_z(vl,r0,r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,r11,r12,r13,r14,r15,high_bitop(x0),high_bitop(x1),high_bitop(x2),high_bitop(x3),high_bitop(x4),high_bitop(x5),high_bitop(x6),high_bitop(x7),high_bitop(x8),high_bitop(x9),high_bitop(x10),high_bitop(x11),high_bitop(x12),high_bitop(x13),high_bitop(x14),high_bitop(x15)) && store(&(__return.s0),char,r0) * store(&(__return.s1),char,r1) * store(&(__return.s2),char,r2) * store(&(__return.s3),char,r3) * store(&(__return.s4),char,r4) * store(&(__return.s5),char,r5) * store(&(__return.s6),char,r6) * store(&(__return.s7),char,r7) * store(&(__return.s8),char,r8) * store(&(__return.s9),char,r9) * store(&(__return.s10),char,r10) * store(&(__return.s11),char,r11) * store(&(__return.s12),char,r12) * store(&(__return.s13),char,r13) * store(&(__return.s14),char,r14) * store(&(__return.s15),char,r15) */;
vint16m4_t __riscv_vsext_vf2_i16m4(vint8m2_t a,size_t vl)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z) (x8:Z) (x9:Z) (x10:Z) (x11:Z) (x12:Z) (x13:Z) (x14:Z) (x15:Z)
 Require 1<=vl && vl<=16 && store(&(a.s0),char,x0) * store(&(a.s1),char,x1) * store(&(a.s2),char,x2) * store(&(a.s3),char,x3) * store(&(a.s4),char,x4) * store(&(a.s5),char,x5) * store(&(a.s6),char,x6) * store(&(a.s7),char,x7) * store(&(a.s8),char,x8) * store(&(a.s9),char,x9) * store(&(a.s10),char,x10) * store(&(a.s11),char,x11) * store(&(a.s12),char,x12) * store(&(a.s13),char,x13) * store(&(a.s14),char,x14) * store(&(a.s15),char,x15)
 Ensure exists r0 r1 r2 r3 r4 r5 r6 r7 r8 r9 r10 r11 r12 r13 r14 r15, qc4_active16_z(vl,r0,r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,r11,r12,r13,r14,r15,x0,x1,x2,x3,x4,x5,x6,x7,x8,x9,x10,x11,x12,x13,x14,x15) && store(&(__return.s0),short,r0) * store(&(__return.s1),short,r1) * store(&(__return.s2),short,r2) * store(&(__return.s3),short,r3) * store(&(__return.s4),short,r4) * store(&(__return.s5),short,r5) * store(&(__return.s6),short,r6) * store(&(__return.s7),short,r7) * store(&(__return.s8),short,r8) * store(&(__return.s9),short,r9) * store(&(__return.s10),short,r10) * store(&(__return.s11),short,r11) * store(&(__return.s12),short,r12) * store(&(__return.s13),short,r13) * store(&(__return.s14),short,r14) * store(&(__return.s15),short,r15) */;
vint32m8_t __riscv_vwmacc_vx_i32m8(vint32m8_t a,short scalar,vint16m4_t b,size_t vl)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z) (x8:Z) (x9:Z) (x10:Z) (x11:Z) (x12:Z) (x13:Z) (x14:Z) (x15:Z) (y0:Z) (y1:Z) (y2:Z) (y3:Z) (y4:Z) (y5:Z) (y6:Z) (y7:Z) (y8:Z) (y9:Z) (y10:Z) (y11:Z) (y12:Z) (y13:Z) (y14:Z) (y15:Z)
 Require 1<=vl && vl<=16 && store(&(a.s0),int,x0) * store(&(a.s1),int,x1) * store(&(a.s2),int,x2) * store(&(a.s3),int,x3) * store(&(a.s4),int,x4) * store(&(a.s5),int,x5) * store(&(a.s6),int,x6) * store(&(a.s7),int,x7) * store(&(a.s8),int,x8) * store(&(a.s9),int,x9) * store(&(a.s10),int,x10) * store(&(a.s11),int,x11) * store(&(a.s12),int,x12) * store(&(a.s13),int,x13) * store(&(a.s14),int,x14) * store(&(a.s15),int,x15) * store(&(b.s0),short,y0) * store(&(b.s1),short,y1) * store(&(b.s2),short,y2) * store(&(b.s3),short,y3) * store(&(b.s4),short,y4) * store(&(b.s5),short,y5) * store(&(b.s6),short,y6) * store(&(b.s7),short,y7) * store(&(b.s8),short,y8) * store(&(b.s9),short,y9) * store(&(b.s10),short,y10) * store(&(b.s11),short,y11) * store(&(b.s12),short,y12) * store(&(b.s13),short,y13) * store(&(b.s14),short,y14) * store(&(b.s15),short,y15)
 Ensure exists r0 r1 r2 r3 r4 r5 r6 r7 r8 r9 r10 r11 r12 r13 r14 r15, qc4_active16_z(vl,r0,r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,r11,r12,r13,r14,r15,qc4_mac_signed(x0,scalar,y0),qc4_mac_signed(x1,scalar,y1),qc4_mac_signed(x2,scalar,y2),qc4_mac_signed(x3,scalar,y3),qc4_mac_signed(x4,scalar,y4),qc4_mac_signed(x5,scalar,y5),qc4_mac_signed(x6,scalar,y6),qc4_mac_signed(x7,scalar,y7),qc4_mac_signed(x8,scalar,y8),qc4_mac_signed(x9,scalar,y9),qc4_mac_signed(x10,scalar,y10),qc4_mac_signed(x11,scalar,y11),qc4_mac_signed(x12,scalar,y12),qc4_mac_signed(x13,scalar,y13),qc4_mac_signed(x14,scalar,y14),qc4_mac_signed(x15,scalar,y15)) && store(&(__return.s0),int,r0) * store(&(__return.s1),int,r1) * store(&(__return.s2),int,r2) * store(&(__return.s3),int,r3) * store(&(__return.s4),int,r4) * store(&(__return.s5),int,r5) * store(&(__return.s6),int,r6) * store(&(__return.s7),int,r7) * store(&(__return.s8),int,r8) * store(&(__return.s9),int,r9) * store(&(__return.s10),int,r10) * store(&(__return.s11),int,r11) * store(&(__return.s12),int,r12) * store(&(__return.s13),int,r13) * store(&(__return.s14),int,r14) * store(&(__return.s15),int,r15) */;
vint32m8_t __riscv_vsra_vx_i32m8(vint32m8_t a,size_t shift,size_t vl)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z) (x8:Z) (x9:Z) (x10:Z) (x11:Z) (x12:Z) (x13:Z) (x14:Z) (x15:Z)
 Require 1<=vl && vl<=16 && shift==4 && store(&(a.s0),int,x0) * store(&(a.s1),int,x1) * store(&(a.s2),int,x2) * store(&(a.s3),int,x3) * store(&(a.s4),int,x4) * store(&(a.s5),int,x5) * store(&(a.s6),int,x6) * store(&(a.s7),int,x7) * store(&(a.s8),int,x8) * store(&(a.s9),int,x9) * store(&(a.s10),int,x10) * store(&(a.s11),int,x11) * store(&(a.s12),int,x12) * store(&(a.s13),int,x13) * store(&(a.s14),int,x14) * store(&(a.s15),int,x15)
 Ensure exists r0 r1 r2 r3 r4 r5 r6 r7 r8 r9 r10 r11 r12 r13 r14 r15, qc4_active16_z(vl,r0,r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,r11,r12,r13,r14,r15,shifted_accumulator(x0),shifted_accumulator(x1),shifted_accumulator(x2),shifted_accumulator(x3),shifted_accumulator(x4),shifted_accumulator(x5),shifted_accumulator(x6),shifted_accumulator(x7),shifted_accumulator(x8),shifted_accumulator(x9),shifted_accumulator(x10),shifted_accumulator(x11),shifted_accumulator(x12),shifted_accumulator(x13),shifted_accumulator(x14),shifted_accumulator(x15)) && store(&(__return.s0),int,r0) * store(&(__return.s1),int,r1) * store(&(__return.s2),int,r2) * store(&(__return.s3),int,r3) * store(&(__return.s4),int,r4) * store(&(__return.s5),int,r5) * store(&(__return.s6),int,r6) * store(&(__return.s7),int,r7) * store(&(__return.s8),int,r8) * store(&(__return.s9),int,r9) * store(&(__return.s10),int,r10) * store(&(__return.s11),int,r11) * store(&(__return.s12),int,r12) * store(&(__return.s13),int,r13) * store(&(__return.s14),int,r14) * store(&(__return.s15),int,r15) */;
vfloat32m8_t __riscv_vfcvt_f_x_v_f32m8(vint32m8_t a,size_t vl)
/*@ With (x0:Z) (x1:Z) (x2:Z) (x3:Z) (x4:Z) (x5:Z) (x6:Z) (x7:Z) (x8:Z) (x9:Z) (x10:Z) (x11:Z) (x12:Z) (x13:Z) (x14:Z) (x15:Z)
 Require 1<=vl && vl<=16 && store(&(a.s0),int,x0) * store(&(a.s1),int,x1) * store(&(a.s2),int,x2) * store(&(a.s3),int,x3) * store(&(a.s4),int,x4) * store(&(a.s5),int,x5) * store(&(a.s6),int,x6) * store(&(a.s7),int,x7) * store(&(a.s8),int,x8) * store(&(a.s9),int,x9) * store(&(a.s10),int,x10) * store(&(a.s11),int,x11) * store(&(a.s12),int,x12) * store(&(a.s13),int,x13) * store(&(a.s14),int,x14) * store(&(a.s15),int,x15)
 Ensure exists r0 r1 r2 r3 r4 r5 r6 r7 r8 r9 r10 r11 r12 r13 r14 r15, qc4_active16_f(vl,r0,r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,r11,r12,r13,r14,r15,fp32_of_Z(x0),fp32_of_Z(x1),fp32_of_Z(x2),fp32_of_Z(x3),fp32_of_Z(x4),fp32_of_Z(x5),fp32_of_Z(x6),fp32_of_Z(x7),fp32_of_Z(x8),fp32_of_Z(x9),fp32_of_Z(x10),fp32_of_Z(x11),fp32_of_Z(x12),fp32_of_Z(x13),fp32_of_Z(x14),fp32_of_Z(x15)) && store(&(__return.s0),float,r0) * store(&(__return.s1),float,r1) * store(&(__return.s2),float,r2) * store(&(__return.s3),float,r3) * store(&(__return.s4),float,r4) * store(&(__return.s5),float,r5) * store(&(__return.s6),float,r6) * store(&(__return.s7),float,r7) * store(&(__return.s8),float,r8) * store(&(__return.s9),float,r9) * store(&(__return.s10),float,r10) * store(&(__return.s11),float,r11) * store(&(__return.s12),float,r12) * store(&(__return.s13),float,r13) * store(&(__return.s14),float,r14) * store(&(__return.s15),float,r15) */;
vfloat32m8_t __riscv_vfmul_vf_f32m8(vfloat32m8_t a,float scalar,size_t vl)
/*@ With (x0:fp32) (x1:fp32) (x2:fp32) (x3:fp32) (x4:fp32) (x5:fp32) (x6:fp32) (x7:fp32) (x8:fp32) (x9:fp32) (x10:fp32) (x11:fp32) (x12:fp32) (x13:fp32) (x14:fp32) (x15:fp32)
 Require 1<=vl && vl<=16 && store(&(a.s0),float,x0) * store(&(a.s1),float,x1) * store(&(a.s2),float,x2) * store(&(a.s3),float,x3) * store(&(a.s4),float,x4) * store(&(a.s5),float,x5) * store(&(a.s6),float,x6) * store(&(a.s7),float,x7) * store(&(a.s8),float,x8) * store(&(a.s9),float,x9) * store(&(a.s10),float,x10) * store(&(a.s11),float,x11) * store(&(a.s12),float,x12) * store(&(a.s13),float,x13) * store(&(a.s14),float,x14) * store(&(a.s15),float,x15)
 Ensure exists r0 r1 r2 r3 r4 r5 r6 r7 r8 r9 r10 r11 r12 r13 r14 r15, qc4_active16_f(vl,r0,r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,r11,r12,r13,r14,r15,qc4_fp32_mul(x0,scalar),qc4_fp32_mul(x1,scalar),qc4_fp32_mul(x2,scalar),qc4_fp32_mul(x3,scalar),qc4_fp32_mul(x4,scalar),qc4_fp32_mul(x5,scalar),qc4_fp32_mul(x6,scalar),qc4_fp32_mul(x7,scalar),qc4_fp32_mul(x8,scalar),qc4_fp32_mul(x9,scalar),qc4_fp32_mul(x10,scalar),qc4_fp32_mul(x11,scalar),qc4_fp32_mul(x12,scalar),qc4_fp32_mul(x13,scalar),qc4_fp32_mul(x14,scalar),qc4_fp32_mul(x15,scalar)) && store(&(__return.s0),float,r0) * store(&(__return.s1),float,r1) * store(&(__return.s2),float,r2) * store(&(__return.s3),float,r3) * store(&(__return.s4),float,r4) * store(&(__return.s5),float,r5) * store(&(__return.s6),float,r6) * store(&(__return.s7),float,r7) * store(&(__return.s8),float,r8) * store(&(__return.s9),float,r9) * store(&(__return.s10),float,r10) * store(&(__return.s11),float,r11) * store(&(__return.s12),float,r12) * store(&(__return.s13),float,r13) * store(&(__return.s14),float,r14) * store(&(__return.s15),float,r15) */;
vfloat32m8_t __riscv_vfmin_vf_f32m8(vfloat32m8_t a,float scalar,size_t vl)
/*@ With (x0:fp32) (x1:fp32) (x2:fp32) (x3:fp32) (x4:fp32) (x5:fp32) (x6:fp32) (x7:fp32) (x8:fp32) (x9:fp32) (x10:fp32) (x11:fp32) (x12:fp32) (x13:fp32) (x14:fp32) (x15:fp32)
 Require 1<=vl && vl<=16 && store(&(a.s0),float,x0) * store(&(a.s1),float,x1) * store(&(a.s2),float,x2) * store(&(a.s3),float,x3) * store(&(a.s4),float,x4) * store(&(a.s5),float,x5) * store(&(a.s6),float,x6) * store(&(a.s7),float,x7) * store(&(a.s8),float,x8) * store(&(a.s9),float,x9) * store(&(a.s10),float,x10) * store(&(a.s11),float,x11) * store(&(a.s12),float,x12) * store(&(a.s13),float,x13) * store(&(a.s14),float,x14) * store(&(a.s15),float,x15)
 Ensure exists r0 r1 r2 r3 r4 r5 r6 r7 r8 r9 r10 r11 r12 r13 r14 r15, qc4_active16_f(vl,r0,r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,r11,r12,r13,r14,r15,fp32_min_number(x0,scalar),fp32_min_number(x1,scalar),fp32_min_number(x2,scalar),fp32_min_number(x3,scalar),fp32_min_number(x4,scalar),fp32_min_number(x5,scalar),fp32_min_number(x6,scalar),fp32_min_number(x7,scalar),fp32_min_number(x8,scalar),fp32_min_number(x9,scalar),fp32_min_number(x10,scalar),fp32_min_number(x11,scalar),fp32_min_number(x12,scalar),fp32_min_number(x13,scalar),fp32_min_number(x14,scalar),fp32_min_number(x15,scalar)) && store(&(__return.s0),float,r0) * store(&(__return.s1),float,r1) * store(&(__return.s2),float,r2) * store(&(__return.s3),float,r3) * store(&(__return.s4),float,r4) * store(&(__return.s5),float,r5) * store(&(__return.s6),float,r6) * store(&(__return.s7),float,r7) * store(&(__return.s8),float,r8) * store(&(__return.s9),float,r9) * store(&(__return.s10),float,r10) * store(&(__return.s11),float,r11) * store(&(__return.s12),float,r12) * store(&(__return.s13),float,r13) * store(&(__return.s14),float,r14) * store(&(__return.s15),float,r15) */;
vfloat32m8_t __riscv_vfmax_vf_f32m8(vfloat32m8_t a,float scalar,size_t vl)
/*@ With (x0:fp32) (x1:fp32) (x2:fp32) (x3:fp32) (x4:fp32) (x5:fp32) (x6:fp32) (x7:fp32) (x8:fp32) (x9:fp32) (x10:fp32) (x11:fp32) (x12:fp32) (x13:fp32) (x14:fp32) (x15:fp32)
 Require 1<=vl && vl<=16 && store(&(a.s0),float,x0) * store(&(a.s1),float,x1) * store(&(a.s2),float,x2) * store(&(a.s3),float,x3) * store(&(a.s4),float,x4) * store(&(a.s5),float,x5) * store(&(a.s6),float,x6) * store(&(a.s7),float,x7) * store(&(a.s8),float,x8) * store(&(a.s9),float,x9) * store(&(a.s10),float,x10) * store(&(a.s11),float,x11) * store(&(a.s12),float,x12) * store(&(a.s13),float,x13) * store(&(a.s14),float,x14) * store(&(a.s15),float,x15)
 Ensure exists r0 r1 r2 r3 r4 r5 r6 r7 r8 r9 r10 r11 r12 r13 r14 r15, qc4_active16_f(vl,r0,r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,r11,r12,r13,r14,r15,fp32_max_number(x0,scalar),fp32_max_number(x1,scalar),fp32_max_number(x2,scalar),fp32_max_number(x3,scalar),fp32_max_number(x4,scalar),fp32_max_number(x5,scalar),fp32_max_number(x6,scalar),fp32_max_number(x7,scalar),fp32_max_number(x8,scalar),fp32_max_number(x9,scalar),fp32_max_number(x10,scalar),fp32_max_number(x11,scalar),fp32_max_number(x12,scalar),fp32_max_number(x13,scalar),fp32_max_number(x14,scalar),fp32_max_number(x15,scalar)) && store(&(__return.s0),float,r0) * store(&(__return.s1),float,r1) * store(&(__return.s2),float,r2) * store(&(__return.s3),float,r3) * store(&(__return.s4),float,r4) * store(&(__return.s5),float,r5) * store(&(__return.s6),float,r6) * store(&(__return.s7),float,r7) * store(&(__return.s8),float,r8) * store(&(__return.s9),float,r9) * store(&(__return.s10),float,r10) * store(&(__return.s11),float,r11) * store(&(__return.s12),float,r12) * store(&(__return.s13),float,r13) * store(&(__return.s14),float,r14) * store(&(__return.s15),float,r15) */;
vfloat32m8_t __riscv_vfmacc_vv_f32m8(vfloat32m8_t acc,vfloat32m8_t a,vfloat32m8_t b,size_t vl)
/*@ With (z0:fp32) (z1:fp32) (z2:fp32) (z3:fp32) (z4:fp32) (z5:fp32) (z6:fp32) (z7:fp32) (z8:fp32) (z9:fp32) (z10:fp32) (z11:fp32) (z12:fp32) (z13:fp32) (z14:fp32) (z15:fp32) (x0:fp32) (x1:fp32) (x2:fp32) (x3:fp32) (x4:fp32) (x5:fp32) (x6:fp32) (x7:fp32) (x8:fp32) (x9:fp32) (x10:fp32) (x11:fp32) (x12:fp32) (x13:fp32) (x14:fp32) (x15:fp32) (y0:fp32) (y1:fp32) (y2:fp32) (y3:fp32) (y4:fp32) (y5:fp32) (y6:fp32) (y7:fp32) (y8:fp32) (y9:fp32) (y10:fp32) (y11:fp32) (y12:fp32) (y13:fp32) (y14:fp32) (y15:fp32)
 Require 1<=vl && vl<=16 && store(&(acc.s0),float,z0) * store(&(acc.s1),float,z1) * store(&(acc.s2),float,z2) * store(&(acc.s3),float,z3) * store(&(acc.s4),float,z4) * store(&(acc.s5),float,z5) * store(&(acc.s6),float,z6) * store(&(acc.s7),float,z7) * store(&(acc.s8),float,z8) * store(&(acc.s9),float,z9) * store(&(acc.s10),float,z10) * store(&(acc.s11),float,z11) * store(&(acc.s12),float,z12) * store(&(acc.s13),float,z13) * store(&(acc.s14),float,z14) * store(&(acc.s15),float,z15) * store(&(a.s0),float,x0) * store(&(a.s1),float,x1) * store(&(a.s2),float,x2) * store(&(a.s3),float,x3) * store(&(a.s4),float,x4) * store(&(a.s5),float,x5) * store(&(a.s6),float,x6) * store(&(a.s7),float,x7) * store(&(a.s8),float,x8) * store(&(a.s9),float,x9) * store(&(a.s10),float,x10) * store(&(a.s11),float,x11) * store(&(a.s12),float,x12) * store(&(a.s13),float,x13) * store(&(a.s14),float,x14) * store(&(a.s15),float,x15) * store(&(b.s0),float,y0) * store(&(b.s1),float,y1) * store(&(b.s2),float,y2) * store(&(b.s3),float,y3) * store(&(b.s4),float,y4) * store(&(b.s5),float,y5) * store(&(b.s6),float,y6) * store(&(b.s7),float,y7) * store(&(b.s8),float,y8) * store(&(b.s9),float,y9) * store(&(b.s10),float,y10) * store(&(b.s11),float,y11) * store(&(b.s12),float,y12) * store(&(b.s13),float,y13) * store(&(b.s14),float,y14) * store(&(b.s15),float,y15)
 Ensure exists r0 r1 r2 r3 r4 r5 r6 r7 r8 r9 r10 r11 r12 r13 r14 r15, qc4_active16_f(vl,r0,r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,r11,r12,r13,r14,r15,fma_rne(x0,y0,z0),fma_rne(x1,y1,z1),fma_rne(x2,y2,z2),fma_rne(x3,y3,z3),fma_rne(x4,y4,z4),fma_rne(x5,y5,z5),fma_rne(x6,y6,z6),fma_rne(x7,y7,z7),fma_rne(x8,y8,z8),fma_rne(x9,y9,z9),fma_rne(x10,y10,z10),fma_rne(x11,y11,z11),fma_rne(x12,y12,z12),fma_rne(x13,y13,z13),fma_rne(x14,y14,z14),fma_rne(x15,y15,z15)) && store(&(__return.s0),float,r0) * store(&(__return.s1),float,r1) * store(&(__return.s2),float,r2) * store(&(__return.s3),float,r3) * store(&(__return.s4),float,r4) * store(&(__return.s5),float,r5) * store(&(__return.s6),float,r6) * store(&(__return.s7),float,r7) * store(&(__return.s8),float,r8) * store(&(__return.s9),float,r9) * store(&(__return.s10),float,r10) * store(&(__return.s11),float,r11) * store(&(__return.s12),float,r12) * store(&(__return.s13),float,r13) * store(&(__return.s14),float,r14) * store(&(__return.s15),float,r15) */;
vfloat32m8_t __riscv_vfmv_v_f_f32m8(float scalar,size_t vl)
/*@ Require 1<=vl && vl<=16 && emp
 Ensure exists r0 r1 r2 r3 r4 r5 r6 r7 r8 r9 r10 r11 r12 r13 r14 r15, qc4_active16_f(vl,r0,r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,r11,r12,r13,r14,r15,scalar,scalar,scalar,scalar,scalar,scalar,scalar,scalar,scalar,scalar,scalar,scalar,scalar,scalar,scalar,scalar) && store(&(__return.s0),float,r0) * store(&(__return.s1),float,r1) * store(&(__return.s2),float,r2) * store(&(__return.s3),float,r3) * store(&(__return.s4),float,r4) * store(&(__return.s5),float,r5) * store(&(__return.s6),float,r6) * store(&(__return.s7),float,r7) * store(&(__return.s8),float,r8) * store(&(__return.s9),float,r9) * store(&(__return.s10),float,r10) * store(&(__return.s11),float,r11) * store(&(__return.s12),float,r12) * store(&(__return.s13),float,r13) * store(&(__return.s14),float,r14) * store(&(__return.s15),float,r15) */;
vfloat32m8_t __riscv_vmerge_vvm_f32m8(vfloat32m8_t a,vfloat32m8_t b,vbool4_t m,size_t vl)
/*@ With (x0:fp32) (x1:fp32) (x2:fp32) (x3:fp32) (x4:fp32) (x5:fp32) (x6:fp32) (x7:fp32) (x8:fp32) (x9:fp32) (x10:fp32) (x11:fp32) (x12:fp32) (x13:fp32) (x14:fp32) (x15:fp32) (y0:fp32) (y1:fp32) (y2:fp32) (y3:fp32) (y4:fp32) (y5:fp32) (y6:fp32) (y7:fp32) (y8:fp32) (y9:fp32) (y10:fp32) (y11:fp32) (y12:fp32) (y13:fp32) (y14:fp32) (y15:fp32) (m0:Z) (m1:Z) (m2:Z) (m3:Z) (m4:Z) (m5:Z) (m6:Z) (m7:Z) (m8:Z) (m9:Z) (m10:Z) (m11:Z) (m12:Z) (m13:Z) (m14:Z) (m15:Z)
 Require 1<=vl && vl<=16 && store(&(a.s0),float,x0) * store(&(a.s1),float,x1) * store(&(a.s2),float,x2) * store(&(a.s3),float,x3) * store(&(a.s4),float,x4) * store(&(a.s5),float,x5) * store(&(a.s6),float,x6) * store(&(a.s7),float,x7) * store(&(a.s8),float,x8) * store(&(a.s9),float,x9) * store(&(a.s10),float,x10) * store(&(a.s11),float,x11) * store(&(a.s12),float,x12) * store(&(a.s13),float,x13) * store(&(a.s14),float,x14) * store(&(a.s15),float,x15) * store(&(b.s0),float,y0) * store(&(b.s1),float,y1) * store(&(b.s2),float,y2) * store(&(b.s3),float,y3) * store(&(b.s4),float,y4) * store(&(b.s5),float,y5) * store(&(b.s6),float,y6) * store(&(b.s7),float,y7) * store(&(b.s8),float,y8) * store(&(b.s9),float,y9) * store(&(b.s10),float,y10) * store(&(b.s11),float,y11) * store(&(b.s12),float,y12) * store(&(b.s13),float,y13) * store(&(b.s14),float,y14) * store(&(b.s15),float,y15) * store(&(m.s0),int,m0) * store(&(m.s1),int,m1) * store(&(m.s2),int,m2) * store(&(m.s3),int,m3) * store(&(m.s4),int,m4) * store(&(m.s5),int,m5) * store(&(m.s6),int,m6) * store(&(m.s7),int,m7) * store(&(m.s8),int,m8) * store(&(m.s9),int,m9) * store(&(m.s10),int,m10) * store(&(m.s11),int,m11) * store(&(m.s12),int,m12) * store(&(m.s13),int,m13) * store(&(m.s14),int,m14) * store(&(m.s15),int,m15)
 Ensure exists r0 r1 r2 r3 r4 r5 r6 r7 r8 r9 r10 r11 r12 r13 r14 r15, qc4_active16_f(vl,r0,r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,r11,r12,r13,r14,r15,qc4_merge(x0,y0,m0),qc4_merge(x1,y1,m1),qc4_merge(x2,y2,m2),qc4_merge(x3,y3,m3),qc4_merge(x4,y4,m4),qc4_merge(x5,y5,m5),qc4_merge(x6,y6,m6),qc4_merge(x7,y7,m7),qc4_merge(x8,y8,m8),qc4_merge(x9,y9,m9),qc4_merge(x10,y10,m10),qc4_merge(x11,y11,m11),qc4_merge(x12,y12,m12),qc4_merge(x13,y13,m13),qc4_merge(x14,y14,m14),qc4_merge(x15,y15,m15)) && store(&(__return.s0),float,r0) * store(&(__return.s1),float,r1) * store(&(__return.s2),float,r2) * store(&(__return.s3),float,r3) * store(&(__return.s4),float,r4) * store(&(__return.s5),float,r5) * store(&(__return.s6),float,r6) * store(&(__return.s7),float,r7) * store(&(__return.s8),float,r8) * store(&(__return.s9),float,r9) * store(&(__return.s10),float,r10) * store(&(__return.s11),float,r11) * store(&(__return.s12),float,r12) * store(&(__return.s13),float,r13) * store(&(__return.s14),float,r14) * store(&(__return.s15),float,r15) */;
vbool4_t qcp_nanmask(const vfloat32m8_t*a,const vfloat32m8_t*b,size_t vl)
/*@ With (x0:fp32) (x1:fp32) (x2:fp32) (x3:fp32) (x4:fp32) (x5:fp32) (x6:fp32) (x7:fp32) (x8:fp32) (x9:fp32) (x10:fp32) (x11:fp32) (x12:fp32) (x13:fp32) (x14:fp32) (x15:fp32)
 Require 1<=vl && vl<=16 && a==b && store(&(a->s0),float,x0) * store(&(a->s1),float,x1) * store(&(a->s2),float,x2) * store(&(a->s3),float,x3) * store(&(a->s4),float,x4) * store(&(a->s5),float,x5) * store(&(a->s6),float,x6) * store(&(a->s7),float,x7) * store(&(a->s8),float,x8) * store(&(a->s9),float,x9) * store(&(a->s10),float,x10) * store(&(a->s11),float,x11) * store(&(a->s12),float,x12) * store(&(a->s13),float,x13) * store(&(a->s14),float,x14) * store(&(a->s15),float,x15)
 Ensure exists r0 r1 r2 r3 r4 r5 r6 r7 r8 r9 r10 r11 r12 r13 r14 r15, qc4_active16_z(vl,r0,r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,r11,r12,r13,r14,r15,qc4_nan_flag(x0),qc4_nan_flag(x1),qc4_nan_flag(x2),qc4_nan_flag(x3),qc4_nan_flag(x4),qc4_nan_flag(x5),qc4_nan_flag(x6),qc4_nan_flag(x7),qc4_nan_flag(x8),qc4_nan_flag(x9),qc4_nan_flag(x10),qc4_nan_flag(x11),qc4_nan_flag(x12),qc4_nan_flag(x13),qc4_nan_flag(x14),qc4_nan_flag(x15)) && store(&(a->s0),float,x0) * store(&(a->s1),float,x1) * store(&(a->s2),float,x2) * store(&(a->s3),float,x3) * store(&(a->s4),float,x4) * store(&(a->s5),float,x5) * store(&(a->s6),float,x6) * store(&(a->s7),float,x7) * store(&(a->s8),float,x8) * store(&(a->s9),float,x9) * store(&(a->s10),float,x10) * store(&(a->s11),float,x11) * store(&(a->s12),float,x12) * store(&(a->s13),float,x13) * store(&(a->s14),float,x14) * store(&(a->s15),float,x15) * store(&(__return.s0),int,r0) * store(&(__return.s1),int,r1) * store(&(__return.s2),int,r2) * store(&(__return.s3),int,r3) * store(&(__return.s4),int,r4) * store(&(__return.s5),int,r5) * store(&(__return.s6),int,r6) * store(&(__return.s7),int,r7) * store(&(__return.s8),int,r8) * store(&(__return.s9),int,r9) * store(&(__return.s10),int,r10) * store(&(__return.s11),int,r11) * store(&(__return.s12),int,r12) * store(&(__return.s13),int,r13) * store(&(__return.s14),int,r14) * store(&(__return.s15),int,r15) */;
vint32m8_t __riscv_vle32_v_i32m8(const int*p,size_t vl)
/*@ With (K:Z) (wb:Z) (tile:Z) (j:Z) (Ps:list qc4_panel)
 Require 1<=vl && vl<=16 && 0<K && 0<=tile && tile<Zlength(Ps) && 0<=j && qc4_matrix_wf(K,Ps) && j+vl<=16 && p==wb+tile*panel_bytes(K)+4*j && qc4_packed(K,wb,Ps)
 Ensure exists r0 r1 r2 r3 r4 r5 r6 r7 r8 r9 r10 r11 r12 r13 r14 r15, qc4_active16_z(vl,r0,r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,r11,r12,r13,r14,r15,qc4_ks(tile,j+0,Ps),qc4_ks(tile,j+1,Ps),qc4_ks(tile,j+2,Ps),qc4_ks(tile,j+3,Ps),qc4_ks(tile,j+4,Ps),qc4_ks(tile,j+5,Ps),qc4_ks(tile,j+6,Ps),qc4_ks(tile,j+7,Ps),qc4_ks(tile,j+8,Ps),qc4_ks(tile,j+9,Ps),qc4_ks(tile,j+10,Ps),qc4_ks(tile,j+11,Ps),qc4_ks(tile,j+12,Ps),qc4_ks(tile,j+13,Ps),qc4_ks(tile,j+14,Ps),qc4_ks(tile,j+15,Ps)) && qc4_packed(K,wb,Ps) * store(&(__return.s0),int,r0) * store(&(__return.s1),int,r1) * store(&(__return.s2),int,r2) * store(&(__return.s3),int,r3) * store(&(__return.s4),int,r4) * store(&(__return.s5),int,r5) * store(&(__return.s6),int,r6) * store(&(__return.s7),int,r7) * store(&(__return.s8),int,r8) * store(&(__return.s9),int,r9) * store(&(__return.s10),int,r10) * store(&(__return.s11),int,r11) * store(&(__return.s12),int,r12) * store(&(__return.s13),int,r13) * store(&(__return.s14),int,r14) * store(&(__return.s15),int,r15) */;
vint8m2_t __riscv_vle8_v_i8m2(const int8_t*p,size_t vl)
/*@ With (K:Z) (wb:Z) (tile:Z) (j:Z) (Ps:list qc4_panel)
 Require 1<=vl && vl<=16 && 0<K && 0<=tile && tile<Zlength(Ps) && 0<=j && qc4_matrix_wf(K,Ps) && j+vl<=8*rounded_depth(K) && p==wb+tile*panel_bytes(K)+64+j && qc4_packed(K,wb,Ps)
 Ensure exists r0 r1 r2 r3 r4 r5 r6 r7 r8 r9 r10 r11 r12 r13 r14 r15, qc4_active16_z(vl,r0,r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,r11,r12,r13,r14,r15,qc4_zget(j+0,qc4_weights(qc4_panel_at(Ps,tile))),qc4_zget(j+1,qc4_weights(qc4_panel_at(Ps,tile))),qc4_zget(j+2,qc4_weights(qc4_panel_at(Ps,tile))),qc4_zget(j+3,qc4_weights(qc4_panel_at(Ps,tile))),qc4_zget(j+4,qc4_weights(qc4_panel_at(Ps,tile))),qc4_zget(j+5,qc4_weights(qc4_panel_at(Ps,tile))),qc4_zget(j+6,qc4_weights(qc4_panel_at(Ps,tile))),qc4_zget(j+7,qc4_weights(qc4_panel_at(Ps,tile))),qc4_zget(j+8,qc4_weights(qc4_panel_at(Ps,tile))),qc4_zget(j+9,qc4_weights(qc4_panel_at(Ps,tile))),qc4_zget(j+10,qc4_weights(qc4_panel_at(Ps,tile))),qc4_zget(j+11,qc4_weights(qc4_panel_at(Ps,tile))),qc4_zget(j+12,qc4_weights(qc4_panel_at(Ps,tile))),qc4_zget(j+13,qc4_weights(qc4_panel_at(Ps,tile))),qc4_zget(j+14,qc4_weights(qc4_panel_at(Ps,tile))),qc4_zget(j+15,qc4_weights(qc4_panel_at(Ps,tile)))) && qc4_packed(K,wb,Ps) * store(&(__return.s0),char,r0) * store(&(__return.s1),char,r1) * store(&(__return.s2),char,r2) * store(&(__return.s3),char,r3) * store(&(__return.s4),char,r4) * store(&(__return.s5),char,r5) * store(&(__return.s6),char,r6) * store(&(__return.s7),char,r7) * store(&(__return.s8),char,r8) * store(&(__return.s9),char,r9) * store(&(__return.s10),char,r10) * store(&(__return.s11),char,r11) * store(&(__return.s12),char,r12) * store(&(__return.s13),char,r13) * store(&(__return.s14),char,r14) * store(&(__return.s15),char,r15) */;
vfloat32m8_t __riscv_vle32_v_f32m8(const float*p,size_t vl)
/*@ With (K:Z) (wb:Z) (tile:Z) (j:Z) (kind:Z) (Ps:list qc4_panel)
 Require 1<=vl && vl<=16 && 0<K && 0<=tile && tile<Zlength(Ps) && 0<=j && qc4_matrix_wf(K,Ps) && 0<=kind && kind<=1 && j+vl<=16 && p==wb+tile*panel_bytes(K)+64+8*rounded_depth(K)+64*kind+4*j && qc4_packed(K,wb,Ps)
 Ensure exists r0 r1 r2 r3 r4 r5 r6 r7 r8 r9 r10 r11 r12 r13 r14 r15, qc4_active16_f(vl,r0,r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,r11,r12,r13,r14,r15,qc4_float_field(kind,tile,j+0,Ps),qc4_float_field(kind,tile,j+1,Ps),qc4_float_field(kind,tile,j+2,Ps),qc4_float_field(kind,tile,j+3,Ps),qc4_float_field(kind,tile,j+4,Ps),qc4_float_field(kind,tile,j+5,Ps),qc4_float_field(kind,tile,j+6,Ps),qc4_float_field(kind,tile,j+7,Ps),qc4_float_field(kind,tile,j+8,Ps),qc4_float_field(kind,tile,j+9,Ps),qc4_float_field(kind,tile,j+10,Ps),qc4_float_field(kind,tile,j+11,Ps),qc4_float_field(kind,tile,j+12,Ps),qc4_float_field(kind,tile,j+13,Ps),qc4_float_field(kind,tile,j+14,Ps),qc4_float_field(kind,tile,j+15,Ps)) && qc4_packed(K,wb,Ps) * store(&(__return.s0),float,r0) * store(&(__return.s1),float,r1) * store(&(__return.s2),float,r2) * store(&(__return.s3),float,r3) * store(&(__return.s4),float,r4) * store(&(__return.s5),float,r5) * store(&(__return.s6),float,r6) * store(&(__return.s7),float,r7) * store(&(__return.s8),float,r8) * store(&(__return.s9),float,r9) * store(&(__return.s10),float,r10) * store(&(__return.s11),float,r11) * store(&(__return.s12),float,r12) * store(&(__return.s13),float,r13) * store(&(__return.s14),float,r14) * store(&(__return.s15),float,r15) */;
size_t __riscv_vsetvl_e32m8(size_t n)
/*@ Require 1<=n && n<=16 && emp Ensure __return==n && emp */;
void qcp_store(float*p,const vfloat32m8_t*a,size_t vl)
/*@ With (base:Z) (N:Z) (done:Z) (L:list fp32) (x0:fp32) (x1:fp32) (x2:fp32) (x3:fp32) (x4:fp32) (x5:fp32) (x6:fp32) (x7:fp32) (x8:fp32) (x9:fp32) (x10:fp32) (x11:fp32) (x12:fp32) (x13:fp32) (x14:fp32) (x15:fp32)
 Require 1<=vl && vl<=16 && 0<=done && done+vl<=N && p==base+4*done && store(&(a->s0),float,x0) * store(&(a->s1),float,x1) * store(&(a->s2),float,x2) * store(&(a->s3),float,x3) * store(&(a->s4),float,x4) * store(&(a->s5),float,x5) * store(&(a->s6),float,x6) * store(&(a->s7),float,x7) * store(&(a->s8),float,x8) * store(&(a->s9),float,x9) * store(&(a->s10),float,x10) * store(&(a->s11),float,x11) * store(&(a->s12),float,x12) * store(&(a->s13),float,x13) * store(&(a->s14),float,x14) * store(&(a->s15),float,x15) * qc4_write_state(base,N,done,L)
 Ensure store(&(a->s0),float,x0) * store(&(a->s1),float,x1) * store(&(a->s2),float,x2) * store(&(a->s3),float,x3) * store(&(a->s4),float,x4) * store(&(a->s5),float,x5) * store(&(a->s6),float,x6) * store(&(a->s7),float,x7) * store(&(a->s8),float,x8) * store(&(a->s9),float,x9) * store(&(a->s10),float,x10) * store(&(a->s11),float,x11) * store(&(a->s12),float,x12) * store(&(a->s13),float,x13) * store(&(a->s14),float,x14) * store(&(a->s15),float,x15) * qc4_write_state(base,N,done+vl,qc4_fappend(L,sublist(0,vl,cons(x0,cons(x1,cons(x2,cons(x3,cons(x4,cons(x5,cons(x6,cons(x7,cons(x8,cons(x9,cons(x10,cons(x11,cons(x12,cons(x13,cons(x14,cons(x15,nil))))))))))))))))))) */;
void test_rvv(
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
  kc = round_up_po2(kc, 2);
  while (nc != 0) {
    // The weights are packed in fixed blocks of NR=16.
    // We limit vl to 16 to process exactly one block per iteration,
    // but we always advance the `w` pointer by the full block size (16 elements)
    // to skip any padding when nc < 16.
    size_t vl = __riscv_vsetvl_e32m8(nc < 16 ? nc : 16);
    vint32m8_t vksum = __riscv_vle32_v_i32m8((const int32_t*) w, vl);
    w = (const int32_t*) w + 16;
    int32_t zp0 = quantization_params[0].zero_point;
    vint32m8_t vacc = __riscv_vmul_vx_i32m8(vksum, zp0, vl);
    size_t k = kc;
    while (k > 0) {
      int16_t a_val0 = (int16_t) a0[0];
      int16_t a_val1 = (int16_t) a0[1];
      a0 += 2;
      vint8m2_t vb_c01 = __riscv_vle8_v_i8m2((const int8_t*) w, vl);
      w = (const int8_t*) w + 16;
      // Extract the two 4-bit weights.
      // Shifting left by 4 moves the lower 4 bits to the upper 4 bits.
      // Masking with 0xF0 keeps the upper 4 bits.
      // Both operations effectively multiply the 4-bit signed value by 16.
      vint8m2_t vb_c0 = __riscv_vsll_vx_i8m2(vb_c01, 4, vl);
      vint8m2_t vb_c1 = __riscv_vand_vx_i8m2(vb_c01, (int8_t) 0xF0, vl);
      // Sign-extend to 16-bit
      vint16m4_t vxb_c0 = __riscv_vsext_vf2_i16m4(vb_c0, vl);
      vint16m4_t vxb_c1 = __riscv_vsext_vf2_i16m4(vb_c1, vl);
      // Widening multiply-accumulate
      vacc = __riscv_vwmacc_vx_i32m8(vacc, a_val0, vxb_c0, vl);
      vacc = __riscv_vwmacc_vx_i32m8(vacc, a_val1, vxb_c1, vl);
      k -= 2;
    }
    // Shift right by 4 to compensate for the implicit *16 during extraction, then convert to float
    vacc = __riscv_vsra_vx_i32m8(vacc, 4, vl);
    vfloat32m8_t vout = __riscv_vfcvt_f_x_v_f32m8(vacc, vl);
    float input_scale0 = quantization_params[0].inv_scale;
    vout = __riscv_vfmul_vf_f32m8(vout, input_scale0, vl);
    vfloat32m8_t vfilter_output_scale = __riscv_vle32_v_f32m8((const float*) w, vl);
    w = (const float*) w + 16;
    vfloat32m8_t vbias = __riscv_vle32_v_f32m8((const float*) w, vl);
    w = (const float*) w + 16;
    // Fused multiply-add: vout = vbias + vout * vfilter_output_scale
    vout = __riscv_vfmacc_vv_f32m8(vbias, vout, vfilter_output_scale, vl);
    const float output_min = params->scalar.min;
    const float output_max = params->scalar.max;
    if (qcp_isnan(output_min) || qcp_isnan(output_max)) {
      vout = __riscv_vfmv_v_f_f32m8(qcp_nanf(), vl);
    } else {
      vbool4_t was_nan = qcp_nanmask(&(vout),&(vout),(vl));
      vout = __riscv_vfmax_vf_f32m8(vout, output_min, vl);
      vout = __riscv_vfmin_vf_f32m8(vout, output_max, vl);
      vfloat32m8_t nan_value = __riscv_vfmv_v_f_f32m8(qcp_nanf(), vl);
      vout = __riscv_vmerge_vvm_f32m8(vout, nan_value, was_nan, vl);
    }
    qcp_store((c0),&(vout),(vl));
    a0 = (const int8_t*) ((uintptr_t) a0 - kc);
    c0 = (float*) ((uintptr_t) c0 + cn_stride);
    nc -= vl;
  }
}
