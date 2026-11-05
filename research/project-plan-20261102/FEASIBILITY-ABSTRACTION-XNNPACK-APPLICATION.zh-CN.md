# 验证层次、XNNPACK 与应用实验：可行性调查

2026-11-03。只读代码与历史证据调查；没有重新编译证明、运行 kernel、产生新反例或性能结果。新论文结果仍留空，候选建议尚未成为样本选择。

## 1. 如何理解历史探索

用户希望我们理解 assembly/Sail、IR、C 的探索背景，从中解释技术选择，避免把论文写成开发过程。目前无需用户重新整理大量材料。代码可以回答模型结构和已有证明边界；未记录的转向原因和人工投入，仍需要之后简短校正。不能从分支排列推断严格的时间或因果顺序。

| 路线 | 实际对象与价值 | 证据与限制 |
| --- | --- | --- |
| Assembly/Sail/Isla | 指令、寄存器、访存和架构状态，语义更接近硬件 | 本地 handoff 与 proof/sum 记录简化 NEON 程序及部分 RVV 指令证明；研究分支完整 RVV 定理仍依赖 Hload，最终跨 ISA 程序等价未完成。没有原始 C 到简化汇编的对应证明 |
| 自定义 C/intrinsic IR，Lean | 完整控制流、字节内存、权限和向量操作，共享机器与规格接口 | Chengxi verification 分支使用 CByte，非 LLVM IR。README 记录 11/36 非空实现对的整函数证明，本轮未重放。Clang/Python 提取、intrinsic 与 ABI 解释仍在信任边界内 |
| C-shim/QCP/Coq | C 函数、循环及内存合同，spec/impl/proof 分离 | c-shim-v2 历史报告修复版的模块化部分正确性及观察等价；没有整体证明真实 ISA 对应、前端转换、编译器精化。旧 40 项是中间版本研究资产，不是最终优化版本的新实验结果 |

