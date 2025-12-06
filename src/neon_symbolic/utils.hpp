#ifndef NEON_SYMBOLIC_HELPERS_HPP
#define NEON_SYMBOLIC_HELPERS_HPP

#include "../symbolic_common.hpp"
#include "types.hpp"
#include "memory.hpp"
#include <vector>
#include <string>
#include <algorithm>


namespace SymbolicNEONHelpers {
    
    inline const std::vector<int32x4_t>* getStoredResults(const int32_t* ptr) {
        uintptr_t addr = reinterpret_cast<uintptr_t>(ptr);
        auto it = g_neon_memory.find(addr);
        if (it != g_neon_memory.end()) {
            return &(it->second);
        }
        return nullptr;
    }

    inline void clearMemory() {
        g_neon_memory.clear();
        g_neon_memory_i8x16.clear();
        g_neon_memory_i8x8.clear();
        g_neon_memory_u8x16.clear();
        g_neon_memory_u8x8.clear();
        g_neon_memory_u16x8.clear();
        g_neon_memory_u16x4.clear();
        g_neon_memory_f32x4.clear();
        g_neon_memory_f32x2.clear();
        g_neon_memory_u32x4.clear();
        g_neon_memory_u32x2.clear();
        g_neon_scalar_memory.clear();
    }

    /**
     * Generic memory population for NEON symbolic execution.
     * 
     * @tparam ElementType The C++ type of the elements (int8_t, uint8_t, int16_t, uint16_t, int32_t, uint32_t)
     * @param ptr Pointer to the memory location to populate
     * @param symbolic_values Vector of symbolic terms to populate
     * @param element_bits Size of each element in bits (8, 16, or 32)
     * @param is_signed Whether the elements are signed (true) or unsigned (false)
     * 
     * Supported combinations:
     *   - 8-bit signed (int8_t): populates g_neon_memory_i8x16
     *   - 8-bit unsigned (uint8_t): populates g_neon_memory_u8x16
     *   - 32-bit signed (int32_t): populates g_neon_memory
     */
    template<typename ElementType>
    inline void populateMemory(const ElementType* ptr,
                               const std::vector<Term>& symbolic_values,
                               size_t element_bits,
                               bool is_signed) {
        uintptr_t addr = reinterpret_cast<uintptr_t>(ptr);

        if (element_bits == 8) {
            // 8-bit elements: 16 elements per 128-bit vector
            const size_t lanes_per_vec = 16;
            for (size_t i = 0; i < symbolic_values.size(); i += lanes_per_vec) {
                std::array<Term, 16> lanes;
                for (size_t j = 0; j < lanes_per_vec && (i + j) < symbolic_values.size(); j++) {
                    lanes[j] = symbolic_values[i + j];
                }
                // Pad remaining lanes with last valid element
                size_t valid_count = std::min(lanes_per_vec, symbolic_values.size() - i);
                for (size_t j = valid_count; j < lanes_per_vec; j++) {
                    lanes[j] = symbolic_values.back();
                }
                
                if (is_signed) {
                    g_neon_memory_i8x16[addr + i].push_back(int8x16_t(g_symbolic_tm, lanes));
                } else {
                    g_neon_memory_u8x16[addr + i].push_back(uint8x16_t(g_symbolic_tm, lanes));
                }
            }
        } else if (element_bits == 32) {
            // 32-bit elements: 4 elements per 128-bit vector
            const size_t lanes_per_vec = 4;
            for (size_t i = 0; i < symbolic_values.size(); i += lanes_per_vec) {
                std::array<Term, 4> lanes;
                for (size_t j = 0; j < lanes_per_vec && (i + j) < symbolic_values.size(); j++) {
                    lanes[j] = symbolic_values[i + j];
                }
                // Pad remaining lanes with last valid element
                size_t valid_count = std::min(lanes_per_vec, symbolic_values.size() - i);
                for (size_t j = valid_count; j < lanes_per_vec; j++) {
                    lanes[j] = symbolic_values.back();
                }
                
                g_neon_memory[addr + i * sizeof(int32_t)].push_back(int32x4_t(g_symbolic_tm, lanes));
            }
        }
        // Note: 16-bit support can be added when int16x8_t/uint16x8_t types are available
    }

