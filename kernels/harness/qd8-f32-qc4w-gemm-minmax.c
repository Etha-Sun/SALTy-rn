#include <stdint.h>
#include <stddef.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <float.h>
#include <assert.h>
#include <riscv_vector.h>
#include <zephyr/sys/reboot.h>
#include "src/xnnpack/common.h"
#include "src/xnnpack/math.h"
#include "src/xnnpack/microparams.h"

// Gold: XNNPACK scalar reference ukernel (mr<=1, nr=1)
#include "qd8-f32-qc4w-gemm/gen/qd8-f32-qc4w-gemm-1x1-minmax-scalar.c"

// Translated RVV kernel (from kernels/target/), defines test_rvv (1x4v, nr=NR)
#include "qd8-f32-qc4w-gemm-minmax.c"

// qd8 = activations dynamically int8-quantized with PER-ROW {zero_point, inv_scale}.
// qc4w = weights are 4-bit, packed via XNNPACK's pack_qs8_qc4w_gemm_goi_w
//   (kr=1, sr=1, kernel_zero_point=8, input_zero_point=1). Per NR-block layout:
//     [vksum: nr i32][weights: (kc2/2)*nr bytes][filter_scale: nr f32][bias: nr f32]
//   The scalar gold reads nr=1 (channel-major); the RVV target reads nr=NR.
// Both kernels do integer >>4 then f32 (mul inv_scale)(mul kernel_scale)(add bias)
//   in identical order, so gold==RVV bit-exact; tolerance below is the XNNPACK
//   tester's and only guards against unexpected ordering effects.

#define MAX_N 40
#define MAX_K 40
#define MAX_NR 64                 // upper bound on vsetvlmax_e32m4 lanes

// Logical (unpacked) problem data.
static uint8_t k4[MAX_N * MAX_K]; // 4-bit weight nibbles (0..15), row-major [n][k]
static float kscale[MAX_N];       // per-channel kernel (filter) scale
static float kbias[MAX_N];        // per-channel bias
static int8_t a[MAX_K + 1];       // int8 activations for the single row (+slack)
static struct xnn_qd8_quantization_params qp[1];

// Packed weight buffers. Worst case per NR-block: nr*4 + (K2/2)*nr + nr*4 + nr*4.
static uint8_t w_scalar[MAX_N * (4 + MAX_K / 2 + 8) + 64];
static uint8_t w_rvv[(MAX_N + MAX_NR) * (4 + MAX_K / 2 + 8) + 4 * MAX_NR * 16];

static float out_rvv[MAX_N + MAX_NR];
static float gold[MAX_N];

// Emulate pack_qs8_qc4w_gemm_goi_w for kr=1, sr=1, kernel_zero_point=8,
// input_zero_point=1, bias=null (vksum stores -rowsum*16; scale/bias appended).
static size_t pack(int nc, int kc, int nr, uint8_t* out) {
    const int izp = 1, kzp = 8;
    const int kc2 = (kc + 1) & ~1;
    uint8_t* w = out;
    for (int nb = 0; nb < nc; nb += nr) {
        const int nbs = (nc - nb < nr) ? (nc - nb) : nr;
        int32_t* pb = (int32_t*) w;
        for (int i = 0; i < nbs; i++) pb[i] = 0;
        w += (size_t) nr * sizeof(int32_t);
        for (int kbs = 0; kbs < kc2; kbs += 2) {
            for (int off = 0; off < nbs; off++) {
                const int oc = nb + off;
                uint8_t kv_lo = kzp, kv_hi = kzp;
                if (kbs     < kc) kv_lo = k4[oc * kc + kbs];
                if (kbs + 1 < kc) kv_hi = k4[oc * kc + kbs + 1];
                const uint8_t kv = (uint8_t) ((kv_lo | (kv_hi << 4)) ^ 0x88);
                pb[off] -= ((int) kv_lo - kzp + (int) kv_hi - kzp) * izp * 16;
                w[off] = kv;
            }
            w += nr; // one byte per channel per k-pair
        }
        float* fs = (float*) w; w += (size_t) nr * sizeof(float);
        for (int i = 0; i < nbs; i++) fs[i] = kscale[nb + i];
        float* fb = (float*) w; w += (size_t) nr * sizeof(float);
        for (int i = 0; i < nbs; i++) fb[i] = kbias[nb + i];
    }
    return (size_t) (w - out);
}

