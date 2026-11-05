# Optimized RVV Kernels

This repository contains the **35 final RVV microkernels optimized by SALTyRN** for the evaluation described in our Neon-to-RVV translation work.

SALTyRN starts from hand-written Arm Neon kernels in XNNPACK, translates them to RISC-V Vector (RVV), checks the translations with bounded symbolic equivalence verification, and then searches for faster RVV implementations using an RVV backend added to Autocomp. The final optimized candidate is re-verified against the verified RVV baseline before it is accepted.

This repository contains the optimized kernel outputs only. The translation, verification, and optimization pipeline lives in the [SALTyRN repository](https://github.com/keaganchern/SALTy-rn).

## Kernel coverage

The 35 kernels cover a range of XNNPACK microkernel families.

### Elementwise and activation

- `u8-vclamp`
- `s8-vclamp`
- `qu8-vadd`
- `qs8-vmul`
- `qs8-vlrelu`
- `qs8-vcvt`
- `qs8-vadd`
- `f32-vadd`
- `f32-vsub`
- `f32-vmul`
- `f32-vmulc`
- `f32-vmin`
- `f32-vmax`
- `f32-vdiv`
- `f32-vlrelu`
- `f32-vrndne`
- `f32-vsqrt`
- `f32-vcmul`

### Reductions and conversions

- `qu8-rsum`
- `qu8-rdsum`
- `qu8-f32-vcvt`
- `qs8-rsum`
- `qs8-rdsum`
- `qs8-f32-vcvt`
- `f32-f16-vcvt`

### Pooling and data movement

- `x32-transposec`
- `f32-argmaxpool`
- `f32-maxpool`
- `x32-packw-gemm-goi`

### Convolution and matrix multiplication

- `f32-dwconv-minmax`
- `f32-dwconv2d-chw`
- `f32-conv-hwc2chw`
- `f32-gemm-minmax`
- `f32-igemm-minmax`
- `qd8-f32-qc4w-gemm-minmax`

## Related projects

- [SALTyRN](https://github.com/keaganchern/SALTy-rn) — Neon-to-RVV translation and bounded verification pipeline
- [XNNPACK](https://github.com/google/XNNPACK) — source microkernels and hand-written RVV baselines
- [Autocomp](https://github.com/ucb-bar/autocomp) — LLM-driven optimization framework extended with an RVV backend
- [Saturn](https://github.com/ucb-bar/saturn-vectors) — RVV vector unit used for performance evaluation
- [FireSim](https://github.com/firesim/firesim) — cycle-accurate FPGA-accelerated simulation