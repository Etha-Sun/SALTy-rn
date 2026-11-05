#pragma once
// NeonVector / RVVVector / MaskVector — same shape as the bitwuzla tree
// but using cvc5::Term and namespaced under `salt_cvc5`.

#include "context.hpp"

#include <cvc5/cvc5.h>

#include <array>
#include <type_traits>
#include <cstddef>
#include <cstdint>
#include <string>
#include <vector>

namespace salt_cvc5 {

template <size_t ElemBits, size_t NumLanes>
class NeonVector {
    std::array<Term, NumLanes> lanes_;
    TermManager* tm_;
public:
    NeonVector(TermManager& tm, const std::array<Term, NumLanes>& data)
        : lanes_(data), tm_(&tm) {}
    NeonVector(TermManager& tm, const std::string& name) : tm_(&tm) {
        Sort s = tm.mkBitVectorSort(static_cast<uint32_t>(ElemBits));
        for (size_t i = 0; i < NumLanes; i++) {
            lanes_[i] = tm.mkConst(s, name + "_" + std::to_string(i));
        }
    }
    NeonVector() : tm_(nullptr) {}

    Term getLane(size_t i) const { return lanes_[i]; }
    void setLane(size_t i, Term t) { lanes_[i] = t; }
    TermManager& tm() const { return *tm_; }
    void setTM(TermManager& tm) { tm_ = &tm; }

    static constexpr size_t elem_bits() { return ElemBits; }
    static constexpr size_t num_lanes() { return NumLanes; }
};

// NEON aliases used by f16-conv-hwc2chw.
using uint16x4_t  = NeonVector<16, 4>;
using uint16x8_t  = NeonVector<16, 8>;
using uint32x2_t  = NeonVector<32, 2>;
using float16x4_t = NeonVector<16, 4>;
using float16x8_t = NeonVector<16, 8>;
// Additional aliases used by the LUT gather path (f32-velu and similar).
using uint64x2_t  = NeonVector<64, 2>;
using int32x2_t   = NeonVector<32, 2>;
using int32x4_t   = NeonVector<32, 4>;
using float32x4_t = NeonVector<32, 4>;
// 8-bit aliases used by x8-lut and other byte-level kernels.
using uint8x8_t   = NeonVector<8, 8>;
using uint8x16_t  = NeonVector<8, 16>;
// 64-bit single-lane vector (used by x64-transposec).
using uint64x1_t  = NeonVector<64, 1>;
using int64x1_t   = NeonVector<64, 1>;
// BF16: 1 sign + 8 exp + 7 mant (16 bits). Lanes hold the raw IEEE pattern;
// conversion to fp32 is shift-left-16 (top half of an fp32 BV).
using bfloat16x4_t = NeonVector<16, 4>;
using bfloat16x8_t = NeonVector<16, 8>;
using bfloat16_t   = uint16_t;

// RVVVector — dynamic width
class RVVVector {
    std::vector<Term> elements_;
    size_t elem_bits_;
    TermManager* tm_;
public:
    RVVVector(TermManager& tm, size_t elem_bits, const std::vector<Term>& data)
        : elements_(data), elem_bits_(elem_bits), tm_(&tm) {}
    RVVVector() : elem_bits_(0), tm_(nullptr) {}

    Term getElement(size_t i) const { return elements_[i]; }
    void setElement(size_t i, Term t) { elements_[i] = t; }
    size_t getVL() const { return elements_.size(); }
    size_t elemBits() const { return elem_bits_; }
    TermManager& tm() const { return *tm_; }
    const std::vector<Term>& elements() const { return elements_; }
};

// RVV aliases used by f16-conv-hwc2chw.
using vint32m2_t   = RVVVector;
using vuint32m2_t  = RVVVector;
using vuint16m1_t  = RVVVector;
using vfloat16m1_t = RVVVector;

class MaskVector {
    std::vector<Term> bits_;
    TermManager* tm_;
public:
    MaskVector(TermManager& tm, const std::vector<Term>& bits)
        : bits_(bits), tm_(&tm) {}
    MaskVector() : tm_(nullptr) {}
    Term getBit(size_t i) const { return bits_[i]; }
    size_t size() const { return bits_.size(); }
};

using vbool16_t = MaskVector;

// VectorTuple
template <typename VecType, size_t N>
struct VectorTuple {
    std::array<VecType, N> val;
    VecType& operator[](size_t i) { return val[i]; }
    const VecType& operator[](size_t i) const { return val[i]; }
};

// NEON multi-vector type aliases.
using uint8x16x4_t = VectorTuple<uint8x16_t, 4>;
using uint32x2x2_t = VectorTuple<uint32x2_t, 2>;
using int32x2x2_t  = VectorTuple<int32x2_t,  2>;

} // namespace salt_cvc5
