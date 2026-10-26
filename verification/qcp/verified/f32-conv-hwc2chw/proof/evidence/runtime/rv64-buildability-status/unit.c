#include <stddef.h>
#include <stdint.h>
#define assert(x) ((void)0)
#define XNN_OOB_READS
#define XNN_UNPREDICTABLE(x) (x)
#define XNN_UNLIKELY(x) (x)
#define XNN_LIKELY(x) (x)
#define round_down_po2(n,q) hc_round_down4(n)
#define doz hc_doz
struct xnn_f32_minmax_params {struct {float min,max;}scalar;};
#include <riscv_vector.h>
void test_neon(size_t,size_t,size_t,size_t,const float*,const float*,const float*,float*,size_t,size_t,size_t,size_t,const struct xnn_f32_minmax_params*);
void test_rvv(size_t,size_t,size_t,size_t,const float*,const float*,const float*,float*,size_t,size_t,size_t,size_t,const struct xnn_f32_minmax_params*);


#line 1 "/srv/home/yuechunsun/tools/qcp-simple-kernels/verification/qcp/candidates/f32-conv-hwc2chw/.build/hwc-whole-integration/case/shim/support.c"
size_t hc_round_down4(size_t n){return n & ~(size_t)3;}
size_t hc_doz(size_t a,size_t b){return a>b?a-b:0;}


#line 1 "/srv/home/yuechunsun/tools/qcp-simple-kernels/verification/qcp/candidates/f32-conv-hwc2chw/.build/hwc-whole-integration/case/shim/copy_float.c"
float hc_copy_float(float x)
/*@ Require emp Ensure hc_same_bits(__return,x) && emp */
{ return x; }


#line 1 "/srv/home/yuechunsun/tools/qcp-simple-kernels/verification/qcp/candidates/f32-conv-hwc2chw/.build/hwc-whole-integration/case/shim/nan_helpers.c"
vfloat32m1_t hc_min_f32m1(const vfloat32m1_t *pa,float b,size_t vl)
/*@ With (A:Recordvfloat32m1_t) Require 0<=vl && vl<=4 && StructPredvfloat32m1_t(pa,A) Ensure exists(R:Recordvfloat32m1_t),hc_clamp_min(R,A,b,vl) && (StructPredvfloat32m1_t(pa,A) * StructPredvfloat32m1_t(&__return,R)) */
{
  vfloat32m1_t a=*pa;
  vuint32m1_t qbits=__riscv_vmv_v_x_u32m1(0x7FC00000u,vl);
  vfloat32m1_t qnan=__riscv_vreinterpret_v_u32m1_f32m1(qbits);
  float bc=hc_copy_float(b);
  if (b!=bc) return qnan;
  vbool32_t nan=__riscv_vmfne_vv_f32m1_b32(a,a,vl);
  vfloat32m1_t r=__riscv_vfmin_vf_f32m1(a,b,vl);
  return __riscv_vmerge_vvm_f32m1(r,qnan,nan,vl);
}
vfloat32m1_t hc_max_f32m1(const vfloat32m1_t *pa,float b,size_t vl)
/*@ With (A:Recordvfloat32m1_t) Require 0<=vl && vl<=4 && StructPredvfloat32m1_t(pa,A) Ensure exists(R:Recordvfloat32m1_t),hc_clamp_max(R,A,b,vl) && (StructPredvfloat32m1_t(pa,A) * StructPredvfloat32m1_t(&__return,R)) */
{
  vfloat32m1_t a=*pa;
  vuint32m1_t qbits=__riscv_vmv_v_x_u32m1(0x7FC00000u,vl);
  vfloat32m1_t qnan=__riscv_vreinterpret_v_u32m1_f32m1(qbits);
  float bc=hc_copy_float(b);
  if (b!=bc) return qnan;
  vbool32_t nan=__riscv_vmfne_vv_f32m1_b32(a,a,vl);
  vfloat32m1_t r=__riscv_vfmax_vf_f32m1(a,b,vl);
  return __riscv_vmerge_vvm_f32m1(r,qnan,nan,vl);
}


#line 1 "/srv/home/yuechunsun/tools/qcp-simple-kernels/verification/qcp/candidates/f32-conv-hwc2chw/.build/hwc-whole-integration/case/shim/read_scalar.c"
float hc_read_scalar(const float *p)
/*@ With (F:HwcROMap) Require hc_present(F,p) && hc_data(F)
 Ensure hc_same_bits(__return,hc_get(F,p)) && hc_data(F) */
{ return *p; }


