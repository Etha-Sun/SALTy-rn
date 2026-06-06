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
#include "f32-vbinary/gen/f32-vdiv-scalar-u1.c"

// Translated RVV kernel (from kernels/target/), defines test_rvv
#include "f32-vdiv.c"

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

    for (size_t i = 0; i < BATCH_SIZE; i++) {
        input_a[i] = (float)(rand() % 2001 - 1000) * 0.125f;
        // keep divisor away from zero to avoid inf/nan disagreements
        int b = rand() % 2000 - 1000;
        input_b[i] = (b >= 0 ? b + 1 : b) * 0.125f;
    }
    input_a[0] = 0.0f;          input_b[0] = 4.0f;    // 0 / x
    input_a[1] = 7.0f;          input_b[1] = 2.0f;    // exact-ish
    input_a[2] = 1e30f;         input_b[2] = 1e-10f;  // overflow to +inf
    input_a[3] = -1e30f;        input_b[3] = 1e-10f;  // overflow to -inf

    xnn_f32_vdiv_ukernel__scalar_u1(BATCH_BYTES, input_a, input_b, gold, &params);
    test_rvv(BATCH_BYTES, input_a, input_b, out_rvv, &params);

    printf(full_is_equal(out_rvv, gold) ? "PASS\n" : "FAIL\n");
    sys_reboot(SYS_REBOOT_COLD);
}
