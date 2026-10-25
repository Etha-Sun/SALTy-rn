#ifndef X32_OBSERVE_H
#define X32_OBSERVE_H
#include "formal_types.h"
/*@ Import Coq Require Import X32Transpose.ObservationModel */
/*@ Extern Coq (XTOutput :: *) */
/*@ Extern Coq (NoDup:list Z->Prop) (In:Z->list Z->Prop) (xt_output_rest:list Z->XTOutput->Z->Assertion) */
/*@ Extern Coq (xt_output:list Z->XTOutput->Assertion) (xt_output_exact:XTOutput->Z->Z->Prop) */
/*@ Extern Coq (xt_observation_address:Z->Z->Z->Z->Z) */
const uint32_t* xt_observe_pointer(const uint32_t*p,size_t stride,size_t row,size_t column)
/*@ Require emp Ensure __return==xt_observation_address(p,stride,row,column) && emp */;
uint32_t xt_read_output(const uint32_t*p)
/*@ With(W:list Z)(O:XTOutput)(x:Z)
 Require NoDup(W) && 0<p && In(p,W) && xt_output_exact(O,p,x) && xt_output(W,O)
 Ensure __return==x && xt_output(W,O) */;

#endif
