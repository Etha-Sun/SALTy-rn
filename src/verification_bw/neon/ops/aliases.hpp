#pragma once
// Complete NEON type aliases (vectors, tuples, poly/float64/mfloat8/bf16,
// scalar element types). Names already declared in symbolic_vector.hpp /
// neon/intrinsics.hpp are skipped (they remain visible from those headers).
#include "../intrinsics.hpp"
namespace salt {

// ---- scalar element aliases ----
using float16_t  = salt_float16;
using float32_t  = float;
using float64_t  = double;
using poly8_t    = uint8_t;
using poly16_t   = uint16_t;
using poly64_t   = uint64_t;
using poly128_t  = unsigned __int128;
using mfloat8_t  = uint8_t;
using fpm_t      = uint64_t;

// ---- vector aliases ----
using float64x1_t    = NeonVector<64, 1>;
using float64x2_t    = NeonVector<64, 2>;
using poly8x8_t      = NeonVector<8, 8>;
using poly8x16_t     = NeonVector<8, 16>;
using poly16x4_t     = NeonVector<16, 4>;
using poly16x8_t     = NeonVector<16, 8>;
using poly64x1_t     = NeonVector<64, 1>;
using poly64x2_t     = NeonVector<64, 2>;
using mfloat8x8_t    = NeonVector<8, 8>;
using mfloat8x16_t   = NeonVector<8, 16>;

// ---- tuple aliases (vector x {2,3,4}) ----
using int8x8x3_t       = VectorTuple<int8x8_t, 3>;
using int8x8x4_t       = VectorTuple<int8x8_t, 4>;
using int8x16x3_t      = VectorTuple<int8x16_t, 3>;
using int8x16x4_t      = VectorTuple<int8x16_t, 4>;
using int16x4x3_t      = VectorTuple<int16x4_t, 3>;
using int16x4x4_t      = VectorTuple<int16x4_t, 4>;
using int16x8x3_t      = VectorTuple<int16x8_t, 3>;
using int16x8x4_t      = VectorTuple<int16x8_t, 4>;
using int32x2x3_t      = VectorTuple<int32x2_t, 3>;
using int32x2x4_t      = VectorTuple<int32x2_t, 4>;
using int32x4x3_t      = VectorTuple<int32x4_t, 3>;
using int32x4x4_t      = VectorTuple<int32x4_t, 4>;
using int64x1x2_t      = VectorTuple<int64x1_t, 2>;
using int64x1x3_t      = VectorTuple<int64x1_t, 3>;
using int64x1x4_t      = VectorTuple<int64x1_t, 4>;
using int64x2x2_t      = VectorTuple<int64x2_t, 2>;
using int64x2x3_t      = VectorTuple<int64x2_t, 3>;
using int64x2x4_t      = VectorTuple<int64x2_t, 4>;
using uint8x8x2_t      = VectorTuple<uint8x8_t, 2>;
using uint8x8x3_t      = VectorTuple<uint8x8_t, 3>;
using uint8x8x4_t      = VectorTuple<uint8x8_t, 4>;
using uint8x16x2_t     = VectorTuple<uint8x16_t, 2>;
using uint8x16x3_t     = VectorTuple<uint8x16_t, 3>;
using uint16x4x2_t     = VectorTuple<uint16x4_t, 2>;
using uint16x4x3_t     = VectorTuple<uint16x4_t, 3>;
using uint16x4x4_t     = VectorTuple<uint16x4_t, 4>;
using uint16x8x2_t     = VectorTuple<uint16x8_t, 2>;
using uint16x8x3_t     = VectorTuple<uint16x8_t, 3>;
using uint16x8x4_t     = VectorTuple<uint16x8_t, 4>;
using uint32x2x2_t     = VectorTuple<uint32x2_t, 2>;
using uint32x2x3_t     = VectorTuple<uint32x2_t, 3>;
using uint32x2x4_t     = VectorTuple<uint32x2_t, 4>;
using uint32x4x2_t     = VectorTuple<uint32x4_t, 2>;
using uint32x4x3_t     = VectorTuple<uint32x4_t, 3>;
using uint32x4x4_t     = VectorTuple<uint32x4_t, 4>;
using uint64x1x2_t     = VectorTuple<uint64x1_t, 2>;
using uint64x1x3_t     = VectorTuple<uint64x1_t, 3>;
using uint64x1x4_t     = VectorTuple<uint64x1_t, 4>;
using uint64x2x2_t     = VectorTuple<uint64x2_t, 2>;
using uint64x2x3_t     = VectorTuple<uint64x2_t, 3>;
using uint64x2x4_t     = VectorTuple<uint64x2_t, 4>;
using float16x4x3_t    = VectorTuple<float16x4_t, 3>;
using float16x4x4_t    = VectorTuple<float16x4_t, 4>;
using float16x8x2_t    = VectorTuple<float16x8_t, 2>;
using float16x8x3_t    = VectorTuple<float16x8_t, 3>;
using float16x8x4_t    = VectorTuple<float16x8_t, 4>;
using float32x2x2_t    = VectorTuple<float32x2_t, 2>;
using float32x2x3_t    = VectorTuple<float32x2_t, 3>;
using float32x2x4_t    = VectorTuple<float32x2_t, 4>;
using float32x4x2_t    = VectorTuple<float32x4_t, 2>;
using float32x4x3_t    = VectorTuple<float32x4_t, 3>;
using float32x4x4_t    = VectorTuple<float32x4_t, 4>;
using float64x1x2_t    = VectorTuple<float64x1_t, 2>;
using float64x1x3_t    = VectorTuple<float64x1_t, 3>;
using float64x1x4_t    = VectorTuple<float64x1_t, 4>;
using float64x2x2_t    = VectorTuple<float64x2_t, 2>;
using float64x2x3_t    = VectorTuple<float64x2_t, 3>;
using float64x2x4_t    = VectorTuple<float64x2_t, 4>;
using poly8x8x2_t      = VectorTuple<poly8x8_t, 2>;
using poly8x8x3_t      = VectorTuple<poly8x8_t, 3>;
using poly8x8x4_t      = VectorTuple<poly8x8_t, 4>;
using poly8x16x2_t     = VectorTuple<poly8x16_t, 2>;
using poly8x16x3_t     = VectorTuple<poly8x16_t, 3>;
using poly8x16x4_t     = VectorTuple<poly8x16_t, 4>;
using poly16x4x2_t     = VectorTuple<poly16x4_t, 2>;
using poly16x4x3_t     = VectorTuple<poly16x4_t, 3>;
using poly16x4x4_t     = VectorTuple<poly16x4_t, 4>;
using poly16x8x2_t     = VectorTuple<poly16x8_t, 2>;
using poly16x8x3_t     = VectorTuple<poly16x8_t, 3>;
using poly16x8x4_t     = VectorTuple<poly16x8_t, 4>;
using poly64x1x2_t     = VectorTuple<poly64x1_t, 2>;
using poly64x1x3_t     = VectorTuple<poly64x1_t, 3>;
using poly64x1x4_t     = VectorTuple<poly64x1_t, 4>;
using poly64x2x2_t     = VectorTuple<poly64x2_t, 2>;
using poly64x2x3_t     = VectorTuple<poly64x2_t, 3>;
using poly64x2x4_t     = VectorTuple<poly64x2_t, 4>;
using bfloat16x4x2_t   = VectorTuple<bfloat16x4_t, 2>;
using bfloat16x4x3_t   = VectorTuple<bfloat16x4_t, 3>;
using bfloat16x4x4_t   = VectorTuple<bfloat16x4_t, 4>;
using bfloat16x8x2_t   = VectorTuple<bfloat16x8_t, 2>;
using bfloat16x8x3_t   = VectorTuple<bfloat16x8_t, 3>;
using bfloat16x8x4_t   = VectorTuple<bfloat16x8_t, 4>;
using mfloat8x8x2_t    = VectorTuple<mfloat8x8_t, 2>;
using mfloat8x8x3_t    = VectorTuple<mfloat8x8_t, 3>;
using mfloat8x8x4_t    = VectorTuple<mfloat8x8_t, 4>;
using mfloat8x16x2_t   = VectorTuple<mfloat8x16_t, 2>;
using mfloat8x16x3_t   = VectorTuple<mfloat8x16_t, 3>;
using mfloat8x16x4_t   = VectorTuple<mfloat8x16_t, 4>;

} // namespace salt
