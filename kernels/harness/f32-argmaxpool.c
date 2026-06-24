#include <stdint.h>
#include <stddef.h>
#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include <math.h>
#include <riscv_vector.h>
#include <zephyr/sys/reboot.h>
#include "src/xnnpack/common.h"

// Gold: XNNPACK scalar reference ukernel
#include "f32-argmaxpool/f32-argmaxpool-9p8x-scalar-c1.c"

// Translated RVV kernel (from kernels/target/), defines test_rvv
#include "f32-argmaxpool.c"

// Dual output: max value + uint32 argmax index. RVV variant asserts
// pooling_elements > 9, so every config uses a multi-pass window (>= 2 passes).
// Tie-breaking is strict '>' first-max-wins in scalar/NEON/RVV; values are kept
// finite, distinct, no NaN/Inf so values and indices agree bit-exactly.
#define PIXELS 3
#define POOL 18            // pooling_elements (> 9 -> 2 passes of 9)
#define CHANNELS 13        // odd, > vlmax tail; straddles e32m1 lanes

static const float* input_ptrs[PIXELS * POOL];   // [pixel][pooling] -> row buffer
static float rows[PIXELS * POOL * CHANNELS];      // backing storage for all rows

static float out_rvv[PIXELS * CHANNELS];
static float out_gold[PIXELS * CHANNELS];
static uint32_t idx_rvv[PIXELS * CHANNELS];
static uint32_t idx_gold[PIXELS * CHANNELS];

int full_is_equal(void) {
    for (size_t p = 0; p < PIXELS; p++) {
        for (size_t c = 0; c < CHANNELS; c++) {
            size_t o = p * CHANNELS + c;
            // value channel: compare bit-exactly
            if (((const uint32_t*) out_rvv)[o] != ((const uint32_t*) out_gold)[o]) {
                printf("VAL mismatch pixel %zu chan %zu: got %g, expected %g\n",
                       p, c, out_rvv[o], out_gold[o]);
                return 0;
            }
            if (idx_rvv[o] != idx_gold[o]) {
                printf("IDX mismatch pixel %zu chan %zu (val %g): got %u, expected %u\n",
                       p, c, out_gold[o], idx_rvv[o], idx_gold[o]);
                return 0;
            }
        }
    }
    return 1;
}

int main() {
    // Fill every (pixel,pool,channel) cell with a distinct finite value and wire
    // the pointer array. No ties on any value channel, no NaN/Inf.
    for (size_t p = 0; p < PIXELS; p++) {
        for (size_t e = 0; e < POOL; e++) {
            float* row = &rows[(p * POOL + e) * CHANNELS];
            input_ptrs[p * POOL + e] = row;
            for (size_t c = 0; c < CHANNELS; c++) {
                // Pseudo-shuffle the per-pool value so the argmax index varies
                // across channels and is never an edge index by default.
                int32_t v = (int32_t)((e * 7 + c * 3 + p * 5) % POOL);
                row[c] = (float)v + (float)c * 0.015625f + (float)p * 0.0009765625f;
            }
        }
    }
    // Edge-case channels on pixel 0: force argmax at first and last pool index.
    {
        float* base = rows;  // pixel 0 rows are contiguous in blocks of CHANNELS
        // chan 0: max at pool index 0
        for (size_t e = 0; e < POOL; e++) base[e * CHANNELS + 0] = (e == 0) ? 100.0f : (float)e * 0.1f;
        // chan 1: max at last pool index (POOL-1)
        for (size_t e = 0; e < POOL; e++) base[e * CHANNELS + 1] = (e == POOL - 1) ? 100.0f : (float)e * 0.1f;
        // chan 2: large negatives, max somewhere in the middle (index 9, second pass)
        for (size_t e = 0; e < POOL; e++) base[e * CHANNELS + 2] = (e == 9) ? -1.0f : -1000.0f - (float)e;
    }

    for (size_t i = 0; i < PIXELS * CHANNELS; i++) {
        out_rvv[i] = 0.0f; out_gold[i] = 0.0f; idx_rvv[i] = 0; idx_gold[i] = 0;
    }

    const size_t input_offset = 0;
    const size_t input_pixel_stride = 0;                       // bytes added to input_offset per pixel
    const size_t input_increment = POOL * sizeof(const float*); // bytes to advance input ptr array per pixel
    const size_t output_increment = CHANNELS * sizeof(float);
    const size_t index_increment = CHANNELS * sizeof(uint32_t);

    xnn_f32_argmaxpool_ukernel_9p8x__scalar_c1(
        PIXELS, POOL, CHANNELS, input_ptrs, input_offset, input_pixel_stride,
        out_gold, idx_gold, input_increment, output_increment, index_increment);

    test_rvv(
        PIXELS, POOL, CHANNELS, input_ptrs, input_offset, input_pixel_stride,
        out_rvv, idx_rvv, input_increment, output_increment, index_increment);

    printf(full_is_equal() ? "PASS\n" : "FAIL\n");
    sys_reboot(SYS_REBOOT_COLD);
}
