#include "shim.h"
/* Pure C, nearest-even binary32 sqrt, including all special values.
   A binary32 product has at most 48 significant bits, so double compares
   the candidate square exactly. Adjacent-float midpoint squares need at
   most 50 bits and are also exact. No libc calls or errno writes. */
float f32_sqrt(float x) {
  uint32_t bits=float_bits(x),magnitude=bits&UINT32_C(0x7fffffff);
  if(magnitude>UINT32_C(0x7f800000)) return x+x;
  if(magnitude==0) return x;
  if(bits&UINT32_C(0x80000000)) return bits_float(UINT32_C(0x7fc00000));
  if(magnitude==UINT32_C(0x7f800000)) return x;
  uint32_t lo=0,hi=UINT32_C(0x5f800000);
  while(hi-lo>1) {
    uint32_t mid=(lo+hi)/2;
    double y=(double)bits_float(mid);
    if(y*y<=(double)x) lo=mid; else hi=mid;
  }
  double lower=(double)bits_float(lo),upper=(double)bits_float(hi);
  double midpoint=(lower+upper)*0.5;
  double square=midpoint*midpoint;
  if((double)x<square) return bits_float(lo);
  if((double)x>square) return bits_float(hi);
  return bits_float((lo&1)?hi:lo);
}
float32x4_t vsqrtq_f32(float32x4_t a) {
  float32x4_t r;
  for(size_t i=0;i<4;i++) r.lane[i]=f32_sqrt(a.lane[i]);
  return r;
}
vfloat32m8_t __riscv_vfsqrt_v_f32m8(vfloat32m8_t a,size_t vl) {
  vfloat32m8_t r={{0}};
  for(size_t i=0;i<vl;i++) r.lane[i]=f32_sqrt(a.lane[i]);
  return r;
}
