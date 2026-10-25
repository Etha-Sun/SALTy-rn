<!-- CURRENT_VERIFIED35_PACKW_20261025 -->
当前完整已验证 **35/40**，目标 **40/40**。新增 x32-packw-gemm-goi：13个实际C单元、312条C义务、14个普通函数体、295次源码fresh Coq编译、325命令全0、444最终假设报告；12个原生intrinsic视图人工审核仍pending。SPMM@2239bcf90属于外部贡献。本聊天22+外部8+原有5。QS8/DW全门禁继续，Argmax/Exp/HWC仍为candidate。

2026-10-25（洛杉矶）：Packw模块化SIMD版完整通过，原件/23文件精确patch、完整UInt32状态/未写None frame与全部合法RVV VL边界保留。完整验收后直接commit/push到c-shim-v2，不开PR。

以下保留历史记录。

# Kernel 验证进度

完整验证通过：**34/40**。当前目标：**40/40**。依据：[verified 清单](verification/qcp/verified/manifest.json)。

2026-10-25（洛杉矶）：**f32-maxpool 修复版完整通过并收录，正式33/40，目标40/40。** 11实际C单元/857字段/26普通body、310源码fresh普通Coq、1020最终假设报告；13继承框架/经典数学假设、无新项目公理。31个intrinsic-spec视图明确待人工审查，覆盖全部written binary32位与各自未写frame。另一位matrix worker的 qs8-qc8w-gemm-minmax-fp32 已先发布37685e527，使清单先达32；保留外部作者归属。

2026-10-25（洛杉矶）：**x32-transposec 修复/兼容版完整通过并收录，正式31/40，目标40/40。** 8实际C单元/381字段/13普通body、116源码fresh普通Coq、489最终假设报告；11既有框架假设、9项公开intrinsic spec视图，人工规格审核pending。干净发布目录核对全部591清单文件、8 CPP/全部源日志及依赖闭包，双san各8808矩阵/1006296word/side、127014公开caller与独立oracle/共错负控复查通过；发布复核不计第二次形式化重放。原件、原反例及精确修复补丁保留。

2026-10-25（洛杉矶）：用户将目标提高为 **40/40**，已启用新的持续工作 goal。设置goal时正式 **30/40**；每1800秒检查真实额度，严格超过95%开始收尾，未完成不得标达成。继续复用现有代码与证明、并行完成候选；完整验收后正常直接提交c-shim-v2。intrinsic-spec边界与完整kernel/helper/caller/fresh门禁标准保持。下文36等旧目标及历史额度保留原时间含义。

2026-10-24（洛杉矶，UTC 2026-10-25 06:27）：用户明确要求继续，当前账户实际额度 **0%**，已归档并解除旧97%收尾锁，恢复推进至少 **36/40**；半小时检查、严格超过95%收尾的规则保留。当前正式 **30/40**，新组件不增加计数。

2026-10-24 用户最新规则：目标至少 **36/40**；每 **30 分钟**读取一次当前账户实际额度，任一有效窗口的已使用比例 **严格超过 95%** 时开始收尾：停止新增 kernel/验证批次，保存证明、日志、已验证清单和恢复记录，汇总可交付结果；已启动的有效有限任务优先自然完成。读数不可用时明确记录未知，不编造百分比。此规则覆盖旧的31目标及“取消额度阈值”约定，不能将收尾视为36目标已完成。

历史收尾记录（已由上述用户恢复指令解除）：2026-10-24 UTC 16:38，真实额度使用 **97%**，已触发用户收尾条件，停止新增 kernel/验证批次，保存证据及恢复步骤；已启动的有效有限任务保留。正式 **29/40**，目标 **36/40 尚未完成**。

- f32-vadd
- f32-vsub
- f32-vmul
- f32-vdiv
- f32-vmulc
- f32-vlrelu
- f32-vcmul
- f32-vmin（RVV 修复版）
- f32-vmax（RVV 修复版）
- qs8-f32-vcvt（NEON 修复版）
- s8-vclamp（RVV 修复版）
- qu8-f32-vcvt（NEON 修复、RVV 兼容版）
- qu8-rsum（NEON语法兼容版）
- qs8-rsum（两侧模32溢出修复版）
- f32-vrndne（两侧原始实现）
- qs8-vcvt（修复版，完整64位重新验收）
- [qs8-vlrelu](verification/qcp/verified/qs8-vlrelu/README.md)（两侧取负 UB 修复版，完整64位）
- [u8-vclamp](verification/qcp/verified/u8-vclamp/README.md)（两侧原始实现，可选 AVL128 版同计一项）
- [qs8-rdsum](verification/qcp/verified/qs8-rdsum/README.md)（两侧行数与溢出修复版，完整64位）

