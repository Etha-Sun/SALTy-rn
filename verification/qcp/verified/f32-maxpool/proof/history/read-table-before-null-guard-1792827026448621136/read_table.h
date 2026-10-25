#ifndef MAXPOOL_READ_TABLE_H
#define MAXPOOL_READ_TABLE_H
/*@ Import Coq Require Import MaxPool.MemoryModel */
/*@ Extern Coq (MPPtrMap :: *) */
/*@ Extern Coq (mp_ptr_present:MPPtrMap->Z->Prop) (mp_ptr_data:MPPtrMap->Assertion) (mp_ptr_get:MPPtrMap->Z->Z) (mp_ptr_pop:MPPtrMap->Z->MPPtrMap) */
const float* mp_read_table(const float** p)
/*@ With (P:MPPtrMap) Require mp_ptr_present(P,p) && mp_ptr_data(P)
 Ensure __return==mp_ptr_get(P,p) && mp_ptr_data(P) */;
#endif
