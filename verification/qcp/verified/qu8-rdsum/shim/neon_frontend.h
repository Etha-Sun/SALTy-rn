#ifndef RDSUM_UNSIGNED_NEON_FRONTEND_H
#define RDSUM_UNSIGNED_NEON_FRONTEND_H
#include "frontend_common.h"
#include "rvv_loop_model.h"
#define vget_low_u8(a) RD_LOW8,(a)
#define RD_W8_PICK(_1,_2,_3,NAME,...) NAME
#define RD_W8_DIRECT(a,b) vaddw_u8((a),(b))
#define RD_W8_LOW16(a,tag,b) rdsum_wadd8_low16((a),(b))
#define RD_W8_EXPAND(...) RD_W8_PICK(__VA_ARGS__,RD_W8_LOW16,RD_W8_DIRECT)(__VA_ARGS__)
#define vaddw_u8(a,b) RD_W8_EXPAND((a),b)
#define vget_low_u16(a) low,(a)
#define vget_high_u16(a) high,(a)
#define RD_WADD16_DISPATCH2(a,which,b) rdsum_wadd16_##which(a,b)
#define RD_WADD16_DISPATCH(a,which,b) RD_WADD16_DISPATCH2(a,which,b)
#define RD_WADD16_EXPAND(a,...) RD_WADD16_DISPATCH(a,__VA_ARGS__)
#define vaddw_u16(a,b) RD_WADD16_EXPAND((a),b)
#define vget_low_u32(a) (a)
#define vadd_u32(a,b) rdsum_addlow2((a),(b))
#define vextq_u32(a,b,n) rdsum_selfext2(a)
#define vgetq_lane_u32(a,n) rdsum_lane0(a)
/* Source-guarded single-evaluation read-only vector borrow. */
#define vst1_u32(p,a) vst1_u32((p),&(a))
#define vst1q_u32(p,a) vst1q_u32((p),&(a))
#endif
