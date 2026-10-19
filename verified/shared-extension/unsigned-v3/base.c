#include "shim.h"
size_t __riscv_vsetvlmax_e32m8(void) { return RVV_CAP; }
size_t __riscv_vsetvlmax_e32m1(void) { return RVV_M1_CAP; }
size_t __riscv_vsetvl_e8m2(size_t n) { return n<RVV_CAP ? n : RVV_CAP; }
size_t __riscv_vsetvl_e32m8(size_t n) { return n<RVV_CAP ? n : RVV_CAP; }
size_t __riscv_vsetvl_e8m8(size_t n) { return n<RVV_I8M8_CAP ? n : RVV_I8M8_CAP; }
uint8x16_t vld1q_u8(const uint8_t *p) {
  uint8x16_t r;
  for (size_t i=0;i<16;i++) r.lane[i]=p[i];
  return r;
}
