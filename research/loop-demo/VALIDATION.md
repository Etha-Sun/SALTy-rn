# Validation record

Repository baseline: `7ea7bf35317eb5434341c2f4f3b72776a1a5deae`.

## Lean demo

- Toolchain: Lean 4.29.1, commit `f72c35b3f637c8c6571d353742168ab66cc22c00`.
- Command: `LEAN_BIN=/path/to/installed/lean python3 research/loop-demo/run_checks.py`.
- Result: exit code 0; executable examples and all theorem declarations checked.
- `eval_sound`: successful fuel evaluation implies the unbounded successful execution relation.
- `hoare_loop`: generic invariant rule, no axioms.
- `gridCount_correct`: arbitrary rows/cols partial correctness.
- `loop_terminates`: generic decreasing-rank rule, including a premise for body termination.
- `gridCount_total`: arbitrary rows/cols successful termination and `total = rows * cols`.
- `countdown_terminates`: arbitrary natural-number countdown reaches zero.
- Audited dependencies are a subset of `propext`, `Classical.choice`, `Quot.sound`; no additional axioms or proof placeholders.

Concrete checks include 3D filling, triangular bounds, a body-modified bound with step 2,
five/six nested loops, overlapping copy, invalid block/offset, nested fault propagation,
empty loops, untaken branches, do-while first execution, and fuel exhaustion.

These checks are not a C-to-Lean translation proof, an RVV execution model, or a universal
memory-safety proof for the memory examples. The symbolic total-correctness theorem is
for the counter program, not a GEMM kernel. The host's installed toolchain differs from
the SALT project's 4.29.0 pin; no existing toolchain configuration was changed.

## Related GEMM witness

`research/gemm_vl_witness.c` includes the original GEMM kernel unchanged and compares:

```text
normal vl=2: c[0]=2 c[1]=4 c[8]=-999
capped vl=1: c[0]=2 c[1]=-999 c[8]=120
scalar layout-aware: c[0]=2 c[1]=4 c[8]=-999
PASS: all output slots checked; normal agrees with scalar reference.
```

Plain host compilation and execution passed. AddressSanitizer and UndefinedBehaviorSanitizer
execution also passed with `ASAN_OPTIONS=detect_leaks=0`. LeakSanitizer could not operate
under this environment's ptrace restrictions; no leak-check success is claimed.
This is active-lane host simulation for the fixture, not RVV hardware execution.

The two new Chinese reports' 22 relative local links were checked to resolve to existing
files. The kernel/proof tracked files remain unchanged; additions are under `research/`.