#line 1 "/srv/home/yuechunsun/tools/qcp-simple-kernels/verification/qcp/candidates/f32-conv-hwc2chw/.build/hwc-whole-integration/case/shim/rvv_rows_fma3.c"
vfloat32m1_t hc_rvv_rows_fma3(const vfloat32m1_t *pa,const float *p0,const float *p1,const float *p2,const float *w,size_t width,size_t x,unsigned int dx,unsigned int ci,unsigned int lane,size_t vl)
/*@ With(F:HwcROMap) (A:Recordvfloat32m1_t) Require 0<width && 0<=x && x<(width+1)/2 && 0<=dx && dx<3 && 0<=ci && ci<3 && 0<=lane && lane<4 && 0<=vl && vl<=4 && vl<=(width+1)/2-x && hc_footprint(p0,3*width+3) && hc_footprint(p1,3*width+3) && hc_footprint(p2,3*width+3) && hc_footprint(w,112) && hc_window(F,p0,3*width+3) && hc_window(F,p1,3*width+3) && hc_window(F,p2,3*width+3) && hc_window(F,w,112) && (hc_data(F)*StructPredvfloat32m1_t(pa,A)) Ensure exists(R:Recordvfloat32m1_t),hc_rvv_rows_group(R,A,F,p0,p1,p2,w,width,x,dx,ci,lane,vl) && (hc_data(F)*StructPredvfloat32m1_t(pa,A)*StructPredvfloat32m1_t(&__return,R)) */
{
 vfloat32m1_t a=*pa;
 vfloat32m1_t z=__riscv_vfmv_v_f_f32m1(0.0f,vl);
 vuint32m1_t id=__riscv_vid_v_u32m1(vl);
 unsigned int start=(dx==0 && x==0)?1u:0u;
 unsigned int end=(unsigned int)vl;
 if(dx==2 && (width&1u)!=0 && (width+1)/2-x==vl)end-=1u;
 vbool32_t ge=__riscv_vmsgeu_vx_u32m1_b32(id,start,vl);
 vbool32_t lt=__riscv_vmsltu_vx_u32m1_b32(id,end,vl);
 vbool32_t m=__riscv_vmand_mm_b32(ge,lt,vl);
 uintptr_t off=x*24u+(dx*3u+ci)*4u;
 {
  vfloat32m1_t ld=__riscv_vlse32_v_f32m1_m(m,(const float*)((uintptr_t)p0-12u+off),24,vl) /*@ where F=F */;
  vfloat32m1_t v=__riscv_vmerge_vvm_f32m1(z,ld,m,vl);
  float wk=hc_read_scalar(w+4u+(dx*9u+ci*3u+0u)*4u+lane) /*@ where F=F */;
  if(dx==2)a=__riscv_vfmacc_vf_f32m1_mu(m,a,wk,v,vl);
  else a=__riscv_vfmacc_vf_f32m1(a,wk,v,vl);
 }
 {
  vfloat32m1_t ld=__riscv_vlse32_v_f32m1_m(m,(const float*)((uintptr_t)p1-12u+off),24,vl) /*@ where F=F */;
  vfloat32m1_t v=__riscv_vmerge_vvm_f32m1(z,ld,m,vl);
  float wk=hc_read_scalar(w+4u+(dx*9u+ci*3u+1u)*4u+lane) /*@ where F=F */;
  if(dx==2)a=__riscv_vfmacc_vf_f32m1_mu(m,a,wk,v,vl);
  else a=__riscv_vfmacc_vf_f32m1(a,wk,v,vl);
 }
 {
  vfloat32m1_t ld=__riscv_vlse32_v_f32m1_m(m,(const float*)((uintptr_t)p2-12u+off),24,vl) /*@ where F=F */;
  vfloat32m1_t v=__riscv_vmerge_vvm_f32m1(z,ld,m,vl);
  float wk=hc_read_scalar(w+4u+(dx*9u+ci*3u+2u)*4u+lane) /*@ where F=F */;
  if(dx==2)a=__riscv_vfmacc_vf_f32m1_mu(m,a,wk,v,vl);
  else a=__riscv_vfmacc_vf_f32m1(a,wk,v,vl);
 }
 return a;
}


