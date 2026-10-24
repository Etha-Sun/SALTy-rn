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
/*@ Import Coq Require Import Qs8Rdsum.MemoryModel */
/*@ Extern Coq (RDMap :: *) */
/*@ Extern Coq (rd_mem:RDMap -> Assertion)
 (rd_get:RDMap -> Z -> Z)
 (rd_present:RDMap -> Z -> Prop)
 (rd_remove:RDMap -> Z -> RDMap)
 (rd_window:RDMap -> Z -> Z -> Prop) */
int8_t rdsum_read_byte(const int8_t *p)
/*@ With (M:RDMap)
 Require p!=0 && rd_present(M,p) && rd_mem(M)
 Ensure __return==rd_get(M,p) && -128<=__return && __return<=127 && rd_mem(M) */;
int8_t rdsum_read_byte(const int8_t *p)
/*@ With (M:RDMap)
 Require p!=0 && rd_present(M,p) && rd_mem(M)
 Ensure __return==rd_get(M,p) && -128<=__return && __return<=127 && rd_mem(M) */
{
 /*@ Assert p==p@pre && p!=0 && rd_present(M,p) && store(p,char,rd_get(M,p)) * rd_mem(rd_remove(M,p)) */
 int8_t value=*p;
 /*@ Assert p==p@pre && p!=0 && rd_present(M,p) && rd_mem(M) * store(&value,char,rd_get(M,p)) */
 return value;
}
