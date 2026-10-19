qs8-f32-vcvt：固定四 lane ghost 证明展开候选，尚未运行 WP。

继承 ../qs8-f32-vcvt/proof.patch 的 wrapper 量词实例化续补，旧候选保留。
本次只将 NEON 的 before_mul1/2/3/4 后四个 k<4 ghost 循环展开：每个 lane 0、1、2、3 保留原三项前提 assert 和 proof_qcvt_eval 调用，再显式 assert 对应 qcvt 结论；末尾保留完整 forall j<4 断言。helper 实体及合同原样保留，必须完整检查 helper body 与所有调用前提。

可行性依据：原循环仅在 ghost 中遍历固定 4-lane NEON 向量，loop assigns 只有 k；展开不涉及真实 batch 循环或符号输入长度。不添加 kernel requires/assigns/ensures，不改 ordinary C、spec、RVV 或其他 tail proof。

预期：将四个 ghost prefix invariant preservation 目标替换为有限逐点关系及全称汇总目标。并不代表消除了逻辑义务，Frama-C 可能仍需解决同一 float/memory 量词匹配。

验证：现有 shim_c_campaign_closure.prepare 完整静态 source guard 通过，原 frozen 文件 SHA 匹配、patch fuzz=0、raw C token 相同、clang-14 预处理 token 12252 个相同、spec 字节不变，合同注入/外部 ghost/axiom 守卫通过。static-guard.json 保留原 manifest/proof、上一个候选及本候选 SHA；frozen_sha256 表示旧基线，未生成新环境锁或冻结记录。

未执行 Frama-C/WP；未运行正反模型控制；没有新的 raw VC 结果。历史 qs8 完整状态仍为 794/805、11 pending。本候选不得作为整核或局部通过证据。恢复环境后先完整检查四处展开后的 asserts/调用前提/forall，再运行整核严格验收。
