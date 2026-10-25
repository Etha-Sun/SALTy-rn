#ifndef QS8_MUL_NATIVE_ISA_ARRAYS_H
#define QS8_MUL_NATIVE_ISA_ARRAYS_H
#include <stdint.h>
#include <stddef.h>
#include <string.h>
#include <math.h>
#include <assert.h>
#include <limits.h>
#include <fenv.h>
#define XNN_OOB_READS
#define XNN_UNLIKELY(x) (x)
#define XNN_ARCH_ARM64 1
#define __RISCV_VXRM_RDN 2
/* Finite diagnostic emulator only, not a proof or a body provider. Fixed
   VLEN128: e8m2/e32m8 VLMAX32. Zero inactive values below are one permitted
   representative in this finite emulator, not the public ISA specification.
   ARM: RNE, DN/FZ/FIZ/AH=0, traps disabled, flags unobserved.
   RISC-V: RNE, canonical arithmetic NaNs, VXRM RDN for shift0 clips. */
union xnn_qs8_mul_minmax_params {struct{int8_t a_zero_point,b_zero_point;float scale;int16_t output_zero_point;int8_t output_min,output_max;}scalar;};
static inline uint32_t qm_bits(float x){uint32_t u;memcpy(&u,&x,4);return u;}
static inline float qm_float(uint32_t x){float f;memcpy(&f,&x,4);return f;}
static inline int qm_nan(uint32_t x){return(x&0x7fffffffU)>0x7f800000U;}
static inline int32_t qm_i32(uint32_t x){return x<0x80000000U?(int32_t)x:(int32_t)((int64_t)x-4294967296LL);}
static inline int32_t qm_sat32(int64_t x){return x>INT32_MAX?INT32_MAX:x<INT32_MIN?INT32_MIN:(int32_t)x;}
static inline int16_t qm_sat16(int64_t x){return x>INT16_MAX?INT16_MAX:x<INT16_MIN?INT16_MIN:(int16_t)x;}
static inline int8_t qm_sat8(int64_t x){return x>INT8_MAX?INT8_MAX:x<INT8_MIN?INT8_MIN:(int8_t)x;}
static inline float qm_arm_mul(float a,float b){uint32_t x=qm_bits(a),y=qm_bits(b);if(qm_nan(x))return qm_float(x|0x00400000U);if(qm_nan(y))return qm_float(y|0x00400000U);volatile float f=a*b;return qm_nan(qm_bits(f))?qm_float(0x7fc00000U):f;}
static inline float qm_arm_add(float a,float b){uint32_t x=qm_bits(a),y=qm_bits(b);if(qm_nan(x))return qm_float(x|0x00400000U);if(qm_nan(y))return qm_float(y|0x00400000U);volatile float f=a+b;return qm_nan(qm_bits(f))?qm_float(0x7fc00000U):f;}
static inline float qm_rvv_mul(float a,float b){volatile float f=a*b;return qm_nan(qm_bits(f))?qm_float(0x7fc00000U):f;}
static inline float qm_rvv_add(float a,float b){volatile float f=a+b;return qm_nan(qm_bits(f))?qm_float(0x7fc00000U):f;}
static inline int32_t qm_rvv_cvt(float x){if(qm_nan(qm_bits(x))||x>=2147483648.0f)return INT32_MAX;if(x<=-2147483648.0f)return INT32_MIN;return(int32_t)llrintf(x);}
typedef struct{union{int8_t v[8];struct{int8_t s0;int8_t s1;int8_t s2;int8_t s3;int8_t s4;int8_t s5;int8_t s6;int8_t s7;};};}int8x8_t;
typedef struct{union{int16_t v[4];struct{int16_t s0;int16_t s1;int16_t s2;int16_t s3;};};}int16x4_t;
typedef struct{union{int16_t v[8];struct{int16_t s0;int16_t s1;int16_t s2;int16_t s3;int16_t s4;int16_t s5;int16_t s6;int16_t s7;};};}int16x8_t;
typedef struct{union{int32_t v[4];struct{int32_t s0;int32_t s1;int32_t s2;int32_t s3;};};}int32x4_t;
typedef struct{union{float v[4];struct{float s0;float s1;float s2;float s3;};};}float32x4_t;
typedef struct{union{uint32_t v[2];struct{uint32_t s0;uint32_t s1;};};}uint32x2_t;
typedef struct{union{uint16_t v[4];struct{uint16_t s0;uint16_t s1;uint16_t s2;uint16_t s3;};};}uint16x4_t;
typedef struct{union{int8_t v[32];struct{int8_t s0;int8_t s1;int8_t s2;int8_t s3;int8_t s4;int8_t s5;int8_t s6;int8_t s7;int8_t s8;int8_t s9;int8_t s10;int8_t s11;int8_t s12;int8_t s13;int8_t s14;int8_t s15;int8_t s16;int8_t s17;int8_t s18;int8_t s19;int8_t s20;int8_t s21;int8_t s22;int8_t s23;int8_t s24;int8_t s25;int8_t s26;int8_t s27;int8_t s28;int8_t s29;int8_t s30;int8_t s31;};};}vint8m2_t;
typedef struct{union{int16_t v[32];struct{int16_t s0;int16_t s1;int16_t s2;int16_t s3;int16_t s4;int16_t s5;int16_t s6;int16_t s7;int16_t s8;int16_t s9;int16_t s10;int16_t s11;int16_t s12;int16_t s13;int16_t s14;int16_t s15;int16_t s16;int16_t s17;int16_t s18;int16_t s19;int16_t s20;int16_t s21;int16_t s22;int16_t s23;int16_t s24;int16_t s25;int16_t s26;int16_t s27;int16_t s28;int16_t s29;int16_t s30;int16_t s31;};};}vint16m4_t;
typedef struct{union{int32_t v[32];struct{int32_t s0;int32_t s1;int32_t s2;int32_t s3;int32_t s4;int32_t s5;int32_t s6;int32_t s7;int32_t s8;int32_t s9;int32_t s10;int32_t s11;int32_t s12;int32_t s13;int32_t s14;int32_t s15;int32_t s16;int32_t s17;int32_t s18;int32_t s19;int32_t s20;int32_t s21;int32_t s22;int32_t s23;int32_t s24;int32_t s25;int32_t s26;int32_t s27;int32_t s28;int32_t s29;int32_t s30;int32_t s31;};};}vint32m8_t;
typedef struct{union{float v[32];struct{float s0;float s1;float s2;float s3;float s4;float s5;float s6;float s7;float s8;float s9;float s10;float s11;float s12;float s13;float s14;float s15;float s16;float s17;float s18;float s19;float s20;float s21;float s22;float s23;float s24;float s25;float s26;float s27;float s28;float s29;float s30;float s31;};};}vfloat32m8_t;

