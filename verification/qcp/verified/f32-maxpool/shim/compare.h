#ifndef MAXPOOL_COMPARE_H
#define MAXPOOL_COMPARE_H
/*@ Import Coq Require Import MaxPool.CompareModel */
/*@ Extern Coq (MPOutput :: *) */
/*@ Extern Coq (mp_out: list Z->MPOutput->Assertion) (mp_out_known:MPOutput->Z->fp32->Prop) (mp_write_window:list Z->Z->Z->Prop) (mp_word_equal:Z->Z->Z) (bits_of_fp32:fp32->Z) */
unsigned int mp_output_bits_at(const float*p)
/*@ With (W:list Z) (O:MPOutput) (v:fp32)
 Require p!=0 && mp_write_window(W,p,4) && mp_out_known(O,p,v) && mp_out(W,O)
 Ensure __return==bits_of_fp32(v) && mp_out(W,O) */;
int mp_same_output_at(const float*a,const float*b)
/*@ With (W1:list Z) (W2:list Z) (O1:MPOutput) (O2:MPOutput) (v1:fp32) (v2:fp32)
 Require a!=0 && b!=0 && mp_write_window(W1,a,4) && mp_write_window(W2,b,4) && mp_out_known(O1,a,v1) && mp_out_known(O2,b,v2) && mp_out(W1,O1) * mp_out(W2,O2)
 Ensure __return==mp_word_equal(bits_of_fp32(v1),bits_of_fp32(v2)) && mp_out(W1,O1) * mp_out(W2,O2) */;
#endif
