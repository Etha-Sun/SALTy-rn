#ifndef ARGMAXPOOL_READ_PREVIOUS_H
#define ARGMAXPOOL_READ_PREVIOUS_H
/*@ Import Coq Require Import ArgmaxPool.ReadPreviousModel */
/*@ Extern Coq (APOutput :: *) (APIndex :: *) */
/*@ Extern Coq (ap_distinct:list Z->Prop) (ap_owned:list Z->Z->Prop)
 (ap_removed:list Z->Z->list Z) (ap_output:list Z->APOutput->Assertion)
 (ap_index:list Z->APIndex->Assertion)
 (ap_float_initialized:APOutput->Z->fp32->Prop)
 (ap_uint_initialized:APIndex->Z->Z->Prop) */
float ap_read_previous_float(const float*p)
/*@ With (W:list Z) (O:APOutput) (v:fp32)
 Require p!=0 && ap_distinct(W) && ap_owned(W,p) && ap_float_initialized(O,p,v) && ap_output(W,O)
 Ensure ap_same_bits(__return,v) && ap_output(W,O) */;
uint32_t ap_read_previous_uint(const uint32_t*p)
/*@ With (W:list Z) (O:APIndex) (v:Z)
 Require p!=0 && ap_distinct(W) && ap_owned(W,p) && ap_uint_initialized(O,p,v) && ap_index(W,O)
 Ensure __return==v && ap_index(W,O) */;
#endif
