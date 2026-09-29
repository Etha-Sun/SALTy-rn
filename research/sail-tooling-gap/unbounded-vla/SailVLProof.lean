import SailVLExtract
import Chunked

/- The statement is about the EXACT emitted pure helper, not execute(VSETVLI). -/
set_option autoImplicit false
open SailVLExtract

theorem emitted_vl_is_min (avl : BitVec 64) (cap : Nat) :
    calculate_new_vl avl cap = min avl.toNat cap := by
  simp [calculate_new_vl, vl_use_ceil, Sail.BitVec.toNatInt, Nat.min_def]

theorem emitted_vl_progress (avl : BitVec 64) (cap : Nat)
    (ha : 0 < avl.toNat) (hc : 0 < cap) :
    0 < calculate_new_vl avl cap ∧ calculate_new_vl avl cap ≤ avl.toNat := by
  rw [emitted_vl_is_min]
  omega

theorem emitted_vl_for_representable_length (n cap : Nat) (hn : n < 2 ^ 64) :
    calculate_new_vl (BitVec.ofNat 64 n) cap = min n cap := by
  rw [emitted_vl_is_min]
  simp [BitVec.toNat_ofNat, Nat.mod_eq_of_lt hn]

#print axioms emitted_vl_is_min
#print axioms emitted_vl_progress
#print axioms emitted_vl_for_representable_length
