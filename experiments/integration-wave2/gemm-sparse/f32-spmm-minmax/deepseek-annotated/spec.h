#ifndef F32_SPMM_MINMAX_SPEC_H
#define F32_SPMM_MINMAX_SPEC_H
#include "fp_primitives.h"
#include <errno.h>
void test_neon(
    size_t mc,
    size_t nc,
    const float* input,
    const float* weights,
    const int32_t* widx_dmap,
    const uint32_t* nidx_nnzmap,
    float* output,
    size_t output_stride,
    const struct xnn_f32_minmax_params* restrict params);
void test_rvv(
    size_t mc,
    size_t nc,
    const float* input,
    const float* weights,
    const int32_t* widx_dmap,
    const uint32_t* nidx_nnzmap,
    float* output,
    size_t output_stride,
    const struct xnn_f32_minmax_params* restrict params);
/* Contiguous row strips, output_stride=(m+4)*4. Sparse deltas are bytes;
   conservative cursor+prefetch readability includes every executed cursor.
   No requirement that delta sum vanish. All floating values allowed. */
/*@ logic integer prefix_nnz{L}(uint32_t *p,integer n)=n<=0?0:prefix_nnz(p,n-1)+p[n-1];
    logic integer prefix_diff{L}(int32_t *p,integer n)=n<=0?0:prefix_diff(p,n-1)+p[n-1];
*/
/*@ requires m: 0<m<=SIZE_MAX/64;
    requires nc: 0<nc<=SIZE_MAX/64;
    requires maps: \valid_read(nnz+(0..nc-1));
    requires map_extent: prefix_nnz(nnz,nc)<=SIZE_MAX/64;
    requires delta_map: \valid_read(dmap+(0..prefix_nnz(nnz,nc)-1));
    requires aligned_deltas: \forall integer j;0<=j<prefix_nnz(nnz,nc) ==> dmap[j]%4==0;
    requires weights: \valid_read(weights+(0..nc+prefix_nnz(nnz,nc)+31));
    requires output_extent: nc*(m+4)<=SIZE_MAX/8;
    requires left: \valid(left+(0..nc*(m+4)-1));
    requires right: \valid(right+(0..nc*(m+4)-1));
    requires metadata_outputs: \separated(nnz+(0..nc-1),dmap+(0..prefix_nnz(nnz,nc)-1),weights+(0..nc+prefix_nnz(nnz,nc)+31),left+(0..nc*(m+4)-1),right+(0..nc*(m+4)-1));
    requires cursor_memory: \forall integer strip,j;0<=strip<=m && 0<=j<=prefix_nnz(nnz,nc) ==> \valid_read(input+((strip*prefix_diff(dmap,prefix_nnz(nnz,nc))+prefix_diff(dmap,j))/4)+(0..m+16));
    requires cursor_outputs: \forall integer strip,j;0<=strip<=m && 0<=j<=prefix_nnz(nnz,nc) ==> \separated(input+((strip*prefix_diff(dmap,prefix_nnz(nnz,nc))+prefix_diff(dmap,j))/4)+(0..m+16),left+(0..nc*(m+4)-1),right+(0..nc*(m+4)-1));
    terminates \true;
    assigns left[0..nc*(m+4)-1],right[0..nc*(m+4)-1],errno;
    ensures equal: \result==1;
*/
int equivalent(size_t m,size_t nc,const float *input,const float *weights,const int32_t *dmap,const uint32_t *nnz,float *left,float *right,float lower,float upper);
#endif
