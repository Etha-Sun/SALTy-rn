/* Partial correctness of the repaired C pair. Observed output equality is
 * numeric equality or both NaN. NaN payload/sign and FP flags are unobserved.
 * n>0, n+3 readable inputs, n writable outputs, separate readable params;
 * binary32/RNE, LP64/little-endian, RVV VLEN128/SEW32/LMUL8, VLMAX32.
 * Complete QCP verification is pending; see proof status records.
 */
/* Fixed scalar-field representation, VLEN=128/SEW=32/LMUL=8, VLMAX=32. */
/*@ Import Coq Require Import FMin.Types */
typedef unsigned long long size_t;
typedef unsigned int uint32_t;
struct xnn_f32_default_params { char _; };
typedef struct float32x4_t { float s0; float s1; float s2; float s3; } float32x4_t;
typedef struct float32x2_t { float s0; float s1; } float32x2_t;
typedef struct vfloat32m8_t { float s0; float s1; float s2; float s3; float s4; float s5; float s6; float s7; float s8; float s9; float s10; float s11; float s12; float s13; float s14; float s15; float s16; float s17; float s18; float s19; float s20; float s21; float s22; float s23; float s24; float s25; float s26; float s27; float s28; float s29; float s30; float s31; } vfloat32m8_t;
typedef struct vbool4_t { int s0; int s1; int s2; int s3; int s4; int s5; int s6; int s7; int s8; int s9; int s10; int s11; int s12; int s13; int s14; int s15; int s16; int s17; int s18; int s19; int s20; int s21; int s22; int s23; int s24; int s25; int s26; int s27; int s28; int s29; int s30; int s31; } vbool4_t;
/*@ Import Coq Require Import QcpVadd.VaddBits */
/*@ Extern Coq (FloatArray::full : Z -> Z -> list fp32 -> Assertion)
               (FloatArray::seg : Z -> Z -> Z -> list fp32 -> Assertion)
               (FloatArray::missing_i : Z -> Z -> Z -> Z -> list fp32 -> Assertion)
               (fp32_bits_equal : fp32 -> fp32 -> Prop) */
/*@ Import Coq Require Import QcpVadd.VaddBits */
/*@ Extern Coq (FloatArray::full : Z -> Z -> list fp32 -> Assertion)
               (FloatArray::seg : Z -> Z -> Z -> list fp32 -> Assertion)
               (FloatArray::missing_i : Z -> Z -> Z -> Z -> list fp32 -> Assertion)
               (fp32_bits_equal : fp32 -> fp32 -> Prop) */
/*@ Import Coq Require Import VaddComparator.ComparatorLogic */
/*@ Extern Coq (outputs_related : list fp32 -> list fp32 -> Prop)
               (same_value : fp32 -> fp32 -> Prop) */
/*@ Import Coq Require Import FMin.ProgramModel */
/*@ Extern Coq (mm_arm_values : Z -> list fp32 -> list fp32 -> list fp32)
               (mm_rvv_values : Z -> list fp32 -> list fp32 -> list fp32) */
/*@ Import Coq Require Import NanBridge.BridgeLogic */
/*@ Extern Coq (bit_same : fp32 -> fp32 -> Prop)
               (returned_one : Z -> Prop) */
/*@ Extern Coq (FloatArray::undef_full : Z -> Z -> Assertion) */
/*@ include strategies "float_array.strategies" */
/*@ include strategies "comparator.strategies" */
/*@ include strategies "wrapper.strategies" */
void test_neon(size_t batch, const float *input_a, const float *input_b,
               float *output, const struct xnn_f32_default_params *params)
/*@ With (A: list fp32) (B: list fp32)
    Require 0 < batch && batch <= 18446744073709551603 && batch % 4 == 0 && params != 0 &&
            input_a != 0 && input_b != 0 && output != 0 &&
            FloatArray::full(input_a,batch/4+3,A) *
            FloatArray::full(input_b,batch/4+3,B) * FloatArray::undef_full(output,batch/4)
    Ensure FloatArray::full(input_a,batch/4+3,A) *
           FloatArray::full(input_b,batch/4+3,B) *
           FloatArray::full(output,batch/4,mm_arm_values(batch/4,A,B)) */;
void test_rvv(size_t batch, const float *input_a, const float *input_b,
               float *output, const struct xnn_f32_default_params *params)
