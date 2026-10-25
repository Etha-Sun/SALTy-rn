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

      vfloat32m2_t vo0 = __riscv_vfmv_v_f_f32m2(weights[0], vl);
      vfloat32m2_t vo1 = vo0;
      vfloat32m2_t vo2 = vo0;

      // Center column
      vo0 = __riscv_vfmacc_vf_f32m2(vo0, weights[2], vi0, vl);
      vo1 = __riscv_vfmacc_vf_f32m2(vo1, weights[2], vi1, vl);
      vo2 = __riscv_vfmacc_vf_f32m2(vo2, weights[2], vi2, vl);

      vo0 = __riscv_vfmacc_vf_f32m2(vo0, weights[5], vi1, vl);
      vo1 = __riscv_vfmacc_vf_f32m2(vo1, weights[5], vi2, vl);
      vo2 = __riscv_vfmacc_vf_f32m2(vo2, weights[5], vi3, vl);

      vo0 = __riscv_vfmacc_vf_f32m2(vo0, weights[8], vi2, vl);
      vo1 = __riscv_vfmacc_vf_f32m2(vo1, weights[8], vi3, vl);
      vo2 = __riscv_vfmacc_vf_f32m2(vo2, weights[8], vi4, vl);

      // Left column
      {
        vfloat32m2_t v_left = __riscv_vfslide1up_vf_f32m2(vi0, prev_i0, vl);
        vo0 = __riscv_vfmacc_vf_f32m2(vo0, weights[1], v_left, vl);
        
        v_left = __riscv_vfslide1up_vf_f32m2(vi1, prev_i1, vl);
        vo0 = __riscv_vfmacc_vf_f32m2(vo0, weights[4], v_left, vl);
        vo1 = __riscv_vfmacc_vf_f32m2(vo1, weights[1], v_left, vl);
        
        v_left = __riscv_vfslide1up_vf_f32m2(vi2, prev_i2, vl);
        vo0 = __riscv_vfmacc_vf_f32m2(vo0, weights[7], v_left, vl);
        vo1 = __riscv_vfmacc_vf_f32m2(vo1, weights[4], v_left, vl);
        vo2 = __riscv_vfmacc_vf_f32m2(vo2, weights[1], v_left, vl);
        
        v_left = __riscv_vfslide1up_vf_f32m2(vi3, prev_i3, vl);
        vo1 = __riscv_vfmacc_vf_f32m2(vo1, weights[7], v_left, vl);
        vo2 = __riscv_vfmacc_vf_f32m2(vo2, weights[4], v_left, vl);
        
        v_left = __riscv_vfslide1up_vf_f32m2(vi4, prev_i4, vl);
        vo2 = __riscv_vfmacc_vf_f32m2(vo2, weights[7], v_left, vl);
      }

      // Right column
      {
        float next_i0 = (w > vl) ? i0[vl] : 0.0f;
        vfloat32m2_t v_right = __riscv_vfslide1down_vf_f32m2(vi0, next_i0, vl);
        vo0 = __riscv_vfmacc_vf_f32m2(vo0, weights[3], v_right, vl);
        
        float next_i1 = (w > vl) ? i1[vl] : 0.0f;
        v_right = __riscv_vfslide1down_vf_f32m2(vi1, next_i1, vl);
        vo0 = __riscv_vfmacc_vf_f32m2(vo0, weights[6], v_right, vl);
        vo1 = __riscv_vfmacc_vf_f32m2(vo1, weights[3], v_right, vl);
        
        float next_i2 = (w > vl) ? i2[vl] : 0.0f;
        v_right = __riscv_vfslide1down_vf_f32m2(vi2, next_i2, vl);
        vo0 = __riscv_vfmacc_vf_f32m2(vo0, weights[9], v_right, vl);
        vo1 = __riscv_vfmacc_vf_f32m2(vo1, weights[6], v_right, vl);
        vo2 = __riscv_vfmacc_vf_f32m2(vo2, weights[3], v_right, vl);
        
        float next_i3 = (w > vl) ? i3[vl] : 0.0f;
        v_right = __riscv_vfslide1down_vf_f32m2(vi3, next_i3, vl);
        vo1 = __riscv_vfmacc_vf_f32m2(vo1, weights[9], v_right, vl);
        vo2 = __riscv_vfmacc_vf_f32m2(vo2, weights[6], v_right, vl);
        
        float next_i4 = (w > vl) ? i4[vl] : 0.0f;
        v_right = __riscv_vfslide1down_vf_f32m2(vi4, next_i4, vl);
        vo2 = __riscv_vfmacc_vf_f32m2(vo2, weights[9], v_right, vl);
      }

      vo0 = __riscv_vfmax_vf_f32m2(vo0, params->scalar.min, vl);
      vo1 = __riscv_vfmax_vf_f32m2(vo1, params->scalar.min, vl);
      vo2 = __riscv_vfmax_vf_f32m2(vo2, params->scalar.min, vl);

      vo0 = __riscv_vfmin_vf_f32m2(vo0, params->scalar.max, vl);
      vo1 = __riscv_vfmin_vf_f32m2(vo1, params->scalar.max, vl);
      vo2 = __riscv_vfmin_vf_f32m2(vo2, params->scalar.max, vl);

      __riscv_vse32_v_f32m2(o2, vo2, vl);
      __riscv_vse32_v_f32m2(o1, vo1, vl);
      __riscv_vse32_v_f32m2(o0, vo0, vl);

      prev_i0 = i0[vl - 1];
      prev_i1 = i1[vl - 1];
      prev_i2 = i2[vl - 1];
      prev_i3 = i3[vl - 1];
      prev_i4 = i4[vl - 1];

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