# Worker checkpoint: 2026-10-23

Inner-loop invariant now uses `rd_inner_gate r current_batch`: only the final completed block may forget its row pointers. A pure counterexample to the old invariant and an actual pointer-step C probe (4 typed VC) are retained. The implementation and public domain are unchanged by this annotation repair.

- neon: 596 actual C VC; goal SHA `a16154e0d8355f40a7e2ec773fea5a66174fb562b01a97232717d572fe955bda`; run `neon-kernel-uvj9c6vy`. Generation only; no whole kernel credit.
- rvv: 119 actual C VC; goal SHA `3d786a212dd748e89eff6709ca098029e896970429407263b49ad0d7be208de1`; run `rvv-kernel-vxlxnjbl`. Generation only; no whole kernel credit.

Historical partial proofs for the previous generated goals are preserved under proof/history and private .build runs; they do not certify these current goals. Actual helpers and finite native evidence remain separate from whole-kernel correctness. Source/goal replay, remaining loop and memory obligations, complete typed interfaces and the unified fresh case gate remain required. Parent owns global count and publication.
