# QS8 → F32 worker checkpoint

当前整案尚未通过，不计入 verified。原 NEON INT32_MIN 有 UB，已保留原件、UBSan 反例和 repair.patch；修复实现使用无符号取负后原 int16 窄化。RVV 原件未改。全 int32 零点、全 binary32 scale（NaN/Inf/±0）均保留；VLEN128、VLMAX32。

已通过必要实际 C 组件 832 项：scalar14、s16 dup2、NEON54、组合调用14、RVV active32、RVV arithmetic490、char memory137、NEON float memory14、RVV float memory75。公开 wrapper35 项另计。cast3 和聚焦 seed caller5 为诊断，不计入组件。

完整 kernel 实际目标：NEON424（`.build/neon-kernel-gprmjrsd`），RVV46（最新 `.build/rvv-kernel-qr9_mmav`）。两者 raw/同 frontend CPP token 身份检查通过，内部 fp32_eq/ne 数量均为0；窄化保留。旧 RVV 目标 z631f5zh 缺少循环不变量对原非空事实的保留，仍保留原失败；新 invariant 的非空事实由原公共 Require 推导，未加强公共域。

普通 Coq 已完成：NEON357/357 Calls/safety，`.build/neon-calls-hzoa6q14`，与当前公开proof源SHA逐项一致；RVV完整46 actual C字段（41 Calls +5 memory）+typed VC_Correct+52项Print（46 C+6 case策略），`.build/rvv-kernel-final-mb85gfc_`。每进程16GiB；有限600/900/1800秒。首轮错误 leaf 导入环境与范围提取成本问题的 run 445l4tf1/1ph0ja0i 保存日志与 superseded.json，仅本 worker 的已知错误进程已停止。

root 独占并行 NEON67 memory/aggregate：`proof/coq/NeonMemory.v`、`NeonMemorySupport.v`，不要双写。root 已冻结 public spec、ProgramModel、ProgramFacts、Observation、wrapper 和 RVV float store。全案 runner/最终记录/晋级/提交由 root 负责。

Native 已实际 link public spec.c/equivalent，UBSan+ASan 均通过215340 cases、4486728 active lanes/side及负向 comparator controls；ASan 实际 cgroup memory.max16GiB，证据 native-public-j52rd99_。单独 scalar 实际 C oracle17629445 checks；组合宏实际 C/精确 frontend oracle131072 checks、参数单次求值通过。它们不替代形式整案或硬件 ABI/ISA 精化。

补强native：formal-native-status.json 使用全部23个实际scalar-field C helper单元、同一formal frontend和原impl/public spec，UBSan+ASan157086cases/2315452lanes per side通过，ASan实际16GiB。

下一步：等待root的NEON67 memory源/目录，完整NEON424 VC_Correct/逐项 Print Assumptions，然后冻结全部源和 handoff 清单，交 root 全新26-unit重生/ordinaryCoq/调用闭包/身份门禁。预计实际 C总数1337=832组件+35wrapper+424+46，最终以 fresh goal 接口实数审计。

最后 NEON 循环回边 test_neon_entail_wit_3 已通过 ordinary Coq，`.build/neon-loop-jjb1wzsa`，235.49秒，含 Print Assumptions。公开 NeonLoop.v 冻结 SHA256 `6fe82aafa0ba5885630279946ffa0944f1cee61bdecf32ac14691386752a22cf`；只剩 root 合成67项 memory 和本 worker 的完整424 typed/Print 门禁。旧失败 loop run/log 全保留，不计入成功。

NEON完整424 actual C字段 + typed VC_Correct +426项Print（424 C+2char策略）已正式ordinary Coq通过，`.build/neon-kernel-final-tz98fioy`，proof/neon-proof-status.json。Memory67已分16组，原statement/proof body逐字保留且独立QA通过；组件门禁 `.build/neon-memory-parallel-veb7a3sq`。所有实际C组件832、wrapper35、两kernel424+46均已有组件实证，仍等待全案fresh26单元/1337 C字段+30策略门禁，候选尚未计verified。所有C/annotation/Coq源现冻结，剩余fullrunner/H冻结及正式发布由root与neon owner负责；本worker无活跃状态写进程。
