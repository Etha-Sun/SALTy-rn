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

// Gold: XNNPACK scalar reference ukernel (tile=4, c3x4 packing)
#include "f32-conv-hwc2chw/f32-conv-hwc2chw-3x3s2p1c3x4-scalar-1x1.c"

// Translated RVV kernel (from kernels/target/), defines test_rvv
#include "f32-conv-hwc2chw.c"

// 3x3 stride-2 pad-1 conv, 3 input channels (HWC) -> CHW output, minmax clamp.
// Gold and RVV target both consume tile=4 packed weights from
// xnn_pack_f32_dconv_oki_w(nr=4): bias[4] then for kx,c,ky a 4-lane (oc) group;
// 112 floats per 4-channel block. Integer-valued input/kernel/bias keep every
// product and sum exact in f32, so the gold (separate mul/add) and the target
// (also non-fused mul/add, channel-vectorized) agree bit-exactly with zero
// tolerance regardless of FMA contraction or accumulation order. No NaN is fed
// (NEON/RVV fmax/fmin assume non-NaN). Output layout is CHW (channel-strided).
#define MAX_IH 9
#define MAX_IW 9
#define MAX_OC 8
#define MAX_OW ((MAX_IW + 1) / 2)
#define MAX_OH (((1 + MAX_IH + 1) - 3) / 2 + 1)

static float input[MAX_IH * MAX_IW * 3];
static float zerorow[MAX_IW * 3];
static float kernelw[MAX_OC * 3 * 3 * 3];
static float biasv[MAX_OC];
static float packed[(3 * 3 * 3 + 1) * MAX_OC];   // tile=4 divides MAX_OC
static float out_rvv[MAX_OC * MAX_OH * MAX_OW];
static float gold[MAX_OC * MAX_OH * MAX_OW];

static size_t mmin(size_t a, size_t b) { return a < b ? a : b; }

// Copy of xnn_pack_f32_dconv_oki_w (nr-tiled OKI packing).
static void pack_oki(size_t nc, size_t kc, size_t nr, size_t kh, size_t kw,
                     const float* k, const float* b, float* pw) {
    for (size_t ns = 0; ns < nc; ns += nr) {
        const size_t bs = mmin(nc - ns, nr);
        for (size_t no = 0; no < nr; no++) *pw++ = b[mmin(no, bs - 1)];
        for (size_t kx = 0; kx < kw; kx++)
            for (size_t cc = 0; cc < kc; cc++)
                for (size_t ky = 0; ky < kh; ky++)
                    for (size_t no = 0; no < nr; no++)
                        *pw++ = k[(((ns + mmin(no, bs - 1)) * kh + ky) * kw + kx) * kc + cc];
    }
}

static size_t out_height(size_t ih, size_t pad) {
    return ((pad + ih + pad) - 3) / 2 + 1;
}

static int results_equal(size_t oc, size_t oh, size_t ow,
                         size_t oy_start, size_t oy_end) {
    for (size_t c = 0; c < oc; c++)
        for (size_t y = oy_start; y < oy_end; y++)
            for (size_t x = 0; x < ow; x++) {
                size_t idx = (c * oh + y) * ow + x;
                if (((const uint32_t*) out_rvv)[idx] != ((const uint32_t*) gold)[idx]) {
                    printf("Mismatch at chan %zu y %zu x %zu: got %g, expected %g\n",
                           c, y, x, out_rvv[idx], gold[idx]);
                    return 0;
                }
            }
    return 1;
}

// Build data + weights for one shape, run gold and RVV, compare bit-exactly.
static int run_shape(size_t ih, size_t iw, size_t oc, size_t pad,
                     size_t oy_start, size_t oy_end,
                     float omin, float omax, unsigned seed) {
    assert(ih <= MAX_IH && iw <= MAX_IW && oc <= MAX_OC);
    const size_t ow = (iw + 1) / 2;
    const size_t oh = out_height(ih, pad);

    // Integer-valued data: exact in f32, independent of FMA/order.
    for (size_t i = 0; i < ih * iw * 3; i++)
        input[i] = (float)((int)((i * 3 + seed) % 7) - 3);
    for (size_t i = 0; i < iw * 3; i++)
        zerorow[i] = 0.0f;
    for (size_t i = 0; i < oc * 27; i++)
        kernelw[i] = (float)((int)((i * 5 + seed) % 5) - 2);
    for (size_t i = 0; i < oc; i++)
        biasv[i] = (float)((int)((i + seed) % 4) - 1);

    // Edge values straddling the clamp bounds so both clamps fire.
    if (ih * iw * 3 >= 4) {
        input[0] = (omin < omax) ? (omax * 2.0f) : input[0];  // push above max
        input[1] = (omin < omax) ? (omin * 2.0f) : input[1];  // push below min
    }

    pack_oki(oc, 3, 4, 3, 3, kernelw, biasv, packed);

    struct xnn_f32_minmax_params params;
    params.scalar.min = omin;
    params.scalar.max = omax;

    xnn_f32_conv_hwc2chw_ukernel_3x3s2p1c3x4__scalar_1x1(
        ih, iw, oy_start, oy_end, input, zerorow, packed, gold,
        pad, oc, ow * sizeof(float), oh * ow * sizeof(float), &params);
    test_rvv(
        ih, iw, oy_start, oy_end, input, zerorow, packed, out_rvv,
        pad, oc, ow * sizeof(float), oh * ow * sizeof(float), &params);

    return results_equal(oc, oh, ow, oy_start, oy_end);
}

int main() {
    int ok = 1;

    // Full strip (oy_start=0, oy_end=oh). pad=1 is the configured case.
    ok &= run_shape(5, 5, 4, 1, 0, out_height(5, 1), -100.f, 100.f, 0); // body
    ok &= run_shape(5, 5, 4, 1, 0, out_height(5, 1),   -5.f,   5.f, 1); // tight clamp
    ok &= run_shape(4, 7, 8, 1, 0, out_height(4, 1), -100.f, 100.f, 2); // oc=8: 2 blocks
    ok &= run_shape(6, 6, 3, 1, 0, out_height(6, 1), -100.f, 100.f, 3); // oc<4 tail
    ok &= run_shape(6, 6, 5, 1, 0, out_height(6, 1), -100.f, 100.f, 4); // oc=5: 4+1
    ok &= run_shape(7, 8, 4, 1, 0, out_height(7, 1), -100.f, 100.f, 5); // odd oh => row fold
    ok &= run_shape(3, 3, 4, 1, 0, out_height(3, 1), -100.f, 100.f, 6); // tiny
    ok &= run_shape(8, 9, 6, 0, 0, out_height(8, 0), -100.f, 100.f, 7); // pad=0
    ok &= run_shape(9, 4, 7, 1, 1, out_height(9, 1), -100.f, 100.f, 8); // oy_start>0
    ok &= run_shape(9, 4, 7, 1, 0,            2,     -100.f, 100.f, 9); // partial strip end

    printf(ok ? "PASS\n" : "FAIL\n");
    sys_reboot(SYS_REBOOT_COLD);
}
