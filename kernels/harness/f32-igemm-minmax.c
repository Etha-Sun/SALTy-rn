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
#include "f32-igemm/gen/f32-igemm-1x4-minmax-scalar.c"

// Translated RVV kernel (from kernels/target/), defines test_rvv
#include "f32-igemm-minmax.c"

// IGEMM = GEMM with an indirection buffer for the activation (i.e. convolution).
// For the single output row (MR=1), output channel n is:
//   acc[n] = bias[n];
//   for p in 0..KS_TAPS-1: for k in 0..K-1:
//     acc[n] = fma(a[p][k], W[p][k][n], acc[n]);
//   out[n] = clamp(acc[n], min, max).
// NEON source is f32-igemm-1x8-minmax-neonfma-dup-ld64 (MR=1, NR=8). Gold is the
// scalar 1x4 variant; the RVV target is upstream 1x4v (NR = vlmax_e32m4). All
// three share the SAME logical weight model W[p][k][n] + bias[n] and accumulate
// each output channel with sequential fused FMAs in the same (p,k) order, so the
// scalar gold and the RVV target agree bit-exactly for finite inputs. Data is
// small-integer-valued so every product/sum is exact in f32 regardless.
//
// Weight packing differs between the two consumers and is built per-run:
//  - scalar gold (1x4):  per NR-block of 4 channels, [bias_0..3] then for each
//                        (p,k) [W[p][k][0..3]]; tight NR=4 stride, advances w+=4.
//  - RVV target (1x4v):  per NR-block of vl=min(remaining, vlmax) channels,
//                        [bias_0..vl-1, pad to vlmax] then for each (p,k)
//                        [W[p][k][0..vl-1], pad to vlmax]; advances w+=vlmax even
//                        on a sub-vlmax tail. vlmax = vsetvlmax_e32m4 at runtime.
//
// Indirection buffer: KS_TAPS pointers per output row, reused for every NR-block
// (both consumers rewind `a` by ks bytes after each block). Each pointer
// addresses a K-float activation slice. a_offset is applied to non-`zero`
// pointers; `zero` is a dedicated all-zero padding row (used for padding taps).

#define MAX_KS_TAPS 9       // e.g. a 3x3 conv kernel
#define MAX_K 5             // reduction depth per tap (channels of the filter)
#define MAX_NC 19           // output channels
#define MAX_VLMAX 256       // generous upper bound on vsetvlmax_e32m4 for sizing
#define A_OFFSET_FLOATS 2   // a_offset (in floats) applied to non-zero rows

// Activation rows. Allocate A_OFFSET_FLOATS of headroom so the kernel can add
// a_offset to each pointer and still land inside the row.
static float arows[MAX_KS_TAPS][A_OFFSET_FLOATS + MAX_K];
static const float* indir[MAX_KS_TAPS];
static float zero_row[A_OFFSET_FLOATS + MAX_K];

// Logical weights shared by both packings.
static float bias[MAX_NC];
static float Wlog[MAX_KS_TAPS][MAX_K][MAX_NC];   // W[p][k][n]

// Packed weight buffers for the two consumers.
//   scalar: per NR=4 block, (1 + KS_TAPS*K) rows of 4  ->  ceil(NC/4)*4 cols.
static float w_scalar[((MAX_NC + 3) / 4 * 4) * (1 + MAX_KS_TAPS * MAX_K)];
//   RVV: per vlmax block, (1 + KS_TAPS*K) rows of vlmax -> ceil(NC/vlmax)*vlmax.
static float w_rvv[(MAX_NC + MAX_VLMAX) * (1 + MAX_KS_TAPS * MAX_K)];

static float out_rvv[MAX_NC];
static float gold[MAX_NC];

static int row_equal(size_t nc) {
    for (size_t n = 0; n < nc; n++) {
        if (((const uint32_t*) out_rvv)[n] != ((const uint32_t*) gold)[n]) {
            printf("Mismatch at channel %zu: got %g, expected %g\n",
                   n, out_rvv[n], gold[n]);
            return 0;
        }
    }
    return 1;
}

