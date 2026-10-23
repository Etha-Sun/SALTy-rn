# 原始 GEMM 控制流的前端诊断与 annotation cut

这是 PR7 原输入的后续诊断。**未修改 QCP binary，未获得 symexec C 源码，因此不是工具源码修复。**
已将原 SIGSEGV 缩减为不含浮点、intrinsic 或堆资源的十行 C 回归，并找到不改变执行 token 的显式证明 cut。

- [最小崩溃输入](regressions/for_then_if_k.c)：`do` 内的 `for` 后跟 `if`。
- [最小修复输入](regressions/for_if_explicit_cut.c)：仅在 `for` 后增加 `Assert`，保留退出时的不变量与 `k<8`。
- [最小证明](MiniChecked.v)：15 个真实 Coq 证明，整个 `VC_Correct` 模块封闭；8 个安全 VC 依赖 QCP 的 `eval_addr_expr` 参数，另 7 个 VC closed。
- [完整原控制流 GEMM](neon-original-with-for-exit-cut.c)：在相同位置增加完整内层不变量的退出 cut，函数 Require/Ensure 不变。
- [本次输入 shim](input/shim.h)：从 PR7 逐字复制，只删除未使用的 `GemmNeon.PartialOutput` import；全部 intrinsic 合同、宏、布局声明保留。

最初完整 cut 输入已成功生成 **474 个 C VC**（393 个 auto 模板、81 个 manual 模板；模板含 `Admitted`，都不算证明），249.69 秒、RSS 2309660 KiB。
这解决了目标生成崩溃，**不等于证明 GEMM**；intrinsic 实现/ISA 对应、所有 C VC 和跨 ISA 最终组合仍需独立闭合。

补齐下述依赖后，474 个目标的普通 Coq 编译通过。[SafetyChecked.v](proof/Subset/SafetyChecked.v) 进一步证明全部 78 个 safety VC，[SafetyGate.v](proof/Subset/SafetyGate.v) 检查它们的合取并打印 79 份假设报告；其余 396 个 VC 显式保留未完成。这些 safety VC 主要检查整数常量范围、断言前置条件和 `sizeof(float)`，不是完整内存安全证明。所用的九项既有框架/经典逻辑假设由 checker 限定并列入结果。
完整 GEMM 新增的循环退出 cut 本身也需在剩余义务中证明；最小例子通过不能代替这一证明。
最终重新生成和整合 checker 重放已通过：[结果](evidence/checked-subset.json)、[假设报告](evidence/checked-safety-assumptions.log)、[回归及生成记录](evidence/final-replay-results.json)、[输入身份](evidence/checked-inputs.json)。最终生成的 474 个目标与前一轮逐字一致。

## 原因定位与证据

[诊断结果](evidence/diagnosis.json) 和 [最小输入 ptrace](evidence/minimal-ptrace.log) 捕获 `RIP=0x116753a, RAX=0, *(RDI)=0`，与 PR7 历史故障 PC 相同。
仅有 `do`、嵌套 `for` 后无 `if`、外层改为 `while`、内层改为 `while` 都不会触发该最小故障；这些控制组只用于定位，**完整 GEMM 保留原 do/for**。
完整冻结输入的新 trace 也再次139，159.54秒、RSS1616348KiB。trace 已进入外层 do 的后续执行，在内层循环处理处停止。

这支持“do 中嵌套 for 后接条件语句的状态处理缺陷”，但没有源代码和符号信息，不能宣称已确定源代码层面的对象生命周期错误。
本地 release 和检查的公开 upstream 仓库只提供 symexec binary；搜索不到 `SymExec/Trans/PS_ExprTrans.c` 实现。
现有 cut 的作用是增加一个必须证明的边界，不能将它当作假设直接跳过。

## 补齐公开依赖

最初普通 `coqc` 在 `GemmNeon.LayoutModel` import 处失败；公开 PR6 不含该模块，也不含 copy strategy 的 Coq 目标/证明。
本目录采用以下实际依赖，未加入空语义模块或公理：

- `LayoutModel.v` 导出已审核 VADD 的 `QcpNeon.NeonBridge`，复用相同的两种 struct 未初始化资源定义；checker 在本次 build 中重新编译原 VADD 文件。
- `copy_strategy_goal.v` 从 PR7 原 `copy.strategies` 用固定 StrategyCheck 重新生成。
- [copy_strategy_proof.v](proof/GemmNeon/copy_strategy_proof.v) 给出三条规则的真实证明和 Print Assumptions。
- 不使用的 `PartialOutput` import 在注解输入中明确删除后重新生成目标，不提供伪造占位定义。

## 重放

使用已配置的 PR5 环境，先运行 PR6 模型检查，再运行本目录。若已有同一来源且成功通过的模型 run，可直接复用，checker 会核对所有源文件与编译对象哈希。

```sh
export QCP_HOME=/path/to/QCP-V2.1.4
export QCP_LAYOUT=dune
export QCP_COQC=/path/to/coqc-8.20.1
python3 verification/qcp/candidates/f32-gemm-minmax-model/proof/check.py \
  --name model-fresh01 --jobs 2
python3 verification/qcp/experiments/gemm-qcp-frontend-fix/replay.py \
  --name fresh01 --full-gemm
python3 verification/qcp/experiments/gemm-qcp-frontend-fix/check_generated.py \
  --run verification/qcp/experiments/gemm-qcp-frontend-fix/.build/fresh01 \
  --model-run verification/qcp/candidates/f32-gemm-minmax-model/.build/model-fresh01
```

省略 `--full-gemm` 仅运行7个小回归并真正检查15个最小 VC。每次 name 必须新建。
完整模式检查 PR7 冻结输入哈希、cut 的精确推导、原执行 token 和执行 CPP SHA；当前 shim 只允许删除指定未使用 import。
`check_generated.py` 复用已通过公开模型 run 的项目 `.vo`，核对其源/对象身份；本次会重新编译 VADD 结构定义、3条策略证明、完整 goal 类型和安全性子集。子集 gate 逐项检查全部 78 个 safety 目标并报告假设，不编译带 `Admitted` 的 GEMM 模板；其余 396 个 VC 仍未闭合，不宣称全核证明。
生成目标、未完成模板、大 trace 与编译对象留在 `.build`，证据目录保留紧凑报告。
