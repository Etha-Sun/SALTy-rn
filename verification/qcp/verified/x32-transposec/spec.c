#include "shim/kernel_specs.h"
#include "shim/observe.h"
/*@ Extern Coq (xt_cols:XTLayout->Z) (xt_get:XTMap->Z->Z) (xt_input_address:XTLayout->Z->Z->Z) */
/* A single actual observer of the independent all-written-address theorem.
 * Both kernels execute on the same live buffer, with its own current state;
 * the saved first UInt32 value remains a C local through the second call. */
int test_equivalence(const uint32_t*input,uint32_t*output,
 size_t input_stride,size_t output_stride,size_t block_width,size_t block_height,
 size_t row,size_t column)
/*@ With(F:XTMap)(W:list Z)(old:XTOutput)(G:XTLayout)
 Require xt_valid(F,W,G) && input==xt_input(G) && output==xt_output_base(G) && input_stride==xt_input_stride(G) && output_stride==xt_output_stride(G) && block_width==xt_width(G) && block_height==xt_height(G) && 0<=row && row<xt_height(G) && 0<=column && column<xt_cols(G) && xt_data(F) * xt_output(W,old)
 Ensure exists(R:XTOutput), __return==1 && xt_result(F,G,old,R) && xt_data(F) * xt_output(W,R) */
{
 const uint32_t* address=xt_observe_pointer(output,output_stride,row,column);
 test_neon(input,output,input_stride,output_stride,block_width,block_height) /*@ where F=F,W=W,G=G */;
 const uint32_t left=xt_read_output(address) /*@ where W=W,x=xt_get(F,xt_input_address(G,row,column)) */;
 test_rvv(input,output,input_stride,output_stride,block_width,block_height) /*@ where F=F,W=W,G=G */;
 const uint32_t right=xt_read_output(address) /*@ where W=W,x=xt_get(F,xt_input_address(G,row,column)) */;
 return left==right;
}
