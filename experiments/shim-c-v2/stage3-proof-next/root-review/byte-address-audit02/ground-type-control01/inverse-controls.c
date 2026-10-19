#include <stdint.h>
/* Diagnostic only. No new requires and no external/bodyless ghost contract. */
/*@ ghost
 /@ assigns \nothing;
    ensures inverse: \valid_read(p) ==> (float*)((uintptr_t)p)==p; @/
 static void checked_pointer_inverse(float *p) {}
*/
/*@ requires \valid(p); assigns \nothing; ensures positive: \result==1; */
int bridged_pointer_roundtrip(float *p) {
 /*@ ghost checked_pointer_inverse(p); */
 uintptr_t x=(uintptr_t)p;
 return (float*)x==p;
}
/*@ requires \valid(p); assigns \nothing; ensures false_control: \false; */
int negative_with_bridge(float *p) {
 /*@ ghost checked_pointer_inverse(p); */
 uintptr_t x=(uintptr_t)p;
 return (float*)x==p;
}
