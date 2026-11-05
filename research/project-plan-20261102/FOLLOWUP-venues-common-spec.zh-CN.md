# 后续投稿窗口与四 ISA 共同合同

2026-11-02。回应两个问题：ECOOP 之后的投稿选择；77 项交集的对齐含义，以及能否用一个系统、类似 `spec.h` 的接口统一验证。投稿信息来自当日官方 CFP；技术判断来自固定源码和既有合同。本文是研究建议，没有新增整核证明、性能测量或源码修复。

## 1. 投稿选择：先区分错过截稿与收到拒稿

下表的适配性是结合本项目作出的判断，不是录用概率。当前方向是 Experience paper；研究贡献成熟后也可改为方法论文。

| 去处 | 已核实的窗口 | 适合怎样的论文 | 与本轮 ECOOP 的衔接 |
|---|---|---|---|
| [ECOOP 2027 第二轮](https://2027.ecoop.org/track/ecoop-2027-technical-papers) | 2027-02-11 AoE；04-08 通知 | 真实 SIMD kernel 上应用 PL 验证技术，报告成功、失败、修复代价及可迁移经验 | 最接近当前定位。第一轮 2026-11-19 截稿、2027-01-28 通知；若第一轮被拒，仅剩14天，且变化不足的立即重投可被 desk reject |
| [OOPSLA 2027 第二轮](https://2027.splashcon.org/track/splashoopsla2027) | 2027-04-07 AoE | 可复用的跨 ISA 语义接口、模块化证明方法及系统性评估 | 适合第一轮 ECOOP 被拒后继续完善；不能等 ECOOP 第二轮 04-08 通知后再投这一轮 |
| [CAV 2027](https://conferences.i-cav.org/2027/cfp/) | 2027-01-20 AoE | 验证方法/工具；也有 Application / Industrial Experience / Case Study 类别，正文上限10页 | 若不投本轮 ECOOP，可作为替代；截稿早于 ECOOP 第一轮通知，不是等待拒稿后的顺序备选 |
| [ISSTA 2027](https://conf.researchr.org/home/issta-2027) | 2027-01-08 摘要、01-11 全文 | 若主贡献转向自动错误发现、验证流程的有效性、真实缺陷与分析成本 | 同样早于 ECOOP 第一轮通知；目前优先级低于 ECOOP/OOPSLA/CAV |
| [CGO 后续届次](https://2027.cgo.org/track/cgo-2027-papers) | CGO 2027 最后一轮已于2026-09-10截稿；下一届日期本轮未核实 | 若主贡献是迁移、优化和可信性能提升，主题很贴近；2027 CFP 还有 Practical Experience 类别 | 是中期方向，不能写成仍可投稿的 CGO 2027 窗口，也不能预设下一届日期和类别不变 |

建议：若只是赶不上11月，优先把 ECOOP 第二轮作为目标；若投了第一轮、1月底被拒且需要较大改动，优先考虑 OOPSLA 4月窗口。若最终最强结果是已验证的性能优化，则关注后续 CGO。CAV 的应用/案例类别也值得考虑，前提是时间路线允许。

OOPSLA 的合理卖点是明确的新方法、系统或评估贡献；增加符号、增加 ISA 数量本身不足以建立贡献。对当前 Experience 路线，更有用的是量化：共享合同如何减少重复工作，哪些现实语义差异使它失败，保留原程序结构需要多少代价。

## 2. 77 到底数的是什么

固定 XNNPACK 提交：`23dd5070fa002ef0b124817798ae090fa29f9653`。本轮重新读取34份官方构建列表并校验其 Git blob 哈希，复算结果：92个 HVX 操作/家族中，77个同时存在 NEON、RVV、AVX家族、HVX 的 C 源文件，覆盖49个源码目录。[复算记录](alignment-audit.json)

具体规则来自[原调研脚本](../ecoop-experience-reading-20261024/xnnpack-four-isa/build_tables.py)：

- 通常按目录归组；`f32-vbinary`、`f32-vunary` 等混合目录再按操作名前缀拆分，因此 `vadd` 和 `vmul` 分开。
- 同一操作的 tile、unroll、ISA 扩展与若干算法变体归并。矩阵乘、卷积、packw 的分组较粗，不保证 packing、量化方式、累加次序相同。
- AVX 列包含 AVX/AVX2/AVX-512；扫描也涵盖 FMA3/F16C 列表，但77项中每项另有真正 `avx*` 构建组实现。Hexagon 列具体指 HVX。
- 77项每端都有 PROD 构建登记，但表中为方便阅读选出的代表文件可能是 NON_PROD；PROD 也不表示任意设备都支持。
- 仅统计这些列表中的 `.c` 文件；不声称穷尽所有汇编实现或其他 ISA。

因此，77是**具有四端实现的操作/家族候选数**。它既不是77个完全相同的函数名，也不是77组已经对齐合同的实现，更不是77组证明结果。[完整77项表](../ecoop-experience-reading-20261024/xnnpack-four-isa/FULL_MATRIX.zh-CN.md)、[首批源码入口](XNNPACK-SAMPLES.zh-CN.md)

实际准入至少再过四层：函数参数与单位 → 输入域及内存布局 → 数值/位模式观察 → 具体版本的证明。文件存在只解决候选发现。

## 3. 一个系统、共同 spec：可以，但要区分共享什么

**建议采用一个验证框架、每个操作一份数学合同、各 ISA 实现分别精化该合同。** 同一个操作的四份证明对接共同合同，就能组合出其六种两两观察等价关系，不必维护六套独立关系证明。每新增实现仍须完成实现侧证明。

已有 `c-shim-v2@821969733` 的 `verification/qcp/cases/f32-vadd/spec.h` 是一个有用起点：它声明双实现比较函数 `equivalent(...)`，要求正长度、每个输入额外3个 float、输入输出分离，保证返回1。等价含义还依赖实际调用与比较器的证明；这个头文件本身不是独立数学规格。

建议把公共层明确成三个部分：

| 层 | 共享内容 | 每端仍需承担的内容 |
|---|---|---|
| 操作合同 | 长度单位、抽象输入输出、数学函数、观察关系 | 参数/布局到抽象值的对应；必要时证明编码、解码及参数初始化 |
| intrinsic 语义 | 统一的标量值、向量 lane、内存模型及可复用引理 | NEON/RVV/AVX/HVX 各自 intrinsic 的解释、mask/tail/舍入/版本条件 |
| C kernel 证明 | 同一前端、VC流程、共享循环引理 | 具体循环、访存、尾部处理及输出正确性；修改后重验 |

`spec.h` 可以是公共入口，数学定义和引理放在共同 Coq 模块里。ISA profile 应显式记录扩展、向量长度范围、舍入/异常处理等，不宜藏在同名宏后面。

### 一份可执行研究计划中的合同草图

以 `s8-vclamp` 为例，下面是设计伪码，不是已被 QCP 解析或检查的 C 注释：

后续核查补充：这份草图要求 `lo<=hi`，与既有 s8-vclamp 允许截断后 min>max 的公共合同不同。旧包的共同模型保留 NEON bulk64/tail 的运算次序，并记录原RVV反例与修复。不得将本草图当成旧合同的等价改写或默认采用的缩域；四端试点先审查此差异，详见[论文规划](PAPER-STORY.zh-CN.md)。

```c
/* logical Clamp(X, lo, hi)[i] = min(hi, max(lo, X[i]))
 * requires n > 0, -128 <= lo <= hi <= 127;
 * requires readable input storage, writable output[n],
 *          valid parameters, no pointer/size overflow;
 * requires explicitly declared aliasing and padding conditions;
 * ensures  output[0:n] == Clamp(old(input[0:n]), lo, hi);
 * ensures  input and memory outside output[0:n] are unchanged;
 */
void clamp_backend(size_t n, const int8_t *input, int8_t *output,
                   /* backend representation of lo, hi */);
```

对实现 a，目标是证明 `{P_common ∧ P_a} Lower_a(K_a) {Obs_a(output)=F_k(X) ∧ Frame}`。这里 `Lower_a` 表示当前 C-shim 解释，`P_a` 包含该实现所需的内存和机器配置条件。比较两端时，必须使用同一抽象输入，并分别提供满足条件的具体内存。四端共同适用域可由各端前提的交集构造，并检查该域非空且有代表性。

这条组合结论要求 `F_k` 对所选观察是确定的。若合同只是“误差不超过ε”，两个实现都满足它不能推出逐位相等；通常只能进一步导出相应误差界。若合同允许多个结果，同样不能直接宣称等价。现有部分正确性证明只约束终止执行；终止性及真实机器执行到 C-shim 的关系需另列义务或明确假设。

### “程序只证明一次”是更进一步的路线

如果四端来自同一份参数化 SIMD 程序，可以尝试证明公共程序一次，再证明四个后端都实现所需接口。这要求公共程序只依赖接口合同，并且实际源码与该参数化程序的对应也得到验证。

XNNPACK 已有可利用的结构：部分 NEON/AVX/HVX `vabs`、`vcopysign` 文件由共同模板生成并调用 `xnn_*` SIMD helper；RVV 则使用不同模板和动态 VL 循环。因此存在复用机会，但不能因为模板相同就省略实例化、前端和后端的证明，也不能把独立优化后的循环自动纳入同一个证明。

首批建议先实现“共同合同、逐端证明”；等闭环跑通，再评估参数化程序证明的收益。

## 4. 首批选什么，哪些差异必须保留

| 候选 | 共同数学规格 | 初步可行性与尚待证明事项 |
|---|---|---|
| `s8-vclamp` | 有符号8位整数逐元素 clamp | 首选四端样本。无浮点舍入；核对 min/max、参数读取、固定/动态向量循环、padding 与部分写入 |
| `f32-vabs` | `bits(y)=bits(x)&0x7fffffff` | 很适合位模式合同。AVX/HVX 是显式 mask；NEON 用 `vabsq_f32`，RVV 用 `vfabs`。须核对所选 Arm profile 的特殊值行为及 intrinsic 模型，不能先假定所有模式一致 |
| `f32-vcopysign` | `bits(y)=(bits(mag)&0x7fffffff) | (bits(sign)&0x80000000)` | 双输入和尾部处理的扩展。RVV 用 `vfsgnj`；另外三端用 abs/mask/or。复用 vabs 引理，审查 NaN payload 与符号位保留 |
| `x32-transposec` | `Y[j,i]=X[i,j]`，按32位元素位模式搬运 | 第二阶段加入一个非逐元素样本；统一逻辑矩阵后证明各端 stride、tile、边界地址映射 |
| `f32-vadd` | 指定 FP profile 的一次加法结果 | 连接既有 NEON/RVV 工作，先加 AVX；HVX 源码随 `__HVX_ARCH__>=81` 分支切换直接 sf 运算与 qfloat 路径，需先确认语义 |
| `f32-vneg` | 用来检验共同位模式合同是否过强 | 固定源码 AVX helper 是 `0-x`，HVX 是符号位异或。RNE 下输入 `+0` 分别产生 `+0` 与 `-0`：仅反驳逐位相等，在已有 `same_value` 观察下不构成反例（见第6节）；未作为本轮硬件实测结果 |

具体源码可从[八组入口](XNNPACK-SAMPLES.zh-CN.md)进入。辅助语义依据包括固定 XNNPACK 的 [AVX helper](https://github.com/google/XNNPACK/blob/23dd5070fa002ef0b124817798ae090fa29f9653/src/xnnpack/simd/f32-avx-base.h)、[NEON helper](https://github.com/google/XNNPACK/blob/23dd5070fa002ef0b124817798ae090fa29f9653/src/xnnpack/simd/f32-neon.h)、[HVX helper](https://github.com/google/XNNPACK/blob/23dd5070fa002ef0b124817798ae090fa29f9653/src/xnnpack/simd/f32-hvx.h)。RVV sign injection 的非符号位保留定义见[官方 Vector 规范](https://docs.riscv.org/reference/isa/extensions/vector/_attachments/riscv-v-spec.pdf)，标量 sign injection 的 NaN/异常规则见[官方 F 扩展](https://docs.riscv.org/reference/isa/unpriv/f-st-ext.html)。这是建模依据，不是本项目已完成的精化证明。

**共同数值结果不要求完全相同的访存。** 当前 [HVX s8 helper](https://github.com/google/XNNPACK/blob/23dd5070fa002ef0b124817798ae090fa29f9653/src/xnnpack/simd/s8-hvx.h) 的 tail load 仍读取整128字节，tail store 只写有效部分。对其 u128 版本，为输入分配并初始化额外127字节是一个保守的充分长度方案，仍需其他正常 C 内存条件。RVV 的动态 VL 读取可以不需要这些额外 lane。

可先为四端试点选共同 padding，并分别证明精确 footprint；必须声明这是试点输入域，不能悄悄收窄原先公共合同。类似地，初版只支持输入输出分离也是显式范围选择，不能据此声称已经支持原地计算。观察应包括有效输出及不应被改写的内存，不默认包括读轨迹、时序或 FP 状态寄存器。

对 GEMM/packw，统一逻辑矩阵后允许各端不同物理 packing，适配器也要证明；对归约/近似函数，先确定数学误差合同。不能为追求四端完全相等而未经确认修改原实现、缩小输入域或把特殊值都排除。NEON 修复也按用户要求逐项确认。

## 5. 最小研究闭环与验收

1. 冻结3个基础操作、每端一个具体函数/源码哈希、公共合同及各端 profile；保留 PROD/NON_PROD 标记。
2. 先完成四端 clamp。新 AVX/HVX intrinsic 定义要单独审查，普通 helper 要证明；不把目标 kernel 本身声明成可信 intrinsic。
3. 加入 vabs/copysign，检查零、无穷、NaN payload、tail 和向量边界。测试辅助发现模型错误，形式证明承担其声明范围内的保证。
4. 对共享合同统计：每加一端新增 intrinsic 数、模型/证明行数、证明时间、人工修复及原源码变更；分别统计共享与特有部分。
5. 加一个转置或量化样本，以及 vneg 这样的明确负例，检验方法的适用边界；之后再扩大 kernel 数量与性能实验。

该闭环可以支撑“共同合同是否真正降低跨 ISA 验证成本”的论文问题。首批3个操作适合建立基础设施，单靠三个简单样本不足以证明系统的普遍适用性。最终能声称什么，以实际完成的合同、源码对应和证明记录为准。

## 6. 用户澄清：沿用忽略 NaN payload 与零符号的观察

用户指出此前验证忽略 NaN payload，不区分正负零，询问是否仍可证明等价，以及 NEON 应作基准还是也对共同规格验证。这里将语音中的 Neo/None 理解为 NEON/NaN。此澄清纠正前面偏重逐位合同的呈现；不是用户要求排除这些输入。

### 已核实的既有设置

固定 `c-shim-v2@821969733` 的 VADD 包具有以下直接证据：

- [interface.json](https://github.com/Etha-Sun/SALTy-rn/blob/821969733d7953a212c51839194add416fd5799b/verification/qcp/cases/f32-vadd/interface.json)：`observation = number-or-both-nan`，RNE，输入分离、padding=3。
- [BridgeLogic.v](https://github.com/Etha-Sun/SALTy-rn/blob/821969733d7953a212c51839194add416fd5799b/verification/qcp/verified/f32-vadd/proof/coq/NanBridge/BridgeLogic.v)：定义如下。
- [spec.c](https://github.com/Etha-Sun/SALTy-rn/blob/821969733d7953a212c51839194add416fd5799b/verification/qcp/verified/f32-vadd/spec.c)：`test_neon` 与 `test_rvv` 的后置条件均使用 `vadd_values`；比较器先判断 `x==y`，再接受双方 NaN。
- [ResultBridge.v](https://github.com/Etha-Sun/SALTy-rn/blob/821969733d7953a212c51839194add416fd5799b/verification/qcp/verified/f32-vadd/proof/coq/relations/ResultBridge.v)：`shared_vadd_model_implies_related` 将两侧等于同一 `vadd_values` 推出 `Forall2 same_value`。现有内部证明比最终观察要求更强。

```coq
Definition same_value (a b : fp32) : Prop :=
  fp32_eq a b \/ (fp32_isNaN a /\ fp32_isNaN b).
```

它接受 `+0` 与 `-0`，接受任意两个 NaN；拒绝 NaN 与普通数、不同的有限数、正负无穷混淆。它没有给普通有限结果增加容差。这里确认的是 VADD 具体包，其他39项仍须按各自公开合同核对，不能直接宣布全库同一设置。

### 推荐规格：输出等价类唯一，保留完整输入与内部状态

可以定义逻辑观察函数 `Obs`：NaN 映射到共同标记、正负零映射到共同零、其他 binary32 值保留原值。然后对每个 ISA 的实现证明：

```text
对每个满足合法内存和 profile 条件的同一输入 X：
    Obs(output_ISA(X)) = S_kernel(X)
```

`Obs` 逐元素作用于输出列表；`S_kernel` 给出唯一的观察结果，可以用 `Obs(F_kernel(X))` 定义。它不要求唯一的 NaN payload 或零符号。`same_value` 是等价关系，因而四端共同规格能组合出六对观察等价；此处无需引入 epsilon 近似关系。

不排除 NaN、无穷、正负零或 subnormal 的数值输入；仍需合法长度、有效指针、规定的 padding/别名关系、机器配置等正常前提。VADD 当前合同本身就没有仅有限数之类的数值域限制。排除所有输入会使证明空洞，排除所有特殊值也不是这里采用的方案。部分正确性与终止性依旧分别记账。

NEON 可以继续作为迁移来源和工程比较基准；数学上将 NEON 也作为被验证实现，与 RVV/AVX/HVX 一起对接 `S_kernel`。对复杂归约，可以先提取忠实于 NEON 运算次序的参考模型并证明其对应，再考虑更抽象的算法规格。参考模型若来自 NEON，只说明保持该参考行为；要声称算法本身正确，还需要模型与算法规格的关系。

### 对边界案例的影响

- `vneg` 的 `+0/-0` 差别在当前观察下被接受；NaN 结果只在 payload 等方面不同也被接受。这些不能再作为当前等价关系的反例。完整四端 vneg 尚未证明；其他 profile 或非零结果差异需分别检查。
- 浮点 min/max 若一端返回 NaN、另一端返回有限数，仍然失败；不同归约次序导致普通有限输出差1 ULP，也仍然失败。
- 忽略输出差异不意味着把所有输入或中间值提前合并。比如 `copysign(1,+0)` 与 `copysign(1,-0)` 输出 `+1/-1`，输入零的符号影响可观察结果。因此 `S_kernel` 的输入仍保留位模式，证明内部也保留所需语义，只在声明的输出边界应用 `Obs`。
- 同样，两个 kernel 输出各为 `+0/-0`，后续 `1/x` 可得到 `+∞/-∞`。所以论文应称 kernel 输出观察等价；跨 kernel 组合时，另证后续消费者尊重该关系，或在其接口保留更强信息。

正式合同还应包括内存安全与 frame/输入保持，不能只比较最后的数组而容许越界或额外改写。FP 异常标志、trap、时序不因输出合同自动得到保证。本轮只读取既有源码和证明文本并澄清规格，没有重新执行证明。
