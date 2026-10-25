#include "scalar_memory.h"
uint32_t pw_read_word(const uint32_t*p)
/*@ With(F:PWMap)
 Require p>0 && pw_map_nodup(F) && pw_present(F,p) && pw_data(F)
 Ensure __return==pw_get(F,p) && 0<=__return && __return<=4294967295 && pw_data(F) */
{
 /*@ Assert p==p@pre && p>0 && pw_map_nodup(F) && pw_present(F,p) && store(p,unsigned int,pw_get(F,p)) * pw_data_rest(F,p) */
 uint32_t x=*p;
 /*@ Assert p==p@pre && p>0 && pw_map_nodup(F) && pw_present(F,p) && x==pw_get(F,p) && 0<=x && x<=4294967295 && pw_data(F) */
 return x;
}
void pw_write_word(uint32_t*p,uint32_t x)
/*@ With(W:list Z)(O:PWOutput)
 Require p>0 && NoDup(W) && In(p,W) && pw_output(W,O)
 Ensure pw_output(W,pw_output_put(O,p,x)) */
{
 /*@ Assert p==p@pre && p>0 && x==x@pre && NoDup(W) && In(p,W) && undef_data_at(p,unsigned int) * pw_output_rest(W,O,p) */
 *p=x;
}
