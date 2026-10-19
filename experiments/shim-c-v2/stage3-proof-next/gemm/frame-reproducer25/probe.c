#include "/srv/home/yuechunsun/tools/lean/build/shim-c/experiments/shim-c-v2/stage3-proof-next/gemm/candidate16/.build/diagnostic01/annotated/unit.c"

 /*@ assigns \nothing;
    ensures next_copy_post_0: ext_same(\result.lane[0],v.lane[0]);
    ensures next_copy_post_1: ext_same(\result.lane[1],v.lane[1]);
    ensures next_copy_post_2: ext_same(\result.lane[2],v.lane[2]);
    ensures next_copy_post_3: ext_same(\result.lane[3],v.lane[3]);
 */
 static float32x4_t next_frame_probe(float32x4_t v) {
   float32x4_t copy = v;
   /*@ assert next_copy_aggregate: next_vec_same(copy,v); */
   float input[2] = {v.lane[0],v.lane[1]};
   CopyBeforeLoad: ;
   float32x2_t loaded = vld1_f32(input);
   /*@ assert next_load_probe: ext_same(loaded.lane[0],input[0]) && ext_same(loaded.lane[1],input[1]); */
   /*@ assert next_copy_frame: next_vec_same(copy,\at(copy,CopyBeforeLoad)); */

   /*@ assert next_copy_lane_0: ext_same(copy.lane[0],v.lane[0]); */
   /*@ assert next_copy_lane_1: ext_same(copy.lane[1],v.lane[1]); */
   /*@ assert next_copy_lane_2: ext_same(copy.lane[2],v.lane[2]); */
   /*@ assert next_copy_lane_3: ext_same(copy.lane[3],v.lane[3]); */
   return copy;
 }
