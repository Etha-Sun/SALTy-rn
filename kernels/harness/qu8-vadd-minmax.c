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
#include "qu8-vadd/gen/qu8-vadd-minmax-scalar-u1.c"

// Translated RVV kernel (from kernels/target/), defines test_rvv
#include "qu8-vadd-minmax.c"

#define BATCH_SIZE 64

static uint8_t input_a[BATCH_SIZE];
static uint8_t input_b[BATCH_SIZE];
static uint8_t out_rvv[BATCH_SIZE];
static uint8_t gold[BATCH_SIZE];

int full_is_equal(const uint8_t* x, const uint8_t* y) {
    for (size_t i = 0; i < BATCH_SIZE; i++) {
        if (x[i] != y[i]) {
            printf("Mismatch at index %zu: got %d, expected %d\n", i, x[i], y[i]);
            return 0;
        }
    }
    return 1;
}

int main() {
    // bias folds in the zero points + rounding constant so the scalar gold's
    // truncating shift matches the NEON/RVV rounding requantization.
    const int azp = 130, bzp = 120, am = 2, bm = 3, shift = 2, ozp = 128;
    struct xnn_qu8_add_minmax_params params;
    params.scalar.a_zero_point = (uint8_t) azp;
    params.scalar.b_zero_point = (uint8_t) bzp;
    params.scalar.a_multiplier = am;
    params.scalar.b_multiplier = bm;
    params.scalar.shift = shift;
    params.scalar.bias = (1 << (shift - 1)) - azp * am - bzp * bm;
    params.scalar.output_zero_point = (int16_t) ozp;
    params.scalar.output_min = 0;
    params.scalar.output_max = 255;

    for (size_t i = 0; i < BATCH_SIZE; i++) {
        input_a[i] = (uint8_t)(rand() % 256);
        input_b[i] = (uint8_t)(rand() % 256);
    }

    xnn_qu8_vadd_minmax_ukernel__scalar_u1(BATCH_SIZE, input_a, input_b, gold, &params);
    test_rvv(BATCH_SIZE, input_a, input_b, out_rvv, &params);

    printf(full_is_equal(out_rvv, gold) ? "PASS\n" : "FAIL\n");
    sys_reboot(SYS_REBOOT_COLD);
}
