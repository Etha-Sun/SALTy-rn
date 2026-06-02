// Synthetic prelude force-included during libclang signature parsing only.
// The pip `libclang` ships no resource-dir headers on the default search path,
// so <stddef.h>/<stdint.h> don't resolve; we provide the std typedefs directly
// and neutralize XNNPACK's signature-level attribute macros (e.g. XNN_OOB_READS,
// which otherwise makes the function declaration unparseable). Never compiled
// into a harness — parse-time only.
#ifndef SALT_V2_PARSE_PRELUDE_H
#define SALT_V2_PARSE_PRELUDE_H

typedef unsigned long  size_t;
typedef unsigned long  uintptr_t;
typedef long           intptr_t;
typedef signed char    int8_t;
typedef short          int16_t;
typedef int            int32_t;
typedef long           int64_t;
typedef unsigned char  uint8_t;
typedef unsigned short uint16_t;
typedef unsigned int   uint32_t;
typedef unsigned long  uint64_t;

#define XNN_OOB_READS
#define XNN_UNLIKELY(x) (x)
#define XNN_LIKELY(x)   (x)
#define XNN_INLINE      inline
#define XNN_RESTRICT
#define XNN_DISABLE_TSAN
#define XNN_DISABLE_MSAN
#define XNN_DISABLE_HWASAN

#endif
