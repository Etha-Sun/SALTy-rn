#include <stdint.h>
#include <stddef.h>
#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include <math.h>
#include <riscv_vector.h>
#include <zephyr/sys/reboot.h>
#include "src/xnnpack/common.h"
#include "src/xnnpack/microparams.h"

// Gold: XNNPACK scalar reference ukernel
#include "f32-vrnd/gen/f32-vrndne-scalar-libm-u1.c"

// Translated RVV kernel (from kernels/target/), defines test_rvv
#include "f32-vrndne.c"

#define BATCH_SIZE 64
#define BATCH_BYTES (BATCH_SIZE * sizeof(float))

static float input[BATCH_SIZE];
static float out_rvv[BATCH_SIZE];
static float gold[BATCH_SIZE];

int full_is_equal(const float* x, const float* y) {
    for (size_t i = 0; i < BATCH_SIZE; i++) {
        if (((const uint32_t*) x)[i] != ((const uint32_t*) y)[i]) {
            printf("Mismatch at index %zu: x=%g got %g, expected %g\n",
                   i, input[i], x[i], y[i]);
            return 0;
        }
    }
    return 1;
}

int main() {
    struct xnn_f32_default_params params;

    for (size_t i = 0; i < BATCH_SIZE; i++) {
        input[i] = (float)(rand() % 4001 - 2000) * 0.0625f;
    }
    // round-to-nearest-EVEN halfway cases
    input[0] = 0.5f;    // -> 0 (even)
    input[1] = 1.5f;    // -> 2 (even)
    input[2] = 2.5f;    // -> 2 (even)
    input[3] = -0.5f;   // -> -0 (even)
    input[4] = -1.5f;   // -> -2 (even)
    input[5] = -2.5f;   // -> -2 (even)
    input[6] = 0.0f;    // pass through
    input[7] = 16777216.0f;  // 2^24, already integral, passes through
    input[8] = -8388608.5f;  // just at the magic threshold

    xnn_f32_vrndne_ukernel__scalar_libm_u1(BATCH_BYTES, input, gold, &params);
    test_rvv(BATCH_BYTES, input, out_rvv, &params);

    printf(full_is_equal(out_rvv, gold) ? "PASS\n" : "FAIL\n");
    sys_reboot(SYS_REBOOT_COLD);
}