static int run_shape(int N, int K, int NR, unsigned seed) {
    srand(seed);
    const int K2 = (K + 1) & ~1;

    // Representative + edge-case data. Nibbles cover full 0..15 (incl. zero-point
    // value 8 and the min/max nibbles 0 and 15). Activations include min/max int8.
    for (int i = 0; i < N * K; i++) k4[i] = (uint8_t) (rand() & 0xF);
    if (N * K >= 4) { k4[0] = 0; k4[1] = 15; k4[2] = 8; k4[3] = 7; }
    for (int n = 0; n < N; n++) {
        kscale[n] = 0.5f + (rand() % 150) / 100.0f;          // [0.5, 2.0)
        kbias[n]  = (float) ((rand() % 201) - 100) / 100.0f; // [-1.0, 1.0]
    }
    for (int k = 0; k < K2; k++) a[k] = (int8_t) (rand() % 255 - 127);
    if (K2 >= 2) { a[0] = INT8_MIN; a[1] = INT8_MAX; }

    qp[0].zero_point = (rand() % 21) - 10;
    // inv_scale normalized so f32 results stay in the tester's intended range.
    qp[0].inv_scale = (0.5f + (rand() % 150) / 100.0f) / (float) (K2 * 64);

    struct xnn_f32_qc4w_minmax_params params;
    params.scalar.min = -1e30f;          // wide bounds; a second shape clamps
    params.scalar.max =  1e30f;
    params.scalar.kernel_zero_point = 8;

    memset(w_scalar, 0, sizeof(w_scalar));
    memset(w_rvv, 0, sizeof(w_rvv));
    pack(N, K, 1,  w_scalar);
    pack(N, K, NR, w_rvv);

    for (int i = 0; i < N; i++) gold[i] = 0.0f;
    for (int i = 0; i < N + NR; i++) out_rvv[i] = 0.0f;

    // Gold: nr=1 => cn_stride = sizeof(float) (contiguous channels).
    xnn_qd8_f32_qc4w_gemm_minmax_ukernel_1x1__scalar(
        1, N, K2, a, K2 * sizeof(int8_t), w_scalar, gold,
        0, sizeof(float), &params, qp);
    // RVV: nr=NR => cn_stride = NR*sizeof(float); blocks land contiguously.
    test_rvv(
        1, N, K2, a, K2 * sizeof(int8_t), w_rvv, out_rvv,
        0, (size_t) NR * sizeof(float), &params, qp);

    // XNNPACK gemm-microkernel-tester tolerance for qd8_f32_qc4w:
    //   compute_sum_tolerance(max_abs_product=32, reduction=k, eps=FLT_EPSILON)
    //   * dynamic_quantization_ops(=2)
    const float eps = FLT_EPSILON;
    const float tol = (float) (((double) K * eps * 32.0 + eps) * 2.0);

    int ok = 1;
    for (int n = 0; n < N; n++) {
        const float g = gold[n], r = out_rvv[n];
        if (fabsf(g - r) > tol) {
            printf("Mismatch N=%d K=%d n=%d: gold=%.9g rvv=%.9g (|d|=%.3g tol=%.3g) "
                   "azp=%d inv_scale=%.9g\n",
                   N, K, n, g, r, (double) fabsf(g - r), (double) tol,
                   (int) qp[0].zero_point, (double) qp[0].inv_scale);
            ok = 0;
        }
    }
    return ok;
}

int main() {
    size_t NRz = __riscv_vsetvlmax_e32m4();
    if (NRz < 1) NRz = 1;
    if (NRz > MAX_NR) NRz = MAX_NR;
    const int NR = (int) NRz;

    // Shapes: full block, tails (nc&8/4/2/1 paths), multi-block (N>NR),
    // and odd/even K incl. K=1 (nibble padding) and K crossing the 8-k body.
    const int Ns[] = {1, 2, 3, 4, 7, 8, 15, 16, 17, 31, 33};
    const int Ks[] = {1, 2, 3, 4, 7, 8, 9, 16, 17, 33};

    int ok = 1;
    for (unsigned s = 0; s < sizeof(Ns) / sizeof(int); s++) {
        for (unsigned t = 0; t < sizeof(Ks) / sizeof(int); t++) {
            int N = Ns[s], K = Ks[t];
            if (N > MAX_N || K > MAX_K) continue;
            ok &= run_shape(N, K, NR, 1000u + s * 131u + t * 17u);
        }
    }

    // One shape exercising the f32 min/max clamp on both kernels.
    {
        const int N = 17, K = 16;
        srand(424242);
        for (int i = 0; i < N * K; i++) k4[i] = (uint8_t) (rand() & 0xF);
        for (int n = 0; n < N; n++) { kscale[n] = 1.0f + n; kbias[n] = 0.0f; }
        for (int k = 0; k < ((K + 1) & ~1); k++) a[k] = (int8_t) (rand() % 255 - 127);
        qp[0].zero_point = 3;
        qp[0].inv_scale = 1.0f;          // large -> results far outside clamp
        struct xnn_f32_qc4w_minmax_params params;
        params.scalar.min = -50.0f;
        params.scalar.max =  50.0f;
        params.scalar.kernel_zero_point = 8;
        memset(w_scalar, 0, sizeof(w_scalar));
        memset(w_rvv, 0, sizeof(w_rvv));
        pack(N, K, 1,  w_scalar);
        pack(N, K, NR, w_rvv);
        for (int i = 0; i < N; i++) gold[i] = 0.0f;
        for (int i = 0; i < N + NR; i++) out_rvv[i] = 0.0f;
        xnn_qd8_f32_qc4w_gemm_minmax_ukernel_1x1__scalar(
            1, N, (K + 1) & ~1, a, (((K + 1) & ~1)) * sizeof(int8_t), w_scalar, gold,
            0, sizeof(float), &params, qp);
        test_rvv(
            1, N, (K + 1) & ~1, a, (((K + 1) & ~1)) * sizeof(int8_t), w_rvv, out_rvv,
            0, (size_t) NR * sizeof(float), &params, qp);
        for (int n = 0; n < N; n++) {
            if (gold[n] != out_rvv[n]) {            // clamp path is bit-exact
                printf("Clamp mismatch n=%d: gold=%.9g rvv=%.9g\n", n, gold[n], out_rvv[n]);
                ok = 0;
            }
        }
    }

    printf(ok ? "PASS\n" : "FAIL\n");
    sys_reboot(SYS_REBOOT_COLD);
}
