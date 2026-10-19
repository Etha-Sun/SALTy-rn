#include <stddef.h>
#include <stdint.h>
/*@ requires stride>0 && stride%4==0;
    requires vl<=32 && vl*stride<=PTRDIFF_MAX;
    terminates \true; assigns \nothing;
    ensures stride==4*(stride/4);
    ensures \forall integer j;0<=j<=vl ==> 0<=j*stride<=PTRDIFF_MAX;
    ensures \forall integer j;0<=j<vl ==> j*stride+4<=4*(1+(vl-1)*(stride/4)); */
void proof_u32_stride(size_t vl,ptrdiff_t stride) {}
/*@ terminates \true; assigns \nothing; ensures \false; */
void proof_control_false(void) {}