#line 1 "/srv/home/yuechunsun/tools/qcp-simple-kernels/verification/qcp/candidates/f32-conv-hwc2chw/.build/hwc-whole-integration/case/shim/hc_rvv_pixel9.c"
/* UNVERIFIED SOURCE DRAFT. Not part of the public implementation. */
vfloat32m1_t hc_rvv_pixel9_raw(const float *p0,const float *p1,const float *p2,const float *w,size_t width,size_t x,unsigned int lane,size_t vl)
/*@ With(F:HwcROMap) Require 0<width && 0<=x && x<(width+1)/2 && 0<=lane && lane<4 && 0<=vl && vl<=4 && vl<=(width+1)/2-x && hc_footprint(p0,3*width+3) && hc_footprint(p1,3*width+3) && hc_footprint(p2,3*width+3) && hc_footprint(w,112) && hc_window(F,p0,3*width+3) && hc_window(F,p1,3*width+3) && hc_window(F,p2,3*width+3) && hc_window(F,w,112) && hc_data(F) Ensure exists(R:Recordvfloat32m1_t),hc_rvv_pixel9_prefix(R,F,p0,p1,p2,w,width,x,lane,9,vl) && (hc_data(F)*StructPredvfloat32m1_t(&__return,R)) */
{
 float bias=hc_read_scalar(w+lane) /*@ where F=F */;
 vfloat32m1_t a=__riscv_vfmv_v_f_f32m1(bias,vl);
 /*@ Assert exists(A:Recordvfloat32m1_t),p0==p0@pre && p1==p1@pre && p2==p2@pre && w==w@pre && width==width@pre && x==x@pre && lane==lane@pre && vl==vl@pre && 0<width && 0<=x && x<(width+1)/2 && 0<=lane && lane<4 && 0<=vl && vl<=4 && vl<=(width+1)/2-x && hc_footprint(p0,3*width+3) && hc_footprint(p1,3*width+3) && hc_footprint(p2,3*width+3) && hc_footprint(w,112) && hc_window(F,p0,3*width+3) && hc_window(F,p1,3*width+3) && hc_window(F,p2,3*width+3) && hc_window(F,w,112) && hc_same_bits(bias,hc_rvv_pixel9_bias(F,w,lane)) && hc_rvv_pixel9_prefix(A,F,p0,p1,p2,w,width,x,lane,0,vl) && (hc_data(F)*StructPredvfloat32m1_t(&a,A)) */
 a=hc_rvv_rows_fma3(&a,p0,p1,p2,w,width,x,0u,0u,lane,vl) /*@ where F=F */;
 /*@ Assert exists(A:Recordvfloat32m1_t),p0==p0@pre && p1==p1@pre && p2==p2@pre && w==w@pre && width==width@pre && x==x@pre && lane==lane@pre && vl==vl@pre && 0<width && 0<=x && x<(width+1)/2 && 0<=lane && lane<4 && 0<=vl && vl<=4 && vl<=(width+1)/2-x && hc_footprint(p0,3*width+3) && hc_footprint(p1,3*width+3) && hc_footprint(p2,3*width+3) && hc_footprint(w,112) && hc_window(F,p0,3*width+3) && hc_window(F,p1,3*width+3) && hc_window(F,p2,3*width+3) && hc_window(F,w,112) && hc_same_bits(bias,hc_rvv_pixel9_bias(F,w,lane)) && hc_rvv_pixel9_prefix(A,F,p0,p1,p2,w,width,x,lane,1,vl) && (hc_data(F)*StructPredvfloat32m1_t(&a,A)) */
 a=hc_rvv_rows_fma3(&a,p0,p1,p2,w,width,x,0u,1u,lane,vl) /*@ where F=F */;
 /*@ Assert exists(A:Recordvfloat32m1_t),p0==p0@pre && p1==p1@pre && p2==p2@pre && w==w@pre && width==width@pre && x==x@pre && lane==lane@pre && vl==vl@pre && 0<width && 0<=x && x<(width+1)/2 && 0<=lane && lane<4 && 0<=vl && vl<=4 && vl<=(width+1)/2-x && hc_footprint(p0,3*width+3) && hc_footprint(p1,3*width+3) && hc_footprint(p2,3*width+3) && hc_footprint(w,112) && hc_window(F,p0,3*width+3) && hc_window(F,p1,3*width+3) && hc_window(F,p2,3*width+3) && hc_window(F,w,112) && hc_same_bits(bias,hc_rvv_pixel9_bias(F,w,lane)) && hc_rvv_pixel9_prefix(A,F,p0,p1,p2,w,width,x,lane,2,vl) && (hc_data(F)*StructPredvfloat32m1_t(&a,A)) */
 a=hc_rvv_rows_fma3(&a,p0,p1,p2,w,width,x,0u,2u,lane,vl) /*@ where F=F */;
 /*@ Assert exists(A:Recordvfloat32m1_t),p0==p0@pre && p1==p1@pre && p2==p2@pre && w==w@pre && width==width@pre && x==x@pre && lane==lane@pre && vl==vl@pre && 0<width && 0<=x && x<(width+1)/2 && 0<=lane && lane<4 && 0<=vl && vl<=4 && vl<=(width+1)/2-x && hc_footprint(p0,3*width+3) && hc_footprint(p1,3*width+3) && hc_footprint(p2,3*width+3) && hc_footprint(w,112) && hc_window(F,p0,3*width+3) && hc_window(F,p1,3*width+3) && hc_window(F,p2,3*width+3) && hc_window(F,w,112) && hc_same_bits(bias,hc_rvv_pixel9_bias(F,w,lane)) && hc_rvv_pixel9_prefix(A,F,p0,p1,p2,w,width,x,lane,3,vl) && (hc_data(F)*StructPredvfloat32m1_t(&a,A)) */
 a=hc_rvv_rows_fma3(&a,p0,p1,p2,w,width,x,1u,0u,lane,vl) /*@ where F=F */;
 /*@ Assert exists(A:Recordvfloat32m1_t),p0==p0@pre && p1==p1@pre && p2==p2@pre && w==w@pre && width==width@pre && x==x@pre && lane==lane@pre && vl==vl@pre && 0<width && 0<=x && x<(width+1)/2 && 0<=lane && lane<4 && 0<=vl && vl<=4 && vl<=(width+1)/2-x && hc_footprint(p0,3*width+3) && hc_footprint(p1,3*width+3) && hc_footprint(p2,3*width+3) && hc_footprint(w,112) && hc_window(F,p0,3*width+3) && hc_window(F,p1,3*width+3) && hc_window(F,p2,3*width+3) && hc_window(F,w,112) && hc_same_bits(bias,hc_rvv_pixel9_bias(F,w,lane)) && hc_rvv_pixel9_prefix(A,F,p0,p1,p2,w,width,x,lane,4,vl) && (hc_data(F)*StructPredvfloat32m1_t(&a,A)) */
 a=hc_rvv_rows_fma3(&a,p0,p1,p2,w,width,x,1u,1u,lane,vl) /*@ where F=F */;
 /*@ Assert exists(A:Recordvfloat32m1_t),p0==p0@pre && p1==p1@pre && p2==p2@pre && w==w@pre && width==width@pre && x==x@pre && lane==lane@pre && vl==vl@pre && 0<width && 0<=x && x<(width+1)/2 && 0<=lane && lane<4 && 0<=vl && vl<=4 && vl<=(width+1)/2-x && hc_footprint(p0,3*width+3) && hc_footprint(p1,3*width+3) && hc_footprint(p2,3*width+3) && hc_footprint(w,112) && hc_window(F,p0,3*width+3) && hc_window(F,p1,3*width+3) && hc_window(F,p2,3*width+3) && hc_window(F,w,112) && hc_same_bits(bias,hc_rvv_pixel9_bias(F,w,lane)) && hc_rvv_pixel9_prefix(A,F,p0,p1,p2,w,width,x,lane,5,vl) && (hc_data(F)*StructPredvfloat32m1_t(&a,A)) */
 a=hc_rvv_rows_fma3(&a,p0,p1,p2,w,width,x,1u,2u,lane,vl) /*@ where F=F */;
 /*@ Assert exists(A:Recordvfloat32m1_t),p0==p0@pre && p1==p1@pre && p2==p2@pre && w==w@pre && width==width@pre && x==x@pre && lane==lane@pre && vl==vl@pre && 0<width && 0<=x && x<(width+1)/2 && 0<=lane && lane<4 && 0<=vl && vl<=4 && vl<=(width+1)/2-x && hc_footprint(p0,3*width+3) && hc_footprint(p1,3*width+3) && hc_footprint(p2,3*width+3) && hc_footprint(w,112) && hc_window(F,p0,3*width+3) && hc_window(F,p1,3*width+3) && hc_window(F,p2,3*width+3) && hc_window(F,w,112) && hc_same_bits(bias,hc_rvv_pixel9_bias(F,w,lane)) && hc_rvv_pixel9_prefix(A,F,p0,p1,p2,w,width,x,lane,6,vl) && (hc_data(F)*StructPredvfloat32m1_t(&a,A)) */
 a=hc_rvv_rows_fma3(&a,p0,p1,p2,w,width,x,2u,0u,lane,vl) /*@ where F=F */;
 /*@ Assert exists(A:Recordvfloat32m1_t),p0==p0@pre && p1==p1@pre && p2==p2@pre && w==w@pre && width==width@pre && x==x@pre && lane==lane@pre && vl==vl@pre && 0<width && 0<=x && x<(width+1)/2 && 0<=lane && lane<4 && 0<=vl && vl<=4 && vl<=(width+1)/2-x && hc_footprint(p0,3*width+3) && hc_footprint(p1,3*width+3) && hc_footprint(p2,3*width+3) && hc_footprint(w,112) && hc_window(F,p0,3*width+3) && hc_window(F,p1,3*width+3) && hc_window(F,p2,3*width+3) && hc_window(F,w,112) && hc_same_bits(bias,hc_rvv_pixel9_bias(F,w,lane)) && hc_rvv_pixel9_prefix(A,F,p0,p1,p2,w,width,x,lane,7,vl) && (hc_data(F)*StructPredvfloat32m1_t(&a,A)) */
 a=hc_rvv_rows_fma3(&a,p0,p1,p2,w,width,x,2u,1u,lane,vl) /*@ where F=F */;
 /*@ Assert exists(A:Recordvfloat32m1_t),p0==p0@pre && p1==p1@pre && p2==p2@pre && w==w@pre && width==width@pre && x==x@pre && lane==lane@pre && vl==vl@pre && 0<width && 0<=x && x<(width+1)/2 && 0<=lane && lane<4 && 0<=vl && vl<=4 && vl<=(width+1)/2-x && hc_footprint(p0,3*width+3) && hc_footprint(p1,3*width+3) && hc_footprint(p2,3*width+3) && hc_footprint(w,112) && hc_window(F,p0,3*width+3) && hc_window(F,p1,3*width+3) && hc_window(F,p2,3*width+3) && hc_window(F,w,112) && hc_same_bits(bias,hc_rvv_pixel9_bias(F,w,lane)) && hc_rvv_pixel9_prefix(A,F,p0,p1,p2,w,width,x,lane,8,vl) && (hc_data(F)*StructPredvfloat32m1_t(&a,A)) */
 a=hc_rvv_rows_fma3(&a,p0,p1,p2,w,width,x,2u,2u,lane,vl) /*@ where F=F */;
 /*@ Assert exists(A:Recordvfloat32m1_t),p0==p0@pre && p1==p1@pre && p2==p2@pre && w==w@pre && width==width@pre && x==x@pre && lane==lane@pre && vl==vl@pre && 0<width && 0<=x && x<(width+1)/2 && 0<=lane && lane<4 && 0<=vl && vl<=4 && vl<=(width+1)/2-x && hc_footprint(p0,3*width+3) && hc_footprint(p1,3*width+3) && hc_footprint(p2,3*width+3) && hc_footprint(w,112) && hc_window(F,p0,3*width+3) && hc_window(F,p1,3*width+3) && hc_window(F,p2,3*width+3) && hc_window(F,w,112) && hc_same_bits(bias,hc_rvv_pixel9_bias(F,w,lane)) && hc_rvv_pixel9_prefix(A,F,p0,p1,p2,w,width,x,lane,9,vl) && (hc_data(F)*StructPredvfloat32m1_t(&a,A)) */
 return a;
}


