#ifndef X32_PACKW_OBSERVE_H
#define X32_PACKW_OBSERVE_H
#include "scalar_memory.h"
/*@ Import Coq Require Import X32Packw.ObservationModel */
/*@ Extern Coq (PWCall :: *) */
/*@ Extern Coq (pw_exact:PWOutput->Z->Z->Prop) (pw_observation:PWMap->PWCall->PWOutput->Z->Z->Prop) */
uint32_t pw_read_output(const uint32_t*p)
/*@ With(W:list Z)(O:PWOutput)(x:Z)
 Require p>0 && NoDup(W) && In(p,W) && pw_exact(O,p,x) && pw_output(W,O)
 Ensure __return==x && pw_output(W,O) */;
#endif
