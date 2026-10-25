/* The formal frontend maps unsigned long to32bits even with --arch64.
   Use explicit unsigned long long for every source size_t/uintptr_t64 value.
   Native source uses its system typedefs, with actual width checks. */
typedef unsigned long long size_t;
typedef unsigned long long uintptr_t;
typedef unsigned int uint32_t;
typedef long long int64_t;
/*@ Import Coq Require Import MaxPool.Model */
/*@ Extern Coq (mp_remaining:Z->Z) */
/* Arithmetic cut helper, independently body checked. The kernels retain
   their own inline guarded loop count, checked again in the whole units. */
size_t mp_count_after_group(size_t k)
/*@ Require emp Ensure __return==mp_remaining(k) && emp */
{
  if(k>9) return k-9;
  return 0;
}
