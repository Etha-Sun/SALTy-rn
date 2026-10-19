#include <stdint.h>
#include <stddef.h>
/* Independent controls only. These legal-buffer contracts are NOT additions
   to any kernel, wrapper, frozen spec, or proof assumptions. */
/*@ requires \valid(p+(0..4));
    assigns \nothing;
    ensures typed_step: \result == p+4;
*/
float *typed_step(float *p) { return p+4; }
/*@ requires \valid(p+(0..4));
    assigns \nothing;
    ensures uintptr_roundtrip: \result == p;
*/
float *uintptr_roundtrip(float *p) { return (float *)(uintptr_t)p; }
/* SPMM exact expression, with one fixed legal column stride. */
/*@ requires \valid(p+(0..4));
    assigns \nothing;
    ensures uintptr_stride: \result == p+4;
*/
float *uintptr_stride(float *p) {
  size_t output_stride=4*sizeof(float);
  return (float *)((uintptr_t)p+output_stride);
}
/*@ requires \valid(p+(0..4));
    assigns \nothing;
    ensures deliberately_false_stride: \result == p+3;
*/
float *false_typed_stride(float *p) { return p+4; }
/*@ requires \valid(p+(0..4));
    assigns \nothing;
    ensures deliberately_false_uintptr_stride: \result == p+3;
*/
float *false_uintptr_stride(float *p) {
  return (float *)((uintptr_t)p+4*sizeof(float));
}
