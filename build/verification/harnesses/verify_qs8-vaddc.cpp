// Auto-generated verification harness
#include "salt.hpp"
#include <cassert>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <chrono>
#include <vector>
#include <string>
using namespace salt;

namespace neon_kernel {
/* 

struct xnn_qs8_add_minmax_params {
  struct {
    int8_t a_zero_point;
    int8_t b_zero_point;
    int32_t bias;
    int32_t a_multiplier;
    int32_t b_multiplier;
    int32_t shift;
    int16_t output_zero_point;
    int8_t output_min;
    int8_t output_max;
  } scalar;
};

};
*/
void test_neon(
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

  const int8x8_t va_zero_point = vdup_n_s8(params->scalar.a_zero_point);
  const int32x4_t va_multiplier = vdupq_n_s32(params->scalar.a_multiplier);
  const int32x4_t vright_shift = vdupq_n_s32(-params->scalar.shift);
  const int16x8_t voutput_zero_point = vdupq_n_s16(params->scalar.output_zero_point);
  const int8x8_t voutput_min = vdup_n_s8(params->scalar.output_min);
  const int8x8_t voutput_max = vdup_n_s8(params->scalar.output_max);

  const int32_t vxb = (int32_t) *input_b - (int32_t) params->scalar.b_zero_point;
  const int32_t vb = params->scalar.b_multiplier;
  const int32x4_t vbias = vdupq_n_s32(vxb * vb);

  for (; batch >= 8 * sizeof(int8_t); batch -= 8 * sizeof(int8_t)) {
    const int8x8_t va01234567 = vld1_s8(input_a); input_a += 8;

    const int16x8_t vxa01234567 = vsubl_s8(va01234567, va_zero_point);

    int32x4_t vacc0123 = vmlaq_s32(vbias, vmovl_s16(vget_low_s16(vxa01234567)), va_multiplier);
    int32x4_t vacc4567 = vmlaq_s32(vbias, vmovl_s16(vget_high_s16(vxa01234567)), va_multiplier);

    vacc0123 = vrshlq_s32(vacc0123, vright_shift);
    vacc4567 = vrshlq_s32(vacc4567, vright_shift);

    const int16x8_t vacc01234567 = vqaddq_s16(vcombine_s16(vqmovn_s32(vacc0123), vqmovn_s32(vacc4567)), voutput_zero_point);

    int8x8_t vout01234567 = vqmovn_s16(vacc01234567);

    vout01234567 = vmax_s8(vout01234567, voutput_min);

    vout01234567 = vmin_s8(vout01234567, voutput_max);

    vst1_s8(output, vout01234567); output += 8;
  }
  if XNN_UNLIKELY(batch != 0) {
    {
      const int8x8_t va01234567 = vld1_s8(input_a);

      const int16x8_t vxa01234567 = vsubl_s8(va01234567, va_zero_point);

      int32x4_t vacc0123 = vmlaq_s32(vbias, vmovl_s16(vget_low_s16(vxa01234567)), va_multiplier);
      int32x4_t vacc4567 = vmlaq_s32(vbias, vmovl_s16(vget_high_s16(vxa01234567)), va_multiplier);

      vacc0123 = vrshlq_s32(vacc0123, vright_shift);
      vacc4567 = vrshlq_s32(vacc4567, vright_shift);

      const int16x8_t vacc01234567 = vqaddq_s16(vcombine_s16(vqmovn_s32(vacc0123), vqmovn_s32(vacc4567)), voutput_zero_point);

      int8x8_t vout01234567 = vqmovn_s16(vacc01234567);
      vout01234567 = vmax_s8(vout01234567, voutput_min);
      vout01234567 = vmin_s8(vout01234567, voutput_max);

      if (batch & (4 * sizeof(int8_t))) {
        vst1_lane_u32((void*) output, vreinterpret_u32_s8(vout01234567), 0); output += 4;
        vout01234567 = vext_s8(vout01234567, vout01234567, 4);
      }
      if (batch & (2 * sizeof(int8_t))) {
        vst1_lane_u16((void*) output, vreinterpret_u16_s8(vout01234567), 0); output += 2;
        vout01234567 = vext_s8(vout01234567, vout01234567, 2);
      }
      if (batch & (1 * sizeof(int8_t))) {
        vst1_lane_s8(output, vout01234567, 0);
      }
    }
  }
}
} // namespace neon_kernel

namespace rvv_kernel {
// riscv_vector.h provided by salt.hpp
#include <stddef.h>
#include <stdint.h>
#include <assert.h>

void test_rvv(
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

  const int32_t vxb = (int32_t) *input_b - (int32_t) params->scalar.b_zero_point;
  const int32_t vb = params->scalar.b_multiplier;
  const int32_t vbias_val = vxb * vb;

  for (; batch > 0; ) {
    size_t vl = __riscv_vsetvl_e8m2(batch);

    vint8m2_t va = __riscv_vle8_v_i8m2(input_a, vl);
    input_a += vl;

    vint16m4_t vxa = __riscv_vwsub_vx_i16m4(va, (int8_t)params->scalar.a_zero_point, vl);

    vint32m8_t vxa32 = __riscv_vsext_vf2_i32m8(vxa, vl);
    vint32m8_t vbias_vec = __riscv_vmv_v_x_i32m8(vbias_val, vl);
    vint32m8_t vacc = __riscv_vmacc_vx_i32m8(vbias_vec, params->scalar.a_multiplier, vxa32, vl);

    vacc = __riscv_vssra_vx_i32m8(vacc, params->scalar.shift, __RISCV_VXRM_RNU, vl);

    vint16m4_t vacc16 = __riscv_vnclip_wx_i16m4(vacc, 0, __RISCV_VXRM_RNU, vl);
    vacc16 = __riscv_vsadd_vx_i16m4(vacc16, (int16_t)params->scalar.output_zero_point, vl);

    vint8m2_t vout = __riscv_vnclip_wx_i8m2(vacc16, 0, __RISCV_VXRM_RNU, vl);

    vout = __riscv_vmax_vx_i8m2(vout, (int8_t)params->scalar.output_min, vl);
    vout = __riscv_vmin_vx_i8m2(vout, (int8_t)params->scalar.output_max, vl);

    __riscv_vse8_v_i8m2(output, vout, vl);
    output += vl;
    batch -= vl;
  }
}
} // namespace rvv_kernel

