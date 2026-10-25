#define DWCHW_NEON_VECTOR_PIXEL_BODY 1
#include "neon_vector_pixel.h"
float32x4_t dw_neon_pixel_compute(const float32x4_t*p0,const float32x4_t*p1,const float32x4_t*p2,const float*weights,float prev0,float prev1,float prev2,float next0,float next1,float next2,float lo,float hi)
/*@ With(F:DwROMap) (a00:fp32) (a01:fp32) (a02:fp32) (a03:fp32) (a10:fp32) (a11:fp32) (a12:fp32) (a13:fp32) (a20:fp32) (a21:fp32) (a22:fp32) (a23:fp32) Require dw_window(F,weights,10) && dw_data(F) * store(&(p0->s0),float,a00) * store(&(p0->s1),float,a01) * store(&(p0->s2),float,a02) * store(&(p0->s3),float,a03) * store(&(p1->s0),float,a10) * store(&(p1->s1),float,a11) * store(&(p1->s2),float,a12) * store(&(p1->s3),float,a13) * store(&(p2->s0),float,a20) * store(&(p2->s1),float,a21) * store(&(p2->s2),float,a22) * store(&(p2->s3),float,a23) Ensure exists (r0:fp32) (r1:fp32) (r2:fp32) (r3:fp32),dw_neon_vector_match4(r0,r1,r2,r3,dw_neon_vector_pixel(F,weights,dw_fp4(a00,a01,a02,a03),dw_fp4(a10,a11,a12,a13),dw_fp4(a20,a21,a22,a23),prev0,prev1,prev2,next0,next1,next2,lo,hi)) && dw_data(F) * store(&(p0->s0),float,a00) * store(&(p0->s1),float,a01) * store(&(p0->s2),float,a02) * store(&(p0->s3),float,a03) * store(&(p1->s0),float,a10) * store(&(p1->s1),float,a11) * store(&(p1->s2),float,a12) * store(&(p1->s3),float,a13) * store(&(p2->s0),float,a20) * store(&(p2->s1),float,a21) * store(&(p2->s2),float,a22) * store(&(p2->s3),float,a23) * store(&(__return.s0),float,r0) * store(&(__return.s1),float,r1) * store(&(__return.s2),float,r2) * store(&(__return.s3),float,r3) */
{
float32x4_t c0=*p0;float32x4_t c1=*p1;float32x4_t c2=*p2;
float32x4_t out=vdupq_n_f32(dw_read_scalar(&(weights[0])) /*@ where F=F */);
{const float32x4_t dw_w2dup=vdupq_n_f32(dw_read_scalar(&(weights[2])) /*@ where F=F */);
const float32x2_t dw_w2lane=vget_low_f32(dw_w2dup) /*@ where p_a=&dw_w2dup,a0=dw_w2dup.s0,a1=dw_w2dup.s1,a2=dw_w2dup.s2,a3=dw_w2dup.s3 */;
out=vfmaq_lane_f32(out,c0,dw_w2lane,0) /*@ where p_c=&out,c0=out.s0,c1=out.s1,c2=out.s2,c3=out.s3,p_a=&c0,a0=c0.s0,a1=c0.s1,a2=c0.s2,a3=c0.s3,p_b=&dw_w2lane,b0=dw_w2lane.s0,b1=dw_w2lane.s1 */;}
{const float32x4_t dw_w5dup=vdupq_n_f32(dw_read_scalar(&(weights[5])) /*@ where F=F */);
const float32x2_t dw_w5lane=vget_low_f32(dw_w5dup) /*@ where p_a=&dw_w5dup,a0=dw_w5dup.s0,a1=dw_w5dup.s1,a2=dw_w5dup.s2,a3=dw_w5dup.s3 */;
out=vfmaq_lane_f32(out,c1,dw_w5lane,0) /*@ where p_c=&out,c0=out.s0,c1=out.s1,c2=out.s2,c3=out.s3,p_a=&c1,a0=c1.s0,a1=c1.s1,a2=c1.s2,a3=c1.s3,p_b=&dw_w5lane,b0=dw_w5lane.s0,b1=dw_w5lane.s1 */;}
{const float32x4_t dw_w8dup=vdupq_n_f32(dw_read_scalar(&(weights[8])) /*@ where F=F */);
const float32x2_t dw_w8lane=vget_low_f32(dw_w8dup) /*@ where p_a=&dw_w8dup,a0=dw_w8dup.s0,a1=dw_w8dup.s1,a2=dw_w8dup.s2,a3=dw_w8dup.s3 */;
out=vfmaq_lane_f32(out,c2,dw_w8lane,0) /*@ where p_c=&out,c0=out.s0,c1=out.s1,c2=out.s2,c3=out.s3,p_a=&c2,a0=c2.s0,a1=c2.s1,a2=c2.s2,a3=c2.s3,p_b=&dw_w8lane,b0=dw_w8lane.s0,b1=dw_w8lane.s1 */;}
{const float32x4_t dw_left0dup=vdupq_n_f32(prev0);
const float32x4_t dw_left0=vextq_f32(dw_left0dup,c0,3) /*@ where p_a=&dw_left0dup,a0=dw_left0dup.s0,a1=dw_left0dup.s1,a2=dw_left0dup.s2,a3=dw_left0dup.s3,p_b=&c0,b0=c0.s0,b1=c0.s1,b2=c0.s2,b3=c0.s3 */;
{const float32x4_t dw_w1dup=vdupq_n_f32(dw_read_scalar(&(weights[1])) /*@ where F=F */);
const float32x2_t dw_w1lane=vget_low_f32(dw_w1dup) /*@ where p_a=&dw_w1dup,a0=dw_w1dup.s0,a1=dw_w1dup.s1,a2=dw_w1dup.s2,a3=dw_w1dup.s3 */;
out=vfmaq_lane_f32(out,dw_left0,dw_w1lane,0) /*@ where p_c=&out,c0=out.s0,c1=out.s1,c2=out.s2,c3=out.s3,p_a=&dw_left0,a0=dw_left0.s0,a1=dw_left0.s1,a2=dw_left0.s2,a3=dw_left0.s3,p_b=&dw_w1lane,b0=dw_w1lane.s0,b1=dw_w1lane.s1 */;}
}
{const float32x4_t dw_left1dup=vdupq_n_f32(prev1);
const float32x4_t dw_left1=vextq_f32(dw_left1dup,c1,3) /*@ where p_a=&dw_left1dup,a0=dw_left1dup.s0,a1=dw_left1dup.s1,a2=dw_left1dup.s2,a3=dw_left1dup.s3,p_b=&c1,b0=c1.s0,b1=c1.s1,b2=c1.s2,b3=c1.s3 */;
{const float32x4_t dw_w4dup=vdupq_n_f32(dw_read_scalar(&(weights[4])) /*@ where F=F */);
const float32x2_t dw_w4lane=vget_low_f32(dw_w4dup) /*@ where p_a=&dw_w4dup,a0=dw_w4dup.s0,a1=dw_w4dup.s1,a2=dw_w4dup.s2,a3=dw_w4dup.s3 */;
out=vfmaq_lane_f32(out,dw_left1,dw_w4lane,0) /*@ where p_c=&out,c0=out.s0,c1=out.s1,c2=out.s2,c3=out.s3,p_a=&dw_left1,a0=dw_left1.s0,a1=dw_left1.s1,a2=dw_left1.s2,a3=dw_left1.s3,p_b=&dw_w4lane,b0=dw_w4lane.s0,b1=dw_w4lane.s1 */;}
}
{const float32x4_t dw_left2dup=vdupq_n_f32(prev2);
const float32x4_t dw_left2=vextq_f32(dw_left2dup,c2,3) /*@ where p_a=&dw_left2dup,a0=dw_left2dup.s0,a1=dw_left2dup.s1,a2=dw_left2dup.s2,a3=dw_left2dup.s3,p_b=&c2,b0=c2.s0,b1=c2.s1,b2=c2.s2,b3=c2.s3 */;
{const float32x4_t dw_w7dup=vdupq_n_f32(dw_read_scalar(&(weights[7])) /*@ where F=F */);
const float32x2_t dw_w7lane=vget_low_f32(dw_w7dup) /*@ where p_a=&dw_w7dup,a0=dw_w7dup.s0,a1=dw_w7dup.s1,a2=dw_w7dup.s2,a3=dw_w7dup.s3 */;
out=vfmaq_lane_f32(out,dw_left2,dw_w7lane,0) /*@ where p_c=&out,c0=out.s0,c1=out.s1,c2=out.s2,c3=out.s3,p_a=&dw_left2,a0=dw_left2.s0,a1=dw_left2.s1,a2=dw_left2.s2,a3=dw_left2.s3,p_b=&dw_w7lane,b0=dw_w7lane.s0,b1=dw_w7lane.s1 */;}
}
{const float32x4_t dw_right0dup=vdupq_n_f32(next0);
const float32x4_t dw_right0=vextq_f32(c0,dw_right0dup,1) /*@ where p_a=&c0,a0=c0.s0,a1=c0.s1,a2=c0.s2,a3=c0.s3,p_b=&dw_right0dup,b0=dw_right0dup.s0,b1=dw_right0dup.s1,b2=dw_right0dup.s2,b3=dw_right0dup.s3 */;
{const float32x4_t dw_w3dup=vdupq_n_f32(dw_read_scalar(&(weights[3])) /*@ where F=F */);
const float32x2_t dw_w3lane=vget_low_f32(dw_w3dup) /*@ where p_a=&dw_w3dup,a0=dw_w3dup.s0,a1=dw_w3dup.s1,a2=dw_w3dup.s2,a3=dw_w3dup.s3 */;
out=vfmaq_lane_f32(out,dw_right0,dw_w3lane,0) /*@ where p_c=&out,c0=out.s0,c1=out.s1,c2=out.s2,c3=out.s3,p_a=&dw_right0,a0=dw_right0.s0,a1=dw_right0.s1,a2=dw_right0.s2,a3=dw_right0.s3,p_b=&dw_w3lane,b0=dw_w3lane.s0,b1=dw_w3lane.s1 */;}
}
{const float32x4_t dw_right1dup=vdupq_n_f32(next1);
const float32x4_t dw_right1=vextq_f32(c1,dw_right1dup,1) /*@ where p_a=&c1,a0=c1.s0,a1=c1.s1,a2=c1.s2,a3=c1.s3,p_b=&dw_right1dup,b0=dw_right1dup.s0,b1=dw_right1dup.s1,b2=dw_right1dup.s2,b3=dw_right1dup.s3 */;
{const float32x4_t dw_w6dup=vdupq_n_f32(dw_read_scalar(&(weights[6])) /*@ where F=F */);
const float32x2_t dw_w6lane=vget_low_f32(dw_w6dup) /*@ where p_a=&dw_w6dup,a0=dw_w6dup.s0,a1=dw_w6dup.s1,a2=dw_w6dup.s2,a3=dw_w6dup.s3 */;
out=vfmaq_lane_f32(out,dw_right1,dw_w6lane,0) /*@ where p_c=&out,c0=out.s0,c1=out.s1,c2=out.s2,c3=out.s3,p_a=&dw_right1,a0=dw_right1.s0,a1=dw_right1.s1,a2=dw_right1.s2,a3=dw_right1.s3,p_b=&dw_w6lane,b0=dw_w6lane.s0,b1=dw_w6lane.s1 */;}
}
{const float32x4_t dw_right2dup=vdupq_n_f32(next2);
const float32x4_t dw_right2=vextq_f32(c2,dw_right2dup,1) /*@ where p_a=&c2,a0=c2.s0,a1=c2.s1,a2=c2.s2,a3=c2.s3,p_b=&dw_right2dup,b0=dw_right2dup.s0,b1=dw_right2dup.s1,b2=dw_right2dup.s2,b3=dw_right2dup.s3 */;
{const float32x4_t dw_w9dup=vdupq_n_f32(dw_read_scalar(&(weights[9])) /*@ where F=F */);
const float32x2_t dw_w9lane=vget_low_f32(dw_w9dup) /*@ where p_a=&dw_w9dup,a0=dw_w9dup.s0,a1=dw_w9dup.s1,a2=dw_w9dup.s2,a3=dw_w9dup.s3 */;
out=vfmaq_lane_f32(out,dw_right2,dw_w9lane,0) /*@ where p_c=&out,c0=out.s0,c1=out.s1,c2=out.s2,c3=out.s3,p_a=&dw_right2,a0=dw_right2.s0,a1=dw_right2.s1,a2=dw_right2.s2,a3=dw_right2.s3,p_b=&dw_w9lane,b0=dw_w9lane.s0,b1=dw_w9lane.s1 */;}
}
{const float32x4_t dw_lo=vdupq_n_f32(lo);out=vmaxq_f32(out,dw_lo) /*@ where p_a=&out,a0=out.s0,a1=out.s1,a2=out.s2,a3=out.s3,p_b=&dw_lo,b0=dw_lo.s0,b1=dw_lo.s1,b2=dw_lo.s2,b3=dw_lo.s3 */;}
{const float32x4_t dw_hi=vdupq_n_f32(hi);out=vminq_f32(out,dw_hi) /*@ where p_a=&out,a0=out.s0,a1=out.s1,a2=out.s2,a3=out.s3,p_b=&dw_hi,b0=dw_hi.s0,b1=dw_hi.s1,b2=dw_hi.s2,b3=dw_hi.s3 */;}
return out;
}
