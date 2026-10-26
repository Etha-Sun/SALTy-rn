#include "/srv/home/yuechunsun/tools/qcp-simple-kernels/verification/qcp/candidates/f32-argmaxpool/shim/neon_kernel_frontend.h"
#include "/srv/home/yuechunsun/tools/qcp-simple-kernels/verification/qcp/candidates/f32-argmaxpool/shim/read_table.c"
/*@ Import Coq Require Import ArgmaxPool.ProgramModel */
/*@ Extern Coq (ap_ptr_window:APPtrMap->Z->Z->Prop) */
const float** ap_guard_cut_probe(const float** p,size_t k)
/*@ With (P:APPtrMap) n base
 Require 0<k && k==n && p==base && ap_ptr_window(P,base,9) && ap_ptr_data(P)
 Ensure ((n<=8 && __return==base+64)||(8<n && __return==base+72)) && ap_ptr_data(P) */
{
 const float** id=p+8;
 if(8<k){
 /*@ Assert 8<k && k==n && p==base && id==base+64 && ap_ptr_window(P,base,9) && id!=0 && ap_ptr_present(P,id) && ap_ptr_data(P) */
 const float* ignored=ap_read_table(id);
 id+=1;
 }
 return id;
}