#line 1 "/srv/home/yuechunsun/tools/qcp-simple-kernels/verification/qcp/candidates/f32-conv-hwc2chw/.build/hwc-whole-integration/case/impl/testRVV.c"
void test_rvv(
    size_t input_height,
    size_t input_width,
    size_t output_y_start,
    size_t output_y_end,
    const float* input,
    const float* zero,
    const float* weights,
    float* output,
    size_t input_padding_top,
    size_t output_channels,
    size_t output_height_stride,
    size_t output_channel_stride,
    const struct xnn_f32_minmax_params* restrict params) XNN_OOB_READS
{
  assert(input_width != 0);
  assert(output_y_end > output_y_start);
  assert(input_padding_top <= 1);
  assert(output_channels != 0);

  const size_t input_height_stride = input_width * 3 /* channels */ * sizeof(float);
  const size_t output_width = (input_width + 1) / 2;
  const size_t output_channel_increment = output_channel_stride * 4 - output_width * sizeof(float);

  // Adjustment for padding processed below
  const float* i0 = (const float*) ((uintptr_t) input + input_height_stride * (output_y_start * 2 - input_padding_top));
  const float* i1 = (const float*) ((uintptr_t) i0 + input_height_stride);
  const float* i2 = (const float*) ((uintptr_t) i1 + input_height_stride);
  const float* i3 = (const float*) ((uintptr_t) i2 + input_height_stride);
  const float* i4 = (const float*) ((uintptr_t) i3 + input_height_stride);
  float* output0 = (float*) ((uintptr_t) output + output_height_stride * output_y_start);
  float* output1 = (float*) ((uintptr_t) output0 + output_height_stride);

  if XNN_UNPREDICTABLE(output_y_start < input_padding_top) {
    i0 = zero;
  }

  for (size_t output_y = output_y_start; output_y < output_y_end; output_y += 2) {
    const size_t input_y2 = output_y * 2 + 2 - input_padding_top;
    const size_t input_y4 = input_y2 + 2;
    if XNN_UNPREDICTABLE(input_y2 >= input_height) {
      i2 = zero;
    }
    if XNN_UNPREDICTABLE(input_y4 > input_height) {
      i3 = zero;
    }
    if XNN_UNPREDICTABLE(input_y4 >= input_height) {
      i4 = zero;
    }
    if XNN_UNPREDICTABLE(output_y + 2 > output_y_end) {
      output1 = output0;
    }

    const float* w = weights;
    size_t c = output_channels;
    float* o0c0 = output0;
    float* o1c0 = output1;
    float* o0c1 = (float*) ((uintptr_t) o0c0 + output_channel_stride);
    float* o1c1 = (float*) ((uintptr_t) o1c0 + output_channel_stride);
    float* o0c2 = (float*) ((uintptr_t) o0c1 + output_channel_stride);
    float* o1c2 = (float*) ((uintptr_t) o1c1 + output_channel_stride);
    float* o0c3 = (float*) ((uintptr_t) o0c2 + output_channel_stride);
    float* o1c3 = (float*) ((uintptr_t) o1c2 + output_channel_stride);
    do {
      if XNN_UNPREDICTABLE(c < 2) {
        o0c1 = o0c0;
        o1c1 = o1c0;
      }
      if XNN_UNPREDICTABLE(c <= 2) {
        o0c2 = o0c1;
        o1c2 = o1c1;
      }
      if XNN_UNPREDICTABLE(c < 4) {
        o0c3 = o0c2;
        o1c3 = o1c2;
      }

      size_t ow = output_width;
      size_t ow_done = 0;
      
      float* current_o0c0 = o0c0;
      float* current_o0c1 = o0c1;
      float* current_o0c2 = o0c2;
      float* current_o0c3 = o0c3;
      float* current_o1c0 = o1c0;
      float* current_o1c1 = o1c1;
      float* current_o1c2 = o1c2;
      float* current_o1c3 = o1c3;

      while (ow > 0) {
        size_t vl = __riscv_vsetvl_e32m1(ow);
        vfloat32m1_t v_o0c0 = hc_rvv_pixel9_raw(i0,i1,i2,w,input_width,ow_done,0u,vl);
        vfloat32m1_t v_o0c1 = hc_rvv_pixel9_raw(i0,i1,i2,w,input_width,ow_done,1u,vl);
        vfloat32m1_t v_o0c2 = hc_rvv_pixel9_raw(i0,i1,i2,w,input_width,ow_done,2u,vl);
        vfloat32m1_t v_o0c3 = hc_rvv_pixel9_raw(i0,i1,i2,w,input_width,ow_done,3u,vl);
        vfloat32m1_t v_o1c0 = hc_rvv_pixel9_raw(i2,i3,i4,w,input_width,ow_done,0u,vl);
        vfloat32m1_t v_o1c1 = hc_rvv_pixel9_raw(i2,i3,i4,w,input_width,ow_done,1u,vl);
        vfloat32m1_t v_o1c2 = hc_rvv_pixel9_raw(i2,i3,i4,w,input_width,ow_done,2u,vl);
        vfloat32m1_t v_o1c3 = hc_rvv_pixel9_raw(i2,i3,i4,w,input_width,ow_done,3u,vl);

        v_o0c0 = hc_max_f32m1(&v_o0c0, hc_read_scalar(&(params->scalar.min)), vl);
        v_o0c1 = hc_max_f32m1(&v_o0c1, hc_read_scalar(&(params->scalar.min)), vl);
        v_o0c2 = hc_max_f32m1(&v_o0c2, hc_read_scalar(&(params->scalar.min)), vl);
        v_o0c3 = hc_max_f32m1(&v_o0c3, hc_read_scalar(&(params->scalar.min)), vl);

        v_o1c0 = hc_max_f32m1(&v_o1c0, hc_read_scalar(&(params->scalar.min)), vl);
        v_o1c1 = hc_max_f32m1(&v_o1c1, hc_read_scalar(&(params->scalar.min)), vl);
        v_o1c2 = hc_max_f32m1(&v_o1c2, hc_read_scalar(&(params->scalar.min)), vl);
        v_o1c3 = hc_max_f32m1(&v_o1c3, hc_read_scalar(&(params->scalar.min)), vl);

        v_o0c0 = hc_min_f32m1(&v_o0c0, hc_read_scalar(&(params->scalar.max)), vl);
        v_o0c1 = hc_min_f32m1(&v_o0c1, hc_read_scalar(&(params->scalar.max)), vl);
        v_o0c2 = hc_min_f32m1(&v_o0c2, hc_read_scalar(&(params->scalar.max)), vl);
        v_o0c3 = hc_min_f32m1(&v_o0c3, hc_read_scalar(&(params->scalar.max)), vl);
        v_o1c0 = hc_min_f32m1(&v_o1c0, hc_read_scalar(&(params->scalar.max)), vl);
        v_o1c1 = hc_min_f32m1(&v_o1c1, hc_read_scalar(&(params->scalar.max)), vl);
        v_o1c2 = hc_min_f32m1(&v_o1c2, hc_read_scalar(&(params->scalar.max)), vl);
        v_o1c3 = hc_min_f32m1(&v_o1c3, hc_read_scalar(&(params->scalar.max)), vl);

        // Store row 1 BEFORE row 0: when there is a single output row the caller
        // aliases output1==output0, so the LAST store must be the valid row 0
        // (matches the NEON gold; storing o0 last fixes the row-1-overwrites-row-0 bug).
        __riscv_vse32_v_f32m1(current_o1c0, v_o1c0, vl); current_o1c0 += vl;
        __riscv_vse32_v_f32m1(current_o1c1, v_o1c1, vl); current_o1c1 += vl;
        __riscv_vse32_v_f32m1(current_o1c2, v_o1c2, vl); current_o1c2 += vl;
        __riscv_vse32_v_f32m1(current_o1c3, v_o1c3, vl); current_o1c3 += vl;

        __riscv_vse32_v_f32m1(current_o0c0, v_o0c0, vl); current_o0c0 += vl;
        __riscv_vse32_v_f32m1(current_o0c1, v_o0c1, vl); current_o0c1 += vl;
        __riscv_vse32_v_f32m1(current_o0c2, v_o0c2, vl); current_o0c2 += vl;
        __riscv_vse32_v_f32m1(current_o0c3, v_o0c3, vl); current_o0c3 += vl;

        ow -= vl;
        ow_done += vl;
      }

      o0c0 = (float*) ((uintptr_t) current_o0c0 + output_channel_increment);
      o0c1 = (float*) ((uintptr_t) current_o0c1 + output_channel_increment);
      o0c2 = (float*) ((uintptr_t) current_o0c2 + output_channel_increment);
      o0c3 = (float*) ((uintptr_t) current_o0c3 + output_channel_increment);
      o1c0 = (float*) ((uintptr_t) current_o1c0 + output_channel_increment);
      o1c1 = (float*) ((uintptr_t) current_o1c1 + output_channel_increment);
      o1c2 = (float*) ((uintptr_t) current_o1c2 + output_channel_increment);
      o1c3 = (float*) ((uintptr_t) current_o1c3 + output_channel_increment);

      w += 112;
      c = (c > 4) ? c - 4 : 0;
    } while (c != 0);

    output0 = (float*) ((uintptr_t) output1 + output_height_stride);
    output1 = (float*) ((uintptr_t) output0 + output_height_stride);

    i0 = i4;
    i1 = (const float*) ((uintptr_t) i0 + input_height_stride);
    i2 = (const float*) ((uintptr_t) i1 + input_height_stride);
    i3 = (const float*) ((uintptr_t) i2 + input_height_stride);
    i4 = (const float*) ((uintptr_t) i3 + input_height_stride);
  }
}


