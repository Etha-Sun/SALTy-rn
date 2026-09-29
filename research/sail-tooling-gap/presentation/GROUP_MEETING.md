# NEON–RVV Verification: Types, Specifications, and Current Status

We are testing whether simplified NEON and RVV reduction kernels can be verified against a shared specification.

| Aspect | NEON | RVV |
|---|---|---|
| Input representation | `blocks : list (bv 64 * bv 64)` + `tail : list (bv 8)` | `input : list (bv 8)` |
| Logical byte sequence | `flatten_blocks blocks ++ tail` | `input` |
| Initial output / result type | `bv 32` | `bv 32` |
| Vector representation | 128-bit vectors | 65,536-bit bitvector per register in this Sail model; configured VLEN=256 bits |
| Key memory preconditions | 16-byte input alignment | 7 additional valid padding bytes |

Both contracts require valid memory, 4-byte output alignment, and non-overlapping input/output regions. The current RVV contract requires padding; this does not imply that the instruction necessarily reads those bytes.

VLEN is the width of one vector register in bits; `vl` is the number of elements processed by the current vector instruction. With VLEN=256 bits, SEW=32 bits, and LMUL=1, `vl` is at most 8 and can be smaller when fewer elements remain. The 65,536-bit bitvector is the Sail model's register representation, not the configured VLEN or a limit on the program's total input length.

The shared mathematical specification is defined in [KernelSpec.v](02_specs/KernelSpec.v):

```coq
Definition byte_reduction_spec
    (initial : bv 32) (input : list (bv 8)) : bv 32 :=
  bv_add initial (byte_sum input).
```

This computes `(initial + sum(input bytes)) mod 2^32`. The respective output conditions, shown schematically with distinct variable names, are:

```text
NEON: output_after = byte_reduction_spec initial (flatten_blocks blocks ++ tail)
RVV:  output_after = byte_reduction_spec initial input
```

These agree **only after establishing the input correspondence**:

```coq
input = flatten_blocks blocks ++ tail
```

The machine memories must represent this same logical input. Both contracts also require input memory to remain unchanged. The actual program contracts are in [NeonByteSpec.v](02_specs/NeonByteSpec.v) and [RvvByteSpecConditional.v](02_specs/RvvByteSpecConditional.v).

Current status:

- **Proved:** NEON kernel correctness, NEON block-to-byte memory conversion, and several RVV instruction contracts.
- **Conditional:** RVV kernel correctness still assumes the general load contract; only `vl=0,1` load cases are proved.
- **Remaining:** establish coverage of the intended common input domain, close the RVV load proof, and compose the final equivalence theorem. Taking the intersection of the current preconditions alone would establish only a restricted-domain result.
- **Scope:** arbitrary legal total input length, but fixed RVV VLEN=256. Parameterized verification across VLENs remains open. Current program contracts establish partial correctness; termination has not been separately proved.

The shared specification and representation relations were written by the agent; Sail/Isla did not automatically infer them. Coq checks the supplied proofs. The intended input domain and observable behavior must still match the project requirements.
