# F32 MAXPOOL：候选修复与证明进度

完整 kernel 尚未通过，不计入 verified。

当前实现保留 `K=0` 的首次 i0 读取，使用完整 unsigned64 的 guarded remaining count，修复 `(int)K-9` 的溢出和截断。RVV 使用原 NEON 的九输入归约树及 prev/group 操作数顺序；普通 C 适配器以真正 RVV numeric min/max、整数分类和 mask merge 恢复 Arm 的 NaN 优先级、quieting、sign/payload。只读指针表适配器每处保留一次读取和一次递增，支持重复输入窗口与重用表。

观察目标为逐 binary32 位模式相等，涵盖全部 FP32、NaN payload、正负零、Inf 和 subnormal；没有上下界有序前提。Arm 固定 DN=FZ=AH=0、禁用 FP traps；FP 状态标志不在观察中。RVV 固定 VLEN128、e32m8、VLMAX32，覆盖所有合法 VL；inactive 采用未观察的活动前缀抽象，没有固定为 ISA ta0。

已实际通过的组件分别为：

- 宽度、guarded count 与普通 assert：14 个实际 C 字段。
- 非空指针表读取：2 个实际 C 字段。
- 普通 bit observer/comparator：15 个实际 C 字段；只有其三个原始 NEON primitives 使用 intrinsic-spec 边界。
- 两个 named LD1 view caller probes：8 个实际 C 字段。
- 当前数学支持：111 条引理，31 个支持源与16个假设报告模块全部从源码 fresh ordinary Coq 编译通过；这部分为零 C VC。原63条基线记录保留。
- NEON 的 378 个非资源字段：32 个分组、汇总模块及精确 typed gate 共34次 ordinary Coq 编译通过。依赖使用明确固定的 coherent bundle；尚缺64个资源字段及完整442字段接口，不能视为全案 fresh 通过。
- 四个普通 NaN 包装函数的独立实际 C 单元：28个字段、完整 typed 接口与28次 Print Assumptions 通过；传播分类函数的普通 C body 仍待闭合，原五函数单元也须重新定型检查。这28项不与最终单元重复累计。
- 全写入状态观察：上述数学检查包含两个模块的20条引理，覆盖任意初始输出状态、重复或重叠像素写入的最后写入值，以及各自未写入地址保持。它们仍须在最终门禁中与两侧真实 kernel 合同绑定。

修复后 native 另测 30,000 helper 对，含实际 bit comparator、独立 oracle、合法 VL 变化、inactive poison、别名、尾部及 canary。加入公开 `compare_maxpool_written` 后，当前 UBSan 每侧运行7,852次独立完整调用、685,204输出 lanes，并运行23,556次公开 caller；每次检查完整最终输出 map 与未写入 frame。相同覆盖的实际16GiB/Swap0 cgroup ASan 也通过；完整命令、源身份与日志见两份 native 状态。AArch64 与 RISC-V 实际编译器也编译了当前 kernel 源及相应 helpers；这些检查不提供形式 ISA/ABI 或 compiler refinement 信用。

原版完整小反例为 K2/C1：NEON 输出 `7fc12345`，RVV 输出 `3f800000`。只修传播、保留线性树的 mutant 仍可返回错误 payload。K=2^31 的有符号溢出由独立算术前缀 UBSan 实测，明确未执行拥有2^31条目的完整大表调用。

公开 caller 可选择任意实际写入地址，10个真实 C 义务、完整 typed 接口及10次 Print Assumptions 已通过，连同17个本案支持依赖共19个普通 Coq 模块均从源码重编。其证明依赖两侧 kernel 的公共合同；最终门禁仍须闭合这些真实 callees。还需完成五个普通 NaN adapters 的真实 C 义务、两侧完整循环/kernel 及统一 fresh 门禁。所有已通过组件不能替代这一完整闭包。

入口：`proof/repair.json`、`proof/repair.patch`、`proof/original-counterexamples.json`、`proof/intrinsic-ledger.json`。原件和被拒绝的旧合同/失败探测保留在 `proof/original/` 与 `proof/history/`；intrinsic ledger 仍为草稿，最终逐项人工审核待完整闭合后进行。
