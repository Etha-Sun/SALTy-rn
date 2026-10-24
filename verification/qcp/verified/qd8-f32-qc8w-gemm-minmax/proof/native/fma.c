/* Native-only FMA implementation, delegated to host libm; not formal evidence. */
float native_fma(float a,float b,float c) {
#ifdef BOTH_WRONG
 return 0.0f;
#else
 return fmaf(a,b,c);
#endif
}
float32x4_t vfmaq_f32(float32x4_t acc,float32x4_t a,float32x4_t b) {
 float32x4_t r;
 r.s0=native_fma(a.s0,b.s0,acc.s0);
 r.s1=native_fma(a.s1,b.s1,acc.s1);
 r.s2=native_fma(a.s2,b.s2,acc.s2);
 r.s3=native_fma(a.s3,b.s3,acc.s3);
 return r;
}
vfloat32m2_t __riscv_vfmacc_vv_f32m2(vfloat32m2_t acc,vfloat32m2_t a,vfloat32m2_t b,size_t vl) {
 vfloat32m2_t r;
 r.s0=0<vl ? native_fma(a.s0,b.s0,acc.s0) : -12345.0f;
 r.s1=1<vl ? native_fma(a.s1,b.s1,acc.s1) : -12345.0f;
 r.s2=2<vl ? native_fma(a.s2,b.s2,acc.s2) : -12345.0f;
 r.s3=3<vl ? native_fma(a.s3,b.s3,acc.s3) : -12345.0f;
 r.s4=4<vl ? native_fma(a.s4,b.s4,acc.s4) : -12345.0f;
 r.s5=5<vl ? native_fma(a.s5,b.s5,acc.s5) : -12345.0f;
 r.s6=6<vl ? native_fma(a.s6,b.s6,acc.s6) : -12345.0f;
 r.s7=7<vl ? native_fma(a.s7,b.s7,acc.s7) : -12345.0f;
 return r;
}
