typedef signed char int8_t;
typedef unsigned char uint8_t;
typedef signed short int16_t;
typedef unsigned short uint16_t;
typedef signed int int32_t;
typedef unsigned int uint32_t;
typedef signed long long int64_t;
typedef unsigned long long uint64_t;
typedef unsigned long long size_t;
/*@ Import Coq Require Import Qs8Rdsum.Model */
/*@ Extern Coq (rs_s16 : Z -> Z) (rs_u16 : Z -> Z)
 (rs_s32 : Z -> Z) (rs_u32 : Z -> Z)
 (rs_add_s32 : Z -> Z -> Z) (rs_add_u32 : Z -> Z -> Z)
 (rs_pair_s8 : Z -> Z -> Z -> Z) (rs_pair_u8 : Z -> Z -> Z -> Z)
 (rs_pair_s16 : Z -> Z -> Z -> Z) (rs_pair_u16 : Z -> Z -> Z -> Z) */
typedef unsigned long long uintptr_t;
/*@ Import Coq Require Import Qs8Rdsum.ControlModel */
/*@ Extern Coq (rd_min252:Z -> Z) (rd_ceil252:Z -> Z) */
int rdsum_min252(size_t r)
/*@ Require 0<=r && r<=18446744073709551615 && emp Ensure __return==rd_min252(r) && 0<=__return && __return<=252 && emp */;
size_t rdsum_ceil252(size_t r)
/*@ Require 0<=r && r<=18446744073709551615 && emp Ensure __return==rd_ceil252(r) && 0<=__return && __return<=r && emp */;
int rdsum_min252(size_t r)
/*@ Require 0<=r && r<=18446744073709551615 && emp Ensure __return==rd_min252(r) && 0<=__return && __return<=252 && emp */
{ if(r<252)return (int)r;return 252; }
size_t rdsum_ceil252(size_t r)
/*@ Require 0<=r && r<=18446744073709551615 && emp Ensure __return==rd_ceil252(r) && 0<=__return && __return<=r && emp */
{ size_t q=r/252;if(r%252!=0)q=q+1;return q; }
