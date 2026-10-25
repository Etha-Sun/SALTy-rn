#ifdef QCP_NATIVE
#include "shim/kernel_runtime.h"
#else
#include "shim/kernel_contracts.h"
/*@ Import Coq Require Import MaxPool.TraceLookup */
/*@ Extern Coq (mp_written:Z->Z->Z->Z->Z->Prop)
 (mp_probe_value:MPFloatMap->MPPtrMap->Z->Z->Z->Z->Z->Z->Z->Z->Z->fp32->fp32->Z->fp32) */
#endif
#include "shim/compare.h"
int compare_maxpool_written(size_t output_pixels,size_t kernel_elements,size_t channels,const float** input,size_t input_offset,size_t input_pixel_stride,float* output,size_t input_increment,size_t output_increment,const struct xnn_f32_minmax_params* restrict params,float* probe)
/*@ With (F:MPFloatMap) (PT:MPPtrMap) (W:list Z) (old:MPOutput) (lo:fp32) (hi:fp32) Require mp_written(output_pixels,channels,output,output_increment,probe) && 0<output_pixels && 0<channels && params!=0 && mp_word64(output_pixels) && mp_word64(kernel_elements) && mp_word64(channels) && mp_word64(input_offset) && mp_word64(input_pixel_stride) && mp_word64(input_increment) && mp_word64(output_increment) && mp_word64(input) && mp_word64(output) && mp_word64(params) && mp_geometry(F,PT,W,output_pixels,kernel_elements,channels,input,input_offset,input_pixel_stride,input_increment,output,output_increment) && mp_data(F) * mp_ptr_data(PT) * store(&(params->scalar.min),float,lo) * store(&(params->scalar.max),float,hi) * mp_out(W,old) Ensure __return==1 && mp_data(F) * mp_ptr_data(PT) * store(&(params->scalar.min),float,lo) * store(&(params->scalar.max),float,hi) * mp_out(W,mp_complete(F,PT,mp_complete(F,PT,old,output_pixels@pre,kernel_elements@pre,channels@pre,input@pre,input_offset@pre,input_pixel_stride@pre,input_increment@pre,output@pre,output_increment@pre,lo,hi),output_pixels@pre,kernel_elements@pre,channels@pre,input@pre,input_offset@pre,input_pixel_stride@pre,input_increment@pre,output@pre,output_increment@pre,lo,hi)) */
{
  test_neon(output_pixels,kernel_elements,channels,input,input_offset,input_pixel_stride,output,input_increment,output_increment,params) /*@ where F=F,PT=PT,W=W,old=old,lo=lo,hi=hi */;
  uint32_t before=mp_output_bits_at(probe) /*@ where W=W,O=mp_complete(F,PT,old,output_pixels,kernel_elements,channels,input,input_offset,input_pixel_stride,input_increment,output,output_increment,lo,hi),v=mp_probe_value(F,PT,output_pixels,kernel_elements,channels,input,input_offset,input_pixel_stride,input_increment,output,output_increment,lo,hi,probe) */;
  test_rvv(output_pixels,kernel_elements,channels,input,input_offset,input_pixel_stride,output,input_increment,output_increment,params) /*@ where F=F,PT=PT,W=W,old=mp_complete(F,PT,old,output_pixels,kernel_elements,channels,input,input_offset,input_pixel_stride,input_increment,output,output_increment,lo,hi),lo=lo,hi=hi */;
  uint32_t after=mp_output_bits_at(probe) /*@ where W=W,O=mp_complete(F,PT,mp_complete(F,PT,old,output_pixels,kernel_elements,channels,input,input_offset,input_pixel_stride,input_increment,output,output_increment,lo,hi),output_pixels,kernel_elements,channels,input,input_offset,input_pixel_stride,input_increment,output,output_increment,lo,hi),v=mp_probe_value(F,PT,output_pixels,kernel_elements,channels,input,input_offset,input_pixel_stride,input_increment,output,output_increment,lo,hi,probe) */;
  return before==after;
}
