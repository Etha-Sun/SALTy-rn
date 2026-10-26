#ifndef ARGMAXPOOL_FORMAL_MODEL_H
#define ARGMAXPOOL_FORMAL_MODEL_H
typedef unsigned long long size_t;
typedef unsigned long long uintptr_t;
typedef unsigned int uint32_t;
/*@ Import Coq Require Import ArgmaxPool.Model ArgmaxPool.MemoryModel */
/*@ Extern Coq (APMap :: *) */
/*@ Extern Coq (ap_data:APMap->Assertion)
 (ap_get:APMap->Z->fp32) (ap_present:APMap->Z->Prop)
 (ap_window:APMap->Z->Z->Prop) (ap_load_lane:APMap->Z->Z->fp32)
 (ap_gt_mask:fp32->fp32->Z) (ap_bool_mask:Z->Prop)
 (ap_same_bits:fp32->fp32->Prop)
 (ap_u32:Z->Z) (ap_vl:Z->Z) (ap_add_u32:Z->Z->Z)
 (ap_select_f32:Z->fp32->fp32->fp32) (ap_select_u32:Z->Z->Z->Z)
 (PtrArray::full:Z->Z->list Z->Assertion)
 (FloatArray::full:Z->Z->list fp32->Assertion)
 (FloatArray::undef_full:Z->Z->Assertion)
 (UIntArray::full:Z->Z->list Z->Assertion)
 (UIntArray::undef_full:Z->Z->Assertion)
 (Znth:{A}->Z->list A->A->A) */
#endif
