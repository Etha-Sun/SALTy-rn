#ifndef X32_PACKW_RVV_HEADER_H
#define X32_PACKW_RVV_HEADER_H
#include "scalar_memory.h"
#ifndef QCP_NATIVE
#include "rvv_m1_specs.h"
/*@ Import Coq Require Import X32Packw.TileAccessModel */
/*@ Extern Coq (pw_header_pre:PWMap->list Z->Z->Z->Z->Prop) (pw_header_run:PWMap->Z->Z->Z->PWOutput->PWOutput) */
#endif
void pw_rvv_header(const uint32_t*b,uint32_t*p,size_t count)
/*@ With(F:PWMap)(W:list Z)(O:PWOutput) Require pw_header_pre(F,W,b,p,count) && pw_data(F) * pw_output(W,O) Ensure pw_data(F) * pw_output(W,pw_header_run(F,b,p,count,O)) */;
#endif
