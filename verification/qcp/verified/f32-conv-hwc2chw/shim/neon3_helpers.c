#include "neon3_helpers.h"
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
