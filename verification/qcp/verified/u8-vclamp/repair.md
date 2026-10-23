# u8-vclamp 修复与验证日志

这是交付包中唯一的人类可读修复日志。2026-10-23 用户允许有限修改 RVV 并要求保留一个修复日志。主版本 [impl/testNEON.c](impl/testNEON.c) 和 [impl/testRVV.c](impl/testRVV.c) 仍逐字保留 catalog 原件；两侧原始 SHA 分别为 `e52c7c97805aec65922f07f19c7496015596e375b17306258f9e5f4805528f57`、`018e3ba729c18c674b29a40ae7ab04ddd2e10ea59b032f5e9fd794a36681665f`。

## 可选修改：限定每轮 AVL

[impl/variants/testRVV.avl128.c](impl/variants/testRVV.avl128.c) 只把两处 `vsetvl(remaining)` 改为 `vsetvl(remaining < 128 ? remaining : 128)`，对应变量为 batch64、batch。精确差异见 [rvv-avl128.patch](proof/rvv-avl128.patch)。不改总 n、两个 phase 的 min/max 顺序、完整 uint8/uint32 域、lo>hi 情况及输入 n+7／输出 n 的权限。

原 C shim 选择 `min(AVL,128)`；RISC-V V1.0 在 VLMAX<AVL<2*VLMAX 时允许其他 VL。例如 VLMAX=128、AVL=192 时 VL=96 合法。这是原策略并非唯一的例子，**不是原 u8 输出错误反例**。限制请求不超过 128 后，当前配置下 VL 必须等于请求，依据 [Vector V1.0 的 VL 约束](https://docs.riscv.org/reference/isa/v20260120/unpriv/v-st-ext.html#_constraints_on_setting_vl)。较大 VLEN 上可能损失并行度，本案整核结论仍固定 VLEN=128。

[Policy.v](proof/coq/RvvRepair/Policy.v) 的六项数学引理证明请求范围、VL 唯一性、与既有选择相符、步长下降以及 AVL192/VL96 的合法例子。它们是规范规则的数学应用；不把步长引理写成额外的完整程序终止定理。

## 修复经过和证据范围

最初局部修复生成 88 个 controller VC，替代原来的 54 个。新增分支有新前提；不能因字段名称相同而直接套旧证明。开发中实际出现并保留了两次 Policy tactic 失败、一次 Ltac 局部变量作用域失败、七个别名证明类型不匹配，以及 native 隔离副本缺少头文件的编译失败；随后修正证明脚本或隔离输入，没有缩小规格。开发记录是历史证据，不作为此次公开包 fresh 编译的替代。

原版最终为 939 个 C 字段，可选版为 973 个，两版 C-shim 整核均闭合。先前把 ISA／终止性未证明解释为“没有整核闭合”不符合现有 verified 标准，已纠正：该目录以公开合同下的 C-shim 部分正确性计完成。AVL 修改不是原版进入 verified 的必要条件，也不是 s8-vclamp 的尾部顺序修复；s8 的原 RVV 与本案源码不同。

公开包整理前曾从空本地输出重编 458 个必要 Coq 模块，13 个 C 单元重新生成，4 路 Coq 阶段实测 3641.05 秒。该次封存记录保留在 [pre-package/status.json](proof/evidence/pre-package/status.json)，不修改其命令或并行度。最新公开包按用户要求使用至少 16 路；完成状态与实测时间以 [status.json](proof/status.json) 绑定的本次记录为准。

本次原生回归对原版、可选版分别检查 65536 个实际 public 调用，ASan/UBSan、独立 scalar oracle、另一合法 VL 策略以及输入／参数保持均纳入检查。错误 phase 的负控制在合法输入上被比较器拒绝，源码篡改和 False 目标也必须拒绝。负控制不是原版反例，有限回归不替代形式证明。

## 公开包完整验收（2026-10-23）

[本轮完整记录](proof/full-status.json) 的 passed=true：13 个实际 C 单元重新生成并匹配，458 个必要本地模块普通 Coq 编译全部 exit 0，原版 939／可选版 973 的 typed case gate 均通过。31 个策略字段、6 个 VL 引理、全部 C 字段的 Print 报告完整审核；C 字段的 13 项继承依赖加上策略中 3 项既有经典逻辑依赖，共列明 16 项，没有新增项目公理。源码篡改、错误 phase 输出和 False 目标负控制全部按预期拒绝。

配置为 16 路、每进程 AS 上限 16 GiB、整批服务上限 256 GiB。Coq 阶段 2115.51 秒，比此前 4 路的 3641.05 秒缩短约 41.9%；全部检查 2261.03 秒。单个编译进程观测的最大 RSS 为 4.342 GiB，不把它当整批内存峰值。旧 4 路记录和开发失败均保留；[开发历史归档](proof/evidence/development-failures/archive.json) 提供原始源／日志的逐文件校验值。

此次迁移仅在完整运行成功和预算作业正常 exit 0 后执行。迁移后的 CPP／Coq 源身份核对见 [relocation.json](proof/evidence/relocation.json)，它不计为第二次完整 Coq 重放。
