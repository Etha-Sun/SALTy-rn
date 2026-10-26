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
#include <arm_neon.h>
void test_neon(size_t,size_t,size_t,size_t,const float*,const float*,const float*,float*,size_t,size_t,size_t,size_t,const struct xnn_f32_minmax_params*);
void test_rvv(size_t,size_t,size_t,size_t,const float*,const float*,const float*,float*,size_t,size_t,size_t,size_t,const struct xnn_f32_minmax_params*);


#line 1 "/srv/home/yuechunsun/tools/qcp-simple-kernels/verification/qcp/candidates/f32-conv-hwc2chw/.build/hwc-whole-integration/case/shim/support.c"
size_t hc_round_down4(size_t n){return n & ~(size_t)3;}
size_t hc_doz(size_t a,size_t b){return a>b?a-b:0;}


#line 1 "/srv/home/yuechunsun/tools/qcp-simple-kernels/verification/qcp/candidates/f32-conv-hwc2chw/.build/hwc-whole-integration/case/shim/neon3_helpers.c"
float32x4_t hc_neon_fma3_lane0(const float32x4_t *pa,const float32x4_t *pw0,const float32x4_t *pw1,const float32x4_t *pw2,const float32x4_t *px0,const float32x4_t *px1,const float32x4_t *px2)
/*@ With (A:Recordfloat32x4_t) (W0:Recordfloat32x4_t) (W1:Recordfloat32x4_t) (W2:Recordfloat32x4_t) (X0:Recordfloat32x4_t) (X1:Recordfloat32x4_t) (X2:Recordfloat32x4_t) Require StructPredfloat32x4_t(pa,A) * StructPredfloat32x4_t(pw0,W0) * StructPredfloat32x4_t(pw1,W1) * StructPredfloat32x4_t(pw2,W2) * StructPredfloat32x4_t(px0,X0) * StructPredfloat32x4_t(px1,X1) * StructPredfloat32x4_t(px2,X2) Ensure exists(R:Recordfloat32x4_t), hc_neon3(R,A,W0,W1,W2,X0,X1,X2,0) && (StructPredfloat32x4_t(pa,A) * StructPredfloat32x4_t(pw0,W0) * StructPredfloat32x4_t(pw1,W1) * StructPredfloat32x4_t(pw2,W2) * StructPredfloat32x4_t(px0,X0) * StructPredfloat32x4_t(px1,X1) * StructPredfloat32x4_t(px2,X2) * StructPredfloat32x4_t(&__return,R)) */
{
 float32x4_t a=*pa;
 float32x4_t w0=*pw0;
 float32x4_t w1=*pw1;
 float32x4_t w2=*pw2;
 float32x4_t x0=*px0;
 float32x4_t x1=*px1;
 float32x4_t x2=*px2;
 a=vfmaq_laneq_f32(a,w0,x0,0);
 a=vfmaq_laneq_f32(a,w1,x1,0);
 a=vfmaq_laneq_f32(a,w2,x2,0);
 return a;
}
float32x4_t hc_neon_fma3_lane1(const float32x4_t *pa,const float32x4_t *pw0,const float32x4_t *pw1,const float32x4_t *pw2,const float32x4_t *px0,const float32x4_t *px1,const float32x4_t *px2)
/*@ With (A:Recordfloat32x4_t) (W0:Recordfloat32x4_t) (W1:Recordfloat32x4_t) (W2:Recordfloat32x4_t) (X0:Recordfloat32x4_t) (X1:Recordfloat32x4_t) (X2:Recordfloat32x4_t) Require StructPredfloat32x4_t(pa,A) * StructPredfloat32x4_t(pw0,W0) * StructPredfloat32x4_t(pw1,W1) * StructPredfloat32x4_t(pw2,W2) * StructPredfloat32x4_t(px0,X0) * StructPredfloat32x4_t(px1,X1) * StructPredfloat32x4_t(px2,X2) Ensure exists(R:Recordfloat32x4_t), hc_neon3(R,A,W0,W1,W2,X0,X1,X2,1) && (StructPredfloat32x4_t(pa,A) * StructPredfloat32x4_t(pw0,W0) * StructPredfloat32x4_t(pw1,W1) * StructPredfloat32x4_t(pw2,W2) * StructPredfloat32x4_t(px0,X0) * StructPredfloat32x4_t(px1,X1) * StructPredfloat32x4_t(px2,X2) * StructPredfloat32x4_t(&__return,R)) */
{
 float32x4_t a=*pa;
 float32x4_t w0=*pw0;
 float32x4_t w1=*pw1;
 float32x4_t w2=*pw2;
 float32x4_t x0=*px0;
 float32x4_t x1=*px1;
 float32x4_t x2=*px2;
 a=vfmaq_laneq_f32(a,w0,x0,1);
 a=vfmaq_laneq_f32(a,w1,x1,1);
 a=vfmaq_laneq_f32(a,w2,x2,1);
 return a;
}
float32x4_t hc_neon_fma3_lane2(const float32x4_t *pa,const float32x4_t *pw0,const float32x4_t *pw1,const float32x4_t *pw2,const float32x4_t *px0,const float32x4_t *px1,const float32x4_t *px2)
/*@ With (A:Recordfloat32x4_t) (W0:Recordfloat32x4_t) (W1:Recordfloat32x4_t) (W2:Recordfloat32x4_t) (X0:Recordfloat32x4_t) (X1:Recordfloat32x4_t) (X2:Recordfloat32x4_t) Require StructPredfloat32x4_t(pa,A) * StructPredfloat32x4_t(pw0,W0) * StructPredfloat32x4_t(pw1,W1) * StructPredfloat32x4_t(pw2,W2) * StructPredfloat32x4_t(px0,X0) * StructPredfloat32x4_t(px1,X1) * StructPredfloat32x4_t(px2,X2) Ensure exists(R:Recordfloat32x4_t), hc_neon3(R,A,W0,W1,W2,X0,X1,X2,2) && (StructPredfloat32x4_t(pa,A) * StructPredfloat32x4_t(pw0,W0) * StructPredfloat32x4_t(pw1,W1) * StructPredfloat32x4_t(pw2,W2) * StructPredfloat32x4_t(px0,X0) * StructPredfloat32x4_t(px1,X1) * StructPredfloat32x4_t(px2,X2) * StructPredfloat32x4_t(&__return,R)) */
{
 float32x4_t a=*pa;
 float32x4_t w0=*pw0;
 float32x4_t w1=*pw1;
 float32x4_t w2=*pw2;
 float32x4_t x0=*px0;
 float32x4_t x1=*px1;
 float32x4_t x2=*px2;
 a=vfmaq_laneq_f32(a,w0,x0,2);
 a=vfmaq_laneq_f32(a,w1,x1,2);
 a=vfmaq_laneq_f32(a,w2,x2,2);
 return a;
}
float32x4_t hc_neon_fma3_lane3(const float32x4_t *pa,const float32x4_t *pw0,const float32x4_t *pw1,const float32x4_t *pw2,const float32x4_t *px0,const float32x4_t *px1,const float32x4_t *px2)
/*@ With (A:Recordfloat32x4_t) (W0:Recordfloat32x4_t) (W1:Recordfloat32x4_t) (W2:Recordfloat32x4_t) (X0:Recordfloat32x4_t) (X1:Recordfloat32x4_t) (X2:Recordfloat32x4_t) Require StructPredfloat32x4_t(pa,A) * StructPredfloat32x4_t(pw0,W0) * StructPredfloat32x4_t(pw1,W1) * StructPredfloat32x4_t(pw2,W2) * StructPredfloat32x4_t(px0,X0) * StructPredfloat32x4_t(px1,X1) * StructPredfloat32x4_t(px2,X2) Ensure exists(R:Recordfloat32x4_t), hc_neon3(R,A,W0,W1,W2,X0,X1,X2,3) && (StructPredfloat32x4_t(pa,A) * StructPredfloat32x4_t(pw0,W0) * StructPredfloat32x4_t(pw1,W1) * StructPredfloat32x4_t(pw2,W2) * StructPredfloat32x4_t(px0,X0) * StructPredfloat32x4_t(px1,X1) * StructPredfloat32x4_t(px2,X2) * StructPredfloat32x4_t(&__return,R)) */
{
 float32x4_t a=*pa;
 float32x4_t w0=*pw0;
 float32x4_t w1=*pw1;
 float32x4_t w2=*pw2;
 float32x4_t x0=*px0;
 float32x4_t x1=*px1;
 float32x4_t x2=*px2;
 a=vfmaq_laneq_f32(a,w0,x0,3);
 a=vfmaq_laneq_f32(a,w1,x1,3);
 a=vfmaq_laneq_f32(a,w2,x2,3);
 return a;
}


