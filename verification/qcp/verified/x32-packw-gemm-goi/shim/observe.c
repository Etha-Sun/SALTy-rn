#include "observe.h"
uint32_t pw_read_output(const uint32_t*p)
/*@ With(W:list Z)(O:PWOutput)(x:Z)
 Require p>0 && NoDup(W) && In(p,W) && pw_exact(O,p,x) && pw_output(W,O)
 Ensure __return==x && pw_output(W,O) */
{
 /*@ Assert p==p@pre && p>0 && NoDup(W) && In(p,W) && pw_exact(O,p,x) && store(p,unsigned int,x) * pw_output_rest(W,O,p) */
 return *p;
}
