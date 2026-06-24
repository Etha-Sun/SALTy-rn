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
#include "f32-gemm/gen/f32-gemm-4x4-minmax-scalar.c"

// Translated RVV kernel (from kernels/target/), defines test_rvv
#include "f32-gemm-minmax.c"

// f32 GEMM: C[m][n] = clamp(bias[n] + sum_k a[m][k]*B[k][n]), mr rows x nc cols.
// Gold = scalar 4x4 (MR=4, NR=4). RVV target is 4-row, NR=8 (loads <=8 lanes per
// tile, advances w by 8 per plane). Both do per-row sequential-k fused FMA in the
// same order, so they agree bit-exactly for finite inputs. Integer-valued data
// keeps products/sums exact and inside the clamp window.
//
// Weights are built per-run from a shared logical bias[n] + B[k][n] (MR-independent):
//  - scalar gold (NR=4): per 4-col block [bias0..3] then per k [w0..3]; cn_stride 4 floats.
//  - RVV target  (NR=8): per 8-col block [bias0..7] then per k [w0..7], tail padded
//                        to 8; the kernel always advances w by 8 -> cn_stride 8 floats.
// Activations are mr rows of kc floats at a_stride; outputs are mr rows of nc
// floats at cm_stride. mr is swept 1..4 (the target's valid range). Columns 0/1
// carry +/-1e30 bias so both clamps fire.

#define MAX_MR 4
#define MAX_NC 33
#define MAX_KC 16           // kc in floats

// Logical operands.
static float A[MAX_MR * MAX_KC];        // a[m][k], row m at A[m*kc]
static float B[MAX_KC][MAX_NC];         // B[k][n]
static float bias[MAX_NC];

// Packed weight buffers for the two consumers (weights are MR-independent).
// scalar (NR=4): ceil(nc/4)*4 cols, each (1+kc) rows <= (nc+4)*(1+kc).
static float w_scalar[(MAX_NC + 4) * (1 + MAX_KC)];
// RVV (NR=8): ceil(nc/8)*8 cols, each (1+kc) rows <= (nc+8)*(1+kc).
static float w_rvv[(MAX_NC + 8) * (1 + MAX_KC)];

// Outputs: mr rows x nc cols, row stride cm_stride = nc floats.
static float out_rvv[MAX_MR * MAX_NC];
static float gold[MAX_MR * MAX_NC];

static int rows_equal(size_t mr, size_t nc) {
    for (size_t m = 0; m < mr; m++) {
        for (size_t n = 0; n < nc; n++) {
            size_t idx = m * nc + n;     // cm_stride = nc*sizeof(float)
            if (((const uint32_t*) out_rvv)[idx] != ((const uint32_t*) gold)[idx]) {
                printf("Mismatch at row %zu col %zu: got %g, expected %g\n",
                       m, n, out_rvv[idx], gold[idx]);
                return 0;
            }
        }
    }
    return 1;
}

// Scalar (NR=4) packing: blocks of 4 columns; per block [bias0..3] then per k
// [w0..3]; tail block padded to 4 with zeros.
static size_t pack_weights_scalar(size_t nc, size_t kc_floats) {
    size_t p = 0;
    for (size_t n = 0; n < nc; n += 4) {
        for (size_t j = 0; j < 4; j++) {
            size_t col = n + j;
            w_scalar[p++] = (col < nc) ? bias[col] : 0.0f;
        }
        for (size_t k = 0; k < kc_floats; k++) {
            for (size_t j = 0; j < 4; j++) {
                size_t col = n + j;
                w_scalar[p++] = (col < nc) ? B[k][col] : 0.0f;
            }
        }
    }
    assert(p <= sizeof(w_scalar) / sizeof(w_scalar[0]));
    return p;
}

