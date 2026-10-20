#ifndef SHARED_BASE_H
#define SHARED_BASE_H
/*@ terminates \true; assigns \nothing; ensures \result == RVV_CAP; */
size_t __riscv_vsetvlmax_e32m8(void);
/*@ terminates \true; assigns \nothing; ensures \result == RVV_M1_CAP; */
size_t __riscv_vsetvlmax_e32m1(void);
/*@ terminates \true; assigns \nothing; ensures \result == (n<RVV_CAP ? n : RVV_CAP); */
size_t __riscv_vsetvl_e8m2(size_t n);
/*@ terminates \true; assigns \nothing; ensures \result == (n<RVV_CAP ? n : RVV_CAP); */
size_t __riscv_vsetvl_e32m8(size_t n);
/*@ terminates \true; assigns \nothing; ensures \result == (n<RVV_I8M8_CAP ? n : RVV_I8M8_CAP); */
size_t __riscv_vsetvl_e8m8(size_t n);
/*@ requires \valid_read(p+(0..15));
    terminates \true; assigns \nothing;
    ensures \forall integer j; 0<=j<16 ==> \result.lane[j]==p[j]; */
int8x16_t vld1q_s8(const int8_t *p);
#endif
