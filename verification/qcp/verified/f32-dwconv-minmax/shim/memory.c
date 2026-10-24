#include "memory.h"
float dw_read_float(const float* p)
/*@ With (F:DwROMap) Require p!=0 && dw_present(F,p) && dw_data(F)
 Ensure dw_same(__return,dw_get(F,p)) && dw_data(F) */
{
  /*@ Assert p==p@pre && dw_present(F,p@pre) &&
       store(p@pre,float,dw_get(F,p@pre)) * dw_data(dw_pop(F,p@pre)) */
  return *p;
}
void dw_store_float(float* p,float v)
/*@ With (W:list Z) (O:DwOutput)
 Require p!=0 && dw_distinct(W) && dw_owned(W,p) && dw_output(W,O)
 Ensure dw_output(W,dw_output_put(O,p,v)) */
{
  /*@ Assert p==p@pre && dw_same(v,v@pre) && dw_distinct(W) && dw_owned(W,p@pre) &&
       undef_data_at(p@pre,float) * dw_output(dw_removed(W,p@pre),O) */
  *p = v;
}
