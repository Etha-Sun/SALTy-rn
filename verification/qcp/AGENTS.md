# QCP verification policy

Latest user objective: reach **at least31/40 complete verified and directly published kernels** (raised from21 on2026-10-23). Current accepted count comes only from `verified/manifest.json`; individual components do not count. Follow current PROGRESS/MEMORY rather than old target snapshots.

User update, 2026-10-23: raise future verification resources. New unsealed batches default to **32 parallel workers**, ordinary workers **16 GiB**, heavy workers **32 GiB**. Use up to **6 hours** for long generation, normally 2 hours per proof and 4 hours for heavy proof modules. The latest user instruction fixes new configured batches at32; dependency ordering, ready obligations and available aggregate memory determine actual concurrency. Do not duplicate work to fill slots.

Keep finite per-process limits and reserve the aggregate memory budget:32 ordinary workers reserve512 GiB;32 heavy workers would reserve1 TiB, so coordinate the shared server before launching such a pool. Keep existing live or frozen runs at their recorded settings; do not restart valid work merely to apply the new defaults. Preserve historical sealed scripts and results rather than rewriting their recorded parallelism.

Follow `docs/SECOND-SERVER-PROMPT.zh-CN.md` for public impl/spec/shim layout and complete fresh C/Coq admission. Distinguish `u8-vclamp` (unsigned bytes) from `s8-vclamp` (signed bytes); each is one separate catalog entry. Keep scope at the existing C-shim modular partial-correctness standard.
