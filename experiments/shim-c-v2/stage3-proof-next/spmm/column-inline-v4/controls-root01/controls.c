#include "/srv/home/yuechunsun/tools/lean/build/shim-c/experiments/shim-c-v2/stage3-proof-next/spmm/column-inline-v4/.build/controls-root01/annotated/unit.c"
/*@ ensures spmm_inline_control_positive: \result == 1; */
int spmm_inline_control_true(void) { return 1; }
/*@ ensures spmm_inline_control_negative: \result == 0; */
int spmm_inline_control_false(void) { return 1; }
