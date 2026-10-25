#ifndef X32_KERNEL_SPECS_H
#define X32_KERNEL_SPECS_H
#ifndef QCP_NATIVE
#include "program_model.h"
#else
#include "formal_types.h"
#endif
void test_neon(const uint32_t*input,uint32_t*output,size_t input_stride,size_t output_stride,size_t block_width,size_t block_height)
/*@ With(F:XTMap)(W:list Z)(old:XTOutput)(G:XTLayout) Require xt_valid(F,W,G) && input==xt_input(G) && output==xt_output_base(G) && input_stride==xt_input_stride(G) && output_stride==xt_output_stride(G) && block_width==xt_width(G) && block_height==xt_height(G) && xt_data(F) * xt_output(W,old) Ensure exists(R:XTOutput), xt_result(F,G,old,R) && xt_data(F) * xt_output(W,R) */;
void test_rvv(const uint32_t*input,uint32_t*output,size_t input_stride,size_t output_stride,size_t block_width,size_t block_height)
/*@ With(F:XTMap)(W:list Z)(old:XTOutput)(G:XTLayout) Require xt_valid(F,W,G) && input==xt_input(G) && output==xt_output_base(G) && input_stride==xt_input_stride(G) && output_stride==xt_output_stride(G) && block_width==xt_width(G) && block_height==xt_height(G) && xt_data(F) * xt_output(W,old) Ensure exists(R:XTOutput), xt_result(F,G,old,R) && xt_data(F) * xt_output(W,R) */;
#endif
