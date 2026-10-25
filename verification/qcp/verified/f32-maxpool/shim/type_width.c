#include "formal_model.h"
int mp_width_size_t()
/*@ Require emp Ensure __return==8 && emp */
{return sizeof(size_t);}
int mp_width_uintptr()
/*@ Require emp Ensure __return==8 && emp */
{return sizeof(uintptr_t);}
int mp_width_u32()
/*@ Require emp Ensure __return==4 && emp */
{return sizeof(uint32_t);}
int mp_width_float()
/*@ Require emp Ensure __return==4 && emp */
{return sizeof(float);}
int mp_width_pointer()
/*@ Require emp Ensure __return==8 && emp */
{return sizeof(void*);}
int mp_width_i32()
/*@ Require emp Ensure __return==4 && emp */
{return sizeof(int);}
int mp_width_i64()
/*@ Require emp Ensure __return==8 && emp */
{return sizeof(int64_t);}
int mp_width_u64()
/*@ Require emp Ensure __return==8 && emp */
{return sizeof(unsigned long long);}
