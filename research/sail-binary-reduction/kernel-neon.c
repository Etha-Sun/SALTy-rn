/* Wrapper only: the repository kernel is included unchanged. */
#include <stddef.h>
#include <stdint.h>
#include <arm_neon.h>
#define assert(x) ((void)0)
#define XNN_OOB_READS
#define XNN_ALIGN(n) __attribute__((aligned(n)))
#define XNN_UNLIKELY(x) __builtin_expect(!!(x), 0)
#define XNN_ARCH_ARM64 1
struct xnn_qs8_rsum_params;
#include "../../kernels/source/qu8-rsum.c"
