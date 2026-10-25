typedef signed char int8_t;
typedef unsigned char uint8_t;
typedef int int32_t;
typedef unsigned int uint32_t;
typedef unsigned long long size_t;
typedef unsigned long long uintptr_t;
typedef uint8_t vbool16_t;
struct xnn_f32_minmax_params {struct {float min,max;}scalar;};
typedef struct float32x2_t {
 float s0;
 float s1;
} float32x2_t;
typedef struct float32x4_t {
 float s0;
 float s1;
 float s2;
 float s3;
} float32x4_t;
typedef struct uint32x4_t {
 uint32_t s0;
 uint32_t s1;
 uint32_t s2;
 uint32_t s3;
} uint32x4_t;
typedef struct vfloat32m2_t {
 float s0;
 float s1;
 float s2;
 float s3;
 float s4;
 float s5;
 float s6;
 float s7;
} vfloat32m2_t;
/*@ Import Coq Require Import DwChw.Types */
/*@ Import Coq Require Import DwChw.MemoryFacts DwChw.OutputInterface */
/*@ Extern Coq (DwROMap :: *) (DwOutput :: *) */
/*@ Extern Coq (dw_data:DwROMap->Assertion) (dw_get:DwROMap->Z->fp32) (dw_present:DwROMap->Z->Prop) (dw_pop:DwROMap->Z->DwROMap)
 (dw_same:fp32->fp32->Prop) (dw_distinct:list Z->Prop)
 (dw_output:list Z->DwOutput->Assertion) (dw_write_window:list Z->Z->Z->Prop)
 (dw_output_put:DwOutput->Z->fp32->DwOutput) (dw_write_values:DwOutput->Z->list fp32->DwOutput)
 (dw_pack2:fp32->fp32->list fp32) (dw_pack4:fp32->fp32->fp32->fp32->list fp32) */
/*@ include strategies "../proof/c/dw_maps.strategies" */
/*@ include strategies "../proof/c/dw_output.strategies" */
float dw_read_scalar(const float *p)
/*@ With (F:DwROMap) Require dw_present(F,p) && dw_data(F)
 Ensure dw_same(__return,dw_get(F,p)) && dw_data(F) */;
float dw_read_scalar(const float *p)
/*@ With (F:DwROMap) Require dw_present(F,p) && dw_data(F)
 Ensure dw_same(__return,dw_get(F,p)) && dw_data(F) */
{ return *p; }
