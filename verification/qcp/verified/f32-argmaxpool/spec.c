#include "shim/program_model.h"
void test_neon(size_t output_pixels,size_t pooling_elements,size_t channels,const float**input,size_t input_offset,size_t input_pixel_stride,float*output,uint32_t*index,size_t input_increment,size_t output_increment,size_t index_increment)
/*@ With(D:APProgram)(F:APMap)(P:APPtrMap)(W:list Z)(WI:list Z)(O:APOutput)(I:APIndex)
Require app_arguments(D,output_pixels,pooling_elements,channels,input,input_offset,input_pixel_stride,output,index,input_increment,output_increment,index_increment) && app_valid(F,P,W,WI,D) && ap_data(F) * ap_ptr_data(P) * ap_output(W,O) * ap_index(WI,I)
Ensure ap_data(F) * ap_ptr_data(P) * ap_output(W,app_neon_output(F,P,D,O,I)) * ap_index(WI,app_neon_index(F,P,D,O,I)) */;
void test_rvv(size_t output_pixels,size_t pooling_elements,size_t channels,const float**input,size_t input_offset,size_t input_pixel_stride,float*output,uint32_t*index,size_t input_increment,size_t output_increment,size_t index_increment)
/*@ With(D:APProgram)(F:APMap)(P:APPtrMap)(W:list Z)(WI:list Z)(O:APOutput)(I:APIndex)
Require app_arguments(D,output_pixels,pooling_elements,channels,input,input_offset,input_pixel_stride,output,index,input_increment,output_increment,index_increment) && app_valid(F,P,W,WI,D) && ap_data(F) * ap_ptr_data(P) * ap_output(W,O) * ap_index(WI,I)
Ensure ap_data(F) * ap_ptr_data(P) * ap_output(W,app_rvv_output(F,P,D,O,I)) * ap_index(WI,app_rvv_index(F,P,D,O,I)) */;
