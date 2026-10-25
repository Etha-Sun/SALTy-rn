#include "/srv/home/yuechunsun/tools/qcp-simple-kernels/verification/qcp/candidates/f32-maxpool/shim/neon_specs.h"
float32x4_t mp_probe_readonly(const float*p)
/*@ With (F:MPFloatMap) Require mp_window(F,p,4) && mp_data(F) Ensure mp_data(F) * store(&(__return.s0),float,mp_load_lane(F,p,0)) * store(&(__return.s1),float,mp_load_lane(F,p,1)) * store(&(__return.s2),float,mp_load_lane(F,p,2)) * store(&(__return.s3),float,mp_load_lane(F,p,3)) */
{ return vld1q_f32(p) /*@ where (readonly_map) F=F */; }
float32x4_t mp_probe_output(const float*p)
/*@ With (W:list Z) (O:MPOutput) Require mp_write_window(W,p,4) && mp_out(W,O) Ensure exists (r0:fp32) (r1:fp32) (r2:fp32) (r3:fp32), mp_loaded_lane(O,p,0,r0) && mp_loaded_lane(O,p,1,r1) && mp_loaded_lane(O,p,2,r2) && mp_loaded_lane(O,p,3,r3) && mp_out(W,O) * store(&(__return.s0),float,r0) * store(&(__return.s1),float,r1) * store(&(__return.s2),float,r2) * store(&(__return.s3),float,r3) */
{ return vld1q_f32(p) /*@ where (output_map) W=W,O=O */; }
