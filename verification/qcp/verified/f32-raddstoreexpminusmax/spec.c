#include "shim/program_model.h"
#include "shim/rvv_specs.h"
void test_neon(size_t batch,const float*input,const float*max,float*output,float*sum,const void*params)
/*@ With(F:EMMap)(W:list Z)(O:EMOutput)(N:Z)(P:Z)(M:Z)(Q:Z)(S:Z)
 Require batch==4*N&&input==P&&max==M&&output==Q&&sum==S&&em_valid(F,W,P,M,Q,S,N)&&em_data(F)*em_output(W,O)
 Ensure em_data(F)*em_output(W,em_arm_result(F,P,M,Q,S,N,O)) */;
void test_rvv(size_t batch,const float*input,const float*max,float*output,float*sum,const void*params)
/*@ With(F:EMMap)(W:list Z)(O:EMOutput)(N:Z)(P:Z)(M:Z)(Q:Z)(S:Z)
 Require batch==4*N&&input==P&&max==M&&output==Q&&sum==S&&em_valid(F,W,P,M,Q,S,N)&&em_data(F)*em_output(W,O)
 Ensure em_data(F)*em_output(W,em_rvv_result(F,P,M,Q,S,N,O)) */;
