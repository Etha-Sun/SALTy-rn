The following RVV translation of a NEON kernel compiled, ran, and passed functional testing, but formal verification found a concrete counterexample where the NEON and RVV outputs differ.

Original NEON Code:
```c
{source_code}
```

Failed RVV Code:
```c
{target_code}
```

Verification Counterexample:
```
{error}
```

This is a semantic mismatch, not a syntax or runtime issue. The NEON source is the ground truth.

Task:
- Repair the RVV code so it matches the NEON semantics exactly.
- Use the counterexample to localize the first wrong operation, then make the smallest local fix.
- Do not "fit" only the shown input. The repaired RVV code must be correct for all inputs.

Constraints:
- Do not change the function signature.
- Do not rewrite the kernel or change the overall algorithm.
- Do not change unrelated code, params usage, buffer layout, or loop structure unless that is the semantic bug.
- Preserve RVV VLA / stripmine structure unless the counterexample shows that tail handling is wrong.
- Use only valid RVV 1.0 intrinsics from `<riscv_vector.h>`.

Focus on verification-only bug classes:
- Wrong rounding behavior: truncation vs rounding, wrong `vxrm`, wrong shift direction, wrong order of shift and narrow
- Signed/unsigned mistakes in widening, narrowing, saturation, clip, min/max, or comparisons
- Missing sign/zero extension before widening arithmetic
- Wrong accumulator width or wrong cast before multiply-accumulate
- Wrong scalar broadcast or scalar type
- Tail, mask, merge, or lane-order mistakes
- Wrong saturation bounds or narrowing intrinsic family

Use the counterexample as follows:
- Compare the failing output element with the corresponding NEON computation path.
- Trace backward to the earliest RVV operation that could produce the wrong value.
- Fix that operation, not the downstream symptom.

Return ONLY the corrected C code. No markdown, no explanation.
