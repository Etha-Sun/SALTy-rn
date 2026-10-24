#ifndef RDSUM_NEON_FRONTEND_H
#define RDSUM_NEON_FRONTEND_H
#include "frontend_common.h"
#include "rvv_loop_model.h"
/* Source guard admits these half tags only as the second operand to vaddw_s16. */
#define vget_low_s16(a) low,(a)
#define vget_high_s16(a) high,(a)
#define RD_WADD16_DISPATCH2(a,which,b) rdsum_wadd16_##which(a,b)
#define RD_WADD16_DISPATCH(a,which,b) RD_WADD16_DISPATCH2(a,which,b)
#define RD_WADD16_EXPAND(a,...) RD_WADD16_DISPATCH(a,__VA_ARGS__)
#define vaddw_s16(a,b) RD_WADD16_EXPAND((a),b)
/* Only guarded low2 add, self EXT2 and lane0 call shapes occur in this case. */
#define vget_low_s32(a) (a)
#define vadd_s32(a,b) rdsum_addlow2((a),(b))
#define vextq_s32(a,b,n) rdsum_selfext2(a)
#define vgetq_lane_s32(a,n) rdsum_lane0(a)
/* Read-only vector borrow; source guard requires a side-effect-free vector lvalue. */
#define vst1_s32(p,a) vst1_s32((p),&(a))
#define vst1q_s32(p,a) vst1q_s32((p),&(a))
#endif
