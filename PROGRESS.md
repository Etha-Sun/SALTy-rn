# Kernel 验证进度

完整验证通过：**28/40**。新目标：**至少 36/40**。依据：[verified 清单](verification/qcp/verified/manifest.json)。

2026-10-24 用户最新规则：目标至少 **36/40**；每 **30 分钟**读取一次当前账户实际额度，任一有效窗口的已使用比例 **严格超过 95%** 时开始收尾：停止新增 kernel/验证批次，保存证明、日志、已验证清单和恢复记录，汇总可交付结果；已启动的有效有限任务优先自然完成。读数不可用时明确记录未知，不编造百分比。此规则覆盖旧的31目标及“取消额度阈值”约定，不能将收尾视为36目标已完成。

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

这里指公开契约和指定 C-shim 模型下的部分正确性；不包含真实 ISA 对应或完整终止性。

最新约定：intrinsic 只需采用与原始规范对应、可审核的 spec；C 实现及其证明可选。完整 kernel 仍须验证。见 [规范边界](verification/qcp/docs/INTRINSIC-SPEC-POLICY.zh-CN.md)。

- 2026-10-23（洛杉矶）：QS8 多行归约修复版完整验证通过并收录；有效 **19/40**。

- 2026-10-24（洛杉矶）：两项 GEMM 已收录；QS8 加法修复版完整验证、归档和发布复核通过，当前 **22/40**。

- 2026-10-24（洛杉矶）：平方根两侧原始实现完整验证及发布复核通过，当前 **23/40**。

- 2026-10-24（洛杉矶）：FP32→FP16 完整验证、归档及发布复核通过，当前 **24/40**。

- 2026-10-24（洛杉矶）：QS8 乘法 NEON 全部528项及完整接口通过；DWConv 修正初始化模型后250项非内存重放通过，14项内存组件已闭合；Maxpool新增3项内存组件。仍为 **25/40**，目标 **36/40**，其余完整门禁继续。
- 2026-10-24（洛杉矶）：QU8 多行归约修复版完整验证、归档及发布复核通过，当前 **25/40**。

## 当前工作

- FP32→FP16 已完整收录；原始范围和常量兼容记录保留。
- QS8、QU8 加法均已完整验证、归档并收录。
- QS8、QU8 RDSUM 均已完整通过并收录；QU8 保留两侧大行数修复记录与原反例。

- ArgmaxPool：计数修复及回归通过；指针表读取、比较选择小调用和输出复用资源证明通过，继续完整 kernel。

- FP32 sqrt 已完整收录；继续三输入 depthwise 卷积，先检查权重布局与 NaN 行为。
- QS8 乘法：全 binary32 数学关系通过；位级 NaN 检测兼容修复回归通过，继续实际 helper 和 kernel 验证。
- FP32 maxpool：修复计数与 NaN 顺序问题，回归通过，继续实际 C 验证。

上述其余候选与组件进展尚未计入 27 个完整通过的 kernel。
- 两项整数求和已完成；推进多行归约 rdsum。

u8-clamp、GEMM、ENV、layout 保持其他 worker 的现有分工。

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