- [qd8-f32-qc8w-gemm-minmax](verification/qcp/verified/qd8-f32-qc8w-gemm-minmax/README.md)（其他 worker 完成，两侧修复版）
- [f32-gemm-minmax](verification/qcp/verified/f32-gemm-minmax/README.md)（其他 worker 完成，修复版）
- [qs8-vadd-minmax](verification/qcp/verified/qs8-vadd-minmax/README.md)（修复版，完整64位）

- [f32-vsqrt](verification/qcp/verified/f32-vsqrt/README.zh-CN.md)（两侧原始实现，intrinsic spec 边界）

- [f32-f16-vcvt](verification/qcp/verified/f32-f16-vcvt/README.zh-CN.md)（精确同值常量拼写兼容版）

- [qu8-rdsum](verification/qcp/verified/qu8-rdsum/README.md)（两侧大行数修复版，完整64位）

- [qd8-f32-qc8w-igemm-minmax](verification/qcp/verified/qd8-f32-qc8w-igemm-minmax/README.md)（其他 worker 完成，intrinsic spec 边界）
- [qu8-vadd-minmax](verification/qcp/verified/qu8-vadd-minmax/README.md)（两侧修复版，完整64位）

- [f32-igemm-minmax](verification/qcp/verified/f32-igemm-minmax/README.md)（其他 worker 完成，修复版）
- [f32-dwconv-minmax](verification/qcp/verified/f32-dwconv-minmax/README.zh-CN.md)（packed4 布局及 NaN 修复版）

- [qd8-f32-qc4w-gemm-minmax](verification/qcp/verified/qd8-f32-qc4w-gemm-minmax/README.zh-CN.md)（RVV NaN恢复修复版，完整intrinsic spec边界）

这里指公开契约和指定 C-shim 模型下的部分正确性；不包含真实 ISA 对应或完整终止性。

最新约定：intrinsic 只需采用与原始规范对应、可审核的 spec；C 实现及其证明可选。完整 kernel 仍须验证。见 [规范边界](verification/qcp/docs/INTRINSIC-SPEC-POLICY.zh-CN.md)。

- 2026-10-23（洛杉矶）：QS8 多行归约修复版完整验证通过并收录；有效 **19/40**。

- 2026-10-24（洛杉矶）：两项 GEMM 已收录；QS8 加法修复版完整验证、归档和发布复核通过，当前 **22/40**。

- 2026-10-24（洛杉矶）：平方根两侧原始实现完整验证及发布复核通过，当前 **23/40**。

- 2026-10-24（洛杉矶）：FP32→FP16 完整验证、归档及发布复核通过，当前 **24/40**。

- 2026-10-24（洛杉矶）：QS8 乘法 NEON 全部528项及完整接口通过；DWConv 修正初始化模型后250项非内存重放通过，14项内存组件已闭合；Maxpool新增3项内存组件。仍为 **25/40**，目标 **36/40**，其余完整门禁继续。
- 2026-10-24（洛杉矶）：QU8 多行归约修复版完整验证、归档及发布复核通过，当前 **25/40**。

## 后续推进与迁移计划（2026-10-24 洛杉矶，恢复工作）

- 优先收尾 f32-maxpool：既有NEON/RVV和wrapper组件已通过；冻结当前源码，重新生成全部11个实际C单元、857项C义务，并在统一fresh环境完成门禁。整核通过、审计和发布前不增加计数。
- 并行推进 f32-argmaxpool：复用已证的读取、输出frame和位级选择模型；新增普通借用适配器先完成20项实际C证明及双san测试，再用于两侧真实主核，避免重投未变的旧超时任务。
- 并行推进 qs8-vmul-minmax-fp32、f32-dwconv2d-chw：复用已证NEON528项、量化/9-FMA数学及内存组件；先用小调用诊断RVV瓶颈。DWCHW原load合同存在C指针元素步长与字节地址混淆，保留反例后修正声明，不改变正确的4字节Coq模型；依赖旧声明的证明须重生。
- 新准备 x32-transposec：迁移Arcadia固定版本的零宽修复；复用UInt输入单一所有权map、输出初始化/frame及VL分段经验。已保留原版NEON/RVV零宽反例和精确patch；修复后双san各8808例通过，完整QCP尚未完成。
- 后续准备 x32-packw-gemm-goi：只读复用旧883项scalar投影的布局、padding/gap与oracle经验；真实SIMD两侧及普通调用适配须另证。旧投影不记为完整kernel，也不修改其他worker历史目录。

