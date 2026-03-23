#ifndef XNN_MINIMAL_H
#define XNN_MINIMAL_H

#include <stdint.h>
#include <stddef.h>
#include <string.h>
#define XNN_ARCH_ARM64 1

// Minimal definitions needed for XNN symbolic execution

// Float16/BFloat16 helper functions (from xnnpack/fp16.h)
static inline float fp32_from_bits(uint32_t w) {
  union {
    uint32_t as_bits;
    float as_value;
  } fp32 = {w};
  return fp32.as_value;
}
static inline uint32_t fp32_to_bits(float f) {
  union {
    float as_value;
    uint32_t as_bits;
  } fp32 = {f};
  return fp32.as_bits;
}

static inline size_t doz(size_t a, size_t b) {
  return a > b ? a - b : 0;
}

// Check if n is a power of 2
static inline bool is_po2(size_t n) {
  return (n != 0) && ((n & (n - 1)) == 0);
}

// Round down n to the nearest multiple of q (q must be power of 2)
static inline size_t round_down_po2(size_t n, size_t q) {
  return n & -q;
}

// Round up n to the nearest multiple of q (q must be power of 2)
static inline size_t round_up_po2(size_t n, size_t q) {
  return round_down_po2(n + q - 1, q);
}

static inline float fp16_ieee_to_fp32_value(uint16_t h) {
  const uint32_t w = (uint32_t)h << 16;
  const uint32_t sign = w & UINT32_C(0x80000000);
  const uint32_t two_w = w + w;
  const uint32_t exp_offset = UINT32_C(0xE0) << 23;
  const float exp_scale = fp32_from_bits(UINT32_C(0x7800000));
  const float normalized_value =
      fp32_from_bits((two_w >> 4) + exp_offset) * exp_scale;
  const uint32_t magic_mask = UINT32_C(126) << 23;
  const float magic_bias = 0.5f;
  const float denormalized_value =
      fp32_from_bits((two_w >> 17) | magic_mask) - magic_bias;
  const uint32_t denormalized_cutoff = UINT32_C(1) << 27;
  const uint32_t result =
      sign | (two_w < denormalized_cutoff ? fp32_to_bits(denormalized_value)
                                          : fp32_to_bits(normalized_value));
  return fp32_from_bits(result);
}

static inline uint16_t fp16_ieee_from_fp32_value(float f) {
  const float scale_to_inf = fp32_from_bits(UINT32_C(0x77800000));
  const float scale_to_zero = fp32_from_bits(UINT32_C(0x08800000));
  const uint32_t w = fp32_to_bits(f);
  const float abs_f = fp32_from_bits(w & UINT32_C(0x7FFFFFFF));
  float base = (abs_f * scale_to_inf) * scale_to_zero;
  const uint32_t shl1_w = w + w;
  const uint32_t sign = w & UINT32_C(0x80000000);
  uint32_t bias = shl1_w & UINT32_C(0xFF000000);
  if (bias < UINT32_C(0x71000000)) {
    bias = UINT32_C(0x71000000);
  }
  base = fp32_from_bits((bias >> 1) + UINT32_C(0x07800000)) + base;
  const uint32_t bits = fp32_to_bits(base);
  const uint32_t exp_bits = (bits >> 13) & UINT32_C(0x00007C00);
  const uint32_t mantissa_bits = bits & UINT32_C(0x00000FFF);
  const uint32_t nonsign = exp_bits + mantissa_bits;
  return (sign >> 16) |
         (shl1_w > UINT32_C(0xFF000000) ? UINT16_C(0x7E00) : nonsign);
}

// Float16 type definition
#ifndef XNN_HAVE_FLOAT16
#define XNN_HAVE_FLOAT16 0
#endif

#if XNN_HAVE_FLOAT16
typedef _Float16 xnn_float16;
#else
struct xnn_float16 {
  uint16_t value;

#ifdef __cplusplus
  xnn_float16() = default;
  xnn_float16(float x) : value(fp16_ieee_from_fp32_value(x)) {}
  operator float() const { return fp16_ieee_to_fp32_value(value); }
#endif
};
typedef struct xnn_float16 xnn_float16;
#endif

struct xnn_f16_minmax_params {
  struct {
    xnn_float16 min;
    xnn_float16 max;
  } scalar;
};

// BFloat16 type definition
struct xnn_bfloat16 {
  uint16_t value;

#ifdef __cplusplus
  xnn_bfloat16() = default;
  xnn_bfloat16(float x) : value((fp32_to_bits(x) + UINT32_C(0x00007FFF) + ((fp32_to_bits(x) >> 16) & 1)) >> 16) {}
  operator float() const { return fp32_from_bits((uint32_t)value << 16); }
#endif
};
typedef struct xnn_bfloat16 xnn_bfloat16;

