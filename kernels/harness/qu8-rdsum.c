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
#include "qu8-rdsum/gen/qu8-rdsum-scalar.c"

// Translated RVV kernel (from kernels/target/), defines test_rvv
#include "qu8-rdsum.c"

#define ROWS 10
#define CHANNELS 16

static uint8_t input[ROWS * CHANNELS];
static uint8_t zero[CHANNELS];        // zero-padding row for the 7p7x tail
static uint32_t out_rvv[CHANNELS];
static uint32_t gold[CHANNELS];

int full_is_equal(const uint32_t* x, const uint32_t* y) {
    for (size_t i = 0; i < CHANNELS; i++) {
        if (x[i] != y[i]) {
            printf("Mismatch at channel %zu: got %u, expected %u\n", i, x[i], y[i]);
            return 0;
        }
    }
    return 1;
}

int main() {
    struct xnn_qs8_rsum_params params = {0};
    const size_t input_stride = CHANNELS;   // contiguous rows, bytes per row

    for (size_t i = 0; i < ROWS * CHANNELS; i++) {
        input[i] = (uint8_t)(rand() % 256);
    }
    // accumulating output, start from zero
    for (size_t i = 0; i < CHANNELS; i++) { gold[i] = 0; out_rvv[i] = 0; zero[i] = 0; }

    xnn_qu8_rdsum_ukernel_7p7x__scalar_u4(ROWS, CHANNELS, input, input_stride, zero, gold, &params);
    test_rvv(ROWS, CHANNELS, input, input_stride, zero, out_rvv, &params);

    printf(full_is_equal(out_rvv, gold) ? "PASS\n" : "FAIL\n");
    sys_reboot(SYS_REBOOT_COLD);
}
