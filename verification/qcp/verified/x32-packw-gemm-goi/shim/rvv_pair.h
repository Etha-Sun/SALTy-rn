#ifndef X32_PACKW_RVV_PAIR_H
#define X32_PACKW_RVV_PAIR_H
#include "rvv_store_pair.h"
#ifndef QCP_NATIVE
/*@ Extern Coq (pw_pair_pre:PWMap->list Z->Z->Z->Z->Z->Prop) (pw_pair_run:Z->PWMap->Z->Z->Z->PWOutput->PWOutput) (pw_offset:Z->Z->Z) */
#endif
void pw_rvv_pair(size_t kc,const uint32_t*a,const uint32_t*b,uint32_t*p)
/*@ With(F:PWMap)(W:list Z)(O:PWOutput) Require pw_pair_pre(F,W,a,b,p,kc) && pw_data(F) * pw_output(W,O) Ensure pw_data(F) * pw_output(W,pw_pair_run(kc,F,a,b,p,O)) */;
#endif
