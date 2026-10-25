#ifndef X32_TRANSPOSE_FORMAL_TYPES_H
#define X32_TRANSPOSE_FORMAL_TYPES_H
#ifdef QCP_NATIVE
#include <stddef.h>
#include <stdint.h>
#else
typedef unsigned long long size_t;
typedef unsigned long long uintptr_t;
typedef unsigned int uint32_t;
typedef long long int64_t;
/*@ Import Coq Require Import X32Transpose.VectorModel */
typedef struct uint32x2_t { uint32_t s0; uint32_t s1; } uint32x2_t;
typedef struct uint32x2x2_t { uint32x2_t val[2]; } uint32x2x2_t;
typedef struct vuint32m8_t {uint32_t s0; uint32_t s1; uint32_t s2; uint32_t s3; uint32_t s4; uint32_t s5; uint32_t s6; uint32_t s7; uint32_t s8; uint32_t s9; uint32_t s10; uint32_t s11; uint32_t s12; uint32_t s13; uint32_t s14; uint32_t s15; uint32_t s16; uint32_t s17; uint32_t s18; uint32_t s19; uint32_t s20; uint32_t s21; uint32_t s22; uint32_t s23; uint32_t s24; uint32_t s25; uint32_t s26; uint32_t s27; uint32_t s28; uint32_t s29; uint32_t s30; uint32_t s31; } vuint32m8_t;
#endif /* QCP_NATIVE */
#endif
