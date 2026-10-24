#ifndef DWCONV_KERNEL_DECLARATIONS_H
#define DWCONV_KERNEL_DECLARATIONS_H
#include "program.h"
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

#endif
