#ifndef QS8MUL_TYPE_WIDTH_PROBE_H
#define QS8MUL_TYPE_WIDTH_PROBE_H
#include "types.h"
int width_size_t(void)
/*@ Require emp Ensure __return==8 && emp */
{return sizeof(size_t);}
int width_i8(void)
/*@ Require emp Ensure __return==1 && emp */
{return sizeof(int8_t);}
int width_i16(void)
/*@ Require emp Ensure __return==2 && emp */
{return sizeof(int16_t);}
int width_i32(void)
/*@ Require emp Ensure __return==4 && emp */
{return sizeof(int32_t);}
int width_i64(void)
/*@ Require emp Ensure __return==8 && emp */
{return sizeof(long long);}
int width_u16(void)
/*@ Require emp Ensure __return==2 && emp */
{return sizeof(uint16_t);}
int width_u32(void)
/*@ Require emp Ensure __return==4 && emp */
{return sizeof(uint32_t);}
int width_pointer(void)
/*@ Require emp Ensure __return==8 && emp */
{return sizeof(void*);}
int width_size_t_unsigned(void)
/*@ Require emp Ensure __return==1 && emp */
{return ((size_t)-1)>0;}
#endif
