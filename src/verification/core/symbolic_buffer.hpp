#pragma once
// Byte-addressed symbolic buffer with typed load/store views.
// Replaces all 12+ type-specific memory maps from the cvc5 codebase.

#include "context.hpp"
#include "symbolic_vector.hpp"

#include <bitwuzla/cpp/bitwuzla.h>

#include <cstddef>
#include <cstdint>
#include <stdexcept>
#include <string>
#include <vector>

namespace salt {

using namespace bitwuzla;

class SymbolicBuffer {
    std::vector<Term> bytes_; // one 8-bit BV term per byte
    size_t num_bytes_;
    uintptr_t base_addr_ = 0;
    TermManager* tm_;

public:
    SymbolicBuffer(TermManager& tm, size_t num_bytes, const std::string& name)
        : num_bytes_(num_bytes), tm_(&tm) {
        Sort bv8 = tm.mk_bv_sort(8);
        bytes_.reserve(num_bytes);
        for (size_t i = 0; i < num_bytes; i++) {
            bytes_.push_back(tm.mk_const(bv8, name + "_b" + std::to_string(i)));
        }
    }

    // Bind to a real C array for pointer-to-offset translation
    void bind(const void* ptr) {
        base_addr_ = reinterpret_cast<uintptr_t>(ptr);
    }

    uintptr_t baseAddr() const { return base_addr_; }
    size_t numBytes() const { return num_bytes_; }

    size_t ptrToByteOffset(const void* ptr) const {
        return static_cast<size_t>(reinterpret_cast<uintptr_t>(ptr) - base_addr_);
    }

    bool contains(const void* ptr) const {
        uintptr_t addr = reinterpret_cast<uintptr_t>(ptr);
        return addr >= base_addr_ && addr < base_addr_ + num_bytes_;
    }

    // -----------------------------------------------------------------------
    // Raw byte access
    // -----------------------------------------------------------------------
    Term getByte(size_t offset) const { return bytes_[offset]; }
    void setByte(size_t offset, Term val) { bytes_[offset] = val; }

    // -----------------------------------------------------------------------
    // Typed scalar load — assemble bytes (little-endian) into wider BV
    // e.g., loadScalar(4, 32) → concat(byte[7], byte[6], byte[5], byte[4])
    // -----------------------------------------------------------------------
    Term loadScalar(size_t byte_offset, size_t bits) const {
        size_t n_bytes = bits / 8;
        // Little-endian: MSB is at highest address
        Term result = bytes_[byte_offset];
        for (size_t i = 1; i < n_bytes; i++) {
            result = tm_->mk_term(Kind::BV_CONCAT,
                                   {bytes_[byte_offset + i], result});
        }
        return result;
    }

    // -----------------------------------------------------------------------
    // Typed scalar store — split wider BV into bytes (little-endian)
    // -----------------------------------------------------------------------
    void storeScalar(size_t byte_offset, Term val, size_t bits) {
        size_t n_bytes = bits / 8;
        for (size_t i = 0; i < n_bytes; i++) {
            size_t lo = i * 8;
            size_t hi = lo + 7;
            bytes_[byte_offset + i] = tm_->mk_term(Kind::BV_EXTRACT, {val},
                                                     {hi, lo});
        }
    }

    // -----------------------------------------------------------------------
    // NEON vector load — load NumLanes elements of ElemBits starting at offset
    // -----------------------------------------------------------------------
    template <size_t ElemBits, size_t NumLanes>
    NeonVector<ElemBits, NumLanes> loadNeon(size_t byte_offset) const {
        std::array<Term, NumLanes> lanes;
        size_t elem_bytes = ElemBits / 8;
        for (size_t i = 0; i < NumLanes; i++) {
            if constexpr (ElemBits == 8) {
                lanes[i] = bytes_[byte_offset + i];
            } else {
                lanes[i] = loadScalar(byte_offset + i * elem_bytes, ElemBits);
            }
        }
        return NeonVector<ElemBits, NumLanes>(*tm_, lanes);
    }

    // -----------------------------------------------------------------------
    // NEON vector store
    // -----------------------------------------------------------------------
    template <size_t ElemBits, size_t NumLanes>
    void storeNeon(size_t byte_offset, const NeonVector<ElemBits, NumLanes>& vec) {
        size_t elem_bytes = ElemBits / 8;
        for (size_t i = 0; i < NumLanes; i++) {
            if constexpr (ElemBits == 8) {
                bytes_[byte_offset + i] = vec.getLane(i);
            } else {
                storeScalar(byte_offset + i * elem_bytes, vec.getLane(i), ElemBits);
            }
        }
    }