    /**
     * Convenience overloads for common types
     */
    inline void populateMemory8(const int8_t* ptr, const std::vector<Term>& symbolic_values) {
        populateMemory(ptr, symbolic_values, 8, true);
    }

    inline void populateMemoryU8(const uint8_t* ptr, const std::vector<Term>& symbolic_values) {
        populateMemory(ptr, symbolic_values, 8, false);
    }

    inline void populateMemory32(const int32_t* ptr, const std::vector<Term>& symbolic_values) {
        populateMemory(ptr, symbolic_values, 32, true);
    }

    /**
     * Populate unsigned 16-bit memory for NEON symbolic execution
     */
    inline void populateMemoryU16(const uint16_t* ptr, const std::vector<Term>& symbolic_values) {
        uintptr_t addr = reinterpret_cast<uintptr_t>(ptr);
        const size_t lanes_per_vec = 8;  // uint16x8_t holds 8 elements

        for (size_t i = 0; i < symbolic_values.size(); i += lanes_per_vec) {
            std::array<Term, 8> lanes;
            for (size_t j = 0; j < lanes_per_vec && (i + j) < symbolic_values.size(); j++) {
                lanes[j] = symbolic_values[i + j];
            }
            // Pad remaining lanes with last valid element
            size_t valid_count = std::min(lanes_per_vec, symbolic_values.size() - i);
            for (size_t j = valid_count; j < lanes_per_vec; j++) {
                lanes[j] = symbolic_values.back();
            }

            g_neon_memory_u16x8[addr + i * sizeof(uint16_t)].push_back(uint16x8_t(g_symbolic_tm, lanes));
        }
    }
    
    inline const std::vector<int8x16_t>* getStoredResults8x16(const int8_t* ptr) {
        uintptr_t addr = reinterpret_cast<uintptr_t>(ptr);
        auto it = g_neon_memory_i8x16.find(addr);
        if (it != g_neon_memory_i8x16.end()) {
            return &(it->second);
        }
        return nullptr;
    }
    
    inline const std::vector<int8x8_t>* getStoredResults8x8(const int8_t* ptr) {
        uintptr_t addr = reinterpret_cast<uintptr_t>(ptr);
        auto it = g_neon_memory_i8x8.find(addr);
        if (it != g_neon_memory_i8x8.end()) {
            return &(it->second);
        }
        return nullptr;
    }

    /**
     * Collect all 8-bit signed integer elements from NEON memory
     * Handles both int8x16_t and int8x8_t vector types
     */
    inline std::vector<Term> collectResults8(const int8_t* ptr, size_t batch) {
        std::vector<Term> elements;
        elements.reserve(batch);

        for (size_t i = 0; i < batch;) {
            uintptr_t current_addr = reinterpret_cast<uintptr_t>(ptr + i);

            // Try 16-byte map (int8x16)
            if (g_neon_memory_i8x16.count(current_addr) &&
                !g_neon_memory_i8x16[current_addr].empty()) {
                const int8x16_t &neon_vec = g_neon_memory_i8x16[current_addr].back();
                size_t len = std::min(static_cast<size_t>(16), batch - i);
                for (size_t lane = 0; lane < len; lane++) {
                    elements.push_back(neon_vec.getLane(lane));
                }
                i += 16;
                continue;
            }

            // Try 8-byte map (int8x8)
            if (g_neon_memory_i8x8.count(current_addr) &&
                !g_neon_memory_i8x8[current_addr].empty()) {
                const int8x8_t &neon_vec = g_neon_memory_i8x8[current_addr].back();
                size_t valid_len = 8;
                
                // Check for overlap with next stored vector
                auto it = g_neon_memory_i8x8.upper_bound(current_addr);
                if (it != g_neon_memory_i8x8.end()) {
                    uintptr_t next_addr = it->first;
                    if (next_addr < current_addr + 8) {
                        valid_len = next_addr - current_addr;
                    }
                }
                
                size_t len = std::min(valid_len, batch - i);
                for (size_t lane = 0; lane < len; lane++) {
                    elements.push_back(neon_vec.getLane(lane));
                }
                i += len;
                continue;
            }

            // No vector found at this address
            break;
        }

        return elements;
    }

