#ifndef HWC_RVV_PIXEL9_PLAN_H
#define HWC_RVV_PIXEL9_PLAN_H
#ifndef HWC_FORMAL
#include <stddef.h>
#include <stdint.h>
#include <riscv_vector.h>
#endif
#include "rvv_rows_fma3.h"
#ifdef HWC_FORMAL
/*@ Import Coq Require Import HwcConv.HwcRvvPixel9Model */
/*@ Extern Coq (hc_rvv_pixel9_bias:HwcROMap->Z->Z->fp32)
 (hc_rvv_pixel9_prefix:Recordvfloat32m1_t->HwcROMap->Z->Z->Z->Z->Z->Z->Z->Z->Z->Prop) */
#endif
vfloat32m1_t hc_rvv_pixel9_raw(const float *p0,const float *p1,const float *p2,const float *w,size_t width,size_t x,unsigned int lane,size_t vl)
/*@ With(F:HwcROMap) Require 0<width && 0<=x && x<(width+1)/2 && 0<=lane && lane<4 && 0<=vl && vl<=4 && vl<=(width+1)/2-x && hc_footprint(p0,3*width+3) && hc_footprint(p1,3*width+3) && hc_footprint(p2,3*width+3) && hc_footprint(w,112) && hc_window(F,p0,3*width+3) && hc_window(F,p1,3*width+3) && hc_window(F,p2,3*width+3) && hc_window(F,w,112) && hc_data(F) Ensure exists(R:Recordvfloat32m1_t),hc_rvv_pixel9_prefix(R,F,p0,p1,p2,w,width,x,lane,9,vl) && (hc_data(F)*StructPredvfloat32m1_t(&__return,R)) */;
#endif