/* Diagnostic semantic struct view, not a physical SIMD ABI theorem. */
_Static_assert(sizeof(int8x8_t)==sizeof(int8_t)*8,"int8x8_t size");
_Static_assert(offsetof(int8x8_t,s0)==sizeof(int8_t)*0,"int8x8_t lane0");
_Static_assert(offsetof(int8x8_t,s1)==sizeof(int8_t)*1,"int8x8_t lane1");
_Static_assert(offsetof(int8x8_t,s2)==sizeof(int8_t)*2,"int8x8_t lane2");
_Static_assert(offsetof(int8x8_t,s3)==sizeof(int8_t)*3,"int8x8_t lane3");
_Static_assert(offsetof(int8x8_t,s4)==sizeof(int8_t)*4,"int8x8_t lane4");
_Static_assert(offsetof(int8x8_t,s5)==sizeof(int8_t)*5,"int8x8_t lane5");
_Static_assert(offsetof(int8x8_t,s6)==sizeof(int8_t)*6,"int8x8_t lane6");
_Static_assert(offsetof(int8x8_t,s7)==sizeof(int8_t)*7,"int8x8_t lane7");
_Static_assert(sizeof(int16x4_t)==sizeof(int16_t)*4,"int16x4_t size");
_Static_assert(offsetof(int16x4_t,s0)==sizeof(int16_t)*0,"int16x4_t lane0");
_Static_assert(offsetof(int16x4_t,s1)==sizeof(int16_t)*1,"int16x4_t lane1");
_Static_assert(offsetof(int16x4_t,s2)==sizeof(int16_t)*2,"int16x4_t lane2");
_Static_assert(offsetof(int16x4_t,s3)==sizeof(int16_t)*3,"int16x4_t lane3");
_Static_assert(sizeof(int16x8_t)==sizeof(int16_t)*8,"int16x8_t size");
_Static_assert(offsetof(int16x8_t,s0)==sizeof(int16_t)*0,"int16x8_t lane0");
_Static_assert(offsetof(int16x8_t,s1)==sizeof(int16_t)*1,"int16x8_t lane1");
_Static_assert(offsetof(int16x8_t,s2)==sizeof(int16_t)*2,"int16x8_t lane2");
_Static_assert(offsetof(int16x8_t,s3)==sizeof(int16_t)*3,"int16x8_t lane3");
_Static_assert(offsetof(int16x8_t,s4)==sizeof(int16_t)*4,"int16x8_t lane4");
_Static_assert(offsetof(int16x8_t,s5)==sizeof(int16_t)*5,"int16x8_t lane5");
_Static_assert(offsetof(int16x8_t,s6)==sizeof(int16_t)*6,"int16x8_t lane6");
_Static_assert(offsetof(int16x8_t,s7)==sizeof(int16_t)*7,"int16x8_t lane7");
_Static_assert(sizeof(int32x4_t)==sizeof(int32_t)*4,"int32x4_t size");
_Static_assert(offsetof(int32x4_t,s0)==sizeof(int32_t)*0,"int32x4_t lane0");
_Static_assert(offsetof(int32x4_t,s1)==sizeof(int32_t)*1,"int32x4_t lane1");
_Static_assert(offsetof(int32x4_t,s2)==sizeof(int32_t)*2,"int32x4_t lane2");
_Static_assert(offsetof(int32x4_t,s3)==sizeof(int32_t)*3,"int32x4_t lane3");
_Static_assert(sizeof(float32x4_t)==sizeof(float)*4,"float32x4_t size");
_Static_assert(offsetof(float32x4_t,s0)==sizeof(float)*0,"float32x4_t lane0");
_Static_assert(offsetof(float32x4_t,s1)==sizeof(float)*1,"float32x4_t lane1");
_Static_assert(offsetof(float32x4_t,s2)==sizeof(float)*2,"float32x4_t lane2");
_Static_assert(offsetof(float32x4_t,s3)==sizeof(float)*3,"float32x4_t lane3");
_Static_assert(sizeof(uint32x2_t)==sizeof(uint32_t)*2,"uint32x2_t size");
_Static_assert(offsetof(uint32x2_t,s0)==sizeof(uint32_t)*0,"uint32x2_t lane0");
_Static_assert(offsetof(uint32x2_t,s1)==sizeof(uint32_t)*1,"uint32x2_t lane1");
_Static_assert(sizeof(uint16x4_t)==sizeof(uint16_t)*4,"uint16x4_t size");
_Static_assert(offsetof(uint16x4_t,s0)==sizeof(uint16_t)*0,"uint16x4_t lane0");
_Static_assert(offsetof(uint16x4_t,s1)==sizeof(uint16_t)*1,"uint16x4_t lane1");
_Static_assert(offsetof(uint16x4_t,s2)==sizeof(uint16_t)*2,"uint16x4_t lane2");
_Static_assert(offsetof(uint16x4_t,s3)==sizeof(uint16_t)*3,"uint16x4_t lane3");
_Static_assert(sizeof(vint8m2_t)==sizeof(int8_t)*32,"vint8m2_t size");
_Static_assert(offsetof(vint8m2_t,s0)==sizeof(int8_t)*0,"vint8m2_t lane0");
_Static_assert(offsetof(vint8m2_t,s1)==sizeof(int8_t)*1,"vint8m2_t lane1");
_Static_assert(offsetof(vint8m2_t,s2)==sizeof(int8_t)*2,"vint8m2_t lane2");
_Static_assert(offsetof(vint8m2_t,s3)==sizeof(int8_t)*3,"vint8m2_t lane3");
_Static_assert(offsetof(vint8m2_t,s4)==sizeof(int8_t)*4,"vint8m2_t lane4");
_Static_assert(offsetof(vint8m2_t,s5)==sizeof(int8_t)*5,"vint8m2_t lane5");
_Static_assert(offsetof(vint8m2_t,s6)==sizeof(int8_t)*6,"vint8m2_t lane6");
_Static_assert(offsetof(vint8m2_t,s7)==sizeof(int8_t)*7,"vint8m2_t lane7");
_Static_assert(offsetof(vint8m2_t,s8)==sizeof(int8_t)*8,"vint8m2_t lane8");
_Static_assert(offsetof(vint8m2_t,s9)==sizeof(int8_t)*9,"vint8m2_t lane9");
_Static_assert(offsetof(vint8m2_t,s10)==sizeof(int8_t)*10,"vint8m2_t lane10");
_Static_assert(offsetof(vint8m2_t,s11)==sizeof(int8_t)*11,"vint8m2_t lane11");
_Static_assert(offsetof(vint8m2_t,s12)==sizeof(int8_t)*12,"vint8m2_t lane12");
_Static_assert(offsetof(vint8m2_t,s13)==sizeof(int8_t)*13,"vint8m2_t lane13");
_Static_assert(offsetof(vint8m2_t,s14)==sizeof(int8_t)*14,"vint8m2_t lane14");
_Static_assert(offsetof(vint8m2_t,s15)==sizeof(int8_t)*15,"vint8m2_t lane15");
_Static_assert(offsetof(vint8m2_t,s16)==sizeof(int8_t)*16,"vint8m2_t lane16");
_Static_assert(offsetof(vint8m2_t,s17)==sizeof(int8_t)*17,"vint8m2_t lane17");
_Static_assert(offsetof(vint8m2_t,s18)==sizeof(int8_t)*18,"vint8m2_t lane18");
_Static_assert(offsetof(vint8m2_t,s19)==sizeof(int8_t)*19,"vint8m2_t lane19");
_Static_assert(offsetof(vint8m2_t,s20)==sizeof(int8_t)*20,"vint8m2_t lane20");
_Static_assert(offsetof(vint8m2_t,s21)==sizeof(int8_t)*21,"vint8m2_t lane21");
_Static_assert(offsetof(vint8m2_t,s22)==sizeof(int8_t)*22,"vint8m2_t lane22");
_Static_assert(offsetof(vint8m2_t,s23)==sizeof(int8_t)*23,"vint8m2_t lane23");
_Static_assert(offsetof(vint8m2_t,s24)==sizeof(int8_t)*24,"vint8m2_t lane24");
_Static_assert(offsetof(vint8m2_t,s25)==sizeof(int8_t)*25,"vint8m2_t lane25");
_Static_assert(offsetof(vint8m2_t,s26)==sizeof(int8_t)*26,"vint8m2_t lane26");
_Static_assert(offsetof(vint8m2_t,s27)==sizeof(int8_t)*27,"vint8m2_t lane27");
_Static_assert(offsetof(vint8m2_t,s28)==sizeof(int8_t)*28,"vint8m2_t lane28");
_Static_assert(offsetof(vint8m2_t,s29)==sizeof(int8_t)*29,"vint8m2_t lane29");
_Static_assert(offsetof(vint8m2_t,s30)==sizeof(int8_t)*30,"vint8m2_t lane30");
_Static_assert(offsetof(vint8m2_t,s31)==sizeof(int8_t)*31,"vint8m2_t lane31");
_Static_assert(sizeof(vint16m4_t)==sizeof(int16_t)*32,"vint16m4_t size");
_Static_assert(offsetof(vint16m4_t,s0)==sizeof(int16_t)*0,"vint16m4_t lane0");
_Static_assert(offsetof(vint16m4_t,s1)==sizeof(int16_t)*1,"vint16m4_t lane1");
_Static_assert(offsetof(vint16m4_t,s2)==sizeof(int16_t)*2,"vint16m4_t lane2");
_Static_assert(offsetof(vint16m4_t,s3)==sizeof(int16_t)*3,"vint16m4_t lane3");
_Static_assert(offsetof(vint16m4_t,s4)==sizeof(int16_t)*4,"vint16m4_t lane4");
_Static_assert(offsetof(vint16m4_t,s5)==sizeof(int16_t)*5,"vint16m4_t lane5");
_Static_assert(offsetof(vint16m4_t,s6)==sizeof(int16_t)*6,"vint16m4_t lane6");
_Static_assert(offsetof(vint16m4_t,s7)==sizeof(int16_t)*7,"vint16m4_t lane7");
_Static_assert(offsetof(vint16m4_t,s8)==sizeof(int16_t)*8,"vint16m4_t lane8");
_Static_assert(offsetof(vint16m4_t,s9)==sizeof(int16_t)*9,"vint16m4_t lane9");
_Static_assert(offsetof(vint16m4_t,s10)==sizeof(int16_t)*10,"vint16m4_t lane10");
_Static_assert(offsetof(vint16m4_t,s11)==sizeof(int16_t)*11,"vint16m4_t lane11");
_Static_assert(offsetof(vint16m4_t,s12)==sizeof(int16_t)*12,"vint16m4_t lane12");
_Static_assert(offsetof(vint16m4_t,s13)==sizeof(int16_t)*13,"vint16m4_t lane13");
_Static_assert(offsetof(vint16m4_t,s14)==sizeof(int16_t)*14,"vint16m4_t lane14");
_Static_assert(offsetof(vint16m4_t,s15)==sizeof(int16_t)*15,"vint16m4_t lane15");
_Static_assert(offsetof(vint16m4_t,s16)==sizeof(int16_t)*16,"vint16m4_t lane16");
_Static_assert(offsetof(vint16m4_t,s17)==sizeof(int16_t)*17,"vint16m4_t lane17");
_Static_assert(offsetof(vint16m4_t,s18)==sizeof(int16_t)*18,"vint16m4_t lane18");
_Static_assert(offsetof(vint16m4_t,s19)==sizeof(int16_t)*19,"vint16m4_t lane19");
_Static_assert(offsetof(vint16m4_t,s20)==sizeof(int16_t)*20,"vint16m4_t lane20");
_Static_assert(offsetof(vint16m4_t,s21)==sizeof(int16_t)*21,"vint16m4_t lane21");
_Static_assert(offsetof(vint16m4_t,s22)==sizeof(int16_t)*22,"vint16m4_t lane22");
_Static_assert(offsetof(vint16m4_t,s23)==sizeof(int16_t)*23,"vint16m4_t lane23");
_Static_assert(offsetof(vint16m4_t,s24)==sizeof(int16_t)*24,"vint16m4_t lane24");
_Static_assert(offsetof(vint16m4_t,s25)==sizeof(int16_t)*25,"vint16m4_t lane25");
_Static_assert(offsetof(vint16m4_t,s26)==sizeof(int16_t)*26,"vint16m4_t lane26");
_Static_assert(offsetof(vint16m4_t,s27)==sizeof(int16_t)*27,"vint16m4_t lane27");
_Static_assert(offsetof(vint16m4_t,s28)==sizeof(int16_t)*28,"vint16m4_t lane28");
_Static_assert(offsetof(vint16m4_t,s29)==sizeof(int16_t)*29,"vint16m4_t lane29");
_Static_assert(offsetof(vint16m4_t,s30)==sizeof(int16_t)*30,"vint16m4_t lane30");
_Static_assert(offsetof(vint16m4_t,s31)==sizeof(int16_t)*31,"vint16m4_t lane31");
_Static_assert(sizeof(vint32m8_t)==sizeof(int32_t)*32,"vint32m8_t size");
_Static_assert(offsetof(vint32m8_t,s0)==sizeof(int32_t)*0,"vint32m8_t lane0");
_Static_assert(offsetof(vint32m8_t,s1)==sizeof(int32_t)*1,"vint32m8_t lane1");
_Static_assert(offsetof(vint32m8_t,s2)==sizeof(int32_t)*2,"vint32m8_t lane2");
_Static_assert(offsetof(vint32m8_t,s3)==sizeof(int32_t)*3,"vint32m8_t lane3");
_Static_assert(offsetof(vint32m8_t,s4)==sizeof(int32_t)*4,"vint32m8_t lane4");
_Static_assert(offsetof(vint32m8_t,s5)==sizeof(int32_t)*5,"vint32m8_t lane5");
_Static_assert(offsetof(vint32m8_t,s6)==sizeof(int32_t)*6,"vint32m8_t lane6");
_Static_assert(offsetof(vint32m8_t,s7)==sizeof(int32_t)*7,"vint32m8_t lane7");
_Static_assert(offsetof(vint32m8_t,s8)==sizeof(int32_t)*8,"vint32m8_t lane8");
_Static_assert(offsetof(vint32m8_t,s9)==sizeof(int32_t)*9,"vint32m8_t lane9");
_Static_assert(offsetof(vint32m8_t,s10)==sizeof(int32_t)*10,"vint32m8_t lane10");
_Static_assert(offsetof(vint32m8_t,s11)==sizeof(int32_t)*11,"vint32m8_t lane11");
_Static_assert(offsetof(vint32m8_t,s12)==sizeof(int32_t)*12,"vint32m8_t lane12");
_Static_assert(offsetof(vint32m8_t,s13)==sizeof(int32_t)*13,"vint32m8_t lane13");
_Static_assert(offsetof(vint32m8_t,s14)==sizeof(int32_t)*14,"vint32m8_t lane14");
_Static_assert(offsetof(vint32m8_t,s15)==sizeof(int32_t)*15,"vint32m8_t lane15");
_Static_assert(offsetof(vint32m8_t,s16)==sizeof(int32_t)*16,"vint32m8_t lane16");
_Static_assert(offsetof(vint32m8_t,s17)==sizeof(int32_t)*17,"vint32m8_t lane17");
_Static_assert(offsetof(vint32m8_t,s18)==sizeof(int32_t)*18,"vint32m8_t lane18");
_Static_assert(offsetof(vint32m8_t,s19)==sizeof(int32_t)*19,"vint32m8_t lane19");
_Static_assert(offsetof(vint32m8_t,s20)==sizeof(int32_t)*20,"vint32m8_t lane20");
_Static_assert(offsetof(vint32m8_t,s21)==sizeof(int32_t)*21,"vint32m8_t lane21");
_Static_assert(offsetof(vint32m8_t,s22)==sizeof(int32_t)*22,"vint32m8_t lane22");
_Static_assert(offsetof(vint32m8_t,s23)==sizeof(int32_t)*23,"vint32m8_t lane23");
_Static_assert(offsetof(vint32m8_t,s24)==sizeof(int32_t)*24,"vint32m8_t lane24");
_Static_assert(offsetof(vint32m8_t,s25)==sizeof(int32_t)*25,"vint32m8_t lane25");
_Static_assert(offsetof(vint32m8_t,s26)==sizeof(int32_t)*26,"vint32m8_t lane26");
_Static_assert(offsetof(vint32m8_t,s27)==sizeof(int32_t)*27,"vint32m8_t lane27");
_Static_assert(offsetof(vint32m8_t,s28)==sizeof(int32_t)*28,"vint32m8_t lane28");
_Static_assert(offsetof(vint32m8_t,s29)==sizeof(int32_t)*29,"vint32m8_t lane29");
_Static_assert(offsetof(vint32m8_t,s30)==sizeof(int32_t)*30,"vint32m8_t lane30");
_Static_assert(offsetof(vint32m8_t,s31)==sizeof(int32_t)*31,"vint32m8_t lane31");
_Static_assert(sizeof(vfloat32m8_t)==sizeof(float)*32,"vfloat32m8_t size");
_Static_assert(offsetof(vfloat32m8_t,s0)==sizeof(float)*0,"vfloat32m8_t lane0");
_Static_assert(offsetof(vfloat32m8_t,s1)==sizeof(float)*1,"vfloat32m8_t lane1");
_Static_assert(offsetof(vfloat32m8_t,s2)==sizeof(float)*2,"vfloat32m8_t lane2");
_Static_assert(offsetof(vfloat32m8_t,s3)==sizeof(float)*3,"vfloat32m8_t lane3");
_Static_assert(offsetof(vfloat32m8_t,s4)==sizeof(float)*4,"vfloat32m8_t lane4");
_Static_assert(offsetof(vfloat32m8_t,s5)==sizeof(float)*5,"vfloat32m8_t lane5");
_Static_assert(offsetof(vfloat32m8_t,s6)==sizeof(float)*6,"vfloat32m8_t lane6");
_Static_assert(offsetof(vfloat32m8_t,s7)==sizeof(float)*7,"vfloat32m8_t lane7");
_Static_assert(offsetof(vfloat32m8_t,s8)==sizeof(float)*8,"vfloat32m8_t lane8");
_Static_assert(offsetof(vfloat32m8_t,s9)==sizeof(float)*9,"vfloat32m8_t lane9");
_Static_assert(offsetof(vfloat32m8_t,s10)==sizeof(float)*10,"vfloat32m8_t lane10");
_Static_assert(offsetof(vfloat32m8_t,s11)==sizeof(float)*11,"vfloat32m8_t lane11");
_Static_assert(offsetof(vfloat32m8_t,s12)==sizeof(float)*12,"vfloat32m8_t lane12");
_Static_assert(offsetof(vfloat32m8_t,s13)==sizeof(float)*13,"vfloat32m8_t lane13");
_Static_assert(offsetof(vfloat32m8_t,s14)==sizeof(float)*14,"vfloat32m8_t lane14");
_Static_assert(offsetof(vfloat32m8_t,s15)==sizeof(float)*15,"vfloat32m8_t lane15");
_Static_assert(offsetof(vfloat32m8_t,s16)==sizeof(float)*16,"vfloat32m8_t lane16");
_Static_assert(offsetof(vfloat32m8_t,s17)==sizeof(float)*17,"vfloat32m8_t lane17");
_Static_assert(offsetof(vfloat32m8_t,s18)==sizeof(float)*18,"vfloat32m8_t lane18");
_Static_assert(offsetof(vfloat32m8_t,s19)==sizeof(float)*19,"vfloat32m8_t lane19");
_Static_assert(offsetof(vfloat32m8_t,s20)==sizeof(float)*20,"vfloat32m8_t lane20");
_Static_assert(offsetof(vfloat32m8_t,s21)==sizeof(float)*21,"vfloat32m8_t lane21");
_Static_assert(offsetof(vfloat32m8_t,s22)==sizeof(float)*22,"vfloat32m8_t lane22");
_Static_assert(offsetof(vfloat32m8_t,s23)==sizeof(float)*23,"vfloat32m8_t lane23");
_Static_assert(offsetof(vfloat32m8_t,s24)==sizeof(float)*24,"vfloat32m8_t lane24");
_Static_assert(offsetof(vfloat32m8_t,s25)==sizeof(float)*25,"vfloat32m8_t lane25");
_Static_assert(offsetof(vfloat32m8_t,s26)==sizeof(float)*26,"vfloat32m8_t lane26");
_Static_assert(offsetof(vfloat32m8_t,s27)==sizeof(float)*27,"vfloat32m8_t lane27");
_Static_assert(offsetof(vfloat32m8_t,s28)==sizeof(float)*28,"vfloat32m8_t lane28");
_Static_assert(offsetof(vfloat32m8_t,s29)==sizeof(float)*29,"vfloat32m8_t lane29");
_Static_assert(offsetof(vfloat32m8_t,s30)==sizeof(float)*30,"vfloat32m8_t lane30");
_Static_assert(offsetof(vfloat32m8_t,s31)==sizeof(float)*31,"vfloat32m8_t lane31");
static inline int8x8_t vdup_n_s8(int8_t x){int8x8_t r;for(size_t j=0;j<8;j++)r.v[j]=x;return r;}
static inline int32x4_t vdupq_n_s32(int32_t x){int32x4_t r;for(size_t j=0;j<4;j++)r.v[j]=x;return r;}
static inline float32x4_t vdupq_n_f32(float x){float32x4_t r;for(size_t j=0;j<4;j++)r.v[j]=x;return r;}
static inline int8x8_t vld1_s8(const int8_t*p){int8x8_t r;for(size_t j=0;j<8;j++)r.v[j]=p[j];return r;}
static inline int16x8_t vsubl_s8(int8x8_t a,int8x8_t b){int16x8_t r;for(size_t j=0;j<8;j++)r.v[j]=(int16_t)((int)a.v[j]-(int)b.v[j]);return r;}
static inline int16x4_t vget_low_s16(int16x8_t a){int16x4_t r;for(size_t j=0;j<4;j++)r.v[j]=a.v[j+0];return r;}
static inline int16x4_t vget_high_s16(int16x8_t a){int16x4_t r;for(size_t j=0;j<4;j++)r.v[j]=a.v[j+4];return r;}
static inline int32x4_t vmull_s16(int16x4_t a,int16x4_t b){int32x4_t r;for(size_t j=0;j<4;j++)r.v[j]=(int32_t)a.v[j]*(int32_t)b.v[j];return r;}
static inline float32x4_t vcvtq_f32_s32(int32x4_t a){float32x4_t r;for(size_t j=0;j<4;j++)r.v[j]=(float)a.v[j];return r;}
static inline float32x4_t vmulq_f32(float32x4_t a,float32x4_t b){float32x4_t r;for(size_t j=0;j<4;j++)r.v[j]=qm_arm_mul(a.v[j],b.v[j]);return r;}
static inline float32x4_t vaddq_f32(float32x4_t a,float32x4_t b){float32x4_t r;for(size_t j=0;j<4;j++)r.v[j]=qm_arm_add(a.v[j],b.v[j]);return r;}
static inline int32x4_t vreinterpretq_s32_f32(float32x4_t a){int32x4_t r;for(size_t j=0;j<4;j++)r.v[j]=qm_i32(qm_bits(a.v[j]));return r;}
static inline int32x4_t vqsubq_s32(int32x4_t a,int32x4_t b){int32x4_t r;for(size_t j=0;j<4;j++)r.v[j]=qm_sat32((int64_t)a.v[j]-b.v[j]);return r;}
static inline int16x4_t vqmovn_s32(int32x4_t a){int16x4_t r;for(size_t j=0;j<4;j++)r.v[j]=qm_sat16(a.v[j]);return r;}
static inline int16x8_t vqmovn_high_s32(int16x4_t a,int32x4_t b){int16x8_t r;for(size_t j=0;j<8;j++)r.v[j]=j<4?a.v[j]:qm_sat16(b.v[j-4]);return r;}
static inline int16x8_t vcombine_s16(int16x4_t a,int16x4_t b){int16x8_t r;for(size_t j=0;j<8;j++)r.v[j]=j<4?a.v[j]:b.v[j-4];return r;}
static inline int8x8_t vqmovn_s16(int16x8_t a){int8x8_t r;for(size_t j=0;j<8;j++)r.v[j]=qm_sat8(a.v[j]);return r;}
static inline int8x8_t vmax_s8(int8x8_t a,int8x8_t b){int8x8_t r;for(size_t j=0;j<8;j++)r.v[j]=a.v[j]>b.v[j]?a.v[j]:b.v[j];return r;}
static inline int8x8_t vmin_s8(int8x8_t a,int8x8_t b){int8x8_t r;for(size_t j=0;j<8;j++)r.v[j]=a.v[j]<b.v[j]?a.v[j]:b.v[j];return r;}
static inline void vst1_s8(int8_t*p,int8x8_t a){memcpy(p,a.v,8);}
static inline void vst1_lane_s8(int8_t*p,int8x8_t a,int lane){p[0]=a.v[lane];}
static inline uint32x2_t vreinterpret_u32_s8(int8x8_t a){uint32x2_t r;for(size_t j=0;j<2;j++){r.v[j]=0;for(size_t k=0;k<4;k++)r.v[j]|=(uint32_t)(uint8_t)a.v[j*4+k]<<(8*k);}return r;}
static inline void vst1_lane_u32(void*p,uint32x2_t a,int lane){uint8_t*q=p;for(size_t k=0;k<4;k++)q[k]=(uint8_t)(a.v[lane]>>(8*k));}
static inline uint16x4_t vreinterpret_u16_s8(int8x8_t a){uint16x4_t r;for(size_t j=0;j<4;j++){r.v[j]=0;for(size_t k=0;k<2;k++)r.v[j]|=(uint16_t)(uint8_t)a.v[j*2+k]<<(8*k);}return r;}
static inline void vst1_lane_u16(void*p,uint16x4_t a,int lane){uint8_t*q=p;for(size_t k=0;k<2;k++)q[k]=(uint8_t)(a.v[lane]>>(8*k));}
static inline int8x8_t vext_s8(int8x8_t a,int8x8_t b,int shift){int8x8_t r;for(size_t j=0;j<8;j++)r.v[j]=j+(size_t)shift<8?a.v[j+shift]:b.v[j+shift-8];return r;}
static inline size_t __riscv_vsetvl_e8m2(size_t n){return n<32?n:32;}
static inline vint8m2_t __riscv_vle8_v_i8m2(const int8_t*p,size_t vl){vint8m2_t r;for(size_t j=0;j<32;j++)r.v[j]=j<vl?(p[j]):0;return r;}
static inline vint16m4_t __riscv_vsext_vf2_i16m4(vint8m2_t a,size_t vl){vint16m4_t r;for(size_t j=0;j<32;j++)r.v[j]=j<vl?(a.v[j]):0;return r;}
static inline vint16m4_t __riscv_vsub_vx_i16m4(vint16m4_t a,int16_t b,size_t vl){vint16m4_t r;for(size_t j=0;j<32;j++)r.v[j]=j<vl?((int16_t)(a.v[j]-b)):0;return r;}
static inline vint32m8_t __riscv_vwmul_vv_i32m8(vint16m4_t a,vint16m4_t b,size_t vl){vint32m8_t r;for(size_t j=0;j<32;j++)r.v[j]=j<vl?((int32_t)a.v[j]*(int32_t)b.v[j]):0;return r;}
static inline vfloat32m8_t __riscv_vfcvt_f_x_v_f32m8(vint32m8_t a,size_t vl){vfloat32m8_t r;for(size_t j=0;j<32;j++)r.v[j]=j<vl?((float)a.v[j]):0;return r;}
static inline vfloat32m8_t __riscv_vfmul_vf_f32m8(vfloat32m8_t a,float b,size_t vl){vfloat32m8_t r;for(size_t j=0;j<32;j++)r.v[j]=j<vl?(qm_rvv_mul(a.v[j],b)):0;return r;}
static inline vfloat32m8_t __riscv_vfadd_vf_f32m8(vfloat32m8_t a,float b,size_t vl){vfloat32m8_t r;for(size_t j=0;j<32;j++)r.v[j]=j<vl?(qm_rvv_add(a.v[j],b)):0;return r;}
static inline vfloat32m8_t __riscv_vfsgnj_vf_f32m8(vfloat32m8_t a,float b,size_t vl){vfloat32m8_t r;for(size_t j=0;j<32;j++)r.v[j]=j<vl?(qm_float((qm_bits(a.v[j])&0x7fffffffU)|(qm_bits(b)&0x80000000U))):0;return r;}
static inline vint32m8_t __riscv_vfcvt_x_f_v_i32m8(vfloat32m8_t a,size_t vl){vint32m8_t r;for(size_t j=0;j<32;j++)r.v[j]=j<vl?(qm_rvv_cvt(a.v[j])):0;return r;}
static inline vint32m8_t __riscv_vadd_vx_i32m8(vint32m8_t a,int32_t b,size_t vl){vint32m8_t r;for(size_t j=0;j<32;j++)r.v[j]=j<vl?(qm_i32((uint32_t)a.v[j]+(uint32_t)b)):0;return r;}
static inline vint32m8_t __riscv_vssub_vx_i32m8(vint32m8_t a,int32_t b,size_t vl){vint32m8_t r;for(size_t j=0;j<32;j++)r.v[j]=j<vl?(qm_sat32((int64_t)a.v[j]-b)):0;return r;}
static inline vint16m4_t __riscv_vnclip_wx_i16m4(vint32m8_t a,unsigned shift,int vxrm,size_t vl){vint16m4_t r;for(size_t j=0;j<32;j++)r.v[j]=j<vl?(qm_sat16(a.v[j])):0;return r;}
static inline vint8m2_t __riscv_vnclip_wx_i8m2(vint16m4_t a,unsigned shift,int vxrm,size_t vl){vint8m2_t r;for(size_t j=0;j<32;j++)r.v[j]=j<vl?(qm_sat8(a.v[j])):0;return r;}
static inline vint8m2_t __riscv_vmax_vx_i8m2(vint8m2_t a,int8_t b,size_t vl){vint8m2_t r;for(size_t j=0;j<32;j++)r.v[j]=j<vl?(a.v[j]>b?a.v[j]:b):0;return r;}
static inline vint8m2_t __riscv_vmin_vx_i8m2(vint8m2_t a,int8_t b,size_t vl){vint8m2_t r;for(size_t j=0;j<32;j++)r.v[j]=j<vl?(a.v[j]<b?a.v[j]:b):0;return r;}
static inline vint32m8_t __riscv_vreinterpret_v_f32m8_i32m8(vfloat32m8_t a){vint32m8_t r;for(size_t j=0;j<32;j++)r.v[j]=qm_i32(qm_bits(a.v[j]));return r;}
static inline void __riscv_vse8_v_i8m2(int8_t*p,vint8m2_t a,size_t vl){for(size_t j=0;j<vl;j++)p[j]=a.v[j];}

/* Exact bit moves used by the actual ordinary NaN-classification adapter.
   SEW32 < XLEN64: vmv.x.s sign extends; signed int32 C result is lane0. */
static inline vfloat32m8_t __riscv_vfmv_v_f_f32m8(float x,size_t vl){vfloat32m8_t r;for(size_t i=0;i<32;i++)r.v[i]=i<vl?x:0.0f;return r;}
static inline int32_t __riscv_vmv_x_s_i32m8_i32(vint32m8_t a){return a.v[0];}
/* Compile the very same ordinary C helper; the native vector types above
   replace only the declared intrinsic interfaces, not its C control logic. */
#define QS8MUL_SCALAR_NAN_H
#include "../../shim/qm_scale_is_nan.c"
#endif
