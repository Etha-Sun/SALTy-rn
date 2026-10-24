#ifndef DWCONV_WRITTEN_READ_H
#define DWCONV_WRITTEN_READ_H
#include "output_read.h"
/*@ Import Coq Require Import Dwconv.WrittenReadModel */
/*@ Extern Coq (dw_output_ready:DwOutput->Z->Prop) */
float dw_read_written(const float *p)
/*@ With (W:list Z) (O:DwOutput)
 Require p!=0 && dw_distinct(W) && dw_owned(W,p) && dw_output_ready(O,p) && dw_output(W,O)
 Ensure dw_initialized(O,p,__return) && dw_output(W,O) */;
#endif
