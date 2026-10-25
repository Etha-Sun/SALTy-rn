#include "../../shim/types.h"
size_t dw_width_size_t(void)
/*@ Require emp Ensure __return==18446744073709551615 && emp */
{return (size_t)-1;}
uintptr_t dw_width_uintptr(void)
/*@ Require emp Ensure __return==18446744073709551615 && emp */
{return (uintptr_t)-1;}
uint32_t dw_width_uint32(void)
/*@ Require emp Ensure __return==4294967295 && emp */
{return (uint32_t)-1;}
