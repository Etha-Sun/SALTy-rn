  size_t n = batch / sizeof(float);
  const size_t vlmax = __riscv_vsetvlmax_e32m8();
  while (n >= vlmax) {
    vfloat32m8_t va = __riscv_vle32_v_f32m8(input_a, vlmax);
    vfloat32m8_t vb = __riscv_vle32_v_f32m8(input_b, vlmax);
    vfloat32m8_t vacc = __riscv_vfmax_vv_f32m8(va, vb, vlmax);
    __riscv_vse32_v_f32m8(output, vacc, vlmax);
    input_a += vlmax;
    input_b += vlmax;
    output += vlmax;
    n -= vlmax;
  }
  if (n > 0) {
    size_t vl = __riscv_vsetvl_e32m8(n);
    vfloat32m8_t va = __riscv_vle32_v_f32m8(input_a, vl);
    vfloat32m8_t vb = __riscv_vle32_v_f32m8(input_b, vl);
    vfloat32m8_t vacc = __riscv_vfmax_vv_f32m8(va, vb, vl);
    __riscv_vse32_v_f32m8(output, vacc, vl);
  }
