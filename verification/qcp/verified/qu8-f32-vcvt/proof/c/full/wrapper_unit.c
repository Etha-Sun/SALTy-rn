/* Public repaired NEON / compatible RVV unsigned-byte-to-float conversion.
 * n positive bytes, n+7 readable input bytes, two n-float output objects.
 * All int32 zero points and all binary32 scales are supported. Objects are
 * separate; parameters and input/padding are preserved. n*4 fits uint64.
 * C-shim partial correctness at the documented fixed ABI/RNE/VLEN settings.
 */
#ifdef QCP_FORMAL
#include "../../../shim/program_model.h"
#else
#include "../../../shim/runtime.h"
#endif
#include "../../../../../verified/f32-vadd/contracts/VaddWrapper/wrapper_def.h"
/*@ Import Coq Require Import Qu8Cvt.ProgramModel NanBridge.BridgeLogic */
/*@ Extern Coq (bit_same : fp32 -> fp32 -> Prop) (returned_one : Z -> Prop) */

/*@ include strategies "float_array.strategies" */
/*@ include strategies "comparator.strategies" */
/*@ include strategies "wrapper.strategies" */
void test_neon(size_t batch,const uint8_t *input,float *output,
 const struct xnn_qu8_f32_cvt_params *restrict params)
/*@ With (A:list Z) (RawZ:Z) (Scale:fp32)
 Require 0<batch && batch<=4611686018427387903 &&
 input!=0 && output!=0 && params!=0 &&
 UCharArray::full(input,batch+7,A) * FloatArray::undef_full(output,batch) *
 store(&(params->scalar.zero_point),int,RawZ) * store(&(params->scalar.scale),float,Scale)
 Ensure UCharArray::full(input,batch+7,A) * FloatArray::full(output,batch,cvt_values(batch,A,RawZ,Scale)) *
 store(&(params->scalar.zero_point),int,RawZ) * store(&(params->scalar.scale),float,Scale) */;

void test_rvv(size_t batch,const uint8_t *input,float *output,
 const struct xnn_qu8_f32_cvt_params *restrict params)
/*@ With (A:list Z) (RawZ:Z) (Scale:fp32)
 Require 0<batch && batch<=4611686018427387903 &&
 input!=0 && output!=0 && params!=0 &&
 UCharArray::full(input,batch+7,A) * FloatArray::undef_full(output,batch) *
 store(&(params->scalar.zero_point),int,RawZ) * store(&(params->scalar.scale),float,Scale)
 Ensure UCharArray::full(input,batch+7,A) * FloatArray::full(output,batch,cvt_values(batch,A,RawZ,Scale)) *
 store(&(params->scalar.zero_point),int,RawZ) * store(&(params->scalar.scale),float,Scale) */;

void qcp_vadd_read(const float *p,float *out,size_t n,size_t i)
/*@ With (L:list fp32)
 Require 0<n && 0<=i && i<n && FloatArray::full(p,n,L) * undef_data_at(out,float)
 Ensure FloatArray::seg(p,0,n,L) * store(out,float,L[i]) */
{ *out=p[i]; }

float preserve_float(float x)
/*@ Require emp Ensure bit_same(__return,x) && emp */
{ return x; }
int check_observation(float x,float y)
/*@ Require same_value(x,y) && emp Ensure returned_one(__return) && emp */
{
 float xc=preserve_float(x);
 float yc=preserve_float(y);
 if(x==y)return 1;
 if(x!=xc && y!=yc)return 1;
 return 0;
}
int same_lane(float x,float y)
/*@ Require same_value(x,y) && emp Ensure __return==1 && emp */
{ return check_observation(x,y); }

int compare_outputs(size_t n,const float *left,const float *right)
/*@ With (L:list fp32) (R:list fp32)
 Require 0<n && n<=4611686018427387903 && outputs_related(L,R) &&
 FloatArray::full(left,n,L) * FloatArray::full(right,n,R)
 Ensure __return==1 && FloatArray::full(left,n,L) * FloatArray::full(right,n,R) */
{
 size_t i=0;
 /*@ Inv n == n@pre && left == left@pre && right == right@pre &&
          0 < n && n <= 4611686018427387903 && 0 <= i && i <= n &&
          Zlength(L) == n && outputs_related(L,R) &&
          FloatArray::full(left,n,L) * FloatArray::full(right,n,R) */
 while(i<n){
  float x,y;
  qcp_vadd_read(left,&x,n,i);
  qcp_vadd_read(right,&y,n,i);
  if(!same_lane(x,y))return 0;
  i++;
 }
 return 1;
}
int equivalent(size_t n,const uint8_t *input,float *left,float *right,
 const struct xnn_qu8_f32_cvt_params *params)
/*@ With (A:list Z) (RawZ:Z) (Scale:fp32)
 Require 0<n && n<=4611686018427387903 &&
 input!=0 && left!=0 && right!=0 && params!=0 &&
 UCharArray::full(input,n+7,A) * FloatArray::undef_full(left,n) * FloatArray::undef_full(right,n) *
 store(&(params->scalar.zero_point),int,RawZ) * store(&(params->scalar.scale),float,Scale)
 Ensure exists (L:list fp32) (R:list fp32), __return==1 && outputs_related(L,R) &&
 UCharArray::full(input,n+7,A) * FloatArray::full(left,n,L) * FloatArray::full(right,n,R) *
 store(&(params->scalar.zero_point),int,RawZ) * store(&(params->scalar.scale),float,Scale) */
{
 test_neon(n,input,left,params);
 test_rvv(n,input,right,params);
 return compare_outputs(n,left,right);
}
