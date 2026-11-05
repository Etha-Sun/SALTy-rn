#ifndef VEKTO_REPRO_PRELUDE_H
#define VEKTO_REPRO_PRELUDE_H
#include <stddef.h>
#include <assert.h>
struct xnn_f32_default_params { char unused; };
#define XNN_OOB_READS
#define XNN_UNLIKELY(x) (x)
#ifdef __aarch64__
#include <arm_neon.h>
#endif

#endif
