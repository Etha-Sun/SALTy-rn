# Kernel 验证进度

完整验证通过：**7/40**。下一目标：**至少 11 个**。依据：[verified 清单](verification/qcp/verified/manifest.json)。

- f32-vadd
- f32-vsub
- f32-vmul
- f32-vdiv
- f32-vmulc
- f32-vlrelu
- f32-vcmul

这里指公开契约和指定 C-shim 模型下的部分正确性；不包含真实 ISA 对应或完整终止性。

## 当前工作

- **VLReLU**：完整验收通过，已直接提交到 `c-shim-v2`（`bf106ba7`）。
- **vmin、vmax**：已直接修复 RVV 实现，沿用此前 Frama-C 的修复。各 275 个回归样本通过；正在证明修复后的完整等价性。
- **复数乘法 vcmul**：完整验收通过，原始实现保持；证据已移入 verified。

- **s8-clamp**：已修复 bulk/tail 运算顺序差异，回归通过；正在补完整证明。u8-clamp 沿用其他 worker 的现有分工。

历史修复与原反例（PR 已关闭，后续直接提交）：[vmin PR #3](https://github.com/Etha-Sun/SALTy-rn/pull/3)、[vmax PR #4](https://github.com/Etha-Sun/SALTy-rn/pull/4)。

## 大进展

- 2026-10-22：VADD 旧结果重放通过；min/max 沿用 Frama-C 修复，保留原反例。
- 2026-10-23：VLReLU 完整验证通过，直接提交 `bf106ba7`；当时 **6/40**。
- 2026-10-23：复数乘法完整验收通过；当前 **7/40**。
- min/max 修复版、s8-clamp 继续并行证明。

**小函数验证通过，只代表“零件”通过；完整 kernel 还要单独验收。只有完整验收通过，才增加上方数量。**

工作树：`qcp-simple-kernels`；分支：`codex/worker-simple-kernels`。GEMM 等其他 worker 的工作保持原样。
环境重放证据：[checkpoint.json](.build/simple-kernels-bootstrap/checkpoint.json)。

后续发布：完整验证通过后，先 fetch，再直接提交到 `c-shim-v2` 的 `verified/`；不再开 PR。

资源：新批次默认 **16 并发、每进程 16 GiB**，按任务设置时限。修复主动参考 Frama-C 与 Arcadia-y，说明原因并验证修复后等价性。
恢复入口：[MEMORY.md](MEMORY.md)。
