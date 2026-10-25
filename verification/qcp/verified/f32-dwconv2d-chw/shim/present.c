#include "present_api.h"
void dw_require_window(const float *p,size_t count,size_t index)
/*@ With (F:DwROMap) Require 0<=index && index<count && dw_window(F,p,count) && emp
 Ensure dw_present(F,p+index) && emp */
{ (void)p; (void)count; (void)index; }

void dw_require_present(const float *target)
/*@ With (F:DwROMap) Require dw_present(F,target) && emp
 Ensure dw_present(F,target) && emp */
{ (void)target; }
