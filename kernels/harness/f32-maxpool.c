#include <stdint.h>
#include <stddef.h>
#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include <riscv_vector.h>
#include <zephyr/sys/reboot.h>
#include "src/xnnpack/common.h"
#include "src/xnnpack/math.h"
#include "src/xnnpack/microparams.h"

// Gold: XNNPACK scalar reference ukernel
#include "f32-maxpool/gen/f32-maxpool-9p-minmax-scalar-u1.c"

// Translated RVV kernel (from kernels/target/), defines test_rvv
#include "f32-maxpool.c"

// 9p maxpool: out[p][c] = clamp(max over the kernel window, min, max).
// Indirection buffer holds kernel_elements pointers per output pixel; it advances
// by input_increment bytes between pixels. Each pointer addresses a CHANNELS-wide
// row. Subsequent passes (ke>9) reuse the prior output as the 9th input, so the
// scalar gold (k-=9, all-fresh) and the RVV target (k-=8, o-as-9th) agree
// bit-exactly for finite inputs. No NaN is fed: scalar max is `a>b?a:b` (NaN ->
// position-dependent) whereas RVV vfmax is IEEE maxNum (NaN-suppressing); they
// only agree when inputs are non-NaN.
#define MAX_PIXELS 3
#define MAX_KE 25
#define MAX_CHANNELS 19

static const float* indir[MAX_PIXELS * MAX_KE];
static float rows[MAX_PIXELS * MAX_KE][MAX_CHANNELS];
static float out_rvv[MAX_PIXELS * MAX_CHANNELS];
static float gold[MAX_PIXELS * MAX_CHANNELS];

static int rows_equal(size_t pixels, size_t channels) {
    for (size_t p = 0; p < pixels; p++) {
        for (size_t c = 0; c < channels; c++) {
            size_t idx = p * channels + c;
            if (((const uint32_t*) out_rvv)[idx] != ((const uint32_t*) gold)[idx]) {
                printf("Mismatch at pixel %zu channel %zu: got %g, expected %g\n",
                       p, c, out_rvv[idx], gold[idx]);
                return 0;
            }
        }
    }
    return 1;
}

// Run one shape: build the indirection buffer + row data, call gold and RVV,
// compare. Returns 1 on bit-exact match. `seed` perturbs the data per shape.
static int run_shape(size_t pixels, size_t kernel_elements, size_t channels,
                     float omin, float omax, unsigned seed) {
    assert(pixels <= MAX_PIXELS);
    assert(kernel_elements <= MAX_KE);
    assert(channels <= MAX_CHANNELS);

    // Distinct, finite values per (pixel, kernel-tap, channel). Spread across
    // the clamp window and beyond so both the min and max clamps fire.
    for (size_t p = 0; p < pixels; p++) {
        for (size_t e = 0; e < kernel_elements; e++) {
            size_t r = p * kernel_elements + e;
            indir[r] = rows[r];
            for (size_t c = 0; c < channels; c++) {
                int v = (int)((p * 131 + e * 17 + c * 7 + seed) % 23) - 11;
                rows[r][c] = (float) v * 0.5f;
            }
        }
    }

    // Edge values placed on the first pixel's first tap / channels.
    if (channels >= 1) rows[0][0] = -1e30f;            // far below min clamp
    if (channels >= 2) rows[0][1] = 1e30f;             // far above max clamp
    if (channels >= 3) rows[0][2] = omin;              // straddle lower bound
    if (channels >= 4) rows[0][3] = omax;              // straddle upper bound
    if (channels >= 5) rows[0][4] = 0.0f;              // signed-zero vs -0.0
    if (kernel_elements >= 2 && channels >= 5) rows[1][4] = -0.0f;

    size_t input_increment = kernel_elements * sizeof(const float*);
    size_t output_increment = channels * sizeof(float);

    struct xnn_f32_minmax_params params;
    params.scalar.min = omin;
    params.scalar.max = omax;

    xnn_f32_maxpool_minmax_ukernel_9p__scalar_u1(
        pixels, kernel_elements, channels, indir, 0, 0,
        gold, input_increment, output_increment, &params);
    test_rvv(
        pixels, kernel_elements, channels, indir, 0, 0,
        out_rvv, input_increment, output_increment, &params);

    return rows_equal(pixels, channels);
}

int main() {
    int ok = 1;

    // Single pass (ke <= 9): exercises the first-pass min+max clamp.
    ok &= run_shape(1, 1, 8, -3.0f, 3.0f, 0);   // ke=1, full vector body
    ok &= run_shape(1, 5, 11, -3.0f, 3.0f, 1);  // ke<9, body + channel tail
    ok &= run_shape(2, 9, 17, -3.0f, 3.0f, 2);  // ke==9 boundary, multi-pixel

    // Multi-pass (ke > 9): subsequent passes fold prior output as 9th input,
    // and the min clamp is applied only in the first pass.
    ok &= run_shape(1, 10, 8, -3.0f, 3.0f, 3);  // one extra pass
    ok &= run_shape(2, 17, 11, -3.0f, 3.0f, 4); // body + tail, multi-pixel
    ok &= run_shape(1, 18, 16, -3.0f, 3.0f, 5); // ke==2*9 boundary
    ok &= run_shape(3, 25, 19, -3.0f, 3.0f, 6); // 3 passes, wide channels, 3 pixels

    // Tight clamp so the bounds dominate the pooled maxima.
    ok &= run_shape(2, 13, 13, 0.0f, 1.0f, 7);

    printf(ok ? "PASS\n" : "FAIL\n");
    sys_reboot(SYS_REBOOT_COLD);
}
