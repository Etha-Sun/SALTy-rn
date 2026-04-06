#include <stdint.h>
#include <stddef.h>
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <assert.h>
#include <riscv_vector.h>
#include <zephyr/sys/reboot.h>
#include "src/xnnpack/common.h"
#include "src/xnnpack/math.h"
#include "src/xnnpack/microparams.h"
#include "src/xnnpack/vmulcaddc.h"


// Generated RVV kernel (from kernels/target/)
#include "f32-vmulcaddcfma.c"

#define ROWS 4
#define CHANNELS 8   /* number of float channels */
#define CHANNELS_BYTES (CHANNELS * sizeof(float))

static float input[ROWS * CHANNELS];
static float output_arr[ROWS * CHANNELS];
static float gold[ROWS * CHANNELS];
/* weights layout per c4 tile: [scale0 scale1 scale2 scale3 bias0 bias1 bias2 bias3] */
static float weights[(CHANNELS / 4) * 8];

// Scalar reference implementation
void reference_f32_vmulcaddc(
    size_t rows,
    size_t channels,
    const float* restrict input,
    size_t input_stride,
    const float* restrict weights,
    float* restrict output,
    size_t output_stride,
    const struct xnn_f32_minmax_params* params)
{
  assert(rows != 0);
  assert(channels != 0);
  assert(channels % sizeof(float) == 0);

  const size_t input_increment = input_stride * 2 - channels;
  const size_t output_increment = output_stride * 2 - channels;

  const float* i0 = input;
  float* o0 = output;
  const float* i1 = (const float*) ((uintptr_t) i0 + input_stride);
  float* o1 = (float*) ((uintptr_t) o0 + output_stride);

  const float vmin = params->scalar.min;
  const float vmax = params->scalar.max;
  do {
    if XNN_UNPREDICTABLE(rows < 2) {
      i1 = i0;
      o1 = o0;
    }

    const float* w = weights;
    size_t c = channels;
    for (; c >= 4 * sizeof(float); c -= 4 * sizeof(float)) {
      const float vscale0 = w[0];
      const float vscale1 = w[1];
      const float vscale2 = w[2];
      const float vscale3 = w[3];

      float vacc0x0 = i0[0];
      float vacc0x1 = i0[1];
      float vacc0x2 = i0[2];
      float vacc0x3 = i0[3];
      i0 += 4;
      float vacc1x0 = i1[0];
      float vacc1x1 = i1[1];
      float vacc1x2 = i1[2];
      float vacc1x3 = i1[3];
      i1 += 4;

      const float vbias0 = w[4];
      const float vbias1 = w[5];
      const float vbias2 = w[6];
      const float vbias3 = w[7];

      vacc0x0 = fmaf(vacc0x0, vscale0, vbias0);
      vacc0x1 = fmaf(vacc0x1, vscale1, vbias1);
      vacc0x2 = fmaf(vacc0x2, vscale2, vbias2);
      vacc0x3 = fmaf(vacc0x3, vscale3, vbias3);
      vacc1x0 = fmaf(vacc1x0, vscale0, vbias0);
      vacc1x1 = fmaf(vacc1x1, vscale1, vbias1);
      vacc1x2 = fmaf(vacc1x2, vscale2, vbias2);
      vacc1x3 = fmaf(vacc1x3, vscale3, vbias3);

      vacc0x0 = math_max_f32(vacc0x0, vmin);
      vacc0x1 = math_max_f32(vacc0x1, vmin);
      vacc0x2 = math_max_f32(vacc0x2, vmin);
      vacc0x3 = math_max_f32(vacc0x3, vmin);
      vacc1x0 = math_max_f32(vacc1x0, vmin);
      vacc1x1 = math_max_f32(vacc1x1, vmin);
      vacc1x2 = math_max_f32(vacc1x2, vmin);
      vacc1x3 = math_max_f32(vacc1x3, vmin);

      vacc0x0 = math_min_f32(vacc0x0, vmax);
      vacc0x1 = math_min_f32(vacc0x1, vmax);
      vacc0x2 = math_min_f32(vacc0x2, vmax);
      vacc0x3 = math_min_f32(vacc0x3, vmax);
      vacc1x0 = math_min_f32(vacc1x0, vmax);
      vacc1x1 = math_min_f32(vacc1x1, vmax);
      vacc1x2 = math_min_f32(vacc1x2, vmax);
      vacc1x3 = math_min_f32(vacc1x3, vmax);

      o0[0] = vacc0x0;
      o0[1] = vacc0x1;
      o0[2] = vacc0x2;
      o0[3] = vacc0x3;
      o0 += 4;
      o1[0] = vacc1x0;
      o1[1] = vacc1x1;
      o1[2] = vacc1x2;
      o1[3] = vacc1x3;
      o1 += 4;

      w += 8;
    }
    if XNN_UNLIKELY(c != 0) {
      do {
        const float vscale = *w++;

        float vacc0 = *i0++;
        float vacc1 = *i1++;

        const float vbias = w[3];

        vacc0 = fmaf(vacc0, vscale, vbias);
        vacc1 = fmaf(vacc1, vscale, vbias);

        vacc0 = math_max_f32(vacc0, vmin);
        vacc1 = math_max_f32(vacc1, vmin);

        vacc0 = math_min_f32(vacc0, vmax);
        vacc1 = math_min_f32(vacc1, vmax);

        *o0++ = vacc0;
        *o1++ = vacc1;

        c -= sizeof(float);
      } while (c != 0);
    }
    i0 = (const float*) ((uintptr_t) i0 + input_increment);
    o0 = (float*) ((uintptr_t) o0 + output_increment);
    i1 = (const float*) ((uintptr_t) i1 + input_increment);
    o1 = (float*) ((uintptr_t) o1 + output_increment);
    rows = doz(rows, 2);
  } while (rows != 0);
}

