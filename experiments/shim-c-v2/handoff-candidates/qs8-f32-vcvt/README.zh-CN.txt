qs8-f32-vcvt 最小续补候选（尚未运行 Frama-C）

基线：integer-array-v3/qs8-f32-vcvt local01，历史 794/805，11 项 pending。
本目录只有独立 proof 候选与静态审计，不是已冻结/已验收 case。

实际改动：
1. 从 qu8 的 output-instance / final03 原样移植 checked Wp.instance 策略。
2. 在原最终比较循环增加逐点 output_same invariant，使原 ensures_equal 能利用全称输出相等关系。
原 qs8 proof 的其他部分全部保留；未更改 kernel 合同、公共 spec、普通 C、模型、旧锁或历史结果。

已检查：全部基线 manifest 文件 SHA 一致；新 patch 可 --fuzz=0 应用；所有 C/H raw C token 不变；spec 字节不变。详细见 candidate-audit.json。
另已调用原 tools/shim_c_campaign_closure.py prepare 的完整静态 guard：clang-14 预处理 token 12252 个一致、合同注入/外部 ghost/axiom 检查通过，报告 static-guard.json；该报告的 frozen_sha256 指原基线，并非新冻结版本。
尚未检查：Frama-C 解析、策略适配和所有 VC。禁止据此减少历史 pending 或声称任何新 VC 已通过。

待环境恢复后的顺序：先用本候选建立独立新冻结 case；完整验证 model-plus 对应环境与正反控制。优先仅诊断 ensures_equal/output_same（新 run 名），随后完整跑所有 body/global/guard。该局部策略有 qu8 的 3/3 历史依据，但没有 qs8 新证据。

其余 10 项：
- NEON ghost lane-prefix preserved 四项：原 logical line 55、70、61、108。当前 helper proof_qcvt_eval 的逐点结果已经在循环体中给出，优先查看 WP 展开后同一索引的 input/float memory 表达式，再做 checked instance，不应另加 kernel 前提。
- NEON tail2/tail1 量词断言：logical line 122、153。应分别检查 batch&4、batch&2 分支中的 done 与 lane 偏移，把高半向量和 done 的关系分步 assert；不要更改 store 范围。
- RVV assert_102/103/106：logical line 39、48、57；proof_qcvt_eval 第5次调用 requires（line 51）。应在 vl 内逐点实例化 centered_mod16、conversion 合同和 before_rvv_mul 的快照关系。centered_mod16 已有 z!=INT32_MIN 条件，必须从原 wrapper 域推导，不可新加 requires。

此候选明确只处理最终 wrapper 量词连接，不声称解决剩余 lane/tail 目标。没有观察到新的 kernel 反例。
