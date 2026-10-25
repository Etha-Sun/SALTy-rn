/* Public QS8 GEMM spec: exact signed-byte output; all binary32 bit patterns.
 * Both kernel proofs remain pending until complete typed fresh admission. */
#include "contracts/model.h"
void test_neon(size_t mr,size_t nc,size_t kc,const int8_t *a,size_t a_stride,const void *w,int8_t *c,size_t cm_stride,size_t cn_stride,const union xnn_qs8_qc8w_conv_minmax_params *params)
/*@ With (A:list Z) (Ps:list panel_data) (magic:fp32) (offset:Z) (lo:Z) (hi:Z)
 Require mr==1 && 0<nc && 0<kc && domain_shape(mr,nc,kc,Ps) && data_capacity(nc,kc,a,w,c) && cn_stride==8 && a!=0 && w!=0 && c!=0 && params!=0 && CharArray::full(a,a_read_extent(kc),A) * packed_matrix(kc,w,Ps) * CharArray::undef_full(c,nc) * store(&(params->fp32_neon.magic_bias),float,magic) * store(&(params->fp32_neon.magic_bias_less_output_zero_point),int,offset) * store(&(params->fp32_neon.output_min),char,lo) * store(&(params->fp32_neon.output_max),char,hi)
 Ensure CharArray::full(a@pre,a_read_extent(kc@pre),A) * packed_matrix(kc@pre,w@pre,Ps) * qs8_output_ref(c@pre,nc@pre,kc@pre,A,Ps,magic,offset,lo,hi) * store(&(params->fp32_neon.magic_bias),float,magic) * store(&(params->fp32_neon.magic_bias_less_output_zero_point),int,offset) * store(&(params->fp32_neon.output_min),char,lo) * store(&(params->fp32_neon.output_max),char,hi) */;

void test_rvv(size_t mr,size_t nc,size_t kc,const int8_t *a,size_t a_stride,const void *w,int8_t *c,size_t cm_stride,size_t cn_stride,const union xnn_qs8_qc8w_conv_minmax_params *params)
/*@ With (A:list Z) (Ps:list panel_data) (magic:fp32) (offset:Z) (lo:Z) (hi:Z)
 Require mr==1 && 0<nc && 0<kc && domain_shape(mr,nc,kc,Ps) && data_capacity(nc,kc,a,w,c) && cn_stride==8 && a!=0 && w!=0 && c!=0 && params!=0 && CharArray::full(a,a_read_extent(kc),A) * packed_matrix(kc,w,Ps) * CharArray::undef_full(c,nc) * store(&(params->fp32_neon.magic_bias),float,magic) * store(&(params->fp32_neon.magic_bias_less_output_zero_point),int,offset) * store(&(params->fp32_neon.output_min),char,lo) * store(&(params->fp32_neon.output_max),char,hi)
 Ensure CharArray::full(a@pre,a_read_extent(kc@pre),A) * packed_matrix(kc@pre,w@pre,Ps) * qs8_output_ref(c@pre,nc@pre,kc@pre,A,Ps,magic,offset,lo,hi) * store(&(params->fp32_neon.magic_bias),float,magic) * store(&(params->fp32_neon.magic_bias_less_output_zero_point),int,offset) * store(&(params->fp32_neon.output_min),char,lo) * store(&(params->fp32_neon.output_max),char,hi) */;

int qs8_compare_outputs(size_t n,const int8_t *left,const int8_t *right)
/*@ With (L:list Z)
 Require 0<n && n<=18446744073709551615 && CharArray::full(left,n,L) * CharArray::full(right,n,L)
 Ensure __return==1 && CharArray::full(left,n,L) * CharArray::full(right,n,L) */
{
 size_t i=0;
 /*@ Inv n==n@pre && left==left@pre && right==right@pre && 0<n && n<=18446744073709551615 && 0<=i && i<=n && CharArray::full(left,n,L) * CharArray::full(right,n,L) */
 while(i<n) {
  /*@ 0<=i && i<n && CharArray::full(left,n,L) * CharArray::full(right,n,L)
    which implies 0<=i && i<n && CharArray::missing_i(left,i,0,n,L) * store(left+i,char,L[i]) * CharArray::missing_i(right,i,0,n,L) * store(right+i,char,L[i]) */
  int8_t x=left[i];
  int8_t y=right[i];
  /*@ 0<=i && i<n && CharArray::missing_i(left,i,0,n,L) * store(left+i,char,L[i]) * CharArray::missing_i(right,i,0,n,L) * store(right+i,char,L[i])
    which implies 0<=i && i<n && CharArray::full(left,n,L) * CharArray::full(right,n,L) */
  if(x!=y)return 0;
  i++;
 }
 return 1;
}
int equivalent(size_t mr,size_t nc,size_t kc,const int8_t *a,const void *w,int8_t *left,int8_t *right,const union xnn_qs8_qc8w_conv_minmax_params *params)
/*@ With (A:list Z) (Ps:list panel_data) (magic:fp32) (offset:Z) (lo:Z) (hi:Z)
 Require mr==1 && 0<nc && 0<kc && domain_shape(mr,nc,kc,Ps) && data_capacity(nc,kc,a,w,left) && data_capacity(nc,kc,a,w,right) && a!=0 && w!=0 && left!=0 && right!=0 && params!=0 && CharArray::full(a,a_read_extent(kc),A) * packed_matrix(kc,w,Ps) * CharArray::undef_full(left,nc) * CharArray::undef_full(right,nc) * store(&(params->fp32_neon.magic_bias),float,magic) * store(&(params->fp32_neon.magic_bias_less_output_zero_point),int,offset) * store(&(params->fp32_neon.output_min),char,lo) * store(&(params->fp32_neon.output_max),char,hi)
 Ensure exists (L:list Z), __return==1 && CharArray::full(a,a_read_extent(kc),A) * packed_matrix(kc,w,Ps) * CharArray::full(left,nc,L) * CharArray::full(right,nc,L) * store(&(params->fp32_neon.magic_bias),float,magic) * store(&(params->fp32_neon.magic_bias_less_output_zero_point),int,offset) * store(&(params->fp32_neon.output_min),char,lo) * store(&(params->fp32_neon.output_max),char,hi) */
{
 test_neon(mr,nc,kc,a,0,w,left,0,8,params);
 test_rvv(mr,nc,kc,a,0,w,right,0,8,params);
 /*@ 0<kc && qs8_output_ref(left,nc,kc,A,Ps,magic,offset,lo,hi) * qs8_output_ref(right,nc,kc,A,Ps,magic,offset,lo,hi) which implies exists (L:list Z), 0<kc && CharArray::full(left,nc,L) * CharArray::full(right,nc,L) */
 return qs8_compare_outputs(nc,left,right);
}