bool verify(size_t batch, size_t vlen, const struct xnn_qs8_add_minmax_params& params) {
    VerificationContext ctx(vlen);
    g_ctx = &ctx;
    size_t padded = ((batch + 15) / 16) * 16 + 16;

    std::vector<int8_t> input_a_arr(padded);
    int8_t input_b_val = 0;
    std::vector<int8_t> output_neon_arr(padded);
    std::vector<int8_t> output_rvv_arr(padded);

    auto& sym_input_a = ctx.registerBuffer("input_a", padded * 1);
    sym_input_a.bind(input_a_arr.data());
    auto& sym_input_b = ctx.registerBuffer("input_b", 1);
    sym_input_b.bind(&input_b_val);
    auto& sym_output_neon = ctx.registerBuffer("output_neon", padded * 1);
    sym_output_neon.bind(output_neon_arr.data());
    auto& sym_output_rvv = ctx.registerBuffer("output_rvv", padded * 1);
    sym_output_rvv.bind(output_rvv_arr.data());

    neon_kernel::test_neon(batch, input_a_arr.data(), &input_b_val, output_neon_arr.data(), &params);
    rvv_kernel::test_rvv(batch, input_a_arr.data(), &input_b_val, output_rvv_arr.data(), &params);

    Term equiv = buffers_equal(ctx.tm, sym_output_neon, sym_output_rvv,
                                batch, 1, ElementKind::SINT);
    ctx.solver->assert_formula(ctx.tm.mk_term(Kind::NOT, {equiv}));
    Result result = ctx.solver->check_sat();

    if (result == Result::UNSAT) {
        printf("{\"status\":\"VERIFIED\",\"batch\":%zu,\"vlen\":%zu}\n", batch, vlen);
        return true;
    }

    size_t fi = 0;
    const char* fail_buf = "";
    for (size_t _i = 0; _i < batch; _i++) {
        Term _n = ctx.solver->get_value(sym_output_neon.loadScalar(_i * 1, 8));
        Term _r = ctx.solver->get_value(sym_output_rvv.loadScalar(_i * 1, 8));
        if (_n.value<std::string>(10) != _r.value<std::string>(10)) { fi = _i; fail_buf = "output"; goto found_mismatch; }
    }
    found_mismatch:
    printf("{\"status\":\"COUNTEREXAMPLE\",\"batch\":%zu,\"vlen\":%zu,\"fail_index\":%zu,\"fail_output\":\"%s\",", batch, vlen, fi, fail_buf);
    printf("\"input_a_at_fail\":%s,", ctx.solver->get_value(sym_input_a.loadScalar(fi * 1, 8)).value<std::string>(10).c_str());
    printf("\"input_b\":%s,", ctx.solver->get_value(sym_input_b.loadScalar(0, 8)).value<std::string>(10).c_str());
    if (std::string(fail_buf) == "output") {
        printf("\"neon_out\":%s,\"rvv_out\":%s",
               ctx.solver->get_value(sym_output_neon.loadScalar(fi * 1, 8)).value<std::string>(10).c_str(),
               ctx.solver->get_value(sym_output_rvv.loadScalar(fi * 1, 8)).value<std::string>(10).c_str());
    }
    printf("}\n");
    return false;
}

int main(int argc, char** argv) {
    if (argc < 3) { fprintf(stderr, "Usage: %s <start> <end> [vlen] [timeout]\n", argv[0]); return 2; }
    size_t start = (size_t)atoi(argv[1]);
    size_t end   = (size_t)atoi(argv[2]);
    size_t vlen  = (argc > 3) ? (size_t)atoi(argv[3]) : 256;
    double timeout = (argc > 4) ? atof(argv[4]) : 0;
    struct xnn_qs8_add_minmax_params params{};
    params.scalar.a_zero_point = 0;
    params.scalar.b_zero_point = 0;
    params.scalar.bias = 0;
    params.scalar.a_multiplier = 3;
    params.scalar.b_multiplier = 2;
    params.scalar.shift = 4;
    params.scalar.output_zero_point = 0;
    params.scalar.output_min = -128;
    params.scalar.output_max = 127;
    for (size_t batch = start; batch <= end; batch++) {
        auto t0 = std::chrono::steady_clock::now();
        bool ok = verify(batch, vlen, params);
        double secs = std::chrono::duration<double>(std::chrono::steady_clock::now() - t0).count();
        if (!ok) return 1;
        if (timeout > 0 && secs > timeout) {
            printf("{\"status\":\"TIMEOUT\",\"batch\":%zu,\"seconds\":%.1f}\n", batch, secs);
            return 0;
        }
    }
    printf("{\"status\":\"ALL_VERIFIED\",\"start\":%zu,\"end\":%zu}\n", start, end);
    return 0;
}
