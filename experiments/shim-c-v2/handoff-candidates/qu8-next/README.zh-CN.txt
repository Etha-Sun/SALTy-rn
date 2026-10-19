qu8 proof 独立候选，尚未整核通过

proof.patch 基于 handoff-replay/qu8-f32-vcvt 的 local-proof-01 注释输入，保留其 wrapper final03 连接，新增有 body 的 proof_center_rvv、proof_qcvt_result、proof_qcvt_copy 三个 ghost 标量桥；补 RVV 中心化 lane 归纳及 NEON tail 的 lane 复制/重绑定。普通 C raw token、公共 spec 字节未变；主 agent 完整守卫与验收尚未执行。

helper04：raw 8/8，通过的只是三个 helper。控制台 14/14 另含终止/不可达计数，不能代替 raw。selected01：raw 4/8，约102秒；NEON hi_prefix 保持与 tail4_rebase、RVV center_prefix 和 mul_prefix 保持仍超时。rvv_center 局部通过依赖新循环不变量，该不变量保持尚未证，不能据此声称 RVV 桥已完成。

这些诊断固定 handoff-model-plus，单 worker、每目标10秒、外层180秒；去掉策略注释，未启用 RTE，与完整 runner 配置不同，不能把4个pending直接与整核剩余数量比较。helper01/02 是 prover 参数读取顺序错误；helper03 是沙箱 IPC 环境超时，不是 proof 失败；helper04/selected01 在支持 IPC 的环境运行。

无solver打印定位：ghost C helper 输入索引带嵌套 to_uint64，逻辑 prefix 使用数学整数索引；helper 返回的单lane qcvt 后置虽已存在，量词前缀提升仍未闭合。候选最后补了 index_bridge 和 qcvt_point 断言，把整数索引桥与浮点关系分离；这些最后断言尚未 solver 检查，selected02 未运行。下一步只选这两类断言和 hi_prefix 小预算诊断，成立后再冻结新候选并完整复验。

原 handoff-replay case、活跃完整run、模型和锁均未修改。诊断源快照保存在本目录 .build；输入 SHA、raw JSON、命令和日志见 diagnostic-summary.json 与 logs/。最终候选 proof SHA 见 candidate-sha256.json。

实际已检查的两个 proof 版本另存 diagnostic-inputs/helper04 和 diagnostic-inputs/selected01，各有 proof.patch 与输入 SHA manifest；可由冻结原始输入重建，不依赖被忽略的 .build。它们与目录顶部的最终候选 proof.patch 明确分开。
