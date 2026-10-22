# c-shim-v2：40 kernel 分工与接入路线

本文是后续实施计划，不是新增证明结果。工作分支按用户要求命名为 `c-shim-v2`，原始输入固定于 Keegan 上游 `be16280c7812a7459c26c3ce82a47339a3d07718`。`catalog.json` 已收录40对非空 source/target；本次上游提交补齐四个 target，并没有增加四个 source 名称。CSim 分支只读参考，已知修复见 `CSIM-REPAIRS.zh-CN.md`。

本机先完成 **f32-vadd** 的完整链路，随后作为 leader 维护框架、共享基础库的版本与准入。另一台服务器负责其它39项的接入，优先四个新 target 和复杂矩阵。这里的“完成vadd”要求实际两个 kernel、intrinsic 实现、mapper、比较循环及所用辅助证明均闭合；只完成若干 helper 或条件性 wrapper 证明不能触发整核完成标记。

## 固定的结构与生成器边界

每个 case 保持小而明确的人工审查面：原始 `test_neon` / `test_rvv` 引用、`interface.json`、`spec.h`、`mapper.c`。公开 post 为 `equivalent` 返回1，允许写区域与输入保持仍须明确。每个 case 的 proof 材料留在单独文件，生成时只作用于隔离副本；原始文件、公开规格及mapper冻结，证明不能改它们来消除困难。

生成器只做已审查模板的参数替换、已知 intrinsic ABI 转换和冻结/覆盖检查。初期只支持实际用到的 `binary-f32` 等少量模式；新模式首次接入时写一个简单模板或小生成函数即可。**不要求先实现通用C分析器、通用布局推断器或任意kernel自动spec生成。** 未识别类型、intrinsic、布局或观察标准必须明确拒绝，不能默认使用某个相近模板。

共享库采用“先明确spec，再证明真实实现”的方式。仅spec可用于早期产生消费者VC，但其状态必须标为条件性；最终接收需要相应body证明。ISA与C shim的语义对应单独列出，Coq检查C模型不会自动完成ISA证明。

## 40项总体安排

阶段是优先级与能力依赖，不表示必须等上一行全部完成才启动下一行。远端可在新矩阵case等待共享组件时推进已有组件覆盖的简单case，避免把所有资源消耗在同一未闭合模型上。

| 阶段 | Kernel集合 | 数量 | 主要负责人/交付 |
|---|---|---:|---|
| P0：本机试点 | f32-vadd | 1 | 本机：完整body链路、数组资源与lane桥、真实NaN比较、固定VL；形成最小可复制case |
| P1：新四项优先 | u8-vclamp；qd8-f32-qc8w-gemm-minmax；qd8-f32-qc8w-igemm-minmax；qs8-qc8w-gemm-minmax-fp32 | 4 | 远端：先简单整数，再共享NR8矩阵主干与两类后处理；逐项新证据 |
| P2：邻近接口 | f32-vsub、f32-vmul、f32-vdiv、f32-vmin、f32-vmax、f32-vmulc；f32-vsqrt、f32-vrndne、f32-vlrelu；f32-vcmul；f32-f16-vcvt、qs8-f32-vcvt、qu8-f32-vcvt；s8-vclamp | 14 | 远端：复用逐元素框架，补具体数值/位模型与原版差异检查 |
| P3：整数/布局基础 | qs8-rsum、qu8-rsum、qs8-rdsum、qu8-rdsum；qs8-vadd-minmax、qu8-vadd-minmax、qs8-vcvt、qs8-vlrelu、qs8-vmul-minmax-fp32；x32-packw-gemm-goi、x32-transposec | 11 | 远端：wrap、饱和、移位、byte/word、tuple、stride及归约不变量；支持矩阵后处理 |
| P4：其它复杂内核 | f32-gemm-minmax、f32-igemm-minmax、f32-spmm-minmax、f32-conv-hwc2chw、f32-dwconv-minmax、f32-dwconv2d-chw、qd8-f32-qc4w-gemm-minmax；f32-maxpool、f32-argmaxpool；f32-raddstoreexpminusmax | 10 | 远端：packed/indirect/sparse、窗口边界、索引、精确FMA/归约树和完整多层循环 |
| 合计 | 不重复40项 | **40** | 清单收录与整核证明状态分开 |

