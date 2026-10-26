#ifndef EXP_MINUS_MAX_TYPES_H
#define EXP_MINUS_MAX_TYPES_H
typedef unsigned long long size_t;
typedef unsigned long long uintptr_t;
typedef unsigned int uint32_t;
typedef int int32_t;
#define NULL ((void*)0)
#define XNN_OOB_READS
#define XNN_ARCH_ARM64 1
typedef struct float32x4_t{float s0;float s1;float s2;float s3;}float32x4_t;
typedef struct float32x2_t{float s0;float s1;}float32x2_t;
typedef struct uint32x4_t{uint32_t s0;uint32_t s1;uint32_t s2;uint32_t s3;}uint32x4_t;
typedef struct uint32x2_t{uint32_t s0;uint32_t s1;}uint32x2_t;
typedef struct int32x4_t{int32_t s0;int32_t s1;int32_t s2;int32_t s3;}int32x4_t;
typedef struct vfloat32m4_t{float s0;float s1;float s2;float s3;float s4;float s5;float s6;float s7;float s8;float s9;float s10;float s11;float s12;float s13;float s14;float s15;}vfloat32m4_t;
typedef struct vint32m4_t{int32_t s0;int32_t s1;int32_t s2;int32_t s3;int32_t s4;int32_t s5;int32_t s6;int32_t s7;int32_t s8;int32_t s9;int32_t s10;int32_t s11;int32_t s12;int32_t s13;int32_t s14;int32_t s15;}vint32m4_t;
typedef struct vbool8_t{uint32_t s0;uint32_t s1;uint32_t s2;uint32_t s3;uint32_t s4;uint32_t s5;uint32_t s6;uint32_t s7;uint32_t s8;uint32_t s9;uint32_t s10;uint32_t s11;uint32_t s12;uint32_t s13;uint32_t s14;uint32_t s15;}vbool8_t;
#endif
