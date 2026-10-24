#include "scalar.h"
int width_size_t()
/*@ Require emp Ensure __return==8 && emp */
{return sizeof(size_t);}
int width_i8()
/*@ Require emp Ensure __return==1 && emp */
{return sizeof(int8_t);}
int width_u8()
/*@ Require emp Ensure __return==1 && emp */
{return sizeof(uint8_t);}
int width_i16()
/*@ Require emp Ensure __return==2 && emp */
{return sizeof(int16_t);}
int width_i32()
/*@ Require emp Ensure __return==4 && emp */
{return sizeof(int32_t);}
int width_u32()
/*@ Require emp Ensure __return==4 && emp */
{return sizeof(uint32_t);}
int width_i64()
/*@ Require emp Ensure __return==8 && emp */
{return sizeof(int64_t);}
int width_pointer()
/*@ Require emp Ensure __return==8 && emp */
{return sizeof(void*);}
