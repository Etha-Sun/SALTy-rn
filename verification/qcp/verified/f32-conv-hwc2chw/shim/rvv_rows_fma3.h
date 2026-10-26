#ifndef HWC_RVV_ROWS_FMA3_H
#define HWC_RVV_ROWS_FMA3_H
#ifdef HWC_FORMAL
#include "rvv_views.h"
#include "read_api.h"
/*@ Import Coq Require Import HwcConv.RvvRowsFma3Model */
/*@ Extern Coq (hc_footprint:Z->Z->Prop) (hc_window:HwcROMap->Z->Z->Prop)
 (hc_rvv_rows_group:Recordvfloat32m1_t->Recordvfloat32m1_t->HwcROMap->Z->Z->Z->Z->Z->Z->Z->Z->Z->Z->Prop) */
#endif
vfloat32m1_t hc_rvv_rows_fma3(const vfloat32m1_t *pa,const float *p0,const float *p1,const float *p2,const float *w,size_t width,size_t x,unsigned int dx,unsigned int ci,unsigned int lane,size_t vl)
/*@ With(F:HwcROMap) (A:Recordvfloat32m1_t) Require 0<width && 0<=x && x<(width+1)/2 && 0<=dx && dx<3 && 0<=ci && ci<3 && 0<=lane && lane<4 && 0<=vl && vl<=4 && vl<=(width+1)/2-x && hc_footprint(p0,3*width+3) && hc_footprint(p1,3*width+3) && hc_footprint(p2,3*width+3) && hc_footprint(w,112) && hc_window(F,p0,3*width+3) && hc_window(F,p1,3*width+3) && hc_window(F,p2,3*width+3) && hc_window(F,w,112) && (hc_data(F)*StructPredvfloat32m1_t(pa,A)) Ensure exists(R:Recordvfloat32m1_t),hc_rvv_rows_group(R,A,F,p0,p1,p2,w,width,x,dx,ci,lane,vl) && (hc_data(F)*StructPredvfloat32m1_t(pa,A)*StructPredvfloat32m1_t(&__return,R)) */;
#endif
