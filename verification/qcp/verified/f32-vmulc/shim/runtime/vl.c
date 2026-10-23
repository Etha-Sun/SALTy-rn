#include "shim.h"
size_t __riscv_vsetvl_e32m8(size_t n) { return n < RVV_CAP ? n : RVV_CAP; }
