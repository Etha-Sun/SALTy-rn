#ifndef MAXPOOL_FORMAL_MODEL_H
#define MAXPOOL_FORMAL_MODEL_H
/* The formal frontend maps unsigned long to32bits even with --arch64.
   Use explicit unsigned long long for every source size_t/uintptr_t64 value.
   Native source uses its system typedefs, with actual width checks. */
typedef unsigned long long size_t;
typedef unsigned long long uintptr_t;
typedef unsigned int uint32_t;
typedef long long int64_t;
#define UINT32_C(x) x##U
#define XNN_OOB_READS
/*@ Import Coq Require Import MaxPool.Model */
/*@ Extern Coq (mp_remaining:Z->Z) */
#endif
