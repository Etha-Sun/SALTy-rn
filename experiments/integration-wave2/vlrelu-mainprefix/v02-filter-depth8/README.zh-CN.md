# 主4-lane prefix：实际完成的最小修复

本候选从同一 `d5b18...` 合并版本建立，只有两处注释变化：给原不变量命名 `mp4_main_prefix`；给它绑定一次官方 `Wp.filter` 后接原 SMT 策略。没有新增语义断言、lemma、helper、私有 requires 或普通 C 变化。

新实际结果为 **2/2 主目标 +21/21 globals**，模型控制合格、source/model unchanged。建立项 Qed；保持项实际 script 是一次 `Wp.filter anti=false`，随后继承的 `VmemAddress` 只展开 goal 的 `shift_float32(o_base,0)`，最后 CVC5 4.85秒关闭。前面直接 SMT 尝试曾超时，后续完整子树已实际关闭。证据和 SHA 见 `evidence.json`。

旧 `equivalent_loop_invariant_8_established/preserved` 对应新具名目标；谓词逐字不变。`minimal-on-merged-values-v02.patch` 是可供 root 审查合并的两文件最小 delta，必须保留既有 `VmemAddress` 定义。采用新的已 pin depth8 progress wrapper，par128、每solver30秒/1024MiB；管理预算360秒内实际完成。

这是局部闭合，不是整核通过。主4lane ghost-prefix 的实际推进仍依赖完整运行尚未闭的 assert11/12。其它 assert21/22 和 harness `vmem_final_reads` 也不在本 scope。合并后需同一完整候选重新检查714主目标及21globals，不能拼接不同 proof 快照的通过数。

旧 v01 通用实例化尝试540秒未生成 main raw，按行政预算正常取消并保留；它不是 kernel 反例，也不是成功证明。
