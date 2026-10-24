typedef signed char int8_t;
typedef unsigned char uint8_t;
typedef signed short int16_t;
typedef unsigned short uint16_t;
typedef signed int int32_t;
typedef unsigned int uint32_t;
typedef signed long long int64_t;
typedef unsigned long long uint64_t;
typedef unsigned long long size_t;
/*@ Import Coq Require Import Qu8Rdsum.Model */
/*@ Extern Coq (rs_s16 : Z -> Z) (rs_u16 : Z -> Z)
 (rs_s32 : Z -> Z) (rs_u32 : Z -> Z)
 (rs_add_s32 : Z -> Z -> Z) (rs_add_u32 : Z -> Z -> Z)
 (rs_pair_s8 : Z -> Z -> Z -> Z) (rs_pair_u8 : Z -> Z -> Z -> Z)
 (rs_pair_s16 : Z -> Z -> Z -> Z) (rs_pair_u16 : Z -> Z -> Z -> Z) */
typedef unsigned long long uintptr_t;
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
{return sizeof(int64_t);}
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
