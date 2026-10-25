#include "formal_types.h"
unsigned int xt_sizeof_size_t(void)
/*@ Require emp Ensure __return==8 && emp */
{return sizeof(size_t);}
unsigned int xt_sizeof_uintptr_t(void)
/*@ Require emp Ensure __return==8 && emp */
{return sizeof(uintptr_t);}
unsigned int xt_sizeof_uint32_t(void)
/*@ Require emp Ensure __return==4 && emp */
{return sizeof(uint32_t);}
int xt_size_t_is_unsigned(void)
/*@ Require emp Ensure __return==1 && emp */
{return ((size_t)-1)>0;}