验证总并发上限32（Maxpool最多16、Argmax最多6、QS8Mul/DWCHW合计最多6、root最多4）；普通16GiB/7200秒、重模块32GiB/14400秒，长生成21600秒。先复用语义一致的组件、再核对当前源码和依赖、最后统一fresh闭包。完整通过后fetch并直接提交c-shim-v2/verified；继续保留intrinsic spec人工审核及真实ISA/终止性边界。

## 当前工作

- FP32→FP16 已完整收录；原始范围和常量兼容记录保留。
- QS8、QU8 加法均已完整验证、归档并收录。
- QS8、QU8 RDSUM 均已完整通过并收录；QU8 保留两侧大行数修复记录与原反例。

- ArgmaxPool：计数修复及回归通过；指针表读取、比较选择小调用和输出复用资源证明通过，继续完整 kernel。

- FP32 sqrt 已完整收录；继续三输入 depthwise 卷积，先检查权重布局与 NaN 行为。
- QS8 乘法：全 binary32 数学关系通过；位级 NaN 检测兼容修复回归通过，继续实际 helper 和 kernel 验证。
- FP32 maxpool：修复计数与 NaN 顺序问题，回归通过，继续实际 C 验证。

上述候选与组件进展尚未计入当前30个完整通过的kernel。
- 两项整数求和已完成；推进多行归约 rdsum。

u8-clamp、GEMM、ENV及旧layout历史目录保持其他worker现有成果；root仅在新隔离的x32-transposec候选中推进，避免覆盖。

