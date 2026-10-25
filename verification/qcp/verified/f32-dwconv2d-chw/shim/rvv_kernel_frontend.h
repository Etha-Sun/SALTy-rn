#ifndef DWCHW_RVV_KERNEL_FRONTEND_H
#define DWCHW_RVV_KERNEL_FRONTEND_H
#include "rvv_extended_frontend.h"
#include "intrinsic_store_views.h"
#undef __riscv_vse32_v_f32m2
#define __riscv_vse32_v_f32m2(p,a,vl) dw_isa_storervv((p),&(a),(vl))
#endif
