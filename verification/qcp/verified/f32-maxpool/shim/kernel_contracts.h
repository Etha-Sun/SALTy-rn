#ifndef MAXPOOL_KERNEL_CONTRACTS_H
#define MAXPOOL_KERNEL_CONTRACTS_H
#include "formal_model.h"
#include "params.h"
/*@ Import Coq Require Import MaxPool.ContractModel */
/*@ Extern Coq (MPFloatMap :: *) (MPPtrMap :: *) (MPOutput :: *) */
/*@ Extern Coq (mp_word64:Z->Prop) (mp_geometry:MPFloatMap->MPPtrMap->list Z->Z->Z->Z->Z->Z->Z->Z->Z->Z->Prop) (mp_complete:MPFloatMap->MPPtrMap->MPOutput->Z->Z->Z->Z->Z->Z->Z->Z->Z->fp32->fp32->MPOutput) (mp_data:MPFloatMap->Assertion) (mp_ptr_data:MPPtrMap->Assertion) (mp_out:list Z->MPOutput->Assertion) */
void test_neon(size_t output_pixels,size_t kernel_elements,size_t channels,const float** input,size_t input_offset,size_t input_pixel_stride,float* output,size_t input_increment,size_t output_increment,const struct xnn_f32_minmax_params* restrict params)
/*@ With (F:MPFloatMap) (PT:MPPtrMap) (W:list Z) (old:MPOutput) (lo:fp32) (hi:fp32)
 Require 0<output_pixels && 0<channels && params!=0 && mp_word64(output_pixels) && mp_word64(kernel_elements) && mp_word64(channels) && mp_word64(input_offset) && mp_word64(input_pixel_stride) && mp_word64(input_increment) && mp_word64(output_increment) && mp_word64(input) && mp_word64(output) && mp_word64(params) && mp_geometry(F,PT,W,output_pixels,kernel_elements,channels,input,input_offset,input_pixel_stride,input_increment,output,output_increment) && mp_data(F) * mp_ptr_data(PT) * store(&(params->scalar.min),float,lo) * store(&(params->scalar.max),float,hi) * mp_out(W,old)
 Ensure mp_data(F) * mp_ptr_data(PT) * store(&(params->scalar.min),float,lo) * store(&(params->scalar.max),float,hi) * mp_out(W,mp_complete(F,PT,old,output_pixels@pre,kernel_elements@pre,channels@pre,input@pre,input_offset@pre,input_pixel_stride@pre,input_increment@pre,output@pre,output_increment@pre,lo,hi)) */;
void test_rvv(size_t output_pixels,size_t kernel_elements,size_t channels,const float** input,size_t input_offset,size_t input_pixel_stride,float* output,size_t input_increment,size_t output_increment,const struct xnn_f32_minmax_params* restrict params)
/*@ With (F:MPFloatMap) (PT:MPPtrMap) (W:list Z) (old:MPOutput) (lo:fp32) (hi:fp32)
 Require 0<output_pixels && 0<channels && params!=0 && mp_word64(output_pixels) && mp_word64(kernel_elements) && mp_word64(channels) && mp_word64(input_offset) && mp_word64(input_pixel_stride) && mp_word64(input_increment) && mp_word64(output_increment) && mp_word64(input) && mp_word64(output) && mp_word64(params) && mp_geometry(F,PT,W,output_pixels,kernel_elements,channels,input,input_offset,input_pixel_stride,input_increment,output,output_increment) && mp_data(F) * mp_ptr_data(PT) * store(&(params->scalar.min),float,lo) * store(&(params->scalar.max),float,hi) * mp_out(W,old)
 Ensure mp_data(F) * mp_ptr_data(PT) * store(&(params->scalar.min),float,lo) * store(&(params->scalar.max),float,hi) * mp_out(W,mp_complete(F,PT,old,output_pixels@pre,kernel_elements@pre,channels@pre,input@pre,input_offset@pre,input_pixel_stride@pre,input_increment@pre,output@pre,output_increment@pre,lo,hi)) */;
#endif
