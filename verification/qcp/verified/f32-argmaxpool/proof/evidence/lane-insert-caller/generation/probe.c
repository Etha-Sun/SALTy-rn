#include "/srv/home/yuechunsun/tools/qcp-simple-kernels/verification/qcp/candidates/f32-argmaxpool/shim/neon_specs.h"
void probe_insert_f32(float*p,float x0,float x1,float x2,float x3,float value,int lane)
/*@ With(W:list Z)(O:APOutput) Require 0<=lane && lane<4 && ap_write_window(W,p,4) && ap_output(W,O) Ensure ap_output(W,ap_output_write(O,p,4,ap_fpack4(ap_insert_f32(value,x0,x1,x2,x3,lane,0),ap_insert_f32(value,x0,x1,x2,x3,lane,1),ap_insert_f32(value,x0,x1,x2,x3,lane,2),ap_insert_f32(value,x0,x1,x2,x3,lane,3)))) */
{
 float32x4_t lanes;
 lanes.s0=x0;
 lanes.s1=x1;
 lanes.s2=x2;
 lanes.s3=x3;
 lanes=vsetq_lane_f32(value,lanes,lane) /*@ where a=0 */;
 vst1q_f32(p,lanes);
}
void probe_insert_u32(uint32_t*p,uint32_t x0,uint32_t x1,uint32_t x2,uint32_t x3,uint32_t value,int lane)
/*@ With(W:list Z)(O:APIndex) Require 0<=lane && lane<4 && ap_write_window(W,p,4) && ap_index(W,O) Ensure ap_index(W,ap_index_write(O,p,4,ap_ipack4(ap_insert_u32(value,x0,x1,x2,x3,lane,0),ap_insert_u32(value,x0,x1,x2,x3,lane,1),ap_insert_u32(value,x0,x1,x2,x3,lane,2),ap_insert_u32(value,x0,x1,x2,x3,lane,3)))) */
{
 uint32x4_t lanes;
 lanes.s0=x0;
 lanes.s1=x1;
 lanes.s2=x2;
 lanes.s3=x3;
 lanes=vsetq_lane_u32(value,lanes,lane) /*@ where a=0 */;
 vst1q_u32(p,lanes);
}
