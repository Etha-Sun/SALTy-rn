import Machine

namespace Assembly

theorem min_legalVL (avl cap : Nat) : legalVL avl cap (min avl cap) := by
  unfold legalVL
  split
  · rename_i h
    exact Nat.min_eq_left h
  · rename_i h
    rw [Nat.min_eq_right (by omega)]
    split <;> omega

/-- In particular, the universal configuration precondition is inhabited. -/
theorem config128_valid : ({ vlen := 128 } : Config).Valid := by
  constructor
  · exact ⟨7, by decide, by decide, by decide⟩
  · intro avl cap _
    exact min_legalVL avl cap

/-- A generic total-correctness rule for arbitrary control-flow graphs. Inv may
    depend on PC; rank counts remaining work, not syntactic loop nesting. -/
theorem total_of_rank (c : Config) (p : Program)
    (Inv Q : State → Prop) (rank : State → Nat)
    (progress : ∀ s, Inv s →
      (∃ t, step c p s = .ok (.returned t) ∧ Q t) ∨
      (∃ u, step c p s = .ok (.next u) ∧ Inv u ∧ rank u < rank s))
    (s : State) (initial : Inv s) : ∃ t, Exec c p s t ∧ Q t := by
  suffices h : ∀ n s, rank s = n → Inv s → ∃ t, Exec c p s t ∧ Q t from
    h (rank s) s rfl initial
  intro n
  induction n using Nat.strongRecOn with
  | ind n ih =>
    intro s hs hi
    rcases progress s hi with stop | advance
    · rcases stop with ⟨t, ht, hq⟩
      exact ⟨t, .returned ht, hq⟩
    · rcases advance with ⟨u, hu, hui, hlt⟩
      obtain ⟨t, ht, hq⟩ := ih (rank u) (by omega) u rfl hui
      exact ⟨t, .next hu ht, hq⟩

end Assembly