#line 1 "/srv/home/yuechunsun/tools/qcp-simple-kernels/verification/qcp/candidates/f32-conv-hwc2chw/.build/hwc-whole-integration/case/shim/store_half.c"
void hc_store_low_half(float *p,const float32x4_t *pa)
/*@ With (A:Recordfloat32x4_t) (O:HwcOutput) (W:list Z)
 Require hc_write_window(W,p,2) && hc_output(W,O)*StructPredfloat32x4_t(pa,A)
 Ensure hc_output(W,hc_store_low2(O,p,A))*StructPredfloat32x4_t(pa,A) */
{
 float32x4_t a=*pa;
 float32x2_t low=vget_low_f32(a);
 vst1_f32(p,low) /*@ where O=O,W=W */;
}
void hc_store_high_half(float *p,const float32x4_t *pa)
/*@ With (A:Recordfloat32x4_t) (O:HwcOutput) (W:list Z)
 Require hc_write_window(W,p,2) && hc_output(W,O)*StructPredfloat32x4_t(pa,A)
 Ensure hc_output(W,hc_store_high2(O,p,A))*StructPredfloat32x4_t(pa,A) */
{
 float32x4_t a=*pa;
 float32x2_t high=vget_high_f32(a);
 vst1_f32(p,high) /*@ where O=O,W=W */;
}


