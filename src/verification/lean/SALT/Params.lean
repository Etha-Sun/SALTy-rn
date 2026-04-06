/-
  SALT.Params — QS8 add-with-constant parameter structure and well-formedness predicate.

  Faithfully mirrors the C struct xnn_qs8_add_minmax_params from XNNPACK.
  All fields use BitVec at their exact hardware widths.
-/
import SALT.Basic

namespace SALT

/-- Parameters for quantized int8 add-with-constant kernel.
    Matches `struct xnn_qs8_add_minmax_params { struct { ... } scalar; }`. -/
structure QS8AddMinmaxParams where
  a_zero_point     : BitVec 8    -- int8_t
  b_zero_point     : BitVec 8    -- int8_t
  bias             : BitVec 32   -- int32_t
  a_multiplier     : BitVec 32   -- int32_t
  b_multiplier     : BitVec 32   -- int32_t
  shift            : BitVec 32   -- int32_t (NOT Nat — must match the real field)
  output_zero_point : BitVec 16  -- int16_t
  output_min       : BitVec 8    -- int8_t
  output_max       : BitVec 8    -- int8_t
  deriving Repr, DecidableEq

/-- Well-formedness predicate: constraints the bounded verifier already enforces
    via SMT assertions (see param_configs.py:413-420).
    All theorems carry `(hwf : WellFormedParams p)` as an explicit hypothesis. -/
def WellFormedParams (p : QS8AddMinmaxParams) : Prop :=
  p.output_min.toInt ≤ p.output_max.toInt       -- BV_SLE output_min output_max
  ∧ p.shift.toNat ≤ 31                          -- BV_SGE shift 0 (trivial for Nat) ∧ BV_SLE shift 31
  ∧ p.a_multiplier.toInt > 0                     -- BV_SGT a_multiplier 0
  ∧ p.b_multiplier.toInt > 0                     -- BV_SGT b_multiplier 0

/-- Compute the pre-loop bias value: `(input_b - b_zero_point) * b_multiplier + bias`.
    Both kernels compute this identically before entering the main loop.
    All arithmetic is wrapping 32-bit (BitVec 32 semantics). -/
def computeBias (p : QS8AddMinmaxParams) (input_b : BitVec 8) : BitVec 32 :=
  let vxb : BitVec 32 := (sext input_b 32) - (sext p.b_zero_point 32)
  vxb * p.b_multiplier

end SALT
