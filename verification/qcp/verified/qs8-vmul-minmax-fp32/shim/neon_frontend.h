#include "vector_values.h"
#include "adapters.h"
#include "store.h"
#include "program_model.h"
#include "control.h"
#define vst1_s8(p,a) qm_store8((p),&(a))
#define vst1_lane_s8(p,a,l) qm_store1(&(a),(p),(l))
#define vst1_lane_u32(p,v,l) QM_STORE32_##v p),l)
#define QM_STORE32_vreinterpret_u32_s8(a) qm_store4(&(a),(int8_t*)(
#define vst1_lane_u16(p,v,l) QM_STORE16_##v p),l)
#define QM_STORE16_vreinterpret_u16_s8(a) qm_store2(&(a),(int8_t*)(
#define vext_s8(a,b,k) qm_ext_self(&(a),(k))
#define vmull_s16(a,b) QM_MULL_##a QM_MULL_END_##b
#define QM_MULL_vget_low_s16(a) qm_mull_low(a,
#define QM_MULL_vget_high_s16(a) qm_mull_high(a,
#define QM_MULL_END_vget_low_s16(b) b)
#define QM_MULL_END_vget_high_s16(b) b)
#define vreinterpretq_s32_f32(x) QM_ADD_REINTERPRET_##x
#define QM_ADD_REINTERPRET_vaddq_f32(a,b) qm_add_reinterpret(a,b)
#define vqmovn_high_s32(x,y) QM_NARROW_##x y)
#define QM_NARROW_vqmovn_s32(a) qm_narrow_pair(a,

/*@ include strategies "byte_store.strategies" */
