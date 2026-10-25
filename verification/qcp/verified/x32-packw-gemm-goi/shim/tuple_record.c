#include "tuple_types.h"
uint32x2x2_t pw_record_copy(const uint32x2x2_t*p)
/*@ With (V:Recorduint32x2x2_t) Require StructPreduint32x2x2_t(p,V) Ensure StructPreduint32x2x2_t(p,V) * StructPreduint32x2x2_t(&__return,V) */
{uint32x2x2_t v=*p;return v;}