P2的min/max和P4的多项旧target已有CSim反例/独立修复记录。先判断当前原版在新spec域下是否等价，再投入证明；没有通过更换后端自动消失的语义差异。`same_value` 的“数值相等或同时NaN”只适合作为指定最终观察；内部推理若依赖符号零、位表示或后续除法，必须使用更强关系，不能无条件当作所有运算的同余。

## 新四项的具体先后与依赖

推荐顺序为 **u8-vclamp → qd8-f32-qc8w-gemm-minmax → qd8-f32-qc8w-igemm-minmax / qs8-qc8w-gemm-minmax-fp32**。最后两项可在共享GEMM主干稳定后分开推进；资源有限时先IGEMM，复用同一浮点后处理，再补QS8特有位级量化链。以下说明来自本分支实际原始代码，不代表这些性质已经证明。

### 1. u8-vclamp：新target的最小整数接入

- 原始NEON按64字节、8字节、tail三段；新RVV先处理64字节整数倍，再处理余数。两段min/max顺序不同，但两侧相应段保持同样顺序；规格需要明确允许的参数范围，不能未经审查统一成单个顺序或额外缩小域。
- 复用VL与数组资源框架，新增unsigned byte load/store、broadcast、min/max、low-lane、extract、u8↔u16/u32尾部pack。尾部原NEON读8个byte，因此输入padding按原行为生成并核对。
- 先检查 n=1..8、63/64/65、127/128/129 的两段交界与合法极值参数，再证明symbolic长度。固定VLEN128不意味着每种元素/LMUL容量相同；e8m8容量为128。
- CSim `u8-vclamp-v3` 是旧空target基础上另写的实现，和Keegan新target不是同一文件。只参考规格和证明结构，不继承旧整核结论。
- 退出条件：uint8及尾部store实际body、全部循环/边界和`equivalent`闭合；byte/word桥仍有缺口时报告具体VC。

### 2. qd8-f32-qc8w-gemm-minmax：建立NR8矩阵主干

- 两侧实际接口要求 `mr=1`；不要宣称本次实现支持多行tile。固定上游ARM64分支以保留`vfmaq`融合语义，ARM32分支的`vmlaq`不能自动视作相同操作。
- 原始新RVV每个输出块固定NR=8，布局为 `[8×i32 ksum][kc×8×i8 weights][8×f32 filter_scale][8×f32 bias]`。即使 `nc<8`，weight/scale/bias游标仍按完整8列推进；VL只限制当前有效lane。合法分配、padding、类型对齐、字节长度溢出及`cn_stride`应在公开spec中清楚表达。
- 共享依赖：i8有符号扩展、i16×i16→i32累加、i32 wrap、i32→binary32舍入、独立mul、真实FMA、NaN分类/merge/minmax、混合类型packed读写及uintptr地址桥。
- 内部参考按真实阶段分解：`ksum * zero_point`初始化→K循环整数累加→转float→乘inv_scale→与filter_scale/bias做FMA→clamp。不能把整数K-loop换成Real或float点积模型。
- 循环证明先做一个输出块的K前缀，再做多输出块的w/a/c游标与已完成输出前缀；公开post仍只描述返回1。
- 新target已有NaN lane恢复与NaN bound处理，必须证明真实分支；不能因为代码注释声称保持NEON就作为已证契约。
- 退出条件：symbolic `kc/nc`、完整NR8块与不足8列tail的布局/数值/输出frame闭合。有限原生对照通过只是先行证据。

### 3. qd8-f32-qc8w-igemm-minmax：扩展间接输入与zero路径

- 复用上一项的NR8整数累加、转换/FMA/clamp和输出模板；新增a指针表、`a_offset`、`zero` sentinel与`zero_data`替代路径。
- **`ks`的实际单位是指针表字节数**，条目数为 `ks / sizeof(void*)`。实际权重输入数是这个条目数乘 `kc`，不能直接把target注释中的 `ks*kc` 当作规范字节公式。
- 每个输出tile结束，a游标按ks字节回退；每个非zero项加a_offset，zero项改指向zero_data。必须证明地址有效性、游标复位和被读取区域frame。
- 不要从vadd的“四块互不重叠”机械推广到所有指针表项互不重叠。表项可能重复或都指向共享zero_data；决定采用可共享只读资源还是唯一allocation映射，公开规格如需限制须先审查。
- 退出条件：两类a路径、所有表项、symbolic ks/kc/nc与完整输出比较闭合；只证明非zero路径不算该kernel完成。