// Build the scalar (NR=4) weight buffer: per block of 4 channels,
// [bias_0..3] then for each (p,k) [W[p][k][0..3]], tight (no padding within the
// active 4 lanes; a partial final block still strides a full 4).
static void pack_weights_scalar(size_t nc, size_t ks_taps, size_t kk) {
    size_t w = 0;
    for (size_t base = 0; base < nc; base += 4) {
        for (size_t j = 0; j < 4; j++) {
            size_t n = base + j;
            w_scalar[w++] = (n < nc) ? bias[n] : 0.0f;
        }
        for (size_t p = 0; p < ks_taps; p++) {
            for (size_t k = 0; k < kk; k++) {
                for (size_t j = 0; j < 4; j++) {
                    size_t n = base + j;
                    w_scalar[w++] = (n < nc) ? Wlog[p][k][n] : 0.0f;
                }
            }
        }
    }
    assert(w <= sizeof(w_scalar) / sizeof(w_scalar[0]));
}

// Build the RVV (NR=vlmax) weight buffer: per block of vl=min(remaining,vlmax)
// channels, [bias_0..vl-1, pad to vlmax] then for each (p,k)
// [W[p][k][0..vl-1], pad to vlmax]. Stride is a full vlmax even on the tail
// (matches the target's `w += nr`).
static void pack_weights_rvv(size_t nc, size_t ks_taps, size_t kk, size_t vlmax) {
    size_t w = 0;
    for (size_t base = 0; base < nc; base += vlmax) {
        size_t vl = (nc - base) < vlmax ? (nc - base) : vlmax;
        for (size_t j = 0; j < vlmax; j++) {
            size_t n = base + j;
            w_rvv[w++] = (j < vl && n < nc) ? bias[n] : 0.0f;
        }
        for (size_t p = 0; p < ks_taps; p++) {
            for (size_t k = 0; k < kk; k++) {
                for (size_t j = 0; j < vlmax; j++) {
                    size_t n = base + j;
                    w_rvv[w++] = (j < vl && n < nc) ? Wlog[p][k][n] : 0.0f;
                }
            }
        }
    }
    assert(w <= sizeof(w_rvv) / sizeof(w_rvv[0]));
}

