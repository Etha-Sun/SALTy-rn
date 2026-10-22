# CSim 参考审计：原始 kernel、共享 intrinsic 与工具模型

审计参考为只读 `build/verified-output-equivalence` 的 `feat/shim-c` 工作树。完整来源路径、当前 commit、关键文档 SHA 与每项 case 对照写入 `../catalog.json`。该目录的旧 handoff/wave1 checkpoint 数量已经过时：当前 `verified/manifest.json` 有 **16** 个历史收录项，最新 `experiments/integration-wave2/CHECKPOINT.zh-CN.md` 记录 f32-vlrelu 的新增收录。另有 **9** 个被隔离的历史条目，不能再作为有效 proof 引用。本轮没有重跑这些历史证明，也没有把其通过状态转成 QCP 状态。

## 已核对的原始 vadd 身份

上游 Keegan `be16280c` 与 CSim `verified/f32-vadd-v2` 两个文件分别逐字相同：

| 对象 | 上游路径 | CSim 路径 | SHA-256 |
|---|---|---|---|
| NEON | `kernels/source/f32-vadd.c` | `verified/f32-vadd-v2/neon.c` | `f7f8f8ffaca807aaa9839ba199fb93bac5cf79700c6c5d2f847731b0ab33eeb5` |
| RVV | `kernels/target/f32-vadd.c` | `verified/f32-vadd-v2/rvv.c` | `6497d442136719b18ff5233adc6091a140c45973c84658431b7986f32acee593` |

因此 vadd 的原始调用入口可以直接引用，不需要把 CSim 的 kernel 修复移植过来。QCP 对 struct/参数传递的 lowering 仍需独立身份/语义检查；“原始文件没变”不能替代“lowering 正确”。其旧 `interface.json` 为 `binary-f32 / padding=3 / number-or-both-nan`，可复用为新的人工可审查接口配置。

16 个历史收录项的 NEON 均与当前上游逐字相同；RVV 有 **12** 项相同，**4** 项不同：`u8-vclamp`、`f32-vmin`、`f32-vmax`、`qs8-vcvt`。这些差异已逐项记录 SHA；不同不自动等于错误，需查看修复目的及原反例。

## 第一类：确实修改了 RVV kernel 的独立候选

下表来自 `experiments/shared-extension/results.json` 的 `target_repair` 与 `docs/shared-shim/EXTENSION-RESULTS.zh-CN.txt`；14 项是历史独立 target 候选，不是14个已形式证明成功的新 kernel。其相应候选路径、SHA及与新上游的字节对照在 catalog 中。差异相对于当时声明的输入域、观察关系与 C shim，不直接断言所有产品参数域或真实硬件存在相同问题。

| Kernel | CSim 记录的修复 | QCP 接入要求 |
|---|---|---|
| f32-vmin / f32-vmax | ARM NaN propagation 与 RVV minimumNumber/maximumNumber 的差异；target 增加 mask/merge | 原 intrinsic 语义分别保留。原版与修复版另立 case，不能在 shim 中把两者统一 |
| f32-maxpool / f32-igemm-minmax / f32-dwconv2d-chw / qd8-f32-qc4w-gemm-minmax | NaN clamp propagation | 保留完整 NaN 域与修复来源，重放原反例后决定采用哪个 target 版本 |
| f32-conv-hwc2chw | 第二输出行缺 upper clamp、masked 越界 load、NaN | 原版与修复候选单独冻结，内存访问和边界分支必须实际证明 |
| f32-dwconv-minmax | 固定4通道 packed 权重与 VL 推进布局不匹配、NaN | 不是只靠 intrinsic 契约可解决，需要布局与循环证明 |
| f32-spmm-minmax | 融合/非融合次序、NaN、非零 cursor displacement reset | FMA 必须单次舍入；稀疏 cursor 的重置对应单列义务 |
| f32-raddstoreexpminusmax | 归约树带来的 1 ULP 差异 | 保持要求的归约次序，不能将精确比较临时改为容差 |
| qs8-vadd-minmax / qu8-vadd-minmax | 负/大移位编码 | 显式建模 shift 宽度、符号、VXRM 与饱和 |
| qs8-vcvt | saturating high multiply 的窄化 | 使用单独修复 target；旧原始反例保留 |
| qs8-vmul-minmax-fp32 | magic-bias 位算法与 numeric float conversion 不同 | 位表示与数值转换不可互换，需要原算法对应模型 |

另外两个时间上独立的修复记录：

- **f32-gemm-minmax**：更早的 `experiments/gemm-repair/README.zh-CN.txt`、`kernel.patch`、`original_rvv.c`、`repaired_rvv.c` 记录 NaN clamp 修复；该实验未进入 verified。上游新分支保持自己的原始 target，没有静默使用 CSim 修复版。
- **f32-conv-hwc2chw 的后续右边界修复**：`experiments/codex-kernel-wave1/WAVE2-REVIEW.zh-CN.md` 第“卷积”记录奇数宽度末列，NEON 跳过右侧 FMA，但 RVV 执行 `0 * Inf`。独立 target 用已有 mask 跳过并保留 accumulator；该回归结果不是整核形式证明。

