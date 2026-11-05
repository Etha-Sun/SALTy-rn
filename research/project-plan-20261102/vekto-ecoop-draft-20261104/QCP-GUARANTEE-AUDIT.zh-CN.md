# QCP 现有 proof obligations 的保证范围

2026-11-04，只读源码与历史产物审计。没有 fresh 编译，因此不能把本次检查说成新证明通过。

## 确认的版本

- `build/qcp-kernel-framework` 是实际 `c-shim-v2` worktree，HEAD `3cf039008`；该版本 `verification/qcp/verified/` 有 5 个目录。
- `build/four-isa-vabs` 是 `821969733` 起点的派生工作树；其 `verified/` 有 40 个目录，是此前讨论的历史 40 项资产。两者不是相同 snapshot。
- QCP 安装目录 `.local/qcp/QCP-V2.1.4` 的 README 说明符号执行及 Rocq/Lean 后端，本审计以既有 Rocq/Coq packages 为准，不由版本目录名推断健全性已经证明。

## 1. 终止性：当前没有被纳入完整保证

直接证据：

- `build/qcp-kernel-framework/verification/qcp/verified/README.zh-CN.md` 第 6 行明确：“真实 ISA 与 shim 的对应、终止性及浮点异常标志不属于这里的完成计数。”
- `.../f32-vadd/proof/check.py:180` 写明 `C-shim partial correctness under the contracts in spec.c.`；第 182 行写明 `No hardware-to-shim correspondence or termination theorem.`。vsub/vmul/vdiv 同样如此。
- VADD 的 `proof/coq/ByvalueRvv/macro_unit_goal.v` 中循环义务包括入口建立（`test_rvv_entail_wit_2`）、循环体调用/资源变换、保持和 return，而不是一个从所有初态构造有限返回执行的 total-return 定理。
- `proof/coq/ByvalueRvv/MacroKernelChecked.v` 实现 `VC_Correct`，组合这些已定义的义务。返回义务 `return_wit` 只约束到达返回位置时的状态，不证明必定到达。

对 5 项主分支和 40 项派生树的 `proof/coq/**/*goal.v` 做 Definition 名称扫描，分别读取 93、357 个 goal 文件；发现 safety/entail/return/partial_solve/which_implies 等命名，没有 termination/decrease 命名。这只是辅助检索证据，**不以关键字缺失代替语义判断，也不把定义数当作独立 VC 数或完成数**。结论主要依据显式边界说明和实际 loop/return 义务。

[QCP 论文](https://arxiv.org/html/2505.12878v1) §3 的 termination 字样出现在特定循环退出分支的讨论，不能解释成一般终止性证明。[循环教程 T3-6](https://www.qua.codes/en/tutorials/t3-6.html) 描述 invariant、true/false branches 和 continue 的不变量义务，没有据此建立 total correctness 的承诺。

## 2. 内存：存在实质检查，但须限定模型与合同

具体 VADD 证据：

| 文件 | 可见内容 | 能支持什么 |
|---|---|---|
| `f32-vadd/spec.c:20` 起 | 输入 `FloatArray::full(...,batch/4+3,...)`，输出 `undef_full(...,batch/4)`，使用分离合取 | 提供加载/写入资源，输入 padding，分离要求；不是只声明 output 相等 |
| `spec.c:26` 起 | Ensure 返还相同输入 A/B，输出为 `vadd_values` | 输入内容保持、输出初始化及功能值 |
| `proof/coq/QcpVadd/array_read_goal.v:52` 起 | `0<=i<n`，full array 拆为 indexed `Float |-> value` 和 `missing_i` | 下标与读资源对应，不仅是数值函数正确 |
| `proof/coq/ByValue/shim_unit_goal.v:35` 起 | load 的各元素地址各有 `Float |->`，返回向量对应各 lane | load 建立在实际拥有的内存上 |
| `proof/coq/ByvalueRvv/macro_unit_goal.v:342` 起 | 已完成输出前缀为指定值，剩余输出为 undef；指针对应已处理元素数 | 循环内输出 footprint 和前缀保持 |
| `proof/coverage.py:11` 起 | kernel、shim、load、store、compare、wrapper 的 C 单元闭包 | 意图检查实际函数体依赖，避免只证明 wrapper |

`safety_wit` 中有不少只是整数字面量/表达式的合法范围；内存资源检查还在 entail、partial_solve、函数调用和符号执行能否继续中。因此不能用 `safety_wit` 数量充当内存安全覆盖率。

[QCP 官方 T3-3](https://www.qua.codes/en/tutorials/t3-3.html) 明确说明：找不到解引用所需 store 时符号执行报错；可符号表达的除零和有符号算术范围条件会成为 VC。它讨论 null/dangling/out-of-bounds，但我们的论文还需限定本项目实际内存模型、precondition、对象/地址假设和信任边界。此次没有证明 QCP 覆盖整个 ISO C 标准的所有 UB。

可写的保证：**相对于审阅过的 C-shim 模型与调用契约，完成相应函数体和依赖 VC 后，建立 modeled memory-access safety、输入/框架资源保持及返回结果关系。** 不能简化为“任意本机二进制在所有硬件配置上绝对安全”。浮点 NaN/Inf 是数值域问题，与硬件 exception flags 是否被观察不同。

## 3. Axiom 出现在接口里不等于靠公理证明

`wrapper_goal.v` 的 `Module Type VC_Correct` 用 `Axiom proof_of_...` 声明待实现接口；`wrapper_checked.v` 的实现模块必须提供这些字段。`coverage.py` 构造 `Module Check_... : ...VC_Correct := ...` 进行匹配。`check.py:91` 还禁止本地证明源码出现 `Admitted/admit/Axiom/Parameter`。这些机制与“只 grep Qed”不同。

外部库、公理及工具健全性仍要单列审查。[QCP 2025 论文 §6.1](https://arxiv.org/html/2505.12878v1) 明确当时缺少 symbolic executor 的 soundness proof；本地版本没有足够证据允许本稿声称已经解决。Rocq 检查某个生成命题的证明，不自动认证 C→VC 的转换。

## 4. 写入稿件的结论

正文按有依据的 **partial correctness / output equivalence under explicit contracts** 写；内存不被排除，而以模型、资源及 frame 的形式说明。终止性是当前明确缺项，并用红色 TODO 指明需要实际证明，不能借用附件 byte-machine 的 total-return 结论。对新 35 个最终优化 kernel，以上结构是方法依据，仍需逐项建立新的完成证据。
