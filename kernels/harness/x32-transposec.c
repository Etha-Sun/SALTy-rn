#include <stdint.h>
#include <stddef.h>
#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include <riscv_vector.h>
#include <zephyr/sys/reboot.h>
#include "src/xnnpack/common.h"
#include "src/xnnpack/math.h"

// Gold: XNNPACK scalar reference ukernel (int variant: raw 32-bit moves)
#include "x32-transposec/gen/x32-transposec-2x2-scalar-int.c"

// Translated RVV kernel (from kernels/target/), defines test_rvv
#include "x32-transposec.c"

// Transposes a block_height x block_width tile of 32-bit words:
// out[c][r] = in[r][c]. Row-major in/out with byte strides.
// Compares RVV output against the scalar gold for several shapes.

#define MAX_H 13
#define MAX_W 13
// Generous strides (in words) leave gaps the kernels must not touch.
#define IN_STRIDE_W  16   // input row stride, words
#define OUT_STRIDE_W 16   // output row stride, words
// Pad rows so XNN_OOB_READS past the last input row stay in-bounds.
#define IN_ROWS  (MAX_H + 2)
#define OUT_ROWS (MAX_W + 2)

#define FILL 0xDEADBEEFu  // sentinel for untouched output cells

static uint32_t input[IN_ROWS * IN_STRIDE_W];
static uint32_t out_rvv[OUT_ROWS * OUT_STRIDE_W];
static uint32_t gold[OUT_ROWS * OUT_STRIDE_W];

static int run_case(size_t bh, size_t bw, const char* tag) {
    const size_t in_stride = IN_STRIDE_W * sizeof(uint32_t);
    const size_t out_stride = OUT_STRIDE_W * sizeof(uint32_t);

    // Distinct value per input cell so any misplacement is detectable.
    for (size_t i = 0; i < IN_ROWS * IN_STRIDE_W; i++) {
        input[i] = 0x10000u + (uint32_t) i;
    }
    for (size_t i = 0; i < OUT_ROWS * OUT_STRIDE_W; i++) {
        gold[i] = FILL;
        out_rvv[i] = FILL;
    }

    xnn_x32_transposec_ukernel__2x2_scalar_int(
        input, gold, in_stride, out_stride, bw, bh);
    test_rvv(
        input, out_rvv, in_stride, out_stride, bw, bh);

    for (size_t i = 0; i < OUT_ROWS * OUT_STRIDE_W; i++) {
        if (out_rvv[i] != gold[i]) {
            size_t row = i / OUT_STRIDE_W, col = i % OUT_STRIDE_W;
            printf("[%s bh=%zu bw=%zu] mismatch at out[%zu][%zu] (word %zu): "
                   "got 0x%08x, expected 0x%08x\n",
                   tag, bh, bw, row, col, i, out_rvv[i], gold[i]);
            return 0;
        }
    }
    return 1;
}

int main() {
    int ok = 1;

    // Square, even dims (pure vectorized body, no tails).
    ok &= run_case(4, 4, "even-square");
    // Odd block_height: exercises the (bh & 1) row tail.
    ok &= run_case(5, 4, "odd-height");
    // Odd block_width: exercises the o1 = o0 aliasing column tail.
    ok &= run_case(4, 3, "odd-width");
    // Both odd: row tail and column-aliasing tail together.
    ok &= run_case(5, 3, "odd-both");
    // Single column: every output goes through the aliased pointer.
    ok &= run_case(7, 1, "width-1");
    // Single row: each width-tile writes one element per output row.
    ok &= run_case(1, 7, "height-1");
    // Degenerate 1x1.
    ok &= run_case(1, 1, "scalar-1x1");
    // Larger tile spanning many vsetvl chunks in the RVV path.
    ok &= run_case(13, 13, "large-odd");

    printf(ok ? "PASS\n" : "FAIL\n");
    sys_reboot(SYS_REBOOT_COLD);
}
