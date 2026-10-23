#ifndef SHARED_FLOAT_H
#define SHARED_FLOAT_H
float f32_sub(float a, float b);
float32x4_t vld1q_f32(const float *p);
float32x4_t vsubq_f32(float32x4_t a, float32x4_t b);
void vst1q_f32(float *p, float32x4_t a);
float32x2_t vget_low_f32(float32x4_t a);
float32x2_t vget_high_f32(float32x4_t a);
void vst1_f32(float *p, float32x2_t a);
void vst1_lane_f32(float *p, float32x2_t a, int lane);
vfloat32m8_t __riscv_vle32_v_f32m8(const float *p, size_t vl);
vfloat32m8_t __riscv_vfsub_vv_f32m8(vfloat32m8_t a, vfloat32m8_t b, size_t vl);
void __riscv_vse32_v_f32m8(float *p, vfloat32m8_t a, size_t vl);
#endif
