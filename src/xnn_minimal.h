#ifndef XNN_MINIMAL_H
#define XNN_MINIMAL_H

#include <stdint.h>
#include <stddef.h>

// Minimal definitions needed for XNN symbolic execution

// From xnnpack/common.h
#define XNN_OOB_READS
#define XNN_UNLIKELY(condition) (__builtin_expect(!!(condition), 0))
#define XNN_LIKELY(condition) (__builtin_expect(!!(condition), 1))

// From xnnpack/microparams.h
struct xnn_qs8_add_minmax_params {
    struct {
        int8_t a_zero_point;
        int8_t b_zero_point;
        int32_t bias;
        int32_t a_multiplier;
        int32_t b_multiplier;
        int32_t shift;
        int16_t output_zero_point;
        int8_t output_min;
        int8_t output_max;
    } scalar;
};

#endif // XNN_MINIMAL_H
