# Resume checkpoint

- Published load: `python3 verification/qcp/experiments/vadd-rvv/run.py` completed successfully. `status.json`: 100 actual C VCs and 3 array strategies checked, 396 native load/add comparisons across all 33 VL values.
- Input is only VL readable cells; VL=0 is supported without reading the pointer. All 32 output fields are owned and inactive lanes are positive zero. Full binary32 domain retained.
- Full add: actual C and 101 VC signatures generated. Whole checked module has **not** compiled. Last 180-second attempt ended with exit124 while starting `proof_of___riscv_vfadd_vv_f32m8_partial_solve_wit_16`. Do not count partial Qed or the native regression as a checked full add result.
- Profiling shows auxiliary call-frame proofs slow as accumulated float contracts grow. The 32 constant safety obligations have already been replaced with direct pure semantic proofs. Next optimize auxiliary heap cancellation without generic `entailer!` expanding all stored floats/model values; explicit `andp` pure introductions plus normalized separation cancellation is a candidate, not yet checked.
- Store not started. Preserve the intended VL-prefix writable domain; requiring 32 destination cells would exclude legal tail buffers and is not an acceptable substitute.
- All commands now finished; no background Coq job remains. No old shared proof or frozen review file was modified.
- Namespace `QcpRvv32`; generated bodies are in `rvv_load.c`/`rvv_add.c`, generator `generate.py`. `run.py --add` explicitly requires the pending add module. All current logs and source hashes are retained.

Publication note: status.json retains historical hashes for debug.v and debug_load.v; these temporary debug files were removed before publication and are not replay dependencies. All available recorded source hashes and command log hashes were checked before publication.
