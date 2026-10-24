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
/*@ Import Coq Require Import Qu8Rdsum.VlModel */
/*@ Extern Coq (rd_vl:Z -> Z) */
size_t __riscv_vsetvl_e32m8(size_t n)
/*@ Require 0<=n && n<=18446744073709551615 && emp
 Ensure __return==rd_vl(n) && 0<=__return && __return<=32 && emp */;
void qcp_assert(int c)
/*@ Require c!=0 && emp Ensure emp */;
size_t __riscv_vsetvl_e32m8(size_t n)
/*@ Require 0<=n && n<=18446744073709551615 && emp
 Ensure __return==rd_vl(n) && 0<=__return && __return<=32 && emp */
{if(n<32)return n;return 32;}
void qcp_assert(int c)
/*@ Require c!=0 && emp Ensure emp */
{}
