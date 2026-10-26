#ifdef HWC_FORMAL
#include "shim/neon_kernel_program.h"
#else
#include <stddef.h>
#include <stdint.h>
struct xnn_f32_minmax_params;
#ifndef XNN_OOB_READS
#define XNN_OOB_READS
#endif
#endif
/*@ Import Coq Import HwcConv.HwcPublicObservationModel */
/*@ Extern Coq (hwp_state_observe:HwcOutput->HwcOutput->Prop) (hwp_unwritten_frame:HwcOutput->HwcOutput->Z->Z->Z->Z->Z->Z->Z->Prop) */
void test_neon(
    size_t input_height,
    size_t input_width,
    size_t output_y_start,
    size_t output_y_end,
    const float* input,
    const float* zero,
    const float* weights,
    float* output,
    size_t input_padding_top,
    size_t output_channels,
    size_t output_height_stride,
    size_t output_channel_stride,
    const struct xnn_f32_minmax_params* restrict params) XNN_OOB_READS
/*@ With (F:HwcROMap) (O:HwcOutput) (W:list Z) (H:Z) (N:Z) (Top:Z) (Start:Z) (End:Z) (Input:Z) (Zero:Z) (Weights:Z) (Output:Z) (Params:Z) (Cn:Z) (Hs:Z) (Cs:Z) (Lo:fp32) (Hi:fp32) Require (input_height==H) && (input_width==N) && (input_padding_top==Top) && (output_y_start==Start) && (output_y_end==End) && (input==Input) && (zero==Zero) && (weights==Weights) && (output==Output) && (params==Params) && (output_channels==Cn) && (output_height_stride==Hs) && (output_channel_stride==Cs) && (hc_input_domain(F,Input,Zero,Weights,Params,H,N,Top,Start,End,Cn)) && (hc_output_layout(Output,Hs,Cs,H,N,Cn,End)) && (hc_output_owned(W,Output,Hs,Cs,Cn,Start,End,(N+1)/2)) && (hc_present(F,&(params->scalar.min))) && (hc_present(F,&(params->scalar.max))) && (hc_same_bits(hc_get(F,&(params->scalar.min)),Lo)) && (hc_same_bits(hc_get(F,&(params->scalar.max)),Hi)) && (0<H) && (0<N) && (0<Cn) && (0<=Top) && (Top<=1) && (0<=Start) && (Start<End) && hc_data(F) * hc_output(W,O) Ensure hc_data(F)*hc_output(W,hc_final(hc_visible(hc_neon_raw(F,Input,Zero,Weights,H,N,Top,Lo,Hi),Cn),O,Output,Hs,Cs,Cn,Start,End,(N+1)/2)) */
;
void test_rvv(
    size_t input_height,
    size_t input_width,
    size_t output_y_start,
    size_t output_y_end,
    const float* input,
    const float* zero,
    const float* weights,
    float* output,
    size_t input_padding_top,
    size_t output_channels,
    size_t output_height_stride,
    size_t output_channel_stride,
    const struct xnn_f32_minmax_params* restrict params) XNN_OOB_READS
/*@ With (F:HwcROMap) (O:HwcOutput) (W:list Z) (H:Z) (N:Z) (Top:Z) (Start:Z) (End:Z) (Input:Z) (Zero:Z) (Weights:Z) (Output:Z) (Params:Z) (Cn:Z) (Hs:Z) (Cs:Z) (Lo:fp32) (Hi:fp32) Require (input_height==H) && (input_width==N) && (input_padding_top==Top) && (output_y_start==Start) && (output_y_end==End) && (input==Input) && (zero==Zero) && (weights==Weights) && (output==Output) && (params==Params) && (output_channels==Cn) && (output_height_stride==Hs) && (output_channel_stride==Cs) && (hc_input_domain(F,Input,Zero,Weights,Params,H,N,Top,Start,End,Cn)) && (hc_output_layout(Output,Hs,Cs,H,N,Cn,End)) && (hc_output_owned(W,Output,Hs,Cs,Cn,Start,End,(N+1)/2)) && (hc_present(F,&(params->scalar.min))) && (hc_present(F,&(params->scalar.max))) && (hc_same_bits(hc_get(F,&(params->scalar.min)),Lo)) && (hc_same_bits(hc_get(F,&(params->scalar.max)),Hi)) && (0<H) && (0<N) && (0<Cn) && (0<=Top) && (Top<=1) && (0<=Start) && (Start<End) && hc_data(F) * hc_output(W,O) Ensure hc_data(F)*hc_output(W,hc_final(hc_visible(hc_rvv_raw(F,Input,Zero,Weights,H,N,Top,Lo,Hi),Cn),O,Output,Hs,Cs,Cn,Start,End,(N+1)/2)) */
;
int hwc_public_mode(unsigned int use_rvv,
    size_t input_height,
    size_t input_width,
    size_t output_y_start,
    size_t output_y_end,
    const float* input,
    const float* zero,
    const float* weights,
    float* output,
    size_t input_padding_top,
    size_t output_channels,
    size_t output_height_stride,
    size_t output_channel_stride,
    const struct xnn_f32_minmax_params* restrict params) XNN_OOB_READS
/*@ With (F:HwcROMap) (O:HwcOutput) (W:list Z) (H:Z) (N:Z) (Top:Z) (Start:Z) (End:Z) (Input:Z) (Zero:Z) (Weights:Z) (Output:Z) (Params:Z) (Cn:Z) (Hs:Z) (Cs:Z) (Lo:fp32) (Hi:fp32) Require (input_height==H) && (input_width==N) && (input_padding_top==Top) && (output_y_start==Start) && (output_y_end==End) && (input==Input) && (zero==Zero) && (weights==Weights) && (output==Output) && (params==Params) && (output_channels==Cn) && (output_height_stride==Hs) && (output_channel_stride==Cs) && (hc_input_domain(F,Input,Zero,Weights,Params,H,N,Top,Start,End,Cn)) && (hc_output_layout(Output,Hs,Cs,H,N,Cn,End)) && (hc_output_owned(W,Output,Hs,Cs,Cn,Start,End,(N+1)/2)) && (hc_present(F,&(params->scalar.min))) && (hc_present(F,&(params->scalar.max))) && (hc_same_bits(hc_get(F,&(params->scalar.min)),Lo)) && (hc_same_bits(hc_get(F,&(params->scalar.max)),Hi)) && (0<H) && (0<N) && (0<Cn) && (0<=Top) && (Top<=1) && (0<=Start) && (Start<End) && hc_data(F) * hc_output(W,O) Ensure exists (OA:HwcOutput), __return==1 && hwp_state_observe(hc_final(hc_visible(hc_neon_raw(F,Input,Zero,Weights,H,N,Top,Lo,Hi),Cn),O,Output,Hs,Cs,Cn,Start,End,(N+1)/2),OA) && hwp_unwritten_frame(O,OA,Output,Hs,Cs,Cn,Start,End,(N+1)/2) && hc_data(F)*hc_output(W,OA) */
{
 if(use_rvv==0){test_neon(input_height,input_width,output_y_start,output_y_end,input,zero,weights,output,input_padding_top,output_channels,output_height_stride,output_channel_stride,params) /*@ where F=F,W=W,O=O */;}
 else{test_rvv(input_height,input_width,output_y_start,output_y_end,input,zero,weights,output,input_padding_top,output_channels,output_height_stride,output_channel_stride,params) /*@ where F=F,W=W,O=O */;}
 return 1;
}
