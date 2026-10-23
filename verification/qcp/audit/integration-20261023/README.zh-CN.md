# c-shim-v2 集成与 GEMM 推进（2026-10-23）

PR [#5](https://github.com/Etha-Sun/SALTy-rn/pull/5)、[#6](https://github.com/Etha-Sun/SALTy-rn/pull/6)、[#7](https://github.com/Etha-Sun/SALTy-rn/pull/7)、[#8](https://github.com/Etha-Sun/SALTy-rn/pull/8) 已合入 `c-shim-v2`；远端提交身份见 [merged-prs.json](merged-prs.json)。
PR #1 是协调看板，PR #2 是旧环境方案；本次保留未合并，采用 #5 的当前环境工具。已关闭的 #3/#4 没有重新引入。

整核清单保持 **6/40**：VADD、VSUB、VMUL、VDIV、VMULC、VLRELU。它表示各公开合同下的 C-shim 模块化部分正确性，不包括 ISA 对应和终止性。本次新增的共享能力与 GEMM 诊断不计作整核完成。

## 独立重放

| 对象 | 本次结果 | 证据与范围 |
| --- | --- | --- |
| 环境工具 | 13 项布局/源码控制及 5 项来源控制通过 | [环境记录](environment/README.zh-CN.md)，固定 QCP 来源、Coq 8.20.1、隔离 Dune 布局 |
| VADD | 11 个 C 单元、8 条策略、87 个本地 Coq 模块及 FinalCheck 全部通过 | [摘要](environment/vadd-summary.json)，16 并发，约 381 秒；历史 package 状态未覆盖 |
| GEMM 数值/内存模型 | 34 个模型模块及 ModelGate 从源码通过 | [结果](gemm-model/result.json)、[Coq 日志](gemm-model/coq-logs.txt)，约 94 秒；**0 个 C VC** |
| u8 尾存储 | 41 个 C VC、2 条策略及完整 gate 通过 | [复查](u8/review.json)；native ASan/UBSan 每种 store 检查 131072 个输入，不是整个 u8 kernel |
| GEMM 六个 NEON intrinsic | 81 个 C VC、2 条策略，15 个项目模块/gate 全部通过 | [结果](../../candidates/f32-gemm-minmax-primitives/proof/evidence/vector-fresh01/result.json)，约 104 秒；包含 39 个标量、19 个复用 byte-copy、23 个向量 VC |
| 已有六个整核记录身份 | spec/status 与 manifest 中的 hash 全匹配 | [身份核对](verified-manifest-check.json)；除上面的 VADD 外，不表示本次重跑了另外五个整核 |

本机原始 QCP 的 in-place/Dune 安装均未直接通过环境检查。本次从固定源 archive 提取源码、链接既有外部 Dune 编译产物并配置完整 namespace，建立独立环境；没有修改共享安装。上述项目本地证明重新编译，但外部 QCP/Flocq 库复用既有产物，未重新建立外部源码到 `.vo` 的构建历史。

## 新的 GEMM 进展

原始 [NEON/RVV 与公开合同](../../candidates/f32-gemm-minmax-model/README.zh-CN.md) 保持独立审查入口。原始两侧在 NaN 上存在已记录反例；正向等价目标使用单独保存的 RVV NaN 修复，不能将原始两侧宣称为全域等价。

[前端推进](../../experiments/gemm-qcp-frontend-fix/README.zh-CN.md) 将崩溃缩小为 `do` 内的 `for` 后接 `if`。插入显式循环后断言后，最小例子的 15 个 VC 有真实 Coq 证明；原始 NEON GEMM 只增加同类断言便生成了 474 个 C VC，执行 token、执行预处理 hash、Require/Ensure 保持不变。补齐布局与三条复制策略、删除未使用的 import 后，全部目标能在普通 Coq 中编译。

其中 **78 个 safety VC 已有真实证明，396 个 VC 仍未闭合**，清单与假设见 [子集结果](environment/gemm-safety-subset.json)。这 78 项主要是整数常量范围、断言前置条件和 `sizeof(float)`，不表示完整内存安全或循环正确性。子集 gate 不实例化完整 kernel 的 `VC_Correct`，没有用 `Admitted` 填充剩余义务。

[intrinsic 能力](../../candidates/f32-gemm-minmax-primitives/README.zh-CN.md) 提供四个标量 min/max 和六个向量 intrinsic 的实际 C body：`vminq_f32`、`vmaxq_f32`、`vdupq_n_f32`、`vdupq_lane_f32`、`vget_low_f32`、`vget_high_f32`。合同与原 GEMM 的声明逐字核对；NEON NaN 传播和 RVV number-selection 模型保持不变，保留 NaN、无穷、subnormal 和带符号零。Native 另有 7351232 次精确位比较及两个错误实现负对照。完整向量 load/store/FMA 和 GEMM 整核仍未闭合。

剩余主线是：闭合原始 kernel 的全部 C VC、精确融合 FMA 等实际 intrinsic 实现、RVV 修复源码的前端适配与对应、caller 的完整依赖检查。数学模型、生成的目标文件和未检查的自动证明骨架均不能替代这些步骤。

FMA 缺口不是增大内存或超时就会消失的证明搜索问题：当前 QCP `FloatLib` 有独立加法和乘法，而 GEMM 的 `fma_rne` 是 Flocq 的单次舍入模型。[FmaModel.v](../../candidates/f32-gemm-minmax-model/proof/coq/GemmSpec/FmaModel.v) 已检查的反例证明普通 `a*b+c` 和先用 `double` 再转换两种替代均不满足该合同。要关闭这一层，需要实际实现及其证明，或明确另立并审核 FMA 语义扩展；本次没有新增可信 extern 来掩盖缺口。