int full_is_equal(float* x, float* y, size_t n) {
    for (size_t i = 0; i < n; i++) {
        float diff = x[i] - y[i];
        if (diff < 0) diff = -diff;
        if (diff > 1e-5f) {
            printf("Mismatch at index %zu: got %f, expected %f\n", i, x[i], y[i]);
            return 0;
        }
    }
    return 1;
}

int main() {
    static struct xnn_f32_minmax_params params_storage;

    params_storage.scalar.min = -10.0f;
    params_storage.scalar.max = 10.0f;

    // Initialize input data
    for (size_t i = 0; i < ROWS * CHANNELS; i++) {
        input[i] = (float)(rand() % 200 - 100) / 10.0f;
    }

    // Initialize weights: [s0 s1 s2 s3 b0 b1 b2 b3] per tile of 4 channels
    for (size_t tile = 0; tile < CHANNELS / 4; tile++) {
        for (size_t lane = 0; lane < 4; lane++) {
            weights[tile * 8 + lane]     = (float)(rand() % 20 + 1) / 10.0f;
            weights[tile * 8 + 4 + lane] = (float)(rand() % 100 - 50) / 10.0f;
        }
    }

    // Clear output
    for (size_t i = 0; i < ROWS * CHANNELS; i++) {
        output_arr[i] = 0.0f;
    }

    size_t stride = CHANNELS_BYTES;

    // Compute gold reference
    reference_f32_vmulcaddc(ROWS, CHANNELS_BYTES, input, stride, weights, gold, stride, &params_storage);

    // Call the generated RVV kernel
    test_rvv(ROWS, CHANNELS_BYTES, input, stride, weights, output_arr, stride, &params_storage);

    if (full_is_equal(output_arr, gold, ROWS * CHANNELS)) {
        printf("PASS\n");
    } else {
        printf("FAIL\n");
    }

    sys_reboot(SYS_REBOOT_COLD);
}