历史修复与原反例（PR 已关闭，后续直接提交）：[vmin PR #3](https://github.com/Etha-Sun/SALTy-rn/pull/3)、[vmax PR #4](https://github.com/Etha-Sun/SALTy-rn/pull/4)。

## 大进展

- 2026-10-23（洛杉矶）：QS8 激活修复版完整验证通过并收录；有效 **18/40**。

- 2026-10-23（洛杉矶）：QS8 转换修正类型后，完整64位门禁重新通过并收录；有效 **17/40**。

- 2026-10-23（洛杉矶）：收录其他 worker 完成的 U8 clamp；撤回 QS8 转换的错误64位长度域准入，修正类型后重验。当前有效 **16/40**。

- 2026-10-23（洛杉矶）：FP32 取整原始实现完整验收并纳入本次直接提交；已验证 **16/40**。

- 2026-10-23（洛杉矶）：QS8 求和两侧模32溢出修复版完整验收并纳入本次直接提交；已验证 **15/40**。

- 2026-10-23（洛杉矶）：QU8 求和NEON语法兼容版完整验收并纳入本次直接提交；已验证 **14/40**。

- 2026-10-23（洛杉矶）：QS8 转换修复版完整验证并纳入本次直接提交；已验证 **13/40**。

- 2026-10-23（洛杉矶）：修复了证明汇总文件的覆盖错误，增加完整接口检查；当时已验证仍为 12/40。

- 2026-10-23（洛杉矶）：qs8-rsum 两侧证明已汇总通过，准备最后复验；当时已验证仍为 12/40。

- 2026-10-22：VADD 旧结果重放通过；min/max 沿用 Frama-C 修复，保留原反例。
- 2026-10-23：VLReLU 完整验证通过，直接提交 `bf106ba7`；当时 **6/40**。
- 2026-10-23：复数乘法完整验收通过（`48930561`）；当时 **7/40**。
- 2026-10-23：min 修复版完整验收通过（`cb0b7f07`）；当时 **8/40**。
- 2026-10-23：max 修复版完整验收通过（`fec45725`）；当时 **9/40**。
- 2026-10-23：s8-clamp、qs8-f32 转换的公开调用入口全部通过，继续证明两侧 kernel；仍 **9/40**。
- 2026-10-23：s8-clamp、qs8-f32 转换的两侧完整函数组件通过，继续统一验收；仍 **9/40**。

- 2026-10-23：qs8-f32 转换修复版完整验收并直接提交 `598bf397`；当时 **10/40**。
- 2026-10-23：s8-clamp 修复版完整验收并直接提交 `3d40082c`；当时 **11/40**。

**小函数验证通过，只代表“零件”通过；完整 kernel 还要单独验收。只有完整验收通过，才增加上方数量。**

工作树：`qcp-simple-kernels`；分支：`codex/worker-simple-kernels`。GEMM 等其他 worker 的工作保持原样。
环境重放证据：[checkpoint.json](.build/simple-kernels-bootstrap/checkpoint.json)。

后续发布：完整验证通过后，先 fetch，再直接提交到 `c-shim-v2` 的 `verified/`；不再开 PR。

资源：后续新批次默认 **32 并发，普通任务 16 GiB、重型任务 32 GiB**；长生成最多 6 小时，按整机内存协调。现有运行保留原预算。修复主动参考 Frama-C 与 Arcadia-y，说明原因并验证修复后等价性。
恢复入口：[MEMORY.md](MEMORY.md)。

- 2026-10-23：目标提高到至少 **21/40**，新一批简单 kernel 已并行启动；当时仍 **11/40**。

- 2026-10-23：qu8-f32 转换修复／兼容版完整验收并直接收录；当时 **12/40**，继续推进至少 **21/40**。

2026-10-24 matrix worker：QD8 QC8W GEMM策略绑定复核完成，1914C/12策略/1455freshCoq/1941假设报告；原impl/spec不变，旧证据另存，verified仍25/40。IGEMM与QC4W仍candidate，不计整核。

2026-10-24 matrix worker：QD8 QC8W IGEMM完整入verified，6C/1381VC/15策略/1398fresh模块/1409假设报告；native41310cases/371790outputs/6negative controls，公开intrinsic-spec边界。当前清单26/40。本轮仅余已开工F32 IGEMM与QC4W GEMM，完成后停止。

- 2026-10-24（洛杉矶）：QD8 QC8W IGEMM 和 QU8 加法完整通过并收录，当前 **27/40**，继续向 **36/40** 推进。

2026-10-24 matrix worker：F32 IGEMM完整修复版入verified，4C/593VC/7策略/687fresh模块/604假设报告；native24375cases/316875outputs，3项负控制通过，公开22项intrinsic-spec边界。清单28/40。本轮仅余已开工QD8 QC4W GEMM，完成后停止。

- 2026-10-24（洛杉矶）：F32 IGEMM 已由其他 worker 完整验证并收录，复核通过，当前 **28/40**，目标 **36/40**。DWConv NEON 整体接口及 RVV 新增11项内存证明通过，继续整核验收。

- 2026-10-24（洛杉矶）：Maxpool NEON 442项完整接口从124份源码重放通过，RVV 50项内存证明通过；DWConv 正跑整核门禁。完整已验证仍 **28/40**，目标 **36/40**。

- 2026-10-24（洛杉矶）：DWConv 修复版完整验证及发布复核通过，当前 **29/40**，目标 **36/40**。Maxpool 两侧组件已通过，继续普通 NaN helper 和整核验收。

- 2026-10-24（洛杉矶）：Argmax 公开调用入口6项C义务及17份源码重放通过；入口双sanitizer独立oracle回归通过，主核仍在验证。最新额度94%，继续推进；完整计数仍 **29/40**，目标 **36/40**。

- 2026-10-24（洛杉矶）：DWCHW 公开入口6项C/4项程序数学及双sanitizer各128520case通过；Maxpool 两核组件442/268及新版NaN helper70完整接口通过，尚未整核重放。额度97%，按要求收尾，正式仍 **29/40**。

2026-10-24 matrix worker：QD8-F32-QC4W GEMM完整修复版入verified，5C/1531VC/12策略/1610fresh模块/1567假设报告；native1881cases/31977outputs，3项负控制，45项intrinsic-spec。清单30/40。本worker已完成本轮全部已开工矩阵核，按用户要求停止扩展。

2026-10-25 matrix worker：QS8-QC8W GEMM FP32完整修复版：4实际C/1531义务/16策略/3051同环境fresh模块（续跑谱系明确）/1874假设报告，递归coqchk及32并发准入通过。原NEON保持，RVV恢复ARM NaN优先级；公开容量内正N/K，全binary32参数，固定VLEN128，精确int8输出。intrinsic语义人工复核pending，无形式ISA/ABI或完整终止性定理。 完整清单32/40。下一优先SpMM；循环打包约定及FMA差异已预审，尚未计入verified。

2026-10-25 matrix worker：F32 SpMM完整修复/兼容版：4实际C/788义务/19策略/835同环境fresh模块/956假设报告，递归coqchk及32并发准入通过。完整M/N/稀疏循环、NEON4/2/1与全部合法RVV VL；全binary32，循环打包与显式容量，固定VLEN128/e32m8，数值相等或同为NaN。原件保留，两侧表达式兼容改写，RVV另修复FMA/NaN。intrinsic人工语义审阅pending，无形式ISA/ABI或完整终止性定理。 完整清单34/40。后续HWC→CHW候选已完成反例、RVV修复、原生回归和11个共享证明组件；完整实际C仍未证明，尚未计入verified，不重复其他owner的PackW/DWCHW。
