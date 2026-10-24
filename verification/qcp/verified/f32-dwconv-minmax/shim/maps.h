#ifndef DWCONV_MAPS_H
#define DWCONV_MAPS_H
/*@ Import Coq Require Import Dwconv.MemoryInterface */
/*@ Extern Coq (DwROMap :: *) (DwPtrMap :: *) */
/*@ Extern Coq (dw_same:fp32->fp32->Prop) (dw_data:DwROMap->Assertion)
 (dw_get:DwROMap->Z->fp32) (dw_present:DwROMap->Z->Prop) (dw_pop:DwROMap->Z->DwROMap)
 (dw_ptr_data:DwPtrMap->Assertion) (dw_ptr_get:DwPtrMap->Z->Z)
 (dw_ptr_present:DwPtrMap->Z->Prop) (dw_ptr_pop:DwPtrMap->Z->DwPtrMap) */
/*@ include strategies "../proof/c/dw_maps.strategies" */
#endif
