# 本案修复日志

原始来源固定为 `be16280c7812a7459c26c3ce82a47339a3d07718` 的 `qd8-f32-qc8w-gemm-minmax`。逐侧原始与当前 SHA、精确 diff 见 [source-identity.json](proof/source-identity.json)。仓库 `kernels/source` 和 `kernels/target` 原文件未修改。

1. **NEON prefetch 地址上界。** 原 `xnn_prefetch_to_l1((const int8_t*)w+448)` 改为仅在 `(uintptr_t)w <= UINTPTR_MAX-448` 时执行。读写计算、K/N 循环、packed 布局均不变，没有扩大 W 的分配或收缩 K/N。例：64 位 `w=UINT64_MAX-447` 时，原表达式的数学地址为 `UINT64_MAX+1`；错误的 `-447` 条件仍放行，正确 `-448` 条件拒绝。这是 QCP 整数地址边界反例，不声称实际硬件出现 fault，也不以此证明 ISO C 对象边界内的指针运算。历史原版 1345/1347 与修复版 1446/1446 证据保留在原工作区；本包另外重放修复版。[NEON patch](proof/evidence/neon-repair.patch)
2. **RVV 前端兼容。** 将 `(int16_t)*a0++` 拆成读取和 `a0 += 1`；将两次 bounds 自比较改为 `__builtin_isnan`，后者在本包映射到带保值 helper 的实际 C 实现，避免 QCP 前端把同表达式自比较折叠。没有添加 finite/lo≤hi 等输入前提，没有改变浮点运算顺序、NaN 恢复或 store 范围。[RVV patch](proof/evidence/rvv-repair.patch)
3. **注释和合同接线。** sizeof(int8_t)=1、字段地址和 loop/frame 事实通过注释与 Coq 引理处理。kernel 注释显式展开 `mr=1, nc>0, kc>0`；公开 `domain_shape` 已蕴含全部三项，`ProofBoundary.qd8_kernel_precondition_equivalent/frame` 证明等价与带 frame 后果。比较 helper 的内部长度支持到 `UINT64_MAX/4`，公开 K/N 域没有缩小。`qd8_ret_one` 只是 `return=1` 的定义别名，公开入口仍明确要求 return=1 和输出关系。
4. **证明预算。** 首轮独立 32 路重放有四个脚本内置 15 秒 tactic 超时。保留失败记录，后续只提高新包证明副本的 tactic 时间上限，精确列表见 [tactic-budget-changes.json](proof/tactic-budget-changes.json)。未改变证明目标、C、语义模型或输入域；历史已封存 .v 和结果不改写。
5. **采用 intrinsic spec 边界。** 按用户纠正和项目新规则，不要求补齐软件 FMA C 实现。历史辅助软件实现 1007/1015 保留，未伪报完整。新包直接审核 Flocq FMA/乘法、两 ISA 的 min/max、活动 lane 与内存合同；NaN 策略和活动前缀的观察保持另有 Coq 定理。C body 计数仅含真正检查的 kernel/helper/caller，不把 spec 项计作实现证明。

performance 未实测。NEON 多一个 prefetch 条件，RVV 是上述局部表达式改写；不据此承诺具体性能增减。

2026-10-24：修正证明用策略DSL的类型绑定（23处`short`→`I16`），并新增实际StrategyCheck目标精确比对。不是kernel或输入域修复；impl/spec SHA不变。独立全案strategy-admission02已通过，原封存记录另行保留。
