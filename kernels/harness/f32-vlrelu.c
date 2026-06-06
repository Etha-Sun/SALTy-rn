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
#include "f32-vlrelu/gen/f32-vlrelu-scalar-u1.c"

// Translated RVV kernel (from kernels/target/), defines test_rvv
#include "f32-vlrelu.c"

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
    struct xnn_f32_lrelu_params params;
    params.scalar.slope = 0.25f;        // negative-slope coefficient

    // Avoid -0.0f: NEON's int sign-bit test and the scalar float compare
    // (x < 0.0f) disagree on negative zero.
    for (size_t i = 0; i < BATCH_SIZE; i++) {
        input[i] = (float)(rand() % 2001 - 1000) * 0.125f;
    }
    input[0] = 0.0f;     // non-negative -> pass through
    input[1] = -8.0f;    // negative -> * slope
    input[2] = 8.0f;     // positive -> pass through
    input[3] = -1e30f;   // large negative
    input[4] = 1e30f;    // large positive

    xnn_f32_vlrelu_ukernel__scalar_u1(BATCH_BYTES, input, gold, &params);
    test_rvv(BATCH_BYTES, input, out_rvv, &params);

    printf(full_is_equal(out_rvv, gold) ? "PASS\n" : "FAIL\n");
    sys_reboot(SYS_REBOOT_COLD);
}
