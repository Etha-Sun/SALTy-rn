#pragma once
// Symbolic vector types for NEON and RVV.
// NeonVector<ElemBits, NumLanes> — fixed-size template (replaces 11K lines of types.hpp)
// RVVVector — dynamic-size (replaces 11K lines of RVV types.hpp)
// MaskVector, VectorTuple, SymbolicScalar

#include <bitwuzla/cpp/bitwuzla.h>

#include <array>
#include <cstddef>
#include <cstdint>
#include <string>
#include <vector>

namespace salt {

using namespace bitwuzla;

// ---------------------------------------------------------------------------
// NeonVector — fixed lane count, compile-time parameterized
// ---------------------------------------------------------------------------
template <size_t ElemBits, size_t NumLanes>
class NeonVector {
    std::array<Term, NumLanes> lanes_;
    TermManager* tm_;

public:
    // Construct from explicit lane terms
    NeonVector(TermManager& tm, const std::array<Term, NumLanes>& data)
        : lanes_(data), tm_(&tm) {}

    // Construct symbolic (fresh constants)
    NeonVector(TermManager& tm, const std::string& name) : tm_(&tm) {
        Sort s = tm.mk_bv_sort(ElemBits);
        for (size_t i = 0; i < NumLanes; i++) {
            lanes_[i] = tm.mk_const(s, name + "_" + std::to_string(i));
        }
    }

    // Default (zero-init terms — must be assigned before use)
    NeonVector() : tm_(nullptr) {}

    Term getLane(size_t i) const { return lanes_[i]; }
    void setLane(size_t i, Term t) { lanes_[i] = t; }
    TermManager& tm() const { return *tm_; }
    void setTM(TermManager& tm) { tm_ = &tm; }

    static constexpr size_t elem_bits() { return ElemBits; }
    static constexpr size_t num_lanes() { return NumLanes; }
    static constexpr size_t total_bits() { return ElemBits * NumLanes; }
};

// ---------------------------------------------------------------------------
// NEON type aliases — match arm_neon.h naming
// ---------------------------------------------------------------------------

// 64-bit vectors (8 bytes, D register)
using int8x8_t    = NeonVector<8, 8>;
using int16x4_t   = NeonVector<16, 4>;
using int32x2_t   = NeonVector<32, 2>;
using int64x1_t   = NeonVector<64, 1>;
using uint8x8_t   = NeonVector<8, 8>;
using uint16x4_t  = NeonVector<16, 4>;
using uint32x2_t  = NeonVector<32, 2>;
using uint64x1_t  = NeonVector<64, 1>;
using float32x2_t = NeonVector<32, 2>;

// 128-bit vectors (16 bytes, Q register)
using int8x16_t   = NeonVector<8, 16>;
using int16x8_t   = NeonVector<16, 8>;
using int32x4_t   = NeonVector<32, 4>;
using int64x2_t   = NeonVector<64, 2>;
using uint8x16_t  = NeonVector<8, 16>;
using uint16x8_t  = NeonVector<16, 8>;
using uint32x4_t  = NeonVector<32, 4>;
using uint64x2_t  = NeonVector<64, 2>;
using float32x4_t = NeonVector<32, 4>;
using float16x8_t = NeonVector<16, 8>;
using float16x4_t = NeonVector<16, 4>;
// BF16: 1 sign + 8 exp + 7 mant (16 bits). Lanes hold the raw IEEE pattern;
// conversion to fp32 is shift-left-16 (top half of an fp32 BV).
using bfloat16x4_t = NeonVector<16, 4>;
using bfloat16x8_t = NeonVector<16, 8>;
using bfloat16_t   = uint16_t;

// ---------------------------------------------------------------------------
// RVVVector — dynamic lane count
// ---------------------------------------------------------------------------
class RVVVector {
    std::vector<Term> elements_;
    size_t elem_bits_;
    TermManager* tm_;

public:
    // Construct from explicit element terms
    RVVVector(TermManager& tm, size_t elem_bits, const std::vector<Term>& data)
        : elements_(data), elem_bits_(elem_bits), tm_(&tm) {}

    // Construct symbolic (fresh constants)
    RVVVector(TermManager& tm, size_t elem_bits, size_t vl, const std::string& name)
        : elem_bits_(elem_bits), tm_(&tm) {
        Sort s = tm.mk_bv_sort(elem_bits);
        elements_.reserve(vl);
        for (size_t i = 0; i < vl; i++) {
            elements_.push_back(tm.mk_const(s, name + "_" + std::to_string(i)));
        }
    }

    // Default
    RVVVector() : elem_bits_(0), tm_(nullptr) {}