#ifdef __cplusplus
extern "C" {
#endif

static inline xnn_float16 xnn_float16_from_float(float f) {
#if XNN_HAVE_FLOAT16
  return (xnn_float16)f;
#else
  struct xnn_float16 result;
  result.value = fp16_ieee_from_fp32_value(f);
  return result;
#endif
}

static inline float xnn_float16_to_float(xnn_float16 fp16) {
#if XNN_HAVE_FLOAT16
  return (float)fp16;
#else
  return fp16_ieee_to_fp32_value(fp16.value);
#endif
}

static inline uint16_t xnn_float16_to_bits(xnn_float16 fp16) {
  uint16_t result;
  memcpy(&result, &fp16, sizeof(result));
  return result;
}

static inline xnn_float16 xnn_float16_from_bits(uint16_t x) {
  xnn_float16 result;
  memcpy(&result, &x, sizeof(result));
  return result;
}

static inline xnn_bfloat16 xnn_bfloat16_from_float(float f) {
  xnn_bfloat16 result;
  result.value = (fp32_to_bits(f) + UINT32_C(0x00007FFF) + ((fp32_to_bits(f) >> 16) & 1)) >> 16;
  return result;
}

static inline float xnn_bfloat16_to_float(xnn_bfloat16 bf16) {
  return fp32_from_bits((uint32_t)bf16.value << 16);
}

#ifdef __cplusplus
}
#endif

// From xnnpack/common.h
#define XNN_OOB_READS
#define XNN_INLINE inline __attribute__((always_inline))
#define XNN_UNLIKELY(condition) (__builtin_expect(!!(condition), 0))
#define XNN_LIKELY(condition) (__builtin_expect(!!(condition), 1))
#define XNN_UNPREDICTABLE(condition) (__builtin_expect(!!(condition), 0))

// XNN_FORCE_REALIZATION - forces compiler to keep value in memory
// On ARM/x86/WASM architectures, this prevents redundant broadcast operations.
// For symbolic execution, this is a no-op.
#define XNN_FORCE_REALIZATION(x)

// xnn_prefetch_to_l1 - hint CPU to prefetch data into L1 cache
// For symbolic execution, this is a no-op since it doesn't affect program semantics.
static inline void xnn_prefetch_to_l1(const void* address) {
  (void)address;  // Suppress unused parameter warning
}

// XNN_UNREACHABLE - marks code that should never be reached
#if defined(__GNUC__)
#if defined(__clang__) || (__GNUC__ > 4 || __GNUC__ == 4 && __GNUC_MINOR__ >= 5)
#define XNN_UNREACHABLE      \
  do {                       \
    __builtin_unreachable(); \
  } while (0)
#else
#define XNN_UNREACHABLE \
  do {                  \
    __builtin_trap();   \
  } while (0)
#endif
#elif defined(_MSC_VER)
#define XNN_UNREACHABLE __assume(0)
#else
#define XNN_UNREACHABLE \
  do {                  \
  } while (0)
#endif

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
    char _; 
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

struct xnn_qs8_f16_cvt_params {
  struct {
    int16_t zero_point;
    xnn_float16 scale;
  } scalar;
};

struct xnn_qs8_f32_cvt_params {
  struct {
    int32_t zero_point;
    float scale;
  } scalar;
};

union xnn_qu8_conv_minmax_params {
  struct {
    uint8_t kernel_zero_point;
    uint8_t padding[3];
    float scale;
    float magic_bias;
    int32_t magic_bias_less_output_zero_point;
    uint8_t output_min;
    uint8_t output_max;
  } fp32_neon;
};

struct xnn_s8_minmax_params {
  struct {
    int32_t min;
    int32_t max;
  } scalar;
};

struct xnn_u8_minmax_params {
  struct {
    uint32_t min;
    uint32_t max;
  } scalar;
};

