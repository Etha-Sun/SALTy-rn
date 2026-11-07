# W04：E3-33 正对照，s8-rmax NEON ↔ RVV

## 目标
对 XNNPACK 中同一功能的两个独立实现做整核等价性验证（E3 正对照，整数精确，预期相等）：
- A：`src/s8-rminmax/gen/s8-rmax-neon-u32-acc2.c`（`reduce-config.c:113` 注册）
- B：`src/s8-rminmax/gen/s8-rmax-rvv-u8v.c`（`reduce-config.c:144` 注册）

两个文件都直接取自 `benchmark/XNNPACK`（`867d5a34`），逐字节放进 `impl/`。

## 要求
- 采用 v2 布局（样板见 `build/e2e3-workers-20261106/w01-v2-template/work/f32-vadd-v2/`；如果 W01 还没完成，就先按 v1 布局做，最后再迁）。
- 先核对调用契约：两侧的签名、params 和 init、初值约定（是否从 `output[0]` 读入初始最大值）、`batch` 的单位，写进报告。
- RVV 侧先用规则工具 `tools/rvv_ptr_lower` v1.4 做指针化改写，输出放进 `proof/lowered/`。工具拒绝的构造按规则 1 处理。用数组字段表示 RVV 向量，检查 VLEN 512、128、256 三种。可以参考 RVV probe 和 `build/qcp-kernel-framework/verification/qcp/verified/qs8-rsum`、`qu8-rsum` 的归约证明思路（旧包是中间版本，只能参考方法）。
- 已知 QCP 限制见 `research/bugs/qcp/`（QCP-001..004）。遇到新的 QCP 问题，先缩出最小复现，再写进报告。

## 完成标准
- 从空目录运行 `proof/check.py --jobs 32`，rc=0，三种 VLEN 都通过，门禁项齐全（调用闭包、Print Assumptions、非空性见证）；或者给出确切反例，并按 L1 分析。
- `REPORT.md` 写清契约核对结果、规则工具的输出摘要、shim 中新增的整数 intrinsic 合同清单（交监督者审核），以及各阶段遇到的问题。
