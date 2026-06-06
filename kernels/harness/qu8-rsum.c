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
#include "qu8-rsum/gen/qu8-rsum-scalar-u1.c"

// Translated RVV kernel (from kernels/target/), defines test_rvv
#include "qu8-rsum.c"

#define BATCH_SIZE 64

static uint8_t input[BATCH_SIZE];

int main() {
    struct xnn_qs8_rsum_params params = {0};

    for (size_t i = 0; i < BATCH_SIZE; i++) {
        input[i] = (uint8_t)(rand() % 256);
    }

    // The ukernels accumulate into *output, so start from zero.
    uint32_t gold = 0, out_rvv = 0;
    xnn_qu8_rsum_ukernel__scalar_u1(BATCH_SIZE, input, &gold, &params);
    test_rvv(BATCH_SIZE, input, &out_rvv, &params);

    if (out_rvv == gold) {
        printf("PASS\n");
    } else {
        printf("Mismatch: got %u, expected %u\n", out_rvv, gold);
        printf("FAIL\n");
    }
    sys_reboot(SYS_REBOOT_COLD);
}
