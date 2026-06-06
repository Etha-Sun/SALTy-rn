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
#include "f32-vbinary/gen/f32-vmin-scalar-u1.c"

// Translated RVV kernel (from kernels/target/), defines test_rvv
#include "f32-vmin.c"

#define BATCH_SIZE 64
#define BATCH_BYTES (BATCH_SIZE * sizeof(float))

static float input_a[BATCH_SIZE];
static float input_b[BATCH_SIZE];
static float out_rvv[BATCH_SIZE];
static float gold[BATCH_SIZE];

int full_is_equal(const float* x, const float* y) {
    for (size_t i = 0; i < BATCH_SIZE; i++) {
        if (((const uint32_t*) x)[i] != ((const uint32_t*) y)[i]) {
            printf("Mismatch at index %zu: a=%g b=%g got %g, expected %g\n",
                   i, input_a[i], input_b[i], x[i], y[i]);
            return 0;
        }
    }
    return 1;
}

int main() {
    struct xnn_f32_default_params params;

    // Distinct, finite values (no NaN, no a==b, no signed-zero straddle) so
    // the GCC scalar gold (b<a?b:a), NEON vminq, and RVV vfmin all agree.
    for (size_t i = 0; i < BATCH_SIZE; i++) {
        input_a[i] = (float)(2 * (int)i - 64) * 0.5f;
        input_b[i] = (float)(64 - 2 * (int)i) * 0.5f + 0.25f;
    }
    input_a[0] = -1e30f;  input_b[0] = 1e30f;   // extreme spread
    input_a[1] = 5.0f;    input_b[1] = -5.0f;   // a > b
    input_a[2] = -5.0f;   input_b[2] = 5.0f;    // a < b

    xnn_f32_vmin_ukernel__scalar_u1(BATCH_BYTES, input_a, input_b, gold, &params);
    test_rvv(BATCH_BYTES, input_a, input_b, out_rvv, &params);

    printf(full_is_equal(out_rvv, gold) ? "PASS\n" : "FAIL\n");
    sys_reboot(SYS_REBOOT_COLD);
}
