#ifndef PW_NATIVE_ISA_ARRAYS_H
#define PW_NATIVE_ISA_ARRAYS_H
#include <assert.h>
#include <stddef.h>
#include <stdint.h>
#include <string.h>
#define XNN_LIKELY(x) (x)
#define XNN_UNLIKELY(x) (x)
extern unsigned pw_vl_mode,pw_tail_mode;
typedef struct {uint32_t lane[2];} uint32x2_t;
typedef struct {uint32x2_t val[2];} uint32x2x2_t;
typedef struct {uint32_t lane[4];} vuint32m1_t;
typedef struct {uint32_t lane[16];} vuint32m4_t;
typedef struct {vuint32m4_t val[2];} vuint32m4x2_t;
static inline uint32x2_t vdup_n_u32(uint32_t x){uint32x2_t r={{x,x}};return r;}
static inline uint32x2_t vmov_n_u32(uint32_t x){return vdup_n_u32(x);}
static inline uint32x2_t vld1_u32(const uint32_t*p){uint32x2_t r={{p[0],p[1]}};return r;}
static inline void vst1_u32(uint32_t*p,uint32x2_t v){p[0]=v.lane[0];p[1]=v.lane[1];}
static inline uint32x2_t vld1_lane_u32(const uint32_t*p,uint32x2_t v,int lane){assert(lane>=0&&lane<=1);v.lane[lane]=*p;return v;}
static inline uint32x2x2_t vld2_lane_u32(const uint32_t*p,uint32x2x2_t v,int lane){assert(lane>=0&&lane<=1);v.val[0].lane[lane]=p[0];v.val[1].lane[lane]=p[1];return v;}
static inline size_t __riscv_vsetvl_e32m4(size_t n){
 if(n<=16)return n;if(n>=32)return 16;
 if(pw_vl_mode==1)return(n+1)/2;
 if(pw_vl_mode==2)return(n+1)/2+(16-(n+1)/2)/2;
 return 16;
}
static inline uint32_t pw_inactive(size_t i){return pw_tail_mode?0xcafe0100u^(uint32_t)i:0;}
static inline vuint32m1_t __riscv_vle32_v_u32m1(const uint32_t*p,size_t vl){assert(vl<=4);vuint32m1_t r;for(size_t i=0;i<4;i++)r.lane[i]=i<vl?p[i]:pw_inactive(i);return r;}
static inline vuint32m4_t __riscv_vle32_v_u32m4(const uint32_t*p,size_t vl){assert(vl<=16);vuint32m4_t r;for(size_t i=0;i<16;i++)r.lane[i]=i<vl?p[i]:pw_inactive(i);return r;}
static inline vuint32m1_t __riscv_vmv_v_x_u32m1(uint32_t x,size_t vl){assert(vl<=4);vuint32m1_t r;for(size_t i=0;i<4;i++)r.lane[i]=i<vl?x:pw_inactive(i);return r;}
static inline void __riscv_vse32_v_u32m1(uint32_t*p,vuint32m1_t v,size_t vl){assert(vl<=4);for(size_t i=0;i<vl;i++)p[i]=v.lane[i];}
static inline vuint32m4x2_t __riscv_vcreate_v_u32m4x2(vuint32m4_t a,vuint32m4_t b){vuint32m4x2_t r={{a,b}};return r;}
static inline void __riscv_vsseg2e32_v_u32m4x2(uint32_t*p,vuint32m4x2_t v,size_t vl){assert(vl<=16);for(size_t i=0;i<vl;i++){p[2*i]=v.val[0].lane[i];p[2*i+1]=v.val[1].lane[i];}}
static inline void __riscv_vsse32_v_u32m4(uint32_t*p,ptrdiff_t stride,vuint32m4_t v,size_t vl){assert(vl<=16);for(size_t i=0;i<vl;i++)*(uint32_t*)((uintptr_t)p+(uintptr_t)stride*i)=v.lane[i];}
#endif
