# Proof task: assembly-level qu8-rsum total correctness

Create `Proof.lean` in this directory, importing only `Spec` and `ProofSupport`.
Prove `theorem Kernel.correctness : Kernel.correctnessClaim`.
You may define ghost functions, invariants and helper lemmas in Proof.lean.
Do not change the frozen files in ProofTask.json, including Machine, Impl, Spec,
ReductionContract, ProofSupport, the original assembly or source map.
No `sorry`, `admit`, new axioms, `native_decide`, unsafe code, elaborator escapes,
or weakening/replacing the specification. Allowed axioms: propext, Classical.choice,
Quot.sound. A compiling partial proof is not successful kernel correctness.

The proposition covers arbitrary initial registers/vector bits/memory satisfying
Pre, every legal VLEN and AVL/VLMAX selector, every per-instruction/lane agnostic
tail oracle, and every positive representable batch in the supplied memory.
It requires normal termination, modular uint32 output, the memory frame and
preservation of ABI registers. No bounded execution fuel appears in the claim.
There is no input/output disjointness assumption. The sole store occurs after
all input reads, including the load of old output.

Useful proof direction (hints, NOT hypotheses): at the loop header the sum of
all VLMAX accumulator lanes plus the sum of unread input equals the sum of
initial input. Input memory and output memory are unchanged until the final
store. The accumulator is v8..v15, loaded bytes are v2..v3, widened values are
v16..v23. `vle8.v` EEW is 8 although current SEW is 32. The loop uses `tu`;
inactive accumulator lanes must survive the last partial iteration. Final
reduction reads full VLMAX. `lw`, `vmv.x.s`, `addw` sign extension is discarded
by the final 32-bit store, which implements modular addition.

Use PC-dependent invariants with the generic `Assembly.total_of_rank`, or prove
basic-block summaries and compose `Assembly.Exec.next`. Do not unfold a fixed
number of iterations as a substitute for an arbitrary-input proof. Read actual
PCs from Impl.lean; the translator did not infer any loop invariant.

Run `python3 ../check_proof.py --out .` from the default out directory (or use
the absolute checker path). The checker rebuilds frozen dependencies in a fresh
temporary directory and checks the exact goal and transitive axioms.

Trust boundary: the result is relative to the handwritten Assembly.Machine
semantics. It is not a proof of the Python importer, GCC, an ELF decoder, Sail
translation, the original NEON program, or real hardware conformance.
