# 当前证明实验入口

更新：2026-10-06。各轮有限预算记录分别保留。以下项目在 `research/` 下并列组织；原 sum 证明包及历史检查记录保留原位置。此页是本轮工作索引，具体结果以各项目的来源绑定、实际日志和未闭合义务为准。

| 项目 | 当前证据 | 入口 |
|---|---|---|
| 既有 NEON/RVV 跨 ISA 调研 | 证明范围、文献、用户 idea 及候选方向 | [cross-isa-20261003](cross-isa-20261003/PLAN.md) |
| NEON 四指令自动化 | 正式合同组合版9行；不调用四个单指令合同的直接版29行并有局部策略支持；编译和独立检查均通过 | [自动化实验](../build/pr-sum/notes/experiments/neon-sequence-automation/README.zh-CN.md) |
| NEON 显式循环不变式 | 独立版直接证明机器循环，不调用原循环；定义及导出合同一致，9个未改消费者与独立检查通过；早期包装版保留 | [独立替代版](../build/pr-sum/notes/experiments/neon-loop-invariant/independent/README.zh-CN.md) |
| NEON 整体依赖地图 | 28个手写模块、76个显式证明；按职责和依赖解释短证明与自动化候选 | [依赖地图](../build/pr-sum/notes/neon-proof-dependency-map.md) |
| GEMM 汇编与 CFG | 现有FP32 4×8微内核编译为142条指令、19个基本块、2个循环；最长块27条 | [GEMM项目](gemm-neon-cfg/README.zh-CN.md) |
| GEMM 机器证明实验 | 固定模型及构建源码已恢复；依赖构建受阻，固定模型Real路径及Coq浮点接口存在具体缺口；没有FMLA/GEMM合同 | [恢复轮](gemm-neon-cfg/proof-pilot/runs/20261005-recovery/README.zh-CN.md)、[最新真实指令复现](gemm-neon-cfg/proof-pilot/runs/20261006-real-fp-mre/README.zh-CN.md)、[FP接口审计](gemm-neon-cfg/proof-pilot/FP-INTERFACE-AUDIT.zh-CN.md) |
| RVV 加载实验 | 前轮765秒到第一次读取后OOM；本轮300.921秒止于读取前缀，VL2仍未闭合；逐次256位更新桥及3个快捷规则独立检查通过，尚未实测完整加载收益 | [RVV项目](rvv-load-pilot/README.zh-CN.md)、[最新实测](rvv-load-pilot/runs/20261006-read-followup/README.zh-CN.md) |
| RVV 256位表示实验 | 任意old/vl/f的加载值与原65536位结果精确对应，独立检查通过；同shift/or打包的Coq VM微基准中位数9.574→0.378秒，约25.3倍；未解决Hload读取 | [压缩实验](rvv-register-compression/README.zh-CN.md) |

## 本轮自主分工和预算

用户明确授权两条路线继续执行，资源由代理自主安排。每条继续轮总墙钟最多一小时，实际运行串行；基础编译/有进展的检查可延长单次预算，通常内存16GiB、必要时32GiB。模型token是软工作目标，没有系统强制的token计量上限。

GEMM恢复轮在明确的构建及语义接口缺口处收尾，空出的GPT 6.1 Sol代理随后完成RVV源码/日志诊断；没有重复运行重型Coq或修改主证明代理的候选。主证明代理完成实际编译、候选变更及交接记录。RVV全过程见[本轮汇总](rvv-load-pilot/runs/20261005-summary.json)。诊断结论须经过实测才能标为已确认根因。

## 自动化与计算成本的实测依据

以下均为本机单次运行；RSS为进程峰值，单位GiB。它们不是多次重复后的平均性能，也不包含代理生成代码的token成本。

| 目标和写法 | 正文行数 | 编译时间 | 峰值RSS | 结果与解释 |
|---|---:|---:|---:|---|
| NEON四指令，原合同组合 | 22 | 47.34秒 | 1.45 | 编译通过，作为对照 |
| 同一NEON定理，合同组合自动化 | 9 | 22.28秒 | 0.95 | 编译及独立检查通过；编译对象从约138KB增至1.49MB |
| 同一定理，直接推trace并加局部辅助 | 29 | 33.98秒 | 1.14 | 不调用四个指令合同，编译及独立检查通过；尚非通用三行策略 |
| RVV真实加载trace，恢复编译 | 不适用 | 151.54秒 | 3.55 | 只编译语义定义，不是加载合同 |
| RVV既有VL=1合同，新环境对照 | 原脚本 | 300秒预算 | 约10.06 | 超时；不能推翻历史通过记录 |
| RVV VL=2首个直接候选 | 同形合同 | 300秒预算 | 10.17 | 前缀策略超时；合同未闭合 |
| RVV VL=2组合优化候选 | 同形合同及局部策略 | 765.10秒 | 28.53 | 32GiB虚拟内存预算下OOM；到达ReadMem，快速读取策略未命中；合同未闭合 |

NEON数据来自[实验结果](../build/pr-sum/notes/experiments/neon-sequence-automation/results.json)；RVV数据来自[恢复轮](rvv-load-pilot/runs/20261005-restoration/restoration-summary.json)、[VL=1对照](rvv-load-pilot/runs/20261005-vl1-baseline/compile.json)和[VL=2直接候选](rvv-load-pilot/runs/20261005-vl2-direct/compile.json)。两种NEON成功版本的独立检查范围不同，不能将这些编译时间当作完整工程的检查成本对比。原NEON对照未设置8GiB虚拟内存限额。

RVV最后的[组合候选记录](rvv-load-pilot/runs/20261005-vl2-final-imported/compile.json)和[运行日志](rvv-load-pilot/runs/20261005-vl2-final-imported/compile.log)保留了`Fatal error: out of memory`、signal 6及退出134；GNU time的尾部`Exit status: 0`不能覆盖进程被信号终止这一事实。定理陈述与既有VL=1模板相比，仅修改case编号和VL常数，没有收紧任意寄存器输入或改变内存合同。两次bool剪枝命中且跳过Define276是实测事实；整体候选同时改了多项策略，尚不能量化单项优化的性能贡献。

实用分工是：先让现有策略在有限预算内推；超时后先读性能分析，再由代理修改具体瓶颈。若只是一次性依赖编译且能看到持续进展，可增加计算预算。若缺少规格、不变式、可复用的数学桥或语义操作实现，增加服务器资源不能替代它们。重复的合同选择和状态连接更适合写确定性策略，代理负责开发和检查该策略，而非每个kernel重新生成同样的连接代码。

当前尚未收集可审计的代理token用量及重复运行分布，不能宣称某种分工已在总成本上最优。RVV的最新性能定位见[辅助审计](rvv-load-pilot/diagnostics/TACTIC-AUDIT.zh-CN.md)；其中候选根因与已测耗时明确区分。

## 成果边界

GEMM的结构统计、恢复模型、合成frontend测试与Coq接口导入都不是机器程序正确性证明。RVV当前通用加载合同的VL=2..8仍未闭合，顶层仍不能解除Hload或宣称最终NEON↔RVV程序等价。闭合假设报告和各局部证明不替代未完成的显式合同。

本轮不改变用户的RVV内部lane-loop idea的归属或状态；已完成的NEON局部策略优化与该候选方向分开记录。
