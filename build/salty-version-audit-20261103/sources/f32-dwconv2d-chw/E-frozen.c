#include "../shim/vector_pixel.h"
#include "../shim/read_api.h"
#include "../shim/propagating_api.h"
void test_rvv(
    size_t input_height,
    size_t input_width,
    const float* input,
    const float* weights,
    const float* zero,
    float* output,
    uint32_t padding_top,
    const struct xnn_f32_minmax_params* restrict params) XNN_OOB_READS
{
  assert(input_height != 0);
  assert(input_width != 0);
  assert(input_width % sizeof(float) == 0);
  assert(padding_top == 1);

  const float* i0 = zero;
  const float* i1 = input;
  const float* i2 = (const float*) ((uintptr_t) i1 + input_width);
  const float* i3 = (const float*) ((uintptr_t) i2 + input_width);
  const float* i4 = (const float*) ((uintptr_t) i3 + input_width);

  float* o0 = output;
  float* o1 = (float*) ((uintptr_t) o0 + input_width);
  float* o2 = (float*) ((uintptr_t) o1 + input_width);

  size_t output_height = input_height;
  do {
    if XNN_UNPREDICTABLE(output_height < 2) {
      i2 = zero;
      o1 = o0;
    }
    if XNN_UNPREDICTABLE(output_height < 3) {
      i3 = zero;
      o2 = o1;
    }
    if XNN_UNPREDICTABLE(output_height < 4) {
      i4 = zero;
    }

    const float* orig_i3 = i3;
    const float* orig_i4 = i4;

    size_t w = input_width / sizeof(float);
    float prev_i0 = 0.0f;
    float prev_i1 = 0.0f;
    float prev_i2 = 0.0f;
    float prev_i3 = 0.0f;
    float prev_i4 = 0.0f;

    while (w > 0) {
      size_t vl = __riscv_vsetvl_e32m2(w);

      vfloat32m2_t vi0 = __riscv_vle32_v_f32m2(i0, vl);
      vfloat32m2_t vi1 = __riscv_vle32_v_f32m2(i1, vl);
      vfloat32m2_t vi2 = __riscv_vle32_v_f32m2(i2, vl);
      vfloat32m2_t vi3 = __riscv_vle32_v_f32m2(i3, vl);
      vfloat32m2_t vi4 = __riscv_vle32_v_f32m2(i4, vl);

      const float next_i0 = (w > vl) ? dw_read_scalar(&(i0[vl])) : 0.0f;
      const float next_i1 = (w > vl) ? dw_read_scalar(&(i1[vl])) : 0.0f;
      const float next_i2 = (w > vl) ? dw_read_scalar(&(i2[vl])) : 0.0f;
      const float next_i3 = (w > vl) ? dw_read_scalar(&(i3[vl])) : 0.0f;
      const float next_i4 = (w > vl) ? dw_read_scalar(&(i4[vl])) : 0.0f;
      vfloat32m2_t vo0 = dw_vector_pixel_compute(&vi0,&vi1,&vi2,weights,prev_i0,prev_i1,prev_i2,next_i0,next_i1,next_i2,dw_read_scalar(&(params->scalar.min)),dw_read_scalar(&(params->scalar.max)),vl);
      vfloat32m2_t vo1 = dw_vector_pixel_compute(&vi1,&vi2,&vi3,weights,prev_i1,prev_i2,prev_i3,next_i1,next_i2,next_i3,dw_read_scalar(&(params->scalar.min)),dw_read_scalar(&(params->scalar.max)),vl);
      vfloat32m2_t vo2 = dw_vector_pixel_compute(&vi2,&vi3,&vi4,weights,prev_i2,prev_i3,prev_i4,next_i2,next_i3,next_i4,dw_read_scalar(&(params->scalar.min)),dw_read_scalar(&(params->scalar.max)),vl);

      __riscv_vse32_v_f32m2(o2, vo2, vl);
      __riscv_vse32_v_f32m2(o1, vo1, vl);
      __riscv_vse32_v_f32m2(o0, vo0, vl);

      prev_i0 = dw_read_scalar(&(i0[vl - 1]));
      prev_i1 = dw_read_scalar(&(i1[vl - 1]));
      prev_i2 = dw_read_scalar(&(i2[vl - 1]));
      prev_i3 = dw_read_scalar(&(i3[vl - 1]));
      prev_i4 = dw_read_scalar(&(i4[vl - 1]));

      i0 += vl;
      i1 += vl;
      i2 += vl;
      i3 += vl;
      i4 += vl;
      o0 += vl;
      o1 += vl;
      o2 += vl;
      w -= vl;
    }

    i0 = orig_i3;
    i1 = orig_i4;
    i2 = (const float*) ((uintptr_t) i1 + input_width);
    i3 = (const float*) ((uintptr_t) i2 + input_width);
    i4 = (const float*) ((uintptr_t) i3 + input_width);

    o0 = o2;
    o1 = (float*) ((uintptr_t) o0 + input_width);
    o2 = (float*) ((uintptr_t) o1 + input_width);

    output_height = output_height > 3 ? output_height - 3 : 0;
  } while (output_height != 0);
}