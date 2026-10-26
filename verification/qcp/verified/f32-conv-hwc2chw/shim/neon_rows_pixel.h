#ifndef HWC_NEON_ROWS_PIXEL_H
#define HWC_NEON_ROWS_PIXEL_H
#ifdef HWC_FORMAL
#include "neon_views.h"
#include "neon3_helpers.h"
/*@ Import Coq Require Import HwcConv.NeonRowsPixelModel */
/*@ Extern Coq (hc_footprint:Z->Z->Prop) (hc_neon_rows_acc:Recordfloat32x4_t->HwcROMap->Z->Z->Z->Z->Z->Z->Z->Prop) */
#endif
float32x4_t hc_neon_rows_pixel27(const float *p0,const float *p1,const float *p2,const float *w,size_t width,size_t x)
/*@ With(F:HwcROMap) Require 0<width && 0<=x && x<(width+1)/2 && hc_footprint(p0,3*width+3) && hc_footprint(p1,3*width+3) && hc_footprint(p2,3*width+3) && hc_footprint(w,112) && hc_window(F,p0,3*width+3) && hc_window(F,p1,3*width+3) && hc_window(F,p2,3*width+3) && hc_window(F,w,112) && hc_data(F) Ensure exists(R:Recordfloat32x4_t),hc_neon_rows_acc(R,F,p0,p1,p2,w,width,x,9) && (hc_data(F)*StructPredfloat32x4_t(&__return,R)) */;
#endif
