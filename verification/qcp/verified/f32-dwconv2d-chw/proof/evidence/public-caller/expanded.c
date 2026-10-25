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
/*@ Import Coq Require Import DwChw.TerminalModel */
/*@ Extern Coq (DwROMap :: *) */
/*@ Extern Coq (dw_data:DwROMap->Assertion) (dw_get:DwROMap->Z->fp32) (dw_window:DwROMap->Z->Z->Prop)
 (dw_fp2:fp32->fp32->Z->fp32) (dw_fp4:fp32->fp32->fp32->fp32->Z->fp32) (dw_u4:Z->Z->Z->Z->Z->Z)
 (dw_arm_ext:(Z->fp32)->(Z->fp32)->Z->Z->fp32) (dw_arm_fma:fp32->fp32->fp32->fp32)
 (dw_arm_max:fp32->fp32->fp32) (dw_arm_min:fp32->fp32->fp32)
 (dw_arm_and:(Z->Z)->(Z->Z)->Z->Z) (bits_of_fp32:fp32->Z) (fp32_of_bits:Z->fp32) */
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
/*@ Import Coq Require Import DwChw.ProgressModel */
/*@ Extern Coq (dw_inputs:DwROMap->Z->Z->Z->Z->Z->Z->Prop)
 (dw_footprint:Z->Z->Prop) (dw_addresses:Z->Z->Z->list Z)
 (dw_row_base:Z->Z->Z->Z->Z->Z) (dw_store_row:Z->Z->Z->Z)
 (dw_prev:DwROMap->Z->Z->fp32)
 (dw_neon_results:DwROMap->Z->Z->Z->Z->Z->fp32->fp32->Z->fp32)
 (dw_rvv_results:DwROMap->Z->Z->Z->Z->Z->fp32->fp32->Z->fp32)
 (dw_progress:(Z->fp32)->DwOutput->Z->Z->Z->Z->Z->DwOutput)
 (dw_outer_pointers:Z->Z->Z->Z->Z->Z->Z->Z->Z->Z->Z->Z->Z->Z->Prop) */
/*@ Import Coq Require Import DwChw.PublicObservation */
/*@ Extern Coq (dw_public_observed:DwOutput->DwOutput->Z->Z->Z->Z->Prop) */
void test_neon(
    size_t input_height,
    size_t input_width,
    const float* input,
    const float* weights,
    const float* zero,
    float* output,
    uint32_t padding_top,
    const struct xnn_f32_minmax_params* params)
/*@ With (F:DwROMap) (O:DwOutput) (W:list Z) (H:Z) (N:Z) (Input:Z) (Zero:Z) (Weights:Z) (Output:Z) (Params:Z) (Lo:fp32) (Hi:fp32) Require 0<H && 0<N && H<=18446744073709551615 && 4*N<=18446744073709551615 && input_width%4==0 && input_height==H && input_width==4*N && input==Input && zero==Zero && weights==Weights && output==Output && params==Params && padding_top==1 && dw_inputs(F,Input,Zero,Weights,Params,H,N) && dw_present(F,&(params->scalar.min)) && dw_present(F,&(params->scalar.max)) && dw_same(dw_get(F,&(params->scalar.min)),Lo) && dw_same(dw_get(F,&(params->scalar.max)),Hi) && W==dw_addresses(Output,H,N) && dw_distinct(W) && dw_footprint(Output,H*N) && dw_data(F) * dw_output(W,O) Ensure dw_data(F) * dw_output(W,dw_progress(dw_neon_results(F,Input,Zero,Weights,H,N,Lo,Hi),O,Output,H,N,H,0)) */;
void test_rvv(
    size_t input_height,
    size_t input_width,
    const float* input,
    const float* weights,
    const float* zero,
    float* output,
    uint32_t padding_top,
    const struct xnn_f32_minmax_params* params)
