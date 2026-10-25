#ifndef DWCHW_RVV_EXTENDED_FRONTEND_H
#define DWCHW_RVV_EXTENDED_FRONTEND_H
#include "propagating_frontend.h"
#include "propagating_api.h"
#include "rvv_extended_borrow.h"
#include "support.h"
#include "rvv_store_spec.h"
#include "store8.h"
#define __riscv_vfmacc_vf_f32m2(c,x,a,vl) dw_r_fma(&(c),(x),&(a),(vl))
#define __riscv_vfslide1up_vf_f32m2(a,x,vl) dw_r_up(&(a),(x),(vl))
#define __riscv_vfslide1down_vf_f32m2(a,x,vl) dw_r_down(&(a),(x),(vl))
#define __riscv_vse32_v_f32m2(p,a,vl) dw_store8((p),&(a),(vl))
#define assert(b) dw_assert(b)
#endif
