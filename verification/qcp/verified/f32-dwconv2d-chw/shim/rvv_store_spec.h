#ifndef DWCHW_RVV_STORE_SPEC_H
#define DWCHW_RVV_STORE_SPEC_H
#include "rvv_extended_intrinsics.h"
#include "store8_model.h"
void __riscv_vse32_v_f32m2(float *p,vfloat32m2_t a,size_t vl)
/*@ With (a0:fp32) (a1:fp32) (a2:fp32) (a3:fp32) (a4:fp32) (a5:fp32) (a6:fp32) (a7:fp32) Require 0<=vl && vl<=8 && FloatArray::undef_full(p,vl) * store(&(a.s0),float,a0) * store(&(a.s1),float,a1) * store(&(a.s2),float,a2) * store(&(a.s3),float,a3) * store(&(a.s4),float,a4) * store(&(a.s5),float,a5) * store(&(a.s6),float,a6) * store(&(a.s7),float,a7) Ensure FloatArray::full(p,vl,dw_values8(a0,a1,a2,a3,a4,a5,a6,a7,vl)) */;
#endif
