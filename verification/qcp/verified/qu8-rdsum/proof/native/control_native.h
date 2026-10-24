#ifndef RDSUM_CONTROL_NATIVE_H
#define RDSUM_CONTROL_NATIVE_H
#include "shim.h"
static inline int rdsum_min252(size_t r){if(r<252)return(int)r;return 252;}
static inline size_t rdsum_ceil252(size_t r){size_t q=r/252;if(r%252!=0)q=q+1;return q;}
#endif
