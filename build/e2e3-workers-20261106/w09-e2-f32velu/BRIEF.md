# W09：E2 f32-velu（AVX2 → RVV）

先读 `build/e2e3-workers-20261106/E2-COMMON.zh-CN.md`（E2 公共说明），按其中步骤做。

- 操作：f32-velu（ELU，多项式加查表）。
- 源建议：`src/f32-velu/gen/f32-velu-avx2-rr1-lut4-p4-perm-u*.c`（可行性调查认为已注册）或 `avx512f_rr1_p6`；以 `src/configs/unary-elementwise-config.c` 中 x86 实际注册的为准。params 结构带 permute 查表。
- 目标：**只做 RVV**（HVX 不在本轮范围）。
- 观察关系：float 逐位相等（NaN 按默认规则）。源的 FMA 用法必须在目标中逐一对应（RVV 有 `vfmacc`/`vfmadd`，注意融合与否）。
