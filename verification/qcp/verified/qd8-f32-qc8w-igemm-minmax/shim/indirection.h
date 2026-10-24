typedef unsigned long long qd8_size_t;
typedef unsigned long long qd8_uintptr_t;
/*@ Import Coq Require Import Qd8Indirect.IndirectionModel */
/*@ Extern Coq (ptr_modulus:Z) (zget:Z -> list Z -> Z)
 (selected_address:Z -> Z -> Z -> Z -> Z)
 (select_domain:Z -> Z -> Z -> Prop)
 (PtrArray::full:Z -> Z -> list Z -> Assertion)
 (PtrArray::missing_i:Z -> Z -> Z -> Z -> list Z -> Assertion) */
/*@ include strategies "indirection.strategies" */
/*@ Extern Coq (CharArray::full:Z -> Z -> list Z -> Assertion)
 (CharArray::missing_i:Z -> Z -> Z -> Z -> list Z -> Assertion) */
