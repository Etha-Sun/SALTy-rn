#pragma once
// Byte-addressed symbolic buffer with typed load/store views.
// cvc5 port — mirrors src/verification/core/symbolic_buffer.hpp.

#include "context.hpp"
#include "symbolic_vector.hpp"

#include <cvc5/cvc5.h>

#include <cstddef>
#include <cstdint>
#include <stdexcept>
#include <string>
#include <vector>

namespace salt_cvc5 {

class SymbolicBuffer {
    std::vector<Term> bytes_;
    size_t num_bytes_;
    uintptr_t base_addr_ = 0;
    TermManager* tm_;
    std::string name_;
public:
    const std::string& name() const { return name_; }
    SymbolicBuffer(TermManager& tm, size_t num_bytes, const std::string& name)
        : num_bytes_(num_bytes), tm_(&tm), name_(name) {
        Sort bv8 = tm.mkBitVectorSort(8);
        bytes_.reserve(num_bytes);
        for (size_t i = 0; i < num_bytes; i++) {
            bytes_.push_back(tm.mkConst(bv8, name + "_b" + std::to_string(i)));
        }
    }

    void bind(const void* ptr) { base_addr_ = reinterpret_cast<uintptr_t>(ptr); }
    uintptr_t baseAddr() const { return base_addr_; }
    size_t numBytes() const { return num_bytes_; }

    size_t ptrToByteOffset(const void* ptr) const {
        return static_cast<size_t>(reinterpret_cast<uintptr_t>(ptr) - base_addr_);
    }
    bool contains(const void* ptr) const {
        uintptr_t addr = reinterpret_cast<uintptr_t>(ptr);
        return addr >= base_addr_ && addr < base_addr_ + num_bytes_;
    }

    Term getByte(size_t offset) const { return bytes_[offset]; }
    void setByte(size_t offset, Term val) { bytes_[offset] = val; }

    // little-endian: byte[off] is LSB
    Term loadScalar(size_t byte_offset, size_t bits) const {
        size_t n_bytes = bits / 8;
        Term result = bytes_[byte_offset];
        for (size_t i = 1; i < n_bytes; i++) {
            result = tm_->mkTerm(Kind::BITVECTOR_CONCAT,
                                 {bytes_[byte_offset + i], result});
        }
        return result;
    }

    void storeScalar(size_t byte_offset, Term val, size_t bits) {
        size_t n_bytes = bits / 8;
        for (size_t i = 0; i < n_bytes; i++) {
            uint32_t lo = static_cast<uint32_t>(i * 8);
            uint32_t hi = lo + 7;
            Op op = tm_->mkOp(Kind::BITVECTOR_EXTRACT, {hi, lo});
            bytes_[byte_offset + i] = tm_->mkTerm(op, {val});
        }
    }

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

    RVVVector loadRVV(size_t byte_offset, size_t vl, size_t elem_bits) const {
        std::vector<Term> elems;
        elems.reserve(vl);
        size_t elem_bytes = elem_bits / 8;
        for (size_t i = 0; i < vl; i++) {
            if (elem_bits == 8) elems.push_back(bytes_[byte_offset + i]);
            else elems.push_back(loadScalar(byte_offset + i * elem_bytes, elem_bits));
        }
        return RVVVector(*tm_, elem_bits, elems);
    }

    void storeRVV(size_t byte_offset, const RVVVector& vec) {
        size_t elem_bytes = vec.elemBits() / 8;
        for (size_t i = 0; i < vec.getVL(); i++) {
            if (vec.elemBits() == 8) bytes_[byte_offset + i] = vec.getElement(i);
            else storeScalar(byte_offset + i * elem_bytes, vec.getElement(i), vec.elemBits());
        }
    }
};

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
    std::fprintf(stderr, "findBuffer FAIL: ptr=%p; registered:\n", ptr);
    for (auto* buf : registered_buffers) {
        std::fprintf(stderr, "  base=%p..%p (%zu bytes) name=%s\n",
                     (void*)buf->baseAddr(),
                     (void*)(buf->baseAddr() + buf->numBytes()),
                     buf->numBytes(), buf->name().c_str());
    }
    throw std::runtime_error("No buffer found for pointer");
}

inline SymbolicBuffer* VerificationContext::findBufferSafe(const void* ptr) noexcept {
    for (auto* buf : registered_buffers) {
        if (buf->contains(ptr)) return buf;
    }
    return nullptr;
}

} // namespace salt_cvc5

// _Float16 copy-ctor / copy-assign / dtor — out-of-line so they can use the
// full SymbolicBuffer definition.  See context.hpp for the declaration.
#ifndef __FLT16_MAX__
inline _Float16::_Float16(const _Float16& other) : value(other.value) {
    if (!salt_cvc5::g_ctx) return;
    auto it = salt_cvc5::g_scalar_terms.find(&other);
    if (it != salt_cvc5::g_scalar_terms.end()) {
        salt_cvc5::g_scalar_terms.insert_or_assign(this, it->second);
        return;
    }
    if (auto* buf = salt_cvc5::g_ctx->findBufferSafe(&other)) {
        cvc5::Term bv = buf->loadScalar(buf->ptrToByteOffset(&other), 16);
        cvc5::Op op = salt_cvc5::g_ctx->tm.mkOp(
            cvc5::Kind::FLOATINGPOINT_TO_FP_FROM_IEEE_BV, {5, 11});
        cvc5::Term fp = salt_cvc5::g_ctx->tm.mkTerm(op, {bv});
        salt_cvc5::g_scalar_terms.insert_or_assign(this, fp);
    }
}

inline _Float16& _Float16::operator=(const _Float16& other) {
    if (this == &other) return *this;
    value = other.value;
    if (!salt_cvc5::g_ctx) return *this;
    auto it = salt_cvc5::g_scalar_terms.find(&other);
    if (it != salt_cvc5::g_scalar_terms.end()) {
        salt_cvc5::g_scalar_terms.insert_or_assign(this, it->second);
        return *this;
    }
    if (auto* buf = salt_cvc5::g_ctx->findBufferSafe(&other)) {
        cvc5::Term bv = buf->loadScalar(buf->ptrToByteOffset(&other), 16);
        cvc5::Op op = salt_cvc5::g_ctx->tm.mkOp(
            cvc5::Kind::FLOATINGPOINT_TO_FP_FROM_IEEE_BV, {5, 11});
        cvc5::Term fp = salt_cvc5::g_ctx->tm.mkTerm(op, {bv});
        salt_cvc5::g_scalar_terms.insert_or_assign(this, fp);
    } else {
        salt_cvc5::g_scalar_terms.erase(this);
    }
    return *this;
}

inline _Float16::~_Float16() {
    if (!salt_cvc5::g_scalar_terms.empty()) salt_cvc5::g_scalar_terms.erase(this);
}
#endif
