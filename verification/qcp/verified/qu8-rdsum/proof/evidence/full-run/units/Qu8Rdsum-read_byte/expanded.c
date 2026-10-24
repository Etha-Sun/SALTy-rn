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
/*@ Import Coq Require Import Qu8Rdsum.MemoryModel */
/*@ Extern Coq (RDMap :: *) */
/*@ Extern Coq (rd_mem:RDMap -> Assertion)
 (rd_get:RDMap -> Z -> Z)
 (rd_present:RDMap -> Z -> Prop)
 (rd_remove:RDMap -> Z -> RDMap)
 (rd_window:RDMap -> Z -> Z -> Prop) */
uint8_t rdsum_read_byte(const uint8_t *p)
/*@ With (M:RDMap)
 Require p!=0 && rd_present(M,p) && rd_mem(M)
 Ensure __return==rd_get(M,p) && 0<=__return && __return<=255 && rd_mem(M) */;
uint8_t rdsum_read_byte(const uint8_t *p)
/*@ With (M:RDMap)
 Require p!=0 && rd_present(M,p) && rd_mem(M)
 Ensure __return==rd_get(M,p) && 0<=__return && __return<=255 && rd_mem(M) */
{
 /*@ Assert p==p@pre && p!=0 && rd_present(M,p) && store(p,unsigned char,rd_get(M,p)) * rd_mem(rd_remove(M,p)) */
 uint8_t value=*p;
 /*@ Assert p==p@pre && p!=0 && rd_present(M,p) && rd_mem(M) * store(&value,unsigned char,rd_get(M,p)) */
 return value;
}
