# NEON 首个向量块的已检查内存桥

从 framework worktree 根目录重放：

```sh
python verification/qcp/experiments/vadd-neon/run.py
```

本 checkpoint 新增 14 个已检查项，全部使用独立 namespace `QcpNeon`，复用已检查的 `QcpVadd` intrinsic body，不修改原 kernel、公共 spec、mapper 或旧 48 项证据。

- 4 个通用引理：`float_full_open4`、`float_undef_open4`、`byte_batch_readable4`、`byte_batch_writable4`。前两者将任意合法数组的前 4 个输入/输出单元暴露，并保留后缀；后两者证明合法 byte batch 对应的读取 padding 和写入长度界。
- 4 个 StrategyCheck 义务：四 cell 输入拆分、四 undef cell 输出拆分、`float32x4_t` 与 `float32x2_t` 局部 struct 资源展开。
- 6 个真实 C body VC：`load_call` 调用已检查的 `vld1q_f32`；`load_local` 使用与原 kernel 相同的局部 struct 分配、取地址、调用后读取字段；`store_call` 调用已检查的 `vst1q_f32`。各有调用前件和返回后件两个 VC。

这些规格保留所有 QCP fp32 值，包括 NaN、无穷与正负零。数组长度是符号值，约束为调用确实需要的 `n >= 4`；没有以固定测试长度或 finite-only 域替代证明。`load_local` 的 Coq 证明使用 QCP `csimpl` 对齐局部变量与带类型指针的字段地址表达式，其标准地址解释/同余假设完整保留在 `results/load_call_checked.v.log`。

`run.py` 重新生成 StrategyCheck 义务和实际 C body 的 QCP VC，逐字核对 `proofs/` 中 reviewed goals，然后顺序编译五个 Coq 文件。`status.json` 保存命令、源码/日志哈希、证明范围和完整 kernel 的真实停止点。`checkpoint-14.json` 为本次首次成功状态的固定副本。自动生成的 proof 模板及编译产物由局部 `.gitignore` 隐藏；checked 实现不包含 `Admitted`、新 axiom 或 Parameter。

`attempt.py` 对真实原始 NEON body 运行现有表示 lowering，公共 kernel 契约保持原 demo 的 byte batch、3 个 padding float、分离内存及全 fp32 域。添加的算术 Assert cut 仅明确两个已独立证明的界。当前停止点已从首个 `vld1q_f32` 的四 cell 前件推进到循环 invariant 的覆盖问题，见 `results/kernel-result.json`。这表示新的块级和 struct 资源桥已能使用，并不表示完整循环或 tail 已证明。

后续整核工作需要显式维护已处理长度、输入 prefix/suffix 的合并、输出 prefix 的精确值，以及剩余长度为 1/2/3 时的 tail 组合。完整 kernel VC 集尚未生成，`full_kernel_proof` 明确为 false。后续循环实验应另建目录，保留此 checkpoint。
