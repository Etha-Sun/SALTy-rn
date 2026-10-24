#include "shim/program.h"
void test_neon(
    size_t channels,
    size_t output_width,
    const float** input,
    const float* weights,
    float* output,
    intptr_t input_stride,
    size_t output_increment,
    size_t input_offset,
    size_t input_pixel_stride,
    const float* zero,
    const struct xnn_f32_minmax_params* restrict params)
/*@ With (D:DwProgram) (F:DwROMap) (P:DwPtrMap) (W:list Z) (O:DwOutput) (lo:fp32) (hi:fp32) Require params!=0 && channels>0 && output_width>0 && channels==dw_channels(D) && output_width==dw_width(D) && input==dw_input(D) && weights==dw_weights(D) && output==dw_out(D) && input_stride==dw_input_stride(D) && output_increment==dw_out_increment(D) && input_offset==dw_offset(D) && input_pixel_stride==dw_pixel_stride(D) && zero==dw_zero_ptr(D) && dw_valid(F,P,W,D) && dw_distinct(W) && dw_present(F,&(params->scalar.min)) && dw_present(F,&(params->scalar.max)) && dw_same(lo,dw_get(F,&(params->scalar.min))) && dw_same(hi,dw_get(F,&(params->scalar.max))) && dw_data(F) * dw_ptr_data(P) * dw_output(W,O) Ensure dw_data(F) * dw_ptr_data(P) * dw_output(W,dw_neon_result(F,P,D,lo,hi,O)) */;
void test_rvv(
    size_t channels,
    size_t output_width,
    const float** input,
    const float* weights,
    float* output,
    intptr_t input_stride,
    size_t output_increment,
    size_t input_offset,
    size_t input_pixel_stride,
    const float* zero,
    const struct xnn_f32_minmax_params* restrict params)
/*@ With (D:DwProgram) (F:DwROMap) (P:DwPtrMap) (W:list Z) (O:DwOutput) (lo:fp32) (hi:fp32) Require params!=0 && channels>0 && output_width>0 && channels==dw_channels(D) && output_width==dw_width(D) && input==dw_input(D) && weights==dw_weights(D) && output==dw_out(D) && input_stride==dw_input_stride(D) && output_increment==dw_out_increment(D) && input_offset==dw_offset(D) && input_pixel_stride==dw_pixel_stride(D) && zero==dw_zero_ptr(D) && dw_valid(F,P,W,D) && dw_distinct(W) && dw_present(F,&(params->scalar.min)) && dw_present(F,&(params->scalar.max)) && dw_same(lo,dw_get(F,&(params->scalar.min))) && dw_same(hi,dw_get(F,&(params->scalar.max))) && dw_data(F) * dw_ptr_data(P) * dw_output(W,O) Ensure dw_data(F) * dw_ptr_data(P) * dw_output(W,dw_rvv_result(F,P,D,lo,hi,O)) */;

#include "shim/public_compare.h"

int equivalent(size_t channels,size_t output_width,const float **input,
 const float *weights,float *left,float *right,intptr_t input_stride,
 size_t output_increment,size_t input_offset,size_t input_pixel_stride,
 const float *zero,const struct xnn_f32_minmax_params *params)
/*@ With (D:DwProgram) (F:DwROMap) (P:DwPtrMap) (out2:Z) (W1:list Z) (W2:list Z) (O1:DwOutput) (O2:DwOutput) (lo:fp32) (hi:fp32) Require params!=0 && channels>0 && output_width>0 && channels==dw_channels(D) && output_width==dw_width(D) && input==dw_input(D) && weights==dw_weights(D) && left==dw_out(D) && right==out2 && input_stride==dw_input_stride(D) && output_increment==dw_out_increment(D) && input_offset==dw_offset(D) && input_pixel_stride==dw_pixel_stride(D) && zero==dw_zero_ptr(D) && dw_valid(F,P,W1,D) && dw_valid(F,P,W2,dw_rebase(D,out2)) && dw_distinct(W1) && dw_distinct(W2) && dw_present(F,&(params->scalar.min)) && dw_present(F,&(params->scalar.max)) && dw_same(lo,dw_get(F,&(params->scalar.min))) && dw_same(hi,dw_get(F,&(params->scalar.max))) && dw_data(F) * dw_ptr_data(P) * dw_output(W1,O1) * dw_output(W2,O2) Ensure __return==1 && dw_pair_observed(D,out2,dw_neon_result(F,P,D,lo,hi,O1),dw_rvv_result(F,P,dw_rebase(D,out2),lo,hi,O2)) && dw_data(F) * dw_ptr_data(P) * dw_output(W1,dw_neon_result(F,P,D,lo,hi,O1)) * dw_output(W2,dw_rvv_result(F,P,dw_rebase(D,out2),lo,hi,O2)) */
{
 test_neon(channels,output_width,input,weights,left,input_stride,output_increment,input_offset,input_pixel_stride,zero,params)
 /*@ where D=D,F=F,P=P,W=W1,O=O1,lo=lo,hi=hi */;
 test_rvv(channels,output_width,input,weights,right,input_stride,output_increment,input_offset,input_pixel_stride,zero,params)
 /*@ where D=dw_rebase(D,out2),F=F,P=P,W=W2,O=O2,lo=lo,hi=hi */;
 /*@ Assert params!=0 && channels>0 && output_width>0 && channels==dw_channels(D) && output_width==dw_width(D) && input==dw_input(D) && weights==dw_weights(D) && left==dw_out(D) && right==out2 && input_stride==dw_input_stride(D) && output_increment==dw_out_increment(D) && input_offset==dw_offset(D) && input_pixel_stride==dw_pixel_stride(D) && zero==dw_zero_ptr(D) && dw_valid(F,P,W1,D) && dw_valid(F,P,W2,dw_rebase(D,out2)) && dw_distinct(W1) && dw_distinct(W2) && dw_present(F,&(params->scalar.min)) && dw_present(F,&(params->scalar.max)) && dw_same(lo,dw_get(F,&(params->scalar.min))) && dw_same(hi,dw_get(F,&(params->scalar.max))) && dw_output_domain(W1,D) && dw_output_domain(W2,dw_rebase(D,out2)) && dw_pair_observed(D,out2,dw_neon_result(F,P,D,lo,hi,O1),dw_rvv_result(F,P,dw_rebase(D,out2),lo,hi,O2)) && dw_data(F) * dw_ptr_data(P) * dw_output(W1,dw_neon_result(F,P,D,lo,hi,O1)) * dw_output(W2,dw_rvv_result(F,P,dw_rebase(D,out2),lo,hi,O2)) */
 return compare_outputs(channels,output_width,left,right,output_increment)
 /*@ where D=D,out2=out2,W1=W1,W2=W2,O1=dw_neon_result(F,P,D,lo,hi,O1),O2=dw_rvv_result(F,P,dw_rebase(D,out2),lo,hi,O2) */;
}
