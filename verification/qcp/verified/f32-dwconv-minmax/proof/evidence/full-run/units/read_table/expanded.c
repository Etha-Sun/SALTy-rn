/*@ Import Coq Require Import Dwconv.MemoryModel Dwconv.MemoryFacts */
/*@ Extern Coq (DwPtrMap :: *) */
/*@ Extern Coq (dw_ptr_present:DwPtrMap->Z->Prop) (dw_ptr_data:DwPtrMap->Assertion) (dw_ptr_get:DwPtrMap->Z->Z) (dw_ptr_pop:DwPtrMap->Z->DwPtrMap) */
const float* dw_read_table(const float** p)
/*@ With (P:DwPtrMap) Require p!=0 && dw_ptr_present(P,p) && dw_ptr_data(P)
 Ensure __return==dw_ptr_get(P,p) && dw_ptr_data(P) */;
const float* dw_read_table(const float** p)
/*@ With (P:DwPtrMap) Require p!=0 && dw_ptr_present(P,p) && dw_ptr_data(P)
 Ensure __return==dw_ptr_get(P,p) && dw_ptr_data(P) */
{
  /*@ Assert p==p@pre && dw_ptr_present(P,p@pre) &&
       store(p@pre,void*,dw_ptr_get(P,p@pre)) * dw_ptr_data(dw_ptr_pop(P,p@pre)) */
  return *p;
}
