#include "../../src/riscv_symbolic/riscv_symbolic.hpp"
#include "../../src/xnn_minimal.h"
#include <assert.h>


extern "C" {

    // Target: Saturn Core (VLEN=256)
    // Optimization: Strip-mining loop utilizing full register file (LMUL=8 for 32-bit ops)
    
    void xnn_qs8_vaddc_minmax_ukernel__rvv_u1v(
        size_t batch,
        const int8_t* input_a,
        const int8_t* input_b,
        int8_t* output,
        const struct xnn_qs8_add_minmax_params* params)
    {
        assert(batch != 0);
        assert(batch % sizeof(int8_t) == 0);
        assert(input_a != NULL);
        assert(input_b != NULL);
        assert(output != NULL);
    
        // --- 1. Scalar Pre-computation ---
    
        // Bias calculation matching Neon: (InputB - B_ZP) * B_Mult
        const int32_t b_val = (int32_t)*input_b - (int32_t)params->scalar.b_zero_point;
        int32_t scalar_bias = b_val * params->scalar.b_multiplier;
    
        // SCALAR OPTIMIZATION: Handle Rounding
        // Neon `vrshl` rounds to nearest. RVV `vsra` truncates.
        // We emulate rounding by adding (1 << (shift - 1)) to the accumulator.
        // We can add this to the bias once, effectively "pre-rounding" the bias.
        const uint32_t shift = (uint32_t)params->scalar.shift;
        if (shift > 0) {
            scalar_bias += (1 << (shift - 1));
        }
    
        const int8_t a_zp = params->scalar.a_zero_point;
        const int32_t a_mult = params->scalar.a_multiplier;
        const int16_t out_zp = params->scalar.output_zero_point;
        const int8_t out_min = params->scalar.output_min;
        const int8_t out_max = params->scalar.output_max;
    
        // --- 2. Main Loop ---
        
        // We target LMUL=8 for the widest type (int32), giving vl_max=64 on VLEN=256.
        size_t vl;
        
        for (; batch > 0; batch -= vl, input_a += vl, output += vl) {
            // Set VL based on int8 elements, requesting LMUL=2.
            // This ensures that when we widen to int32 (4x wider), we utilize LMUL=8.
            vl = __riscv_vsetvl_e8m2(batch);
    
            // Load Input A (int8)
            vint8m2_t va = __riscv_vle8_v_i8m2(input_a, vl);
    
            // Step 1: Widen Subtract (int8 -> int16)
            // va - a_zero_point
            vint16m4_t va_16 = __riscv_vwsub_vx_i16m4(va, a_zp, vl);
    
            // Step 2: Widen Extend (int16 -> int32)
            // Use sext.vf2 to widen m4 register group to m8 register group
            vint32m8_t va_32 = __riscv_vsext_vf2_i32m8(va_16, vl);
    
            // Step 3: Multiply Accumulate
            // acc = bias + (va_32 * a_multiplier)
            // The bias here includes the "rounding offset" calculated in scalar preamble.
            vint32m8_t vacc = __riscv_vmv_v_x_i32m8(scalar_bias, vl);
            vacc = __riscv_vmacc_vx_i32m8(vacc, a_mult, va_32, vl);
    
            // Step 4: Arithmetic Shift Right (Rounding handled by scalar bias adjustment)
            // Neon: vrshlq (-shift) [Rounding]
            // RVV: vsra (shift) [Truncating, but inputs pre-adjusted]
            vacc = __riscv_vsra_vx_i32m8(vacc, shift, vl);
    
            // Step 5: Narrow to int16 with Saturation
            // Neon: vqmovn_s32 -> Saturates int32 to int16
            // RVV: vnclip.wi -> Narrows and saturates (shift 0 = purely saturate)
            vint16m4_t vout_16 = __riscv_vnclip_wi_i16m4(vacc, 0, vl);
    
            // Step 6: Add Output Zero Point (Saturating)
            // Neon: vqaddq_s16 -> Saturating Add
            // RVV: vsadd.vx -> Saturating Add
            vout_16 = __riscv_vsadd_vx_i16m4(vout_16, out_zp, vl);
    
            // Step 7: Narrow to int8 with Saturation
            // Neon: vqmovn_s16 -> Saturates int16 to int8
            vint8m2_t vout_8 = __riscv_vnclip_wi_i8m2(vout_16, 0, vl);
    
            // Step 8: Clamp (Min/Max)
            vout_8 = __riscv_vmax_vx_i8m2(vout_8, out_min, vl);
            vout_8 = __riscv_vmin_vx_i8m2(vout_8, out_max, vl);
    
            // Store
            __riscv_vse8_v_i8m2(output, vout_8, vl);
        }
    }
    
    } // extern "C"