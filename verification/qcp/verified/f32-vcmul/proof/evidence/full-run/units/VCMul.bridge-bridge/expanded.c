/* Original planar complex multiplication, full binary32 input domain.
 * n>0; each input stores real[0..n), imag[n..2n), then three readable pads.
 * Two disjoint outputs each have 2*n writable floats. All arrays and readable
 * params are separate objects. LP64/little-endian/binary32 RNE.
 * Requested observation: numerical equality or both NaN for ALL 2*n outputs.
 * Arithmetic is separately rounded mul then add/sub; no implicit FMA.
 * This review target is not an already completed kernel proof.
 */
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
/*@ Import Coq Require Import QcpVadd.VaddBits */
/*@ Extern Coq (FloatArray::full : Z -> Z -> list fp32 -> Assertion)
               (FloatArray::seg : Z -> Z -> Z -> list fp32 -> Assertion)
               (FloatArray::missing_i : Z -> Z -> Z -> Z -> list fp32 -> Assertion)
               (fp32_bits_equal : fp32 -> fp32 -> Prop) */
/*@ Import Coq Require Import VaddComparator.ComparatorLogic */
/*@ Extern Coq (outputs_related : list fp32 -> list fp32 -> Prop)
               (same_value : fp32 -> fp32 -> Prop) */
/*@ Extern Coq (FloatArray::undef_full : Z -> Z -> Assertion) */
/*@ Import Coq Require Import VaddWrapper.WrapperLogic */
/*@ Import Coq Require Import VCMul.ComplexModel NanBridge.BridgeLogic */
/*@ Extern Coq (vcmul_values : Z -> list fp32 -> list fp32 -> list fp32)
 (bit_same : fp32 -> fp32 -> Prop) (returned_one : Z -> Prop) */
float preserve_float(float x)
/*@ Require emp Ensure bit_same(__return,x) && emp */
{ return x; }
int check_observation(float x,float y)
/*@ Require same_value(x,y) && emp Ensure returned_one(__return) && emp */
{
  float xc=preserve_float(x);
  float yc=preserve_float(y);
  if(x==y) return 1;
  if(x!=xc && y!=yc) return 1;
  return 0;
}
int same_lane(float x,float y)
/*@ Require same_value(x,y) && emp Ensure __return == 1 && emp */
{ return check_observation(x,y); }
