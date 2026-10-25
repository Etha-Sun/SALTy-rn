#include "read_api.h"
/*@ Extern Coq (dw_window:DwROMap->Z->Z->Prop) */
float dw_read_probe(const float *p)
/*@ With (F:DwROMap) Require dw_window(F,p,1) && dw_data(F)
 Ensure dw_same(__return,dw_get(F,p)) && dw_data(F) */
{
 return dw_read_scalar(p) /*@ where F=F */;
}
