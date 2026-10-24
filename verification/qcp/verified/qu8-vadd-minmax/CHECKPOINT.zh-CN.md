候选 qu8-vadd-minmax：完整 kernel 尚未通过，对已验证计数贡献仍为 0。全局已验证计数由 root 集中维护。

显式 unsigned long long64 size_t；已独立fresh验证sizeof8，旧QCP32/native64历史均保留。完整int32 shift通过有界remainder decoder计算signedlow8(-raw)，actual16 C probe+6数学已typed/Print；只替换SRSHL观察count和修复RVV控制，不改ISA primitive解释。原件、精确GNU patch、原UBSan与数值反例、错误cast actual目标均保留。

当前RVV 1406实际C义务已用新的16个leaf和16个Print模块全部typed通过；source/model/actual目标保持一致，只优化纯条件证明。主要Ccallee/公开caller、byte-memory和tail/composition也已有独立fresh证据。两种native后端各21472组/2665773 lanes每侧、公开caller同量，两个共享同错负控均拒绝。

NEON完整780实际C字段（330pure+394calls+56memory）现已全部普通Coq、完整fullyqualified VC_Correct及780项Print通过；证据 proof/neon-proof-status.json，run .build/neon-kernel-gate-4xqhd4g8。原模型/目标和各失败诊断保留，不复用其他case对象。RVV原7200秒有限生成预算超时，无实际目标/反例；原源保持逐字一致，14400秒新预算正在 .build/rvv-kernel-7qz_dxav 运行。

新增实际字段TU+公开caller的ASan/UBSan同覆盖均通过（21472+21472调用、每侧每路径2665773 lanes）；真实cgroup MemoryMax16GiB、SwapMax0，独立oracle拒绝共享同错负控。完整全案仍未通过。

完整fresh工具draft已准备：proof/full_inputs.py、build_full_handoff.py、check_full.py。完整门禁最后全部Print按16分区并行，再单个fullyqualified typed汇总；无BASE/旧component对象导入。尚未freeze/启动。live CPP预检含8个width guard后为31Cunit/109 bodies，0漏callee/声明/合同差异。新批次16 jobs、16GiB/进程；不为填并发重复工作。
