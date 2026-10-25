#ifndef DWCHW_PRESENT_API_H
#define DWCHW_PRESENT_API_H
#ifdef DWCHW_FORMAL
#include "maps_model.h"
/*@ Extern Coq (dw_window:DwROMap->Z->Z->Prop) */
#else
#include <stddef.h>
#endif
void dw_require_window(const float *p,size_t count,size_t index)
/*@ With (F:DwROMap) Require 0<=index && index<count && dw_window(F,p,count) && emp
 Ensure dw_present(F,p+index) && emp */;
void dw_require_present(const float *target)
/*@ With (F:DwROMap) Require dw_present(F,target) && emp
 Ensure dw_present(F,target) && emp */;
#endif
