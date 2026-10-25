#ifndef MAXPOOL_KERNEL_RUNTIME_H
#define MAXPOOL_KERNEL_RUNTIME_H
#include <stddef.h>
#include <stdint.h>
struct xnn_f32_minmax_params;
void test_neon(size_t,size_t,size_t,const float**,size_t,size_t,float*,size_t,size_t,const struct xnn_f32_minmax_params*);
void test_rvv(size_t,size_t,size_t,const float**,size_t,size_t,float*,size_t,size_t,const struct xnn_f32_minmax_params*);
#endif
