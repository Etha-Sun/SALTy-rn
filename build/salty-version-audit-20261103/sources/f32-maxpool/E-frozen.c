#include "../shim/read_table.h"
#include "../shim/propagate.h"
void test_rvv(
    size_t output_pixels,
    size_t kernel_elements,
    size_t channels,
    const float** input,
    size_t input_offset,
    size_t input_pixel_stride,
    float* output,
    size_t input_increment,
    size_t output_increment,
    const struct xnn_f32_minmax_params* restrict params) XNN_OOB_READS
{
  assert(output_pixels != 0);
  assert(channels != 0);

  const float vmin = params->scalar.min;
  const float vmax = params->scalar.max;

  do {
    const float** i = (const float**) input;

    // First pass: load the inputs, store the max pool in the output.
    { /* First-pass locals end before the independent later-pass loop. */
    const float* i0 = mp_read_table(i); i += 1;
    const float* i1 = i0;
    if (1 < kernel_elements) { i1 = mp_read_table(i); i += 1; }
    const float* i2 = i0;
    if (2 < kernel_elements) { i2 = mp_read_table(i); i += 1; }
    const float* i3 = i0;
    if (3 < kernel_elements) { i3 = mp_read_table(i); i += 1; }
    const float* i4 = i0;
    if (4 < kernel_elements) { i4 = mp_read_table(i); i += 1; }
    const float* i5 = i0;
    if (5 < kernel_elements) { i5 = mp_read_table(i); i += 1; }
    const float* i6 = i0;
    if (6 < kernel_elements) { i6 = mp_read_table(i); i += 1; }
    const float* i7 = i0;
    if (7 < kernel_elements) { i7 = mp_read_table(i); i += 1; }
    const float* i8 = i0;
    if (8 < kernel_elements) { i8 = mp_read_table(i); i += 1; }
    i0 = (const float*) ((uintptr_t) i0 + input_offset);
    i1 = (const float*) ((uintptr_t) i1 + input_offset);
    i2 = (const float*) ((uintptr_t) i2 + input_offset);
    i3 = (const float*) ((uintptr_t) i3 + input_offset);
    i4 = (const float*) ((uintptr_t) i4 + input_offset);
    i5 = (const float*) ((uintptr_t) i5 + input_offset);
    i6 = (const float*) ((uintptr_t) i6 + input_offset);
    i7 = (const float*) ((uintptr_t) i7 + input_offset);
    i8 = (const float*) ((uintptr_t) i8 + input_offset);

    float* o = output;
    size_t c = channels;
    while (c > 0) {
      size_t vl = __riscv_vsetvl_e32m8(c);

      vfloat32m8_t vi0=__riscv_vle32_v_f32m8(i0,vl); i0+=vl;
      vfloat32m8_t vi1=__riscv_vle32_v_f32m8(i1,vl); i1+=vl;
      vfloat32m8_t vi2=__riscv_vle32_v_f32m8(i2,vl); i2+=vl;
      vfloat32m8_t vi3=__riscv_vle32_v_f32m8(i3,vl); i3+=vl;
      vfloat32m8_t vi4=__riscv_vle32_v_f32m8(i4,vl); i4+=vl;
      vfloat32m8_t vi5=__riscv_vle32_v_f32m8(i5,vl); i5+=vl;
      vfloat32m8_t vi6=__riscv_vle32_v_f32m8(i6,vl); i6+=vl;
      vfloat32m8_t vi7=__riscv_vle32_v_f32m8(i7,vl); i7+=vl;
      vfloat32m8_t vi8=__riscv_vle32_v_f32m8(i8,vl); i8+=vl;
      vfloat32m8_t vmax01=mp_max_vv(vi0,vi1,vl);
      vfloat32m8_t vmax018=mp_max_vv(vmax01,vi8,vl);
      vfloat32m8_t vmax23=mp_max_vv(vi2,vi3,vl);
      vfloat32m8_t vmax45=mp_max_vv(vi4,vi5,vl);
      vfloat32m8_t vmax67=mp_max_vv(vi6,vi7,vl);
      vfloat32m8_t vmax2345=mp_max_vv(vmax23,vmax45,vl);
      vfloat32m8_t vmax01678=mp_max_vv(vmax018,vmax67,vl);
      vfloat32m8_t vgroup=mp_max_vv(vmax2345,vmax01678,vl);
      vfloat32m8_t vacc=vgroup;

      vacc = mp_max_vf(vacc, vmin, vl);
      vacc = mp_min_vf(vacc, vmax, vl);

      __riscv_vse32_v_f32m8(o, vacc, vl); o += vl;
      c -= vl;
    }

    // Passes 1 - n: Max more inputs to the output.
    }

    for (size_t k = kernel_elements > 9 ? kernel_elements - 9 : 0;
         k != 0; k = k > 9 ? k - 9 : 0) {
      const float* i0 = mp_read_table(i); i += 1;
      const float* i1 = i0;
      if (1 < k) { i1 = mp_read_table(i); i += 1; }
      const float* i2 = i0;
      if (2 < k) { i2 = mp_read_table(i); i += 1; }
      const float* i3 = i0;
      if (3 < k) { i3 = mp_read_table(i); i += 1; }
      const float* i4 = i0;
      if (4 < k) { i4 = mp_read_table(i); i += 1; }
      const float* i5 = i0;
      if (5 < k) { i5 = mp_read_table(i); i += 1; }
      const float* i6 = i0;
      if (6 < k) { i6 = mp_read_table(i); i += 1; }
      const float* i7 = i0;
      if (7 < k) { i7 = mp_read_table(i); i += 1; }
      const float* i8 = i0;
      if (8 < k) { i8 = mp_read_table(i); i += 1; }
      i0 = (const float*) ((uintptr_t) i0 + input_offset);
      i1 = (const float*) ((uintptr_t) i1 + input_offset);
      i2 = (const float*) ((uintptr_t) i2 + input_offset);
      i3 = (const float*) ((uintptr_t) i3 + input_offset);
      i4 = (const float*) ((uintptr_t) i4 + input_offset);
      i5 = (const float*) ((uintptr_t) i5 + input_offset);
      i6 = (const float*) ((uintptr_t) i6 + input_offset);
      i7 = (const float*) ((uintptr_t) i7 + input_offset);
      i8 = (const float*) ((uintptr_t) i8 + input_offset);

      float* o = output;
      size_t c = channels;
      while (c > 0) {
        size_t vl = __riscv_vsetvl_e32m8(c);

        vfloat32m8_t vi0=__riscv_vle32_v_f32m8(i0,vl); i0+=vl;
        vfloat32m8_t vi1=__riscv_vle32_v_f32m8(i1,vl); i1+=vl;
        vfloat32m8_t vi2=__riscv_vle32_v_f32m8(i2,vl); i2+=vl;
        vfloat32m8_t vi3=__riscv_vle32_v_f32m8(i3,vl); i3+=vl;
        vfloat32m8_t vi4=__riscv_vle32_v_f32m8(i4,vl); i4+=vl;
        vfloat32m8_t vi5=__riscv_vle32_v_f32m8(i5,vl); i5+=vl;
        vfloat32m8_t vi6=__riscv_vle32_v_f32m8(i6,vl); i6+=vl;
        vfloat32m8_t vi7=__riscv_vle32_v_f32m8(i7,vl); i7+=vl;
        vfloat32m8_t vi8=__riscv_vle32_v_f32m8(i8,vl); i8+=vl;
        vfloat32m8_t vprev=__riscv_vle32_v_f32m8(o,vl);
        vfloat32m8_t vmax01=mp_max_vv(vi0,vi1,vl);
        vfloat32m8_t vmax018=mp_max_vv(vmax01,vi8,vl);
        vfloat32m8_t vmax23=mp_max_vv(vi2,vi3,vl);
        vfloat32m8_t vmax45=mp_max_vv(vi4,vi5,vl);
        vfloat32m8_t vmax67=mp_max_vv(vi6,vi7,vl);
        vfloat32m8_t vmax2345=mp_max_vv(vmax23,vmax45,vl);
        vfloat32m8_t vmax01678=mp_max_vv(vmax018,vmax67,vl);
        vfloat32m8_t vgroup=mp_max_vv(vmax2345,vmax01678,vl);
        vfloat32m8_t vacc=mp_max_vv(vprev,vgroup,vl);

        vacc = mp_min_vf(vacc, vmax, vl);

        __riscv_vse32_v_f32m8(o, vacc, vl); o += vl;
        c -= vl;
      }
    }

    input = (const float**) ((uintptr_t) input + input_increment);
    input_offset += input_pixel_stride;
    output = (float*) ((uintptr_t) output + output_increment);
    output_pixels -= 1;
  } while (output_pixels != 0);
}