/*@ With (A: list fp32) (B: list fp32)
    Require 0 < batch && batch <= 18446744073709551603 && batch % 4 == 0 && params != 0 &&
            input_a != 0 && input_b != 0 && output != 0 &&
            FloatArray::full(input_a,batch/4+3,A) *
            FloatArray::full(input_b,batch/4+3,B) * FloatArray::undef_full(output,batch/4)
    Ensure FloatArray::full(input_a,batch/4+3,A) *
           FloatArray::full(input_b,batch/4+3,B) *
           FloatArray::full(output,batch/4,mm_rvv_values(batch/4,A,B)) */;
void qcp_fmin_read(const float *p, float *out, size_t n, size_t i)
/*@ With (L: list fp32)
    Require 0 < n && 0 <= i && i < n && FloatArray::full(p,n,L) * undef_data_at(out,float)
    Ensure FloatArray::seg(p,0,n,L) * store(out,float,L[i]) */
{ *out = p[i]; }
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
int compare_outputs(size_t n, const float *left, const float *right)
/*@ With (L: list fp32) (R: list fp32)
    Require 0 < n && n <= 4611686018427387900 &&
            outputs_related(L,R) && FloatArray::full(left,n,L) * FloatArray::full(right,n,R)
    Ensure __return == 1 && FloatArray::full(left,n,L) * FloatArray::full(right,n,R) */
{
  size_t i = 0;
  /*@ Inv n == n@pre && left == left@pre && right == right@pre &&
          0 < n && n <= 4611686018427387900 && 0 <= i && i <= n &&
          Zlength(L) == n && outputs_related(L,R) &&
          FloatArray::full(left,n,L) * FloatArray::full(right,n,R) */
  while (i < n) {
    float x;
    float y;
    qcp_fmin_read(left,&x,n,i);
    qcp_fmin_read(right,&y,n,i);
    if (!same_lane(x,y)) return 0;
    i++;
  }
  return 1;
}
int equivalent(size_t n, const float *input_a, const float *input_b,
               float *left, float *right,
               const struct xnn_f32_default_params *params)
/*@ With (A: list fp32) (B: list fp32) (pv:Z)
    Require 0 < n && n <= 4611686018427387900 && params != 0 &&
            input_a != 0 && input_b != 0 && left != 0 && right != 0 &&
            store(&(params->_),char,pv) *
            FloatArray::full(input_a,n+3,A) * FloatArray::full(input_b,n+3,B) *
            FloatArray::undef_full(left,n) * FloatArray::undef_full(right,n)
    Ensure exists (L: list fp32) (R: list fp32), __return == 1 && outputs_related(L,R) &&
           store(&(params->_),char,pv) *
           FloatArray::full(input_a,n+3,A) * FloatArray::full(input_b,n+3,B) *
           FloatArray::full(left,n,L) * FloatArray::full(right,n,R) */
{
  /*@ Assert n == (4*n)/4 && (4*n)%4 == 0 &&
 0 < 4*n && 4*n <= 18446744073709551603 && params != 0 &&
 n == n@pre && input_a == input_a@pre && input_b == input_b@pre &&
 left == left@pre && right == right@pre && params == params@pre &&
 0 < n && n <= 4611686018427387900 &&
 input_a != 0 && input_b != 0 && left != 0 && right != 0 &&
 store(&(params->_),char,pv) * FloatArray::full(input_a,n+3,A) *
 FloatArray::full(input_b,n+3,B) * FloatArray::undef_full(left,n) * FloatArray::undef_full(right,n) */
  test_neon(4*n, input_a, input_b, left, params);
  test_rvv(4*n, input_a, input_b, right, params);
  /*@ Assert n == n@pre && input_a == input_a@pre && input_b == input_b@pre &&
 left == left@pre && right == right@pre && params == params@pre &&
 0 < n && n <= 4611686018427387900 &&
 outputs_related(mm_arm_values(n,A,B),mm_rvv_values(n,A,B)) &&
 store(&(params->_),char,pv) * FloatArray::full(input_a,n+3,A) *
 FloatArray::full(input_b,n+3,B) * FloatArray::full(left,n,mm_arm_values(n,A,B)) *
 FloatArray::full(right,n,mm_rvv_values(n,A,B)) */
  return compare_outputs(n, left, right);
}