// RVV (NR=8) packing: 8-col tiles; per tile [bias: 8] then per k [w: 8]; the
// tail tile is padded to 8 with zeros (matches the target's `w += 8`).
static size_t pack_weights_rvv(size_t nc, size_t kc_floats, size_t nr) {
    size_t p = 0;
    for (size_t n = 0; n < nc; n += nr) {
        size_t rem = nc - n;
        size_t vl = rem < nr ? rem : nr;
        for (size_t j = 0; j < nr; j++) {
            size_t col = n + j;
            w_rvv[p++] = (j < vl && col < nc) ? bias[col] : 0.0f;
        }
        for (size_t k = 0; k < kc_floats; k++) {
            for (size_t j = 0; j < nr; j++) {
                size_t col = n + j;
                w_rvv[p++] = (j < vl && col < nc) ? B[k][col] : 0.0f;
            }
        }
    }
    assert(p <= sizeof(w_rvv) / sizeof(w_rvv[0]));
    return p;
}

static int run_shape(size_t mr, size_t nc, size_t kc_floats, float omin, float omax,
                     unsigned seed) {
    assert(mr <= MAX_MR);
    assert(nc <= MAX_NC);
    assert(kc_floats <= MAX_KC);

    // mr rows of small integer-valued activations: exact products/sums in f32.
    for (size_t m = 0; m < mr; m++)
        for (size_t k = 0; k < kc_floats; k++)
            A[m * kc_floats + k] = (float)((int)((m * 23 + k * 3 + seed) % 9) - 4);
    for (size_t n = 0; n < nc; n++) {
        bias[n] = (float)((int)((n + seed) % 7) - 3);
        for (size_t k = 0; k < kc_floats; k++)
            B[k][n] = (float)((int)((n * 5 + k * 2 + seed) % 11) - 5);
    }
    // Edge columns: bias far outside [omin,omax] so both clamps fire.
    if (nc >= 1) bias[0] = 1e30f;     // -> clamps to omax
    if (nc >= 2) bias[1] = -1e30f;    // -> clamps to omin

    pack_weights_scalar(nc, kc_floats);
    pack_weights_rvv(nc, kc_floats, /*nr=*/8);

    struct xnn_f32_minmax_params params;
    params.scalar.min = omin;
    params.scalar.max = omax;

    const size_t kc_bytes = kc_floats * sizeof(float);
    const size_t a_stride = kc_bytes;            // mr rows packed tight
    const size_t cm_stride = nc * sizeof(float); // output rows packed tight
    // cn_stride is the advance after each NR-column block; NR differs per consumer.
    for (size_t i = 0; i < MAX_MR * MAX_NC; i++) { gold[i] = 0.0f; out_rvv[i] = 0.0f; }

    xnn_f32_gemm_minmax_ukernel_4x4__scalar(
        mr, nc, kc_bytes, A, a_stride, w_scalar, gold,
        cm_stride, /*cn_stride=*/4 * sizeof(float), &params);
    test_rvv(
        mr, nc, kc_bytes, A, a_stride, w_rvv, out_rvv,
        cm_stride, /*cn_stride=*/8 * sizeof(float), &params);

    return rows_equal(mr, nc);
}

int main() {
    int ok = 1;

    // mr swept 1..4; nc hits the NR=8 boundary & tails; kc hits the k tail;
    // two tight clamp windows so the bounds dominate.
    ok &= run_shape(1, 1,  4,  -5.0f, 5.0f, 0);
    ok &= run_shape(1, 8,  8,  -5.0f, 5.0f, 1);
    ok &= run_shape(2, 4,  1,  -5.0f, 5.0f, 2);   // kc tail (kc=1)
    ok &= run_shape(2, 9,  3,  -5.0f, 5.0f, 3);   // nc tail past NR=8
    ok &= run_shape(3, 7,  2,  -5.0f, 5.0f, 4);
    ok &= run_shape(3, 17, 16, -5.0f, 5.0f, 5);   // multi-tile, wide kc
    ok &= run_shape(4, 8,  8,  -5.0f, 5.0f, 6);   // full 4x8 tile
    ok &= run_shape(4, 15, 3,  -5.0f, 5.0f, 7);   // odd nc
    ok &= run_shape(4, 33, 5,  -5.0f, 5.0f, 8);   // many tiles
    ok &= run_shape(4, 9,  7,  0.0f, 2.0f, 9);    // tight clamp window
    ok &= run_shape(2, 7,  4,  -1.0f, 1.0f, 10);  // tight clamp window

    printf(ok ? "PASS\n" : "FAIL\n");
    sys_reboot(SYS_REBOOT_COLD);
}
