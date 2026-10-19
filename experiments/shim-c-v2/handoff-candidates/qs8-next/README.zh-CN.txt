qs8 NEON tail 分解候选，未执行 WP。

继承 qs8-f32-vcvt-lanes，旧候选及进行中的 handoff-replay/qs8-f32-vcvt local-proof-01 所有输入保持不变。
新增 10 项具名 ACSL assert：batch&4 合流后明确 vy 相对 done 的 4-lane qcvt 关系；vget_low_f32 后对 lane0/1 各自列出 same_float 复制、源 qcvt 和目标 qcvt；batch&2 分支更新 done 后显式连接 vy lane2 和提取后的 vy_lo lane0。原 tail2/tail1 全称断言保留。

这些只是原证明义务的局部分解，每项都需 WP 实际证明，不是新增 requires 或假设。没有改普通 C、spec、RVV、模型、旧锁或 checker；不添加 helper、合同或新前提。

原有 source guard 全部静态通过，12252 个 clang-14 预处理 token 不变；SHA 和范围见 static-guard.json。未运行 Frama-C；没有任何新的通过计数。此候选应在新 run 完整结果基础上定点诊断后再决定是否使用，不应覆盖当前运行。

实际诊断补充：tail-proof03 在允许本机 IPC 的环境运行115.91秒并正常结束，12个指定断言中8个Valid、4个timeout：tail_vy_rebased、tail_low_source_1、tail_low_value_1、diag_tail2。raw和细粒度pending见 diagnostics/tail-proof03/summary.json。配置移除了策略选择注解并禁用策略引擎，仅为局部定位；不能与完整原策略结果合并。tail1等下游Valid仍可能依赖上游未证断言，不能视为独立闭合。
此前print01语法注册错误、print02无solver预算退出、tail-proof01 prover解析顺序错误、tail-proof02沙箱IPC下why3server退出均单独保留，不作proof失败统计。print03定点打印成功。
下一步：保留同模型与原checked策略，定点实例化lane1并在分支内明确vy/done重绑定；选中对应断言及RTE，随后完整验收。当前不再启动新诊断。
