typedef signed char int8_t;
typedef unsigned char uint8_t;
typedef signed short int16_t;
typedef unsigned short uint16_t;
typedef signed int int32_t;
typedef unsigned int uint32_t;
typedef signed long long int64_t;
typedef unsigned long long uint64_t;
typedef unsigned long long size_t;
/*@ Import Coq Require Import Qu8Rsum.Model */
/*@ Extern Coq (rs_s16 : Z -> Z) (rs_u16 : Z -> Z)
 (rs_s32 : Z -> Z) (rs_u32 : Z -> Z)
 (rs_add_s32 : Z -> Z -> Z) (rs_add_u32 : Z -> Z -> Z)
 (rs_pair_s8 : Z -> Z -> Z -> Z) (rs_pair_u8 : Z -> Z -> Z -> Z)
 (rs_pair_s16 : Z -> Z -> Z -> Z) (rs_pair_u16 : Z -> Z -> Z -> Z) */
/*@ Import Coq Require Import Qu8Rsum.VlModel */
/*@ Extern Coq (rs_vl : Z -> Z) */
size_t __riscv_vsetvl_e8m2(size_t n)
/*@ Require 0<=n && n<=18446744073709551615 && emp Ensure __return==rs_vl(n) && emp */;
size_t __riscv_vsetvlmax_e32m8(void)
/*@ Require emp Ensure __return==32 && emp */;
size_t __riscv_vsetvlmax_e32m1(void)
/*@ Require emp Ensure __return==4 && emp */;
size_t __riscv_vsetvl_e8m2(size_t n)
/*@ Require 0<=n && n<=18446744073709551615 && emp Ensure __return==rs_vl(n) && emp */
{if(n<32)return n;return 32;}
size_t __riscv_vsetvlmax_e32m8(void)
/*@ Require emp Ensure __return==32 && emp */
{return 32;}
size_t __riscv_vsetvlmax_e32m1(void)
/*@ Require emp Ensure __return==4 && emp */
{return 4;}
