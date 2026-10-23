# Kernel 验证进度

完整验证通过：**10/40**。下一目标：**至少 11 个**。依据：[verified 清单](verification/qcp/verified/manifest.json)。

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

这里指公开契约和指定 C-shim 模型下的部分正确性；不包含真实 ISA 对应或完整终止性。

## 当前工作

- **VLReLU**：完整验收通过，已直接提交到 `c-shim-v2`（`bf106ba7`）。
- **vmin（RVV 修复版）**：完整验收通过，保留 repair 和原始 NaN 反例。
- **vmax（RVV 修复版）**：完整验收通过，保留 repair 和原始 NaN 反例。
- **复数乘法 vcmul**：完整验收通过，原始实现保持，已直接提交 `48930561`。

- **s8-clamp**：两侧完整函数组件已通过，正在做全案重放。u8-clamp 沿用其他 worker 的现有分工。
- **qs8-f32 转换（NEON 修复版）**：完整验证通过，已收录 `verified/qs8-f32-vcvt`。

历史修复与原反例（PR 已关闭，后续直接提交）：[vmin PR #3](https://github.com/Etha-Sun/SALTy-rn/pull/3)、[vmax PR #4](https://github.com/Etha-Sun/SALTy-rn/pull/4)。

## 大进展

- 2026-10-22：VADD 旧结果重放通过；min/max 沿用 Frama-C 修复，保留原反例。
- 2026-10-23：VLReLU 完整验证通过，直接提交 `bf106ba7`；当时 **6/40**。
- 2026-10-23：复数乘法完整验收通过（`48930561`）；当时 **7/40**。
- 2026-10-23：min 修复版完整验收通过（`cb0b7f07`）；当时 **8/40**。
- 2026-10-23：max 修复版完整验收通过（`fec45725`）；当时 **9/40**。
- 2026-10-23：s8-clamp、qs8-f32 转换的公开调用入口全部通过，继续证明两侧 kernel；仍 **9/40**。
- 2026-10-23：s8-clamp、qs8-f32 转换的两侧完整函数组件通过，继续统一验收；仍 **9/40**。

- 2026-10-23：qs8-f32 转换修复版完整验收通过；当前 **10/40**。

**小函数验证通过，只代表“零件”通过；完整 kernel 还要单独验收。只有完整验收通过，才增加上方数量。**

工作树：`qcp-simple-kernels`；分支：`codex/worker-simple-kernels`。GEMM 等其他 worker 的工作保持原样。
环境重放证据：[checkpoint.json](.build/simple-kernels-bootstrap/checkpoint.json)。

后续发布：完整验证通过后，先 fetch，再直接提交到 `c-shim-v2` 的 `verified/`；不再开 PR。

资源：新批次默认 **16 并发、每进程 16 GiB**，按任务设置时限。修复主动参考 Frama-C 与 Arcadia-y，说明原因并验证修复后等价性。
恢复入口：[MEMORY.md](MEMORY.md)。
