#include <stdint.h>
#include <stddef.h>
#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include <math.h>
#include <riscv_vector.h>
#include <zephyr/sys/reboot.h>
#include "src/xnnpack/common.h"
#include "src/xnnpack/math.h"
#include "src/xnnpack/microparams.h"

// Gold: XNNPACK scalar reference ukernel
#include "f32-raddstoreexpminusmax/gen/f32-raddstoreexpminusmax-scalar-rr2-p5-u1.c"

// Translated RVV kernel (from kernels/target/), defines test_rvv
#include "f32-raddstoreexpminusmax.c"

// Softmax building block: y[i] = exp(x[i] - max), stored to output[], plus a
// reduced scalar sum of all y[i]. Signature: (batch_bytes, input, max*, output,
// sum*, params). max and sum are by pointer; batch is in BYTES.
//
// NOT bit-exact: gold uses a degree-5 poly + sequential sum; the RVV target uses
// a different degree-6 poly + Cody-Waite reduction + tree (vfredusum) reduce.
// Compare with a RELATIVE tolerance (XNNPACK's own f32 tester uses 1e-6 on both
// per-element outputs and the sum, vs a double exp oracle). Host validation of
// gold-vs-target over many shapes/lane-widths: per-element divergence <= 2.1e-7,
// sum divergence <= 3.7e-7 at this batch; both under the 1e-6 bound.
//
// Inputs keep x-max in [-80, 0] (outputs in (0,1]), clear of the scalar denorm
// cutoff at -0x1.5D589Ep6f (~-87.34) where gold flushes to 0.0 but the target
// floors at xmin and emits a denormal -- a regime where a relative compare is
// undefined (divide-by-zero). No NaN/Inf.
#define ELEMENTS 1000          // not a multiple of vlmax -> exercises body + tail
#define OUTPUT_TOL 1.0e-6f     // relative, per output element
#define SUM_TOL    1.0e-6f     // relative, on the reduced sum

static float input[ELEMENTS];
static float out_rvv[ELEMENTS];
static float out_gold[ELEMENTS];
static float sum_rvv;
static float sum_gold;
static float maxval;

static int rel_close(float a, float b, float tol) {
    // relative error vs |b| (gold), with a tiny absolute floor to guard
    // divide-by-zero; in [-80,0] outputs are always well above the floor.
    float denom = fabsf(b);
    if (denom < 1.0e-30f) denom = 1.0e-30f;
    return fabsf(a - b) <= tol * denom;
}

int full_is_equal(void) {
    int ok = 1;
    for (size_t i = 0; i < ELEMENTS; i++) {
        if (!rel_close(out_rvv[i], out_gold[i], OUTPUT_TOL)) {
            printf("OUT mismatch at %zu: x-max %g, expected %g, got %g (rel %g)\n",
                   i, input[i] - maxval, out_gold[i], out_rvv[i],
                   fabsf(out_rvv[i] - out_gold[i]) / fabsf(out_gold[i]));
            ok = 0;
        }
    }
    if (!rel_close(sum_rvv, sum_gold, SUM_TOL)) {
        printf("SUM mismatch: expected %g, got %g (rel %g)\n",
               sum_gold, sum_rvv,
               fabsf(sum_rvv - sum_gold) / fabsf(sum_gold));
        ok = 0;
    }
    return ok;
}

int main() {
    // x-max in [-80, 0]: deterministic spread plus edge values that straddle
    // the benign extremes. One element is exactly the max (x-max == 0).
    unsigned seed = 0x9E3779B9u;
    for (size_t i = 0; i < ELEMENTS; i++) {
        seed = seed * 1103515245u + 12345u;
        float r = (float)((seed >> 9) & 0x7fffff) / (float)0x7fffff;  // [0,1]
        input[i] = -80.0f * r;
    }
    input[ELEMENTS / 2] = 0.0f;        // exact max -> x-max == 0 -> exp == 1.0
    input[0] = -79.9f;                 // near the benign low extreme
    input[1] = -0.5f;                  // near 1.0
    input[2] = -40.0f;                 // mid-range underflow toward 0

    maxval = input[0];
    for (size_t i = 0; i < ELEMENTS; i++) if (input[i] > maxval) maxval = input[i];

    for (size_t i = 0; i < ELEMENTS; i++) { out_gold[i] = 0.0f; out_rvv[i] = 0.0f; }
    sum_gold = 0.0f; sum_rvv = 0.0f;

    xnn_f32_raddstoreexpminusmax_ukernel__scalar_rr2_p5_u1(
        ELEMENTS * sizeof(float), input, &maxval, out_gold, &sum_gold, NULL);
    test_rvv(
        ELEMENTS * sizeof(float), input, &maxval, out_rvv, &sum_rvv, NULL);

    printf(full_is_equal() ? "PASS\n" : "FAIL\n");
    sys_reboot(SYS_REBOOT_COLD);
}
