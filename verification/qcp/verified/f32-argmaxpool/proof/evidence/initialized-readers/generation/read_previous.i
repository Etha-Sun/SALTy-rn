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
/*@ Import Coq Require Import ArgmaxPool.ReadPreviousModel */
/*@ Extern Coq (APOutput :: *) (APIndex :: *) */
/*@ Extern Coq (ap_distinct:list Z->Prop) (ap_owned:list Z->Z->Prop)
 (ap_removed:list Z->Z->list Z) (ap_output:list Z->APOutput->Assertion)
 (ap_index:list Z->APIndex->Assertion)
 (ap_float_initialized:APOutput->Z->fp32->Prop)
 (ap_uint_initialized:APIndex->Z->Z->Prop) */
float ap_read_previous_float(const float*p)
/*@ With (W:list Z) (O:APOutput) (v:fp32)
 Require p!=0 && ap_distinct(W) && ap_owned(W,p) && ap_float_initialized(O,p,v) && ap_output(W,O)
 Ensure ap_same_bits(__return,v) && ap_output(W,O) */;
uint32_t ap_read_previous_uint(const uint32_t*p)
/*@ With (W:list Z) (O:APIndex) (v:Z)
 Require p!=0 && ap_distinct(W) && ap_owned(W,p) && ap_uint_initialized(O,p,v) && ap_index(W,O)
 Ensure __return==v && ap_index(W,O) */;
float ap_read_previous_float(const float*p)
/*@ With (W:list Z) (O:APOutput) (v:fp32)
 Require p!=0 && ap_distinct(W) && ap_owned(W,p) && ap_float_initialized(O,p,v) && ap_output(W,O)
 Ensure ap_same_bits(__return,v) && ap_output(W,O) */
{
 /*@ Assert p!=0 && ap_distinct(W) && ap_owned(W,p) && ap_float_initialized(O,p,v) &&
 store(p,float,v) * ap_output(ap_removed(W,p),O) */
 return *p;
}
uint32_t ap_read_previous_uint(const uint32_t*p)
/*@ With (W:list Z) (O:APIndex) (v:Z)
 Require p!=0 && ap_distinct(W) && ap_owned(W,p) && ap_uint_initialized(O,p,v) && ap_index(W,O)
 Ensure __return==v && ap_index(W,O) */
{
 /*@ Assert p!=0 && ap_distinct(W) && ap_owned(W,p) && ap_uint_initialized(O,p,v) &&
 store(p,unsigned int,v) * ap_index(ap_removed(W,p),O) */
 return *p;
}
