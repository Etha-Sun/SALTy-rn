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
#include "f32-dwconv/gen/f32-dwconv-3p1c-minmax-scalar.c"

// Translated RVV kernel (from kernels/target/), defines test_rvv
#include "f32-dwconv-minmax.c"

// 3p dwconv: out[p][c] = clamp(bias_c + i0_c*k0_c + i1_c*k1_c + i2_c*k2_c).
// Tap count 3, channel tile 4 in the NEON source (neonfma-acc2); the RVV target
// mirrors upstream 3p8vc (vector-width channel tile). Both the scalar gold and
// the RVV target do three SEQUENTIAL fused FMAs in tap order (bias, k0, k1, k2),
// so they agree bit-exactly for finite inputs regardless of FMA contraction.
// (The NEON acc2 source uses a separate non-fused tap-1 product; we validate the
//  RVV path against the scalar gold, which the RVV target matches exactly.)
//
// Weight packing differs between the two consumers and is built per-run:
//  - scalar gold:  channel-major  [bias_c, k0_c, k1_c, k2_c] per channel.
//  - RVV target:   per chunk of vl=min(remaining, vlmax) channels, the four taps
//                  packed contiguously [bias..][k0..][k1..][k2..], each vl wide
//                  (NO vlmax padding); the kernel advances w by the dynamic vl per
//                  tap, so the next chunk follows immediately. vlmax is the e32m4
//                  vsetvlmax (matching the kernel's vsetvl_e32m4), queried at runtime.
//
// Indirection buffer: 3 row pointers per output pixel, advancing input_stride
// bytes between pixels. input_offset/input_pixel_stride are 0 here; `zero` is an
// unused dedicated all-zero row (no pointer equals it, so the offset path is a
// no-op identity). Finite, mostly integer-valued data spans the clamp window so
// both the min and max clamps fire.

#define MAX_PIXELS 3
#define TAPS 3
#define MAX_CHANNELS 19
#define MAX_VLMAX 256   // generous upper bound on vsetvlmax_e32m8 for sizing

static const float* indir[MAX_PIXELS * TAPS];
static float rows[MAX_PIXELS * TAPS][MAX_CHANNELS];
static float zero_row[MAX_CHANNELS];

// Logical per-channel weights: [bias, k0, k1, k2].
static float wlog[MAX_CHANNELS][4];

// Packed weight buffers for the two consumers.
static float w_scalar[MAX_CHANNELS * 4];
// RVV tile-blocked: ceil(C/vlmax) groups * 4*vlmax slots <= 4*(C+vlmax).
static float w_rvv[4 * (MAX_CHANNELS + MAX_VLMAX)];

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

// Build the scalar (channel-major) weight buffer from wlog.
static void pack_weights_scalar(size_t channels) {
    for (size_t c = 0; c < channels; c++) {
        w_scalar[c * 4 + 0] = wlog[c][0];   // bias
        w_scalar[c * 4 + 1] = wlog[c][1];   // k0
        w_scalar[c * 4 + 2] = wlog[c][2];   // k1
        w_scalar[c * 4 + 3] = wlog[c][3];   // k2
    }
}

// Build the RVV weight buffer to match the kernel's reads: per chunk of
// vl=min(remaining, vlmax) channels, the four taps packed contiguously
// [bias..][k0..][k1..][k2..], each vl wide (no padding); the next chunk follows.
static void pack_weights_rvv(size_t channels, size_t vlmax) {
    size_t w = 0;
    size_t base = 0, rem = channels;
    while (rem > 0) {
        size_t vl = rem < vlmax ? rem : vlmax;
        for (int tap = 0; tap < 4; tap++) {     // 0=bias,1=k0,2=k1,3=k2
            for (size_t j = 0; j < vl; j++) {
                w_rvv[w++] = wlog[base + j][tap];
            }
        }
        base += vl;
        rem -= vl;
    }
    assert(w <= sizeof(w_rvv) / sizeof(w_rvv[0]));
}

