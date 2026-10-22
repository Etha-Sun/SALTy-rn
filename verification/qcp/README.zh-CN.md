# CSim → QCP：小型 kernel 验证框架

本目录为 `c-shim-v2` 工作分支准备，固定基线是 Keagan 上游 `be16280c7812a7459c26c3ce82a47339a3d07718`。目标沿用 CSim 的审查方式：每个 case 只让人审查原始 NEON/RVV 两个函数、`interface.json`、`spec.h` 和 `mapper.c`；共用的 intrinsic 实现、内存与浮点模型、表示转换工具单独按版本审查。

当前已经有可重复的原始/转换后 native 差分、共享 intrinsic 的实际 C body 证明和 NaN 比较桥。**QCP 整核完成数仍为 0/40**。40 对清单是接入范围，不能解释为 40 个 mapper、规格或证明已经完成。后续工作见 [ROADMAP](docs/ROADMAP.zh-CN.md)，任务分工及交接见 [协作约定](docs/COORDINATION.zh-CN.md)。

## 给使用者的小接口

以 [f32-vadd case](cases/f32-vadd/interface.json) 为例：

- 原始函数直接使用仓库 `kernels/source/f32-vadd.c`、`kernels/target/f32-vadd.c`，不把修改后的副本冒充原版。
- [interface.json](cases/f32-vadd/interface.json) 写 padding、观察关系、输入分离、VL 与舍入配置；参数是已审定条件，不由求解器选择。
- [spec.h](cases/f32-vadd/spec.h) 只描述合法内存、输入范围及 `equivalent` 返回 1。完整内存资源在实际文件中明确列出。
- [mapper.c](cases/f32-vadd/mapper.c) 分配 params、调用两侧原函数，再真实逐元素比较输出。后置 `__return == 1` 对应这段比较程序，不是把结果直接赋成 1。

vadd 的前置条件用自然语言表达就是：`n>0` 且乘四不溢出；A、B 各有 `n+3` 个可读 float；两个输出各有 `n` 个可写 float；四个缓冲区按分离逻辑要求互不重叠。多出的三个 float 保证原 NEON tail 的读取合法。输入值包含全部 binary32 值，不排除 NaN、无穷或 ±0。

比较规则是“数值相等，或双方都是 NaN”，所以 ±0 相等，NaN payload 与浮点异常标志不作为输出观察。初始模型固定 LP64、小端、RNE、VLEN=128；RVV e32m8 容量为32，VL 取 `min(remaining,32)`。这不是任意 VLEN 的证明。本版本主动选择输入互斥；旧 CSim vadd 允许 A/B 相互别名，不能说两者已覆盖同一个完整输入域。

小型生成器的职责是填入已审定模板并处理明确的 intrinsic/调用模式，不替人猜测 padding、packed layout、别名或舍入语义。当前 `case.py prepare` 已实现固定 vadd 的确定性 lowering；公开 `spec.h` 与 `mapper.c` 仍是已冻结的审定文件。**面向全部40种 kernel 的半自动 spec 生成器尚未实现**；新增接口族应先审查一个模板，再让工具填参数，遇到未知模式停止并要求补模板。

## 实现边界与审查顺序

| 层次 | 要回答的问题 | 当前证据与剩余边界 |
|---|---|---|
| 原始代码身份 | 实际检查的是哪两个函数、哪个规格和 mapper？ | 原始路径、固定 commit、逐文件 hash、`frozen.json` 与 `review-lock.json`；漂移和绕过注释通道的负对照会失败。这证明身份守卫工作，不证明程序正确。 |
| lowering 对应 | 转换前后的值、读写、分支、tail 和观察是否一致？ | 有确定性改写记录及 native 差分。通用转换正确性尚未形式化；NaN 比较改写有独立已证桥。 |
| C shim 实现 | 每个 intrinsic 的真实实现是否满足它的合同，调用者是否具备所需资源？ | vadd 的共享基础义务已检查；完整 kernel 的调用前件、循环与依赖闭包未完成。只导入函数合同不算实现已经证明。 |
| ISA 对应 | C shim 的合同是否对应实际 NEON/RVV 指令语义及选定硬件参数？ | 当前没有建立整套 ISA→shim 形式对应；native 宿主执行也不能替代这一层。 |

