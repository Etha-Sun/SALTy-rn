# 2026-09-28 证明性能与失败记录

这些是本次实现的诊断，不是对 Islaris 能力边界或论文新颖性的证明。

## 已确认有效的变化

- 共享 65536 位常量。`RvvCompactWiden`、`RvvCompactAdd`、`RvvCompactLoad` 的表示转换由 Coq 的相等性证明检查；正确性合同仍指向原 trace。
- 为向量更新保存受检查的等式，随后用逐 lane 定理恢复精确结果。`RvvAllUpdatesFast`、`RvvUpdateMath`、`RvvCacheRule` 已通过独立 coqchk。
- 将进程栈上限设为 256 MiB，解决实际发生的栈溢出。没有关闭 Coq 检查。
- 正常等待确实有用：整段条件性 kernel 的 Qed 约 1174 秒后成功，独立检查及其依赖约 3523 秒后成功。

## 加载的剩余工作

加载 trace 约 2.48 MB，包含 vl=0..8 的路径和每条路径中的整寄存器更新。底层寄存器类型是 bv 65536，当前硬件配置是 VLEN=256。按 vl 分开证明并不限制整个输入数组的长度；完整循环合同仍按任意输入列表长度归纳。

`RvvReadByteFast.v` 直接复用上游 `wp_read_mem_array`，给出某次单字节读取的精确值并保持原数组。它本身已经检查，但不等同于整个 vle8 指令合同。

`RvvLoadReadyCase1..8.v` 是不依赖动态 Load 的完整尝试：对固定的单次 vl、任意数据和满足范围前提的输入地址，证明原始指令 trace。`RvvLoadInlineCase0.v` 对应 vl=0。是否成功必须查同名 results/proof-*.json 及 STATUS.json，不能仅根据文件存在判断。

## 本次续接脚本的问题

早期为了在长策略结束后查看目标，再补最后的策略，使用了 Coq `Load` 续接一个已经打开的证明。这不是可靠的编译方式。最小复现是 `InspectLoadReplay.v`：首次执行最后几步可能成功并打印 Closed under the global context，但编译器随后会从原始目标重放 Load，遗漏此前的证明步骤并报错。普通文件也能复现，所以原因不只是 FIFO。

因此，`RvvLoadComputedCase0` 和 `RvvLoadOpaqueCase0` 即使日志有 No more goals / Closed，也没有成功的 .vo 结果，不计为已证明。后来的 Inline/Ready 文件把完整证明放在同一个 .v 中，避免这一续接问题。该问题属于本次证明驱动脚本，不能被当作 Sail 或 RVV 的研究缺口。

## 判断标准

1. 编译器完整退出且 exit_code=0；没有 Abort/Admitted 代替待证定理。
2. 结果记录的源码哈希与当前文件一致，.vo 存在。
3. 明确区分闭合的全局假设与定理自身的前提。Hload 尚未提供时，kernel 定理仍是条件性定理。
4. 独立 coqchk 是额外证据。它检查已经生成的证明对象，不会替尚未证明的 Hload 提供证明。

## 最后的加载诊断

- `RvvLoadFastSideCase1.v` 移除了不再使用的 65536 位向量上下文后，约 254.6 秒解决五个地址/数组下标条件，进入 Qed；完整成功与否仍以 results 和 STATUS 为准。
- `RvvLoadSideconds.v` 将相同种类的地址偏移和数组下标性质单独证明，已完整编译成功。尚未把它接入正在运行的旧进程。
- `RvvLoadReadProbeCase1.v` 的日志显示快捷读取规则走到 READ_FRAMED 后退出该策略，说明仅修改地址模式还不足够。
- `InspectReadByteAnonymous.v` 的简单上下文测试通过；增加额外寄存器资源的测试尚未通过。`RvvReadByteAnonymous`/`RvvReadByteSelected` 仅是策略实验，不能当成已经接通的 ISA 读取加速。下一步应显式选择和保持输入数组之外的 Iris 资源，并先通过额外资源保持测试，再重跑非零 vl 的原始 trace。
- `Load` 续接问题、快捷规则的资源处理，以及当前速度问题都不构成 ISA 程序不等价的反例。
