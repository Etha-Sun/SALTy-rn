#include "read_model.h"
uint8_t rdsum_read_byte(const uint8_t *p)
/*@ With (M:RDMap)
 Require p!=0 && rd_present(M,p) && rd_mem(M)
 Ensure __return==rd_get(M,p) && 0<=__return && __return<=255 && rd_mem(M) */
{
 /*@ Assert p==p@pre && p!=0 && rd_present(M,p) && store(p,unsigned char,rd_get(M,p)) * rd_mem(rd_remove(M,p)) */
 uint8_t value=*p;
 /*@ Assert p==p@pre && p!=0 && rd_present(M,p) && rd_mem(M) * store(&value,unsigned char,rd_get(M,p)) */
 return value;
}
