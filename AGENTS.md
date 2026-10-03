# Project handoff

This repository contains several verification approaches and historical experiments. For the current work, read [SERVER_HANDOFF.zh-CN.md](SERVER_HANDOFF.zh-CN.md) first, then:

- [Sail checkpoint](research/sail-tooling-gap/CHECKPOINT.md)
- [Proof status](research/sail-tooling-gap/presentation/STATUS.md)
- [Kernel implementation and evidence](research/sail-tooling-gap/kernel-e2e/README.zh-CN.md)
- [Research ideas](research/ideas/001-cross-isa-spec-interface.zh-CN.md) and [small-vl reference proposal](research/ideas/002-rvv-small-vl-reference.zh-CN.md)

As of this handoff, active work is on `feat/assembly-reduction-lean` in the user's fork `Etha-Sun/SALTy-rn`; `main` is older. Check the actual branch and status before edits. Preserve unrelated local work.

The separate `proof/sum` branch packages completed Coq proofs under `coq/neon-rvv-reduction/`, with its own setup/build/check scripts. Its 2026-10-02 `verification.json` records fresh compilation and recursive checking of 131 modules. Read that branch's README as well; it excludes the research branch's conditional RVV program theorems. The existing `build/pr-sum` worktree has uncommitted discussion notes and diagrams listed in the handoff. Preserve them through the private workspace backup.

## Evidence and research scope

- The simplified NEON kernel has historical checked partial-correctness proofs. The RVV kernel theorem is conditional on the explicit `Hload` contract. Load cases VL=2..8 and final cross-ISA program equivalence remain unfinished.
- Current kernel RVV results fix VLEN=256, SEW=32, LMUL=1. Arbitrary total input length does not mean arbitrary hardware VLEN. Earlier instruction demos use different parameters.
- A generated trace, a file containing `Qed`, or a closed `Print Assumptions` report does not establish unconditional program correctness. Keep explicit theorem arguments, memory conditions, termination boundaries, and source-to-model assumptions visible.
- Historical checker records are not new verification runs. Preserve their provenance; distinguish environment failures from proof failures. Do not silently weaken specifications, remove semantic constraints, or introduce axioms to obtain success.
- Preserve the user's original ideas separately from assistant interpretation, evidence, hypotheses, and candidate experiments. The two idea cards contain open questions, not adopted project decisions. Investigate project context and primary sources when assessing them.

## Environment and validation

- Use the relevant directory's `lean-toolchain`; both Lean 4.29.0 and 4.29.1 occur in this repository.
- In the original research directories, run Coq through `research/sail-tooling-gap/islaris-reduction/env-exec.sh`. The `proof/sum` package has its own environment and build instructions. Expected research-environment versions and external file hashes are in `research/migration/environment.json`.
- External `vendor/` toolchains are not tracked. A fresh Git clone is not a configured proof environment. The opam export is a `--full` inventory, not a successfully frozen or freshly rebuilt environment.
- Check imports and compile dependencies before consumers. Existing replay/check scripts can overwrite historical result JSON and logs; preserve those records before rerunning them.
- Large RVV checks have consumed hundreds of GiB. Begin with a small check and finite budgets after checking available memory; CPU thread count alone is not a safe concurrency setting.
- Prefer Chinese when collaborating with the user. Summarize what is established, what remains uncertain, and the next concrete step.