    /**
     * Collect all 32-bit signed integer elements from NEON memory
     */
    inline std::vector<Term> collectResults32(const int32_t* ptr, size_t batch) {
        std::vector<Term> elements;
        elements.reserve(batch);

        for (size_t i = 0; i < batch;) {
            uintptr_t current_addr = reinterpret_cast<uintptr_t>(ptr + i);

            // Check scalar memory first (most specific)
            if (g_neon_scalar_memory.count(current_addr)) {
                elements.push_back(g_neon_scalar_memory[current_addr]);
                i += 1;
                continue;
            }

            // Check int32x2 memory
            if (g_neon_memory_i32x2.count(current_addr) && !g_neon_memory_i32x2[current_addr].empty()) {
                const int32x2_t &neon_vec = g_neon_memory_i32x2[current_addr].back();
                size_t len = std::min(static_cast<size_t>(2), batch - i);
                for (size_t lane = 0; lane < len; lane++) {
                    elements.push_back(neon_vec.getLane(lane));
                }
                i += 2;
                continue;
            }

            if (g_neon_memory.count(current_addr) && !g_neon_memory[current_addr].empty()) {
                const int32x4_t &neon_vec = g_neon_memory[current_addr].back();
                size_t len = std::min(static_cast<size_t>(4), batch - i);
                for (size_t lane = 0; lane < len; lane++) {
                    elements.push_back(neon_vec.getLane(lane));
                }
                i += 4;
                continue;
            }

            // No vector found at this address
            break;
        }

        return elements;
    }

    inline Term vectorEqual(const int32x4_t& a, const int32x4_t& b) {
        std::vector<Term> lane_equalities;

        for (int i = 0; i < 4; i++) {
            lane_equalities.push_back(
                g_symbolic_tm->mkTerm(Kind::EQUAL, {a.getLane(i), b.getLane(i)})
            );
        }

        return g_symbolic_tm->mkTerm(Kind::AND, lane_equalities);
    }

    inline Term vectorNotEqual(const int32x4_t& a, const int32x4_t& b) {
        std::vector<Term> lane_inequalities;

        for (int i = 0; i < 4; i++) {
            Term eq = g_symbolic_tm->mkTerm(Kind::EQUAL, {a.getLane(i), b.getLane(i)});
            lane_inequalities.push_back(g_symbolic_tm->mkTerm(Kind::NOT, {eq}));
        }

        return g_symbolic_tm->mkTerm(Kind::OR, lane_inequalities);
    }

    /**
     * Collect all 32-bit floating-point elements from NEON memory
     * Handles both float32x4_t and float32x2_t vector types
     */
    inline std::vector<Term> collectResultsF32(const float* ptr, size_t batch) {
        std::vector<Term> elements;
        elements.reserve(batch);

        for (size_t i = 0; i < batch;) {
            uintptr_t current_addr = reinterpret_cast<uintptr_t>(ptr + i);

            // Try 16-byte map (float32x4) - 4 elements
            if (g_neon_memory_f32x4.count(current_addr) &&
                !g_neon_memory_f32x4[current_addr].empty()) {
                const float32x4_t &neon_vec = g_neon_memory_f32x4[current_addr].back();
                size_t len = std::min(static_cast<size_t>(4), batch - i);
                for (size_t lane = 0; lane < len; lane++) {
                    elements.push_back(neon_vec.getLane(lane));
                }
                i += 4;
                continue;
            }

            // Try 8-byte map (float32x2) - 2 elements
            if (g_neon_memory_f32x2.count(current_addr) &&
                !g_neon_memory_f32x2[current_addr].empty()) {
                const float32x2_t &neon_vec = g_neon_memory_f32x2[current_addr].back();
                size_t len = std::min(static_cast<size_t>(2), batch - i);
                for (size_t lane = 0; lane < len; lane++) {
                    elements.push_back(neon_vec.getLane(lane));
                }
                i += 2;
                continue;
            }

            // No vector found at this address
            break;
        }

        return elements;
    }

