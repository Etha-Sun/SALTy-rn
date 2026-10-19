/* Independent ordinary-C diagnostic, not a replacement kernel or public spec. */
#include "/srv/home/yuechunsun/tools/lean/build/shim-c/experiments/shim-c-v2/stage3-proof-next/dwconv/bias-r8/.build/guard08/annotated/unit.c"

void next_dw_load_probe(float value) {
  float weights[16] = {value};
  /*@ ghost float weight_before = weights[0]; */
  vfloat32m4_t loaded = __riscv_vle32_v_f32m4(weights,1);
  /*@ ghost float returned_after = loaded.lane[0]; */
  /*@ assert probe_loaded0: ext_same(returned_after,weight_before); */
  /*@ assert probe_frame0: ext_same(weights[0],weight_before); */
  /*@ assert probe_local0: ext_same(loaded.lane[0],weights[0]); */
}
/*@ assigns \nothing; ensures \false; */
void next_dw_probe_false(void) {}