这四层应分别报告，不把 source hash、native 通过或局部 Coq 成功合并成“原始跨 ISA kernel 已证”。共享库的合同本身仍需语义审查；即使其 C body 已由 Coq 检查，也不能据此认定合同准确描述了真实指令。

目录结构保持与审查边界一致：

```text
cases/f32-vadd/       interface.json / spec.h / mapper.c / proof.patch / frozen.json
shared/runtime/      原始 mapper 的 native C shim，单独版本审查
shared/vadd/         带合同的 flat-struct C 实现、数组策略及 checked Coq 模块
tools/               inventory、冻结/审计、固定 vadd lowering 与 native 检查
experiments/         可复现 runner、生成目标、证明尝试和实际状态
.build/              派生源码、native 动态库等可重建产物
audit/               清单、完整性与 native 检查记录
```

`proof.patch` 只允许在隔离副本上增加 `Inv`/`Assert` 注释。工具检查普通 C token、预处理行及原有注释不变，并拒绝添加/替换 Require、Ensure、Import 等合同通道。冻结文件不可通过一次普通 `freeze` 操作覆盖；更改原始函数、规格、mapper 或共享运行库需要另立审查版本。

## struct 与 QCP 适配

QCP 支持 struct，并非完全禁止 struct。这里遇到的问题是旧 SIMD shim 广泛使用的“带 lane 数组的向量 struct、按值参数和返回”组合，以及对应的资源所有权表示。初始兼容方案把向量表示成固定数量的标量字段，输入使用 `const struct *`，输出使用显式 `struct *` 参数，保持 lane 次序及原始控制流。

这个方案已有 NEON primitive 的实际 C 证明，但不能说任意 struct 程序都已兼容，也不能把按值到指针的源码改写当作自动成立的语义等价。局部 struct 的未初始化资源如何拆给 callee、多个 cell 如何组成向量 load 前件，仍需实际证明。实现细节见 [共享 vadd 接口](shared/vadd/README.zh-CN.md)。

还应区分两个当前产物：

| 产物 | 当前用途 |
|---|---|
| `.build/f32-vadd/native_unit.c` | 引用公开 mapper 和未改动原函数，使用 native runtime 执行回归。 |
| `.build/f32-vadd/lowered_unit.c` | 使用转换后表示的 native 差分 artifact；**不是携带公开 spec 的 QCP 整核验证输入**。它的 native 通过不表示 `spec.h` 已在该程序上得到证明。 |
| `experiments/vadd-proof/kernel-attempt/neon_kernel_unit.c` | 独立 QCP 整核接线尝试，确实附带 kernel 合同并调用已证共享接口；当前尚未生成完整 VC 集。 |

## 已建立的证据

| 检查 | 本次结果 | 准确范围 |
|---|---:|---|
| 共享 vadd 基础义务 | 48 项通过 | 44 个 intrinsic/调用串 VC、2 个真实数组读取 VC、2 条数组策略证明。包括 NEON load/add/store/half-lane、标量加法及固定 cap32 的 vsetvl。 |
| NaN 比较桥 | 14 个实际 C VC 通过 | identity body、真实比较器及公开 return1 包装；对任意输入的观察条件改写等价另有 closed Coq 引理。checker 返回1定理的前提为 same_value。 |
| NaN 桥 native 差分 | 5264 对一致 | 特殊值、随机 bit pattern 与损坏 identity 负对照；属于有限执行证据。 |
| 原始/转换后 vadd native | 430 个 case 通过 | 860 次 equivalent 调用、1720 次 kernel 执行；检查输入保留、输出 canary、真实不等输出拒绝及身份守卫。 |
| 完整 QCP kernel | **0/40** | 包括 vadd 在内均未完成原始 body、转换、共享依赖、比较器及公开规格的完整接线证明。 |

原始自比较 `x!=x` 在当前 QCP 产生了与 NaN 路径不兼容的 False safety VC。已证桥保留全部 fp32 输入，通过真实 `preserve_float(x){ return x; }` 及 Coq 相等合同，使比较使用两个具有已证同值关系的独立符号。没有加入新的 axiom、未证明 extern 合同或 finite-only 前置条件。详情及限制见 [NaN 桥报告](experiments/nan-bridge/README.zh-CN.md)。

