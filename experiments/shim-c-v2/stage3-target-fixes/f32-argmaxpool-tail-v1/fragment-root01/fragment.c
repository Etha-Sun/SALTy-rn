#include "/srv/home/yuechunsun/tools/lean/build/shim-c/experiments/shim-c-v2/stage3-target-fixes/f32-argmaxpool-tail-v1/.build/guard01/plain/native_types.h"
#include "/srv/home/yuechunsun/tools/lean/build/shim-c/experiments/shim-c-v2/stage3-target-fixes/f32-argmaxpool-tail-v1/.build/guard01/plain/integer_memory.c"
/* The preconditions belong only to this local fragment diagnostic, not to any kernel. */
/*@ requires tail: 1<=c<=3;
    requires input: \valid_read(ib+(0..c-1));
    assigns \nothing;
    ensures live: \forall integer j; 0<=j<c ==> \result.lane[j]==ib[j];
    ensures unused: \forall integer j; c<=j<4 ==> \result.lane[j]==0;
*/
uint32x4_t tail_fragment(const uint32_t *ib,size_t c) {
          const uint32_t tail_index[4] = {
            ib[0], c >= 2 ? ib[1] : 0, c >= 3 ? ib[2] : 0, 0
          };
          return vld1q_u32(tail_index);
}