    // -----------------------------------------------------------------------
    // RVV vector load — load vl elements of elem_bits starting at offset
    // -----------------------------------------------------------------------
    RVVVector loadRVV(size_t byte_offset, size_t vl, size_t elem_bits) const {
        std::vector<Term> elems;
        elems.reserve(vl);
        size_t elem_bytes = elem_bits / 8;
        for (size_t i = 0; i < vl; i++) {
            if (elem_bits == 8) {
                elems.push_back(bytes_[byte_offset + i]);
            } else {
                elems.push_back(loadScalar(byte_offset + i * elem_bytes, elem_bits));
            }
        }
        return RVVVector(*tm_, elem_bits, elems);
    }

    // -----------------------------------------------------------------------
    // RVV vector store
    // -----------------------------------------------------------------------
    void storeRVV(size_t byte_offset, const RVVVector& vec) {
        size_t elem_bytes = vec.elemBits() / 8;
        for (size_t i = 0; i < vec.getVL(); i++) {
            if (vec.elemBits() == 8) {
                bytes_[byte_offset + i] = vec.getElement(i);
            } else {
                storeScalar(byte_offset + i * elem_bytes, vec.getElement(i), vec.elemBits());
            }
        }
    }
};

// ---------------------------------------------------------------------------
// VerificationContext buffer methods (defined here after SymbolicBuffer is complete)
// ---------------------------------------------------------------------------
inline SymbolicBuffer& VerificationContext::registerBuffer(
    const std::string& name, size_t num_bytes) {
    auto [it, inserted] = buffers.emplace(
        name, std::make_unique<SymbolicBuffer>(tm, num_bytes, name));
    if (!inserted) throw std::runtime_error("Buffer already registered: " + name);
    registered_buffers.push_back(it->second.get());
    return *it->second;
}

inline SymbolicBuffer& VerificationContext::findBuffer(const void* ptr) {
    for (auto* buf : registered_buffers) {
        if (buf->contains(ptr)) return *buf;
    }
    throw std::runtime_error("No buffer found for pointer");
}

inline SymbolicBuffer* VerificationContext::findBufferSafe(const void* ptr) noexcept {
    for (auto* buf : registered_buffers) {
        if (buf->contains(ptr)) return buf;
    }
    return nullptr;
}

} // namespace salt

// ---------------------------------------------------------------------------
// _Float16 copy-ctor / copy-assign / dtor — out-of-line so they can use the
// full SymbolicBuffer definition.  See context.hpp for the declaration.
// ---------------------------------------------------------------------------
#ifndef __FLT16_MAX__
inline _Float16::_Float16(const _Float16& other) : value(other.value) {
    if (!salt::g_ctx) return;
    // Propagate Term if source already carries one (temporary, param, etc.).
    auto it = salt::g_scalar_terms.find(&other);
    if (it != salt::g_scalar_terms.end()) {
        salt::g_scalar_terms.insert_or_assign(this, it->second);
        return;
    }
    // Source address lives in a registered symbolic buffer → load its Term.
    if (auto* buf = salt::g_ctx->findBufferSafe(&other)) {
        bitwuzla::Term bv = buf->loadScalar(buf->ptrToByteOffset(&other), 16);
        bitwuzla::Term fp = salt::g_ctx->tm.mk_term(
            bitwuzla::Kind::FP_TO_FP_FROM_BV, {bv}, {5, 11});
        salt::g_scalar_terms.insert_or_assign(this, fp);
    }
}

inline _Float16& _Float16::operator=(const _Float16& other) {
    if (this == &other) return *this;
    value = other.value;
    if (!salt::g_ctx) return *this;
    auto it = salt::g_scalar_terms.find(&other);
    if (it != salt::g_scalar_terms.end()) {
        salt::g_scalar_terms.insert_or_assign(this, it->second);
        return *this;
    }
    if (auto* buf = salt::g_ctx->findBufferSafe(&other)) {
        bitwuzla::Term bv = buf->loadScalar(buf->ptrToByteOffset(&other), 16);
        bitwuzla::Term fp = salt::g_ctx->tm.mk_term(
            bitwuzla::Kind::FP_TO_FP_FROM_BV, {bv}, {5, 11});
        salt::g_scalar_terms.insert_or_assign(this, fp);
    } else {
        // Concrete source — clear any stale entry from a prior assignment.
        salt::g_scalar_terms.erase(this);
    }
    return *this;
}

inline _Float16::~_Float16() {
    // Unconditional erase — g_ctx may have been cleared while objects of
    // static/thread-local lifetime are still alive; leaking map entries
    // would cause cross-run contamination.
    if (!salt::g_scalar_terms.empty()) salt::g_scalar_terms.erase(this);
}
#endif
