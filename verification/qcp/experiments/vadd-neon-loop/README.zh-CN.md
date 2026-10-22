# 原始 NEON 完整循环探索（未闭合）

稳定的首块 14 项 checkpoint 在相邻 `vadd-neon/`，本目录不改它的源码与证据。

这里以 `k=(batch@pre-batch)/4` 表示已处理长度；输入拥有原始地址上的 prefix 与当前地址上的剩余数组（包含 3 个 padding float）；输出拥有已完成的 `vadd_values(k,A,B)` prefix 和当前地址上的 undef 后缀。原始 kernel 的公共 pre/postcondition 没有改变，C body 只做既有 flat struct lowering 与 proof annotation。

`proofs/NeonLoopBridge.v` 中已编译的新增通用支持为 1-cell/2-cell 输出拆分以及合法 byte batch 的 `{0,4,8,12,>=16}` 分解。`neon_tail.strategies` 的三条规则均有 StrategyCheck + Coq 证明，处理 full undef 输出的 1/2-cell 拆分及 undef segment 的头单元访问。输入 fp32 域没有缩小。

仅重放这 6 个小检查项：

```sh
python verification/qcp/experiments/vadd-neon-loop/check.py
```

`coqc-result.json` 保存实际命令和 exit code。真实整核尝试使用 `attempt.py`（默认 120 秒预算）；原始源码与 lowering 哈希、命令及停止点在 `results/status.json`，stdout/stderr 原样保存。完整 kernel VC 尚未检查，因此无论 VC 生成进展如何，`full_kernel_proof` 始终为 false。

已知下一处困难：tail 的 bit-test 与 `batch/4` 长度界需要让前端明确关联；新增离散剩余长度 cases 可绕开前端不能推理的位运算关系，但会增加路径数。随后还需要解决 loop invariant 的初始化与维护、input prefix/suffix 合并、output prefix append，以及 tail lane 调用的逻辑值参数实例化。不要把符号执行推进或生成自动模板算作整核证明。

生成的自动 `.v` 文件由局部 `.gitignore` 隐藏；checked proofs 中没有 Admitted、新 axiom 或 Parameter。标准 QCP 布局、地址解释及 Coq/Flocq 假设保留在日志中。

最新固定状态为 `checkpoint-tail6.json`：新增 3 个通用/纯引理及 3 个策略全部 Coq 编译通过，整核 body VC 检查数仍为 0。离散长度 cases 让真实符号执行继续越过 2-cell tail store，最新停点为 `vst1_lane_f32` 的逻辑 `With z` 参数推断：`fp32_bits_equal(z, value)` 是不透明谓词，前端不能据此实例化 z，随后尝试 lane=1 分支而得到 0==1。后续可显式添加 `where(z=...)`，或为同一实际 body 证明消去该逻辑绑定的分支契约；不得通过删去 NaN 域或假定 callee 使它通过。

root 已另外完成 `experiments/vadd-relations/VaddSegments.v` 的 `vadd_values_length`、`vadd_values_split`、`vadd_values_nth`，可以用于下一阶段 Inv 初始化/维护和尾部模型拼接；本目录尚未将这些引理接入整核证明。
