# QCP verification policy

User instruction, 2026-10-23: configure batch verification with **at least 16 parallel workers**. New checkers default to `--jobs 16` and reject lower batch settings. Dependency ordering and the number of ready obligations determine actual concurrency; do not duplicate work to fill slots.

Keep finite per-process limits and reserve the aggregate memory budget. The current Coq baseline is 16 GiB per worker, hence 256 GiB for 16 workers. Coordinate the shared pool before launching. Preserve historical sealed scripts and results rather than rewriting their recorded parallelism.

Follow `docs/SECOND-SERVER-PROMPT.zh-CN.md` for public impl/spec/shim layout and complete fresh C/Coq admission. Distinguish `u8-vclamp` (unsigned bytes) from `s8-vclamp` (signed bytes); each is one separate catalog entry. Keep scope at the existing C-shim modular partial-correctness standard.