#line 1 "/srv/home/yuechunsun/tools/qcp-simple-kernels/verification/qcp/candidates/f32-conv-hwc2chw/.build/hwc-whole-integration/case/shim/neon_rows_pixel.c"
float32x4_t hc_neon_rows_pixel27(const float *p0,const float *p1,const float *p2,const float *w,size_t width,size_t x)
/*@ With(F:HwcROMap) Require 0<width && 0<=x && x<(width+1)/2 && hc_footprint(p0,3*width+3) && hc_footprint(p1,3*width+3) && hc_footprint(p2,3*width+3) && hc_footprint(w,112) && hc_window(F,p0,3*width+3) && hc_window(F,p1,3*width+3) && hc_window(F,p2,3*width+3) && hc_window(F,w,112) && hc_data(F) Ensure exists(R:Recordfloat32x4_t),hc_neon_rows_acc(R,F,p0,p1,p2,w,width,x,9) && (hc_data(F)*StructPredfloat32x4_t(&__return,R)) */
{
 float32x4_t a=vld1q_f32(w) /*@ where F=F */;
 /*@ Assert exists(A:Recordfloat32x4_t),p0==p0@pre && p1==p1@pre && p2==p2@pre && w==w@pre && width==width@pre && x==x@pre && 0<width && 0<=x && x<(width+1)/2 && hc_footprint(p0,3*width+3) && hc_footprint(p1,3*width+3) && hc_footprint(p2,3*width+3) && hc_footprint(w,112) && hc_window(F,p0,3*width+3) && hc_window(F,p1,3*width+3) && hc_window(F,p2,3*width+3) && hc_window(F,w,112) && hc_neon_rows_acc(A,F,p0,p1,p2,w,width,x,0) && hc_data(F)*StructPredfloat32x4_t(&a,A) */
 {
  const float32x4_t w0=vld1q_f32(w+4) /*@ where F=F */;
  const float32x4_t w1=vld1q_f32(w+8) /*@ where F=F */;
  const float32x4_t w2=vld1q_f32(w+12) /*@ where F=F */;
  float32x4_t x0=vmovq_n_f32(0.0f);
  float32x4_t x1=vmovq_n_f32(0.0f);
  float32x4_t x2=vmovq_n_f32(0.0f);
  if (x!=0) {
  x0=vld1q_dup_f32(p0+3*(2*x-1)+0) /*@ where F=F */;
  x1=vld1q_dup_f32(p1+3*(2*x-1)+0) /*@ where F=F */;
  x2=vld1q_dup_f32(p2+3*(2*x-1)+0) /*@ where F=F */;
  }
  a=hc_neon_fma3_lane0(&a,&w0,&w1,&w2,&x0,&x1,&x2);
 }
 /*@ Assert exists(A:Recordfloat32x4_t),p0==p0@pre && p1==p1@pre && p2==p2@pre && w==w@pre && width==width@pre && x==x@pre && 0<width && 0<=x && x<(width+1)/2 && hc_footprint(p0,3*width+3) && hc_footprint(p1,3*width+3) && hc_footprint(p2,3*width+3) && hc_footprint(w,112) && hc_window(F,p0,3*width+3) && hc_window(F,p1,3*width+3) && hc_window(F,p2,3*width+3) && hc_window(F,w,112) && hc_neon_rows_acc(A,F,p0,p1,p2,w,width,x,1) && hc_data(F)*StructPredfloat32x4_t(&a,A) */
 {
  const float32x4_t w0=vld1q_f32(w+16) /*@ where F=F */;
  const float32x4_t w1=vld1q_f32(w+20) /*@ where F=F */;
  const float32x4_t w2=vld1q_f32(w+24) /*@ where F=F */;
  float32x4_t x0=vmovq_n_f32(0.0f);
  float32x4_t x1=vmovq_n_f32(0.0f);
  float32x4_t x2=vmovq_n_f32(0.0f);
  if (x!=0) {
  x0=vld1q_dup_f32(p0+3*(2*x-1)+1) /*@ where F=F */;
  x1=vld1q_dup_f32(p1+3*(2*x-1)+1) /*@ where F=F */;
  x2=vld1q_dup_f32(p2+3*(2*x-1)+1) /*@ where F=F */;
  }
  a=hc_neon_fma3_lane0(&a,&w0,&w1,&w2,&x0,&x1,&x2);
 }
 /*@ Assert exists(A:Recordfloat32x4_t),p0==p0@pre && p1==p1@pre && p2==p2@pre && w==w@pre && width==width@pre && x==x@pre && 0<width && 0<=x && x<(width+1)/2 && hc_footprint(p0,3*width+3) && hc_footprint(p1,3*width+3) && hc_footprint(p2,3*width+3) && hc_footprint(w,112) && hc_window(F,p0,3*width+3) && hc_window(F,p1,3*width+3) && hc_window(F,p2,3*width+3) && hc_window(F,w,112) && hc_neon_rows_acc(A,F,p0,p1,p2,w,width,x,2) && hc_data(F)*StructPredfloat32x4_t(&a,A) */
 {
  const float32x4_t w0=vld1q_f32(w+28) /*@ where F=F */;
  const float32x4_t w1=vld1q_f32(w+32) /*@ where F=F */;
  const float32x4_t w2=vld1q_f32(w+36) /*@ where F=F */;
  float32x4_t x0=vmovq_n_f32(0.0f);
  float32x4_t x1=vmovq_n_f32(0.0f);
  float32x4_t x2=vmovq_n_f32(0.0f);
  if (x!=0) {
  x0=vld1q_dup_f32(p0+3*(2*x-1)+2) /*@ where F=F */;
  x1=vld1q_dup_f32(p1+3*(2*x-1)+2) /*@ where F=F */;
  x2=vld1q_dup_f32(p2+3*(2*x-1)+2) /*@ where F=F */;
  }
  a=hc_neon_fma3_lane0(&a,&w0,&w1,&w2,&x0,&x1,&x2);
 }
 /*@ Assert exists(A:Recordfloat32x4_t),p0==p0@pre && p1==p1@pre && p2==p2@pre && w==w@pre && width==width@pre && x==x@pre && 0<width && 0<=x && x<(width+1)/2 && hc_footprint(p0,3*width+3) && hc_footprint(p1,3*width+3) && hc_footprint(p2,3*width+3) && hc_footprint(w,112) && hc_window(F,p0,3*width+3) && hc_window(F,p1,3*width+3) && hc_window(F,p2,3*width+3) && hc_window(F,w,112) && hc_neon_rows_acc(A,F,p0,p1,p2,w,width,x,3) && hc_data(F)*StructPredfloat32x4_t(&a,A) */
 {
  const float32x4_t w0=vld1q_f32(w+40) /*@ where F=F */;
  const float32x4_t w1=vld1q_f32(w+44) /*@ where F=F */;
  const float32x4_t w2=vld1q_f32(w+48) /*@ where F=F */;
  float32x4_t x0=vmovq_n_f32(0.0f);
  float32x4_t x1=vmovq_n_f32(0.0f);
  float32x4_t x2=vmovq_n_f32(0.0f);
  x0=vld1q_dup_f32(p0+3*(2*x)+0) /*@ where F=F */;
  x1=vld1q_dup_f32(p1+3*(2*x)+0) /*@ where F=F */;
  x2=vld1q_dup_f32(p2+3*(2*x)+0) /*@ where F=F */;
  a=hc_neon_fma3_lane0(&a,&w0,&w1,&w2,&x0,&x1,&x2);
 }
 /*@ Assert exists(A:Recordfloat32x4_t),p0==p0@pre && p1==p1@pre && p2==p2@pre && w==w@pre && width==width@pre && x==x@pre && 0<width && 0<=x && x<(width+1)/2 && hc_footprint(p0,3*width+3) && hc_footprint(p1,3*width+3) && hc_footprint(p2,3*width+3) && hc_footprint(w,112) && hc_window(F,p0,3*width+3) && hc_window(F,p1,3*width+3) && hc_window(F,p2,3*width+3) && hc_window(F,w,112) && hc_neon_rows_acc(A,F,p0,p1,p2,w,width,x,4) && hc_data(F)*StructPredfloat32x4_t(&a,A) */
 {
  const float32x4_t w0=vld1q_f32(w+52) /*@ where F=F */;
  const float32x4_t w1=vld1q_f32(w+56) /*@ where F=F */;
  const float32x4_t w2=vld1q_f32(w+60) /*@ where F=F */;
  float32x4_t x0=vmovq_n_f32(0.0f);
  float32x4_t x1=vmovq_n_f32(0.0f);
  float32x4_t x2=vmovq_n_f32(0.0f);
  x0=vld1q_dup_f32(p0+3*(2*x)+1) /*@ where F=F */;
  x1=vld1q_dup_f32(p1+3*(2*x)+1) /*@ where F=F */;
  x2=vld1q_dup_f32(p2+3*(2*x)+1) /*@ where F=F */;
  a=hc_neon_fma3_lane0(&a,&w0,&w1,&w2,&x0,&x1,&x2);
 }
 /*@ Assert exists(A:Recordfloat32x4_t),p0==p0@pre && p1==p1@pre && p2==p2@pre && w==w@pre && width==width@pre && x==x@pre && 0<width && 0<=x && x<(width+1)/2 && hc_footprint(p0,3*width+3) && hc_footprint(p1,3*width+3) && hc_footprint(p2,3*width+3) && hc_footprint(w,112) && hc_window(F,p0,3*width+3) && hc_window(F,p1,3*width+3) && hc_window(F,p2,3*width+3) && hc_window(F,w,112) && hc_neon_rows_acc(A,F,p0,p1,p2,w,width,x,5) && hc_data(F)*StructPredfloat32x4_t(&a,A) */
 {
  const float32x4_t w0=vld1q_f32(w+64) /*@ where F=F */;
  const float32x4_t w1=vld1q_f32(w+68) /*@ where F=F */;
  const float32x4_t w2=vld1q_f32(w+72) /*@ where F=F */;
  float32x4_t x0=vmovq_n_f32(0.0f);
  float32x4_t x1=vmovq_n_f32(0.0f);
  float32x4_t x2=vmovq_n_f32(0.0f);
  x0=vld1q_dup_f32(p0+3*(2*x)+2) /*@ where F=F */;
  x1=vld1q_dup_f32(p1+3*(2*x)+2) /*@ where F=F */;
  x2=vld1q_dup_f32(p2+3*(2*x)+2) /*@ where F=F */;
  a=hc_neon_fma3_lane0(&a,&w0,&w1,&w2,&x0,&x1,&x2);
 }
 /*@ Assert exists(A:Recordfloat32x4_t),p0==p0@pre && p1==p1@pre && p2==p2@pre && w==w@pre && width==width@pre && x==x@pre && 0<width && 0<=x && x<(width+1)/2 && hc_footprint(p0,3*width+3) && hc_footprint(p1,3*width+3) && hc_footprint(p2,3*width+3) && hc_footprint(w,112) && hc_window(F,p0,3*width+3) && hc_window(F,p1,3*width+3) && hc_window(F,p2,3*width+3) && hc_window(F,w,112) && hc_neon_rows_acc(A,F,p0,p1,p2,w,width,x,6) && hc_data(F)*StructPredfloat32x4_t(&a,A) */
 {
  if (2*x+1<width) {
  const float32x4_t w0=vld1q_f32(w+76) /*@ where F=F */;
  const float32x4_t w1=vld1q_f32(w+80) /*@ where F=F */;
  const float32x4_t w2=vld1q_f32(w+84) /*@ where F=F */;
  float32x4_t x0=vmovq_n_f32(0.0f);
  float32x4_t x1=vmovq_n_f32(0.0f);
  float32x4_t x2=vmovq_n_f32(0.0f);
  x0=vld1q_dup_f32(p0+3*(2*x+1)+0) /*@ where F=F */;
  x1=vld1q_dup_f32(p1+3*(2*x+1)+0) /*@ where F=F */;
  x2=vld1q_dup_f32(p2+3*(2*x+1)+0) /*@ where F=F */;
  a=hc_neon_fma3_lane0(&a,&w0,&w1,&w2,&x0,&x1,&x2);
  }
 }
 /*@ Assert exists(A:Recordfloat32x4_t),p0==p0@pre && p1==p1@pre && p2==p2@pre && w==w@pre && width==width@pre && x==x@pre && 0<width && 0<=x && x<(width+1)/2 && hc_footprint(p0,3*width+3) && hc_footprint(p1,3*width+3) && hc_footprint(p2,3*width+3) && hc_footprint(w,112) && hc_window(F,p0,3*width+3) && hc_window(F,p1,3*width+3) && hc_window(F,p2,3*width+3) && hc_window(F,w,112) && hc_neon_rows_acc(A,F,p0,p1,p2,w,width,x,7) && hc_data(F)*StructPredfloat32x4_t(&a,A) */
 {
  if (2*x+1<width) {
  const float32x4_t w0=vld1q_f32(w+88) /*@ where F=F */;
  const float32x4_t w1=vld1q_f32(w+92) /*@ where F=F */;
  const float32x4_t w2=vld1q_f32(w+96) /*@ where F=F */;
  float32x4_t x0=vmovq_n_f32(0.0f);
  float32x4_t x1=vmovq_n_f32(0.0f);
  float32x4_t x2=vmovq_n_f32(0.0f);
  x0=vld1q_dup_f32(p0+3*(2*x+1)+1) /*@ where F=F */;
  x1=vld1q_dup_f32(p1+3*(2*x+1)+1) /*@ where F=F */;
  x2=vld1q_dup_f32(p2+3*(2*x+1)+1) /*@ where F=F */;
  a=hc_neon_fma3_lane0(&a,&w0,&w1,&w2,&x0,&x1,&x2);
  }
 }
 /*@ Assert exists(A:Recordfloat32x4_t),p0==p0@pre && p1==p1@pre && p2==p2@pre && w==w@pre && width==width@pre && x==x@pre && 0<width && 0<=x && x<(width+1)/2 && hc_footprint(p0,3*width+3) && hc_footprint(p1,3*width+3) && hc_footprint(p2,3*width+3) && hc_footprint(w,112) && hc_window(F,p0,3*width+3) && hc_window(F,p1,3*width+3) && hc_window(F,p2,3*width+3) && hc_window(F,w,112) && hc_neon_rows_acc(A,F,p0,p1,p2,w,width,x,8) && hc_data(F)*StructPredfloat32x4_t(&a,A) */
 {
  if (2*x+1<width) {
  const float32x4_t w0=vld1q_f32(w+100) /*@ where F=F */;
  const float32x4_t w1=vld1q_f32(w+104) /*@ where F=F */;
  const float32x4_t w2=vld1q_f32(w+108) /*@ where F=F */;
  float32x4_t x0=vmovq_n_f32(0.0f);
  float32x4_t x1=vmovq_n_f32(0.0f);
  float32x4_t x2=vmovq_n_f32(0.0f);
  x0=vld1q_dup_f32(p0+3*(2*x+1)+2) /*@ where F=F */;
  x1=vld1q_dup_f32(p1+3*(2*x+1)+2) /*@ where F=F */;
  x2=vld1q_dup_f32(p2+3*(2*x+1)+2) /*@ where F=F */;
  a=hc_neon_fma3_lane0(&a,&w0,&w1,&w2,&x0,&x1,&x2);
  }
 }
 /*@ Assert exists(A:Recordfloat32x4_t),p0==p0@pre && p1==p1@pre && p2==p2@pre && w==w@pre && width==width@pre && x==x@pre && 0<width && 0<=x && x<(width+1)/2 && hc_footprint(p0,3*width+3) && hc_footprint(p1,3*width+3) && hc_footprint(p2,3*width+3) && hc_footprint(w,112) && hc_window(F,p0,3*width+3) && hc_window(F,p1,3*width+3) && hc_window(F,p2,3*width+3) && hc_window(F,w,112) && hc_neon_rows_acc(A,F,p0,p1,p2,w,width,x,9) && hc_data(F)*StructPredfloat32x4_t(&a,A) */
 return a;
}


