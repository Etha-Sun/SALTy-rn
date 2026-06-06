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
#include "f32-vcmul/gen/f32-vcmul-scalar-u1.c"

// Translated RVV kernel (from kernels/target/), defines test_rvv
#include "f32-vcmul.c"

// Number of complex elements; each buffer is split [real | imag], so 2x floats.
#define BATCH_SIZE 64
#define BATCH_BYTES (BATCH_SIZE * sizeof(float))

static float input_a[2 * BATCH_SIZE];   // [ar(BATCH) | ai(BATCH)]
static float input_b[2 * BATCH_SIZE];   // [br(BATCH) | bi(BATCH)]
static float out_rvv[2 * BATCH_SIZE];   // [or(BATCH) | oi(BATCH)]
static float gold[2 * BATCH_SIZE];

int full_is_equal(const float* x, const float* y) {
    for (size_t i = 0; i < 2 * BATCH_SIZE; i++) {
        if (((const uint32_t*) x)[i] != ((const uint32_t*) y)[i]) {
            size_t k = i % BATCH_SIZE;
            const char* part = (i < BATCH_SIZE) ? "real" : "imag";
            printf("Mismatch at %s index %zu: ar=%g ai=%g br=%g bi=%g got %g, expected %g\n",
                   part, k,
                   input_a[k], input_a[BATCH_SIZE + k],
                   input_b[k], input_b[BATCH_SIZE + k],
                   x[i], y[i]);
            return 0;
        }
    }
    return 1;
}

int main() {
    struct xnn_f32_default_params params;

    for (size_t i = 0; i < 2 * BATCH_SIZE; i++) {
        input_a[i] = (float)(rand() % 2001 - 1000) * 0.0625f;
        input_b[i] = (float)(rand() % 2001 - 1000) * 0.0625f;
    }
    // edge cases on the first complex element
    input_a[0] = 0.0f;            input_a[BATCH_SIZE + 0] = 0.0f;   // a = 0
    input_b[0] = 3.0f;            input_b[BATCH_SIZE + 0] = -4.0f;
    input_a[1] = 1.0f;            input_a[BATCH_SIZE + 1] = 0.0f;   // a = 1+0i
    input_b[1] = 5.0f;            input_b[BATCH_SIZE + 1] = 7.0f;
    input_a[2] = 1e20f;           input_a[BATCH_SIZE + 2] = 1e20f;  // overflow

    xnn_f32_vcmul_ukernel__scalar_u1(BATCH_BYTES, input_a, input_b, gold, &params);
    test_rvv(BATCH_BYTES, input_a, input_b, out_rvv, &params);

    printf(full_is_equal(out_rvv, gold) ? "PASS\n" : "FAIL\n");
    sys_reboot(SYS_REBOOT_COLD);
}
