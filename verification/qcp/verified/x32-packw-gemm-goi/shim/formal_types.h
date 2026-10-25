#ifndef X32_PACKW_FORMAL_TYPES_H
#define X32_PACKW_FORMAL_TYPES_H
#ifndef QCP_NATIVE
#include "scalar_memory.h"
/*@ Import Coq Require Import X32Packw.Types */
typedef struct uint32x2_t {uint32_t s0; uint32_t s1;} uint32x2_t;
typedef struct vuint32m1_t {uint32_t s0; uint32_t s1; uint32_t s2; uint32_t s3;} vuint32m1_t;
typedef struct vuint32m4_t {uint32_t s0; uint32_t s1; uint32_t s2; uint32_t s3; uint32_t s4; uint32_t s5; uint32_t s6; uint32_t s7; uint32_t s8; uint32_t s9; uint32_t s10; uint32_t s11; uint32_t s12; uint32_t s13; uint32_t s14; uint32_t s15;} vuint32m4_t;
#endif
#endif