    Term getElement(size_t i) const { return elements_[i]; }
    void setElement(size_t i, Term t) { elements_[i] = t; }
    size_t getVL() const { return elements_.size(); }
    size_t elemBits() const { return elem_bits_; }
    TermManager& tm() const { return *tm_; }

    const std::vector<Term>& elements() const { return elements_; }
};

// ---------------------------------------------------------------------------
// RVV type aliases — all map to RVVVector (aliases are documentation)
// ---------------------------------------------------------------------------
using vint8m1_t   = RVVVector;
using vint8m2_t   = RVVVector;
using vint8m4_t   = RVVVector;
using vint8m8_t   = RVVVector;
using vint16m1_t  = RVVVector;
using vint16m2_t  = RVVVector;
using vint16m4_t  = RVVVector;
using vint16m8_t  = RVVVector;
using vint32m1_t  = RVVVector;
using vint32m2_t  = RVVVector;
using vint32m4_t  = RVVVector;
using vint32m8_t  = RVVVector;
using vint64m1_t  = RVVVector;
using vint64m2_t  = RVVVector;
using vint64m4_t  = RVVVector;
using vint64m8_t  = RVVVector;
using vuint8m1_t  = RVVVector;
using vuint8m2_t  = RVVVector;
using vuint8m4_t  = RVVVector;
using vuint8m8_t  = RVVVector;
using vuint16m1_t = RVVVector;
using vuint16m2_t = RVVVector;
using vuint16m4_t = RVVVector;
using vuint16m8_t = RVVVector;
using vuint32m1_t = RVVVector;
using vuint32m2_t = RVVVector;
using vuint32m4_t = RVVVector;
using vuint32m8_t = RVVVector;
using vfloat32m1_t = RVVVector;
using vfloat32m2_t = RVVVector;
using vfloat32m4_t = RVVVector;
using vfloat32m8_t = RVVVector;
using vfloat16m1_t = RVVVector;
using vfloat16m2_t = RVVVector;
using vfloat16m4_t = RVVVector;
using vfloat16m8_t = RVVVector;

// Fractional LMUL types (mf2, mf4, mf8)
using vint8mf2_t   = RVVVector;
using vint8mf4_t   = RVVVector;
using vint8mf8_t   = RVVVector;
using vint16mf2_t  = RVVVector;
using vint16mf4_t  = RVVVector;
using vint32mf2_t  = RVVVector;
using vuint8mf2_t  = RVVVector;
using vuint8mf4_t  = RVVVector;
using vuint16mf2_t = RVVVector;
using vuint32mf2_t = RVVVector;

// ---------------------------------------------------------------------------
// MaskVector — 1-bit per element (vbool types)
// ---------------------------------------------------------------------------
class MaskVector {
    std::vector<Term> bits_; // each is a 1-bit BV term
    TermManager* tm_;

public:
    MaskVector(TermManager& tm, const std::vector<Term>& bits)
        : bits_(bits), tm_(&tm) {}

    MaskVector(TermManager& tm, size_t vl, const std::string& name)
        : tm_(&tm) {
        Sort s = tm.mk_bv_sort(1);
        bits_.reserve(vl);
        for (size_t i = 0; i < vl; i++)
            bits_.push_back(tm.mk_const(s, name + "_m" + std::to_string(i)));
    }

    MaskVector() : tm_(nullptr) {}

    Term getBit(size_t i) const { return bits_[i]; }
    size_t size() const { return bits_.size(); }
};

using vbool1_t  = MaskVector;
using vbool2_t  = MaskVector;
using vbool4_t  = MaskVector;
using vbool8_t  = MaskVector;
using vbool16_t = MaskVector;
using vbool32_t = MaskVector;
using vbool64_t = MaskVector;

// ---------------------------------------------------------------------------
// VectorTuple — structured load results (int8x16x2_t, vlseg returns, etc.)
// ---------------------------------------------------------------------------
template <typename VecType, size_t N>
struct VectorTuple {
    std::array<VecType, N> val;
    VecType& operator[](size_t i) { return val[i]; }
    const VecType& operator[](size_t i) const { return val[i]; }
};

// NEON tuple aliases
using int8x8x2_t   = VectorTuple<int8x8_t, 2>;
using int8x16x2_t  = VectorTuple<int8x16_t, 2>;
using int16x4x2_t  = VectorTuple<int16x4_t, 2>;
using int16x8x2_t  = VectorTuple<int16x8_t, 2>;
using int32x2x2_t  = VectorTuple<int32x2_t, 2>;
using int32x4x2_t  = VectorTuple<int32x4_t, 2>;
using uint8x16x4_t = VectorTuple<uint8x16_t, 4>;

} // namespace salt