Chengxi 的两个分支须区分：
- [verification，4a0627dc](https://github.com/Arcadia-Y/SALTy-rn/blob/4a0627dc72d39de8b8e5c1971bcc23b267e2d4ca/verification/README.md)：CByte IR、共同观察和 kernel 证明。本轮实际读了机器定义和 [S8Clamp 结果接口](https://github.com/Arcadia-Y/SALTy-rn/blob/4a0627dc72d39de8b8e5c1971bcc23b267e2d4ca/verification/lean/Salty/Results/S8Clamp.lean)，后者分别陈述 NEON/RVV 返回共同结果内存以及行为等价。调用域与机器配置属于定理条件。
- [transpiler，3879d7c6](https://github.com/Arcadia-Y/SALTy-rn/blob/3879d7c6ea8a159d465933ed31a31137b709499e/lean-transpiler/README.md)：受限 C 的 NEON→RVV 翻译，保留结构，使用固定 NEON lane 数的 helper。明确不是已验证编译器；有限差分测试不是全输入证明。

本地证据：[Sail 状态](../sail-tooling-gap/presentation/STATUS.md)、[桥接审计](../sail-tooling-gap/bridge-audit/REPORT.zh-CN.md)、[交接](../../SERVER_HANDOFF.zh-CN.md)。另只读了 origin/feat/elementwise-verification 的 elementwise_compiler README 和 origin/c-shim-v2 的 verification/qcp/README.zh-CN.md。后者保存多期进展，早期与后期数字不能混用。

重要纠正：Sail 历史加载超时中存在平台初始化问题，桥接审计记录修正后能生成相关 trace。不能写成“Sail 无法处理 load”。实际挑战包括寄存器表示、内存/异常状态、尾部非确定性、trace 规模和证明自动化成本。

论文建议在方法节加入 Choosing the Verification Abstraction，围绕源代码保留、内存/数值语义、证明复用与信任边界解释选择。C 模型也可以是一种 IR，二者不互斥；关键是保留什么语义，以及如何建立到原程序的对应。没有受控比较时，不声称 C 普遍更快或更可靠。

## 2. XNNPACK 的共同功能与等价边界

XNNPACK 是神经网络推理的优化算子库。框架调用 operator，operator 按硬件配置选择 microkernel。同一操作有不同 ISA、tile 和算法变体，不代表这些变体天然逐位相同。

本轮固定检查 [23dd5070](https://github.com/google/XNNPACK/tree/23dd5070fa002ef0b124817798ae090fa29f9653)。

可核实的证据：
1. [unary-elementwise-config.c](https://github.com/google/XNNPACK/blob/23dd5070fa002ef0b124817798ae090fa29f9653/src/configs/unary-elementwise-config.c) 的 init_f32_abs_config 将同一个 abs 操作分派给 NEON、AVX、RVV、HVX 实现。
2. [f32-vabs 测试](https://github.com/google/XNNPACK/blob/23dd5070fa002ef0b124817798ae090fa29f9653/test/f32-vabs.cc) 对这些实现使用同一个 Abs tester；[参考操作](https://github.com/google/XNNPACK/blob/23dd5070fa002ef0b124817798ae090fa29f9653/test/unary-ops.h) 定义 std::abs。
3. [unary tester](https://github.com/google/XNNPACK/blob/23dd5070fa002ef0b124817798ae090fa29f9653/test/vunary-microkernel-tester.h) 对 NaN 使用 NaN 判断，其余按操作的 tolerance 比较，部分操作还有 supported range。测试意图不是普遍逐位等价，更不是全输入证明。
4. [transpose 测试](https://github.com/google/XNNPACK/blob/23dd5070fa002ef0b124817798ae090fa29f9653/test/xN-transpose.cc) 对对应位置使用 memcmp，是明确的精确数据搬运检查。
5. [公共头文件](https://github.com/google/XNNPACK/blob/23dd5070fa002ef0b124817798ae090fa29f9653/include/xnnpack.h) 规定额外可读 padding，也有 XNN_FLAG_SLOW_CONSISTENT_ARITHMETIC。后者希望特定构建中的路径数值一致，说明一致性具有实际用途，但不保证任意 ISA/构建间逐位相同。

此前 77 个操作族的名称交集只能做候选索引。选样还需核对 dtype、量化参数、布局、舍入、尾部、padding、别名、调用域和观察标准。

| E3 候选 | 价值 | 主要检查点 |
| --- | --- | --- |
| f32-vabs | 四侧实际分派和共同参考已找到，适合接入验证 | NaN、符号位、尾部、in-place 与 padding；不能以此代表复杂算术 |
| s8-vclamp | 整数限幅，适合定位参数和边界问题 | 真实 params initializer 与目标实现；不能混同量化操作容差和整数精确相等 |
| x32 transpose | 精确数据搬运，覆盖 stride、tile、尾部 | 实现支持的形状、读写范围、布局与 alias 合同 |
| reduction / requantization / Softmax 子核 | 可研究数值差异和合法域 | 不预设严格等价；FMA、归约次序、近似或舍入差异可能是允许的设计 |

结果分类：等价已证、合法域内违反预期语义的差异、允许的算法/舍入差异、原调用域不可行反例、模型/适配问题、未解决。只有可在真实环境复现且违背预期契约的差异才能成为 bug 候选。两个实现分别满足误差区间不推出输出相同；严格等价失败也不自动意味着库有 bug。

## 3. 应用实验的两条不同路线

### 完整 Softmax operator：建议先做接入探针

[xnn_compute_floating_point_softmax](https://github.com/google/XNNPACK/blob/23dd5070fa002ef0b124817798ae090fa29f9653/src/operator-run.c#L1881) 的真实计算链是：

```text
输入行 → rmax → raddstoreexpminusmax → reciprocal(sum) → vmulc → 输出行
```

[softmax-nc.c](https://github.com/google/XNNPACK/blob/23dd5070fa002ef0b124817798ae090fa29f9653/src/operators/softmax-nc.c) 管理参数检查、shape/stride、配置和执行上下文。这比单个 microkernel 更高一层，包含组合、中间缓冲区和批处理；仍不能称为整个推理引擎或完整模型的验证。

**路线 A：比较现成 NEON/RVV Softmax。** 不可预设严格等价。[指数子核分派](https://github.com/google/XNNPACK/blob/23dd5070fa002ef0b124817798ae090fa29f9653/src/configs/raddstoreexpminusmax-config.c) 的 ARM64 默认是 neonfma_rr1_lut64_p2，RVV 是 rvv_rr2_p6，HVX 是 hvx_rr2_p5。它们是不同近似路径；本轮未生成数值反例，只据此判断风险。[F32 operator tester](https://github.com/google/XNNPACK/blob/23dd5070fa002ef0b124817798ae090fa29f9653/test/operators/softmax-operator-tester.h) 使用相对参考值 1e-5 的误差检查，未承诺两侧逐位相同。

**路线 B：固定真实 NEON 路径，构造保持其行为的 RVV 程序。** 保留查表/多项式、融合运算、归约顺序、尾部及内存语义，再证明完整算子的输出关系。这验证源程序的实际计算，不要求顺便证明多项式的数学 exp 逼近误差。保持源运算顺序可能影响 RVV 性能，必须实测，不能用 scalar 化隐藏成本。

组合证明不能简单串联几个弱观察关系：最终输出允许忽略 ±0/NaN payload，不代表任意中间值都能忽略它们。后续 reciprocal 可能区分 +0 与 -0。需要更强的中间合同，或证明特定调用上下文不区分它们。

探针先冻结一个真实 NEON 配置的完整执行切片，检查函数指针、资源管理、C 语法、依赖和跨函数内存合同。固定分派或抽取顺序 wrapper 时，须建立与原路径的对应，不能把自造程序冒充原 operator。现有 transpiler 也不支持任意 C。

XNNPACK 已有 RVV 后端，这里的价值是指定源实现的行为保持与组合验证，不是首次支持 RVV。

### 图像应用候选

[libyuv I420Rotate](https://chromium.googlesource.com/libyuv/libyuv/+/refs/heads/main/source/rotate.cc) 是真实三平面图像旋转，精确整数搬运比 Softmax 的浮点关系自然。但检查到 [AArch64 NEON 转置](https://chromium.googlesource.com/libyuv/libyuv/+/refs/heads/main/source/rotate_neon64.cc) 使用 inline assembly，因此不是当前 C/intrinsic 框架的低成本直接样本。采用它需要补汇编对应证明，或另选真实 intrinsic 程序，不能先改写 NEON 再隐去对应义务。本轮 libyuv 仅调查 main，正式选样需要冻结提交。

当前建议：E3 精确语义小核进入选样；E4 先探索完整 Softmax，再决定是否扩展真实多算子子图。完整模型推理尚无低成本可行性证据。若 E4 必须是多算子应用，单独 Softmax 只能作为前置实验，不能更名充数。

## 4. 后续最少需要的背景

暂无必须先提供才能继续调查的材料。之后请用户校正：Chengxi 所指是否就是 verification 分支；代码外，当时转向 C 的主要研究原因。如果另有 LLVM IR 路线，需要入口，当前材料不能称为 LLVM IR 验证。

本调查不计新实验完成量，不启动 worker，不修改待批准后才生成 LaTeX 的安排。

