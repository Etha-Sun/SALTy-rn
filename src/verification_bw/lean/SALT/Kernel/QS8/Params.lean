import SALT.Basic

namespace SALT.Kernel.QS8

open SALT

structure QS8AddMinmaxParams where
  a_zero_point     : BitVec 8
  b_zero_point     : BitVec 8
  bias             : BitVec 32
  a_multiplier     : BitVec 32
  b_multiplier     : BitVec 32
  shift            : BitVec 32
  output_zero_point : BitVec 16
  output_min       : BitVec 8
  output_max       : BitVec 8
  deriving Repr, DecidableEq

def WellFormedParams (p : QS8AddMinmaxParams) : Prop :=
  p.output_min.toInt ≤ p.output_max.toInt
  ∧ p.shift.toNat ≤ 31
  ∧ p.a_multiplier.toInt > 0
  ∧ p.b_multiplier.toInt > 0

end SALT.Kernel.QS8
