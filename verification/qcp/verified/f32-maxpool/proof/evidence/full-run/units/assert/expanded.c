/* The formal frontend maps unsigned long to32bits even with --arch64.
   Use explicit unsigned long long for every source size_t/uintptr_t64 value.
   Native source uses its system typedefs, with actual width checks. */
typedef unsigned long long size_t;
typedef unsigned long long uintptr_t;
typedef unsigned int uint32_t;
typedef long long int64_t;
/*@ Import Coq Require Import MaxPool.Model */
/*@ Extern Coq (mp_remaining:Z->Z) */
void mp_assert(int ok)
/*@ Require ok!=0 && emp Ensure emp */
{ }