#line 1 "/srv/home/yuechunsun/tools/qcp-simple-kernels/verification/qcp/candidates/f32-conv-hwc2chw/.build/hwc-whole-integration/case/spec.c"
#ifdef HWC_FORMAL
#else
struct xnn_f32_minmax_params;
#ifndef XNN_OOB_READS
#define XNN_OOB_READS
#endif
#endif
/*@ Import Coq Import HwcConv.HwcPublicObservationModel */
/*@ Extern Coq (hwp_state_observe:HwcOutput->HwcOutput->Prop) (hwp_unwritten_frame:HwcOutput->HwcOutput->Z->Z->Z->Z->Z->Z->Z->Prop) */
void test_neon(
    size_t input_height,
    size_t input_width,
    size_t output_y_start,
    size_t output_y_end,
    const float* input,
    const float* zero,
    const float* weights,
    float* output,
    size_t input_padding_top,
    size_t output_channels,
    size_t output_height_stride,
    size_t output_channel_stride,
    const struct xnn_f32_minmax_params* restrict params) XNN_OOB_READS
/*@ With (F:HwcROMap) (O:HwcOutput) (W:list Z) (H:Z) (N:Z) (Top:Z) (Start:Z) (End:Z) (Input:Z) (Zero:Z) (Weights:Z) (Output:Z) (Params:Z) (Cn:Z) (Hs:Z) (Cs:Z) (Lo:fp32) (Hi:fp32) Require (input_height==H) && (input_width==N) && (input_padding_top==Top) && (output_y_start==Start) && (output_y_end==End) && (input==Input) && (zero==Zero) && (weights==Weights) && (output==Output) && (params==Params) && (output_channels==Cn) && (output_height_stride==Hs) && (output_channel_stride==Cs) && (hc_input_domain(F,Input,Zero,Weights,Params,H,N,Top,Start,End,Cn)) && (hc_output_layout(Output,Hs,Cs,H,N,Cn,End)) && (hc_output_owned(W,Output,Hs,Cs,Cn,Start,End,(N+1)/2)) && (hc_present(F,&(params->scalar.min))) && (hc_present(F,&(params->scalar.max))) && (hc_same_bits(hc_get(F,&(params->scalar.min)),Lo)) && (hc_same_bits(hc_get(F,&(params->scalar.max)),Hi)) && (0<H) && (0<N) && (0<Cn) && (0<=Top) && (Top<=1) && (0<=Start) && (Start<End) && hc_data(F) * hc_output(W,O) Ensure hc_data(F)*hc_output(W,hc_final(hc_visible(hc_neon_raw(F,Input,Zero,Weights,H,N,Top,Lo,Hi),Cn),O,Output,Hs,Cs,Cn,Start,End,(N+1)/2)) */
;
void test_rvv(
    size_t input_height,
    size_t input_width,
    size_t output_y_start,
    size_t output_y_end,
    const float* input,
    const float* zero,
    const float* weights,
    float* output,
    size_t input_padding_top,
    size_t output_channels,
    size_t output_height_stride,
    size_t output_channel_stride,
    const struct xnn_f32_minmax_params* restrict params) XNN_OOB_READS
