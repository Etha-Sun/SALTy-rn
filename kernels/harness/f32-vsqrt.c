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
#include "f32-vsqrt/gen/f32-vsqrt-scalar-sqrt.c"

// Translated RVV kernel (from kernels/target/), defines test_rvv
#include "f32-vsqrt.c"

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

    // Non-negative inputs (sqrt of a negative is NaN; avoid payload disputes).
    for (size_t i = 0; i < BATCH_SIZE; i++) {
        input[i] = (float)(rand() % 100000) * 0.001f;
    }
    input[0] = 0.0f;        // sqrt(0) = 0
    input[1] = 1.0f;        // sqrt(1) = 1
    input[2] = 4.0f;        // perfect square
    input[3] = 2.0f;        // irrational, exercises rounding
    input[4] = 1e30f;       // large
    input[5] = 1e-30f;      // tiny (denormal-ish result)

    xnn_f32_vsqrt_ukernel__scalar_sqrt_u1(BATCH_BYTES, input, gold, &params);
    test_rvv(BATCH_BYTES, input, out_rvv, &params);

    printf(full_is_equal(out_rvv, gold) ? "PASS\n" : "FAIL\n");
    sys_reboot(SYS_REBOOT_COLD);
}
