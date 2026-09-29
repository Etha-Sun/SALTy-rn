# Sail tooling gap study

Read [REPORT.zh-CN.md](REPORT.zh-CN.md) for the conclusions and limitations. This directory contains a register-only cross-ISA SMT experiment, coverage probes, and a source audit. It is not a full kernel verifier.

Follow-up: [DIRECT-EQUIVALENCE.zh-CN.md](DIRECT-EQUIVALENCE.zh-CN.md) audits direct two-program equivalence, Islaris development branches, and the existing s2n-bignum/PATE/relational-logic alternatives. This follow-up is a paper and source audit, not a reproduced full-kernel proof.

Agent-assisted verification attempt: [unbounded-vla/REPORT.zh-CN.md](unbounded-vla/REPORT.zh-CN.md) records kernel-checked arbitrary-length **abstract** block-memory proofs, an extracted Sail VL-helper proof, and new ISA build/symbolic-VL diagnostics. The real NEON/RVV ISA-to-block bridge remains unproved; this is not an end-to-end machine-code equivalence result.

Actual Islaris demo: [islaris-reduction/README.zh-CN.md](islaris-reduction/README.zh-CN.md) connects unchanged official RVV Sail traces to Coq-checked `vsetvli` and `vredsum.vs` instruction proofs, with an agent-written exact function contract. The whole arbitrary-length reduction loop and cross-ISA equivalence remain unproved. This demo uses a different official RVV snapshot from the earlier symbolic-reset probes.

Two-sided bridge audit: [bridge-audit/README.zh-CN.md](bridge-audit/README.zh-CN.md) inventories the actual NEON/RVV reduction binaries, imports seven representative instruction traces, proves a NEON `addv` property in Coq, and compares type/state mappings through actual arithmetic traces. It records the necessary 16-bit range condition, direct/shared-spec experiments, and unresolved loading/proof costs. This is a diagnostic block experiment, not arbitrary-length kernel equivalence.

## Replay in this workspace

```bash
python3 research/sail-tooling-gap/replay.py
python3 research/sail-tooling-gap/replay.py --extract
python3 research/sail-tooling-gap/replay.py --all-probes
python3 research/sail-tooling-gap/audit.py
```

Default replay regenerates SMT from the retained traces and runs the positive and negative checks (a few seconds). `--extract` first runs Isla on the three core opcodes. `--all-probes` also repeats known failing probes and two 60-second timeouts. Replays overwrite corresponding logs and result JSON. Probe exit status alone is not a semantic correctness test; `compare_traces.py` exits unsuccessfully unless all expected solver outcomes are obtained.

Set `Z3=/path/to/z3` to override the existing workspace Z3 4.13.0 binary. The retained `.smt2` files can also be run directly with Z3; no ISA download is necessary to recheck those formulas. The Python scripts require Python 3.9+ and no external Python packages.

## Dependencies and provenance

Large downloaded sources, snapshots, local Rust installation and build outputs are under ignored `vendor/`. [source-audit.json](results/source-audit.json) records exact revisions and SHA-256 hashes. ISA snapshots came from the official [isla-snapshots](https://github.com/rems-project/isla-snapshots) repository:

| Input | Revision / file |
|---|---|
| Isla source | `e9b5d945394277656593a0d429466d7fa0a2b4b3` |
| Current snapshots | `d8b31014643035a3b11071e56ef30001de3f52ab`: `rv64d.ir`, `armv9p4.ir.gz` |
| Islaris-tested snapshot | `b58da9170470a422c9396983ac8f87f0a63ba6f8`: `riscv64.ir` |
| Islaris source audit | `c978e10f50db5c40f0fdf113f5f76a779782c6f9` |
| riscv-lean source audit | `ccdfd67647b334a830e220c4caef0f067cd9e15c` |

Source archives use `https://codeload.github.com/OWNER/REPO/tar.gz/REVISION`; snapshot files use `https://raw.githubusercontent.com/rems-project/isla-snapshots/REVISION/FILENAME`. Unpack Isla as `vendor/isla-master`, Islaris as `vendor/islaris-main`, riscv-lean as `vendor/riscv-lean-main`, and decompress Arm to `vendor/armv9p4.ir`. The archive extraction here omitted symlinks, including a shared formatting-config link. No execution semantics were patched.

Isla was built with isolated Rust 1.85.1, its Cargo.lock, and the system Z3 4.8.12.0 shared library:

```bash
cd research/sail-tooling-gap/vendor/isla-master
cargo build --release --locked --bin isla-footprint --bin isla-execute-function
```

In this workspace Rust is under `vendor/cargo` and `vendor/rustup`; set `CARGO_HOME` and `RUSTUP_HOME` to those absolute paths and invoke `vendor/cargo/bin/cargo` if no system Rust is available. Building requires the usual native dependencies, including Z3 headers/library. The standalone SMT solver version is distinct from the shared library linked by Isla.

The experiment TOML files copy upstream Isla architecture configs and adapt toolchain paths. They currently contain absolute workspace paths for RISC-V binutils and local LLVM tools. On another machine update these paths, even though these probes use raw opcodes rather than the assembler. Successful RVV configurations explicitly enable V and initialize dynamic vector registers; the failed configurations are retained intentionally.

Every probe's exact arguments, timeout, status and trace hash are in `results/NAME.json`. In raw-opcode mode the bytes are little-endian: Arm `2164204e` means opcode `0x4e206421`, RVV `5744871e` means `0x1e874457`. RVV negative `57448716` is `vmin.vx`.

## Compile the original NEON example

From the repository root:

```bash
clang --target=aarch64-none-elf -march=armv8-a+simd -ffreestanding -O2 \
  -c research/sail-tooling-gap/experiments/s8-neon-wrapper.c \
  -o research/sail-tooling-gap/experiments/s8-neon.o
llvm-objdump-14 -d research/sail-tooling-gap/experiments/s8-neon.o
```

Clang 14.0.0 was used. Other compiler versions may produce different registers/opcodes; the comparison harness intentionally targets the recorded instruction pair, not arbitrary compiler output.

## Lean build probe

The existing generated source directory was copied from
`research/sail-binary-reduction/out/background/rvv-lean-kernel-20260917/model/rv64_kernel`
to ignored `vendor/lean-kernel`. Its Sail runtime source was copied from
`examples/s8-vmax-to-lean/sail-demo/out/LaneExample/.lake/packages/Sail`
to `vendor/lean-sail` (excluding `.git` and `.lake`). The copy's `lakefile.toml` points its Sail dependency to `../lean-sail`; generated Lean source is unchanged.

In `vendor/lean-kernel`, `lake update` followed by `lake build Rv64Kernel.Kernel` failed with Lean 4.29.1. Repeating with toolchain `leanprover/lean4:v4.29.0` and rebuilding failed at the same generated definitions. See `logs/lean-build*.log`. This is a failure of this particular existing artifact, not a universal claim about the backend.

## Checks and trust boundary

The positive test requires `sat` for the joint input/path conditions, then `unsat` for unequal output. The negative test requires `sat` and a concrete unequal-output witness. All 2×1 recorded trace combinations are checked. The harness has also been checked to reject memory traces and the zero-write inactive-vector trace.

The proof claim is relative to Isla's emitted traces. There is no independently checked trace-completeness theorem or proof certificate, no memory composition, no whole-loop proof, and no arbitrary VLEN theorem. Do not promote `all_pairs_passed` to kernel equivalence; result files explicitly mark `kernel_equivalence_proved: false`.
