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
#include "f32-f16-vcvt/gen/f32-f16-vcvt-scalar-bitcast-u1.c"

// Translated RVV kernel (from kernels/target/), defines test_rvv
#include "f32-f16-vcvt.c"

#define BATCH_SIZE 64
#define BATCH_BYTES (BATCH_SIZE * sizeof(float))

static float input[BATCH_SIZE];
static uint16_t out_rvv[BATCH_SIZE];
static uint16_t gold[BATCH_SIZE];

static float f32_from_bits(uint32_t b) {
    float f;
    __builtin_memcpy(&f, &b, sizeof(f));
    return f;
}

// Compare raw f16 bit patterns (NaN payload / signed zero / Inf must match exactly).
int full_is_equal(const uint16_t* x, const uint16_t* y) {
    for (size_t i = 0; i < BATCH_SIZE; i++) {
        if (x[i] != y[i]) {
            printf("Mismatch at index %zu: in=%g got 0x%04x, expected 0x%04x\n",
                   i, (double) input[i], x[i], y[i]);
            return 0;
        }
    }
    return 1;
}

int main() {
    for (size_t i = 0; i < BATCH_SIZE; i++) {
        input[i] = (float)(rand() % 2001 - 1000) * 0.0625f;
    }
    // edge cases on the first elements
    input[0] = 0.0f;                       // +0
    input[1] = -0.0f;                       // -0
    input[2] = 1.0e-9f;                     // denormal-flush to f16
    input[3] = 1.0e20f;                     // overflow to +Inf in f16
    input[4] = -1.0e20f;                    // overflow to -Inf in f16
    input[5] = f32_from_bits(0x7F800000);   // +Inf
    input[6] = f32_from_bits(0xFF800000);   // -Inf
    input[7] = f32_from_bits(0x7FC00000);   // NaN
    input[8] = f32_from_bits(0x3F801000);   // round-to-nearest-even at f16 mantissa boundary
    input[9] = f32_from_bits(0x3F803000);   // round-to-nearest-even at f16 mantissa boundary

    xnn_f32_f16_vcvt_ukernel__scalar_bitcast_u1(BATCH_BYTES, input, (void*) gold, NULL);
    test_rvv(BATCH_BYTES, input, out_rvv, NULL);

    printf(full_is_equal(out_rvv, gold) ? "PASS\n" : "FAIL\n");
    sys_reboot(SYS_REBOOT_COLD);
}