/*@ With (F:HwcROMap) (O:HwcOutput) (W:list Z) (H:Z) (N:Z) (Top:Z) (Start:Z) (End:Z) (Input:Z) (Zero:Z) (Weights:Z) (Output:Z) (Params:Z) (Cn:Z) (Hs:Z) (Cs:Z) (Lo:fp32) (Hi:fp32) Require (input_height==H) && (input_width==N) && (input_padding_top==Top) && (output_y_start==Start) && (output_y_end==End) && (input==Input) && (zero==Zero) && (weights==Weights) && (output==Output) && (params==Params) && (output_channels==Cn) && (output_height_stride==Hs) && (output_channel_stride==Cs) && (hc_input_domain(F,Input,Zero,Weights,Params,H,N,Top,Start,End,Cn)) && (hc_output_layout(Output,Hs,Cs,H,N,Cn,End)) && (hc_output_owned(W,Output,Hs,Cs,Cn,Start,End,(N+1)/2)) && (hc_present(F,&(params->scalar.min))) && (hc_present(F,&(params->scalar.max))) && (hc_same_bits(hc_get(F,&(params->scalar.min)),Lo)) && (hc_same_bits(hc_get(F,&(params->scalar.max)),Hi)) && (0<H) && (0<N) && (0<Cn) && (0<=Top) && (Top<=1) && (0<=Start) && (Start<End) && hc_data(F) * hc_output(W,O) Ensure hc_data(F)*hc_output(W,hc_final(hc_visible(hc_rvv_raw(F,Input,Zero,Weights,H,N,Top,Lo,Hi),Cn),O,Output,Hs,Cs,Cn,Start,End,(N+1)/2)) */
;
int hwc_public_mode(unsigned int use_rvv,
    size_t input_height,
    size_t input_width,
    size_t output_y_start,
    size_t output_y_end,
    const float* input,
    const float* zero,
    const float* weights,
    float* output,
    size_t input_padding_top,
    size_t output_channels,
    size_t output_height_stride,
    size_t output_channel_stride,
    const struct xnn_f32_minmax_params* restrict params) XNN_OOB_READS