### 4. qs8-qc8w-gemm-minmax-fp32：复用矩阵主干，补量化后处理

- 同样是 `mr=1`、NR8；布局改为 `[8×i32 bias][kc×8×i8 weights][8×f32 scale]`。复用NR8的地址/循环结构，但不得误套QD8的ksum、inv_scale和浮点bias布局。
- K循环仍是整数累加。后处理是 i32→f32、乘scale、加magic_bias、按位重解释为i32、饱和减magic_bias_less_output_zero_point、两级vnclip窄化，最后signed i8 clamp。
- 核心新增依赖是binary32↔word表示桥、保留实际NaN域/参数域的magic-bias算法、signed饱和减、明确VXRM模式的窄化。不要以“round-to-nearest”一句话替代真实位算法，也不能把reinterpret换成数值cast。
- 原NEON的pack与RVV窄化顺序分别建模。参数中的magic常量、scale、输出界限及对应union成员需要明确冻结，并从接口原有约束导出合法范围。
- 退出条件：从整数acc到最终每个int8输出的整条实际后处理body闭合；几项算术lemma通过不能替代表示/内存桥。

## 复杂矩阵的公共里程碑

| 里程碑 | 可复用成果 | 必须拒绝的捷径 |
|---|---|---|
| M1：packed资源 | 每个block字段/byte offset/有效长度；拆分与重新拼接；多类型读取的对应证明 | 单凭指针算术看起来相同；为每次读取凭空引入相互独立的数组资源 |
| M2：整数K fold | signed扩展、乘法、明确wrap32、tile/K前缀及初始化 | 将机器整数累加直接当无界数学和，未处理溢出 |
| M3：IEEE后处理 | 转换、mul、单次RNE FMA、NaN/±0、clamp与mask | FMA写成两次舍入；排除NaN；默认min/max同义 |
| M4：量化/位桥 | binary32编码关系、magic-bias、VXRM、饱和/窄化、QC4 nibble符号扩展 | 为NaN payload假设错误双向bijection；把reinterpret换numeric cast |
| M5：间接/稀疏布局 | pointer table、zero sentinel、offset/stride、dmap/nnz游标与回退 | 只验证连续dense特例却声称覆盖indirect/sparse |
| M6：完整输出 | 外层tile归纳、tail/mask、输入保持、未写输出区域frame及comparator | 只证明单tile或单lane，或将未关闭cut留在消费者前提里 |

对于QC4、卷积和exp/reduction，还需检查NEON实际累加/分组次序。数值不等反例应先分类为FMA差异、归约树差异、NaN语义或真实地址/控制流差异，再决定修复target还是补证明；不要把所有问题统称为浮点后端限制。

## 每个case的接入与验收步骤

1. **登记与源身份**：从catalog选定原版SHA；若采用独立修复target，另列版本、原反例、差异及人工审查记录。原始版本永久保留。核对intrinsic集合和实际宏环境，不能把词法全分支清单当编译后调用闭包。
2. **确定接口**：列尺寸单位、padding、布局、允许alias、有效内存/参数域、观察关系、VL策略/舍入环境。生成简单spec/mapper，人工审查后冻结；冻结前的规格选择与冻结后的proof工程分开。
3. **最小可执行支持**：只补实际调用到的intrinsic。实际body与spec一起存放，明确spec-only状态；先运行边界/特殊值/错误mutation对照，保存命令和源SHA。未知外部调用拒绝。
4. **冻结完整输入**：原kernel、spec、mapper、共享版本、lowering、QCP/Coq环境、checker与proof候选均有固定身份。每次检查使用新的隔离目录；源/spec漂移和注解伪装普通C变更应被负控拒绝。
5. **分层证明**：先primitive与数组/表示策略，再kernel内层/外层不变量，再mapper/comparator。每个调用前件、Assert、Inv初始化/保持、内存安全、frame和实际helper body都进入覆盖清单；保存显式theorem参数与`Print Assumptions`。
6. **完整重放**：在同一冻结proof候选上跑真实完整检查，而不是拼接不同快照的局部通过数。生成VC不等于证明成功；含未实现/未检查的callee契约只能算条件性。
7. **leader准入**：独立复核源身份、依赖闭包、全部未闭合项为空、负控制、实际返回1证明及声明的工具边界。通过后更新该case状态，再由leader统一更新40项catalog；另一服务器不得通过修改汇总JSON自行授予整核完成。

