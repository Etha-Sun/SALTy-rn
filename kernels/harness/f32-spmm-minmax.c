#include <stdint.h>
#include <stddef.h>
#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include <riscv_vector.h>
#include <zephyr/sys/reboot.h>
#include "src/xnnpack/common.h"
#include "src/xnnpack/microparams.h"

// Gold: XNNPACK scalar reference ukernel
#include "f32-spmm/gen/f32-spmm-8x1-minmax-scalar.c"

// Translated RVV kernel (from kernels/target/), defines test_rvv
#include "f32-spmm-minmax.c"

// Sparse matmul: output[n][m] = clamp(bias[n] + sum_k input[k][m] * B[n][k]).
// Dense nr=1 layout (every weight nonzero) so the dmap/nnzmap streams are
// deterministic. Integer-valued data keeps every product/sum exact in f32, so
// the result is independent of FMA contraction (gold vs RVV agree bit-exactly).
#define M 16            // rows (pixels)
#define N 4             // output channels
#define K 3             // input channels
#define OUTPUT_STRIDE M // tight packing of output rows

static float input[K * M];                 // column-major: input[k*M + r]
static float Bmat[N * K];                   // dense weight matrix B[n*K + k]
static float bias[N];

static float weights[N * K + N + 1];        // [bias_n, w_n_0..w_n_{K-1}] per n (+slack)
static int32_t dmap[N * K + 1];             // per-nonzero input byte deltas
static uint32_t nnzmap[N];                  // nonzeros per channel (= K, dense)

static float out_rvv[(N - 1) * OUTPUT_STRIDE + M];
static float gold[(N - 1) * OUTPUT_STRIDE + M];

int full_is_equal(const float* x, const float* y) {
    for (size_t n = 0; n < N; n++) {
        for (size_t r = 0; r < M; r++) {
            size_t idx = n * OUTPUT_STRIDE + r;
            if (((const uint32_t*) x)[idx] != ((const uint32_t*) y)[idx]) {
                printf("Mismatch at channel %zu row %zu: got %g, expected %g\n",
                       n, r, x[idx], y[idx]);
                return 0;
            }
        }
    }
    return 1;
}

int main() {
    // Small integer-valued data: exact in f32, FMA-contraction independent.
    for (size_t k = 0; k < K; k++)
        for (size_t r = 0; r < M; r++)
            input[k * M + r] = (float)((int)((k * M + r) % 7) - 3);
    for (size_t n = 0; n < N; n++) {
        bias[n] = (float)((int)n - 1);          // -1, 0, 1, 2
        for (size_t k = 0; k < K; k++)
            Bmat[n * K + k] = (float)((int)((n + k) % 5) - 2);
    }

    // Build weights/dmap/nnzmap streams (dense, nr=1) following XNNPACK's
    // spmm test construction. dmap deltas are in units of M*sizeof(float).
    uint32_t nnz = 0, wcnt = 0;
    size_t last_kk = 0, first_kk = 0;
    int first_nzz = 1;
    for (size_t n = 0; n < N; n++) {
        weights[wcnt++] = bias[n];
        nnzmap[n] = 0;
        for (size_t kk = 0; kk < K; kk++) {
            // dense: every weight is a nonzero
            weights[wcnt++] = Bmat[n * K + kk];
            if (first_nzz) {
                first_kk = kk;
            } else {
                dmap[nnz++] = (int32_t)((int)kk - (int)last_kk) * (int32_t)(M * sizeof(float));
            }
            last_kk = kk;
            first_nzz = 0;
            nnzmap[n] += 1;
        }
    }
    // Return input pointer to its initial value after the last nonzero.
    dmap[nnz++] = (int32_t)((int)first_kk - (int)last_kk) * (int32_t)(M * sizeof(float));

    struct xnn_f32_minmax_params params;
    params.scalar.min = -5.0f;      // tight bounds so the clamp is exercised
    params.scalar.max = 10.0f;      // (accumulations range roughly [-20, 20])

    // input pointer passed in is base + first_kk*M (first_kk == 0 here).
    const float* in0 = input + first_kk * M;

    xnn_f32_spmm_minmax_ukernel_8x1__scalar(
        M * sizeof(float), N, in0, weights, dmap, nnzmap, gold,
        OUTPUT_STRIDE * sizeof(float), &params);
    test_rvv(
        M * sizeof(float), N, in0, weights, dmap, nnzmap, out_rvv,
        OUTPUT_STRIDE * sizeof(float), &params);

    printf(full_is_equal(out_rvv, gold) ? "PASS\n" : "FAIL\n");
    sys_reboot(SYS_REBOOT_COLD);
}
