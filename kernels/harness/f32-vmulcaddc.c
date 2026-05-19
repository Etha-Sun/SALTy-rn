#include <stdint.h>
#include <stddef.h>
#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include <riscv_vector.h>
#include <zephyr/sys/reboot.h>
#include "src/xnnpack/common.h"
#include "src/xnnpack/math.h"
#include "src/xnnpack/microparams.h"
#include "src/xnnpack/vmulcaddc.h"


// Generated RVV kernel (from kernels/target/)
#include "f32-vmulcaddc.c"

#define ROWS 4

/* CR = VLMAX for e32m4 = 4 * vlenb / sizeof(float).
   We size arrays for the maximum expected CR (VLEN=512 → CR=64). */
#define MAX_CR 64
#define CHANNELS MAX_CR   /* one full tile of channels */
#define CHANNELS_BYTES (CHANNELS * sizeof(float))

static float input[ROWS * CHANNELS];
static float output_arr[ROWS * CHANNELS];
static float gold[ROWS * CHANNELS];
/* weights layout per tile: [scale0..CR-1, bias0..CR-1]
   worst case: (CHANNELS / 1) * 2 floats per tile */
static float weights[CHANNELS * 2];

// Scalar reference that matches the dynamic-CR weight layout
void reference_f32_vmulcaddc(
    size_t rows,
    size_t channels,
    const float* restrict input,
    size_t input_stride,
    const float* restrict weights,
    float* restrict output,
    size_t output_stride,
    const struct xnn_f32_minmax_params* params,
    size_t cr)
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
    while (c >= cr * sizeof(float)) {
      for (size_t k = 0; k < cr; k++) {
        float vacc0 = i0[k];
        float vacc1 = i1[k];

        vacc0 = vacc0 * w[k] + w[cr + k];
        vacc1 = vacc1 * w[k] + w[cr + k];

        vacc0 = math_max_f32(vacc0, vmin);
        vacc1 = math_max_f32(vacc1, vmin);

        vacc0 = math_min_f32(vacc0, vmax);
        vacc1 = math_min_f32(vacc1, vmax);

        o0[k] = vacc0;
        o1[k] = vacc1;
      }
      i0 += cr;
      i1 += cr;
      o0 += cr;
      o1 += cr;
      w += 2 * cr;
      c -= cr * sizeof(float);
    }
    /* remainder: tail elements packed as [scale0..tail-1, bias0..tail-1] */
    if (c > 0) {
      size_t tail = c / sizeof(float);
      for (size_t k = 0; k < tail; k++) {
        float vacc0 = i0[k];
        float vacc1 = i1[k];

        vacc0 = vacc0 * w[k] + w[tail + k];
        vacc1 = vacc1 * w[k] + w[tail + k];

        vacc0 = math_max_f32(vacc0, vmin);
        vacc1 = math_max_f32(vacc1, vmin);

        vacc0 = math_min_f32(vacc0, vmax);
        vacc1 = math_min_f32(vacc1, vmax);

        o0[k] = vacc0;
        o1[k] = vacc1;
      }
      i0 += tail;
      i1 += tail;
      o0 += tail;
      o1 += tail;
      w += 2 * tail;
      c = 0;
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

    /* Determine CR = VLMAX for e32m4 at runtime */
    size_t cr = __riscv_vsetvl_e32m4(CHANNELS);

    /* Use a channel count that is NOT a multiple of cr to test tail handling */
    size_t channels = cr + cr / 2;
    if (channels > CHANNELS) channels = CHANNELS;
    size_t channels_bytes = channels * sizeof(float);

    printf("CR=%zu  channels=%zu\n", cr, channels);

    params_storage.scalar.min = -10.0f;
    params_storage.scalar.max = 10.0f;

    // Initialize input data
    for (size_t i = 0; i < ROWS * channels; i++) {
        input[i] = (float)(rand() % 200 - 100) / 10.0f;
    }

    // Initialize weights: [scale0..vl-1, bias0..vl-1] per tile
    // The kernel uses vsetvl which returns min(remaining, VLMAX) per iteration,
    // so each tile's vl may differ (last tile is the tail).
    {
        size_t w_idx = 0;
        size_t c_rem = channels;
        while (c_rem > 0) {
            size_t tile_size = c_rem >= cr ? cr : c_rem;
            for (size_t lane = 0; lane < tile_size; lane++) {
                weights[w_idx + lane]             = (float)(rand() % 20 + 1) / 10.0f;  // scale
                weights[w_idx + tile_size + lane]  = (float)(rand() % 100 - 50) / 10.0f; // bias
            }
            w_idx += 2 * tile_size;
            c_rem -= tile_size;
        }
    }

    // Clear output
    for (size_t i = 0; i < ROWS * channels; i++) {
        output_arr[i] = 0.0f;
    }

    size_t stride = channels_bytes;

    // Compute gold reference
    reference_f32_vmulcaddc(ROWS, channels_bytes, input, stride, weights, gold, stride, &params_storage, cr);

    // Call the generated RVV kernel
    test_rvv(ROWS, channels_bytes, input, stride, weights, output_arr, stride, &params_storage);

    if (full_is_equal(output_arr, gold, ROWS * channels)) {
        printf("PASS\n");
    } else {
        printf("FAIL\n");
    }

    sys_reboot(SYS_REBOOT_COLD);
}
