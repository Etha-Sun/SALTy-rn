/*@ Import Coq Require Import Dwconv.MemoryInterface */
/*@ Extern Coq (DwROMap :: *) (DwPtrMap :: *) */
/*@ Extern Coq (dw_same:fp32->fp32->Prop) (dw_data:DwROMap->Assertion)
 (dw_get:DwROMap->Z->fp32) (dw_present:DwROMap->Z->Prop) (dw_pop:DwROMap->Z->DwROMap)
 (dw_ptr_data:DwPtrMap->Assertion) (dw_ptr_get:DwPtrMap->Z->Z)
 (dw_ptr_present:DwPtrMap->Z->Prop) (dw_ptr_pop:DwPtrMap->Z->DwPtrMap) */
/*@ include strategies "../proof/c/dw_maps.strategies" */
float dw_read_float_auto(const float* p)
/*@ With (F:DwROMap) Require p!=0 && dw_present(F,p) && dw_data(F)
 Ensure dw_same(__return,dw_get(F,p)) && dw_data(F) */
{return *p;}
const float* dw_read_table_auto(const float** p)
/*@ With (P:DwPtrMap) Require p!=0 && dw_ptr_present(P,p) && dw_ptr_data(P)
 Ensure __return==dw_ptr_get(P,p) && dw_ptr_data(P) */
{return *p;}
