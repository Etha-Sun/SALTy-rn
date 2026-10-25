#ifndef QS8MUL_PUBLIC_TYPES_H
#define QS8MUL_PUBLIC_TYPES_H
#include <stdint.h>
#include <stddef.h>
union xnn_qs8_mul_minmax_params {struct {int8_t a_zero_point;int8_t b_zero_point;float scale;int16_t output_zero_point;int8_t output_min;int8_t output_max;}scalar;};
#endif