    /**
     * Collect all 16-bit unsigned integer elements from NEON memory (for float16 results)
     * Handles both uint16x8_t and uint16x4_t vector types
     */
    inline std::vector<Term> collectResultsU16(const uint16_t* ptr, size_t batch) {
        std::vector<Term> elements;
        elements.reserve(batch);

        for (size_t i = 0; i < batch;) {
            uintptr_t current_addr = reinterpret_cast<uintptr_t>(ptr + i);

            // Try 16-byte map (uint16x8) - 8 elements
            if (g_neon_memory_u16x8.count(current_addr) &&
                !g_neon_memory_u16x8[current_addr].empty()) {
                const uint16x8_t &neon_vec = g_neon_memory_u16x8[current_addr].back();
                size_t len = std::min(static_cast<size_t>(8), batch - i);
                for (size_t lane = 0; lane < len; lane++) {
                    elements.push_back(neon_vec.getLane(lane));
                }
                i += 8;
                continue;
            }

            // Try 8-byte map (uint16x4) - 4 elements
            if (g_neon_memory_u16x4.count(current_addr) &&
                !g_neon_memory_u16x4[current_addr].empty()) {
                const uint16x4_t &neon_vec = g_neon_memory_u16x4[current_addr].back();
                size_t len = std::min(static_cast<size_t>(4), batch - i);
                for (size_t lane = 0; lane < len; lane++) {
                    elements.push_back(neon_vec.getLane(lane));
                }
                i += 4;
                continue;
            }

            // Try int8x8 map for partial stores
            // vst1_lane_u32 stores 4 bytes = 2 uint16, vst1_lane_u16 stores 2 bytes = 1 uint16
            if (g_neon_memory_i8x8.count(current_addr) &&
                !g_neon_memory_i8x8[current_addr].empty()) {
                const int8x8_t &neon_vec = g_neon_memory_i8x8[current_addr].back();

                // Reconstruct first uint16 from bytes 0-1
                Term lo0 = neon_vec.getLane(0);
                Term hi0 = neon_vec.getLane(1);
                Term combined0 = g_symbolic_tm->mkTerm(Kind::BITVECTOR_CONCAT, {hi0, lo0});
                elements.push_back(combined0);
                i += 1;

                // Check if there's a second uint16 stored here (from vst1_lane_u32)
                // vst1_lane_u32 stores 4 bytes (2 uint16), but there won't be another entry at i+1
                // since vst1_lane_u32 advances pointer by 2 uint16, so next entry is at i+2
                // We can detect this by checking if the next address (i+1) has NO entry but
                // the current int8x8 has valid data in lanes 2-3
                uintptr_t next_addr = reinterpret_cast<uintptr_t>(ptr + i);
                if (i < batch &&
                    !g_neon_memory_u16x8.count(next_addr) &&
                    !g_neon_memory_u16x4.count(next_addr) &&
                    !g_neon_memory_i8x8.count(next_addr)) {
                    // No entry at next address - this was likely vst1_lane_u32
                    // Extract second uint16 from bytes 2-3
                    Term lo1 = neon_vec.getLane(2);
                    Term hi1 = neon_vec.getLane(3);
                    Term combined1 = g_symbolic_tm->mkTerm(Kind::BITVECTOR_CONCAT, {hi1, lo1});
                    elements.push_back(combined1);
                    i += 1;
                }
                continue;
            }

            // No vector found at this address
            break;
        }

        return elements;
    }

    /**
     * Populate unsigned 32-bit memory for NEON symbolic execution
     */
    inline void populateMemoryU32(const uint32_t* ptr, const std::vector<Term>& symbolic_values) {
        uintptr_t addr = reinterpret_cast<uintptr_t>(ptr);
        const size_t lanes_per_vec = 4;

        for (size_t i = 0; i < symbolic_values.size(); i += lanes_per_vec) {
            std::array<Term, 4> lanes;
            for (size_t j = 0; j < lanes_per_vec && (i + j) < symbolic_values.size(); j++) {
                lanes[j] = symbolic_values[i + j];
            }
            // Pad remaining lanes with last valid element
            size_t valid_count = std::min(lanes_per_vec, symbolic_values.size() - i);
            for (size_t j = valid_count; j < lanes_per_vec; j++) {
                lanes[j] = symbolic_values.back();
            }

            g_neon_memory_u32x4[addr + i * sizeof(uint32_t)].push_back(uint32x4_t(g_symbolic_tm, lanes));
        }
    }

