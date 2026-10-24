#ifndef DWCONV_OUTPUT_READ_H
#define DWCONV_OUTPUT_READ_H
#include "types.h"
#include "memory.h"
/*@ Import Coq Require Import Dwconv.OutputReadModel */
/*@ Extern Coq (dw_initialized:DwOutput->Z->fp32->Prop) */
float dw_read_output(const float *p)
/*@ With (W:list Z) (O:DwOutput) (v:fp32)
 Require p!=0 && dw_distinct(W) && dw_owned(W,p) && dw_initialized(O,p,v) && dw_output(W,O)
 Ensure dw_same(__return,v) && dw_output(W,O) */;
#endif
