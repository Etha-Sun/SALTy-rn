# Motivating example 候选与证据边界

2026-11-04。只核查既有源码和归档记录，没有重跑验证或性能。当前没有确认满足全部要求的案例，以下供作者挑选，不作为新实验结果。

## 用户要求保留的完整叙述

- 用短小的 NEON 源码和最终优化 RVV 源码，直观展示固定宽度 SIMD 与 RVV 的向量长度、尾部处理或数值语义差异。
- 最终优化 RVV 比同平台 XNNPACK RVV 基线更快。不能把 ARM 与 RVV 的跨平台比值混入这项比较。
- 展示真实 intrinsic 语义定义，解释它如何支持实现证明。
- 展示验证反馈、合法输入域内的具体反例和两侧不同的输出。证明失败本身不是反例；区分求解器生成反例、人工构造反例和 C-shim 回放。
- 尽可能展示既有 bounded verification 未发现的问题。保存同一候选的通过日志、输入长度、参数范围、浮点策略、模型和版本，再定位漏检原因。
- 根据反例完成最小必要修复，保留 NEON、优化结构和合法输入域，并验证修复后的真实实现。
- 小图比较 XNNPACK RVV、最终优化 RVV、修复后的最终优化 RVV。错误候选的性能只作诊断，图注明确其不等价，不能当作可部署加速。报告修复的实际成本及测量不确定性。
- 正式 LaTeX 使用源码文本和语法高亮，例如 listings 或 minted，禁止用代码截图。提供可编辑源码、可定位行号、统一颜色和字号；说明放题注。当前不生成 LaTeX。

## 最接近的两个候选

| 候选 | 历史 NEON / 原 RVV / 修复 RVV 物理行数 | 最终优化 RVV 物理行数 | 修复 | 历史 original/repaired cycles |
| :--- | :--- | :--- | :--- | ---: |
| f32-vmax | 43 / 29 / 36 | 62 | NEON 不变，RVV 增加 5 条语句 | 0.933553 |
| f32-vmin | 43 / 29 / 36 | 67 | NEON 不变，RVV 增加 5 条语句 | 0.903857 |

行数包含空行、注释和签名。两者历史修复版本增加 7 个物理行，其中 5 条为执行语句。最终优化版本有不同的循环结构，不能沿用这些修改行数或旧证明。

优先考虑 **f32-vmax**。最终版本把满向量循环和一次可变长度尾部拆开，适合与 NEON 固定四元素循环、显式尾部存储并列。**f32-vmin** 的最终版本还提前加载下一块，并保存当前与下一块的长度，优化结构更明显，但解释成本较高。它们都保留了相应的 RVV min/max 指令；这是值得在最终版本重新核查的线索，不是最终版本已完成验证或已确认违反其调用域的结论。

## 已有的具体反例

两个候选的历史 C-shim 回放记录都包含：

```text
n = 1
input_a_bits = 0x7fc12345  (quiet NaN)
input_b_bits = 0x3f800000  (1.0f)
NEON output = 0x7fc12345  (NaN)
original RVV output = 0x3f800000  (1.0f)
equivalent_return = 0
```

这是 NaN 与数值不等，不是被我们观察关系忽略的 payload 或正负零差异。归档语义中 NEON min/max 传播 NaN，RVV min/max 在只有一个输入为 NaN 时返回另一个数值。修复保留原 min/max，检测两输入是否为 NaN，再用加法产生 NaN 并通过两次 merge 选择结果。

归档记录的反例来自 **本机 C-shim 回放**，不是实际 ARM/RVV 硬件执行，也不能称为 QCP 自动返回的反例。修复后的历史 full-run 状态记录整 kernel 验证通过，适用声明的模型和配置。证明固定 VLEN=128、SEW=32、LMUL=8，具有部分正确性及语义对应的边界；额外加法的异常标志不在观察中。此次没有重新检查证明。

可直接打开审阅：

- vmax：[NEON](sources/motivating-example-candidates/f32-vmax/neon.c)、[最终优化 RVV](sources/motivating-example-candidates/f32-vmax/final-optimized-rvv.c)、[历史修复 diff](sources/motivating-example-candidates/f32-vmax/repair.patch)、[实际 Coq 语义](sources/motivating-example-candidates/f32-vmax/Model.v)、[反例记录](sources/motivating-example-candidates/f32-vmax/original-replay.json)。
- vmin：[NEON](sources/motivating-example-candidates/f32-vmin/neon.c)、[最终优化 RVV](sources/motivating-example-candidates/f32-vmin/final-optimized-rvv.c)、[历史修复 diff](sources/motivating-example-candidates/f32-vmin/repair.patch)、[实际 Coq 语义](sources/motivating-example-candidates/f32-vmin/Model.v)、[反例记录](sources/motivating-example-candidates/f32-vmin/original-replay.json)。
- [固定版本、源码哈希与性能行](sources/motivating-example-candidates/provenance.json)。

## 缺失的关键证据

- 历史性能分母是修复后的中间 RVV，分子是修复前的中间 RVV，未包含 XNNPACK 基线。对应运行时间增加约 7.12% 和 10.64%，不能写成最终优化版本修复的成本。
- 性能使用 VLEN=512，历史证明固定 VLEN=128。两者不能拼接成同配置的证明与性能结果。旧 AB/BA 结果没有置信区间，源码相同的对照项也有约 12% 至 15% 波动，因此不能据此确立这两项小幅变化的因果关系。
- 尚未建立最终优化版相对 XNNPACK 更快的同平台测量，也没有最终优化版的最小修复及完整证明。
- 尚未找到绑定这些具体版本的 bounded verification 通过记录与完整 harness。不能写“该问题被 bounded verification 漏掉”。

## 对照 SALTyRN 写法后的判断

用户提供的 SaltyRN.pdf 第 2 页图 1/2 用 vmulc 的两段真实代码说明固定宽度与 VLA 控制流；第 6 页图 4 展示 intrinsic 的符号语义定义。这种从实际代码进入语义模型的顺序值得保留。Vekto 的案例还需要接上反例、修复和重验的证据。

该文第 3 页 II.B 明确指出：输入长度有界，但在每个选择的长度上输入值是符号的。第 5 页 III.B 已经描述 SAT 反例驱动修复。因此，不能把“能够给出反例并修复”本身当作 SALTyRN 缺失的能力。

长度 1 的 NaN 反例可以被正确建模且允许 NaN 的 bounded 检查发现。若同版本真的被接受，应先核对 NaN 语义、合法域、比较策略、验证阶段及日志。只有反例发生于未检查的长度，才支持长度覆盖不足的解释；模型缺陷或前提差异应按实际机制报告。若希望突出任意合法长度证明的收益，优先寻找跨循环迭代、VL 边界或尾部覆盖的真实案例，不人为制造 bug。

其他旧候选暂不优先：s8-vclamp 的 min>max 反例需要先核对原调用契约；qs8-vcvt 的扩展参数范围和 NEON 修改也需要审查。maxpool、expminusmax 和 spmm 的旧修复有明显性能下降，不适合作为保留优化收益的首选案例。此次是基于旧 40 项审计资料筛选，不是 40 项重新验证。
