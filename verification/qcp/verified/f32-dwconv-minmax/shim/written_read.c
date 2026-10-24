#include "written_read.h"
float dw_read_written(const float *p)
/*@ With (W:list Z) (O:DwOutput)
 Require p!=0 && dw_distinct(W) && dw_owned(W,p) && dw_output_ready(O,p) && dw_output(W,O)
 Ensure dw_initialized(O,p,__return) && dw_output(W,O) */
{
  /*@ Assert exists(v:fp32), p==p@pre && p!=0 && dw_distinct(W) && dw_owned(W,p) &&
      dw_initialized(O,p,v) && store(p,float,v) * dw_output(dw_removed(W,p),O) */
  return *p;
}
