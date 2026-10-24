#include "read_model.h"
int8_t rdsum_read_byte(const int8_t *p)
/*@ With (M:RDMap)
 Require p!=0 && rd_present(M,p) && rd_mem(M)
 Ensure __return==rd_get(M,p) && -128<=__return && __return<=127 && rd_mem(M) */
{
 /*@ Assert p==p@pre && p!=0 && rd_present(M,p) && store(p,char,rd_get(M,p)) * rd_mem(rd_remove(M,p)) */
 int8_t value=*p;
 /*@ Assert p==p@pre && p!=0 && rd_present(M,p) && rd_mem(M) * store(&value,char,rd_get(M,p)) */
 return value;
}
