#ifndef XT_NATIVE_ISA_ARRAYS_H
#define XT_NATIVE_ISA_ARRAYS_H
#include <stdint.h>
#include <stddef.h>
#include <assert.h>
#include <string.h>
#define XNN_OOB_READS
#define XNN_UNPREDICTABLE(x) (x)
extern unsigned xt_vl_mode,xt_tail_mode;
typedef struct {uint32_t s[2];} uint32x2_t;
typedef struct {uint32x2_t val[2];} uint32x2x2_t;
typedef struct {uint32_t s[32];} vuint32m8_t;
static inline size_t round_down_po2(size_t x,size_t q){return x&~(q-1);}
static inline size_t doz(size_t a,size_t b){return a>b?a-b:0;}
static inline uint32x2_t vld1_u32(const uint32_t*p){uint32x2_t r={{p[0],p[1]}};return r;}
static inline uint32x2_t vmov_n_u32(uint32_t x){uint32x2_t r={{x,x}};return r;}
static inline uint32x2x2_t vzip_u32(uint32x2_t a,uint32x2_t b){uint32x2x2_t r={{{{a.s[0],b.s[0]}},{{a.s[1],b.s[1]}}}};return r;}
static inline uint32x2_t vzip1_u32(uint32x2_t a,uint32x2_t b){uint32x2_t r={{a.s[0],b.s[0]}};return r;}
static inline uint32x2_t vzip2_u32(uint32x2_t a,uint32x2_t b){uint32x2_t r={{a.s[1],b.s[1]}};return r;}
static inline void vst1_u32(uint32_t*p,uint32x2_t a){p[0]=a.s[0];p[1]=a.s[1];}
static inline void vst1_lane_u32(uint32_t*p,uint32x2_t a,int lane){assert(lane==0||lane==1);*p=a.s[lane];}
static inline size_t __riscv_vsetvl_e32m8(size_t avl){
 if(avl<=32)return avl;
 if(avl>=64)return 32;
 if(xt_vl_mode==1)return (avl+1)/2;
 if(xt_vl_mode==2)return (avl+1)/2+(32-(avl+1)/2)/2;
 return 32;
}
static inline vuint32m8_t __riscv_vle32_v_u32m8(const uint32_t*p,size_t vl){
 assert(vl<=32);vuint32m8_t r;
 for(size_t j=0;j<32;j++)r.s[j]=j<vl?p[j]:(xt_tail_mode?0xabe02000u^(uint32_t)j:0);
 return r;
}
static inline void __riscv_vsse32_v_u32m8(uint32_t*p,ptrdiff_t stride,vuint32m8_t a,size_t vl){
 assert(vl<=32);
 for(size_t j=0;j<vl;j++){
  uintptr_t address=(uintptr_t)p+(uintptr_t)stride*j;
  *(uint32_t*)address=a.s[j];
 }
}
#endif
