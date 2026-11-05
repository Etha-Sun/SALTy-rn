> 监督者审核后收录（2026-11-05）。原草稿：`build/e1-workers-20261104/w11-vmaxmin/bug-drafts/f32-vmin.zh-CN.md`。同 DIV-001。

# 候选记录：E1 f32-vmin 的 NaN 不等价（非已确认 XNNPACK bug）

1. **发现途径：** E1 原始 NEON A ⇔ 最终优化 RVV Bopt，重放历史反例线索，使用真实 intrinsic + QEMU 对原版及规则改写版重新确认。不是本轮证明失败推导的新反例，也不是新发现的上游问题。
2. **固定版本与触发条件：** A 为 SALTy-rn `be16280c7`，Bopt 为 optimized-rvv-kernels `80feb4564`，XNNPACK `867d5a344790802ee067be62f572c2e2722bf6fb`。n=1、batch=4，输入 `a=0x7fc12345`、`b=0x3f800000`，A 输出 NaN `0x7fc12345`，Bopt 原版和改写版都输出 1.0 `0x3f800000`。输入交换也不等。输入 padding、非别名与 params 条件满足。
3. **新运行证据：** [VLEN512 反例](../analysis-001/f32-vmin-512-counterexamples.json)、[汇总](../analysis-001/summary.json)、[A 输出](../run-001/f32-vmin-A-None.out)、[Bopt 输出](../run-001/f32-vmin-Bopt-512.out)、[改写版输出](../run-001/f32-vmin-lowered-512.out)。VLEN128/256 同样复现，每配置 450 例/252 不等，全部历史 44 反例重放成功。双方都是 NaN 的 payload 差异不计入反例。
4. **原应用中能否出现：** 可以传入 NaN 数据；API → 创建/config/params → reshape/setup → ukernel 没有数据非 NaN 检查。精确行号、n=1 常量分派和 n=2 二向量分派的区别、实际 u8/u8v 配置实测，见 [L1 审计第 3 节](../L1-AUDIT.zh-CN.md)。这属于源码可达性依据，未运行完整 operator。
5. **偏离方：** 对当前 E1 观察关系，A 与 Bopt 不等。对 tester 的 `std::min` 计算式：左 NaN 时 Bopt 偏离，但检查跳过；右 NaN 时 A 偏离。fallback reference 的选择优先级相反。维护者明确不保证 min/max 的 NaN 行为：[原评论](https://github.com/google/XNNPACK/issues/441#issuecomment-611173104)。因此没有证据将任一侧定性为违反统一 XNNPACK 契约的 bug；也不能据此加强原 spec 排除 NaN。
6. **修复计划：** 待监督者决定目标，当前没有程序补丁。若保持 A 的全域语义，拟只在 Bopt 的 vfmin 结果处增加 NaN 检测/合并，保留既有循环和 LMUL；候选存 `proposed-fixes/<decision>/f32-vmin/`，原件不覆盖。重新规则改写，三种 VLEN 验证 `A ≡ Bopt_fixed`，并在同一 Saturn 平台实测原版/修复版性能。若采纳 tester 公式，两侧都有待改行为，另定目标。若采纳库弱语义，须单独审阅观察关系，不能声称原严格目标成立。详细方案见 [L1 审计第 5 节](../L1-AUDIT.zh-CN.md)。性能未测，不声称无开销；不建议将已知允许的差异向上游报告为新 bug，任何对外联系均需用户授权，本轮未发送。
7. **对实验结论影响：** 原始 `A ≠ Bopt` 为保留的主结论。完整等价性证明数为 0；若将来证明修复版，作为独立结果。该条不计作新 XNNPACK bug，不自分配 XNN/BOPT 编号。
8. **状态：** 真实程序反例已确认；L1 分诊完成；参考/契约目标待监督者选择。遵守 COMMON-RULES-v2 的禁止自行修改程序/spec 要求，未修改代码、spec、历史结果，也未新增公理或 Admitted。
