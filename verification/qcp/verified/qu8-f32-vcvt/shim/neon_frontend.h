#include "memory_i8.h"
#include "memory_float.h"
#include "vector_primitives.h"
#include "neon_arithmetic.h"
#include "program_model.h"
#define QCP_VADD_TYPES_H
#include "../../../shared/c-shim/f32/QcpNeonLoop/invariant_def.h"
#include "../../../shared/c-shim/f32/QcpVadd/float_array_def.h"
#include "../../../shared/c-shim/f32/QcpNeonLoop/tail_def.h"
/*@ include strategies "neon_bridge.strategies" */
/*@ include strategies "neon_tail.strategies" */
/*@ include strategies "float_array.strategies" */

#include "neon_composed.h"
/* Exact nested composition; one argument evaluation, original inner and outer bodies remain in closure. */
#define QCP_CVT_MOVL_vget_low_s16(a) qcp_cvt_movlow(a)
#define QCP_CVT_MOVL_vget_high_s16(a) qcp_cvt_movhigh(a)
#define vmovl_s16(x) QCP_CVT_MOVL_##x

#include "neon_unsigned.h"
#define QCP_QU8_UNWRAP_vreinterpretq_u16_s16(a) a
#define QCP_QU8_S16_vaddw_u8(a,b) qcp_cvt_widen_u8(QCP_QU8_UNWRAP_##a,b)
#define vreinterpretq_s16_u16(x) QCP_QU8_S16_##x
