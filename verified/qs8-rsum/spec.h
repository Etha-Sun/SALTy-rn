#ifndef QS8_SPEC_H
#define QS8_SPEC_H
#include <stdint.h>

/* Domain definitions, not correctness assumptions. */
/*@
  logic integer u32(integer x) = ((x % 4294967296) + 4294967296) % 4294967296;
  logic integer s32(integer x) = u32(x) < 2147483648 ? u32(x) : u32(x)-4294967296;
  logic integer sum8{L}(int8_t *p, integer n) =
    n <= 0 ? 0 : sum8(p,n-1) + p[n-1];
*/
#include "shim.h"

/*@
 requires 0 < batch <= SIZE_MAX-15;
 requires \valid_read(input+(0..batch+14));
 requires \valid(output);
 requires params != \null;
 requires \separated(output,input+(0..batch+14));
 requires -2147483648 <= (integer)*output+s32(sum8(input,batch)) <= 2147483647;
 terminates \true;
 assigns *output;
*/
void test_neon(
    size_t batch,
    const int8_t* input,
    int32_t* output,
    const struct xnn_qs8_rsum_params* restrict params) XNN_OOB_READS;

/*@
 requires 0 < batch <= SIZE_MAX-15;
 requires \valid_read(input+(0..batch+14));
 requires \valid(output);
 requires params != \null;
 requires \separated(output,input+(0..batch+14));
 requires -2147483648 <= (integer)*output+s32(sum8(input,batch)) <= 2147483647;
 terminates \true;
 assigns *output;
*/
void test_rvv(
    size_t batch,
    const int8_t* input,
    int32_t* output,
    const struct xnn_qs8_rsum_params* restrict params) XNN_OOB_READS;

/*@
 requires 0 < n <= SIZE_MAX-15;
 requires \valid_read(input+(0..n+14));
 requires -2147483648 <= (integer)initial+s32(sum8(input,n)) <= 2147483647;
 terminates \true;
 assigns \nothing;
 ensures equal: \result == 1;
*/
int equivalent(size_t n,const int8_t *input,int32_t initial);

#endif
