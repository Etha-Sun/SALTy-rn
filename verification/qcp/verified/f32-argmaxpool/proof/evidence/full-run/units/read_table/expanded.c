/*@ Import Coq Require Import ArgmaxPool.ProgramModel ArgmaxPool.MemoryFacts */
/*@ Extern Coq (APPtrMap :: *) */
/*@ Extern Coq (ap_ptr_present:APPtrMap->Z->Prop) (ap_ptr_data:APPtrMap->Assertion) (ap_ptr_get:APPtrMap->Z->Z) (ap_ptr_pop:APPtrMap->Z->APPtrMap) */
const float* ap_read_table(const float** p)
/*@ With (P:APPtrMap) Require p!=0 && ap_ptr_present(P,p) && ap_ptr_data(P)
 Ensure __return==ap_ptr_get(P,p) && ap_ptr_data(P) */;
const float* ap_read_table(const float** p)
/*@ With (P:APPtrMap) Require p!=0 && ap_ptr_present(P,p) && ap_ptr_data(P)
 Ensure __return==ap_ptr_get(P,p) && ap_ptr_data(P) */
{
  /*@ Assert p==p@pre && ap_ptr_present(P,p@pre) &&
       store(p@pre,void*,ap_ptr_get(P,p@pre)) * ap_ptr_data(ap_ptr_pop(P,p@pre)) */
  return *p;
}