每项汇报至少区分：`inventoried`、`interface-frozen`、`native-tested`、`shared-body-checked`、`kernel-partial`、`whole-kernel-checked`。这些是证据进度标签，不要求实现复杂状态机。实际kernel反例与工具/环境失败分别记录，不应被一个“failed”字段掩盖。

## 问题分类与处理

| 分类 | 典型表现 | 处理与退出条件 |
|---|---|---|
| spec工程 | packed字段/输入域不清、intrinsic缺契约、输出观察或尺寸单位不明确 | 查原函数和CSim证据，补简单模板；人工审查冻结，再产生调用义务 |
| proof工程 | spec和执行语义已有，但数组拆拼、循环不变量、舍入/饱和引理未证 | 保持普通C/spec不变，新增实际检查的证明；报告具体未闭合VC |
| 工具/表示适配 | QCP不支持局部类型/语法，FP分支生成异常VC，pointer/bit桥无法表达 | 提取最小探针，保存失败；独立修复/适配并增加正反控制；源到适配程序的对应单列 |
| 真实不等 | 原生反例可重放，语义分析确认两侧在冻结spec域内输出不同 | 保留原版和反例，独立修复候选并重新冻结；不能靠缩小前提或放宽post掩盖 |
| 环境/资源 | 缺工具、版本不符、IPC失败或预算耗尽 | 保存原exit/日志，修环境或另开有界run；不记为kernel不等或proof通过 |

## 双机共享模块所有权

采用一个共享模块一个当前维护者、一个case一个当前负责人；以下是初始分工。具体GitHub通信和提交协议由leader单独维护，本文不另定义第二套协议。

| 区域/工作 | 本机leader | 另一服务器 |
|---|---|---|
| `tools/`、freeze/prepare/check、review-lock与全局catalog | 唯一合并与版本维护者；本机vadd结束后继续主审 | 提交最小需求/补丁，不同时改已冻结工具；新模板只做局部增量 |
| `cases/f32-vadd`、vadd专用共享模块与NaN桥 | 完成并检查，发布固定共享版本 | 作为只读依赖引用，发现问题提供最小反例 |
| 其它39个case及各自proof候选 | 审查公开spec/mapper与最终准入 | 主实现者；按case隔离目录和日志，优先新四项 |
| unsigned/quantized/SIMD整数支持 | 审查接口与准入共享版本 | 首位consumer负责人实现并证明，随后其它case引用固定版本 |
| packed/indirect/sparse/FMA/位表示新组件 | 负责跨case语义一致性与版本升级决策 | 由矩阵负责人维护单一候选模块，避免每个kernel复制不同定义 |
| 原始 `kernels/source`、`kernels/target` | 保持上游身份；修复另立候选 | 只读；反例与修复建议另存，不在当前冻结版本原地修改 |
| 历史CSim、历史QCP logs/locks | 只读来源 | 只读来源；新环境重新建立自己的run与证据 |

共享组件修改必须先明确哪些case依赖其旧SHA。维护者在新候选版本上检查，leader接受后让消费者显式升级；不得在其它任务运行时替换其共享文件、模型或lock。远端等待共享修复时，可以继续独立case的接口/原生反例工作，避免双方同时改相同helper以求尽快绿灯。

本机vadd收尾交接包应包含：干净原始引用与spec/mapper、被冻结的工具与共享模块、实际完整重放命令、所有未完成边界、已知反例和可复用的最小proof范式。若vadd尚有明确工具阻塞，交接包必须写明阻塞及已检查局部范围，不能提前标为“完成后leader”。
