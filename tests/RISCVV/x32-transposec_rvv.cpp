#include "../../src/riscv_symbolic/riscv_symbolic.hpp"
#include "../../src/xnn_minimal.h"
#include <assert.h>
#include <stddef.h>
#include <stdint.h>
#include <algorithm>

using std::min;

extern "C" {
/**
 * RVV implementation of 4x4 transpose microkernel
 * Semantically equivalent to xnn_x32_transposec_ukernel__4x4_multi_dec_zip_neon
 * 
 * Target: Saturn core with RVV 1.0, VLEN=256, ELEN=64
 */
void xnn_x32_transposec_ukernel__4x4_rvv(
    const uint32_t* input,
    uint32_t* output,
    size_t input_stride,
    size_t output_stride,
    size_t block_width,
    size_t block_height) XNN_OOB_READS
{
    assert(block_width == 1 || output_stride >= block_height * sizeof(uint32_t));
    assert(block_height == 1 || input_stride >= block_width * sizeof(uint32_t));

    const size_t tile_height = 4;
    const size_t tile_width = 4;
    const size_t tile_hbytes = tile_height * sizeof(uint32_t);
    const size_t tile_wbytes = tile_width * sizeof(uint32_t);
    const size_t input_reset = tile_wbytes - round_down_po2(block_height, tile_height) * input_stride;
    const size_t input_offset = tile_height * input_stride;
    const size_t output_reset = tile_width * output_stride - round_down_po2(block_height, 2) * sizeof(uint32_t) - tile_hbytes;

    const uint32_t* i0 = input;
    const uint32_t* i1 = (const uint32_t*) ((uintptr_t) i0 + input_stride);
    const uint32_t* i2 = (const uint32_t*) ((uintptr_t) i1 + input_stride);
    const uint32_t* i3 = (const uint32_t*) ((uintptr_t) i2 + input_stride);
    uint32_t* o = (uint32_t*) ((uintptr_t) output - tile_hbytes);
    const size_t minus_output_stride = -output_stride;

    // Set vector length to 4 for 4-element operations (matching NEON's uint32x4_t)
    size_t vl = __riscv_vsetvl_e32m1(4);

    do {
        const size_t rem = min(block_width - 1, (size_t)3);
        const size_t oN_stride = rem * output_stride;
        const size_t oN_offset = oN_stride + tile_hbytes;
        size_t bh = block_height;
        
        for (; bh >= 4; bh -= 4) {
            // Load 4 rows of 4 elements each
            // row0: [a0, a1, a2, a3]
            // row1: [b0, b1, b2, b3]
            // row2: [c0, c1, c2, c3]
            // row3: [d0, d1, d2, d3]
            vuint32m1_t row0 = __riscv_vle32_v_u32m1(i0, vl); i0 = (uint32_t*) ((uintptr_t) i0 + input_offset);
            vuint32m1_t row1 = __riscv_vle32_v_u32m1(i1, vl); i1 = (uint32_t*) ((uintptr_t) i1 + input_offset);
            vuint32m1_t row2 = __riscv_vle32_v_u32m1(i2, vl); i2 = (uint32_t*) ((uintptr_t) i2 + input_offset);
            vuint32m1_t row3 = __riscv_vle32_v_u32m1(i3, vl); i3 = (uint32_t*) ((uintptr_t) i3 + input_offset);

            // Transpose 4x4 matrix
            // Output columns (which become output rows):
            // col0: [a0, b0, c0, d0]
            // col1: [a1, b1, c1, d1]
            // col2: [a2, b2, c2, d2]
            // col3: [a3, b3, c3, d3]
            
            // Build transposed vectors by extracting elements from each row
            std::vector<Term> col0_elems = {
                row0.getElement(0), row1.getElement(0), row2.getElement(0), row3.getElement(0)
            };
            std::vector<Term> col1_elems = {
                row0.getElement(1), row1.getElement(1), row2.getElement(1), row3.getElement(1)
            };
            std::vector<Term> col2_elems = {
                row0.getElement(2), row1.getElement(2), row2.getElement(2), row3.getElement(2)
            };
            std::vector<Term> col3_elems = {
                row0.getElement(3), row1.getElement(3), row2.getElement(3), row3.getElement(3)
            };
            
            vuint32m1_t col0(g_symbolic_tm, col0_elems);
            vuint32m1_t col1(g_symbolic_tm, col1_elems);
            vuint32m1_t col2(g_symbolic_tm, col2_elems);
            vuint32m1_t col3(g_symbolic_tm, col3_elems);

            // Store transposed columns (matching NEON's store pattern)
            // NEON stores: v0_1.val[1], v0_1.val[0], v0_0.val[1], v0_0.val[0]
            // Which corresponds to: col3, col2, col1, col0
            o = (uint32_t*) ((uintptr_t) o + oN_offset);
            __riscv_vse32_v_u32m1(o, col3, vl);
            if XNN_UNPREDICTABLE(block_width > 3) {
                o = (uint32_t*) ((uintptr_t) o + minus_output_stride);
            }
            __riscv_vse32_v_u32m1(o, col2, vl);
            if XNN_UNPREDICTABLE(block_width >= 3) {
                o = (uint32_t*) ((uintptr_t) o + minus_output_stride);
            }
            __riscv_vse32_v_u32m1(o, col1, vl);
            if XNN_UNPREDICTABLE(block_width > 1) {
                o = (uint32_t*) ((uintptr_t) o + minus_output_stride);
            }
            __riscv_vse32_v_u32m1(o, col0, vl);
        }
        o = (uint32_t*) ((uintptr_t) o + tile_hbytes);

        // Handle remaining rows (bh < 4)
        if (bh != 0) {
            // Load available rows, substitute missing rows with row 0 or zeros
            vuint32m1_t row0 = __riscv_vle32_v_u32m1(i0, vl);
            if XNN_UNPREDICTABLE(bh < 2) {
                i1 = i0;
            }
            vuint32m1_t row1 = __riscv_vle32_v_u32m1(i1, vl);
            if XNN_UNPREDICTABLE(bh <= 2) {
                i2 = i0;
            }
            vuint32m1_t row2 = __riscv_vle32_v_u32m1(i2, vl);
            
            // row3 is zeros for partial blocks (matching NEON's vmovq_n_u32(0))
            vuint32m1_t row3 = __riscv_vmv_v_x_u32m1(0, vl);

            // Build transposed columns
            std::vector<Term> col0_elems = {
                row0.getElement(0), row1.getElement(0), row2.getElement(0), row3.getElement(0)
            };
            std::vector<Term> col1_elems = {
                row0.getElement(1), row1.getElement(1), row2.getElement(1), row3.getElement(1)
            };
            std::vector<Term> col2_elems = {
                row0.getElement(2), row1.getElement(2), row2.getElement(2), row3.getElement(2)
            };
            std::vector<Term> col3_elems = {
                row0.getElement(3), row1.getElement(3), row2.getElement(3), row3.getElement(3)
            };

            vuint32m1_t col0(g_symbolic_tm, col0_elems);
            vuint32m1_t col1(g_symbolic_tm, col1_elems);
            vuint32m1_t col2(g_symbolic_tm, col2_elems);
            vuint32m1_t col3(g_symbolic_tm, col3_elems);

            // For partial rows, we need to store only the valid elements
            // Using vl=2 for the lower half (bh & 2) and vl=1 for single element (bh & 1)
            
            if (bh & 2) {
                // Store 2 elements from each column
                size_t vl2 = __riscv_vsetvl_e32m1(2);
                o = (uint32_t*) ((uintptr_t) o + oN_stride);
                __riscv_vse32_v_u32m1(o, col3, vl2);
                if XNN_UNPREDICTABLE(block_width > 3) {
                    o = (uint32_t*) ((uintptr_t) o + minus_output_stride);
                }
                __riscv_vse32_v_u32m1(o, col2, vl2);
                if XNN_UNPREDICTABLE(block_width >= 3) {
                    o = (uint32_t*) ((uintptr_t) o + minus_output_stride);
                }
                __riscv_vse32_v_u32m1(o, col1, vl2);
                if XNN_UNPREDICTABLE(block_width > 1) {
                    o = (uint32_t*) ((uintptr_t) o + minus_output_stride);
                }
                __riscv_vse32_v_u32m1(o, col0, vl2); 
                o += 2;
                
                // Shift to high half for potential single element store
                std::vector<Term> col0_high = {col0.getElement(2), col0.getElement(3)};
                std::vector<Term> col1_high = {col1.getElement(2), col1.getElement(3)};
                std::vector<Term> col2_high = {col2.getElement(2), col2.getElement(3)};
                std::vector<Term> col3_high = {col3.getElement(2), col3.getElement(3)};
                col0 = vuint32m1_t(g_symbolic_tm, col0_high);
                col1 = vuint32m1_t(g_symbolic_tm, col1_high);
                col2 = vuint32m1_t(g_symbolic_tm, col2_high);
                col3 = vuint32m1_t(g_symbolic_tm, col3_high);
            }

            if (bh & 1) {
                // Store single element from each column
                size_t vl1 = __riscv_vsetvl_e32m1(1);
                o = (uint32_t*) ((uintptr_t) o + oN_stride);
                __riscv_vse32_v_u32m1(o, col3, vl1);
                if XNN_UNPREDICTABLE(block_width > 3) {
                    o = (uint32_t*) ((uintptr_t) o + minus_output_stride);
                }
                __riscv_vse32_v_u32m1(o, col2, vl1);
                if XNN_UNPREDICTABLE(block_width >= 3) {
                    o = (uint32_t*) ((uintptr_t) o + minus_output_stride);
                }
                __riscv_vse32_v_u32m1(o, col1, vl1);
                if XNN_UNPREDICTABLE(block_width > 1) {
                    o = (uint32_t*) ((uintptr_t) o + minus_output_stride);
                }
                __riscv_vse32_v_u32m1(o, col0, vl1);
            }
        }

        i0 = (const uint32_t*) ((uintptr_t) i0 + input_reset);
        i1 = (const uint32_t*) ((uintptr_t) i0 + input_stride);
        i2 = (const uint32_t*) ((uintptr_t) i1 + input_stride);
        i3 = (const uint32_t*) ((uintptr_t) i2 + input_stride);
        o = (uint32_t*) ((uintptr_t) o + output_reset);
        block_width = doz(block_width, tile_width);
    } while (block_width != 0);
}
}