/*@ With (F:HwcROMap) (O:HwcOutput) (W:list Z) (H:Z) (N:Z) (Top:Z) (Start:Z) (End:Z) (Input:Z) (Zero:Z) (Weights:Z) (Output:Z) (Params:Z) (Cn:Z) (Hs:Z) (Cs:Z) (Lo:fp32) (Hi:fp32) Require (input_height==H) && (input_width==N) && (input_padding_top==Top) && (output_y_start==Start) && (output_y_end==End) && (input==Input) && (zero==Zero) && (weights==Weights) && (output==Output) && (params==Params) && (output_channels==Cn) && (output_height_stride==Hs) && (output_channel_stride==Cs) && (hc_input_domain(F,Input,Zero,Weights,Params,H,N,Top,Start,End,Cn)) && (hc_output_layout(Output,Hs,Cs,H,N,Cn,End)) && (hc_output_owned(W,Output,Hs,Cs,Cn,Start,End,(N+1)/2)) && (hc_present(F,&(params->scalar.min))) && (hc_present(F,&(params->scalar.max))) && (hc_same_bits(hc_get(F,&(params->scalar.min)),Lo)) && (hc_same_bits(hc_get(F,&(params->scalar.max)),Hi)) && (0<H) && (0<N) && (0<Cn) && (0<=Top) && (Top<=1) && (0<=Start) && (Start<End) && hc_data(F) * hc_output(W,O) Ensure exists (OA:HwcOutput), __return==1 && hwp_state_observe(hc_final(hc_visible(hc_neon_raw(F,Input,Zero,Weights,H,N,Top,Lo,Hi),Cn),O,Output,Hs,Cs,Cn,Start,End,(N+1)/2),OA) && hwp_unwritten_frame(O,OA,Output,Hs,Cs,Cn,Start,End,(N+1)/2) && hc_data(F)*hc_output(W,OA) */
{
 if(use_rvv==0){test_neon(input_height,input_width,output_y_start,output_y_end,input,zero,weights,output,input_padding_top,output_channels,output_height_stride,output_channel_stride,params) /*@ where F=F,W=W,O=O */;}
 else{test_rvv(input_height,input_width,output_y_start,output_y_end,input,zero,weights,output,input_padding_top,output_channels,output_height_stride,output_channel_stride,params) /*@ where F=F,W=W,O=O */;}
 return 1;
}
