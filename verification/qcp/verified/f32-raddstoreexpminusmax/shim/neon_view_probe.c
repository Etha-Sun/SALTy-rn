#include "memory_specs.h"
float32x4_t em_view_probe(float x)
/*@ Require emp Ensure exists (A:Recordfloat32x4_t),StructPredfloat32x4_t(&__return,A) */
{float32x4_t a=vmovq_n_f32(x) /*@ where X=x */;float32x4_t b=vmovq_n_f32(x) /*@ where X=x */;float32x4_t c=vsubq_f32(a,b);return c;}
