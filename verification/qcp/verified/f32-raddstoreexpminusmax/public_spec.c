#ifndef EXP_NATIVE_PUBLIC
#include "spec.c"
#include "shim/public_model.h"
#endif
/* This actual caller runs both kernels on the same mutable region in order.
   Its postcondition compares the first call's proved historical state with
   the second call's final state, including a sum/output alias and last write.
   Returning 1 witnesses that postcondition; it is not a runtime comparator. */
int expminusmax_checked_pair(size_t batch,const float*input,const float*max,
 float*output,float*sum,const void*params)
/*@ With(F:EMMap)(W:list Z)(O:EMOutput)(N:Z)(P:Z)(M:Z)(Q:Z)(S:Z)
 Require batch==4*N&&input==P&&max==M&&output==Q&&sum==S&&em_valid(F,W,P,M,Q,S,N)&&em_data(F)*em_output(W,O)
 Ensure __return==1&&em_pair_observation(F,P,M,Q,S,N,O)&&em_data(F)*em_output(W,em_pair_result(F,P,M,Q,S,N,O)) */
{
 test_neon(batch,input,max,output,sum,params)
 /*@ where F=F,W=W,O=O,N=N,P=P,M=M,Q=Q,S=S */;
 test_rvv(batch,input,max,output,sum,params)
 /*@ where F=F,W=W,O=em_arm_result(F,P,M,Q,S,N,O),N=N,P=P,M=M,Q=Q,S=S */;
 return 1;
}
