# f32-dwconv-minmax

本案验证三路输入、四通道打包权重的 FP32 depthwise convolution。完整验收只以 `proof/status.json` 的 `passed` 与 `whole_kernel_verified` 同为 `true` 为准；生成成功、单项证明或组件状态均不单独构成完整验收。完整门禁须重新生成当前实际 C 的目标及策略，并从源文件普通编译全部需要的 Coq 模块。

## 实现修复和原始反例

`proof/original/` 保存原件，`proof/originals.json` 记录身份。`proof/repair.patch` 可对原件以 GNU patch 零 fuzz 精确重放，原因和输出身份见 `proof/repair.json`。

原 RVV 对共享的固定四通道打包权重使用可变 VL 步长，既可能读取错误的权重，也可能让下一块起点错误。修复程序请求 `AVL=min(remaining_channels,4)`，每个 bias/k0/k1/k2 权重块固定前进四个 float。硬件模型仍为 **VLEN=128、SEW=32、LMUL=4、VLMAX=16**；这项修改没有把硬件 VLMAX 改成四，也没有限制 channels 必须为四的倍数。

ARM min/max 传播 NaN，RVV minimumNumber/maximumNumber 丢弃单个 NaN 操作数。修复 RVV 用原始向量比较、广播和 merge 恢复 accumulator、lower 和 upper 的 NaN。两侧外层 `do/--width` 改写为保持执行顺序的 `while`，用于 QCP 语法兼容；NEON 没有因此被标为数值错误。

三项实际原件反例分别覆盖 channels=1 的权重布局、NaN accumulator 和 NaN lower bound。`proof/original-counterexamples.json` 指向公开归档的原始输入、日志、退出码和零 fuzz patch receipt。这是历史记录的逐字归档，不是第二次执行，也不是原件证明成功。

## 算术与观察范围

全部 FP32 值均在范围内，包括 NaN、Inf、正负零及 subnormal；不要求 lower≤upper。保持 RNE 及原始计算顺序：

1. `FMA(i0,k0,bias)`；
2. 单独舍入 `MUL(i1,k1)`；
3. `FMA(i2,k2,acc0)`；
4. `ADD(acc0,product1)`；
5. 传播 NaN 的 lower MAX，再 upper MIN。

ARM 和 RVV 的值/NaN 定义分别建模。公开结果关系为数值相等或两者均为 NaN；不观察 NaN payload、异常标志、陷阱、时序或物理寄存器布局。环境配置与原始 intrinsic、精确 Coq 定义、官方来源及源码哈希逐项列于 `proof/semantics.json` 的 24 项 ledger。

这些 intrinsic 是对照官方资料审阅的规范边界，**最终人工审阅仍待完成，未机械证明其与 ISA 的形式对应**。它们不被冒称为已证明的 C implementation。普通 C helper、kernel、循环、内存和公开 caller 则必须具有实际 C 目标及完整 typed interface。

## 内存和程序范围

公开合同见 `spec.c`。channels 和 output_width 为正，保留完整 64 位参数表示、signed pointer-table stride、unsigned offset/advance、zero sentinel 的跳过偏移规则，以及实际有效内存条件。

输入、权重、zero 数据及只读 bounds 共用一个只读地址映射，允许重复或交叠的只读视图，不通过复制所有权排除 alias。输出以唯一拥有的地址集合及可更新状态表示，允许跨 pixel 重复写同一地址；最终结果采用实际顺序的最后一次写入。未写地址精确保留。公开 caller 的两侧输出具有合同中声明的各自所有权。

向量 store 的形式视图借用实际输入对象，保留输入字段并消费、返回唯一输出状态；没有把普通新 adapter body 冒充免证 intrinsic。旧直接按值 writable-map 目标中出现重复 owner 的诊断已隔离，不用于证明。合法 active VL 的输入/输出窗口均明确约束，inactive lane 不被假定为零。

## 证据和重放

完整 inventory 为 11 个实际 C 单元、487 个单元 VC 字段、15 个唯一普通 C 函数，以及 2 组共 9 项策略。单元字段计数包含调用等义务，不能解释成互不重复的语义性质，更不能计成多个 kernel。最终 source-fresh 门禁的实际模块、目标和退出记录以其状态文件为准。

`proof/component-unit-inventory.json` 提供源码、CPP、目标、typed provider 和组件 receipt 的精确映射。NEON 完整接口包含 283 个 C 字段，RVV 完整接口包含 151 个；两侧的统一完整验收仍须经过全案 runner。资源超限和被更短胜证替代的诊断保留原命令、源码、日志及终止记录，不将其误报为程序反例。

`proof/native-status.json` 和 `proof/native-public-status.json` 记录有限 native 检查。后者执行当前 `spec.c` 的公开 `equivalent`、两侧 kernel 和实际 comparator/reader 调用链，并 smoke 检查所有普通 helper。UBSan、ASan 各覆盖 18,720 cases、每侧 1,544,400 lanes；每进程实际限制为 16 GiB，ASan 使用 memory cgroup 且 swap=0。两个 kernel 同时输出相同错误的负控，仍被独立 packed4 scalar oracle 明确拒绝。有限检查不替代形式证明，也不建立 ISA 或编译器正确性。

本案保持 C-shim 模块化部分正确性边界；不额外宣称终止性或机器码端到端证明。继承的框架假设必须由完整 `Print Assumptions` 日志及证书白名单公开核对。


## 整核重放命令

```sh
python3 proof/build_full_handoff.py --prepare-only
python3 proof/record_status.py --preflight
# 所有组件完整成功且输入稳定后才冻结；pending组件会被拒绝。
python3 proof/build_full_handoff.py --freeze
python3 proof/check_full.py --config /path/to/coq-flags.json --jobs 32 --live-jobs 8
python3 proof/record_status.py --dry-run
python3 proof/record_status.py
python3 proof/audit_relocation.py --proof-run /path/to/completed-full-run
```

本案 runner 从源码编译完整本案依赖闭包及实际使用的两个共享数学模块
`QcpRvv32.FastFrame`、`NanBridge.BridgeLogic`，不复制组件对象或添加未使用的共享 C 信用。
完整接口与16份分片假设审计覆盖487 C字段、9策略字段及5项明确的完整输出观察、
未写内存保持和公开输出关系数学定理，共501报告。普通模块16GiB/2小时，重型32GiB/4小时，
长生成32GiB/6小时；配置32工作槽，实际并发受整机预算协调。
`--prepare-only` 和 `--preflight` 都只核对身份与证据，不能签发形式化通过；
独立 writer 只接受已完成的完整普通重放。迁移审计不计第二次形式化证明。
