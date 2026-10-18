#include <cstdint>
#include <iostream>

struct xnn_float16 { uint16_t value; };
#include SALT_NEON_CORE_HEADER

using namespace salt_cvc5;

int main() {
    VerificationContext context(128);
    g_ctx = &context;
    auto& tm = context.tm;
    std::array<Term, 4> a, b;
    // NaN in either operand, two NaNs, then opposite signed zeros.
    uint32_t av[] = {0x7fc00000, 0x3f800000, 0xffc00001, 0x80000000};
    uint32_t bv[] = {0x3f800000, 0x7fc00000, 0x7fc00001, 0x00000000};
    for (size_t i = 0; i < 4; ++i) {
        a[i] = tm.mkBitVector(32, av[i]);
        b[i] = tm.mkBitVector(32, bv[i]);
    }
    float32x4_t left(tm, a), right(tm, b);
    auto minimum = vminq_f32(left, right);
    auto maximum = vmaxq_f32(left, right);
    std::vector<Term> required;
    for (size_t i = 0; i < 3; ++i) {
        required.push_back(tm.mkTerm(Kind::FLOATINGPOINT_IS_NAN,
            {load_as_fp32(tm, minimum.getLane(i))}));
        required.push_back(tm.mkTerm(Kind::FLOATINGPOINT_IS_NAN,
            {load_as_fp32(tm, maximum.getLane(i))}));
    }
    required.push_back(tm.mkTerm(Kind::EQUAL, {
        load_as_fp32(tm, minimum.getLane(3)), load_as_fp32(tm, a[3])}));
    required.push_back(tm.mkTerm(Kind::EQUAL, {
        load_as_fp32(tm, maximum.getLane(3)), load_as_fp32(tm, b[3])}));
    auto property = tm.mkTerm(Kind::AND, required);
    context.solver->assertFormula(tm.mkTerm(Kind::NOT, {property}));
    auto result = context.solver->checkSat();
    std::cout << "negated_NaN_and_signed_zero_contract=" << result << '\n';
    if (result.isSat()) {
        for (size_t i = 0; i < required.size(); ++i)
            std::cout << "condition_" << i << '='
                      << context.solver->getValue(required[i]) << '\n';
    }
    g_ctx = nullptr;
    return result.isUnsat() ? 0 : 1;
}
