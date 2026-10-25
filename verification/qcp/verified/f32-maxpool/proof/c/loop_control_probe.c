#include "../../shim/formal_model.h"
size_t mp_probe_do(size_t count)
/*@ Require 0<count && count<=18446744073709551615 && emp Ensure __return==0 && emp */
{
 do { count-=1; }
 /*@ Inv Assert 0<=count && count<count@pre && emp */
 while(count!=0);
 return count;
}
size_t mp_probe_for(size_t K)
/*@ Require 0<=K && K<=18446744073709551615 && emp Ensure __return==0 && emp */
{
 /*@ Inv Assert 0<=k && k<=K && K==K@pre && emp */
 for(size_t k=K>9?K-9:0;k!=0;k=k>9?k-9:0) { }
 return 0;
}
#include "../../shim/read_table.h"
const float* mp_probe_table_advance(const float**p)
/*@ With (PT:MPPtrMap) Require p!=0 && mp_ptr_present(PT,p) && mp_ptr_data(PT)
 Ensure __return==mp_ptr_get(PT,p@pre) && mp_ptr_data(PT) */
{
 const float* value=mp_read_table(p) /*@ where P=PT */;
 p+=1;
 return value;
}
