for (; batch >= 4 * sizeof(float); batch -= 4 * sizeof(float)) {
    const float32x4_t va = vld1q_f32(input_a); input_a += 4;
    const float32x4_t vb = vld1q_f32(input_b); input_b += 4;

    float32x4_t vacc = vmaxq_f32(va, vb);

    vst1q_f32(output, vacc); output += 4;
  }