union xnn_qs8_conv_minmax_params {
  struct {
    float scale;
    int16_t output_zero_point;
    int16_t output_min;
    int16_t output_max;
  } fp32_scalar;
  struct {
    int32_t multiplier;
    uint32_t shift;
    int16_t output_min;
    int16_t output_max;
    int32_t output_zero_point;
    int64_t rounding;
  } rndnu_scalar;
#if XNN_ARCH_ARM
  struct {
    float scale;
    float magic_bias;
    int32_t magic_bias_less_zero_point;
    uint32_t output_min;
    uint32_t output_max;
  } fp32_armsimd32;
#endif  // XNN_ARCH_ARM
#if XNN_ARCH_ARM || XNN_ARCH_ARM64
  struct {
    float scale;
    float magic_bias;
    int32_t magic_bias_less_output_zero_point;
    int8_t output_min;
    int8_t output_max;
  } fp32_neon;
  struct {
    float scale;
    int16_t output_zero_point;
    int8_t output_min;
    int8_t output_max;
  } fp32_neonv8;
  struct {
    int32_t right_pre_shift;
    int32_t multiplier;
    int32_t right_post_shift;
    int16_t output_zero_point;
    int8_t output_min;
    int8_t output_max;
  } rndnu_neon;
#endif 
};

union xnn_qs8_qc8w_conv_minmax_params {
  struct {
    float magic_bias;
    int32_t magic_bias_less_output_zero_point;
    int8_t output_min;
    int8_t output_max;
  } fp32_neon;
};

struct xnn_f32_minmax_params {
  struct {
    float min;
    float max;
  } scalar;
};


struct xnn_f32_qs8_cvt_params {
  struct {
    float scale;
    int16_t output_zero_point;
  } scalar;
};
struct xnn_f32_default_params {
  char _;  // Dummy member variable to comply with the C standard
};
struct xnn_f16_default_params {
  char _;  // Dummy member variable to comply with the C standard
};
struct xnn_f32_elu_params {
  struct {
    float prescale;
    float alpha;
    float beta;
  } scalar;
};
struct xnn_f32_lrelu_params {
  struct {
    float slope;
  } scalar;
};

// Log2 sizeof macros (from xnnpack/common.h)
#define XNN_LOG2_SIZEOF_INT8_T 0    // log2(sizeof(int8_t))
#define XNN_LOG2_SIZEOF_UINT8_T 0   // log2(sizeof(uint8_t))
#define XNN_LOG2_SIZEOF_INT16_T 1   // log2(sizeof(int16_t))
#define XNN_LOG2_SIZEOF_UINT16_T 1  // log2(sizeof(uint16_t))
#define XNN_LOG2_SIZEOF_FLOAT16 1   // log2(sizeof(xnn_float16))
#define XNN_LOG2_SIZEOF_BFLOAT16 1  // log2(sizeof(xnn_bfloat16))
#define XNN_LOG2_SIZEOF_FLOAT 2     // log2(sizeof(float))
#define XNN_LOG2_SIZEOF_INT32_T 2   // log2(sizeof(int32_t))
#define XNN_LOG2_SIZEOF_UINT32_T 2  // log2(sizeof(uint32_t))

// XNN_FALLTHROUGH for switch statement fall through
#if defined(__cplusplus) && (__cplusplus >= 201703L)
#define XNN_FALLTHROUGH [[fallthrough]]
#elif defined(__clang__)
#define XNN_FALLTHROUGH __attribute__((fallthrough))
#elif defined(__GNUC__) && __GNUC__ >= 7
#define XNN_FALLTHROUGH __attribute__((fallthrough))
#else
#define XNN_FALLTHROUGH ((void)0)
#endif

// XNN_COMPILER_HAS_FEATURE macro
#if defined(__clang__)
#define XNN_COMPILER_HAS_FEATURE(feature) __has_feature(feature)
#else
#define XNN_COMPILER_HAS_FEATURE(feature) 0
#endif

struct xnn_qs8_qc4w_packing_params {
  int8_t input_zero_point;
  uint8_t kernel_zero_point;
};
struct xnn_f32_qc4w_minmax_params {
  struct {
    float min;
    float max;
    int32_t kernel_zero_point;
  } scalar;
};
struct xnn_qd8_quantization_params {
  int32_t zero_point;
  float inv_scale;
};

struct xnn_f16_lrelu_params {
  struct {
    xnn_float16 slope;
  } scalar;
};
struct xnn_f16_elu_params {
  struct {
    xnn_float16 prescale;
    xnn_float16 alpha;
    xnn_float16 beta;
  } scalar;
};
struct xnn_f16_scale_params {
  struct {
    xnn_float16 scale;
  } scalar;
};

struct xnn_f16_qs8_cvt_params {
  struct {
    xnn_float16 scale;
    int16_t output_zero_point;
  } scalar;
};
struct xnn_f16_f32acc_scale_params {
  struct {
    float scale;
  } scalar;
};

#endif // XNN_MINIMAL_H
