# QD8 F32 QC8W IGEMM：完整 C-shim 验证

两侧实际 kernel 及全部普通辅助/caller已完整检查：RVV 719项、NEON 580项，全案6个C单元共1381字段。wholeclosure03以32路配置重新编译1365个本地依赖及33个最终模块，1409项假设报告全部通过，没有新增项目公理。最终封存状态见 [proof/status.json](proof/status.json)，完整证据见 [proof/full-status.json](proof/full-status.json)。

公开入口是 [spec.c](spec.c)，实际实现位于 [impl](impl/)。证明检查两侧循环、内存访问、普通辅助函数与caller；intrinsic使用 [逐项规格清单](proof/intrinsic-ledger.json)。这与现有verified的C-shim模块化部分正确性边界一致，人工intrinsic语义复核仍待完成。

## 输入与观察

- 本核为mr=1、NR=8，采用cn_stride=32的连续输出布局。K、N和指针表项数均不设小规模枚举上限，须满足64位地址容量、数组所有权及公开合同。
- ks是指针表的字节数，entries=ks/8，总乘法深度为entries*K。每个完整packed panel占96+8*entries*K字节，包括ksum、权重、scale和bias。
- entry等于zero时使用zero_data，不加a_offset；其他entry使用entry+a_offset。允许重复表项及同一底层分配中重叠的只读输入窗口；每个底层分配只持有一次所有权，选中窗口按需借出、归还。
- NEON尾部输入窗口须有8*ceil(K/8)字节可读空间；容量与地址上界见IGemmModel。指针表、packed权重和输出按合同持有独立资源。
- 整数累加按原顺序模32计算。浮点域保留全部binary32，包括NaN、Inf、正负零、subnormal及lo>hi；观察为数值相等或两侧同为NaN，不比较NaN payload和异常标志。

固定RVV VLEN=128，e8mf2/e16m1/e32m2对应最多8个活动lane；vstart=0，浮点RNE且不启用FTZ。NEON采用AArch64对应的浮点配置。非活动lane的抽象及NaN观察见清单所绑定的ProofBoundary证明。

## 实际检查与复现

全案包含6个C单元、1381个生成字段、15个策略字段。除了实际NEON/RVV、caller、标量NaN辅助与NEON基础单元，还单独检查3个间接访问辅助C函数。最终接口和假设审计覆盖所有这些字段，不用增量成功计数替代完整准入。

新批统一配置32并发。普通任务16GiB/7200秒，重型最终接口32GiB/14400秒，完整C生成64GiB/21600秒；共享资源池协调实际并发。依赖和任务数量可能使实际并发低于32。

```sh
python3 proof/check.py --run fresh01 --jobs 32 --budget-runner /path/to/budget_run.py
```

使用已配置的QCP/Coq环境，工具与外部依赖身份记录在最终evidence中。每个run名称必须全新，脚本不覆盖旧结果。`proof/dependencies.json`明确列出准入所需源文件；早期失败和诊断记录仅为历史，不能作为通过证据。

当前native回归：41310例、371790个逻辑输出，实际两侧与独立标量oracle对照，启用ASan/UBSan。6项负控制均被拒绝，包括两侧同时错误地返回零FMA的控制。这些是辅助检查，不能替代形式证明。

## 源码与信任边界

原始源码和SHA、当前实现身份见 [proof/source-identity.json](proof/source-identity.json)，兼容改动统一记录在 [repair.md](repair.md)。NEON仅删除指针cast里的restrict；RVV还把NaN自比较改写为isnan，并拆开读取后的指针递增。没有为证明缩小K/N或表项数量。

当前结论不包括QCP前端/生成器的形式soundness、真实ISA/编译器/物理ABI对应、任意硬件VLEN、独立终止性定理或ISO C对象provenance的完整模型。框架继承假设会逐项公开；“没有新增项目公理”不表示整个工具链无假设。

封存源码中少量初建时的candidate/open注释作为历史原文保留，不用于判定当前证明状态；当前结论只由上述完整检查与哈希绑定证据支持。
