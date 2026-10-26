#ifndef EXP_SCALAR_H
#define EXP_SCALAR_H
#include "memory_specs.h"
/*@ Import Coq Require Import ExpMinusMax.MemoryInterface */
/*@ Extern Coq (em_distinct:list Z->Prop)(em_owned:list Z->Z->Prop)(em_removed:list Z->Z->list Z)(em_pop:EMMap->Z->EMMap) */
float em_read_scalar(const float*p)
/*@ With(F:EMMap)
 Require p!=0&&em_present(F,p)&&em_data(F)
 Ensure em_same(__return,em_get(F,p))&&em_data(F) */;
void em_write_scalar(float*p,float x)
/*@ With(W:list Z)(O:EMOutput)(X:fp32)
 Require p!=0&&em_distinct(W)&&em_owned(W,p)&&em_same(x,X)&&em_output(W,O)
 Ensure em_output(W,em_output_put(O,p,X)) */;
void em_assert(int condition)
/*@ Require condition!=0&&emp Ensure emp */;
#define assert(x) em_assert((x))
#endif
