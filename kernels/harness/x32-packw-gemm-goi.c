#include <stdint.h>
#include <stddef.h>
#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include <riscv_vector.h>
#include <zephyr/sys/reboot.h>
#include "src/xnnpack/common.h"
#include "src/xnnpack/math.h"

// Gold: XNNPACK scalar reference ukernel
#include "x32-packw/gen/x32-packw-x2-gemm-goi-scalar-int-u4.c"

// Translated RVV kernel (from kernels/target/), defines test_rvv
#include "x32-packw-gemm-goi.c"

#define FILL 0xDEADBEEFu  // sentinel for untouched/padding output cells

#define MAX_G   3
#define MAX_NC  9
#define MAX_KC  9
#define MAX_EB_WORDS 3   // max extra_bytes expressed in words


#define NR 2
#define NBLK_MAX ((MAX_NC + NR - 1) / NR)
#define BLK_WORDS_MAX (NR + NR * MAX_KC + MAX_EB_WORDS)
#define OUT_WORDS (MAX_G * NBLK_MAX * BLK_WORDS_MAX + 8)

static uint32_t weights[MAX_G * MAX_NC * MAX_KC + 8];
static uint32_t bias_buf[MAX_G * MAX_NC + 8];
static uint32_t out_rvv[OUT_WORDS];
static uint32_t gold[OUT_WORDS];

// Distinct per-element word so any misplacement is detectable.
// Encodes group/channel/k indices into one 32-bit value.
static uint32_t wval(size_t gi, size_t ni, size_t ki) {
    return 0x40000000u | ((uint32_t) gi << 24) | ((uint32_t) ni << 12) | (uint32_t) ki;
}
static uint32_t bval(size_t gi, size_t ni) {
    return 0x80000000u | ((uint32_t) gi << 24) | (uint32_t) ni;
}

static int run_case(size_t g, size_t nc, size_t kc, size_t eb_words,
                    int use_bias, const char* tag) {
    const size_t extra_bytes = eb_words * sizeof(uint32_t);

    // Fill weights: GOI layout = [g][nc][kc].
    for (size_t gi = 0; gi < g; gi++) {
        for (size_t ni = 0; ni < nc; ni++) {
            for (size_t ki = 0; ki < kc; ki++) {
                weights[(gi * nc + ni) * kc + ki] = wval(gi, ni, ki);
            }
        }
    }
    // Fill bias: [g][nc].
    for (size_t gi = 0; gi < g; gi++) {
        for (size_t ni = 0; ni < nc; ni++) {
            bias_buf[gi * nc + ni] = bval(gi, ni);
        }
    }

    for (size_t i = 0; i < OUT_WORDS; i++) {
        gold[i] = FILL;
        out_rvv[i] = FILL;
    }

    const uint32_t* bias = use_bias ? bias_buf : NULL;

    xnn_x32_packw_gemm_goi_ukernel_x2__scalar_int_u4(
        g, nc, kc, NR, 1, 1, weights, bias, NULL, gold, extra_bytes, NULL);
    test_rvv(
        g, nc, kc, NR, 1, 1, weights, bias, NULL, out_rvv, extra_bytes, NULL);

    for (size_t i = 0; i < OUT_WORDS; i++) {
        if (out_rvv[i] != gold[i]) {
            printf("[%s g=%zu nc=%zu kc=%zu eb=%zu bias=%d] mismatch at word %zu: "
                   "got 0x%08x, expected 0x%08x\n",
                   tag, g, nc, kc, eb_words, use_bias, i, out_rvv[i], gold[i]);
            return 0;
        }
    }
    return 1;
}

int main() {
    int ok = 1;

    // Even nc, even kc: pure NR-block body, no NC or KC remainder.
    ok &= run_case(1, 4, 4, 0, 1, "even-bias");
    ok &= run_case(1, 4, 4, 0, 0, "even-nobias");

    // Even nc, odd kc: KC remainder of 1 inside the main NR-block.
    ok &= run_case(1, 4, 5, 0, 1, "kc-odd-bias");
    ok &= run_case(1, 4, 5, 0, 0, "kc-odd-nobias");

    // Odd nc: hits the NC-remainder-of-1 block. With bias!=NULL the NEON/scalar
    // padding agree exactly (avoid bias==NULL odd-nc: documented divergence).
    ok &= run_case(1, 5, 4, 0, 1, "nc-odd-bias");
    ok &= run_case(1, 5, 5, 0, 1, "nc-kc-odd-bias");

    // extra_bytes padding: padding cells must stay sentinel in both buffers.
    ok &= run_case(1, 4, 4, 2, 1, "eb-bias");
    ok &= run_case(1, 4, 4, 2, 0, "eb-nobias");
    ok &= run_case(1, 5, 5, 3, 1, "eb-nc-kc-odd-bias");

    // Multiple groups.
    ok &= run_case(2, 4, 3, 0, 1, "g2-bias");
    ok &= run_case(3, 4, 4, 1, 0, "g3-eb-nobias");
    ok &= run_case(2, 5, 4, 2, 1, "g2-nc-odd-eb-bias");

    // Minimal shapes.
    ok &= run_case(1, 2, 1, 0, 1, "min-2x1-bias");
    ok &= run_case(1, 1, 1, 0, 1, "min-1x1-bias");
    ok &= run_case(1, 1, 3, 0, 1, "nc1-kc3-bias");

    // Larger nc/kc spanning many NR-blocks.
    ok &= run_case(1, 8, 8, 0, 1, "large-bias");
    ok &= run_case(1, 9, 9, 1, 1, "large-odd-eb-bias");

    printf(ok ? "PASS\n" : "FAIL\n");
    sys_reboot(SYS_REBOOT_COLD);
}
