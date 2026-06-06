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
#include "qs8-vcvt/gen/qs8-vcvt-scalar-u1.c"

// Translated RVV kernel (from kernels/target/), defines test_rvv
#include "qs8-vcvt.c"

#define BATCH_SIZE 64

static int8_t input[BATCH_SIZE];
static int8_t out_rvv[BATCH_SIZE];
static int8_t gold[BATCH_SIZE];

int full_is_equal(const int8_t* x, const int8_t* y) {
    for (size_t i = 0; i < BATCH_SIZE; i++) {
        if (x[i] != y[i]) {
            printf("Mismatch at index %zu: got %d, expected %d\n", i, x[i], y[i]);
            return 0;
        }
    }
    return 1;
}

int main() {
    // multiplier is the Q8 requant multiplier (~scale * 256); both kernels honor it.
    struct xnn_qs8_cvt_params params;
    params.scalar.input_zero_point = 10;
    params.scalar.multiplier = 192;   // scale ~= 0.75
    params.scalar.output_zero_point = -5;

    for (size_t i = 0; i < BATCH_SIZE; i++) {
        input[i] = (int8_t)(rand() % 256 - 128);
    }

    xnn_qs8_vcvt_ukernel__scalar_u1(BATCH_SIZE, input, gold, &params);
    test_rvv(BATCH_SIZE, input, out_rvv, &params);

    printf(full_is_equal(out_rvv, gold) ? "PASS\n" : "FAIL\n");
    sys_reboot(SYS_REBOOT_COLD);
}
