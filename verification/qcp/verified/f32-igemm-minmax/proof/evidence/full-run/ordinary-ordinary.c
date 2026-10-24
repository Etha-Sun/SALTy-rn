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
void qcp_assert(int condition) /*@ Require condition!=0 && emp Ensure emp */ { }
float qcp_identity(float x) /*@ Require emp Ensure bit_same(__return,x) && emp */ { return x; }
int qcp_isnan(float x) /*@ Require emp Ensure __return==rvv_nanth(x) && emp */ {
 float y=qcp_identity(x);
 if(x!=y) return 1;
 return 0;
}
