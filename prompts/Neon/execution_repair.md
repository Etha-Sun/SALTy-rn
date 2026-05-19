The following RVV translation of a NEON kernel compiles and runs, but fails correctness verification. Fix only the semantic bug causing the mismatch.

Original NEON Code:
```c
{source_code}
```

Failed RVV Code:
```c
{target_code}
```

Verification Failure:
```
{error}
```

Rules:
- Make the smallest local edit that makes the RVV behavior match the NEON source.
- The RVV output must be bit-exact with the NEON source for the failing case and equivalent inputs.
- Do not change the function signature.
- Do not rewrite the kernel or change the intended algorithm.
- Do not change the VLA stripmine structure, tail handling strategy, or memory access pattern unless the verification failure directly requires it.
- Use only valid RVV 1.0 intrinsics from `<riscv_vector.h>`. Do not invent instructions.
- Focus on semantic mismatches such as:
  - wrong signed/unsigned intrinsic family
  - missing widening or sign extension before arithmetic
  - wrong narrowing mode: saturating vs truncating
  - wrong rounding behavior or wrong `vxrm`
  - fused vs non-fused floating-point multiply-add
  - missing NaN fixup or wrong floating-point conversion behavior
  - wrong lane order, mask handling, or tail/passthrough behavior
  - wrong params struct field or scalar broadcast value
- Do not spend changes on compilation cleanup or performance tuning unless required to fix correctness.
- Return ONLY the corrected C code. No markdown, no explanation.
