#include "neon_rows_pixel.h"
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
