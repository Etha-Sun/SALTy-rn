# Frozen reduction proof experiment

You are the proof-generation LLM. Implement only `Proof.lean`, starting with
`import Spec`, and use namespace `SALT.Corpus.qu8rsum`.

The sole public target is:

```lean
theorem completeValueEquivalence : completeValueEquivalenceClaim := by ...
```

Read `Models.lean`, `Spec.lean`, and `ProofTask.json`. Do not modify them, the C
sources, or the proposition. No assumed loop invariant, refinement lemma,
`sorry`, custom axiom, `native_decide`, or trusted evaluator escape is allowed.
Helper predicates and lemmas may be introduced and proved in `Proof.lean`.

The models are a manual, lane-preserving translation of the corpus `qu8-rsum`.
They intentionally retain NEON's 2048-byte outer groups, its 128 pairwise
16-byte inner updates, and masked overread tail. RVV retains the full `_tu`
accumulator and an arbitrary bounded positive partition. The output is updated,
not overwritten. Arithmetic is BV8/BV16/BV32, not an unbounded mathematical sum.

Human/modeling hints supplied before search (NOT established facts/axioms):

- A ghost scalar sum in the proof can normalize different lane layouts. Do not
  erase real lane state from either model.
- RVV invariant: modular sum of accumulator = sum of consumed bytes widened to
  BV32; accumulator length remains vlmax; unread suffix and input offset match
  the consumed prefix; batch is the remaining count; output unchanged until exit.
- NEON inner invariant after t <= 128 loads: each BV16 lane's natural value is
  at most 510*t <= 65280 < 65536. This justifies widening without lost carries.
- NEON needs inner sum preservation, pairwise widening into BV32, outer prefix
  accumulation, and masked-tail cancellation of arbitrary overread bytes.
- The previous elementwise `map` theorem does not apply to a stateful reduction.

Compile with installed Lean 4.29.1, `LEAN_PATH=.`. Do not download dependencies.
Use only Std. Test incrementally. Scratch files can live under a fresh /tmp
directory; only the designated proof source may be changed in this task folder.
Report elapsed time, repair rounds if tracked, proved intermediate results,
axiom audit, and the exact remaining obligation if the full proof does not close.
This is one guided pilot, not a statistical benchmark of proof-generation rates.