    /**
     * Collect all 32-bit unsigned integer elements from NEON memory
     * Handles uint32x4_t, uint32x2_t, and scalar memory
     */
    inline std::vector<Term> collectResultsU32(const uint32_t* ptr, size_t batch) {
        std::vector<Term> elements;
        elements.reserve(batch);

        for (size_t i = 0; i < batch;) {
            uintptr_t current_addr = reinterpret_cast<uintptr_t>(ptr + i);

            // Check scalar memory first (most specific)
            if (g_neon_scalar_memory.count(current_addr)) {
                elements.push_back(g_neon_scalar_memory[current_addr]);
                i += 1;
                continue;
            }

            // Check uint32x2 memory
            if (g_neon_memory_u32x2.count(current_addr) && !g_neon_memory_u32x2[current_addr].empty()) {
                const uint32x2_t &neon_vec = g_neon_memory_u32x2[current_addr].back();
                size_t len = std::min(static_cast<size_t>(2), batch - i);
                for (size_t lane = 0; lane < len; lane++) {
                    elements.push_back(neon_vec.getLane(lane));
                }
                i += 2;
                continue;
            }

            // Check uint32x4 memory
            if (g_neon_memory_u32x4.count(current_addr) && !g_neon_memory_u32x4[current_addr].empty()) {
                const uint32x4_t &neon_vec = g_neon_memory_u32x4[current_addr].back();
                size_t len = std::min(static_cast<size_t>(4), batch - i);
                for (size_t lane = 0; lane < len; lane++) {
                    elements.push_back(neon_vec.getLane(lane));
                }
                i += 4;
                continue;
            }

            // No vector found at this address
            break;
        }

        return elements;
    }

    /**
     * Collect all 8-bit unsigned integer elements from NEON memory
     * Handles both uint8x16_t and uint8x8_t vector types
     * Also handles partial stores (vst1_lane_u32 stores 4 bytes, vst1_lane_u16 stores 2 bytes, etc.)
     */
    inline std::vector<Term> collectResultsU8(const uint8_t* ptr, size_t batch) {
        std::vector<Term> elements;
        elements.reserve(batch);

        for (size_t i = 0; i < batch;) {
            uintptr_t current_addr = reinterpret_cast<uintptr_t>(ptr + i);

            // Try 16-byte map (uint8x16)
            if (g_neon_memory_u8x16.count(current_addr) &&
                !g_neon_memory_u8x16[current_addr].empty()) {
                const uint8x16_t &neon_vec = g_neon_memory_u8x16[current_addr].back();
                size_t len = std::min(static_cast<size_t>(16), batch - i);
                for (size_t lane = 0; lane < len; lane++) {
                    elements.push_back(neon_vec.getLane(lane));
                }
                i += 16;
                continue;
            }

            // Try 8-byte map (uint8x8) - but only collect the valid bytes
            if (g_neon_memory_u8x8.count(current_addr) &&
                !g_neon_memory_u8x8[current_addr].empty()) {
                const uint8x8_t &neon_vec = g_neon_memory_u8x8[current_addr].back();

                // Determine how many bytes were actually stored
                // Check if there's another store at nearby addresses
                // For now, collect up to 8 bytes but check for next store
                size_t bytes_to_collect = 8;

                // Check if there's a store at i+1, i+2, i+4 which would indicate partial store
                for (size_t offset = 1; offset < 8 && (i + offset) < batch; offset++) {
                    uintptr_t next_addr = reinterpret_cast<uintptr_t>(ptr + i + offset);
                    if (g_neon_memory_u8x8.count(next_addr) && !g_neon_memory_u8x8[next_addr].empty()) {
                        bytes_to_collect = offset;
                        break;
                    }
                    if (g_neon_memory_u8x16.count(next_addr) && !g_neon_memory_u8x16[next_addr].empty()) {
                        bytes_to_collect = offset;
                        break;
                    }
                }

                size_t len = std::min(bytes_to_collect, batch - i);
                for (size_t lane = 0; lane < len; lane++) {
                    elements.push_back(neon_vec.getLane(lane));
                }
                i += len;
                continue;
            }

            // No vector found at this address - try single byte increment
            // This shouldn't happen if all stores went to memory properly
            break;
        }

        return elements;
    }
}

#endif
