#ifndef HWC_NATIVE_EXTRA_H
#define HWC_NATIVE_EXTRA_H
static inline vuint32m1_t __riscv_vmv_v_x_u32m1(uint32_t x,size_t vl) {
 vuint32m1_t r={{0xDEADBEEFu,0xDEADBEEFu,0xDEADBEEFu,0xDEADBEEFu}};
 for(size_t i=0;i<vl;i++)r.lane[i]=x;return r;
}
static inline vfloat32m1_t __riscv_vreinterpret_v_u32m1_f32m1(vuint32m1_t a) {
 vfloat32m1_t r;memcpy(&r,&a,sizeof r);return r;
}
static inline vbool32_t __riscv_vmsgeu_vx_u32m1_b32(vuint32m1_t a,uint32_t b,size_t vl) {
 vbool32_t r={{0}};for(size_t i=0;i<vl;i++)r.lane[i]=a.lane[i]>=b;return r;
}
static inline vbool32_t __riscv_vmsltu_vx_u32m1_b32(vuint32m1_t a,uint32_t b,size_t vl) {
 vbool32_t r={{0}};for(size_t i=0;i<vl;i++)r.lane[i]=a.lane[i]<b;return r;
}
static inline vfloat32m1_t __riscv_vfmacc_vf_f32m1_mu(vbool32_t m,vfloat32m1_t acc,float w,vfloat32m1_t x,size_t vl) {
 for(size_t i=0;i<vl;i++)if(m.lane[i])acc.lane[i]=fmaf(w,x.lane[i],acc.lane[i]);
 for(size_t i=vl;i<4;i++)acc.lane[i]=NAN;return acc;
}
#endif
