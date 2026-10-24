#include "intrinsics.h"
/*@ include strategies "sqrt_store.strategies" */
/*@ include strategies "rvv_store.strategies" */
void qcp_sqrt_store4(float* p,const float32x4_t* a)
/*@ With (x0:fp32) (x1:fp32) (x2:fp32) (x3:fp32) Require store(&(a->s0),float,x0) * store(&(a->s1),float,x1) * store(&(a->s2),float,x2) * store(&(a->s3),float,x3) * FloatArray::undef_full(p,4) Ensure store(&(a->s0),float,x0) * store(&(a->s1),float,x1) * store(&(a->s2),float,x2) * store(&(a->s3),float,x3) * FloatArray::full(p,4,sqrt_pack4(x0,x1,x2,x3)) */
{ p[0]=a->s0; p[1]=a->s1; p[2]=a->s2; p[3]=a->s3; }
void qcp_sqrt_store2(float* p,const float32x2_t* a)
/*@ With (x0:fp32) (x1:fp32) Require store(&(a->s0),float,x0) * store(&(a->s1),float,x1) * FloatArray::undef_full(p,2) Ensure store(&(a->s0),float,x0) * store(&(a->s1),float,x1) * FloatArray::full(p,2,sqrt_pack2(x0,x1)) */
{ p[0]=a->s0; p[1]=a->s1; }
void qcp_sqrt_store1_0(float* p,const float32x2_t* a)
/*@ With (x0:fp32) (x1:fp32) Require store(&(a->s0),float,x0) * store(&(a->s1),float,x1) * FloatArray::undef_full(p,1) Ensure store(&(a->s0),float,x0) * store(&(a->s1),float,x1) * FloatArray::full(p,1,sqrt_pack1(x0)) */
{ p[0]=a->s0; }
