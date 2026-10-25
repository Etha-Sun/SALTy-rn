#ifndef X32_PACKW_NEON_ODD_H
#define X32_PACKW_NEON_ODD_H
#include "scalar_memory.h"
/*@ Import Coq Require Import X32Packw.AccessModel */
/*@ Extern Coq (pw_odd_pre:PWMap->list Z->Z->Z->Z->Prop) (pw_odd_run:Z->PWMap->Z->Z->PWOutput->PWOutput) (pw_offset:Z->Z->Z) */
void pw_neon_odd(size_t kc,const uint32_t*a,uint32_t*p)
/*@ With(F:PWMap)(W:list Z)(O:PWOutput)
 Require pw_map_nodup(F) && pw_odd_pre(F,W,a,p,kc) && pw_data(F) * pw_output(W,O)
 Ensure pw_data(F) * pw_output(W,pw_odd_run(kc,F,a,p,O)) */;
#endif