检查器只编译手写 checked 模块，不接受自动生成的 `Admitted` 文件。`Print Assumptions` 仍显示 QCP 的布局/地址解释参数，以及部分证明依赖的标准 Coq/Flocq 经典实数、外延性假设；不能统一称为 closed 或无假设的 ISA 证明。原始生成 goal 中的 Module Type 义务由 checked Module 实现，其作用与直接添加可信 axiom 不同。

## vadd 距离整核闭合还差什么

当前真实 NEON kernel 尝试在首次 `vld1q_f32` 调用前停止：已有 `FloatArray.full` 与局部未初始化向量资源，尚不能自动推出 load 所需的连续4个 float cell 及目标字段所有权。已有的任意索引单 cell 读取策略不等于四 cell block 桥已经完成。

接下来需要闭合四项：

1. 连续4 cell 与局部 flat struct 资源的拆分、传入及恢复，将已证 `qcp_vadd_block4` 真正接进原始 NEON 循环与 tail。
2. RVV 完整32 lane 的 load/add/store；当前已证 `qcp_rvv_add_lane32` 只是单 lane helper，不能代替向量整体实现。
3. NEON/RVV 循环不变量、batch 与指针推进、输出前缀/剩余区间和尾部路径。
4. 原 mapper、lowering、已证 shim、NaN 比较桥及公开 `Ensure __return==1` 的最终依赖闭包，并将四层边界分别记入状态。

因此可以逐步扩充共享 intrinsic 支持来减少逐 kernel 的重复劳动；但“只加 intrinsic 就兼容并证明所有 kernel”目前没有证据。量化、矩阵、间接指针、布局与归约族还需要各自的接口模板和不变量。需求清单及旧 CSim 修复来源分别见 [40 kernel 清单](docs/INVENTORY.zh-CN.md) 和 [CSim 参考审计](docs/CSIM-REPAIRS.zh-CN.md)，历史通过记录没有转计成本次 QCP 结果。

## 复现

在该 worktree 根目录执行集成入口，顺序检查清单、native 差分、vadd 共享义务和 NaN 桥：

```sh
python3 verification/qcp/tools/verify.py
```

四项退出码和精简计数写入 [audit/status.json](audit/status.json)，各步骤日志保存在 `audit/integration/`。集成成功仍明确报告完整 kernel 为 `0/40`。也可以独立执行各步骤；以下命令会重建对应派生产物和当前检查记录：

```sh
python3 verification/qcp/tools/inventory.py --check
python3 verification/qcp/tools/case.py audit f32-vadd
python3 verification/qcp/tools/case.py prepare f32-vadd
python3 verification/qcp/tools/check.py
python3 verification/qcp/experiments/vadd-proof/run.py
python3 verification/qcp/experiments/nan-bridge/run.py
```

检查结果分别在 [framework-check.json](audit/framework-check.json)、[vadd proof status](experiments/vadd-proof/status.json)、[NaN bridge status](experiments/nan-bridge/status.json)；整核首次调用的确切失败前件在 [kernel-attempt/result.json](experiments/vadd-proof/kernel-attempt/result.json)。清单检查不会运行40个证明；共享 runner 的 `passed=true` 表示其声明的局部义务已检查，不能覆盖其中仍为 false 的 `kernel_proved`。

当前依赖 Python 3、GCC、`patch`、PATH 中的 `qcp` 与 `qcp-env`，以及旧 workspace 已安装的 QCP 2.1.4 / Coq 8.20.1 和已编译 QCP 库。两个 proof runner 仍读取：

```text
/zp_vegeta/scratch_sb/ycsun/verus/research/qcp-shim-vadd/results/coq-flags.json
```

其中包含旧 workspace 的绝对库路径；StrategyCheck 也取自旧 workspace 的 `.local/qcp/QCP-V2.1.4/linux-binary/`。因此本分支目前是**可在当前配置环境复现的源码包**，还不是新 clone 后无需环境配置即可运行的独立工具发行版。不要把缺少该环境的失败归为 proof failure；迁移时应固定工具/库版本、重新取得路径并重跑相应检查。
