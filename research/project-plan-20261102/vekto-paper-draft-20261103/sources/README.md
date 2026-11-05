# Source provenance

This package uses project decisions and primary sources read during the preceding planning and feasibility work. It does not claim a new exhaustive literature review or fresh proof execution.

## Published optimized cohort

- Repository: https://github.com/keaganchern/optimized-rvv-kernels
- Commit: `80feb4564cb470de301062109b6f89db672bdf9d`.
- The fixed README describes 35 final outputs from SALTyRN and its Autocomp-based optimization stage, including bounded equivalence checks. The full tree was read and its 35 C file identities were recorded in `data/source-inventory.json`.
- Source NEON, initial RVV and harness pairing remain pending per kernel.

## XNNPACK

Fixed source commit: `23dd5070fa002ef0b124817798ae090fa29f9653`.

The running example was read from `src/f32-vunary/gen/f32-vabs-rvv-u1v.c` and `src/f32-vunary/gen/f32-vabs-neon.c`. Dispatch and comparison claims use `src/configs/unary-elementwise-config.c`, `test/vunary-microkernel-tester.h`, `test/unary-ops.h`, and `test/xN-transpose.cc`. The Softmax discussion uses `src/operator-run.c`, `src/operators/softmax-nc.c`, `src/configs/raddstoreexpminusmax-config.c`, and `test/operators/softmax-operator-tester.h`. Direct URLs appear in the manuscripts. No new numerical counterexample was generated during drafting.

## Verification abstraction

The Arcadia-Y verification branch was read at `4a0627dc72d39de8b8e5c1971bcc23b267e2d4ca`, including its README, extraction README, CByte/Behavior definitions and S8Clamp result interface. Its reported proof counts were not independently rerun and are not used as new evaluation results.

Local Sail context came from the project handoff, checkpoint, presentation status and bridge audit. These distinguish conditional RVV program results from the completed proof/sum package, and distinguish platform-initialization fixes from remaining proof obligations. The manuscript uses this history to explain design choices, not to claim a measured comparison between verification layers.

## SALTyRN performance environment

The archived 16-page SALTyRN paper was read locally at `research/sol-pipeline-comparison-20261030/round5-paper-bottom3/paper/SaltyRN-original.pdf`. Its Infrastructure section describes Apple M1 Pro and Saturn/Shuttle with VLEN 512 and a 256-bit datapath, evaluated using FireSim on U250. That paper uses a 32-subject cohort, whereas the final-output repository contains 35 files. The manuscript keeps these versions distinct.

The public author report is linked in reference 2. The PDF itself is not redistributed here. A SHA-256 for the locally read PDF is recorded in `source-hashes.json`. This preserves the identity of the consulted artifact without implying that the new 35-subject evaluation has already matched its setup.

## Writing and formatting references

The previously downloaded MetaLift and verification-tools ECOOP papers were inspected again for method presentation, table layout and captions. Autocomp, Tenspiler and GraphicsFuzz provide the limited related-work context included in the draft. Bibliographic entries were reused from the existing primary-source reading package. This is not a claim of complete coverage of translation validation, SIMD semantics or related proof systems.

The eight user requirements are preserved in the bundled skill. Humanizer's academic-manuscript guidance was read together with paper-outline, write and figure-polish. User instructions override any conflicting generic paragraph-length rule, sample prose or promotional caption requirement.
