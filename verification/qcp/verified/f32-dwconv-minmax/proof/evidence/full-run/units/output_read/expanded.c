typedef unsigned long long size_t;
typedef unsigned long long uintptr_t;
typedef long long intptr_t;
struct scalar_bounds {float min;float max;};
struct xnn_f32_minmax_params {struct scalar_bounds scalar;};
typedef struct float32x4_t {float s0; float s1; float s2; float s3;} float32x4_t;
typedef struct float32x2_t {float s0; float s1;} float32x2_t;
typedef struct vfloat32m4_t {float s0; float s1; float s2; float s3; float s4; float s5; float s6; float s7; float s8; float s9; float s10; float s11; float s12; float s13; float s14; float s15;} vfloat32m4_t;
typedef struct vbool8_t {int s0; int s1; int s2; int s3; int s4; int s5; int s6; int s7; int s8; int s9; int s10; int s11; int s12; int s13; int s14; int s15;} vbool8_t;
/*@ Import Coq Require Import Dwconv.MemoryInterface */
/*@ Extern Coq (DwROMap :: *) (DwOutput :: *) */
/*@ Extern Coq (dw_same:fp32->fp32->Prop) (dw_data:DwROMap->Assertion)
 (dw_get:DwROMap->Z->fp32) (dw_present:DwROMap->Z->Prop)
 (dw_pop:DwROMap->Z->DwROMap) (dw_output:list Z->DwOutput->Assertion)
 (dw_distinct:list Z->Prop) (dw_owned:list Z->Z->Prop)
 (dw_removed:list Z->Z->list Z) (dw_at:DwOutput->Z->option fp32)
 (dw_output_cell:Z->option fp32->Assertion)
 (dw_output_put:DwOutput->Z->fp32->DwOutput) */
float dw_read_float(const float* p)
/*@ With (F:DwROMap) Require p!=0 && dw_present(F,p) && dw_data(F)
 Ensure dw_same(__return,dw_get(F,p)) && dw_data(F) */;
void dw_store_float(float* p,float v)
/*@ With (W:list Z) (O:DwOutput)
 Require p!=0 && dw_distinct(W) && dw_owned(W,p) && dw_output(W,O)
 Ensure dw_output(W,dw_output_put(O,p,v)) */;
/*@ Import Coq Require Import Dwconv.OutputReadModel */
/*@ Extern Coq (dw_initialized:DwOutput->Z->fp32->Prop) */
float dw_read_output(const float *p)
/*@ With (W:list Z) (O:DwOutput) (v:fp32)
 Require p!=0 && dw_distinct(W) && dw_owned(W,p) && dw_initialized(O,p,v) && dw_output(W,O)
 Ensure dw_same(__return,v) && dw_output(W,O) */;
float dw_read_output(const float *p)
/*@ With (W:list Z) (O:DwOutput) (v:fp32)
 Require p!=0 && dw_distinct(W) && dw_owned(W,p) && dw_initialized(O,p,v) && dw_output(W,O)
 Ensure dw_same(__return,v) && dw_output(W,O) */
{
  /*@ Assert p!=0 && dw_distinct(W) && dw_owned(W,p) && dw_initialized(O,p,v) &&
      store(p,float,v) * dw_output(dw_removed(W,p),O) */
  return *p;
}
