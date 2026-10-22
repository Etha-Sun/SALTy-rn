# 原始 RVV VADD 控制流的 C 表示证明

`rvv_loop.c` 从冻结的 `kernels/target/f32-vadd.c` 经已审查的 `tools/lower_vadd.py` 取得，再添加合同、循环不变量和两处 Assert。生成器逐 token 检查：添加注解没有改变普通 C。原 while、动态 VL、两次 load、add、store、三个指针更新及 n 递减均保留；没有用一个已声明正确的 chunk 替换循环体。源文件及 lowering 的身份记录在 `loop-source.json`。

完整 unit 有 **42 个 VC：37 个属于 test_rvv，5 个属于有真实 body 的 assert/VL helper**。`rvv_loop_checked.v` 用完整 `VC_Correct` 签名组合 27 个纯/安全/helper、10 个调用空间义务及 5 个资源义务。另有两条新的空段/未初始化数组策略证明。`rvv_chunk_checked.v` 独立检查四次 primitive 调用的 9 个 VC，便于定位组合问题。最后一次统一结果以 `loop-status.json` 的实际命令、退出码和文件哈希为准。

## 合同与证明边界

令 N=batch/4。前置为正的、4 字节对齐的 batch，合法非空指针，两个分别拥有 N+3 个元素的输入数组和 N 个可写输出元素；batch 上限与公开 wrapper 的 n 上限相容。后置保留两个输入数组，输出为共享 `vadd_values(N,A,B)`。允许全部 QCP fp32 值，包括 NaN、Inf 和正负零。

每轮把输入拆为已消费前缀、VL 元素的当前块和剩余后缀；load 保留当前块，store 只需要 VL 个目的 cell。回边利用 `RvvLoopMemory` 重组输入，并用 `RvvResultBridge` 和 `RvvLoopResult` 把 32 个字段计算的有效前缀拼成累计的 `vadd_values`。输入的额外三元素继续属于 frame，没有把最后一轮加强成需要 32 个可读或可写元素。

`primitive_contracts.h` 由 `generate_contracts.py` 从已经检查的 load/add/store 实际 C body 前逐字提取声明和合同。runner 首先核对 primitive package 的源哈希及 load100/add101/store75 的通过状态，再生成调用者目标。callee contract 与已有 body 证据绑定；该头文件本身不充当实现证明。

这是 QCP C 表示层的**部分正确性**结果。通用 lowering 正确性、终止性证明、真实指令 ISA 对应、公开 mapper 的完整接线及全局 kernel inventory 的验收仍是独立边界；本包不会自动将完整跨 ISA 等价计数改为完成。native primitive 的有限差分回归也不替代这些边界。

`RvvLayout` 的局部 struct 地址正规化使用 QCP 已有的 `eval_addr` 和 congruence 假设；`Print Assumptions` 还保留布局/地址参数及标准 Coq/Flocq 的经典实数和外延性假设。没有新增 axiom、Admitted 或 finite-only 前提。

## 可重放方法

需要本机已配置的 QCP 2.1.4、Coq 8.20.1、qcp-env，以及旧 workspace 的 `research/qcp-shim-vadd/results/coq-flags.json` 和已编译共享依赖。目前尚不是脱离该环境的独立发行包。

```sh
python3 verification/qcp/experiments/vadd-rvv/run.py --add --store
python3 verification/qcp/experiments/vadd-rvv/run_loop.py
```

后者先审查冻结来源，再重生成合同头、C 和预处理输入，重新执行 QCP/StrategyCheck，逐字核对三个审定 goal，顺序编译正式路径的所有证明模块以及独立 chunk9。`loop-logs/` 与 `loop-status.json` 保存实际结果；primitive 的 `status.json` 单独保留。

`FastFrame.v` 只证明空间资源的排列：把完整 assertion leaf 用 `remember` 暂时抽象，再用 sepcon 的交换、结合和单调性构造证明。它避免通用 entailer 展开约 96 个浮点 cell 的内部语义；没有改变资源、数值模型或 VC。

局部 struct 的一个前端限制已由 `loop-investigation/drop.c` / `keep.c` 复现：Assert 省略仍存活的 struct 资源会使后续 scope cleanup 崩溃。正式循环移除了这种后置 cut，保留真实局部变量直到正常退出作用域，再在 Coq 回边 VC 中完成数组重组。单独的最小复现不是 kernel 正确性证据。
