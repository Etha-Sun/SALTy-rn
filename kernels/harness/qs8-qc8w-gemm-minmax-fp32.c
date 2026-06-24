#include <stdint.h>
#include <stddef.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>
#include <riscv_vector.h>
#include <zephyr/sys/reboot.h>
#include "src/xnnpack/common.h"
#include "src/xnnpack/math.h"
#include "src/xnnpack/microparams.h"

// Gold: XNNPACK scalar reference ukernel (fp32 requant, RNE via lrintf).
#include "qs8-qc8w-gemm/gen/qs8-qc8w-gemm-1x4-minmax-fp32-scalar-lrintf.c"

// Translated RVV kernel (from kernels/target/), defines test_rvv.
#include "qs8-qc8w-gemm-minmax-fp32.c"

// qc8w per-channel int8 GEMM: C[0][n] = clamp(round(bias[n] + sum_k A[k]*B[k][n]) * scale[n]).
// MR=1. Packed weights are NR-blocked, NR-strided:
//   per NR-block: [NR int32 bias][ per-k: NR int8 weights ][NR float32 scale].
// Gold reads NR=4 blocks; the RVV target reads NR=vlmax(e32m4) blocks, so we
// build a separate packed buffer per consumer using its own block stride.

#define MAXN 20            // output channels (covers >NR and non-multiple-of-NR tails)
#define MAXK 19            // accumulation depth (non-multiple of 8 / 4 tail)
#define MAXNR 512          // buffer headroom for runtime NR (vlmax e32m4)

static int8_t a_in[MAXK];                  // A row (1 x K), int8
static int32_t bias_n[MAXN];               // per-channel bias (int32)
static int8_t B_kn[MAXK * MAXN];           // weights B[k*N + n], int8
static float scale_n[MAXN];                // per-channel fp32 scale

// Packed weight buffers. Each NR-block is (NR*4 bias)+(K*NR weights)+(NR*4 scale).
// Gold NR=4. Target NR<=MAXNR; worst case is one wide block of MAXNR lanes:
//   ceil(N/NR)*(NR*8 + K*NR) <= MAXNR*(8 + K) when N<=NR.
static uint8_t packed_gold[((MAXN + 3) / 4) * (4 * 4 + MAXK * 4 + 4 * 4) + 64];
static uint8_t packed_rvv[MAXNR * (8 + MAXK) + 64];

static int8_t out_rvv[MAXN];
static int8_t gold[MAXN];

// Pack the logical (bias, B, scale) into an NR-blocked, nr-strided buffer.
// Channels beyond N within the final partial block are zero-filled (matches
// XNN_OOB_READS-padded weight buffers; those lanes are never stored to output).
static void pack(uint8_t* dst, size_t N, size_t K, size_t nr) {
    uint8_t* p = dst;
    for (size_t n0 = 0; n0 < N; n0 += nr) {
        const size_t blk = (N - n0 < nr) ? (N - n0) : nr;
        // bias: nr int32
        int32_t* pb = (int32_t*) p;
        for (size_t j = 0; j < nr; j++) {
            const size_t n = n0 + j;
            pb[j] = (j < blk && n < N) ? bias_n[n] : 0;
        }
        p += nr * sizeof(int32_t);
        // weights: per-k, nr int8
        for (size_t k = 0; k < K; k++) {
            for (size_t j = 0; j < nr; j++) {
                const size_t n = n0 + j;
                p[j] = (uint8_t) ((j < blk && n < N) ? B_kn[k * N + n] : 0);
            }
            p += nr;
        }
        // scale: nr float32
        float* ps = (float*) p;
        for (size_t j = 0; j < nr; j++) {
            const size_t n = n0 + j;
            ps[j] = (j < blk && n < N) ? scale_n[n] : 1.0f;
        }
        p += nr * sizeof(float);
    }
}

int full_is_equal(const int8_t* x, const int8_t* y, size_t N) {
    for (size_t n = 0; n < N; n++) {
        if (x[n] != y[n]) {
            printf("Mismatch at channel %zu: got %d, expected %d (bias=%d scale=%g)\n",
                   n, (int) x[n], (int) y[n], (int) bias_n[n], (double) scale_n[n]);
            return 0;
        }
    }
    return 1;
}

int main() {
    const size_t N = MAXN;
    const size_t K = MAXK;

    // A: int8 spanning [-128, 127], including extremes.
    for (size_t k = 0; k < K; k++) {
        a_in[k] = (int8_t) ((int) ((k * 37) % 256) - 128);
    }
    a_in[0] = -128; a_in[1] = 127; a_in[2] = 0;

    // B and per-channel bias/scale. Mix signs and magnitudes; pick a few channels
    // to drive saturation (large |product| * large scale) and clamp boundaries.
    for (size_t n = 0; n < N; n++) {
        for (size_t k = 0; k < K; k++) {
            B_kn[k * N + n] = (int8_t) ((int) ((k * 13 + n * 7) % 256) - 128);
        }
        bias_n[n] = (int32_t) ((int) (n * 1000) - 5000);
        // small scales keep most outputs mid-range; a couple large to saturate.
        scale_n[n] = 0.001f * (float) (1 + (n % 5));
    }
    // Force a saturating channel and a clamp-boundary channel.
    scale_n[3] = 5.0f;          // huge -> saturates to qmax/qmin clamp
    scale_n[7] = 0.0f;          // zero scale -> output == zero_point
    B_kn[0 * N + 5] = 127;      // strong positive lane
    B_kn[0 * N + 11] = -128;    // strong negative lane

    union xnn_qs8_qc8w_conv_minmax_params params;
    // fp32_scalar fields are what BOTH gold and the RVV target read.
    params.fp32_scalar.output_zero_point = 7;
    params.fp32_scalar.output_min = -120;
    params.fp32_scalar.output_max = 120;

    const size_t a_stride = K * sizeof(int8_t);
    const size_t cm_stride = N * sizeof(int8_t);   // MR=1 so cm_stride is unused
    // cn_stride is the per-NR-block output advance. For contiguous out[n] at byte
    // n it must equal the channels written per iteration: NR. Gold and target use
    // different NR, so each gets its own cn_stride.

    // Gold uses static NR=4 packing.
    memset(packed_gold, 0, sizeof(packed_gold));
    pack(packed_gold, N, K, 4);

    // RVV target uses runtime NR = vlmax(e32m4) packing; must match the nr the
    // target computes internally, so do not silently clamp it.
    size_t nr = __riscv_vsetvlmax_e32m4();
    if (nr < 1) nr = 1;
    assert(nr <= MAXNR);
    memset(packed_rvv, 0, sizeof(packed_rvv));
    pack(packed_rvv, N, K, nr);

    xnn_qs8_qc8w_gemm_minmax_fp32_ukernel_1x4__scalar_lrintf(
        1, N, K, a_in, a_stride, packed_gold, gold, cm_stride, 4 * sizeof(int8_t), &params);
    test_rvv(
        1, N, K, a_in, a_stride, packed_rvv, out_rvv, cm_stride, nr * sizeof(int8_t), &params);

    printf(full_is_equal(out_rvv, gold, N) ? "PASS\n" : "FAIL\n");
    sys_reboot(SYS_REBOOT_COLD);
}
