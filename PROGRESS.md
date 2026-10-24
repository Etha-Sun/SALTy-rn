# Kernel 验证进度

完整验证通过：**22/40**。新目标：**至少 31/40**。依据：[verified 清单](verification/qcp/verified/manifest.json)。

- f32-vadd
- f32-vsub
- f32-vmul
- f32-vdiv
- f32-vmulc
- f32-vlrelu
- f32-vcmul
- f32-vmin（RVV 修复版）
- f32-vmax（RVV 修复版）
- qs8-f32-vcvt（NEON 修复版）
- s8-vclamp（RVV 修复版）
- qu8-f32-vcvt（NEON 修复、RVV 兼容版）
- qu8-rsum（NEON语法兼容版）
- qs8-rsum（两侧模32溢出修复版）
- f32-vrndne（两侧原始实现）
- qs8-vcvt（修复版，完整64位重新验收）
- [qs8-vlrelu](verification/qcp/verified/qs8-vlrelu/README.md)（两侧取负 UB 修复版，完整64位）
- [u8-vclamp](verification/qcp/verified/u8-vclamp/README.md)（两侧原始实现，可选 AVL128 版同计一项）
- [qs8-rdsum](verification/qcp/verified/qs8-rdsum/README.md)（两侧行数与溢出修复版，完整64位）

- [qd8-f32-qc8w-gemm-minmax](verification/qcp/verified/qd8-f32-qc8w-gemm-minmax/README.md)（其他 worker 完成，两侧修复版）
- [f32-gemm-minmax](verification/qcp/verified/f32-gemm-minmax/README.md)（其他 worker 完成，修复版）
- [qs8-vadd-minmax](verification/qcp/verified/qs8-vadd-minmax/README.md)（修复版，完整64位）

这里指公开契约和指定 C-shim 模型下的部分正确性；不包含真实 ISA 对应或完整终止性。

最新约定：intrinsic 只需采用与原始规范对应、可审核的 spec；C 实现及其证明可选。完整 kernel 仍须验证。见 [规范边界](verification/qcp/docs/INTRINSIC-SPEC-POLICY.zh-CN.md)。

- 2026-10-23（洛杉矶）：QS8 多行归约修复版完整验证通过并收录；有效 **19/40**。

- 2026-10-24（洛杉矶）：两项 GEMM 已收录；QS8 加法修复版完整验证、归档和发布复核通过，当前 **22/40**。

## 当前工作

- FP32→FP16：56 个实际 C 目标已全部重新生成并精确匹配，正在完整编译 Coq 证明。
- QS8 加法已完整收录；QU8 加法两侧完整组件通过，正在整案新鲜重放。
- QS8 RDSUM 已完整通过并收录；继续 QU8 多行归约。
- QU8 RDSUM：37 个实际 C 目标已全部重新生成通过，正在完整编译证明。

- ArgmaxPool：大尺寸计数错误已修复，回归及指针表调用探针通过，继续完整形式化。

- FP32 sqrt：浮点数学及两侧大部分实际 C 字段通过，继续内存接口与整案门禁。
- QS8 乘法：magic-bias 与负 NaN 修复后的全 binary32 逐元素等价证明通过，继续实际 kernel 验证。
- FP32 maxpool：修复计数与 NaN 顺序问题，回归通过，继续实际 C 验证。

上述其余候选与组件进展尚未计入 22 个完整通过的 kernel。
- 两项整数求和已完成；推进多行归约 rdsum。

u8-clamp、GEMM、ENV、layout 保持其他 worker 的现有分工。

历史修复与原反例（PR 已关闭，后续直接提交）：[vmin PR #3](https://github.com/Etha-Sun/SALTy-rn/pull/3)、[vmax PR #4](https://github.com/Etha-Sun/SALTy-rn/pull/4)。

## 大进展

- 2026-10-23（洛杉矶）：QS8 激活修复版完整验证通过并收录；有效 **18/40**。

- 2026-10-23（洛杉矶）：QS8 转换修正类型后，完整64位门禁重新通过并收录；有效 **17/40**。

- 2026-10-23（洛杉矶）：收录其他 worker 完成的 U8 clamp；撤回 QS8 转换的错误64位长度域准入，修正类型后重验。当前有效 **16/40**。

- 2026-10-23（洛杉矶）：FP32 取整原始实现完整验收并纳入本次直接提交；已验证 **16/40**。

- 2026-10-23（洛杉矶）：QS8 求和两侧模32溢出修复版完整验收并纳入本次直接提交；已验证 **15/40**。

- 2026-10-23（洛杉矶）：QU8 求和NEON语法兼容版完整验收并纳入本次直接提交；已验证 **14/40**。

- 2026-10-23（洛杉矶）：QS8 转换修复版完整验证并纳入本次直接提交；已验证 **13/40**。

- 2026-10-23（洛杉矶）：修复了证明汇总文件的覆盖错误，增加完整接口检查；当时已验证仍为 12/40。

- 2026-10-23（洛杉矶）：qs8-rsum 两侧证明已汇总通过，准备最后复验；当时已验证仍为 12/40。

- 2026-10-22：VADD 旧结果重放通过；min/max 沿用 Frama-C 修复，保留原反例。
- 2026-10-23：VLReLU 完整验证通过，直接提交 `bf106ba7`；当时 **6/40**。
- 2026-10-23：复数乘法完整验收通过（`48930561`）；当时 **7/40**。
- 2026-10-23：min 修复版完整验收通过（`cb0b7f07`）；当时 **8/40**。
- 2026-10-23：max 修复版完整验收通过（`fec45725`）；当时 **9/40**。
- 2026-10-23：s8-clamp、qs8-f32 转换的公开调用入口全部通过，继续证明两侧 kernel；仍 **9/40**。
- 2026-10-23：s8-clamp、qs8-f32 转换的两侧完整函数组件通过，继续统一验收；仍 **9/40**。

- 2026-10-23：qs8-f32 转换修复版完整验收并直接提交 `598bf397`；当时 **10/40**。
- 2026-10-23：s8-clamp 修复版完整验收并直接提交 `3d40082c`；当时 **11/40**。

**小函数验证通过，只代表“零件”通过；完整 kernel 还要单独验收。只有完整验收通过，才增加上方数量。**

工作树：`qcp-simple-kernels`；分支：`codex/worker-simple-kernels`。GEMM 等其他 worker 的工作保持原样。
环境重放证据：[checkpoint.json](.build/simple-kernels-bootstrap/checkpoint.json)。

后续发布：完整验证通过后，先 fetch，再直接提交到 `c-shim-v2` 的 `verified/`；不再开 PR。

资源：后续新批次默认 **32 并发，普通任务 16 GiB、重型任务 32 GiB**；长生成最多 6 小时，按整机内存协调。现有运行保留原预算。修复主动参考 Frama-C 与 Arcadia-y，说明原因并验证修复后等价性。
恢复入口：[MEMORY.md](MEMORY.md)。

- 2026-10-23：目标提高到至少 **21/40**，新一批简单 kernel 已并行启动；当时仍 **11/40**。

- 2026-10-23：qu8-f32 转换修复／兼容版完整验收并直接收录；当时 **12/40**，继续推进至少 **21/40**。
