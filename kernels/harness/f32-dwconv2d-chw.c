#include <stdint.h>
#include <stddef.h>
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <assert.h>
#include <riscv_vector.h>
#include <zephyr/sys/reboot.h>
#include "src/xnnpack/common.h"
#include "src/xnnpack/math.h"
#include "src/xnnpack/microparams.h"

// Gold: XNNPACK scalar reference ukernel (3x3p1, stride 1, pad 1)
#include "f32-dwconv2d-chw/gen/f32-dwconv2d-chw-3x3p1-minmax-scalar-1x1.c"

// Translated RVV kernel (from kernels/target/), defines test_rvv
#include "f32-dwconv2d-chw.c"

// 3x3p1 direct depthwise conv, CHW layout, single channel slice.
//   output[y][x] = clamp(bias + sum_{ky,kx} in[y+ky-1][x+kx-1] * k[ky][kx]).
// Padding is implicit zero outside [0,H) x [0,W): the top/bottom rows use the
// `zero` row pointer, the left/right edges are handled by the kernels' edge
// masking. input_width is passed in BYTES (== W * sizeof(float)).
//
// weights layout (10 floats): [bias, k00,k01,k02, k10,k11,k12, k20,k21,k22].
//
// Tolerance: the scalar gold accumulates with plain `+=` in a fixed order, while
// the RVV target uses fused vfmacc in a different order (and the NEON source uses
// fused vfmaq). Results are therefore NOT bit-exact. We use the same relative
// tolerance the upstream XNNPACK dwconv2d-chw tester uses (abs(ref) * 1e-5),
// plus a small absolute floor to absorb catastrophic cancellation near zero.
#define REL_TOL 1.0e-5f
#define ABS_TOL 1.0e-6f

#define MAX_H 9
#define MAX_W 37
// Generous per-row slack (floats) so XNN_OOB_READS / vector loads that overrun a
// row land in valid, zero-filled memory regardless of VLEN (m2 e32).
#define SLACK 64

// Input padded with 4 extra rows (i2..i4 address arithmetic) plus slack.
static float input[(MAX_H + 4) * MAX_W + SLACK];
static float zero_row[MAX_W + SLACK];
static float weights[10];
static float out_rvv[MAX_H * MAX_W];
static float gold[MAX_H * MAX_W];

static int approx_equal(float a, float b) {
    if (a == b) {
        return 1;  // exact (covers clamp-saturated outputs, infinities)
    }
    float diff = fabsf(a - b);
    float tol = REL_TOL * fabsf(b);
    if (tol < ABS_TOL) {
        tol = ABS_TOL;
    }
    return diff <= tol;
}

static int rows_equal(size_t h, size_t w) {
    for (size_t y = 0; y < h; y++) {
        for (size_t x = 0; x < w; x++) {
            size_t idx = y * w + x;
            if (!approx_equal(out_rvv[idx], gold[idx])) {
                printf("Mismatch at y=%zu x=%zu: got %g, expected %g (diff %g)\n",
                       y, x, out_rvv[idx], gold[idx],
                       fabsf(out_rvv[idx] - gold[idx]));
                return 0;
            }
        }
    }
    return 1;
}

// Run one shape: fill input/weights, call gold and RVV, compare.
// h = input_height (== output_height), w = input_width in elements.
static int run_shape(size_t h, size_t w, float omin, float omax, unsigned seed) {
    assert(h >= 1 && h <= MAX_H);
    assert(w >= 1 && w <= MAX_W);

    // Zero everything first so OOB/slack regions read as 0.
    for (size_t i = 0; i < (MAX_H + 4) * MAX_W + SLACK; i++) input[i] = 0.0f;
    for (size_t i = 0; i < MAX_W + SLACK; i++) zero_row[i] = 0.0f;
    for (size_t i = 0; i < MAX_H * MAX_W; i++) { out_rvv[i] = -123.0f; gold[i] = 456.0f; }

    // Distinct, finite values spread across and beyond the clamp window so both
    // the min and max clamps fire on real outputs.
    for (size_t y = 0; y < h; y++) {
        for (size_t x = 0; x < w; x++) {
            int v = (int)((y * 131 + x * 17 + seed) % 23) - 11;
            input[y * w + x] = (float) v * 0.5f;
        }
    }
    // Edge values to push some pooled sums hard against the clamps.
    if (w >= 1) input[0] = -1e3f;            // strongly negative -> hits vmin
    if (w >= 2) input[1] = 1e3f;             // strongly positive -> hits vmax
    if (h >= 2 && w >= 1) input[w] = 1e3f;
    if (h >= 2 && w >= 2) input[w + 1] = -1e3f;

    // Weights: bias + 9 taps, mix of signs/magnitudes.
    weights[0] = 0.25f;          // bias
    weights[1] = 0.5f;  weights[2] = -0.25f; weights[3] = 0.125f;   // row 0
    weights[4] = -0.5f; weights[5] = 1.0f;   weights[6] = -0.125f;  // row 1
    weights[7] = 0.75f; weights[8] = -0.375f; weights[9] = 0.625f;  // row 2

    struct xnn_f32_minmax_params params;
    params.scalar.min = omin;
    params.scalar.max = omax;

    const size_t input_width_bytes = w * sizeof(float);
    const uint32_t padding_top = 1;

    xnn_f32_dwconv2d_chw_ukernel_3x3p1__scalar_1x1(
        h, input_width_bytes, input, weights, zero_row, gold, padding_top, &params);
    test_rvv(
        h, input_width_bytes, input, weights, zero_row, out_rvv, padding_top, &params);

    return rows_equal(h, w);
}

int main() {
    int ok = 1;

    // Single row: i2 -> zero (bottom padding), one output row.
    ok &= run_shape(1, 1, -10.0f, 10.0f, 0);   // degenerate 1x1
    ok &= run_shape(1, 8, -10.0f, 10.0f, 1);   // 1 row, full-width body

    // Two rows: exercises output_height<2/<3 zero substitution.
    ok &= run_shape(2, 5, -10.0f, 10.0f, 2);
    ok &= run_shape(3, 4, -10.0f, 10.0f, 3);   // exactly one 3-row output tile

    // Widths straddling the vector boundary: body + right-edge masked tail.
    ok &= run_shape(4, 7, -10.0f, 10.0f, 4);
    ok &= run_shape(5, 9, -10.0f, 10.0f, 5);
    ok &= run_shape(6, 16, -10.0f, 10.0f, 6);  // wider, multiple vsetvl chunks
    ok &= run_shape(7, 17, -10.0f, 10.0f, 7);  // odd wide width
    ok &= run_shape(9, 37, -10.0f, 10.0f, 8);  // many output tiles + wide rows

    // Tight clamp so the bounds dominate (verifies min/max clamp order/value).
    ok &= run_shape(5, 13, 0.0f, 1.0f, 9);
    // Asymmetric clamp.
    ok &= run_shape(4, 11, -2.0f, 0.5f, 10);

    printf(ok ? "PASS\n" : "FAIL\n");
    sys_reboot(SYS_REBOOT_COLD);
}
