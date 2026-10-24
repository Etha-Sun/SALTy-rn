#ifndef DWCONV_READ_TABLE_H
#define DWCONV_READ_TABLE_H
/*@ Import Coq Require Import Dwconv.MemoryModel Dwconv.MemoryFacts */
/*@ Extern Coq (DwPtrMap :: *) */
/*@ Extern Coq (dw_ptr_present:DwPtrMap->Z->Prop) (dw_ptr_data:DwPtrMap->Assertion) (dw_ptr_get:DwPtrMap->Z->Z) (dw_ptr_pop:DwPtrMap->Z->DwPtrMap) */
const float* dw_read_table(const float** p)
/*@ With (P:DwPtrMap) Require p!=0 && dw_ptr_present(P,p) && dw_ptr_data(P)
 Ensure __return==dw_ptr_get(P,p) && dw_ptr_data(P) */;
#endif
