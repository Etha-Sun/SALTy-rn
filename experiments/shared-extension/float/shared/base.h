#ifndef SHARED_BASE_H
#define SHARED_BASE_H
size_t __riscv_vsetvlmax_e32m8(void);
size_t __riscv_vsetvlmax_e32m1(void);
size_t __riscv_vsetvl_e8m2(size_t n);
size_t __riscv_vsetvl_e32m8(size_t n);
size_t __riscv_vsetvl_e8m8(size_t n);
int8x16_t vld1q_s8(const int8_t *p);
#endif
