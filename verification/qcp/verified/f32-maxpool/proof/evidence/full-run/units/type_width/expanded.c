/* The formal frontend maps unsigned long to32bits even with --arch64.
   Use explicit unsigned long long for every source size_t/uintptr_t64 value.
   Native source uses its system typedefs, with actual width checks. */
typedef unsigned long long size_t;
typedef unsigned long long uintptr_t;
typedef unsigned int uint32_t;
typedef long long int64_t;
/*@ Import Coq Require Import MaxPool.Model */
/*@ Extern Coq (mp_remaining:Z->Z) */
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
