#include "u32_shim.h"
size_t round_down_po2(size_t n,size_t q) { return n & ~(q-1); }
size_t doz(size_t n,size_t d) { return n>d ? n-d : 0; }
uint32x2_t vld1_u32(const uint32_t *p) { uint32x2_t r={{p[0],p[1]}}; return r; }
uint32x2_t vmov_n_u32(uint32_t x) { uint32x2_t r={{x,x}}; return r; }
uint32x2_t vdup_n_u32(uint32_t x) { return vmov_n_u32(x); }
uint32x2x2_t vzip_u32(uint32x2_t a,uint32x2_t b) {
  uint32x2x2_t r={{{{a.lane[0],b.lane[0]}},{{a.lane[1],b.lane[1]}}}}; return r;
}
uint32x2x2_t vld2_lane_u32(const uint32_t *p,uint32x2x2_t a,int lane) {
  a.val[0].lane[lane]=p[0]; a.val[1].lane[lane]=p[1]; return a;
}
uint32x2_t vld1_lane_u32(const uint32_t *p,uint32x2_t a,int lane) { a.lane[lane]=*p; return a; }
void vst1_u32(uint32_t *p,uint32x2_t a) { p[0]=a.lane[0]; p[1]=a.lane[1]; }
void vst1_lane_u32(uint32_t *p,uint32x2_t a,int lane) { *p=a.lane[lane]; }
size_t __riscv_vsetvl_e32m8(size_t n) { return n<32 ? n : 32; }
size_t __riscv_vsetvl_e32m4(size_t n) { return n<16 ? n : 16; }
vuint32m8_t __riscv_vle32_v_u32m8(const uint32_t *p,size_t vl) {
  vuint32m8_t r={{0}}; for(size_t i=0;i<vl;i++)r.lane[i]=p[i]; return r;
}
void __riscv_vsse32_v_u32m8(uint32_t *p,ptrdiff_t stride,vuint32m8_t a,size_t vl) {
  for(size_t i=0;i<vl;i++)*(uint32_t*)((char*)p+i*stride)=a.lane[i];
}
vuint32m1_t __riscv_vle32_v_u32m1(const uint32_t *p,size_t vl) {
  vuint32m1_t r={{0}}; for(size_t i=0;i<vl;i++)r.lane[i]=p[i]; return r;
}
vuint32m1_t __riscv_vmv_v_x_u32m1(uint32_t x,size_t vl) {
  vuint32m1_t r={{0}}; for(size_t i=0;i<vl;i++)r.lane[i]=x; return r;
}
void __riscv_vse32_v_u32m1(uint32_t *p,vuint32m1_t a,size_t vl) {
  for(size_t i=0;i<vl;i++)p[i]=a.lane[i];
}
vuint32m4_t __riscv_vle32_v_u32m4(const uint32_t *p,size_t vl) {
  vuint32m4_t r={{0}}; for(size_t i=0;i<vl;i++)r.lane[i]=p[i]; return r;
}
vuint32m4x2_t __riscv_vcreate_v_u32m4x2(vuint32m4_t a,vuint32m4_t b) {
  vuint32m4x2_t r={{a,b}}; return r;
}
void __riscv_vsseg2e32_v_u32m4x2(uint32_t *p,vuint32m4x2_t a,size_t vl) {
  for(size_t i=0;i<vl;i++) { p[2*i]=a.val[0].lane[i]; p[2*i+1]=a.val[1].lane[i]; }
}
void __riscv_vsse32_v_u32m4(uint32_t *p,ptrdiff_t stride,vuint32m4_t a,size_t vl) {
  for(size_t i=0;i<vl;i++)*(uint32_t*)((char*)p+i*stride)=a.lane[i];
}
