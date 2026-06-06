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
#include "qs8-f32-vcvt/gen/qs8-f32-vcvt-scalar-u1.c"

// Translated RVV kernel (from kernels/target/), defines test_rvv
#include "qs8-f32-vcvt.c"

#define BATCH_SIZE 64

static int8_t input[BATCH_SIZE];
static float out_rvv[BATCH_SIZE];
static float gold[BATCH_SIZE];

int full_is_equal(const float* x, const float* y) {
    for (size_t i = 0; i < BATCH_SIZE; i++) {
        if (x[i] != y[i]) {   // both compute (x - zero_point) * scale identically
            printf("Mismatch at index %zu: got %f, expected %f\n", i, (double) x[i], (double) y[i]);
            return 0;
        }
    }
    return 1;
}

int main() {
    struct xnn_qs8_f32_cvt_params params;
    params.scalar.zero_point = -7;
    params.scalar.scale = 0.05f;

    for (size_t i = 0; i < BATCH_SIZE; i++) {
        input[i] = (int8_t)(rand() % 256 - 128);
    }

    xnn_qs8_f32_vcvt_ukernel__scalar_u1(BATCH_SIZE, input, gold, &params);
    test_rvv(BATCH_SIZE, input, out_rvv, &params);

    printf(full_is_equal(out_rvv, gold) ? "PASS\n" : "FAIL\n");
    sys_reboot(SYS_REBOOT_COLD);
}