// Run one shape: build indirection buffer + row data + both weight packings,
// call gold and RVV, compare. Returns 1 on bit-exact match.
static int run_shape(size_t pixels, size_t channels, float omin, float omax,
                     unsigned seed, size_t vlmax) {
    assert(pixels <= MAX_PIXELS);
    assert(channels <= MAX_CHANNELS);

    // Indirection buffer: TAPS pointers per pixel, addressing channels-wide rows.
    for (size_t p = 0; p < pixels; p++) {
        for (size_t t = 0; t < TAPS; t++) {
            size_t r = p * TAPS + t;
            indir[r] = rows[r];
            for (size_t c = 0; c < channels; c++) {
                int v = (int)((p * 131 + t * 17 + c * 7 + seed) % 17) - 8;
                rows[r][c] = (float) v;     // integer-valued: exact products
            }
        }
    }
    for (size_t c = 0; c < channels; c++) zero_row[c] = 0.0f;

    // Logical weights: small integers so bias + sum of products is exact in f32
    // and stays within a range that the clamps can bound.
    for (size_t c = 0; c < channels; c++) {
        wlog[c][0] = (float)((int)((c + seed) % 5) - 2);     // bias
        wlog[c][1] = (float)((int)((c + seed) % 3) - 1);     // k0
        wlog[c][2] = (float)((int)((c + seed + 1) % 3) - 1); // k1
        wlog[c][3] = (float)((int)((c + seed + 2) % 3) - 1); // k2
    }

    // Edge values on the first pixel's first tap / channels: drive saturation
    // and straddle the clamp bounds.
    if (channels >= 1) rows[0][0] = 1e30f;     // pushes acc above max clamp
    if (channels >= 2) rows[0][1] = -1e30f;    // pushes acc below min clamp
    if (channels >= 3) { rows[0][2] = omax; wlog[2][1] = 1.0f; wlog[2][0] = 0.0f;
                         wlog[2][2] = 0.0f; wlog[2][3] = 0.0f; } // ~= omax
    if (channels >= 4) { rows[0][3] = omin; wlog[3][1] = 1.0f; wlog[3][0] = 0.0f;
                         wlog[3][2] = 0.0f; wlog[3][3] = 0.0f; } // ~= omin

    pack_weights_scalar(channels);
    pack_weights_rvv(channels, vlmax);

    size_t input_stride = TAPS * sizeof(const float*);
    // dwconv output is tightly packed: the kernel does *output++ per channel,
    // so output_increment is the EXTRA gap after the channels (0 here).
    size_t output_increment = 0;

    struct xnn_f32_minmax_params params;
    params.scalar.min = omin;
    params.scalar.max = omax;

    xnn_f32_dwconv_minmax_ukernel_3p1c__scalar(
        channels, pixels, indir, w_scalar, gold,
        input_stride, output_increment, /*input_offset=*/0,
        /*input_pixel_stride=*/0, zero_row, &params);
    test_rvv(
        channels, pixels, indir, w_rvv, out_rvv,
        input_stride, output_increment, /*input_offset=*/0,
        /*input_pixel_stride=*/0, zero_row, &params);

    return rows_equal(pixels, channels);
}

int main() {
    int ok = 1;

    size_t vlmax = __riscv_vsetvlmax_e32m4();   // kernel chunks with vsetvl_e32m4
    if (vlmax < 1) vlmax = 1;   // defend against vlen=0/1

    // channels: full vector groups, group boundary, and a sub-vlmax tail.
    ok &= run_shape(1, 1,  -5.0f, 5.0f, 0, vlmax);   // single channel
    ok &= run_shape(1, 4,  -5.0f, 5.0f, 1, vlmax);   // exercises the 4c NEON-tile width
    ok &= run_shape(2, 7,  -5.0f, 5.0f, 2, vlmax);   // multi-pixel, odd channels
    ok &= run_shape(3, 19, -5.0f, 5.0f, 3, vlmax);   // wide channels, 3 pixels

    // Tight clamp so the bounds dominate the accumulations.
    ok &= run_shape(2, 13, 0.0f, 2.0f, 4, vlmax);

    printf(ok ? "PASS\n" : "FAIL\n");
    sys_reboot(SYS_REBOOT_COLD);
}
