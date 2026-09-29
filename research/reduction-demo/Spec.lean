-- Frozen, proof-free, exactly ONE public spec. No assumed invariant/refinement.
import Models

namespace SALT.Corpus.qu8rsum

def completeValueEquivalenceClaim : Prop :=
  ∀ (input overread : List Byte) (oldOutput : Word)
    (vlmax : Nat) (chunks : List Nat),
    0 < input.length →
    15 ≤ overread.length →
    ScheduleOK input.length vlmax chunks →
    neonValueLoopWithOverreadFromIntrinsics input overread oldOutput =
      rvvValueLoopFromIntrinsics input oldOutput vlmax chunks

end SALT.Corpus.qu8rsum
