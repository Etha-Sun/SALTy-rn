#### Weekly update: RVV → Lean and Sail

##### 1. Our RVV → Lean prototype

**Flow:** original RVV intrinsic C → GCC assembly → 19 Lean instructions → handwritten `Machine.lean` → proof.

`Machine.lean` defines a small RVV machine: scalar/vector registers, byte memory, `vl`, instruction steps, and normal-return execution. It models assembly, not ELF bytes.

```lean
-- Short excerpt; omitted constructors and fields are in Machine.lean.
inductive Instr where
  | vsetvli (rd rs : Reg) (sew lmul : Nat) (tail : Tail)
  | vle8 (vd base : Reg)
  | vzextVF4 (vd vs : Reg)
  | vaddVV (vd vs1 vs2 : Reg)
  | vredsumVS (vd vs seed : Reg)

structure State where
  pc : Nat           -- instruction index
  x : Array XWord    -- scalar registers
  v : Array Byte     -- physical vector-register bytes
  mem : Array Byte   -- byte memory
  vl : Nat           -- active lanes
```

Source: [Machine.lean](assembly-reduction/Machine.lean).

Selected lines from the actual `Impl.lean` program (scalar pointer updates omitted):

```lean
.vsetvli 15 10 32 8 .undisturbed  -- choose vl; keep inactive lanes
.vle8 2 11                        -- load input bytes
.vzextVF4 16 2                    -- widen 8 → 32 bits
.vaddVV 8 8 16                    -- accumulate
.branch .ne 10 0 3               -- repeat until no input remains
```

Source: [Impl.lean](assembly-reduction/proofs/qu8-rsum/Impl.lean); original [kernel.s](assembly-reduction/proofs/qu8-rsum/kernel.s).

`Correct` means **normal termination + `oldOutput + sum(input)` modulo 2³² + unchanged other memory and ABI registers**, for every valid configuration and input state. `Proof.lean` proves the instruction path, loop invariant/termination, final store, and `Kernel.correctness`.

| Proof result | Value |
| --- | --- |
| Assembly proof | Passed; 1,412 Lean lines; standard axioms only |
| Cross-checks | 1,512 Lean cases; 252 QEMU comparisons |
| Proof generation time / tokens | **Not recorded** for this assembly proof |

The theorem is relative to our handwritten `Machine.lean`; ISA correspondence is still open.

**NEON?** There is no NEON assembly version of `Machine.lean`. A separate *manual, high-level* Lean model covers both original C kernels:

```lean
-- Value models, not assembly semantics.
neonLoad16 : NeonState → NeonState   -- 16-byte load + widening sum
rvvStep   : Nat → RvvState → RvvState -- dynamic vl + tu accumulation
```

Source: [Models.lean](reduction-demo/Models.lean).

Its equivalence proof passed: 615 lines, **about 15 minutes** of agent-reported generation, 14 direct Lean compile attempts. **Token use was not recorded.** These timings do not belong to the assembly proof.

##### 2. Sail route: intrinsic C → Lean ISA model

```text
Original NEON/RVV C → wrappers → Clang/GCC → .s → .o → ELF
RVV ELF → Kernel.sail address/encoding table
Upstream RISC-V Sail ISA + Kernel.sail → generated Lean ISA + kernel entry
```

Pipeline files: [RVV wrapper](sail-binary-reduction/kernel-rvv.c), [NEON wrapper](sail-binary-reduction/kernel-neon.c), [ELF adapter](sail-binary-reduction/elf_to_sail.py), [Sail generation](sail-binary-reduction/generate_model.py).

The RVV ELF function is **60 bytes / 19 mixed 16- and 32-bit instructions**. `Kernel.sail` maps each real byte address to an upstream decoder; `kernel_step` invokes upstream `execute`:

```sail
// Excerpt from Kernel.sail; comments added.
0x00000000800001bc => Some((encdec(0x0d307757), 4)),
0x00000000800001c4 => Some((encdec_compressed(0xcd01), 2)),
// kernel_step reads PC → decodes → execute(ins) → commits nextPC on retirement.
```

Source: [Kernel.sail](sail-binary-reduction/artifacts/formal/Kernel.sail).

The assembly appears in generated **`Rv64Kernel/Kernel.lean`**, as address dispatch and a call into the generated ISA semantics:

```lean
-- Excerpt from generated Kernel.lean; comments added.
| 0x00000000800001BC => pure (some ((← encdec_backwards 0x0D307757#32), 4))
| 0x00000000800001C4 => pure (some ((← encdec_compressed_backwards 0xCD01#16), 2))
-- kernel_step calls execute ins; the ISA model defines what each instruction does.
```

Source: generated [Kernel.lean](sail-binary-reduction/out/background/rvv-lean-kernel-20260917/model/rv64_kernel/Rv64Kernel/Kernel.lean); ISA instruction bodies in [InstsEnd.lean](sail-binary-reduction/out/background/rvv-lean-kernel-20260917/model/rv64_kernel/Rv64Kernel/InstsEnd.lean).

| Sail→Lean output | Result |
| --- | --- |
| Size | **135 files; 122,173 lines; 22.4 MB** total |
| Kernel entry | `Kernel.lean`: 241 lines; ISA execution file `InstsEnd.lean`: 47,699 lines |
| Generation time | **72.5 minutes** (4,352.5 seconds) |
| Current status | Source generated; **not yet Lean-typechecked or executed; no binary proof** |

Separately, RVV Sail→Lem took about **299 seconds**, passed Lem type checking, and exported Isabelle source. Isabelle has not checked it. NEON Sail generation timed out; finite NEON QEMU and RVV Sail-simulator tests are separate from the generated-model proof.

##### Files

| Topic | Files |
| --- | --- |
| Our model and proof | [Machine.lean](assembly-reduction/Machine.lean), [Impl.lean](assembly-reduction/proofs/qu8-rsum/Impl.lean), [Correct contract](assembly-reduction/proofs/qu8-rsum/ReductionContract.lean), [Proof.lean](assembly-reduction/proofs/qu8-rsum/Proof.lean), [checker](assembly-reduction/check_proof.py), [proof result](assembly-reduction/proofs/qu8-rsum/ProofResult.json) |
| NEON/RVV value models and timing | [Models.lean](reduction-demo/Models.lean), [GenerationRun.json](reduction-demo/GenerationRun.json) |
| Sail inputs and adapter | [RVV C](../kernels/target/qu8-rsum.c), [NEON C](../kernels/source/qu8-rsum.c), [RVV wrapper](sail-binary-reduction/kernel-rvv.c), [NEON wrapper](sail-binary-reduction/kernel-neon.c), [elf_to_sail.py](sail-binary-reduction/elf_to_sail.py), [Kernel.sail](sail-binary-reduction/artifacts/formal/Kernel.sail) |
| Generated Lean and status | [Kernel.lean](sail-binary-reduction/out/background/rvv-lean-kernel-20260917/model/rv64_kernel/Rv64Kernel/Kernel.lean), [InstsEnd.lean](sail-binary-reduction/out/background/rvv-lean-kernel-20260917/model/rv64_kernel/Rv64Kernel/InstsEnd.lean), [generation result](sail-binary-reduction/out/background/rvv-lean-kernel-20260917/Result.json) |
