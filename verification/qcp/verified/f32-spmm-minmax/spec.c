/* Public contract under the declared source-reviewed intrinsic model.
 * This candidate is not yet a complete kernel proof. Canonical modeled values
 * imply the published numeric-or-both-NaN observation; not payload identity.
 */
#include "contracts/bindings.h"

void test_neon(size_t mc, size_t nc, const float* input, const float* weights,
    const int32_t* widx_dmap, const uint32_t* nidx_nnzmap,
    float* output, size_t output_stride,
    const struct xnn_f32_minmax_params* restrict params)
/*@ With (rows:Z) (start:Z) (a:Z) (NN:list Z) (D:list Z) (A:list fp32) (W:list fp32) (lo:fp32) (hi:fp32)
 Require mc == 4*rows && input == pointer_offset(a,start,float) && spmm_shape(rows,nc,start,NN,D,A,W) && spmm_capacity(rows,nc,output_stride,a,weights,widx_dmap,nidx_nnzmap,output,NN,D,A,W) &&
 FloatArray::full(a,Zlength(A),A) * FloatArray::full(weights,Zlength(W),W) *
 IntArray::full(widx_dmap,Zlength(D),D) * UIntArray::full(nidx_nnzmap,nc,NN) *
 store(&(params->scalar.min),float,lo) * store(&(params->scalar.max),float,hi) * spmm_output(output,rows,nc,output_stride,0,0,0,start,NN,D,A,W,lo,hi)
 Ensure FloatArray::full(a,Zlength(A),A) * FloatArray::full(weights,Zlength(W),W) *
 IntArray::full(widx_dmap,Zlength(D),D) * UIntArray::full(nidx_nnzmap,nc,NN) *
 store(&(params->scalar.min),float,lo) * store(&(params->scalar.max),float,hi) * spmm_output(output,rows,nc,output_stride,rows,0,0,start,NN,D,A,W,lo,hi) */;

void test_rvv(size_t mc, size_t nc, const float* input, const float* weights,
    const int32_t* widx_dmap, const uint32_t* nidx_nnzmap,
    float* output, size_t output_stride,
    const struct xnn_f32_minmax_params* restrict params)
/*@ With (rows:Z) (start:Z) (a:Z) (NN:list Z) (D:list Z) (A:list fp32) (W:list fp32) (lo:fp32) (hi:fp32)
 Require mc == 4*rows && input == pointer_offset(a,start,float) && spmm_shape(rows,nc,start,NN,D,A,W) && spmm_capacity(rows,nc,output_stride,a,weights,widx_dmap,nidx_nnzmap,output,NN,D,A,W) &&
 FloatArray::full(a,Zlength(A),A) * FloatArray::full(weights,Zlength(W),W) *
 IntArray::full(widx_dmap,Zlength(D),D) * UIntArray::full(nidx_nnzmap,nc,NN) *
 store(&(params->scalar.min),float,lo) * store(&(params->scalar.max),float,hi) * spmm_output(output,rows,nc,output_stride,0,0,0,start,NN,D,A,W,lo,hi)
 Ensure FloatArray::full(a,Zlength(A),A) * FloatArray::full(weights,Zlength(W),W) *
 IntArray::full(widx_dmap,Zlength(D),D) * UIntArray::full(nidx_nnzmap,nc,NN) *
 store(&(params->scalar.min),float,lo) * store(&(params->scalar.max),float,hi) * spmm_output(output,rows,nc,output_stride,rows,0,0,start,NN,D,A,W,lo,hi) */;

int equivalent(size_t mc, size_t nc, const float* input, const float* weights,
    const int32_t* widx_dmap, const uint32_t* nidx_nnzmap,
    float* output_neon, float* output_rvv, size_t output_stride,
    const struct xnn_f32_minmax_params* restrict params)
/*@ With (rows:Z) (start:Z) (a:Z) (NN:list Z) (D:list Z) (A:list fp32) (W:list fp32) (lo:fp32) (hi:fp32)
 Require mc == 4*rows && input == pointer_offset(a,start,float) && spmm_shape(rows,nc,start,NN,D,A,W) && spmm_capacity(rows,nc,output_stride,a,weights,widx_dmap,nidx_nnzmap,output_neon,NN,D,A,W) && spmm_capacity(rows,nc,output_stride,a,weights,widx_dmap,nidx_nnzmap,output_rvv,NN,D,A,W) &&
 FloatArray::full(a,Zlength(A),A) * FloatArray::full(weights,Zlength(W),W) *
 IntArray::full(widx_dmap,Zlength(D),D) * UIntArray::full(nidx_nnzmap,nc,NN) *
 store(&(params->scalar.min),float,lo) * store(&(params->scalar.max),float,hi) * spmm_output(output_neon,rows,nc,output_stride,0,0,0,start,NN,D,A,W,lo,hi) * spmm_output(output_rvv,rows,nc,output_stride,0,0,0,start,NN,D,A,W,lo,hi)
 Ensure __return == 1 &&
 FloatArray::full(a,Zlength(A),A) * FloatArray::full(weights,Zlength(W),W) *
 IntArray::full(widx_dmap,Zlength(D),D) * UIntArray::full(nidx_nnzmap,nc,NN) *
 store(&(params->scalar.min),float,lo) * store(&(params->scalar.max),float,hi) * spmm_output(output_neon,rows,nc,output_stride,rows,0,0,start,NN,D,A,W,lo,hi) * spmm_output(output_rvv,rows,nc,output_stride,rows,0,0,start,NN,D,A,W,lo,hi) */
{
 test_neon(mc,nc,input,weights,widx_dmap,nidx_nnzmap,output_neon,output_stride,params);
 test_rvv(mc,nc,input,weights,widx_dmap,nidx_nnzmap,output_rvv,output_stride,params);
 return 1;
}
