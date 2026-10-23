# f32-vmin：NaN 传播修复

已按用户要求直接修复 `impl/testRVV.c`，复用此前 Frama-C 的同一份修复。
NEON 实现保持原样；RVV 原有 min/max 仍按 minimumNumber/maximumNumber 解释，另外检测 NaN 并用 mask/merge 恢复 NaN 输出。

[修复记录](proof/repair.json) 保存原始与修复 SHA256、历史来源和观察范围；[补丁](proof/repair.patch) 可在锁定原版上精确应用。
[原反例记录](proof/history/original-121-case-replay-status.json) 保留原先 121 个样本、44 个反例及输入/输出位，不改写历史。
[originals.json](proof/originals.json) 保留修复前的上游身份；当前 `impl/testRVV.c` 的身份以修复记录为准。

`spec.c` 实际调用两侧并比较“数值相等或双方均为 NaN”。修复没有排除 NaN、Inf、正负零或次正规数。
NaN payload/sign 和浮点异常 flags/traps 不在该观察中；新增无条件加法可能改变异常标志，不能宣称精确恢复 Arm 的全部位和状态行为。
固定配置及官方来源见 [semantics.json](proof/semantics.json)：LP64、小端、binary32，RVV VLEN=128/SEW=32/LMUL=8，RNE、渐进下溢。
输入各有 `n+3` 个可读 float，两份输出各有 `n` 个可写 float，所有对象分离。

重放命令（从仓库根目录）：

```sh
python3 verification/qcp/candidates/f32-vmin/proof/replay.py --variant original
python3 verification/qcp/candidates/f32-vmin/proof/replay.py --variant repaired
python3 verification/qcp/candidates/f32-vmin/proof/record_status.py
```

原版从锁定的 `kernels/target/` 复制到私有 `.build/` 后运行；修复版运行当前 `impl/`。
每次均校验原版身份、补丁零 fuzz 精确应用及修复 SHA。
独立 literal 位结果表包含 qNaN/sNaN、NaN 与无穷/零、双 NaN、正负零、有限数及次正规数，覆盖 11 个向量/尾部长度边界。
ASan/UBSan 同时检查输入、padding、参数和输出 frame，并检查错误输出会被比较器拒绝。
结果见 [status.json](proof/status.json) 和各 variant 的 replay 状态；派生编译日志与程序保留在本案 `.build/`。

这是 native C-shim 修复回归，**不是完整 QCP 证明或实际硬件执行**；本案不增加 verified 数量。
