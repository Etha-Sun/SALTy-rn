# Remaining research workspace archive — 2026-09-28

This archive commit preserves the remaining research code, notes, generated artifacts and diagnostic records, including the previously staged `assembly-reduction/` work. It is a history-preservation commit, not a claim that every experiment compiles or every proof succeeds.

For the current Sail/NEON/RVV result, start with [presentation/README.md](sail-tooling-gap/presentation/README.md) and [presentation/STATUS.md](sail-tooling-gap/presentation/STATUS.md). The full kernel work lives in `sail-tooling-gap/kernel-e2e/`; it includes the shared specification, full program contracts, instruction proofs, and historical attempts. The previous checkpoint already preserved its accepted proofs and local dependencies. This commit adds the remaining files alongside them.

Some archived Coq files contain `Abort`, exploratory goals, or unfinished/failed proof scripts. Some Lean files are intentional negative tests or templates. Source-file presence, `Qed` text, or generated trace files are not evidence of a successful kernel check. Use the checker records and current status files to identify accepted results. In particular, the complete RVV result still depends on `Hload`, and the VL=2..8 load cases remain outstanding.

Four historical raw Isla traces exceed 30 MB each. They are preserved as lossless `.isla.gz` files next to their local uncompressed originals. The raw files are ignored by Git; `sail-tooling-gap/bridge-audit/trace-archive.json` records their paths, sizes and SHA-256 hashes. To restore a trace in a fresh checkout, run, for example:

```bash
gzip -dk research/sail-tooling-gap/bridge-audit/generated/rvv_widen_allvl/a800001d2.isla.gz
```

Do not overwrite an existing raw trace unnecessarily. Local proof caches, external toolchains, and previously ignored build/log directories remain excluded. The root `image.png` is retained as the existing research diagram.

Archiving validates Python syntax, JSON readability and compressed-trace round trips. It does not re-run the complete historical verification experiments or upgrade their reported success status.

The existing `assembly-reduction` parser/checker regression suite was also rerun: all 10 tests passed. Its checker integration tests use a deliberately separate synthetic contract; they are not a new correctness proof of the reduction kernel.
