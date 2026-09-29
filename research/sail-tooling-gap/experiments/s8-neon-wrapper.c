/* Original kernel body is included unchanged; this supplies its C facade. */
#include <stddef.h>
#include <stdint.h>
#include <arm_neon.h>
#define assert(x) ((void)0)
#define XNN_OOB_READS
struct salt_s8_vmax_params { struct { int8_t threshold; } scalar; };
#include "../../../examples/s8-vmax-to-lean/neon.c"
