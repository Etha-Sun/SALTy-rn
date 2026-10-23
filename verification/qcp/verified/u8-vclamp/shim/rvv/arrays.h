/*@ Import Coq Require Import FullU8.U8Logic FullU8.U8KernelLogic */
/*@ Extern Coq (UCharArray::full:Z->Z->list Z->Assertion) (UCharArray::seg:Z->Z->Z->list Z->Assertion)
 (UCharArray::undef_full:Z->Z->Assertion) (UCharArray::undef_seg:Z->Z->Z->Assertion)
 (u8_prefix_n:Z->Z) (u8_prefix_list:Z->Z->list Z->list Z) (u8_suffix_list:Z->Z->list Z->list Z)
 (u8_phase_all:Z->Z->Z->list Z->list Z) (u8_bound:Z->Z) */
/*@ include strategies "arrays.strategies" */
