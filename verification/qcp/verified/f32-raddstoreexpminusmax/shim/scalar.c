#include "scalar.h"
float em_read_scalar(const float*p)
/*@ With(F:EMMap)
 Require p!=0&&em_present(F,p)&&em_data(F)
 Ensure em_same(__return,em_get(F,p))&&em_data(F) */
{
 /*@ Assert p==p@pre&&p!=0&&em_present(F,p)&&store(p,float,em_get(F,p))*em_data(em_pop(F,p)) */
 return *p;
}
void em_write_scalar(float*p,float x)
/*@ With(W:list Z)(O:EMOutput)(X:fp32)
 Require p!=0&&em_distinct(W)&&em_owned(W,p)&&em_same(x,X)&&em_output(W,O)
 Ensure em_output(W,em_output_put(O,p,X)) */
{
 /*@ Assert p==p@pre&&p!=0&&em_distinct(W)&&em_owned(W,p)&&em_same(x,X)&&undef_data_at(p,float)*em_output(em_removed(W,p),O) */
 *p=x;
}
void em_assert(int condition)
/*@ Require condition!=0&&emp Ensure emp */
{}
