/* Verification caller: return 1 certifies its postcondition in this proof.
 * Runtime differential testing uses the separate independent native oracle. */
#include "spec.c"
#include "shim/public_model.h"
int argmax_public_pair(size_t pixels,size_t rows,size_t channels,const float**input,
 size_t offset,size_t stride,float*outN,uint32_t*idxN,float*outR,uint32_t*idxR,
 size_t input_inc,size_t output_inc,size_t index_inc)
/*@ With(DN:APProgram)(DR:APProgram)(L:APPublicLayout)(F:APMap)(P:APPtrMap)
 (WN:list Z)(WIN:list Z)(WR:list Z)(WIR:list Z)
 (ON:APOutput)(IN:APIndex)(OR:APOutput)(IR:APIndex)
Require app_arguments(DN,pixels,rows,channels,input,offset,stride,outN,idxN,input_inc,output_inc,index_inc) && app_arguments(DR,pixels,rows,channels,input,offset,stride,outR,idxR,input_inc,output_inc,index_inc) && app_valid(F,P,WN,WIN,DN) && app_valid(F,P,WR,WIR,DR) && app_public_layout(DN,DR,L) && ap_data(F) * ap_ptr_data(P) * ap_output(WN,ON) * ap_index(WIN,IN) * ap_output(WR,OR) * ap_index(WIR,IR)
Ensure __return==1 && app_public_equal(F,P,DN,DR,L,app_neon_output(F,P,DN,ON,IN),app_neon_index(F,P,DN,ON,IN),app_rvv_output(F,P,DR,OR,IR),app_rvv_index(F,P,DR,OR,IR)) && ap_data(F) * ap_ptr_data(P) * ap_output(WN,app_neon_output(F,P,DN,ON,IN)) * ap_index(WIN,app_neon_index(F,P,DN,ON,IN)) * ap_output(WR,app_rvv_output(F,P,DR,OR,IR)) * ap_index(WIR,app_rvv_index(F,P,DR,OR,IR)) */
{
 test_neon(pixels,rows,channels,input,offset,stride,outN,idxN,input_inc,output_inc,index_inc) /*@ where D=DN,F=F,P=P,W=WN,WI=WIN,O=ON,I=IN */;
 test_rvv(pixels,rows,channels,input,offset,stride,outR,idxR,input_inc,output_inc,index_inc) /*@ where D=DR,F=F,P=P,W=WR,WI=WIR,O=OR,I=IR */;
 return 1;
}
