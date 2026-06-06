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
#include "qs8-vmul/gen/qs8-vmul-minmax-fp32-scalar-u1.c"

// Translated RVV kernel (from kernels/target/), defines test_rvv
#include "qs8-vmul-minmax-fp32.c"

#define BATCH_SIZE 64

static int8_t input_a[BATCH_SIZE];
static int8_t input_b[BATCH_SIZE];
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
    // scalar and NEON/RVV fp32-mul kernels read the same .scalar fields.
    union xnn_qs8_mul_minmax_params params;
    params.scalar.a_zero_point = 5;
    params.scalar.b_zero_point = -3;
    params.scalar.scale = 0.02f;
    params.scalar.output_zero_point = 7;
    params.scalar.output_min = -127;
    params.scalar.output_max = 127;

    for (size_t i = 0; i < BATCH_SIZE; i++) {
        input_a[i] = (int8_t)(rand() % 256 - 128);
        input_b[i] = (int8_t)(rand() % 256 - 128);
    }

    xnn_qs8_vmul_minmax_fp32_ukernel__scalar_u1(BATCH_SIZE, input_a, input_b, gold, &params);
    test_rvv(BATCH_SIZE, input_a, input_b, out_rvv, &params);

    printf(full_is_equal(out_rvv, gold) ? "PASS\n" : "FAIL\n");
    sys_reboot(SYS_REBOOT_COLD);
}