#line 1 "/srv/home/yuechunsun/tools/qcp-simple-kernels/verification/qcp/candidates/f32-conv-hwc2chw/.build/hwc-whole-integration/case/impl/testNEON.c"
/*
struct xnn_f32_minmax_params {
  struct {
    float min;
    float max;
  } scalar;
};
*/

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
{
  assert(input_width != 0);
  assert(output_y_end > output_y_start);
  assert(input_padding_top <= 1);
  assert(output_channels != 0);

  const size_t input_height_stride = input_width * 3 /* channels */ * sizeof(float);
  const size_t input_width_increment = round_down_po2(input_width, 4) * 3 /* channels */ * sizeof(float);
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

  const float32x4_t vmin = vld1q_dup_f32(&params->scalar.min);
  const float32x4_t vmax = vld1q_dup_f32(&params->scalar.max);

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

      // viMx0 = ( iM0c2, iM0c1, iM0c0, --- )

      const float *hc_row0=i0;
      const float *hc_row1=i1;
      const float *hc_row2=i2;
      const float *hc_row3=i3;
      const float *hc_row4=i4;
      size_t iw = input_width;
      for (; iw >= 4; iw -= 4) {
        const size_t hc_x=(input_width-iw)/2;
        float32x4_t vo0x0=hc_neon_rows_pixel27(hc_row0,hc_row1,hc_row2,w,input_width,hc_x);
        float32x4_t vo1x0=hc_neon_rows_pixel27(hc_row2,hc_row3,hc_row4,w,input_width,hc_x);
        float32x4_t vo0x1=hc_neon_rows_pixel27(hc_row0,hc_row1,hc_row2,w,input_width,hc_x+1);
        float32x4_t vo1x1=hc_neon_rows_pixel27(hc_row2,hc_row3,hc_row4,w,input_width,hc_x+1);
        i0+=12;
        i1+=12;
        i2+=12;
        i3+=12;
        i4+=12;
        vo0x0 = vmaxq_f32(vo0x0, vmin);
        vo1x0 = vmaxq_f32(vo1x0, vmin);
        vo0x1 = vmaxq_f32(vo0x1, vmin);
        vo1x1 = vmaxq_f32(vo1x1, vmin);

        vo0x0 = vminq_f32(vo0x0, vmax);
        vo1x0 = vminq_f32(vo1x0, vmax);
        vo0x1 = vminq_f32(vo0x1, vmax);
        vo1x1 = vminq_f32(vo1x1, vmax);

        const float32x4_t vo0c01 = vzip1q_f32(vo0x0, vo0x1);
        const float32x4_t vo0c23 = vzip2q_f32(vo0x0, vo0x1);
        const float32x4_t vo1c01 = vzip1q_f32(vo1x0, vo1x1);
        const float32x4_t vo1c23 = vzip2q_f32(vo1x0, vo1x1);

        // Always 2+ output width elements remaining
        hc_store_low_half(o1c0,&vo1c01); o1c0 += 2;
        hc_store_high_half(o1c1,&vo1c01); o1c1 += 2;
        hc_store_low_half(o1c2,&vo1c23); o1c2 += 2;
        hc_store_high_half(o1c3,&vo1c23); o1c3 += 2;

        hc_store_low_half(o0c0,&vo0c01); o0c0 += 2;
        hc_store_high_half(o0c1,&vo0c01); o0c1 += 2;
        hc_store_low_half(o0c2,&vo0c23); o0c2 += 2;
        hc_store_high_half(o0c3,&vo0c23); o0c3 += 2;
      }
      assert(iw < 4);
      if XNN_UNLIKELY(iw != 0) {
        const size_t hc_x=(input_width-iw)/2;
        float32x4_t vo0x0=hc_neon_rows_pixel27(hc_row0,hc_row1,hc_row2,w,input_width,hc_x);
        float32x4_t vo1x0=hc_neon_rows_pixel27(hc_row2,hc_row3,hc_row4,w,input_width,hc_x);
        float32x4_t vo0x1=vmovq_n_f32(0.0f);
        float32x4_t vo1x1=vmovq_n_f32(0.0f);
        if(iw==3){
          vo0x1=hc_neon_rows_pixel27(hc_row0,hc_row1,hc_row2,w,input_width,hc_x+1);
          vo1x1=hc_neon_rows_pixel27(hc_row2,hc_row3,hc_row4,w,input_width,hc_x+1);
        }
        vo0x0 = vmaxq_f32(vo0x0, vmin);
        vo1x0 = vmaxq_f32(vo1x0, vmin);
        vo0x1 = vmaxq_f32(vo0x1, vmin);
        vo1x1 = vmaxq_f32(vo1x1, vmin);

        vo0x0 = vminq_f32(vo0x0, vmax);
        vo1x0 = vminq_f32(vo1x0, vmax);
        vo0x1 = vminq_f32(vo0x1, vmax);
        vo1x1 = vminq_f32(vo1x1, vmax);

        if (iw == 3) {
          // Exactly 2 output width elements remaining
          const float32x4_t vo0c01 = vzip1q_f32(vo0x0, vo0x1);
          const float32x4_t vo0c23 = vzip2q_f32(vo0x0, vo0x1);
          const float32x4_t vo1c01 = vzip1q_f32(vo1x0, vo1x1);
          const float32x4_t vo1c23 = vzip2q_f32(vo1x0, vo1x1);

          hc_store_low_half(o1c0,&vo1c01); o1c0 += 2;
          hc_store_high_half(o1c1,&vo1c01); o1c1 += 2;
          hc_store_low_half(o1c2,&vo1c23); o1c2 += 2;
          hc_store_high_half(o1c3,&vo1c23); o1c3 += 2;

          hc_store_low_half(o0c0,&vo0c01); o0c0 += 2;
          hc_store_high_half(o0c1,&vo0c01); o0c1 += 2;
          hc_store_low_half(o0c2,&vo0c23); o0c2 += 2;
          hc_store_high_half(o0c3,&vo0c23); o0c3 += 2;
        } else {
          // Exactly 1 output width element remaining

          vst1q_lane_f32(o1c0, vo1x0, 0); o1c0 += 1;
          vst1q_lane_f32(o1c1, vo1x0, 1); o1c1 += 1;
          vst1q_lane_f32(o1c2, vo1x0, 2); o1c2 += 1;
          vst1q_lane_f32(o1c3, vo1x0, 3); o1c3 += 1;

          vst1q_lane_f32(o0c0, vo0x0, 0); o0c0 += 1;
          vst1q_lane_f32(o0c1, vo0x0, 1); o0c1 += 1;
          vst1q_lane_f32(o0c2, vo0x0, 2); o0c2 += 1;
          vst1q_lane_f32(o0c3, vo0x0, 3); o0c3 += 1;
        }
      }
      // Move output pointers back to the position of the first pixel in a row,
      // and forward to the next block of output channels.
      o0c0 = (float*) ((uintptr_t) o0c0 + output_channel_increment);
      o0c1 = (float*) ((uintptr_t) o0c1 + output_channel_increment);
      o0c2 = (float*) ((uintptr_t) o0c2 + output_channel_increment);
      o0c3 = (float*) ((uintptr_t) o0c3 + output_channel_increment);
      o1c0 = (float*) ((uintptr_t) o1c0 + output_channel_increment);
      o1c1 = (float*) ((uintptr_t) o1c1 + output_channel_increment);
      o1c2 = (float*) ((uintptr_t) o1c2 + output_channel_increment);
      o1c3 = (float*) ((uintptr_t) o1c3 + output_channel_increment);
      // Revert input pointers to the position of the first pixel in a row
      i0 = (const float*) ((uintptr_t) i0 - input_width_increment);
      i1 = (const float*) ((uintptr_t) i1 - input_width_increment);
      i2 = (const float*) ((uintptr_t) i2 - input_width_increment);
      i3 = (const float*) ((uintptr_t) i3 - input_width_increment);
      i4 = (const float*) ((uintptr_t) i4 - input_width_increment);
      // Move to the block of weights for the next 4 output channels
      w += 112;
      c = doz(c, 4);
    } while (c != 0);
    // Move output pointers forward to the next two rows
    output0 = (float*) ((uintptr_t) output1 + output_height_stride);
    output1 = (float*) ((uintptr_t) output0 + output_height_stride);
    // Move input pointers forward to the next four rows
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
