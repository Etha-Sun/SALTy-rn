# NEON/RVV Sail verification checkpoint — 2026-09-28

Start with [the presentation directory](presentation/README.md), [the short English report](presentation/GROUP_MEETING.md), or [the detailed experiment notes](kernel-e2e/README.zh-CN.md).

This checkpoint preserves the accepted Coq proof sources and their local source dependencies, the generated Coq semantics for the simplified kernels, extraction/checking scripts, configuration and historical checker records, and the presentation materials. External toolchains, compiled Coq objects, large execution logs, and unsuccessful diagnostic variants are not part of this checkpoint.

## What is established

- The simplified 20-instruction NEON kernel satisfies the exact modular byte-sum specification and preserves its input memory, for arbitrary legal input lengths.
- Several RVV instructions and instruction sequences have checked contracts. Widening and vector addition cover VL=0..8; final reduction uses VL=8.
- The RVV load `vle8.v` has checked cases for VL=0 and VL=1. VL=2..8 remain outstanding.
- The RVV loop, kernel, and final shared-specification theorem have checked proofs **conditional on the general load contract `Hload`**. They are not unconditional program-correctness results.
- NEON block memory has been related to a flat byte array, and the RVV mathematical result has been related to the common byte-sum specification. The final cross-ISA program-equivalence theorem is still outstanding.

All RVV results fix VLEN=256, SEW=32, LMUL=1. Arbitrary legal total input length does not mean a proof parameterized over all hardware VLENs. The current RVV memory contract requires seven padding bytes; input-domain alignment remains part of the task. Program contracts establish partial correctness, not a separate termination or whole-machine adequacy theorem. These kernels are simplified assembly programs; their equivalence to the original C kernels has not been established here.

## How the files fit together

- `kernel-e2e/neon-simple.S`, `rvv-simple.S`: complete simplified kernels.
- `kernel-e2e/simple/generated/{neon,rvv}/*.v`: instruction traces represented in Coq.
- `kernel-e2e/Programs.v`: instruction address maps for the complete kernels.
- `kernel-e2e/KernelSpec.v`: shared mathematical specification.
- `kernel-e2e/NeonByteSpec.v`, `RvvByteSpecConditional.v`: ISA-specific program contracts expressed using the shared specification.
- `kernel-e2e/results/`: prior compiler/extraction/check records. `STATUS.json` is the historical end-of-run audit, including failed attempts whose sources are intentionally not all retained in this commit.
- `presentation/`: organized reading copies, all 39 instruction trace pairs, and a manifest with original paths and hashes. Large load trace text is retained losslessly as gzip.

`Print Assumptions` reporting “Closed under the global context” excludes extra global axioms for that theorem but does not discharge explicit theorem arguments such as `Hload`. The standalone load permits VL=0. The kernel loop separately proves that positive remaining length yields a positive selected VL.

## Rechecking and dependencies

The source checkpoint uses the existing Islaris/Iris/Coq environment under `vendor/`, via `islaris-reduction/env-exec.sh`. These external dependencies are not vendored in Git. Assembly/extraction additionally uses local LLVM and RISC-V tools under the neighboring `sail-binary-reduction/vendor/` directory and the Sail IR snapshots referenced by the extraction wrappers. Historical commands and hashes are retained in the result JSON files and `presentation/05_evidence/check-records.json`.

This is not a fresh-clone, one-command build. In the existing configured environment, `kernel-e2e/check.py` runs ordinary `coqc`; `independent_check.py` invokes `coqchk`. Dependencies must be compiled before their consumers, and the `logs/` and `results/` directories must exist. Re-running the audit without the compiled objects will not reproduce the archived success status until those objects are rebuilt.

The commit preparation checks file hashes, source dependency closure, generated-trace import records, and presentation links. It does not repeat the hours-long Coq proof checks; the retained results are historical evidence, not new runs. The extra independent `coqchk` for the VL=0 load timed out, although its ordinary `coqc` compilation succeeded. VL=1 has ordinary `coqc` success without a separate independent check.