// Run one shape: build the indirection buffer + activation rows + both weight
// packings, call gold and RVV, compare. Returns 1 on bit-exact match.
// pad_taps>0 routes the last pad_taps kernel taps at the `zero` row (padding).
static int run_shape(size_t nc, size_t ks_taps, size_t kk, size_t pad_taps,
                     float omin, float omax, unsigned seed, size_t vlmax) {
    assert(nc <= MAX_NC);
    assert(ks_taps <= MAX_KS_TAPS);
    assert(kk <= MAX_K);
    assert(pad_taps <= ks_taps);

    // Activation rows: arows[p] holds A_OFFSET_FLOATS pad floats then K data
    // floats. The kernel adds a_offset (= A_OFFSET_FLOATS*sizeof(float)) to each
    // non-zero pointer, landing on the K data floats. Padding taps point at
    // `zero` (an all-zero row); the kernel leaves those pointers as-is.
    for (size_t p = 0; p < ks_taps; p++) {
        for (size_t k = 0; k < A_OFFSET_FLOATS + kk; k++) {
            int v = (int)((p * 131 + k * 17 + seed) % 13) - 6;
            arows[p][k] = (float) v;        // integer-valued: exact products
        }
        if (p >= ks_taps - pad_taps) {
            indir[p] = zero_row;            // padding tap
        } else {
            indir[p] = arows[p];
        }
    }
    for (size_t k = 0; k < A_OFFSET_FLOATS + kk; k++) zero_row[k] = 0.0f;

    // Logical weights: small integers so bias + sum of products is exact in f32
    // and the accumulation stays within a range the clamps can bound.
    for (size_t n = 0; n < nc; n++) {
        bias[n] = (float)((int)((n + seed) % 5) - 2);
        for (size_t p = 0; p < ks_taps; p++)
            for (size_t k = 0; k < kk; k++)
                Wlog[p][k][n] = (float)((int)((n + p * 3 + k * 7 + seed) % 3) - 1);
    }

    // Edge values: straddle the clamp bounds so both min and max fire.
    if (nc >= 1) { bias[0] = 1e30f; }              // pushes acc above max clamp
    if (nc >= 2) { bias[1] = -1e30f; }             // pushes acc below min clamp
    if (nc >= 3) { bias[2] = omax;                 // exactly on the max bound
                   for (size_t p = 0; p < ks_taps; p++)
                     for (size_t k = 0; k < kk; k++) Wlog[p][k][2] = 0.0f; }
    if (nc >= 4) { bias[3] = omin;                 // exactly on the min bound
                   for (size_t p = 0; p < ks_taps; p++)
                     for (size_t k = 0; k < kk; k++) Wlog[p][k][3] = 0.0f; }

    pack_weights_scalar(nc, ks_taps, kk);
    pack_weights_rvv(nc, ks_taps, kk, vlmax);

    const size_t kc = kk * sizeof(float);
    const size_t ks = ks_taps * sizeof(void*);
    const size_t a_offset = A_OFFSET_FLOATS * sizeof(float);
    // The data lives at arows[p] + A_OFFSET_FLOATS; passed-in pointers are the
    // row bases, the kernel adds a_offset to reach the data.
    // cm_stride/cn_stride unused for MR=1, single NR-block-row output; cn_stride
    // is the byte stride between output NR-blocks within the single row (tight).

    struct xnn_f32_minmax_params params;
    params.scalar.min = omin;
    params.scalar.max = omax;

    xnn_f32_igemm_minmax_ukernel_1x4__scalar(
        /*mr=*/1, nc, kc, ks, indir, w_scalar, gold,
        /*cm_stride=*/0, /*cn_stride=*/4 * sizeof(float), a_offset, zero_row,
        &params);
    test_rvv(
        /*mr=*/1, nc, kc, ks, indir, w_rvv, out_rvv,
        /*cm_stride=*/0, /*cn_stride=*/vlmax * sizeof(float), a_offset, zero_row,
        &params);

    return row_equal(nc);
}

int main() {
    int ok = 1;

    size_t vlmax = __riscv_vsetvlmax_e32m4();   // target tiles with vsetvl_e32m4
    if (vlmax < 1) vlmax = 1;   // defend against vlen=0/1

    // nc: single channel, NEON NR=8 width, group boundary, sub-vlmax tail.
    ok &= run_shape(/*nc=*/1,  /*ks=*/1, /*K=*/1, /*pad=*/0, -5.0f, 5.0f, 0, vlmax);
    ok &= run_shape(/*nc=*/4,  /*ks=*/1, /*K=*/2, /*pad=*/0, -5.0f, 5.0f, 1, vlmax);
    ok &= run_shape(/*nc=*/8,  /*ks=*/4, /*K=*/1, /*pad=*/0, -5.0f, 5.0f, 2, vlmax);
    ok &= run_shape(/*nc=*/7,  /*ks=*/2, /*K=*/3, /*pad=*/1, -5.0f, 5.0f, 3, vlmax);
    ok &= run_shape(/*nc=*/19, /*ks=*/9, /*K=*/3, /*pad=*/2, -5.0f, 5.0f, 4, vlmax);

    // 3x3 conv with K=4 depth; mix of padding taps; tight clamp window.
    ok &= run_shape(/*nc=*/13, /*ks=*/9, /*K=*/4, /*pad=*/3, 0.0f, 2.0f, 5, vlmax);

    printf(ok ? "PASS\n" : "FAIL\n");
    sys_reboot(SYS_REBOOT_COLD);
}
