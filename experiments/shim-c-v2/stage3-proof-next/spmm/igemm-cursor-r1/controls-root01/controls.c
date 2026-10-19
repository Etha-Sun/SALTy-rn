#include "/srv/home/yuechunsun/tools/lean/build/shim-c/experiments/shim-c-v2/stage3-proof-next/spmm/igemm-cursor-r1/.build/controls-root01/annotated/unit.c"
/*@ ensures igemm_control_positive: \result == 1; */
int igemm_control_true(void) { return 1; }
/*@ ensures igemm_control_negative: \result == 0; */
int igemm_control_false(void) { return 1; }