/*@ With (F:DwROMap) (O:DwOutput) (W:list Z) (H:Z) (N:Z) (Input:Z) (Zero:Z) (Weights:Z) (Output:Z) (Params:Z) (Lo:fp32) (Hi:fp32) Require 0<H && 0<N && H<=18446744073709551615 && 4*N<=18446744073709551615 && input_width%4==0 && input_height==H && input_width==4*N && input==Input && zero==Zero && weights==Weights && output==Output && params==Params && padding_top==1 && dw_inputs(F,Input,Zero,Weights,Params,H,N) && dw_present(F,&(params->scalar.min)) && dw_present(F,&(params->scalar.max)) && dw_same(dw_get(F,&(params->scalar.min)),Lo) && dw_same(dw_get(F,&(params->scalar.max)),Hi) && W==dw_addresses(Output,H,N) && dw_distinct(W) && dw_footprint(Output,H*N) && dw_data(F) * dw_output(W,O) Ensure dw_data(F) * dw_output(W,dw_progress(dw_rvv_results(F,Input,Zero,Weights,H,N,Lo,Hi),O,Output,H,N,H,0)) */;
/* Public caller. return1 has the proved output postcondition. Runtime checks
 * use the independent native oracle; this is not a runtime comparator. */
int dwchw_public_pair(size_t input_height,size_t input_width,const float*input,
 const float*weights,const float*zero,float*outN,float*outR,uint32_t padding_top,
 const struct xnn_f32_minmax_params*params)
/*@ With(F:DwROMap)(ON:DwOutput)(OR:DwOutput)(WN:list Z)(WR:list Z)
 (H:Z)(N:Z)(Input:Z)(Zero:Z)(Weights:Z)(OutN:Z)(OutR:Z)(Params:Z)(Lo:fp32)(Hi:fp32)
Require 0<H && 0<N && H<=18446744073709551615 && 4*N<=18446744073709551615 && input_width%4==0 && input_height==H && input_width==4*N && input==Input && zero==Zero && weights==Weights && outN==OutN && params==Params && padding_top==1 && dw_inputs(F,Input,Zero,Weights,Params,H,N) && dw_present(F,&(params->scalar.min)) && dw_present(F,&(params->scalar.max)) && dw_same(dw_get(F,&(params->scalar.min)),Lo) && dw_same(dw_get(F,&(params->scalar.max)),Hi) && WN==dw_addresses(OutN,H,N) && dw_distinct(WN) && dw_footprint(OutN,H*N) && 0<H && 0<N && H<=18446744073709551615 && 4*N<=18446744073709551615 && input_width%4==0 && input_height==H && input_width==4*N && input==Input && zero==Zero && weights==Weights && outR==OutR && params==Params && padding_top==1 && dw_inputs(F,Input,Zero,Weights,Params,H,N) && dw_present(F,&(params->scalar.min)) && dw_present(F,&(params->scalar.max)) && dw_same(dw_get(F,&(params->scalar.min)),Lo) && dw_same(dw_get(F,&(params->scalar.max)),Hi) && WR==dw_addresses(OutR,H,N) && dw_distinct(WR) && dw_footprint(OutR,H*N) && dw_data(F) * dw_output(WN,ON) * dw_output(WR,OR)
Ensure __return==1 && dw_public_observed(dw_progress(dw_neon_results(F,Input,Zero,Weights,H,N,Lo,Hi),ON,OutN,H,N,H,0),dw_progress(dw_rvv_results(F,Input,Zero,Weights,H,N,Lo,Hi),OR,OutR,H,N,H,0),OutN,OutR,H,N) && dw_data(F) * dw_output(WN,dw_progress(dw_neon_results(F,Input,Zero,Weights,H,N,Lo,Hi),ON,OutN,H,N,H,0)) * dw_output(WR,dw_progress(dw_rvv_results(F,Input,Zero,Weights,H,N,Lo,Hi),OR,OutR,H,N,H,0)) */
{
 test_neon(input_height,input_width,input,weights,zero,outN,padding_top,params) /*@ where F=F,O=ON,W=WN,H=H,N=N,Input=Input,Zero=Zero,Weights=Weights,Output=OutN,Params=Params,Lo=Lo,Hi=Hi */;
 test_rvv(input_height,input_width,input,weights,zero,outR,padding_top,params) /*@ where F=F,O=OR,W=WR,H=H,N=N,Input=Input,Zero=Zero,Weights=Weights,Output=OutR,Params=Params,Lo=Lo,Hi=Hi */;
 return 1;
}
