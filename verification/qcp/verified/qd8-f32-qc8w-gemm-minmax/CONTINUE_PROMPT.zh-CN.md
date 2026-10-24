# QD8 GEMM 已完成；继续矩阵 kernels

当前 qd8-f32-qc8w-gemm-minmax 已完整通过并物理移入 verified。权威入口 proof/status.json、proof/full-status.json、proof/publication-audit.json；5实际C单元/1914字段、1455普通Coq模块、1941假设报告，继承14个框架假设，无新增项目公理。全部当前C目标已重生成；native4992例、独立oracle、both-wrong/false-goal/篡改负控通过。迁移后全部源、证明及5CPP身份一致。

不要再启动旧QD8作业、不要覆盖封存证据、不要把旧软件FMA1007/1015当未完成准入。新复跑用proof/check.py新run名与32并发，按共享512GiB池配置有限预算。intrinsic采用来源审查spec；最终人工复核仍pending，ISA/编译器/物理ABI与独立终止性未证明。

用户目标已扩大为尽可能多解决矩阵乘法相关kernels。工作树 /srv/home/yuechunsun/tools/qcp-worker-qd8-verified，先读 verification/qcp/AGENTS.md。跨核最新prompt为 /srv/home/yuechunsun/tools/lean/build/qcp-worker-local/matrix-kernel-closure/CONTINUE_PROMPT.zh-CN.md。

f32-gemm-minmax 候选全部C与1059依赖已闭合；admission04最终4模块/923报告正在运行，完成后独立seal/promote。QD8 IGEMM已迁移并fresh检查11辅助C字段/3策略和7Coq模块；整核未完成。QC4W已复现NaN反例并修复RVV，native广泛回归通过，待完整QCP。

发布状态以git HEAD/remote和本地PROGRESS为准；不要仅凭本文件推断已经push。
