#include "maps.h"
float dw_read_float_auto(const float* p)
/*@ With (F:DwROMap) Require p!=0 && dw_present(F,p) && dw_data(F)
 Ensure dw_same(__return,dw_get(F,p)) && dw_data(F) */
{return *p;}
const float* dw_read_table_auto(const float** p)
/*@ With (P:DwPtrMap) Require p!=0 && dw_ptr_present(P,p) && dw_ptr_data(P)
 Ensure __return==dw_ptr_get(P,p) && dw_ptr_data(P) */
{return *p;}