**新上游 u8-vclamp 与 CSim u8-vclamp 不同。** CSim 在当时空 target 基础上另写了实现，并在 `u8-vclamp-v3` 验证；Keegan 本次独立填充 target。应把新文件作为新 case 重新验证，不能继承旧 proof 或把两者视为相同实现。另外三个新增 target 在旧 CSim 清单中缺失，没有可继承的整核证明。

## 第二类：共享 intrinsic 的 C 实现与语义选择

CSim 的 `verified/shared/float_ops.c` 使用真实标量 `a + b` 和 lane 循环实现 vadd，未把 vadd 本身换成仅有合同的外部函数。其 `base` 提供固定 VLEN=128 的 VL 调度；类型/LMUL/SEW决定容量，e32m8 为32个 lane。QCP 可以复用这种语义分解，但 by-value struct 到 out-parameter struct 的转换需要单独检查。

`experiments/shared-extension/float/PROOF-NOTES.zh-CN.txt` 明确要求 ARM min/max 与 RVV min/max **分别建模**，以及 `vmlaq` 与 `vfmaq` 保持非融合/融合区别。这些是共享库必须承载的语义差别，不应为 kernel 等价而修改成相同函数。库中的 signed zero、NaN 分类、舍入、lane 越界、inactive lane、memory frame 都是需要审查/证明的合同内容。

本审计没有发现需要为 **vadd** 移植的已知 intrinsic 实现 bug 修复。也没有对378个词法 API作完整实现正确性审计；“库已有某个函数”不表示该函数在 QCP 中已证明。共享库应记录每个 primitive 的 `spec-only / body-checked / ISA-correspondence-checked` 三种独立状态。只写 spec 的阶段可以帮助产生 kernel VC，但对 spec 的实现义务不能因此消失。

## 第三类：Frama-C / Why3 工具模型修复

以下来自 `experiments/shim-c-v2/MODEL-AND-TCB.zh-CN.txt`、`toolchain-build/` 及 wave1 审计，不是 kernel 或 intrinsic C 源码修改，**不能直接作为 QCP 所需源码补丁**：

| 旧修复 | 对 QCP 的启示 |
|---|---|
| 删除与 IEEE 特殊值冲突的20条无条件 Cfloat 公理，使用 native IEEE 运算 | QCP/Flocq 的特殊值模型应单独审核；保留 NaN/Inf/±0 正反例，不复制旧公理 |
| Frama 前端负零字面量、浮点常量折叠、float/double 经 Real 转换丢失特殊值 | 针对 QCP C→逻辑翻译建立相同语义探针；现有工具不同，不能宣称同样存在/已经修复 |
| FMA 和 `fmaf` 单次 RNE 模型 | 共享 FMA 契约不能写成两次舍入的乘加 |
| Cint cast/mod 辅助定理、builtin NaN 模型 | 在 Coq 中提供实际证明，不能以自由 axiom 导入 |
| memcpy 区间终点/目标旧内存错误、byte/word 表示桥 | QCP 使用自己的 separation logic 资源/字节桥，需读写 frame 与表示关系证明 |
| 旧 Bytes+float 无界双向 encode/decode 导致矛盾；NaN payload 多对一 | 不为所有 NaN bit pattern 假设数值双向 bijection；观察等价和位级等价要区分 |
| 旧 Bytes 全局有限 pointer range 与无限offset/inverse冲突；v4/v6删除11行公理 | 再次说明历史“全绿”不是模型健全性证明。QCP 需记录自身公理/显式 theorem 参数，不能复用Frama绿色数量 |
| checker 曾允许无body ghost外部合同、后来补依赖闭包守卫 | QCP 必须覆盖实际 kernel/helper/mapper/comparator body；仅 prototype 契约不能算整核闭合 |

旧 pointer-range 问题的独立 Lean 审计、native-v6 来源和正反控制在 `experiments/codex-kernel-wave1/audit/pointer-range-consistency-root01/`、`maxpool-address-wave2/native-v6-provenance.README.zh-CN.md`、`WAVE2-REVIEW.zh-CN.md`。这些只说明旧模型的某个已知冲突及新版本的资格检查，不构成整个内存模型的一致性证明。

## 框架决策

保持 `kernels/source` 与 `kernels/target` 原样。每次选择原版或独立修复版本都写进 case 输入清单和人工审查面；proof 层只补注解、引理、不变量及经过检查的辅助证明。对于数学上确实不满足当前观察等价的原版，报告可重放反例，而不是继续补不可能的 proof。

对 vadd 先验证小而真实的 load/add/store/VL 实现，随后验证两个原始 kernel 和 comparator 的完整依赖闭包。这个路径可形成共享资产。仅 spec 的 intrinsic 模式可作为暂时的条件性验证入口，但不应作为最终验收模式；ISA→shim 的对应始终单列，不能由 C body Coq proof 冒充。
