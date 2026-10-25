/*@ Import Coq Require Import MaxPool.MemoryModel */
/*@ Extern Coq (MPPtrMap :: *) */
/*@ Extern Coq (mp_ptr_present:MPPtrMap->Z->Prop) (mp_ptr_data:MPPtrMap->Assertion) (mp_ptr_get:MPPtrMap->Z->Z) (mp_ptr_pop:MPPtrMap->Z->MPPtrMap) */
const float* mp_read_table(const float** p)
/*@ With (P:MPPtrMap) Require p!=0 && mp_ptr_present(P,p) && mp_ptr_data(P)
 Ensure __return==mp_ptr_get(P,p) && mp_ptr_data(P) */;
const float* mp_read_table(const float** p)
/*@ With (P:MPPtrMap) Require p!=0 && mp_ptr_present(P,p) && mp_ptr_data(P)
 Ensure __return==mp_ptr_get(P,p) && mp_ptr_data(P) */
{
  /*@ Assert p==p@pre && mp_ptr_present(P,p@pre) &&
       store(p@pre,void*,mp_ptr_get(P,p@pre)) * mp_ptr_data(mp_ptr_pop(P,p@pre)) */
  return *p;
}
