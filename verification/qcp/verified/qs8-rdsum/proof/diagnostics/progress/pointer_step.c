#include "../../../shim/formal_types.h"
#include "../../../shim/control_model.h"
#include "../../../shim/rvv_loop_model.h"
#include "../../../shim/join_model.h"
#include "../../../shim/progress_model.h"
uintptr_t rd_pointer_group_c(size_t r,int cb,int lane,size_t stride,uintptr_t p,uintptr_t zero)
/*@ With (base:Z)
 Require 0<r && r<=18446744073709551615 && 0<cb && cb<=rd_min252(r) && (rd_min252(r)-cb)%7==0 && 0<=lane && lane<7 && 0<=stride && stride<=18446744073709551615 && 0<=p && p<=18446744073709551615 && 0<=zero && zero<=18446744073709551615 && p==rd_u64(base+(rd_min252(r)-cb+lane)*stride) && emp
 Ensure rd_inner_gate(r,cb-7,__return,rd_u64(base+(rd_min252(r)-(cb-7)+lane)*stride)) && emp */
{
 if(cb<=lane)p=zero;
 return p+7*stride;
}
