#ifndef XNN_MINIMAL_H
#define XNN_MINIMAL_H

#include <stdint.h>
#include <stddef.h>
#define XNN_ARCH_ARM64 1

// Minimal definitions needed for XNN symbolic execution

// From xnnpack/common.h
#define XNN_OOB_READS
#define XNN_UNLIKELY(condition) (__builtin_expect(!!(condition), 0))
#define XNN_LIKELY(condition) (__builtin_expect(!!(condition), 1))
#define XNN_UNPREDICTABLE(condition) (__builtin_expect(!!(condition), 0))

// Memory alignment macro
#if defined(__GNUC__)
#define XNN_ALIGN(alignment) __attribute__((__aligned__(alignment)))
#elif defined(_MSC_VER)
#define XNN_ALIGN(alignment) __declspec(align(alignment))
#else
#define XNN_ALIGN(alignment)  // Fallback: no alignment
#endif

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

struct xnn_qu8_add_minmax_params {
    struct {
      uint8_t a_zero_point;
      uint8_t b_zero_point;
      int32_t bias;
      int32_t a_multiplier;
      int32_t b_multiplier;
      int32_t shift;
      int16_t output_zero_point;
      uint8_t output_min;
      uint8_t output_max;
    } scalar;
  };

struct xnn_qs8_rsum_params {
    char _;  // Dummy member variable to comply with the C standard
};

struct xnn_qs8_lrelu_params {
  struct {
    int32_t input_zero_point;
    int32_t positive_multiplier;
    int32_t negative_multiplier;
    int32_t output_zero_point;
  } scalar;
};

union xnn_qs8_mul_minmax_params {
  struct {
    int8_t a_zero_point;
    int8_t b_zero_point;
    float scale;
    int16_t output_zero_point;
    int8_t output_min;
    int8_t output_max;
  } scalar;
};

struct xnn_qs8_cvt_params {
  struct {
    int16_t input_zero_point;
    int32_t multiplier;
    int16_t output_zero_point;
  } scalar;
};
#endif // XNN_MINIMAL_H
