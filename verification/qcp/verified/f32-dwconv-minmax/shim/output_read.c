#include "output_read.h"
float dw_read_output(const float *p)
/*@ With (W:list Z) (O:DwOutput) (v:fp32)
 Require p!=0 && dw_distinct(W) && dw_owned(W,p) && dw_initialized(O,p,v) && dw_output(W,O)
 Ensure dw_same(__return,v) && dw_output(W,O) */
{
  /*@ Assert p!=0 && dw_distinct(W) && dw_owned(W,p) && dw_initialized(O,p,v) &&
      store(p,float,v) * dw_output(dw_removed(W,p),O) */
  return *p;
}
