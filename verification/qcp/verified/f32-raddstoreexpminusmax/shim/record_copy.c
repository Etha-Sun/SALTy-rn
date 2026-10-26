#include "types_def.h"
float32x4_t em_copy4(const float32x4_t*p)
/*@ With(A:Recordfloat32x4_t)
 Require StructPredfloat32x4_t(p,A)
 Ensure StructPredfloat32x4_t(p,A)*StructPredfloat32x4_t(&__return,A) */
{float32x4_t a=*p;return a;}
vfloat32m4_t em_copy16(const vfloat32m4_t*p)
/*@ With(A:Recordvfloat32m4_t)
 Require StructPredvfloat32m4_t(p,A)
 Ensure StructPredvfloat32m4_t(p,A)*StructPredvfloat32m4_t(&__return,A) */
{vfloat32m4_t a=*p;return a;}
