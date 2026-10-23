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
/*@ include strategies "comparator.strategies" */
/*@ include strategies "wrapper.strategies" */
void test_neon(size_t batch,const float *input_a,const float *input_b,float *output,
 const struct xnn_f32_default_params *restrict params)
/*@ With (A:list fp32) (B:list fp32) (p:Z)
 Require 0<batch && batch<=9223372036854775788 && batch%4==0 &&
 input_a!=0 && input_b!=0 && output!=0 && params!=0 &&
 FloatArray::full(input_a,batch/2+3,A) * FloatArray::full(input_b,batch/2+3,B) *
 store(&(params->_),char,p) * FloatArray::undef_full(output,batch/2)
 Ensure FloatArray::full(input_a,batch/2+3,A) * FloatArray::full(input_b,batch/2+3,B) *
 store(&(params->_),char,p) * FloatArray::full(output,batch/2,vcmul_values(batch/4,A,B)) */;
void test_rvv(size_t batch,const float *input_a,const float *input_b,float *output,
 const struct xnn_f32_default_params *restrict params)
/*@ With (A:list fp32) (B:list fp32) (p:Z)
 Require 0<batch && batch<=9223372036854775788 && batch%4==0 &&
 input_a!=0 && input_b!=0 && output!=0 && params!=0 &&
 FloatArray::full(input_a,batch/2+3,A) * FloatArray::full(input_b,batch/2+3,B) *
 store(&(params->_),char,p) * FloatArray::undef_full(output,batch/2)
 Ensure FloatArray::full(input_a,batch/2+3,A) * FloatArray::full(input_b,batch/2+3,B) *
 store(&(params->_),char,p) * FloatArray::full(output,batch/2,vcmul_values(batch/4,A,B)) */;
int compare_outputs(size_t n, const float *left, const float *right)
/*@ With (L: list fp32) (R: list fp32)
    Require 0 < n && n <= 4611686018427387900 &&
            outputs_related(L,R) && FloatArray::full(left,n,L) * FloatArray::full(right,n,R)
    Ensure __return == 1 && FloatArray::full(left,n,L) * FloatArray::full(right,n,R) */;
int equivalent(size_t n,const float *input_a,const float *input_b,float *left,float *right,
 const struct xnn_f32_default_params *params)
/*@ With (A:list fp32) (B:list fp32) (p:Z)
 Require 0<n && n<=2305843009213693947 &&
 input_a!=0 && input_b!=0 && left!=0 && right!=0 && params!=0 &&
 FloatArray::full(input_a,2*n+3,A) * FloatArray::full(input_b,2*n+3,B) *
 store(&(params->_),char,p) * FloatArray::undef_full(left,2*n) * FloatArray::undef_full(right,2*n)
 Ensure exists (L:list fp32) (R:list fp32), __return==1 && outputs_related(L,R) &&
 FloatArray::full(input_a,2*n+3,A) * FloatArray::full(input_b,2*n+3,B) *
 store(&(params->_),char,p) * FloatArray::full(left,2*n,L) * FloatArray::full(right,2*n,R) */
{
 /*@ Assert 2*n == (n*sizeof(float))/2 && n == (n*sizeof(float))/4 && (n*sizeof(float))%4 == 0 &&
 0<n*sizeof(float) && n*sizeof(float)<=9223372036854775788 &&
 n==n@pre && input_a==input_a@pre && input_b==input_b@pre && left==left@pre && right==right@pre && params==params@pre &&
 0<n && n<=2305843009213693947 && input_a!=0 && input_b!=0 && left!=0 && right!=0 && params!=0 &&
 FloatArray::full(input_a,2*n+3,A) * FloatArray::full(input_b,2*n+3,B) * store(&(params->_),char,p) *
 FloatArray::undef_full(left,2*n) * FloatArray::undef_full(right,2*n) */
 test_neon(n*sizeof(float),input_a,input_b,left,params);
 test_rvv(n*sizeof(float),input_a,input_b,right,params);
 return compare_outputs(2*n,left,right);
}
