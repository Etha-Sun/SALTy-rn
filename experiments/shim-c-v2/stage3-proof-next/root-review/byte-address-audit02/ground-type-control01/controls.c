#include <stdint.h>
/* All functions are model diagnostics, not kernel targets or accepted contracts.
   The guarded pair probes elimination of abstract states; its guard must NOT
   be advertised as a realizable uintptr_t C input or as a kernel counterexample. */
/*@ requires \valid(p); assigns \nothing;
 ensures raw_range: 0 <= (integer)(uintptr_t)p <= UINTPTR_MAX; */
void logic_only(float *p) {}
/*@ requires \valid(p); assigns \nothing;
 ensures raw_range: 0 <= (integer)(uintptr_t)p <= UINTPTR_MAX; */
void after_init_no_read(float *p) { uintptr_t bits=(uintptr_t)p; }
/*@ requires \valid(p); assigns \nothing;
 ensures raw_range: 0 <= (integer)(uintptr_t)p <= UINTPTR_MAX; */
int after_uintptr_read(float *p) { uintptr_t bits=(uintptr_t)p; return bits==0; }
/*@ requires \valid(p); requires oversized_encoding: (integer)(uintptr_t)p > UINTPTR_MAX;
 assigns \nothing; ensures diagnostic_false: \false; */
void oversized_logic_only(float *p) {}
/*@ requires \valid(p); requires oversized_encoding: (integer)(uintptr_t)p > UINTPTR_MAX;
 assigns \nothing; ensures diagnostic_false: \false; */
int oversized_after_read(float *p) { uintptr_t bits=(uintptr_t)p; return bits==0; }
/*@ requires \valid(p); assigns \nothing; ensures false_control: \false; */
int unguarded_false(float *p) { uintptr_t bits=(uintptr_t)p; return bits==0; }
