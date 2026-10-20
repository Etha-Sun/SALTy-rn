# VLReLU 最小点证明与 CASES 整合

本候选已冻结，正在执行独立全量验证，尚不计入 verified。
proof.patch SHA256：`d5b18b2b5506dde3de8df80b7b4543ae18334723ed600d2437e04d2f392a13d9`。

以 RVV v03 的 signed+memory 成功来源为基础，合入 NEON v19 的已检查点证明、
harness v04 的只读参数和最终比较证明，以及 21 行实际执行过的 CASES 策略。
原始来源均绑定不可变 attempt proof 和 source guard SHA；详见 merge-audit.json。

相对 merged-values-v01 只在 neon.c 加入两条 checked point cut 和一次已有 transfer
helper 调用，并在 harness.c 加入对应提示与三个 CASES 策略。完整差异见
root-delta-from-merged-values-v01.patch。普通 C token、公开 spec、shim、driver、
模型及 checker 不变；原 signed、store/load 和 RVV 证明保持。

来源局部证据：
- NEON v19：201/201 主项 +18 globals，包含全部50个点式调用前件和两个 helper body/frame。
- RVV v03：172/172 主项 +13 globals，包含所有新前件、helper body、RTE。
- harness v04：36/36 主项 +18 globals，包含所有新不变量、guard、退出 cut 和RTE。
- neon-exit-tactic v04：在 v19 基底上 prefix 建立/保持与 finalall 3/3 +18 globals。
- tailprefix 的两个 CASES 分支有独立真实成功记录。

不能把这些不同快照的计数拼成整核通过率。最终本候选必须重新检查全部调用闭包、
21条全局引理、caller/helper、前件、安全性、frame、循环及终止，并独立审查模型控制、
source guard 和 LLVM identity。只有全量检查通过才允许修改 verified/manifest.json。

调度：WP par128，TIP depth16，verbose2 只提供概览日志，整次行政预算1800秒。
单目标仍30秒、1024MiB。frama_depth16_trace.py 仅增加 verbose2 概览输出，已 pin SHA。真正逐目标 verdict 日志由新 frama_depth16_progress.py 的 `-wp-msg-key shell` 打开；该新 wrapper 不回写本候选冻结配置。
旧1200秒行政超时且没有完整 main raw 的候选保留，不反写其结果。

备用的 generic prefix-step helper 已在 v20 检查通过，但未加入这个更小的候选。
