# QU8 reduction checkpoint

Components are not a whole-kernel proof.

- Scalar actual C: 40 VC checked.
- Byte memory actual C: 169 VC and 2 strategy fields checked.
- Vector actual C: 495 VC, all 16 parts and complete typed gate checked (vector-proof-8so482a9).
- Actual VL C: 8 VC checked (vl-proof-q6yqniya).
- Actual assertion adapter C: 1 VC checked (control-proof-x0k7p028).
- RVV unchanged original C: 46 VC generated in rvv-kernel-4bricunl; proof in progress.
- IntegerFacts and vector active-range lemmas ordinary Coq checked.
- RVV prefix/chunk math and safety/callee leaves in progress.
- NEON full kernel, public wrapper, scalar-field native, and unified fresh gate remain unfinished.

The first newly copied VL/control checker accidentally selected scalar_primitives.c; those runs are explicitly superseded in proof/history/helper-checker-source-selection. Only the subsequent correct actual-source runs above count.

The original NEON static local table parser failure is a tool gap. Current NEON uses a const automatic table with a preserved exact patch; RVV is unchanged. Domain retains all uint8 input values and all initial uint32 outputs, n>0 with 15 byte input padding, fixed VLEN128 with VLMAX32 (m1 4). No output-zero assumption.
