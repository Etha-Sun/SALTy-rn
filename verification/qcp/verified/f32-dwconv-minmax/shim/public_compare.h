#ifndef DWCONV_PUBLIC_COMPARE_H
#define DWCONV_PUBLIC_COMPARE_H
#include "written_read.h"
#include "observation.h"
/*@ Import Coq Require Import Dwconv.PublicModel */
/*@ Extern Coq (DwProgram :: *) */
/*@ Extern Coq (dw_channels:DwProgram->Z) (dw_width:DwProgram->Z)
 (dw_out:DwProgram->Z) (dw_out_increment:DwProgram->Z)
 (dw_rebase:DwProgram->Z->DwProgram) (dw_output_at:DwProgram->Z->Z)
 (dw_output_domain:list Z->DwProgram->Prop)
 (dw_observed_pair:DwOutput->DwOutput->Z->Z->Prop)
 (dw_pair_observed:DwProgram->Z->DwOutput->DwOutput->Prop) */
int compare_outputs(size_t channels,size_t output_width,const float *left,const float *right,size_t output_increment)
/*@ With (D:DwProgram) (out2:Z) (W1:list Z) (W2:list Z) (O1:DwOutput) (O2:DwOutput) Require channels==dw_channels(D) && output_width==dw_width(D) && output_increment==dw_out_increment(D) && 0<channels && 0<output_width && dw_distinct(W1) && dw_distinct(W2) && dw_output_domain(W1,D) && dw_output_domain(W2,dw_rebase(D,out2)) && dw_pair_observed(D,out2,O1,O2) && left==dw_out(D) && right==out2 && dw_output(W1,O1) * dw_output(W2,O2) Ensure __return==1 && dw_output(W1,O1) * dw_output(W2,O2) */;
#endif
