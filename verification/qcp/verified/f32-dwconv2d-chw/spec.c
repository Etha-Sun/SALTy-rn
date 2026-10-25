#define restrict
#include "shim/public_model.h"
void test_neon(
    size_t input_height,
    size_t input_width,
    const float* input,
    const float* weights,
    const float* zero,
    float* output,
    uint32_t padding_top,
    const struct xnn_f32_minmax_params* restrict params)
/*@ With (F:DwROMap) (O:DwOutput) (W:list Z) (H:Z) (N:Z) (Input:Z) (Zero:Z) (Weights:Z) (Output:Z) (Params:Z) (Lo:fp32) (Hi:fp32) Require 0<H && 0<N && H<=18446744073709551615 && 4*N<=18446744073709551615 && input_width%4==0 && input_height==H && input_width==4*N && input==Input && zero==Zero && weights==Weights && output==Output && params==Params && padding_top==1 && dw_inputs(F,Input,Zero,Weights,Params,H,N) && dw_present(F,&(params->scalar.min)) && dw_present(F,&(params->scalar.max)) && dw_same(dw_get(F,&(params->scalar.min)),Lo) && dw_same(dw_get(F,&(params->scalar.max)),Hi) && W==dw_addresses(Output,H,N) && dw_distinct(W) && dw_footprint(Output,H*N) && dw_data(F) * dw_output(W,O) Ensure dw_data(F) * dw_output(W,dw_progress(dw_neon_results(F,Input,Zero,Weights,H,N,Lo,Hi),O,Output,H,N,H,0)) */;
void test_rvv(
    size_t input_height,
    size_t input_width,
    const float* input,
    const float* weights,
    const float* zero,
    float* output,
    uint32_t padding_top,
    const struct xnn_f32_minmax_params* restrict params)
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
